==============================
prose/apostrophe-contraction
==============================
I'm fine
------------------------------

(source_file
  (text))

==============================
prose/apostrophe-multi
==============================
I'm fine, don't worry, it's ok
------------------------------

(source_file
  (text))

==============================
prose/apostrophe-smart-u2019
==============================
don’t worry
------------------------------

(source_file
  (text))

==============================
prose/quote-real-delimiters
==============================
He said "hi" today
------------------------------

(source_file
  (text)
  (quote)
  (text)
  (quote)
  (text))

==============================
prose/quote-smart-double
==============================
He said “hi” today
------------------------------

(source_file
  (text)
  (quote)
  (text)
  (quote)
  (text))

==============================
prose/quote-smart-single
==============================
He said ‘hi’ today
------------------------------

(source_file
  (text)
  (quote)
  (text)
  (quote)
  (text))

==============================
prose/quote-mixed-with-contraction
==============================
It's "quoted" today
------------------------------

(source_file
  (text)
  (quote)
  (text)
  (quote)
  (text))

==============================
prose/apostrophe-leading-standalone
==============================
'standalone
------------------------------

(source_file
  (quote)
  (text))

==============================
prose/item-plus
==============================
+ first
+ second
------------------------------

(source_file
  (item
    (item_marker)
    (text))
  (item
    (item_marker)
    (text)))

==============================
prose/item-numbered
==============================
1. first
2. second
------------------------------

(source_file
  (item
    (item_marker)
    (text))
  (item
    (item_marker)
    (text)))

==============================
prose/item-dash
==============================
- first
- second
------------------------------

(source_file
  (item
    (item_marker)
    (text))
  (item
    (item_marker)
    (text)))

==============================
prose/prose-marker-bullet
==============================
• bullet line
------------------------------

(source_file
  (prose_marker)
  (text))

==============================
prose/prose-marker-emdash
==============================
— em dash bullet
------------------------------

(source_file
  (prose_marker)
  (text))

==============================
prose/prose-marker-endash
==============================
– en dash bullet
------------------------------

(source_file
  (prose_marker)
  (text))

==============================
prose/code-string-apostrophe-untouched
==============================
#let x = "a'b"
------------------------------

(source_file
  (code
    (let
      (ident)
      (string))))
