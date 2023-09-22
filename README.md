# notes

frontmatter
```
---
hide:
  - navigation
  - toc
  - footer

search:
  boose: 2 # Increase the search ranking of the page
  exclude: true # To exclude from search

weight: 0 # Lower number means it appears higher
headless: false # If true, page would not show in sidebar
---
```

### Admonitions
- note
- abstract
- info
- tip
- success
- question
- warning
- failure
- danger
- bug
- example
- quote

```
!!! note "Custom title"

    Text

!!! note ""

    THis would show not title

??? note

    The block would be collapsed by default.

??+ note

    The block would be expanded by default

!!! note inline end "Title"

    Shown in the right, alongside the text.

!!! note inline "Title"

    Shown in the right, alongside the text.

```

### Annotations
Expand markers to show additional info.

```
Some text, (1) other text.
{ .annotate }

1. Annotation text (1)
   { .annotate}

   1. Nested annotation, if you ever need that.


!!! note "(1)"

    (2) Some text

1. Annotations can be added directly
2. in the admonitions
```

To manually add the annotations use
```
<div class="annotate" markdown>
Some text, (1) text
</div>

1. Annotation text
```

### Code blocks
```
py title="Something" linenums="1"
> Code block with line numbers starting from 1

py hl_lines="2 3"
> These lines would be highlighted
```

For inilne code blocks use
```
`#!python code`
```

Embed code from external file use this inside the code block
```
--8<--
filename.md
filenam2.md
--8<--
```

Use `$$` and `$$ newline $$` for MathJax support.

Use `H^2^O` for superscript, `^^Underlined text^^`, `==would be highlighted==`, `~~strikethrough~~`, `H~2~O` for subscript.

To add keyboard shortcuts use [keys](https://facelessuser.github.io/pymdown-extensions/extensions/keys/), `++ctrl+alt+delete++`.


### Tabs
<pre>
=== "C"

    ```c
    #include <stdio.h>
    ```

=== "C++"

    ```c++
    #include <iostream>
    ```
</pre>

### Tables
Use `{{ file.csv }}` to include a table from file.

### Diagrams

Use [mermaid.js](https://mermaid.js.org/) for creating diagrams.

<pre>
``` mermaid

```
</pre>

First class support for flowcharts, sequence diagrams, class diagrams, state diagrams, entity relationship diagrams.

### Images
<pre>
![Image title](link){ align=left }
![Image title](link){ align=right }

<figure markdown>
  ![Image title](https://dummyimage.com/600x400/){ width="300" }
  <figcaption>Image caption</figcaption>
</figure>

![Image title](https://dummyimage.com/600x400/){ loading=lazy }

![Image title](https://dummyimage.com/600x400/f5f5f5/aaaaaa#only-light)
![Image title](https://dummyimage.com/600x400/21222c/d5d7e2#only-dark)
</pre>

### Tooltips
[Hover me](https://example.com "I'm a tooltip!") to show highlighted text on hover.

### Abbrevations
The HTML specification is maintained by the W3C.

*[HTML]: Hyper Text Markup Language
*[W3C]: World Wide Web Consortium