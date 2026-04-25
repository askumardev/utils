Chinook → ActiveRecord

⚠️ Assumption: You’ve defined associations like:

class Customer < ApplicationRecord
  has_many :invoices
end

class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items
end

class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :track
end

class Track < ApplicationRecord
  belongs_to :genre
end

class Genre < ApplicationRecord
  has_many :tracks
end
1️⃣ Top customer per country

👉 ActiveRecord doesn’t handle window functions cleanly → use raw SQL

Customer.find_by_sql(<<-SQL)
  WITH customer_spending AS (
    SELECT c."CustomerId", c."FirstName", c."LastName", c."Country",
           SUM(i."Total") AS total_spent
    FROM customers c
    JOIN invoices i ON c."CustomerId" = i."CustomerId"
    GROUP BY c."CustomerId"
  ),
  ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY "Country" ORDER BY total_spent DESC) AS rnk
    FROM customer_spending
  )
  SELECT *
  FROM ranked
  WHERE rnk = 1;
SQL

💡 Interview tip: Say “I’d use raw SQL for window functions for clarity and performance.”

2️⃣ Monthly sales trend
Invoice
  .select("strftime('%Y-%m', InvoiceDate) AS month, SUM(Total) AS monthly_sales")
  .group("month")
  .order("month")
3️⃣ Customers who bought Rock but NOT Jazz
rock_customers = Customer
  .joins(invoices: { invoice_items: { track: :genre } })
  .where(genres: { Name: 'Rock' })

jazz_customers = Customer
  .joins(invoices: { invoice_items: { track: :genre } })
  .where(genres: { Name: 'Jazz' })

Customer
  .where(id: rock_customers.select(:id))
  .where.not(id: jazz_customers.select(:id))
  .distinct

💡 You could also optimize using EXISTS if needed.
======================================================================
🔷 Sakila → ActiveRecord

⚠️ Assumed associations:

class Actor < ApplicationRecord
  has_many :film_actors
  has_many :films, through: :film_actors
end

class Film < ApplicationRecord
  has_many :film_categories
  has_many :categories, through: :film_categories
end

class Customer < ApplicationRecord
  has_many :rentals
end

class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory
end

class Payment < ApplicationRecord
  belongs_to :rental
end
4️⃣ Actors with more than 10 films
Actor
  .joins(:film_actors)
  .group('actors.id')
  .having('COUNT(film_actors.film_id) > 10')
  .select('actors.*, COUNT(film_actors.film_id) AS film_count')
5️⃣ Most profitable category
Category
  .joins(film_categories: { film: { inventories: { rentals: :payments } } })
  .group('categories.id')
  .select('categories.*, SUM(payments.amount) AS revenue')
  .order('revenue DESC')
  .limit(1)

💡 This depends on having:

Film has_many :inventories
Inventory has_many :rentals
Rental has_many :payments
6️⃣ Customers rented in last 30 days but NOT before
recent_customers = Customer
  .joins(:rentals)
  .where('rentals.rental_date >= ?', 30.days.ago)

old_customers = Customer
  .joins(:rentals)
  .where('rentals.rental_date < ?', 30.days.ago)

Customer
  .where(id: recent_customers.select(:id))
  .where.not(id: old_customers.select(:id))
  .distinct
