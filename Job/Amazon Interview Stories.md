Why do you want to work at amazon?
 - What really drives me at work is solving complex, challenging problems. I find myself performing at my best, learning the most, and receiving the best feedback when I'm given problems that force me to learn and really think critically. Amazon just seems like the perfect place to get that.
 
**1. Tutoring resources** A TIER
- Situation
	- Tutoring OOP at UNSW. I noticed after my first tutorial that students did not feel engaged, and had not completely learnt all the content I had covered in class. I also felt that the given resources were not the best examples of using OOP, and it wasn't clear why a more complicated OOP solution would be used over if or switch statements.
- Task
	- Even though I had run my tutorial as was taught to me in training sessions, I felt that I was not satisfied with my teaching, and I needed to engage my class my class more.
- Action
	- For the following weeks, I researched the patterns I would teach, and found ways of teaching I felt were easier to understand, and more intuitively lead to the desired pattern. I wanted my students to feel like they were discovering the pattern themselves.
	- One example was teaching the decorator pattern. I implemented an armour system for Minecraft with many obvious and subtle code smells. I would ask students what code smells there are and how they could be improved and we would slowly work towards a system that used the decorator pattern. I would then formally explain the decorator pattern.
- Result
	- Tutorials become much more interactive. Students were more engaged and better understood the content. I had great feedback as well.

- Customer Obsession
- Ownership

**2. Workshops Overcommital** B TIER
- Situation
	- As a director at compclub, I was responsible for creating resources for high school workshops. For one of our workshops, I had overcommited myself and my team to a complex project involving pygame which internals team had proposed and required to be completed within only 2 weeks. We were coming up the the deadline, and internals team needed the solution code to be completed in order to create their presentation materials.
- Task
	- I needed to make sure that the solution code, starter code, and instructions were done before the weekend, and that internals had access to the solution code so that they can create their own slides.
- Action
	- I organised an in person bonding and development day with my subcom. We spent about 5 hours together at uni working on these tasks whilst also talking and catching up. By making this a fun experience, the whole team was more excited to learn and work on this project. In the end, we weren't able to complete everything by the end, however, enough was completed for me and my co-director to jointly complete the remaining tasks within a few hours the following day.
- Result
	- In the end, everything had been completed and deployed in time for the work shop. From this, we learnt that 2 weeks is insufficient time, and we communicated this with the internals team so that we could work together in the future.

**3. Simplifying Deployment** B TIER
- Situation
	- Handed over from last year, the compclub website required a manual compilation step for the sass before deployment and viewing. This lead to delays and confusion for developers, and mistakes in deployment.
- Task
	- I wanted to make the process of working with sass easier for developers and for deployment.
- Action
	- I created a simple run script that compiles the sass and runs live-server. I also added a compilation step to the cloud flare deployment. The solutions here were both simple, but were both overlooked by the previous team.
- Result
	- We didn't have any more deployment mistakes relating to sass after this, and our subcommittee were easily able to use the run script to test their work.

**4. Learning API** B Tier
- Situation
	- I was assigned a task that required some new data to be fetched. There are 3 ways to fetch data. We can use a library called Breezejs which is simplest but lacks proper imports and intellisense, we can create a new api in glow, which is fast but slightly more complex, or we an create a new api in dev, which is slightly slower, but more extensible. Glow and Breeze js only have access to the database. Dev has access to a wealth of existing business logic.
	- At the time, I was only aware of the dev and glow options, not of breeze. In my pr I suggested a dev endpoint as it is more extensible with complex logic in the future. My pr comment from a senior dev was to use Breezejs.
- Task
	- I wasn't convinced that breeze was the best option. I wanted to discuss further to either convince my reviewer of my preference for a dev api, or to better understand why breeze was the best choice.
