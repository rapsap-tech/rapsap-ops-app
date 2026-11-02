# Figma snapshot (offline copy)

Source: Figma file **Rapsap-Designs** (`kEdB82eXddsUq6gAnNzMFF`), section **"Rapsap Ops — UI screens"** (node `1085:6532`).
<https://www.figma.com/design/kEdB82eXddsUq6gAnNzMFF/Rapsap-Designs?node-id=1085-6532>

Saved on 2 Nov 2026 so design work can continue when the Figma MCP call limit is reached.
**Use these files first; call the Figma MCP only for something not covered here** (and save what you fetch back into this folder).

| File | What it has |
| --- | --- |
| `tokens.md` | Colours, type, spacing, radii and component mapping, with the `AppColors` / `AppTextStyles` / `Dimens` names |
| `frames/*.md` | One file per frame (54): node id, layout tree with positions and sizes, every text exactly as in Figma |
| `screenshots/*.png` | Rendered frames that were fetched (16): A2–A5, B1–B8, X3, X4, X6 |
| `metadata.xml` | Raw `get_metadata` dump of the whole section (all node ids, names, positions, sizes) |
| `../screens.md` | Frame → page map in the app, and which pages still need a visual check |
| `../prd/Rapsap_Ops_PRD_v1.4.txt` | Text of the PRD v1.4 PDF (for searching requirement ids like CK-12, SM-30) |

Limits: frames without a screenshot have no colour data per element. Their colours follow `tokens.md`, and they are marked 🔍 in `../screens.md` for a check once Figma access is back.

When the design changes in Figma, refresh: `get_metadata` on node `1085:6532` → `metadata.xml`, then regenerate `frames/` and add new screenshots.
