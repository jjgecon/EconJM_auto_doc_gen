#import "conf.typ": *


#show: conf.with(
  title: "The Hidden Curriculum of the Econ Job Market",
  author: "Javier Gonzalez",
  thanks: "Thanks to Fernanda Da Silva for encouranging me to write down these tips so that other SMU students can get a little more context while navigating the job market.",
)

Despite the abundance of guides, webinars, and official resources, I found that much of the advice available was shaped by pre-COVID experiences or tailored to candidates from top-ranked institutions. These "hidden curriculum" elements include not just the logistics of applications and interviews, but also the subtle expectations, networking strategies, and unspoken norms that can make a significant difference in outcomes. My goal here is to shed light on these less-discussed facets, especially from the perspective of someone navigating the market from a lower-ranked school in the current environment.

Take this with a grain of salt, as this is my personal experience on the job market in the 2025-26 cycle as a Ph.D. Candidate from Southern Methodist University.

The tips in this document will build upon the following resources which I found particularly helpful.

- #link("https://www.aeaweb.org/resources/students/grad-prep/job-market")[_A Guide and Advice for economists on the U.S. Junior Academic Job Market 2018-2019_] by John Cawley (outdated but with usefull information)
- #link("https://www.aeaweb.org/resources/students/grad-prep/job-market")[AEA Prep. Job Market Resources]
- #link("https://www.aeaweb.org/about-aea/committees/job-market")[AEA JOE Committee on the Job Market] videos and documents
- #link("https://econjobmarket.org/videos")[EJM Informational discussions and webinars]
- #link("https://res.org.uk/event-listing/european-job-market-for-economists/?utm_campaign=Dotdigital&utm_medium=email&utm_source=Royal%20Economic%20Society&dm_i=7O8I,2D6GZ,61HKR5,4O6T9,1")[European Job Market for Economists (EJME)] with #link("https://www.europeanjobmarketofeconomists.org/guides-candidates-recruiters")[Guides for Candidates and workshops]


Lastly, the examples of how I structured my answers will be around a _quote_ block, so you can easily identify them, like the following

#quote(attribution: [Javier Gonzalez])[My future research will be dedicated to expanding this methodological pipeline ...]

#outline()

#pagebreak()

= Preparing Applications

Your Job Market Paper should be finished by August before the market.
This means a _polished_ draft with all pieces, figures, and tables.
You will have zero time to work on your JMP from September to December when you are sending applications.
In my case, I just had my firstborn daughter in September, which served as a good commitment device to have everything in order before her arrival.

Your network and your advisor's network is key to get interviews.
This is the time to use the network you have been building during your academic career.
Reach out to MA advisor or back-home professors that are willing to help you.
Make sure your advisor is willing to reach out to their network on your behalf on the places you want to go.
Ask for the letters at least 1 month before the closest application deadlines.

#pagebreak()

= Applications

A typical application package includes:

+ Cover letter
+ Curriculum Vitae
+ Job Market Paper
+ Research Statement\*
+ Teaching Statement\*
+ Letters of Recommendation (usually 3)

_\* I noticed a shift that most non-US positions do not require Research or Teaching Statements. But in some sense these topics will come up in the interviews, so there is value in writting them._

There is plenty of advice on how to prepare each of these documents, so I will not go into them here.

== Strategy

- general descriptive statistics of the applications sent
  - Number of applications sent
  - Types of positions (assistant prof, postdoc, other)
  - Locations (US, Europe, Latin America, Asia, etc)

- Apply to everything
  - According to #link("https://econ-jobs.com/media/academic-economics-job-market-is-contracting/")[Econ-Jobs.com], the econ academic job market has been in decline for a number of reasons, and the 2025-26 was the first post-covid to perform worse than the pandemic year.
  - Even if the position is not a great fit (Finance dept. instead of Econ) let the committee decide if you are a good fit or not
    - sometimes department just want an excellent candidate and not necessarily have in mind a field
  - That said I did avoided some places: Middle East, China, and India.

#figure(caption: "Geographical distribution of my applications", placement: auto)[
  #image("figs/geo_apps.png")
] <geo_apps>

- show a timeline of my applications
  - cummulative applications sent by date

#figure(caption: "Application Timeline", placement: auto)[
  #image("figs/cumsum_apps.png", width: 80%)
  #fig_notes(width: 90%)[
  The grey vertical lines represent the target deadlines that I sent myself to have a batch of apps ready. The most important deadline is November 15 represented by the solid black line.
  ]
] <app_timeline>

- Set up deadlines before the advertized target deadlines.
  - Most departments have a target deadline around mid-November (Nov 15)
  - However, many departments will start reviewing applications as soon as they receive them
  - The most I could do in a day was 20 applications

== Set-up

I used `vscode` that both generated documents using `python` and allowed me to modify the documents with #link("https://typst.app/docs/")[`typst`]. You can think of `typst` as a LaTeX replacement with modern syntax and instant preview (no need to compile the `.typ` file everytime you want to see a change).

