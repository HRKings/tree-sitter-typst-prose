==============================
prose/apostrophe-contraction
==============================
I'm fine
------------------------------

(source_file
  (paragraph
    (text)))

==============================
prose/apostrophe-multi
==============================
I'm fine, don't worry, it's ok
------------------------------

(source_file
  (paragraph
    (text)))

==============================
prose/apostrophe-smart-u2019
==============================
don’t worry
------------------------------

(source_file
  (paragraph
    (text)))

==============================
prose/quote-real-delimiters
==============================
He said "hi" today
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/quote-smart-double
==============================
He said “hi” today
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/quote-smart-single
==============================
He said ‘hi’ today
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/quote-mixed-with-contraction
==============================
It's "quoted" today
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/apostrophe-leading-standalone
==============================
'standalone
------------------------------

(source_file
  (paragraph
    (lquote)
    (text)))

==============================
prose/item-plus
==============================
+ first
+ second
------------------------------

(source_file
  (paragraph
    (item
      (item_marker)
      (text)))
  (paragraph
    (item
      (item_marker)
      (text))))

==============================
prose/item-numbered
==============================
1. first
2. second
------------------------------

(source_file
  (paragraph
    (item
      (item_marker)
      (text)))
  (paragraph
    (item
      (item_marker)
      (text))))

==============================
prose/item-dash
==============================
- first
- second
------------------------------

(source_file
  (paragraph
    (item
      (item_marker)
      (text)))
  (paragraph
    (item
      (item_marker)
      (text))))

==============================
prose/prose-marker-bullet
==============================
• bullet line
------------------------------

(source_file
  (paragraph
    (prose_marker
      (item_marker)
      (text))))

==============================
prose/prose-marker-emdash
==============================
— em dash bullet
------------------------------

(source_file
  (paragraph
    (prose_marker
      (item_marker)
      (text))))

==============================
prose/prose-marker-endash
==============================
– en dash bullet
------------------------------

(source_file
  (paragraph
    (prose_marker
      (item_marker)
      (text))))

==============================
prose/code-string-apostrophe-untouched
==============================
#let x = "a'b"
------------------------------

(source_file
  (paragraph
    (code
      (let
        (ident)
        (string)))))

==============================
prose/quote-german-low9
==============================
Er sagte „hallo" heute
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/quote-french-guillemets
==============================
Il dit «bonjour» today
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/quote-japanese-corner
==============================
「こんにちは」
------------------------------

(source_file
  (paragraph
    (lquote)
    (text)
    (rquote)))

==============================
prose/ellipsis-prose
==============================
Wait...what?
------------------------------

(source_file
  (paragraph
    (text)
    (ellipsis)
    (text)))

==============================
prose/ellipsis-standalone
==============================
And then...
------------------------------

(source_file
  (paragraph
    (text)
    (ellipsis)))

==============================
prose/shorthand-emdash-still-works
==============================
Long --- dash
------------------------------

(source_file
  (paragraph
    (text)
    (shorthand)
    (text)))

==============================
prose/shorthand-endash-still-works
==============================
Range -- value
------------------------------

(source_file
  (paragraph
    (text)
    (shorthand)
    (text)))

==============================
prose/quote-pair-after-comma
==============================
He said, "hi"
------------------------------

(source_file
  (paragraph
    (text)
    (lquote)
    (text)
    (rquote)))

==============================
prose/quote-pair-nested-mixed
==============================
'inner' content
------------------------------

(source_file
  (paragraph
    (lquote)
    (text)
    (rquote)
    (text)))

==============================
prose/quote-pair-em-dash-context
==============================
She said---"hello"---loudly
------------------------------

(source_file
  (paragraph
    (text)
    (shorthand)
    (lquote)
    (text)
    (rquote)
    (shorthand)
    (text)))

==============================
prose/contraction-stays-text
==============================
it's fine
------------------------------

(source_file
  (paragraph
    (text)))

==============================
prose/prose-marker-continuation
==============================
— first line
  indented continuation
------------------------------

(source_file
  (paragraph
    (prose_marker
      (item_marker)
      (text)
      (text))))

==============================
prose/prose-marker-then-item
==============================
— em-dash bullet
- regular item
------------------------------

(source_file
  (paragraph
    (prose_marker
      (item_marker)
      (text)))
  (paragraph
    (item
      (item_marker)
      (text))))

==============================
prose/two-paragraphs
==============================
First paragraph here.

Second paragraph here.
------------------------------

(source_file
  (paragraph
    (text))
  (parbreak)
  (paragraph
    (text)))

==============================
prose/three-paragraphs
==============================
One.

Two.

Three.
------------------------------

(source_file
  (paragraph
    (text))
  (parbreak)
  (paragraph
    (text))
  (parbreak)
  (paragraph
    (text)))

==============================
prose/paragraph-multi-line
==============================
First line of paragraph.
Second line of same paragraph.
Third line of same paragraph.
------------------------------

(source_file
  (paragraph
    (text))
  (paragraph
    (text))
  (paragraph
    (text)))
