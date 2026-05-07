# Runway-style Marketing Site

A static HTML/CSS/JS rebuild of the Runway homepage layout, designed to be a
clean starting point for further customization. Open `index.html` in any
browser — no build step required.

## Files

- `index.html` — full single-page structure (header, hero, partners marquee,
  product grid, dark research feature, latest products, customers, careers
  CTA, footer).
- `styles.css` — all styles including responsive breakpoints, marquee
  animation, and dark-section gradients.
- `script.js` — mobile menu toggle, marquee CPU saver, and a subtle
  scroll-in reveal.

## Design tokens

These live at the top of `styles.css` as CSS custom properties:

| Token        | Value     | Use                            |
|--------------|-----------|--------------------------------|
| `--bg`       | `#ffffff` | Page background                |
| `--bg-soft`  | `#f7f7f7` | Section + card backgrounds     |
| `--bg-dark`  | `#0c0c0c` | Footer / research / careers    |
| `--text`     | `#0c0c0c` | Primary text                   |
| `--text-2`   | `#2a2a2a` | Body text on light surfaces    |
| `--text-muted` | `#6b7280` | Eyebrows, secondary text     |
| `--border`   | `#e0e4eb` | Section dividers               |

Typography uses Inter (sans) and Cormorant Garamond (serif italic accents)
loaded from Google Fonts. Swap to ABCNormal / JHA Times Now if you license
those families.

## Things to iterate on

1. **Real media.** The card and row backgrounds are gradients — drop in
   actual `<img>` or `<video>` (e.g. `<video autoplay muted loop playsinline>`)
   inside each `.card-media`, `.latest-media`, and `.customer-media`.
2. **Logos in the marquee.** Replace the wordmark `<span class="brand">`
   elements with inline SVG logos for visual fidelity.
3. **Routing.** All links currently point to `#`. Wire them up to real
   pages or sections.
4. **Header on scroll.** Consider adding a class once `scrollY > 8` to
   tighten the header padding.
5. **A11y pass.** Run an axe or Lighthouse audit; add `aria-current` for the
   active nav item, real `alt` text once images land.