My set up can be devided into 3 main components:

+ Gather info about job add, department, and school/project if it is a post doc
  - This can be time consuming as you might want to read faculty pages, so take it into consideration
+ Let a LLM read the addition information + CV to create a single paragraph to be at the end of the Cover letter to indicate fit with the position
+ Use `typst` to modify the cover letter template
  - Make sure you get the position + institution right
  - add personal reasons to apply to that position
  - Modify the LLM generated paragraph to make it more personal

If you want to see my full set-up please check this  #link("https://github.com/jjgecon")[repo], in particular the `personalize_docs.ipynb` notebook.

Keep a `.txt` file with all the extra information you will always copy and paste. In this repo the file is `other_docs/other_info.txt`.

== Advice

In your cover letter always emphasize the fit with the postion, meaning you need to tailor them to each position.
Personal reason here are very important.
Do not be afraid to *bold* the key phrases that you want the committee to remember about you.
Examples:

#quote[As a Spanish national, my family and I are eager to *return to Europe* so our newborn daughter can grow up immersed in European culture. We are seeking a community with a safe learning environment, a key factor in our decision to *leave the United States*.]

#quote[My wife, who is Mexican, and I, a Chilean citizen, are eager to *return to our roots in Latin America*. We want our newborn daughter to grow up immersed in the culture, and our search for a safe learning environment for her is the primary motivation for our move from the United States.]

#quote[My family and I are eager to *leave the United States*.
We want our newborn daughter to grow up in a different cultural environment and are seeking a community with a safe learning environment. We are also *willing to learn Japanese* as soon as possible to better integrate into the local culture and academic community]

No need to tailor your Teaching Statement or your Research Statement
Most positions outside of the U.S. do not even ask for these statements
I started personalizing these but I genuinly think they don't care that much
You will eventually talk about these topics in the interviews

Signals:
Remember that you have 2 signals for the AEA JOE and 10 signal for the European Job Market (need to puit links)
The common advice here is that you send a signal where your committee does not know anyone AND that you think there is a chance they will hire you
In other words, do not waste your signals in MIT, Harvard, Chicago, or top in EU
However, I don't know if they did anything for me. No institutions I sent my signals to invited me to interview

== Waiting

RESIT the urge to check EconJobRumors!
You will cave at one point, but note that because of the anonimity there is no way to verify the claims
So usually what happens is that a small rumors starts to spiral out of control with plenty of anxious candidates in the discussion 

#link("https://www.aeaweb.org/econtrack")[Econtrack] is a resource to keep track of the AEA JOE listing, but it's not a complete or good tracker
HOWEVER, do not trust any updates without the check "verified by an official of this institution"
Then any person with an account can update the status of a job to interviews, when in reality they are still processing applications

In contrast, I feel like the status from the EJM is more reliable
You did not get an interview when the status changes to "Interview scheduling completed"
That said, I do think that if you see "Scheduling interviews" and have not received an inteview invitation, there is a high prob. you did not make the cut
Note that not all position use the EJM for interviews and some post might be "Reviewing applications" indefinetly

I started to recieve rejections in mid-November as you can see in @week_status.
Most positions will not give you any news.
So if you get to mid-December and the application target deadline has long passed, it is likely that you did not make it to the interview stage.
In my case, 92% of all my applications did not receive any updates.

#figure(caption: "Weekly Status", placement: auto)[
  #image("figs/weekly_status.png", width: 80%)
  #fig_notes(width: 90%)[
    The count limit is set to 25 to emphasize the small activity/updates received. The total number of applications is 250+.
    ]
] <week_status>

#pagebreak()

= Interviews

I got my first interview invite at the end of November for an AP position in LATAM. By December 12 I have received 5 interview invites (2 AP, 2 Postdoc, 1 Consulting).

In the 2025-26 cycle, the #link("https://www.europeanjobmarketofeconomists.org/about-ejme")[European Job Market for Economists (EJME)] urged departments to conduct virtual interviews between December 15 and December 18. Between this time I did not receive any interview invites from the EU, ...

== Common Structure

Assistant professor:
+ Talk about yout JMP (10mins)
+ Research Agenda (10mins)
+ Teaching Philosophy (5mins)
+ Why our department? (5mins)

Postdocs:
+ Talk about yout JMP (10mins)
+ Research Agenda in relations to project (5mins)
+ What skill can you bring to the proposed projects (10mins)
+ Why our project? (5mins)

Apparently Industry jobs vary quite a lot depending on the firm (e.g. consulting or data-scince). #link("linkedin.com/in/mohsen-foroughifar-800350266")[Mohsen Foroughifar] put it best when talking about the Marketing Academic Job in his #link("https://www.linkedin.com/posts/mohsen-foroughifar-800350266_marketing-academic-job-market-post-5-activity-7406439233487433728-i2yI?utm_source=share&utm_medium=member_desktop&rcm=ACoAACEMbI8BtSc1yt88uuZBJ3Mj2fUPJCm4HEU")[LinkedIn post].

