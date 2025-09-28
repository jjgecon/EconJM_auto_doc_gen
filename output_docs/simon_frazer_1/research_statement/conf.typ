#import "@preview/fontawesome:0.5.0": *

// Configuration Settings by Javier Gonzalez
// For an updates version please see https://github.com/jjgecon/research_templates

#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

#let sentence_start(body_of_text) = {
  text[*#body_of_text* #h(.2cm)] 
}


#let conf(
  uni_logo: none,
  university: none,
  college: none,
  department: none, 
  recepient: none,
  author: (),
  doc,
) = {
  // Global settings
  // colors
  let smu_red =  rgb(170, 18, 49)
  let smu_blue = rgb(52,67,148)

  // Header
  

  // Heading settings
  // set heading(numbering: "")

  // show heading.where(level: 1): it => [
  //   #set align(center)
  //   #set text(20pt, weight: "bold")
  //   #block(below: 1em)[#smallcaps(it.body)]
  //   ]
  // show heading.where(level: 2): it => [
  //   #set text(16pt, weight: "bold")
  //   #block[#it]
  //   ]

  // Link settings
  show link: set text(fill: smu_blue)

  // Set figure settings
  set figure.caption(position: top)

  // Table settings?
  set table(stroke:none)
  
  // reset the page format to skip the number
    set page(margin: (top: 5cm, bottom: 3.5cm, rest: 2cm), columns: 1, numbering: "1",
           header: [
            #grid(columns: (1fr, 2fr), align: (left, horizon + right), 
            [#image(uni_logo, width: 60%)],
            [#text(fill: smu_red, weight: "bold")[
              #college] \ #department \
              #author.name | #author.position \
              #text[#author.phone] #fa-icon("phone") #h(.2cm) 
              #link("mailto:" + author.email)[#text(fill: p_blue)[#author.email] #fa-icon("envelope", solid: true)] \ 
              #link(author.webpage)[#text(fill: p_blue)[#author.webpage] #fa-icon("globe")]
            ])            
            ], 
           footer: context [
            #set align(center)
            #text(size:9pt)[
              Southern Methodist University | PO Box 750116   |   Dallas TX 75275-0116   | ADMIN: +1 214-768-2562 | #counter(page).display("1/1", both: true)
            ]
           ])

  set text(size: 12pt, font: "Georgia")

  set par(justify: true)

  // whole doc bellow
  doc

  // signature
  // v(.5cm)
  // [
  //   #set align(left)
  //   Kind regards, \
  //   #author.name \
  //   #author.position \
  //   #university \
  //   #author.email \
  // ]
  // v(2cm)
  // line(end:(50%,0%))
}