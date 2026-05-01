# Changelog — `prose-focus` fork

This branch is a permanent fork of `tree-sitter-typst` aimed at prose-oriented
tooling (LanguageTool integration, grammar/style linters). It diverges from
upstream's typesetting-faithful AST in service of cleaner prose structure and
more useful named nodes for excluded-content detection.

## [0.14-prose-4] — phase 4

### Changed
- **Quote pairing**: scanner now uses a hybrid of `last_class` (existing
  one-byte lookbehind) and a nesting bitfield (`quote_depth` +
  `quote_kinds`, 5 extra serialize bytes) mirroring Typst's
  `SmartQuoter` design. When `last_class` is fresh, it dominates;
  when stale (after `_termination` accept and similar arbitrary-text
  boundaries), the scanner consults the bitfield first, then falls
  back to lookahead. Nested quotes (e.g. `"He said 'hi'"`) now pair
  correctly to arbitrary depth (clamped at 32 levels).
- **Paragraph wrap extended** into block contexts beyond `source_file`:
  - Bracket bodies (`#[…]`, `#foo[…]`, `@ref[…]` via `ref_with_body`)
    wrap their multi-paragraph content into `paragraph` nodes.
  - Section bodies (under `=` headings) wrap into `paragraph` nodes.
  - Single-paragraph contents like `#emph[hi]` look slightly noisier
    (`(emph (paragraph (text)))` would, but emph stays flat — see
    below).
  - Emph / strong / `_indented` continuation blocks stay flat (they
    are inline contexts; Typst forbids parbreaks there).
- **`ref` split into `ref` and `ref_with_body`**: previously
  `optional(content)`. Now two distinct named nodes so downstream
  tooling can route them differently. Bare `@key` → `(ref)`. Body
  form `@key[explanation]` → `(ref_with_body (content …))`.

### Added
- `CLASS_STALE` sentinel in `enum char_class`. Set after
  `_termination` accept (where arbitrary text was just consumed)
  and read by the quote block to switch to bitfield-driven
  pairing.
- `is_double_quote()` helper distinguishing double-family quotes
  (including guillemets and CJK corner brackets) from single-family
  for nesting bookkeeping.
- `quote_pair_open_depth()` / `quote_pair_close_top()` bitfield
  helpers. Clamp at 32 levels.
- `inside_block($)` and `inside_inline($)` helper functions in
  `grammar.js`, replacing the single `inside($)`. Sections use
  block, emph/strong/indented use inline.
- `paragraph` rule now allows trailing `_paragraph_lb` (covers
  trailing-newline edge cases without spawning ERROR nodes).
- Scanner `line_start = true` set on `TOKEN_SECTION` and
  `TOKEN_CONTENT` opens so the new `_line_start_check` at the
  start of each paragraph-wrapping body fires correctly.

### Notes
- Test corpus: 81 failures (unchanged from phase 3 — same single
  improvement over pre-fork baseline).
- Linter consumers: `paragraph` nodes now appear inside `content`
  (bracket bodies) and `section` content. `RECURSE_TYPES` set
  needs `paragraph` already; `content` also already in the
  recurse set. New visitor cases: handling
  `ref` vs `ref_with_body` if differential exclusion is desired.

## [0.14-prose-3] — phase 3

### Changed
- Quote nodes split into `lquote` / `rquote` typed nodes via scanner-state
  pairing. Drops the flat `quote` node. Pairing uses `last_class` field on
  the scanner struct + one-char lookahead to decide direction; falls back to
  lookahead-only when stale state is too coarse to disambiguate.
- Markup runs at top level wrap into named `paragraph` nodes between
  `parbreak`s. Bracket bodies (`#foo[…]`, `#[…]`, `@ref[…]`) and emphasis /
  strong / heading bodies stay flat — paragraph wrapping there would add
  noise. Single line breaks within a paragraph are absorbed; blank lines
  separate paragraphs.
- `prose_marker` rule extended to a full `seq` form mirroring `item`: now
  supports indented continuation lines via `_indented`. Em-dash / unicode
  bullet markers can span multiple lines as a single bullet.

### Added
- `_token_lquote`, `_token_rquote` external tokens.
- `last_class` (uint8_t) field on `struct scanner`, persisted via
  serialize / deserialize. +1 byte per snapshot.
- `is_quote_glyph(c)` and `classify_char(c)` helpers in `scanner.c`.
- `_parbreak_separator` and `_paragraph_lb` grammar helpers, distinguishing
  paragraph break (blank line) from in-paragraph line break.
- `(item_marker) @markup.list` and `(prose_marker (item_marker) @markup.list)`
  highlight queries.
- `(lquote) @punctuation.delimiter`, `(rquote) @punctuation.delimiter`.

### Removed
- `quote` regex rule and `quote` named node. Replaced by `lquote` / `rquote`.
- `(quote) @markup.quote` highlight (replaced by lquote/rquote).
- `(item "-" @markup.list)` literal-token highlight (replaced by named
  child query).

### Notes
- Test corpus baseline pre-phase-3: 82 failures; post-phase-3: 81 failures
  (one upstream error-recovery test, `typst/terms/terms-missing-colon`,
  now passes due to paragraph reshaping).
- Linter consumers must update `PROSE_LEAF_TYPES` to include `lquote` and
  `rquote` and add `paragraph` to `RECURSE_TYPES`.

## [0.14-prose-2] — phase 2

### Added
- Multilingual quote glyphs in the `quote` regex: `„ ‚ ‹ › « » 「 」 『 』`.
- Dedicated `ellipsis` node split from `shorthand`. Both prose `...` and
  math `...` parse as `(ellipsis)` instead of `(shorthand)`.
- `(ellipsis) @constant.builtin` highlight.

### Changed
- `shorthand` no longer matches `...` (only `--`, `---`, `-?`, `~`).

## [0.14-prose-1] — phase 1

### Added
- `_token_word_apostrophe` external token: keeps in-word apostrophes
  (ASCII `'` and U+2019) inside `text` runs so contractions (`I'm`,
  `don't`, `it's`) parse as a single text node.
- `_token_prose_marker` external token: line-start unicode bullet glyphs
  (`• ‣ ⁃ · ◦`) and em/en-dashes (`— – ‐ ―`) followed by whitespace parse
  as a dedicated `prose_marker` node.
- Smart-quote glyphs U+2018-201D in the `quote` regex.

### Changed
- `item` rule now exposes its marker via `alias($._token_item, $.item_marker)`
  instead of the anonymous literal `'-'` alias. The same scanner emits
  `TOKEN_ITEM` for `-`, `+`, and `1.` — only the grammar exposure changed.
- Targets Typst v0.14.

### Notes
- Downstream consumers that asserted on the anonymous `'-'` child of `item`
  must update to expect `(item_marker)`.
