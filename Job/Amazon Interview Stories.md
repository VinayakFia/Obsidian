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

**4. Learning** B Tier
- Situation
	- I was assigned a task that required some new data to be fetched. There are 3 ways to fetch data. We can use a library called Breezejs which is simplest but lacks proper imports and intellisense, we can create a new api in glow, which is fast but slightly more complex, or we an create a new api in dev, which is slightly slower, but more extensible. Glow and Breeze js only have access to the database. Dev has access to a wealth of existing business logic.
	- At the time, I was only aware of the dev and glow options, not of breeze. In my pr I suggested a dev endpoint as it is more extensible with complex logic in the future. My pr comment from a senior dev was to use Breezejs.
- Task
	- I wasn't convinced that breeze was the best option. I wanted to discuss further to either convince my reviewer of my preference for a dev api, or to better understand why breeze was the best choice.
- Action
	- I directly contacted the developer who left the comment with my thoughts. I clearly conveyed why in my opinion a dev pr was better due it its extensibility in a situation which I believe would be extended in the future.
	- This gave way to the senior developer and I discussing the advantages and disadvantages of each approach. I was able to learn a lot about the history of these 3 options, where they have historically been used, and what the goal of these 3 end points is to be in the future.
	- In the end, I use breezejs as suggested, as it was indeed the simplest and fastest solution in terms fo, which is for this project
