#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

// Create figure notes
#let fig_notes(body_of_text, width: 100%) = {
  box(inset: 1pt, width: width)[
  #align(left)[
  #set par(justify: true)
  #text(0.7em)[Notes: #body_of_text]
  ]
  ]
}

#let conf(
  title: none,
  author: none,
  website: none,
  thanks: none,
  doc,
) = {
  set text(font: "Georgia")

  set page(margin: 1.8cm, numbering: "1")

  set quote(block: true)
  show quote: set text(style: "italic")

  show link: set text(fill: p_blue)

  set par(justify: true)

  // Heading settings
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => [
    // #set align(center)
    #set text(20pt, weight: "bold")
    #block(below: 1em)[#it.body]
    ]
  show heading.where(level: 2): it => [
    #set text(16pt, weight: "bold")
    #block[#it.body]
    ]
  show figure.where(
  ): set figure.caption(position: top)
  // Title
  align(center)[
    #text(size: 16pt, weight: "bold")[#title]
  ]
  // Author
  align(center)[
    by #text(size: 10pt, style: "italic")[#author#footnote(numbering: "*")[ #h(0.1cm)#thanks]] $-$ #link( "https://jjgecon.github.io/" )[ (website) ]  $-$ #link( "https://jjgecon.github.io/" )[ (latest version) ] $-$ #datetime.today().display()
  ]

  v(.4cm)
  // whole doc bellow
  doc
  
}