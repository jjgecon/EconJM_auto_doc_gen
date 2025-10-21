#import "conf.typ": *


#show: conf.with(
  uni_logo: "../../../0_media/SMULogo.png",
  university: "Southern Methodist University",
  college: "Deadman College of Humanities and Science",
  department: "Department of Economics",  
  recepient: [Hiring Committee],
  author: (
      name: "Javier Gonzalez",
      address: "3300 Dyer Street, P.O. Box 0496; Dallas, TX 75275-0496, USA", // Always separate by `;` to create a new line
      email: "gonzalezjj@smu.edu",
      phone: "+1 (972) 804-0694",
      position: "Economics Ph.D. Candidate",
      webpage: "https://jjgecon.github.io",
  ),
)

= Research Statement

Entertainment media (e.g., television shows, films, books, and music) are more than entertainment products.
As a group, they reflect the cultural norms, identities, and values of the societies that produce them.
Yet media can also be a powerful force for change.
A single telenovela can drive cultural change by introducing new social issues that challenge the status quo.
My research explores this dual role as a cultural mirror that reflects societal values and a driver of social change that shapes economic behavior.
My core contribution is the development of novel methods using generative artificial intelligence (AI) to transform unstructured narratives into structured data for rigorous econometric analysis.
I apply this framework to Latin American telenovelas, whose deep cultural penetration provides an ideal setting to identify the causal effects of media exposure on real-world economic and social outcomes.
Ultimately, this approach offers a new, high-frequency, and scalable methodology for the empirical study of culture and its influence on human behavior.

#sentence_start()[Job Market Paper]
In "Does Watching Women Work, Work? The Effect of Television on Female Labor Outcomes," I provide causal evidence that media can be a powerful tool for closing gender gaps.
To measure the content of these narratives, I developed a novel Female Empowerment Index (FEI) by applying a generative AI model to the synopses of nearly 2,000 telenovelas.
The FEI is based on an augmented Bechdel-Wallace test and includes questions about the employment status of female characters.
To overcome endogeneity concerns, I employ an instrumental variable strategy in Mexico that leverages quasi-random variation in television signal loss determined by physical topography.
The central finding is that a 10% increase in FEI exposure (20 units) leads to a 4% relative increase in the likelihood of labor market participation (2 percentage points), accounting for a sizable share of female labor force participation growth in Mexico from 2010 to 2020.
The effect is driven exclusively by portrayals of women in non-traditional careers and narratives that frame empowerment with positive emotions, demonstrating that how empowerment is portrayed is important.

A second paper, "Drama and Redistribution: The Impact of Telenovelas on Preferences for Redistribution in Latin America," complements this work by showing that telenovelas depicting inequality lead to a counterintuitive decrease in support for redistribution.
This study's methodological contribution lies in the comparison of multiple Natural Language Processing (NLP) techniques to identify social class conflict in telenovelas.
I compared (i) a dictionary-based approach, (ii) a vector embedding model, and (iii) a zero-shot classification using a generative AI model (ChatGPT).
The ChatGPT model outperformed the others in accuracy (74%) and precision (80%).
The analysis reveals that exposure to inequality telenovelas reduces support for redistributive policies by 4%.
This is because the narratives often misrepresent the experiences of marginalized groups, framing them in ways that downplay systemic issues.

My future research will be dedicated to expanding this methodological pipeline.
I plan to scale the measurement of cultural values across multiple forms of media worldwide, moving beyond gender and inequality to include other economically relevant values such as community trust, attitudes towards immigration, and environmental protection.
Such large-scale data assembly and validation naturally create a collaborative environment.
Building on my experience managing research assistants, this work will provide ideal opportunities for undergraduates to gain hands-on experience, serving as human coders to collect data and benchmark AI model performance.

The most innovative step in this research agenda is to move beyond text, leveraging recent breakthroughs in multimodal generative AI to analyze visual and auditory data directly.
This expansion will allow the project to include cultural products like movies, books, and music, which transmit essential cultural messages through images and sounds, not just text.
Thanks to rapidly advancing AI, state-of-the-art multimodal models such as GPT-4o and Google's Gemini can now process text, images, and audio simultaneously.
Applying these tools will enable a far more complete and nuanced extraction of cultural values from these rich media forms.

Lastly, while my research has so far explored the demand side of media, a compelling future direction is the supply side: how producers of these media types decide which narratives to create and disseminate.
This new agenda will investigate the extent to which political environments shape media content and whether producers tend to conform to the status quo or push the boundaries of social norms.

My research agenda is driven by a central goal: to show that the narratives in our media have a tangible impact on people's economic lives.
Ultimately, this work argues that behavioral change is not only achieved through laws and policies, but also by transforming the very stories we tell ourselves.