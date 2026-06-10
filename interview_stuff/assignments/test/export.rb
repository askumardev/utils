require 'csv'

class StudentExport

  attr_reader :connection, :students_ids

  def initialize(students_ids)
    @connection = ActiveRecord::Base.connection
    @students_ids = students_ids
  end

  def export
    @programs = Lumerit::Program.all
    @statuses ||= group_by_student_id(statuses_query)
    @coaches ||= group_by_student_id(coaches_query)
    @enrollments ||= group_by_student_id(enrollments_query)
    @student_employers ||= employers_query

    CSV.generate do |csv|
      set_headers(csv)
      set_fields(csv)
    end
  end

  private

  def set_headers(csv)
    export_headers = student_headers
    @programs.each do |program|
      program_headers(program).each { |h| export_headers.push(h) }
    end
    csv << export_headers
  end

 #  def fetch_data(table_name, column_name)
 #  	batch_size, offset = 1000, 0
	#   begin
	#     batch = ActiveRecord::Base.connection.select_all <<-SQL
	#       SELECT id, #{column_name}
	#       FROM #{table_name}
	#       WHERE #{column_name} LIKE '---%'
	#       LIMIT #{batch_size} 
	#       OFFSET #{offset}
	#     SQL
	#     batch.each do |row|
	#       yield row
	#     end
	#     offset += batch_size
	#   end until batch.empty?
	# end

  def set_fields(csv)
  	batch_size, offset = 10000, 0
    begin
	    batch = @connection.select_all <<-SQL

	      SELECT students.id,
                students.uid,
                students.first_name,
                students.middle_name,
                students.last_name,
                students.gender,
                students.email,
                students.address_1,
                students.address_2,
                students.city,
                students.state,
                students.country,
                students.zipcode,
                students.taf,
                students.birthday,
                students.t_shirt_size,
                students.product,
                students.cohort_date,
                students.group_coaching
       FROM students
       WHERE students.id IN (#{students_ids.join(', ')})
       ORDER BY students.last_name ASC
      ).group_by { |student| student['id'] }
	      LIMIT #{batch_size} 
	      OFFSET #{offset}
	    SQL
	    batch.each do |student_id, student|
	    	@student_fields = add_student_information(student.first, student_degrees(student_id))
      	add_student_employer(student_id)
      	set_program_fields(student_id)
	      csv << @student_fields
	    end
	    offset += batch_size
  	end until batch.empty?


    # students_query.each do |student_id, student|

    #   @student_fields = add_student_information(student.first, student_degrees(student_id))
    #   add_student_employer(student_id)
    #   set_program_fields(student_id)

    #   csv << @student_fields
    # end
  end


