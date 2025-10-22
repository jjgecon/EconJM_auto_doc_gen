
// Configuration Settings by Javier Gonzalez
// For an updates version please see https://github.com/jjgecon/research_templates

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
  // set heading(numbering: "1.1")

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
              #college] \ #department
            ])            
            ], 
           footer: [
            #set align(center)
            #text(size:9pt)[
              Southern Methodist University | PO Box 750116   |   Dallas TX 75275-0116   |   214-768-2562   |   Fax 214-768-1611
            ]
           ])

  set text(size: 12pt, font: "Georgia")
  datetime.today().display("[month repr:long] [day], [year]")
  par()[
    #set align(left)
    #author.name | #author.email \
    #for addr in author.address.split(";") {
      addr.trim()
      linebreak()
    }
  ]



  par()[Dear #recepient:]

  set par(justify: true)

  // whole doc bellow
  doc

  // signature
  // v(1cm)
  grid(columns: (1fr, 1fr), align: (left, right),
  [Sincerely, \ #author.name],
  [#image("../../../0_media/signature.jpg", width: 60%)])
  
}