- Action
	- I directly contacted the developer who left the comment with my thoughts. I clearly conveyed why in my opinion a dev pr was better due it its extensibility in a situation which I believe would be extended in the future.
	- This gave way to the senior developer and I discussing the advantages and disadvantages of each approach. I was able to learn a lot about the history of these 3 options, where they have historically been used, and what the goal of these 3 end points is to be in the future. I learnt particularly that BreezeJs support is a key area of work, and typing, imports, and documentation should be more robust in the future.
	- In the end, I used breezejs as suggested, as it was indeed the simplest and fastest solution in terms of developer time, which is for this project what is most important at the moment.
- Result
	- I was able to complete my task quickly and efficiently, but I also learnt a lot about the different approaches within the company.
	- It was not part of a task I was assigned, but I also started making some refactoring suggestion docs for a potential project restructure that the senior developer suggested will be upcoming. This primarily consisted of migrating to only use the composition api for vue, and to primarily utilise glow/ dev apis due to their speed, separation of concerns, and access to business logic. I don't expect this to be followed, but it is something that I will continue to work on and attempt to receive feedback for.

LPS:
- learn and be curious

**5.  Assignment Marking** B TIER
- Situation
	- As a tutor, me and my lab assitant share the marking of assignments. To make sure our marking was consistent and fair, I decided to spend some time at the end of the lab reviewing each other's marking. I realised that my lab assistant was a very harsh marker, and did not give constructive feedback.
- Task
	- I needed to make sure that we both marked consistently.
- Action
	- After seeing his marking. I asked if he was free for 10 to 15 minutes after the lab to dicuss assignment marking, to which he said he was. We both went over the marking guidelines together, and I explained my approach in determining marks for each section. My lab assistant also provided me with some valuable feedback on where I could too give more detail in my feedback, where rather than just stating the error, I should provide examples of where the student made the error.
- Result
	- After a few days, I re-reviewed some of his assignment marking, and we both now had constructive and consistent marking.

**6. Mastercard Intern Project**
- Situation
	- At my internship in mastercard, I was given a project with very little details regarding desired outcomes. We had to build a postman-esque website to enable users to interact with our API.
- Task
	- I needed to complete this project within a few weeks before the end of my internship. I needed to refine the specification, and work together with 2 other members to implement this project.
- Action
	- I spent some time talking with the product manager in our team, however he let me know he was quite overloaded at the moment and this project was of lower priority. I had some experience with the API at the time, and through discussion with the product manager, I understood that the customer of this tool was internal and geared towards onboarding of new developers.
	- Using this, I was able to refine the requirements and decide on what to prioritise. I decided that UI design was not important, and that the focus of this project should be on functionality. Given the limitated time frame and the existing skills of my team, I also decided on using react + MUI on the frontend, and python on the backend as a proxy.
- Result
	- We were able to complete the project, and when demoing this project to some form of upper management, they were very happy with it.

**7.  Chargeable work**
- Situation
	- I had just joined a new team at work and I was assigned a task to implement chargeable overrides, something that is deeply integrating into the rating logic. I was new to both this team's codebase and this team's domain.
- Task
	- I needed to learn the rating domain and codebase well enough to complete my task.
- Action
	- I knew from my past experience in other teams where I could find the code for the frontend package. I was then able to locate the documentation for this project which enabled me to get set up with the right database. I then spent time going through a similar pr from the past to better understand where changes are typically made.
	- I talked with a member of product to provide me with some test cases for my task, which I was able to implement on the backend. This not only gave me a way to confirm whether my work was correct, but also helped me better understand the backend code.
	- I spent time going through the Rating codebase, and was eventually able to find where the chargeable value was accessed. Through this, I was able to determine that we needed a config setting to be set for chargeable values to be used.
- Result
	- Through my investigation, I was able to implement the feature. I also found an issue with the logic of a previous pr regarding chargeable, which I also fixed here.

**8. Extra for group**
- Situation
	- People in a uni group work course team were not correctly performing code reviews which was introducing bugs in our code early on.
- Task
	- I needed to find a way for code review quality to improve.
- Solution
	- I added a pipeline for linting to our project frontend, as well as mandated that PR's require 2 reviews to be merged. The added eye of another reviewer made both reviewers more diligi