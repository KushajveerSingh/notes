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