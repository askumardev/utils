# 🚀 ActiveRecord Complete Cheat Sheet (Rails)

A production-grade reference covering almost all real-world ActiveRecord query scenarios.

---

## 1. Basic CRUD

```ruby
User.create(name: "Satish", email: "satish@test.com")
User.all
User.first
User.last
User.find(1)
User.find_by(email: "satish@test.com")

user = User.find(1)
user.update(name: "Kumar")

user.destroy
User.delete(1)
```

---

## 2. Where Conditions

```ruby
User.where(name: "Satish")
User.where("age > ?", 25)
User.where(name: ["Satish", "Kumar"])
User.where.not(status: "inactive")
User.where(age: 20..30)
User.where(created_at: Time.zone.today.all_day)
```

---

## 3. Select & Pluck

```ruby
User.select(:id, :name)
User.pluck(:name)
User.pluck(:name, :email)
User.ids
```

---

## 4. Ordering

```ruby
User.order(:name)
User.order(created_at: :desc)
User.order("RANDOM()")
```

---

## 5. Limit & Offset

```ruby
User.limit(5)
User.offset(10)
User.limit(5).offset(10)
```

---

## 6. Joins

```ruby
User.joins(:posts)
User.left_joins(:posts)
User.joins("INNER JOIN posts ON posts.user_id = users.id")
```

---

## 7. Eager Loading

```ruby
User.includes(:posts)
User.includes(:posts).where(posts: { published: true })
User.preload(:posts)
User.eager_load(:posts)
```

---

## 8. Group & Having

```ruby
User.group(:role).count
User.group(:role).having("count(*) > 2")
```

---

## 9. Aggregations

```ruby
User.count
User.maximum(:age)
User.minimum(:age)
User.average(:age)
User.sum(:salary)
```

---

## 10. Scopes

```ruby
scope :active, -> { where(active: true) }

User.active
User.active.where(age: 25)
```

---

## 11. Chaining

```ruby
User.where(active: true)
    .where("age > ?", 25)
    .order(created_at: :desc)
    .limit(10)
```

---

## 12. Exists / Any / Empty

```ruby
User.exists?(1)
User.where(email: "test@test.com").exists?
User.any?
User.empty?
```

---

## 13. Batch Processing

```ruby
User.find_each(batch_size: 1000) do |user|
  puts user.name
end

User.find_in_batches do |batch|
  batch.each { |user| puts user.name }
end
```

---

## 14. Bulk Operations

```ruby
User.update_all(active: false)
User.where(active: false).delete_all
```

---

## 15. Distinct

```ruby
User.select(:role).distinct
```

---

## 16. OR Queries

```ruby
User.where(name: "Satish")
    .or(User.where(name: "Kumar"))
```

---

## 17. Raw SQL

```ruby
User.find_by_sql("SELECT * FROM users WHERE age > 25")
ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM users")
```

---

## 18. Transactions

```ruby
ActiveRecord::Base.transaction do
  user.save!
  profile.save!
end
```

---

## 19. Locking

```ruby
User.lock.find(1)
User.select("FOR UPDATE").find(1)
```

---

## 20. JSON Queries (PostgreSQL)

```ruby
User.where("data ->> 'city' = ?", "Bangalore")
User.where("data @> ?", { role: "admin" }.to_json)
```

---

## 21. Associations

```ruby
user.posts
post.user

User.joins(posts: :comments)
User.includes(posts: :comments)
```

---

## 22. Counter Queries

```ruby
User.joins(:posts).group("users.id").count
User.left_joins(:posts).group("users.id").count
```

---

## 23. CASE Statements

```ruby
User.select("\
  users.*,\
  CASE \
    WHEN age > 30 THEN 'Senior'\
    ELSE 'Junior'\
  END as level\
")
```

---

## 24. Subqueries

```ruby
User.where(id: Post.select(:user_id))
User.where("age > (?)", User.select("AVG(age)"))
```

---

## 25. Enum Queries

```ruby
enum status: { active: 0, inactive: 1 }

User.active
User.inactive
```

---

## 26. Reorder / Unscope

```ruby
User.order(:name).reorder(:created_at)
User.where(active: true).unscope(:where)
```

---

## 27. Merge

```ruby
User.joins(:posts).merge(Post.published)
```

---

## 28. Touch

```ruby
user.touch
```

---

## 29. Reload

```ruby
user.reload
```

---

## 30. Optimistic Locking

```ruby
# requires lock_version column
user.save
```

---

## 31. Arel (Advanced)

```ruby
users = User.arel_table
User.where(users[:age].gt(25))
```

---

## 🔥 Pro Tips

* Use `includes` to avoid N+1 queries
* Use `pluck` instead of `map`
* Use `find_each` for large datasets
* Avoid `update_all` if callbacks are required
* Add indexes for frequently queried columns
* Use `.explain` to debug slow queries

```ruby
User.where(age: 25).explain
```

---

# ✅ Next Steps

* SQL equivalents
* Performance tuning scenarios
* Real-world interview questions
