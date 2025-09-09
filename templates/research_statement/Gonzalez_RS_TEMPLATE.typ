#import "conf.typ": *


#show: conf.with(
  uni_logo: "../../0_media/SMULogo_InformalPeruna_digitalonly_BR.png",
  university: "Southern Methodist University",
  college: "Deadman College of Humanities and Science",
  department: "Department of Economics",  
  recepient: [Recepient],
  author: (
      name: "Javier Gonzalez",
      address: "3300 Dyer Street, P.O. Box 0496; Dallas, TX 75275-0496, USA", // Always separate by `;` to create a new line
      email: "gonzalezjj@smu.edu",
      position: "Economics Ph.D. Candidate",
      webpage: "https://jjgecon.github.io",
  ),
)

= Research Statement

Entertainment media (e.g., television shows and films to books and music) are more than entretainment products: as a group they reflect the cultural norms, identities, and values of the societies that produce them.
Individual telenovelas can also drive cultural change by introducing  new social issues and challenging the status quo to pursuit of compelling narratives.
My research agenda investigates the dual role of entertainment media as both a cultural mirror that reflects societal values and a driver of social change that shapes economic behavior.
While media narratives offer a rich source of data for measuring cultural trends, the primary challenge lies in systematically quantifying this content at scale. My core contribution is the development of novel methods using generative artificial intelligence (AI) to transform unstructured narratives into structured data for rigorous econometric analysis.
I apply this framework to Latin American telenovelas, whose deep cultural penetration provides an ideal setting to identify the causal effects of media exposure on real-world economic and social outcomes @lopez_our_2002.
This approach proposes a new, high-frequency, and scalable methodology for the empirical study of culture itself, moving beyond the static proxies common in the economics literature.  

#sentence_start()[Job Market Paper]
In "Does Watching Women Work, Work?", provides causal evidence that media can be a powerful tool for closing gender gaps.
To measure the content of these narratives, I developed a novel Female Empowerment Index (FEI) by applying a generative AI model to the synopses of nearly 2,000 telenovelas.
The FEI is based on an augmented Bechdel-Wallace test that includes questions about the employment status of female characters.
To overcome endogeneity concerns, I employ an instrumental variable strategy in Mexico that leverages quasi-random variation in television signal loss determined by physical topography.
The central finding is that exposure to one additional telenovela with a maximum FEI score during a woman's adolescent years causally increases her subsequent labor force participation by 0.6-0.7 percentage points, a 2% increase relative to the sample mean.
The effect is driven exclusively by portrayals of women in non-traditional careers and narratives that frame empowerment with emotions of joy and anger, demonstrating that how empowerment is portrayed is paramount.

A second paper, "Drama and Redistribution," complements this work by exploring how media's framing of socio-economic conflict can lead to counterintuitive political economy outcomes.
This study's methodological contribution lies in its validation of multiple Natural Language Processing (NLP) techniques to identify "inequality telenovelas." I compared a dictionary-based approach, a vector embedding model, and a zero-shot classification using a generative AI model (ChatGPT), finding that the generative AI model performed with the highest precision at 0.80.
The analysis reveals that exposure to these telenovelas is associated with a 4% reduction in support for redistribution. This is because the narratives often frame inequality not as a systemic issue of poverty but as a comedic conflict between the wealthy and the middle class, thereby diminishing its perceived urgency.

My future research will scale this proof-of-concept into a generalizable framework for measuring a broader set of cultural values across diverse media.
This involves extending the analysis beyond gender and inequality to other economically relevant values, such as community trust and attitudes towards immigration.
A key area I am already exploring with other Ph.D. students is environmental concern; for instance, we are developing a project to measure the effect of telenovelas that depict conflicts between forestry companies and local populations over forest preservation.
This expansion will also move beyond telenovelas to include other cultural products like movies, books, and music, creating a comprehensive dataset for the social sciences.
Such large-scale data assembly and validation naturally creates a collaborative environment.
Building on my experience managing research assistants for my dissertation, this work provides ideal opportunities for undergraduates to gain hands-on experience in data collection and the validation of AI-coded data, serving as human coders to benchmark model performance.  

The most innovative step in this agenda is to move beyond text by leveraging recent breakthroughs in multimodal generative AI to analyze visual and auditory data directly.
For example, I plan to use state-of-the-art models like GPT-4o to extract objective measures of wealth and poverty from images and video stills of characters’ homes and clothing, offering a more precise quantification of the inequality viewers are exposed to than what is available in textual synopses.
This ambitious technical work is grounded in the rapidly advancing capabilities of AI for image and video analysis in the social sciences.
To build a complete economic model, I will also investigate the supply side of media, exploring the economic and political factors that determine why producers create certain narratives.
The technical sophistication of these projects is well-suited for collaboration with postdoctoral fellows and advanced graduate students.

#bibliography("../../0_media/My Library.bib")