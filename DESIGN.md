# Design system (master styleguide)

This document is the **authoritative creative reference** for **user-facing work** in this workspace—anything a visitor or end user sees or interacts with (UI markup, styling, typography, imagery, motion, and user-visible copy). Use it as the default guide when making creative decisions in those code paths.

## How to use this file

1. **Before** implementing or changing user-facing behavior or presentation, **read the relevant sections here** and align new work with established principles and patterns.
2. **Project-specific detail** may live alongside code (for example, per-project `DESIGN.md`, `style-guide.json`, or CSS variables). When both exist, treat **this file** as workspace-wide intent; treat **project-local** docs as the drill-down for that product’s tokens and components.
3. When you introduce a **new** visual or interaction pattern that should repeat, **update this file** (or the project’s local design doc) so future changes stay intentional—not every one-off tweak, but any **reusable principle or pattern**.

## Brand and surfaces (workspace defaults)

- Prefer **calm hierarchy**: neutrals and spacing carry structure; accent color and motion earn attention through restraint.
- **Consistency over novelty**: reuse existing tokens, components, and patterns before inventing parallel systems.

## Typography and layout

- Preserve **clear hierarchy** with type scale and weight; avoid solving hierarchy with extra colors alone.
- Respect **comfortable line length** and predictable rhythm (spacing scale, grid, container width) as defined in project CSS.

## Motion and interaction

- Motion should be **purposeful and short**; respect **`prefers-reduced-motion`** where animation exists.
- Interactive controls need **visible focus** and predictable feedback.

## Accessibility and quality

- Semantic structure, meaningful **alt text** for informative images, and **sufficient contrast** for text and essential UI.
- Prefer **optimized assets** (appropriate formats and weight for the context).

## When design changes

- Update **implementation** (CSS, components) first, then **tokens or local guides** if roles or variables changed, then **this document** (or the project design doc) when the **rule or pattern**—not only a single instance—changes.
