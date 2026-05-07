# Design system (master styleguide)

This document is the **authoritative creative reference** for user-facing work on this site (HTML, CSS, imagery treatment, motion, copy tone in UI). When implementing or changing anything a visitor sees, **read and align with this file first**, then cross-check tokens in `style-guide.json` and implementation in `styles.css`.

## Source of truth (stacked)

1. **DESIGN.md** — principles, patterns, and decisions that tokens alone cannot encode.
2. **`style-guide.json`** — named tokens, roles, and usage notes (keep in sync when you add or change variables in CSS).
3. **`styles.css`** — `:root` custom properties and component styles are the runtime truth; prefer existing variables and classes before inventing new ones.

## Brand and surfaces

- **Primary brand** is the purple scale (`--purple` through `--purple-darker`). Use the documented hover/deep stops for gradients and interactive states rather than ad hoc purples.
- **Neutrals** (`--bg`, `--bg-soft`, `--bg-grey`, text steps, borders) define hierarchy. Default to high contrast and calm surfaces; reserve strong purple for emphasis, actions, and brand moments.
- **Reference layout** for the current homepage hero standard: `index-hero-v2.html` (per `style-guide.json`).

## Typography

- **Primary typeface**: Halyard Display (Adobe Fonts / Typekit as wired in pages). **Stand-in**: Hanken Grotesk, then system stack — see `--font-sans` in `styles.css`.
- Maintain comfortable line length inside `.container`; preserve hierarchy with weight and size, not extra colors.

## Layout and rhythm

- **Max content width**: `var(--container)` with `var(--gutter)` horizontal padding via `.container`.
- **Corners**: use the radius system (`--radius`, `--radius-media`); larger surfaces may use the larger radius where the CSS comments already justify it — stay consistent with existing cards and media frames.

## Components

- Prefer existing **button** classes (`.btn`, `.btn-primary`, `.btn-ghost`, `.btn-soft`, `.btn-dark`, `.btn-stroke-light`, etc.) before adding new button styles.
- **Motion**: respect `prefers-reduced-motion` where motion exists; keep transitions purposeful and short (existing patterns use ~150ms for hovers unless a section defines otherwise).

## Accessibility and quality bar

- Semantic HTML, visible focus for interactive controls, meaningful alt text, sufficient color contrast against the chosen surface.
- **Images**: optimize weight; SVGs and logos should stay crisp at 1x and 2x where used.

## When you change the design

- Update **`styles.css`** tokens or rules, then **`style-guide.json`** if tokens or roles changed, then **this file** if the *principle* or pattern changed (not for every one-off tweak).
- If a new page type diverges from the reference, document the exception here in one short subsection so future work stays intentional.
