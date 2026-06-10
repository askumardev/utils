=========================================================
ROUND 1 — Coding & AI Assessment
=========================================================

SECTION A — Data Structures & Algorithms

1. Longest substring without repeating characters.
Follow-up:
- Time complexity?
- Can you optimize space?

2. Merge overlapping intervals.
Follow-up:
- How would you handle millions of intervals?

3. LRU Cache implementation.
Follow-up:
- Why HashMap + Doubly Linked List?

4. Find kth largest element.
Follow-up:
- Heap vs sorting trade-offs.

5. Design a rate limiter.
Follow-up:
- Fixed Window vs Sliding Window.

6. Detect cycle in linked list.
Follow-up:
- Why Floyd's algorithm?

7. Top K frequent elements.
Follow-up:
- Heap complexity.

8. Validate parentheses.
Follow-up:
- Stack implementation details.

9. Group anagrams efficiently.
Follow-up:
- Hashing strategy.

10. Producer-consumer problem.
Follow-up:
- Thread safety.


---------------------------------------------------------
SECTION B — Ruby / Rails Questions
---------------------------------------------------------

1. Difference between include, extend, prepend.

2. Explain ActiveRecord callbacks.
When should they be avoided?

3. N+1 query problem.
How do you detect and solve it?

4. Difference between:

belongs_to
has_one
has_many
has_many through

5. Explain eager loading:
- includes
- preload
- eager_load

6. Sidekiq retry mechanism.

7. What happens internally when a Rails request arrives?

8. Thread safety in Rails.

9. Transactions and rollback.

10. How would you implement authentication without Devise?


---------------------------------------------------------
SECTION C — Code Review Questions
---------------------------------------------------------

They may give code like:

- nested loops
- duplicated code
- callback abuse
- N+1 queries

Questions:

1. What's wrong with this code?
2. How would you refactor it?
3. How would you test it?
4. Complexity analysis?
5. Is it production ready?


---------------------------------------------------------
SECTION D — AI Assessment
---------------------------------------------------------

1. Which AI tools do you use daily?

Expected answer:
- ChatGPT
- Cursor
- Claude
- GitHub Copilot

2. How do you ensure AI-generated code is safe?

Expected:
- review output
- unit tests
- performance validation
- security checks

3. Give an example where AI improved productivity.

4. When should AI not be trusted?

5. Prompt engineering best practices.

6. How would you use AI for:

- code review
- documentation
- test generation
- bug fixing

7. Hallucination in LLMs.

8. RAG vs fine-tuning.

9. Embeddings vs vector databases.

10. How would you integrate AI into an existing application?


=========================================================
ROUND 2 — Architecture & AI Assessment
=========================================================

SECTION A — System Design Questions

1. Design Spotify.

Focus:
- song metadata
- streaming
- CDN
- caching
- search

2. Design an Inventory Management System.

Focus:
- stock consistency
- warehouse separation
- event-driven updates

3. Design Order Management System.

Focus:
- order lifecycle
- payment flow
- retries

4. Design Product + Rating system with 50M records.

Focus:
- partitioning
- indexing
- denormalization

5. Design Notification Service.

Focus:
- email
- SMS
- push notifications

6. Design URL Shortener.

Focus:
- hash generation
- scalability

7. Design Chat Application.

Focus:
- WebSockets
- Redis
- message persistence

8. Design Search System.

Focus:
- Elasticsearch
- indexing
- ranking

9. Design Payment System.

Focus:
- idempotency
- retries
- audit logs

10. Design File Upload System.


---------------------------------------------------------
SECTION B — Staff-Level Tradeoff Questions
---------------------------------------------------------

1. Modular Monolith vs Microservices.

2. PostgreSQL vs MongoDB.

3. Redis cache vs database.

4. Synchronous vs asynchronous processing.

5. Event-driven architecture vs direct API calls.

6. Sidekiq vs Kafka.

7. Strong consistency vs eventual consistency.

8. SQL joins vs denormalization.

9. Sharding vs read replicas.

10. REST vs GraphQL.


---------------------------------------------------------
SECTION C — Reliability Questions
---------------------------------------------------------

1. Service is slow. How do you debug?

2. Database CPU is 100%.

3. Redis is down.

4. Kafka messages are duplicated.

5. Sidekiq queue backlog grows.

6. API latency increased.

7. One microservice is unavailable.

8. Cache stampede problem.

9. Prevent duplicate payments.

10. Handle traffic spike 10×.


---------------------------------------------------------
SECTION D — AI + Architecture Questions
---------------------------------------------------------

1. Design an AI-powered document search system.

Expected:
- embeddings
- vector DB
- RAG

2. Add AI chatbot to existing SaaS.

3. Build semantic search.

4. LLM vs traditional search.

5. How would you store embeddings?

6. Pinecone vs PostgreSQL pgvector.

7. Prompt caching strategies.

8. Token cost optimization.

9. Hallucination mitigation.

10. AI security concerns.


---------------------------------------------------------
SECTION E — Design Patterns
---------------------------------------------------------

1. Strategy pattern.
2. Factory pattern.
3. Observer pattern.
4. Decorator pattern.
5. Repository pattern.
6. Service object pattern.
7. Dependency injection.
8. Circuit breaker.
9. Saga pattern.
10. CQRS.


=========================================================
FINAL ROUND — Hiring Manager Discussion
=========================================================

SECTION A — Experience Questions

1. Tell me about yourself.

2. What project are you most proud of?

3. Biggest production issue you've handled?

4. Describe a difficult bug.

5. Describe a system you designed from scratch.

6. What metrics did you improve?

7. Describe your role as a senior engineer.

8. Explain a challenging migration.

9. Explain a scaling problem you solved.

10. Explain a technical decision you regret.


---------------------------------------------------------
SECTION B — Leadership Questions
---------------------------------------------------------

1. Tell me about a disagreement with another engineer.

2. How do you mentor juniors?

3. How do you perform code reviews?

4. How do you handle underperforming teammates?

5. Have you influenced architecture without authority?

6. Tell me about cross-team collaboration.

7. How do you prioritize work?

8. Describe a time when requirements changed suddenly.

9. How do you manage technical debt?

10. How do you balance speed vs quality?


---------------------------------------------------------
SECTION C — Behavioral Questions
---------------------------------------------------------

1. Failure you're proud of.
2. Tough feedback you received.
3. Conflict with manager.
4. Handling ambiguity.
5. Managing deadlines.
6. Stress management.
7. Biggest achievement.
8. Why Procore?
9. Why leaving current company?
10. Where do you see yourself in 5 years?


=========================================================
VERY HIGH PROBABILITY STAFF QUESTIONS
=========================================================

1. Design Inventory System.
2. Modular Monolith vs Microservices.
3. Event-driven architecture.
4. Cache invalidation strategy.
5. Database partitioning.
6. Sidekiq scaling.
7. Idempotency.
8. Rate limiting.
9. AI usage in development.
10. Production incident handling.
11. Mentoring engineers.
12. Technical trade-offs.
13. System observability.
14. PostgreSQL optimization.
15. Handling 50M+ records.