def student_headers
    [
     "Student_ID", "UID", "First_Name", "Middle_Name", "Last_Name", "Gender",
     "Email", "Address1", "Address2", "City", "State", "Country", "Zip_Code",
     "TAF", "DOB", "T-Shirt_Size", "Product", "Desired_Degree",
     "Cohort_Start_Date", "Group_Coaching", "Employer_Name", "Employee_Id"
    ]
  end
  

  def program_headers(program)
    [
     "#{program.name}_Enrollment_Enrolled_Date", "#{program.name}_Enrollment_Start_Date",
     "#{program.name}_Enrollment_End_Date", "#{program.name}_Status",
     "#{program.name}_Substatus", "#{program.name}_Coach",
     "#{program.name}_Coach_Email",
    ]
  end

  def student_degrees(student_id)
    enrollments = enrollment_degrees_query.fetch(student_id, [])
    get_degrees(enrollments).present? ? get_degrees(enrollments).join(', ') : "None"
  end

  def set_program_fields(student_id)
    @programs.each do |program|
      add_specific_student_info(@enrollments, program.id, student_id, ['created_at', 'start_date', 'end_date'])
      add_specific_student_info(@statuses, program.id, student_id, ['status_name', 'substatus_name'])
      add_specific_student_info(@coaches, program.id, student_id, ['user_name', 'user_email'])
    end
  end

  def add_student_information(student, degrees)
    [
     student['id'], student['uid'], student['first_name'], student['middle_name'],
     student['last_name'], student['gender'], student['email'],
     student['address_1'], student['address_2'], student['city'],
     student['state'], student['country'], student['zipcode'],
     student['taf'], (student['birthday'].present? ? student['birthday'].to_date.to_s(:pretty) : ""),
     student['t_shirt_size'],
     student['product'], degrees,
     (student['cohort_date'].present? ? student['cohort_date'].to_date.to_s(:pretty) : "None"),
     (student['group_coaching'] == 't' ? 'true' : 'false'),
    ]
  end

  def add_specific_student_info(object_hash, program_id, student_id, fields)
    if object = object_hash[program_id]&.find { |o| o['student_id'] == student_id }
      fields.each do |field|
        if field =~ /date/ || field =~ /_at/
          @student_fields.push(object[field].to_date.to_s(:pretty))
        else
          @student_fields.push(object[field])
        end
      end
    else
      fields.length.times do |i|
        @student_fields.push('')
      end
    end
  end

  def add_student_employer(student_id)
    if @student_employers.fetch(student_id, []).present?
      student_employer = @student_employers.fetch(student_id).first
      @student_fields.push(student_employer['name'], student_employer['employee_id'])
    else
      @student_fields.push('', '')
    end
  end

  def get_degrees(enrollments)
    enrollments.each_with_object([]) do |enrollment, array|
      unless enrollment['degree_choice'] == 'nil'
        array.push(enrollment['degree_choice'])
      end
    end
  end

  def group_by_student_id(query_hash)
    Lumerit::Program.ids.each_with_object(query_hash) do |program_id, hash|
      if hash[program_id.to_s].present?
        hash[program_id] = hash[program_id.to_s].group_by { |object| object['student_id'] }
      end
    end
  end

  def students_query
    @students_query ||=
      connection.exec_query(
        "SELECT ROW_NUMBER() OVER (PARTITION BY students.id ORDER BY students.id ) row_num,
                students.id,
                students.uid,
                students.first_name,
                students.middle_name,
                students.last_name,
                students.gender,
                students.email,
                students.address_1,
                students.address_2,
                students.city,
                students.state,
                students.country,
                students.zipcode,
                students.taf,
                students.birthday,
                students.t_shirt_size,
                students.product,
                students.cohort_date,
                students.group_coaching
         FROM students
         WHERE students.id IN (#{students_ids.join(', ')})
         and row_num IN (1,10000)
         ORDER BY students.last_name ASC"
      ).group_by { |student| student['id'] }
  end

  def coaches_query
    connection.exec_query(
      "SELECT coach_assignments.id,
              coach_assignments.student_id,
              coach_assignments.program_id,
              coach_assignments.start_date,
              coaches.user_id,
              users.name AS user_name,
              users.email AS user_email
       FROM coach_assignments
       INNER JOIN coaches ON coaches.id = coach_assignments.coach_id
       INNER JOIN users ON users.id = coaches.user_id
       WHERE coach_assignments.student_id IN (#{students_ids.join(', ')})
       ORDER BY coach_assignments.start_date DESC"
    ).group_by { |coaches| coaches['program_id'] }
  end

  def statuses_query
    connection.exec_query(
      "SELECT student_statuses.id,
              student_statuses.student_id,
              student_statuses.program_id,
              statuses.name AS status_name,
              substatuses.name AS substatus_name
       FROM student_statuses
       INNER JOIN statuses ON statuses.id = student_statuses.status_id
       INNER JOIN substatuses ON substatuses.id = student_statuses.substatus_id
       WHERE student_statuses.student_id IN (#{students_ids.join(', ')})
       ORDER BY student_statuses.student_id"
    ).group_by { |student_status| student_status['program_id']}
  end

  def enrollments_query
    connection.exec_query(
      "SELECT enrollments.student_id,
              MIN(enrollments.created_at) AS created_at,
              MIN(enrollments.start_date) AS start_date,
              MAX(enrollments.end_date) AS end_date,
              enrollments.program_id
       FROM enrollments
       WHERE enrollments.student_id IN (#{students_ids.join(', ')})
       AND enrollments.disenrolled IS FALSE
       AND enrollments.hold IS FALSE
       GROUP BY enrollments.program_id, enrollments.student_id"
    ).group_by { |enrollment| enrollment['program_id'] }
  end

  def enrollment_degrees_query
    @degrees_query ||=
      connection.exec_query(
        "SELECT enrollments.id,
                enrollments.student_id,
                enrollments.degree_choice
         FROM enrollments
         WHERE enrollments.student_id IN (#{students_ids.join(', ')})"
      ).group_by { |enrollment| enrollment['student_id'] }
  end

  def employers_query
    @employer_query ||=
    connection.exec_query(
      "SELECT student_employers.employer_id,
              student_employers.employee_id,
              student_employers.student_id,
              employers.name AS name
       FROM student_employers
       LEFT JOIN employers ON employers.id = student_employers.employer_id
       WHERE student_employers.student_id IN (#{students_ids.join(', ')})"
    ).group_by { |student_employer| student_employer['student_id'] }
  end

end