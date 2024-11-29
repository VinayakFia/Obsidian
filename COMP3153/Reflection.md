## stream a reflection
I believe that my specification was quite complex, however, after implementing, there were several simplifications made. These simplifications were primarily *removing* the use of channels, and using shared state instead. I found that the use of channels lead to very complex states, whereas the use of shared state was much simpler. This did reduce the amount of states in my system, however, the important states, that is, the states that users of the traffic light will be able to see, were all kept. Moreover, the key aspects of the SCATS system were maintained.

My first implementation of the system was done through channels. This lead to many more states than

## self-assessment
I did not complete all HD tasks (e.g. stream B HD was not 100% completed), however, I made a strong attempt at all tasks regardless of grade, and did complete HD tasks for Stream A. I also did spend many many hours learning and programming promela, and made my system effectively. I did have to change my implementation from using signals to using shared arrays, however this did not change the important states, and importantly actually worked.

I believe that this lines up with a low HD (85-90) or a higher D (80-90).

## reflections on the unit
Through this unit, I have learnt how to model systems in promela, model real life systems with structures, design and evaluate CTL/LTL formulae, and much more. I've developed my ability to self-learn, and learn from formatif feedback. Overall, this has been a very interesting course, and I hope to do more research and study of formal verification in my free time in the future.