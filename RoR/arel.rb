What is Arel (in simple terms)?

Arel = SQL AST builder used internally by Rails

It builds SQL using Ruby objects instead of strings
ActiveRecord sits on top of Arel

👉 Think of it like:

ActiveRecord  →  Arel  →  SQL  →  Database
🔷 Why does Arel exist?

Because writing SQL as strings is:

❌ error-prone
❌ hard to compose dynamically
❌ not reusable

Arel solves this by giving you:

composable queries
safe query building
database abstraction
🔷 Core Idea (VERY IMPORTANT)

Instead of writing:

SELECT * FROM customers WHERE country = 'India';

You build it like:

customers = Arel::Table.new(:customers)

query = customers
  .project(Arel.star)
  .where(customers[:country].eq('India'))

query.to_sql

👉 Output:

SELECT * FROM customers WHERE customers.country = 'India'
🔷 Arel Building Blocks
1️⃣ Table
customers = Arel::Table.new(:customers)

This represents:

customers
2️⃣ Columns
customers[:country]

👉 becomes:

customers.country
3️⃣ Conditions
customers[:country].eq('India')

👉 becomes:

customers.country = 'India'

Other operators:

.eq(value)
.not_eq(value)
.gt(value)
.lt(value)
.gteq(value)
.lteq(value)
.matches('%abc%')   # LIKE
.in([1,2,3])
4️⃣ SELECT (project)
customers.project(Arel.star)

👉

SELECT *
5️⃣ WHERE
customers.where(customers[:country].eq('India'))
6️⃣ ORDER
customers.order(customers[:name].asc)
7️⃣ LIMIT
customers.take(5)
🔷 Example: Full Query
customers = Arel::Table.new(:customers)

query = customers
  .project(customers[:FirstName], customers[:Country])
  .where(customers[:Country].eq('USA'))
  .order(customers[:FirstName].asc)
  .take(10)

puts query.to_sql

👉 SQL:

SELECT FirstName, Country
FROM customers
WHERE Country = 'USA'
ORDER BY FirstName ASC
LIMIT 10
🔷 Joins in Arel
customers = Arel::Table.new(:customers)
invoices  = Arel::Table.new(:invoices)

query = customers
  .join(invoices)
  .on(customers[:CustomerId].eq(invoices[:CustomerId]))
  .project(customers[:FirstName], invoices[:Total])

👉 SQL:

SELECT customers.FirstName, invoices.Total
FROM customers
JOIN invoices
ON customers.CustomerId = invoices.CustomerId
🔷 Aggregations
invoices = Arel::Table.new(:invoices)

query = invoices
  .project(
    invoices[:CustomerId],
    invoices[:Total].sum.as('total_spent')
  )
  .group(invoices[:CustomerId])
🔷 Subqueries
invoices = Arel::Table.new(:invoices)

subquery = invoices
  .project(invoices[:CustomerId])
  .where(invoices[:Total].gt(100))

customers = Arel::Table.new(:customers)

query = customers
  .where(customers[:CustomerId].in(subquery))
🔷 When SHOULD you use Arel?

✅ Dynamic query building
✅ Complex conditions (programmatic)
✅ Reusable query fragments
✅ When ActiveRecord is limiting

🔴 When NOT to use Arel

❌ Simple CRUD → use ActiveRecord
❌ Complex analytics → use raw SQL
❌ Team readability matters → avoid Arel

🔥 Real-World Truth (important)

Most senior Rails devs:

Use ActiveRecord (80%)
Use Raw SQL (15%)
Use Arel (5%)

👉 Arel is powerful but not very readable

💡 Interview Answer (you can use this)

“Arel is the SQL AST manager used by ActiveRecord. It allows building complex and dynamic SQL queries programmatically.
While I mainly use ActiveRecord, I leverage Arel when I need fine-grained control over query generation without resorting fully to raw SQL.”
