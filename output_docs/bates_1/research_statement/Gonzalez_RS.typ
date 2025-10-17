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

Entertainment media such as television shows, films, books, and music serve as more than mere sources of amusement; they embody and project the cultural norms, identities, and values intrinsic to the societies that produce them. Yet, these media also hold transformative potential, capable of challenging prevailing social structures and inspiring meaningful behavioral change. My research investigates this dual function, positioning media simultaneously as a cultural mirror reflecting societal values and as a catalyst driving economic and social transformations. A central innovation in my work lies in the development of generative artificial intelligence (AI) methodologies that translate unstructured narrative content into structured data amenable to rigorous econometric analysis. This framework is principally applied to Latin American telenovelas, whose pervasive cultural reach offers a unique setting to identify causal impacts of media exposure on economic behavior and social outcomes. Together, this approach establishes a scalable, high-frequency analytical paradigm for empirically examining culture's influence on human economic activity.

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
The ChatGPT approach outperformed the others in accuracy (74%) and precision (80%).
The analysis reveals that exposure to inequality telenovelas reduces support for redistributive policies by 4%.
This is because the narratives often misrepresent the experiences of marginalized groups, framing them in ways that downplay systemic issues.

Looking forward, my research agenda aligns closely with Bates College’s commitment to diversity, inclusion, and social justice by expanding this methodological pipeline to measure a broader spectrum of cultural values—including community trust, immigration attitudes, and environmental concerns—across diverse global media forms. This expansion fosters interdisciplinary collaboration and offers valuable opportunities for undergraduate research mentorship, consistent with the college's emphasis on whole-person education and fostering intelligent global citizenship.

Technological advances in multimodal generative AI present particularly exciting prospects to extend analysis beyond textual content towards visual and auditory media, enhancing the depth and breadth of cultural value extraction. This innovation aligns with Bates’ liberal arts tradition by integrating quantitative rigor with rich cultural inquiry.

Additionally, my future work aims to examine the supply side of media production—investigating how political and social contexts influence narrative creation and whether media producers reinforce or challenge prevailing social norms. This focus complements the Economics Department’s interests in political economics, pro-social behavior, and gender economics, and offers collaborative potential with faculty engaged in experimental and interdisciplinary research.

My research embodies a dedication to leveraging empirical causal inference methods to elucidate the powerful interplay between cultural narratives and economic outcomes, resonating with the department’s mission to prepare students to analyze complex economic issues relevant across business, government, and the nonprofit sector. Through robust mentorship of undergraduate research and a commitment to inclusive teaching, I aim to contribute to an engaging academic environment that fosters diverse perspectives and supports Bates College's longstanding values of equity and responsible citizenship.

Ultimately, this work highlights that transforming economic behavior and social norms transcends traditional policy levers, requiring critical attention to the stories we tell and internalize, a theme fitting for an institution that champions liberal arts education as a catalyst for societal change.
