* rails routes --expanded
Post.order("data->'hello' DESC") 
Record.where("data ->> 'status' = 200 ")

# Given a Task model with 'details' json column
Task.where("details->>'key' = ?", "value") # matches where 'details' contains "key":"value"
Task.where("details->>'{a,b}' = ?", "value") # matches where 'details' contains "a":{"b":"value"}
Task.where("details->'a'->>'b' = ?", "value") # same as above, but via operator chaining
-> returns JSON, whereas ->> returns text. Note that the key(s) must be passed with single quotes.