# Image filenames

Save the images you sent into this folder using these exact filenames.
Filenames are kebab-case, lowercase, descriptive, and section-prefixed
so they sort and grep cleanly.

## Hero

| Image | Filename | Used by |
|---|---|---|
| Tom Cruise on motorcycle, Paris street, purple grid floor, Pepsi billboards | `hero-in-content-demo.jpg` | `.hero-media` (full-bleed hero background) |

## 4-card capabilities grid

Order matches left-to-right in the grid.

| # | Image | Filename | Used by |
|---|---|---|---|
| 1 | Cowboy with iPhone Pro billboard (Yellowstone-style scene) | `in-content-advertising-cowboy.jpg` | `.cap-media-1` — In-Content Advertising |
| 2 | Rembrand "Search available inventory" UI with TV show posters | `ai-video-platform-inventory.jpg` | `.cap-media-2` — AI Video Platform |
| 3 | TV showing Nike "Shop Now" ad with QR + product card | `social-content-ads-ctv.jpg` | `.cap-media-3` — Social Content Ads |
| 4 | Virtual production stage with green-screen forest background | `virtual-content-studios.jpg` | `.cap-media-4` — Virtual Content Studios |

## "The latest from Rembrand" rows

| Row | Filename | Used by |
|---|---|---|
| 1 — Cinematic Precision Technology | `latest-cpt-1-2-cinematic-precision.jpg` | `.latest-thumb-1` |
| 2 — Virtual Content Studios | `latest-virtual-content-studios.jpg` | `.latest-thumb-2` |
| 3 — Social and Creator Content Ads | `latest-social-creator-ads.jpg` | `.latest-thumb-3` |

## Notes

- The hero image renders edge-to-edge inside a rounded rectangle, so
  centering the focal subject (motorcycle headlight) is fine — the crop
  will bias toward center on most viewports.
- Card images render at ~4:3 aspect ratio with `object-fit: cover`
  equivalent (background-size: cover). Crop accordingly.
- Latest-row thumbnails render at ~16:10 aspect ratio.
- Prefer JPG for photographic content (smaller); PNG only if you need
  transparency. WebP is great if you want one extra step — just rename
  the `.jpg` references in `styles.css` to `.webp`.
- For retina, you can supply 2x assets at the same filename — the image
  is sized down by the CSS, so the larger source will look sharp.
