# Meta learnings (architectural and design decisions)

This file captures **generalizable learnings** about how the project owner steers **architecture, design, and process**—preferences that should apply across sessions, not one-off task notes.

## How to use this file

- **Agent**: At the **start of each new request** in this workspace, **read this file**, prioritize **the most recent entries**, and treat **newer learnings as authoritative** when they conflict with older ones. If an older entry is fully superseded, **remove or rewrite** it so this document does not contradict itself.
- **Human**: Append a dated entry when you notice a stable preference worth preserving (for example, tolerance for abstraction, validation boundaries, or how you like options presented before implementation).

## Log (newest first)

<!-- Template:
### YYYY-MM-DD — short title
- Learning: …
- Scope: … (e.g. all UI / TypeScript only / process)
-->

### 2026-05-07 — Agent terminal permissions
- **Learning:** Reduce repeated permission prompts: prefer **`required_permissions: ["all"]`** on integrated terminal/shell tool calls when the command needs broad access (network, git, system paths, etc.), instead of splitting across narrower permission classes. For **Cursor IDE** itself, the user prefers configuring **Agents → Auto-run** (e.g. **Run Everything**) and/or **`~/.cursor/permissions.json`** per [permissions.json reference](https://cursor.com/docs/reference/permissions)—the agent cannot disable IDE approval UI from chat.
- **Scope:** Process / Cursor agent usage

<!-- Template:
### YYYY-MM-DD — short title
- Learning: …
- Scope: … (e.g. all UI / TypeScript only / process)
-->
