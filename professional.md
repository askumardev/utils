# Markdown Cheat Sheet

This file demonstrates various Markdown formats supported by GitHub.

---

# 📚 Table of Contents

- [1. Headings](#1-headings)
- [2. Text Formatting](#2-text-formatting)
- [3. Blockquotes](#3-blockquotes)
- [4. Lists](#4-lists)
- [5. Task Lists](#5-task-lists)
- [6. Links](#6-links)
- [7. Images](#7-images)
- [8. Tables](#8-tables)
- [9. Horizontal Line](#9-horizontal-line)
- [10. Collapsible Section](#10-collapsible-section-github-feature)
- [11. Emoji](#11-emoji)
- [12. Highlighted Notes](#12-highlighted-notes)
- [13. Keyboard Keys](#13-keyboard-keys)
- [14. Inline HTML](#14-inline-html-supported-in-github)
- [15. Anchors](#15-anchors-internal-links)
- [16. Diagram Style](#16-diagram-style-simple)
- [17. Badges](#17-badges)
- [18. Boxes / Alerts](#18-boxes)

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

# 9. Horizontal Line

---

# 10. Collapsible Section (GitHub Feature)

<details>
<summary>Click to expand</summary>

Hidden content inside collapsible section.

You can add:

- Lists
- Code
- Text

</details>

---

# 11. Emoji

:rocket: :sparkles: :warning: :bug:

---

# 12. Highlighted Notes

⚠️ **Important:** Always review pull requests carefully.

---

# 13. Keyboard Keys

Press `Ctrl + Shift + P` in VS Code.

---

# 14. Inline HTML (Supported in GitHub)

<div style="color:blue">
This text is styled using HTML.
</div>

---

# 15. Anchors (Internal Links)

Example internal link:

[Go to Tables Section](#8-tables)

---

# 16. Diagram Style (Simple)


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

# 17. Badges

![License](https://img.shields.io/badge/license-MIT-blue)
![Version](https://img.shields.io/badge/version-1.0-green)
![Ruby](https://img.shields.io/badge/ruby-3.2-red)
![Rails](https://img.shields.io/badge/rails-7-red)
![Build](https://img.shields.io/badge/build-passing-brightgreen)

---

# 18. Boxes

## Note Box

> [!NOTE]
> This is a note explaining something important.

---

## Tip Box

> [!TIP]
> Use `bundle exec` when running Ruby commands.

---

## Important Box

> [!IMPORTANT]
> Always run database migrations after pulling new code.

---

## Warning Box

> [!WARNING]
> This command will reset the database and delete all data.

---

## Caution Box

> [!CAUTION]
> Do not commit secrets or API keys to the repository.

---

## Alert With Multiple Lines

> [!NOTE]
> Make sure you install dependencies first.
>
> Run:
>
> ```bash
> bundle install
> ```

---

## Alert With List

> [!TIP]
> Useful commands:
> - `rails server`
> - `rails console`
> - `rails db:migrate`

---

## Example Used in Documentation

## Installation

> [!IMPORTANT]
> Ensure Ruby 3+ is installed before starting.

Clone repository:

```bash
git clone https://github.com/example/project.git
```
---

# Key Improvements I Made

1. Added a **working Table of Contents**
2. Fixed **internal anchor links**
3. Ensured **GitHub-compatible heading anchors**
4. Structured sections cleanly
5. Added a **link example for internal navigation**

---

💡 **Pro Tip (Very Useful)**  
If your markdown grows large, you can add a **Back to Top button** after every section:

```markdown
[⬆ Back to Top](#markdown-cheat-sheet)