In my experience with #link("https://www.analysisgroup.com/")[Analysis Group], they were more interested in the econometric techniques and how I defended them than I expected.
My first-round interview followed this structure:

  + Talk about yout JMP (15mins)
  + Explain Econ concept to a jury/judge (5mins)
  + What do you like more about the research work? (5mins)
  + Do you have any questions for us? (5mins)

== Advice

Always start your JMP spiel with a version of the following:
#quote[I am an `MAIN_FIELD` economist, working in the intersection of `SECOND_FIELD` and `THIRD_FIELD`. My JMP ...]

This helps the committee to place you within the field, and understand better your work. So if you are answering a question used econometric methods, or a macro model, etc.

#quote(attribution: [Javier Gonzalez])[I am an Applied economist, working in the intersection of Culture and Media. My JMP shows that when women grow up watching female empowered content on TV shows they are more likely to work as an adult ...]

Although the advice is to have a 1min, 5min, and a 10m spiel of your JMP (onion idea) I have found that a good 3-4min version works best for most interviews.
You can always adjust the depth of your explanation depending on the audience.
They will most likely ask questions

The interviews should be more of a conversation.
that means you need to have practiced your 3-4min spiel enough times so you can be flexible.
the interviewrs might ask question in between, and if you have not hit all the point you wanted to make, take them back to your main points.
This also means that you want to sound excited about your research and joining the department or project for postdoc

Practice your interview skills.
You would be surprised how good my interview skills got after the 7th (counting mock interviews).
You really make mistakes in the first few, and you learn to control your nerves.
talk with speakers if your department allows it.
beg the department to set up mock interviews with faculty.
practice with peers that are also on the market. you can even ask me!
#link("https://asheweb.org/")[American Society of Hispanic Economists (ASHE)] sometimes offers mock interviews

Stronger signal is alwasys what you have done, than what you plan to do.
If you are already working on an idea, relate to it with you overall field and explain what do you have so far.
If you have already been an instructor, comment on these experince

In the interviews you are meant to impress the committee, so BRAG about your accomplishements whenever they are relevant.
Meaning, if you have already published papers BRAG ABOUT THEM! Then talk about your future agenda.
If you were an instructor with good evals, BRAG about it in the interview.
If you have tons of teaching experience, BRAG about it in teaching schools

When they ask if you have any questions it has been recommended to Say that you don't have any, but if you do that you will reach out and comment on your exciment for the position#footnote[Recommended by #link("https://spot.colorado.edu/~antmanf/")[Francisca Antman] and #link("https://david-schindler.de/")[David Schindler].].
I also tried to show that I did my research before the position:
- The videos introducing the department to undergraduate has good production value
- The research agenda of the postdoc is exciting because of ...

EXCEPTION: if you are in an industry interview, do ask questions
I mainly asked about the specifics of the position or job
    - What does a _Associate (Generalist)_ mean?
    - How much autonomy will I have to take cases?
    - Are there cases of new hires who failed to build up a reputation?

For the question Why our department/project/firm?.
Personal reasons > Profesional reasons.
It is more informative that you want to live in EU rather than the U.S. for EU postions (with a reason).
These are some of the examples I used:

- Family objectives
- Have _relatively close_ family in the area 
- Co-authors or alumni in your network are in the area

#quote(attribution: [Javier Gonzalez])[I want my newborn daugther to grow up immersed in the Latin American culture ... I also have two SMU alumni living in the city ...]

Regularly communicate with your advisor. they will know the best strategy to move forward.
they will give you some advice on how to answer specific questions. 

Send a thank you email a day after the interview.
keep it short and sweet.
if you made a mistake in the interview, you can use this opportunity to correct it (try to do this a couple hours after the interview).
reiterate your exciment for the position

#pagebreak()

= Fly-outs

== Common Structure



Postdoc:
No common structure here and will depends on the projects/team. In my case I had to present my JMP in 1 hour to the team (4 people).

== Advice

Similar to the interviews, do not have your prefered place first.
You gain experience and practice with each fly-out. 
Note however that sometimes the timing is not with you.
That said do not chose a far away date, so that the committee does not think you want to fish for other opportunities

As soon as you get a fly-out invitation, tell your advisor.
Politics now play a huge role and you want to send the best signals possible to maximize your offer chances.
Your advisor will help you navigate this process.

#pagebreak()

= Reflexions: What made my profile attractive?

- Willing to relocate anywhere
  - this is particularly hard for those with significant others or family
  - I know there are resources for those who enter the market as a couple, I do not have this experince so please refer to other resoruces.
- Novel method of AI applied to my research question
- My committe was pushing me within their networks
  - They called their networks and sent emails to make them look at your CV
