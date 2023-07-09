# File.foreach( '/home/satish/assignment/dictionary.txt' ) do |line|
#   puts line
# end
require 'action_view'
include ActionView::Helpers::NumberHelper
hash={2 => "abc",3 => "def",4 => "ghi",5 => "jkl",6 => "mno",7 => "pqrs",8 => "tuv",9 => "wxyz"}

arr = IO.readlines('dictionary.txt').to_a
puts arr

puts "Enter number:: "
mob = gets.chomp
puts number_to_phone(mob)
#puts arr.map {|x| x.chomp }
