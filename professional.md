# Markdown Cheat Sheet

This file demonstrates various Markdown formats supported by GitHub.

---

# 1. Headings

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

---

# 2. Text Formatting

**Bold Text**

*Italic Text*

***Bold and Italic***

~~Strikethrough~~

`Inline Code`

---

# 3. Blockquotes

> This is a blockquote.
>
> It can span multiple lines.

---

# 4. Lists

## Unordered List

- Item 1
- Item 2
- Item 3

## Ordered List

1. First item
2. Second item
3. Third item

## Nested List

- Item A
  - Sub Item A1
  - Sub Item A2

---

# 5. Task Lists

- [x] Completed task
- [ ] Pending task
- [ ] Another task

---

# 6. Links

[Open GitHub](https://github.com)

---

# 7. Images

![Sample Image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtzBRjLzFg_WYO2DA-J2KWCt2U54-1wXlptQ&s)

---

# 8. Tables

| Name | Role | Experience |
|-----|-----|-----|
| Satish | Rails Developer | 6+ years |
| John | Backend Developer | 5 years |

---

10. Horizontal Line
---
11. Collapsible Section (GitHub Feature)
<details> <summary>Click to expand</summary>

Hidden content inside collapsible section.

You can add:

Lists

Code

Text

</details>


---

12. Emoji

:rocket: :sparkles: :warning: :bug:
---
13. Highlighted Notes

⚠️ Important: Always review pull requests carefully.


---
14. Keyboard Keys

Press Ctrl + Shift + P in VS Code.

---



15. Inline HTML (Supported in GitHub)
<div style="color:blue"> This text is styled using HTML. </div>

---



16. Anchors (Internal Links)

# 📚 Table of Contents

- [Core Commands](#core-commands)
- [Headings](# 1. Headings)
- [Tables](# 8. Tables)

---
17. Diagram Style (Simple)
User
  │
  ▼
Controller
  │
  ▼
Service
  │
  ▼
Database

---

18. Badges

---
19. Boxes
1. Note Box
> [!NOTE]
> This is a note explaining something important.

---
2. Tip Box
> [!TIP]
> Use `bundle exec` when running Ruby commands.
---

3. Important Box
> [!IMPORTANT]
> Always run database migrations after pulling new code.

---
4. Warning Box
> [!WARNING]
> This command will reset the database and delete all data.
---

5. Caution Box
> [!CAUTION]
> Do not commit secrets or API keys to the repository.
---
6. Alert With Multiple Lines
> [!NOTE]
> Make sure you install dependencies first.
>
> Run:
>
> ```bash
> bundle install
> ```
---

7. Alert With List
> [!TIP]
> Useful commands:
> - `rails server`
> - `rails console`
> - `rails db:migrate`
---

8. Example Used in Documentation
## Installation

> [!IMPORTANT]
> Ensure Ruby 3+ is installed before starting.

Clone repository:

```bash
git clone https://github.com/example/project.git

