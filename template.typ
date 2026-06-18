// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(paper: "a5", numbering: "1", number-align: center)
  set text(
    font: "TeX Gyre Termes",
    number-type: "old-style",
    lang: "es",
    ligatures: true,
  )
  set heading(numbering: "1.1.")

  // Set run-in subheadings, starting at level 3.
  show heading: it => {
    if it.level > 2 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  show math.equation: set text(
    font: "TeX Gyre Termes Math",
    number-type: "old-style",
  )

  set math.equation(numbering: "(1)")

  // As given in the Typst docs.

  show ref: it => {
    let eq = math.equation
    let el = it.element
    // Skip all other references.
    if el == none or el.func() != eq { return it }
    // Override equation references.
    link(el.location(), numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    ))
  }

  // Now I want to add some style to TOC

  show outline.entry.where(level:3) :it => link(
    it.element.location(),
    // Keep just the body, dropping
    // the fill and the page.
    it.indented(
      it.prefix(),
      it.body(),
    )
)

  // Title row.
  align(center)[
    #v(1in)
    #block(text(weight: 300, spacing: 8pt, tracking: -1pt, 2.00em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )


  // Bibliography

  set bibliography(style: "apa")

  // Main body.
  set par(justify: true)
  set text(hyphenate: true)


  body
}
