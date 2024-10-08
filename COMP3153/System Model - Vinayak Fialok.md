# SCATS - Sydney Coordinated Adaptive Traffic System

## Overview

> [!info] For more information about [SCATS](https://en.wikipedia.org/wiki/Sydney_Coordinated_Adaptive_Traffic_System)

I propose to model a traffic light system based on SCATS. Unfortunately, SCATS will not show me they're proprietary algorithm, so I will be making a simplified estimation based on experience and research. The traffic light system will run on a common, *small* intersection setup as below:

![[COMP3153 Exalidraw.excalidraw|1000px]]

For simplicity, cars can only cross straight.

## A.2C Potential Abstractions/Specifications Considered
- **Abstracting traffic light logic to let traffic lights just go green one after another.** This is easy to implement, however, it has little utility and is not every useful or complex.
- **Allowing left turns on a green light.** Although this is part of a possible extension to the system, I have chosen to not integrate it just now as it increases the states and signals required for the system.
- **Abstracting the timer away so everything just lasts 1 tick.** Although this does allows us to model the system more simply without losing significant simplicity, I have chosen to allow timers for the traffic lights as it allows more complexity for safety properties to be violated.
- **Car + pedestrian travel time.** I have chosen not to model this as it does not significantly impact safety. It can be accounted for by extending the tick, introducing amber/blinking red lights into the pedestrian light, and finally disallowing cars from crossing in the amber light.
## Implementation Details
### Non-determinism
This will be run on a tick based simulation, where a tick is analogous to a second. We will have some random non-deterministic variables:
1. Cars arriving at each intersection. For example, we can choose to have a 20% chance of a car arriving at any intersection each tick.
2. Pedestrians arriving at each crossing. For example, we can choose to have a 10% chance of a pedestrian arriving at any crossing with the intent of travelling some direction (there are 8 choices here).
### State Diagrams
#### Channels
We will have a channel for each traffic light $t_1, t_2, t_3, t_4$ named $ct_1, ct_2, ct_3, ct_4$. We also have channels for each pair of pedestrian lights named $pc_1, pc_2, pc_3, pc_4$.
- Let the `broadcast(signal)` function send `signal` to all channels.
- Let the `ct_x(signal)` function send `signal` to $ct_x$. E.g. the `ct_1(signal!)` sends signal `signal!` to $ct_1$. Same with function `pc_x(signal)`.
#### Simplification of Design <- A.2HD Design Decision
We can simplify the 4 traffic lights + 4 pedestrian lights into 2 pairs of traffic lights and pedestrian lights. This is because when a traffic light is activated, so too can the opposing traffic light be activated.
As such, we can simplify our channels into:
- $ct_1, ct_2$ where $ct_1$ serves a pair of opposing traffic lights and $ct_2$ represents the perpendicular pair of traffic lights.
- similarly $pc_1, pc_2$.
We also reduce our required components to just:
- $t_1, t_2$ for the 2 pairs of traffic lights.
- $p_1, p_2$ for the 2 pairs of pedestrian lights.
- $ps_1, ps_2$ for the 2 pairs of pedestrian signals.
- $cs_1, cs_2$ for the 2 pairs of car signals.
By doing so, we maintain the functionality and properties of the system, whilst reducing the complexity of it significantly.

> [!info] Alternative approaches
> The alternative to this is to model a system with 4 traffic lights and 4 pedestrian lights. This is possible through a few more signals, and several more states. However, it does not increase the utility of the system nor the depth of the requirements.
#### Car Sensor
Every time a car arrives, the car sensor emits the `car` signal to its corresponding traffic light. I.e. $car\_sensor_i$ will emit `ct_i(car)`.
#### Traffic Light
**Variables**
`uint car = 0;`
`uint timer = 0;`
Every tick in the `green`, `greenInfinity`, and `amber` states, the `car` and `timer` variables are decremented by 1.

**Signals**
- *stop*: indicates a traffic light has turned green
- *ready*: indicates a traffic light is ready to go. Note that every state consumes the `ready` signal looping back to itself unless another transition is specified. For simplicity, I have not added this to the below diagram.
- *car*: indicates a car has arrived
- *go*: indicates a traffic light has finished being green and another may go

```mermaid
stateDiagram-v2
	state after_amber <<choice>>

	[*] --> waiting
	waiting --> stopped : stop?
	stopped --> stoppedCar : car?, car++
	stopped --> waiting : go?
	stoppedCar --> ready : go?, broadcast(ready!)
	stoppedCar --> stoppedCar : car?, car++
	waiting --> ready : car?, car++, broadcast(ready!)
	ready --> greenInfinity : broadcast(stop!)
	ready --> stoppedCar : stop?
	ready --> ready : car?, car++
	greenInfinity --> green : ready?, timer = 5
	green --> amber : timer = 3
	amber --> after_amber : broadcast(go!)
	after_amber --> ready : when car > 0, broadcast(ready!)
	after_amber --> waiting : when car = 0
```

#### Pedestrian Signal
Whenever the pedestrian button is clicked, we will send a `p` signal to the corresponding pedestrian light pair.
#### Pedestrian Light
Although there are 8 pedestrian lights, we can reduce this 2 pairs of perpendicular pedestrian lights. In the end, we have a state diagram very similar to that of traffic lights.
```mermaid
---
title: Pedestrian Light 1
---
stateDiagram-v2
	state after_green <<choice>>

	[*] --> waiting
	waiting --> stopped : stop?
	stopped --> stoppedPedestrian : p?, p++
	stopped --> waiting : go?
	waiting --> ready : p?, p++
	stoppedPedestrian --> ready : go?
	ready --> stoppedPedestrian : stop?
	ready --> green : ct_2(stop!), timer = 5
	green --> after_green
	after_green --> waiting : when p = 0
	after_green --> ready : when p > 0
```
## Specification
### Safety Properties
1. No perpendicular traffic lights should be green or amber simultaneously.
2. Pedestrian lights must be red if an opposing traffic light is green.
3. A green light shall never be triggered if there are no pedestrians/cars waiting.\
### Liveliness Properties <- A.2D
1. Eventually, all cars will be able to cross.
2. Eventually, all pedestrians will be able to cross.
## Extensibility
1. Previously I mentioned that cars can only cross the intersection straight. We can introduce a new traffic light which enables cars to cross left and right as well. This will **significantly** increase complexity. However, will lead to a more useful model. **My aim is to validate such a system in the end!**. This also leads to more safety properties to validate for pedestrians and cars.
2. As an add on to the above, or more likely, an alternative: The open green light with turns allowed. In such a light, cars may cross right and left, buy only if there is no other cars or pedestrians impeding their path. This is very interesting, as it may lead to certain scenarios where a crossing is bottle necked by cars turning right.
3. Diagonal pedestrian lights. Pedestrians may arrives and wish to cross diagonally.