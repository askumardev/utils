# Feature Name

Short description of the feature and its purpose.

---

## Table of Contents

- [Overview](#overview)
- [Tech Stack](#tech-stack)
- [Setup](#setup)
- [Implementation](#implementation)
- [Usage](#usage)
- [API / Events](#api--events)
- [Common Errors](#common-errors)
- [References](#references)

---

## Overview

Explain **what problem this feature solves** and **why it exists**.

Example:

> This feature enables real-time messaging using Action Cable.

---

## Tech Stack

- Ruby 3.x
- Rails 7.x
- PostgreSQL
- Redis (if applicable)
- Hotwire / Stimulus (if applicable)

---

## Setup

### 1. Prerequisites

Ensure the following are installed:

- Ruby
- Rails
- Database

### 2. Install Dependencies

```bash
bundle install
```

### 3. Configuration

Mention required configuration changes.

Example:

```ruby
config.action_cable.mount_path = '/cable'
```

---

## Implementation

### Step 1: Generate Files

```bash
rails generate channel Example
```

### Step 2: Update Code

```ruby
class ExampleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "example_channel"
  end
end
```

---

## Usage

Explain how the feature is used.

Example:

```ruby
ActionCable.server.broadcast("example_channel", { message: "Hello" })
```

---

## API / Events

| Name    | Type   | Description     |
| ------- | ------ | --------------- |
| message | String | Message content |

---

## Common Errors

### Error: Wrong number of arguments

**Cause:** Method signature mismatch

**Fix:** Ensure parameters match client calls

---

## References

- Rails Guides
- Internal project docs
