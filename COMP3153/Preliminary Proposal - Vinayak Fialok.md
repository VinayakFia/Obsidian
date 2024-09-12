> [!info] [Pdf](file:///C:/Users/vinay/Downloads/COMP3153-A.1P-1.pdf)

- [ ] COMP3153 - Preliminary Model 📅 2024-09-13

## SCATS - Sydney Coordinated Adaptive Traffic System

## Overview

> [!info] For more information about [SCATS](https://en.wikipedia.org/wiki/Sydney_Coordinated_Adaptive_Traffic_System)

I propose to model a traffic light system based on SCATS. The traffic light system will run on a common, *small* intersection setup as below:

![[COMP3153 Exalidraw.excalidraw|1000px]]
> [!note] For simplicity, and only for now, cars can only cross straight.

We have several key components here:

| Name                  | Count                                             | States                                                                                                     |
| --------------------- | ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Traffic Light         | 4                                                 | For simplicity, I have decided to settle on a traffic light with only three states: Red, amber, and green. |
| Pedestrian Light      | 4                                                 | These will have 2 states, Red and Green.                                                                   |
| Pedestrian(s) Present | 8 (can be simplified to 4, one for each crossing) | These will have 2 states, present, and not present.                                                        |
| Car Sensor            | 4                                                 | These will have 2 states, present, and not present.                                                        |
All together, this leads to a system that is much more complex, and have many more states than a simple traffic light system.

### Implementation Details
This will be run on a tick based simulation, where a tick is analogous to a second. We will have some random non-deterministic variables:
1. Cars arriving at each intersection. For example, we can choose to have a 20% chance of a car arriving at any intersection each tick.
2. Pedestrians arriving at each crossing. For example, we can choose to have a 10% chance of a pedestrian arriving at any crossing with the intent of travelling some direction (there are 8 choices here).

We also have some additional states here as a result of entities in our system taking action:
1. Cars crossing / remaining stationary.
2. Pedestrians crossing / remaining stationary.

Some safety properties we can validate here include:
1. No perpendicular traffic lights should be green or amber simultaneously.
2. Pedestrian lights must be red if an opposing traffic light is green.

Some liveliness properties we can validate here include:
1. Cars must be able to cross within 5 minutes of arrival.
2. All pedestrians must eventually be able to cross the road.

### Extensibility
1. Previously I mentioned that cars can only cross the intersection straight. We can introduce a new traffic light which enables cars to cross left and right as well. This will **significantly** increase complexity. However, will lead to a more useful model. **My aim is to validate such a system in the end!**. This also leads to more safety properties to validate for pedestrians and cars. However, this also leads to a two lane road, which undoubtably may increase complexity too much.
2. As an add on to the above, or more likely, an alternative: TOpen green light. In such a light, cars may cross right, buy only if there is no other cars impeding their path. This is very interesting, as it may lead to certain scenarios where a crossing is bottle necked by cars turning right.