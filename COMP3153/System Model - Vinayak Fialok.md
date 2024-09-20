## SCATS - Sydney Coordinated Adaptive Traffic System

## Overview

> [!info] For more information about [SCATS](https://en.wikipedia.org/wiki/Sydney_Coordinated_Adaptive_Traffic_System)

I propose to model a traffic light system based on SCATS. Unfortunately, SCATS will not show me they're proprietary algorithm, so I will be making a simplified estimation based on experience and research. The traffic light system will run on a common, *small* intersection setup as below:

![[COMP3153 Exalidraw.excalidraw|1000px]]
For simplicity, cars can only cross straight.

## Implementation Details
This will be run on a tick based simulation, where a tick is analogous to a second. We will have some random non-deterministic variables:
1. Cars arriving at each intersection. For example, we can choose to have a 20% chance of a car arriving at any intersection each tick.
2. Pedestrians arriving at each crossing. For example, we can choose to have a 10% chance of a pedestrian arriving at any crossing with the intent of travelling some direction (there are 8 choices here).


## State Diagrams
#### Channels
We will have a channel for each traffic light $t_1, t_2, t_3, t_4$ named $ct_1, ct_2, ct_3, ct_4$.
- Let the `broadcast(signal)` function send `signal` to all channels.
- Let the `ct_x(signal)` function send `signal` to $ct_x$. E.g. the `ct_1(signal!)` sends signal `signal!` to $ct_1$.

#### Car Sensor
Every time a car arrives, the car sensor emits the `car` signal to its corresponding traffic light. I.e. $car\_sensor_i$ will emit `ct_x(car)`.

#### Traffic Light
**Variables**
`uint car = 0;`
`uint timer = 0;`
Every tick in the `green`, `greenInfinity`, and `amber` states, the `car` and `timer` variables are decremented by 1.

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
	amber --> after_amber
	after_amber --> ready : when car > 0, broadcast(ready!)
	after_amber --> waiting : when car = 0
```
#### Car Sensor
The input stream of the car sensor diagram is the the form `(c|n)+` where `c` indicates a car is on the sensor this tick and `n` indicates no car car is on the sensor. This will be important for the traffic light diagram as well

```mermaid
---
title: Car Sensor Diagram
---
stateDiagram-v2
	direction LR
	n: No Cars
	c: Has Cars
	[*] --> n
	n --> c : c
	n --> n : n
	c --> n : n
	c --> c : c
```

#### Traffic Light
Traffic lights ONLY turn green when there are cars waiting to go. Additionally, traffic lights stay green for 3 tick, in which 1 car may go per tick. After 2 tick, they turn yellow, after that tick they turn red.

> [!INFO] Tick order of green/yellow traffic light:
> 1. Cars randomly arrive.
> 	1. If a car arrives at a green or yellow light, and there are no cars at that light, it may immediately go.
> 	2. If a car arrives at a green or yellow light, it must wait in the queue.
> 2. The first car leaves.
> 3. Cars shuffle up the queue.
> 4. The sensor updates its state, if there are cars waiting it remains as `Has Cars`, otherwise it turns to `No Cars`.
> 5. The traffic light timer **t** is decremented.

```mermaid
---
title: Traffic Light Diagram
---
stateDiagram-v2
	direction LR
	[*] --> Red
	Red --> Red
	Red --> Green
	Green --> Yellow : timer
	Yellow --> Red : timer
```

#### Traffic Light and Sensor Combined Diagram
```mermaid
---
title: Traffic Light and Car Sensor Diagram
---
stateDiagram-v2
	direction LR
	ng: No Cars, Green
	nr: No Cars, Red
	ny: No Cars, Yellow
	hg: Has Cars, Green
	hr: Has Cars, Red
	hy: Has Cars, Yellow
	[*] --> nr
	nr --> hr : c
	hr --> hr : c
	hr --> hg
	hg --> hy : timer, c
	hg --> ny : timer, n
	ny --> nr : timer
	hy --> hr : timer, c
```

#### Pedestrian Sensor
The input stream for the pedestrian sensor is in the form `(p|pn)` where `p` represents a pedestrian pressing the button that tick and `pn` represents the button not being pressed that tick.
```mermaid
---
title: Pedestrian Sensor
---
stateDiagram-v2
	direction LR
	n: No Pedestrians
	p: Has Pedestrians
	[*] --> n
	n --> n : pn
	n --> p : p
	p --> p : p
	p --> p : pn
```

#### Pedestrian Light
Pedestrian lights stay green for 1 tick in which all pedestrians can cross.

> [!INFO] Tick order of pedestrians on green light
> 1. Light turns green
> 2. All pedestrians cross
> 3. Light turns red

```mermaid
---
title: Pedestrian Light Diagram
---
stateDiagram-v2
	direction LR
	[*] --> Red
	Red --> Green
	Green --> Red : timer
```

#### Pedestrian Light and Sensor Diagram
```mermaid
---
title: Pedestrian Light and Sensor Diagram
---
stateDiagram-v2
	direction LR
	nr: No Pedestrians, Red
	ng: No Pedestrians, Green
	pr: Pedestrians, Red
	pg: Pedestrians, Green
	[*] --> nr
	nr --> nr : pn
	nr --> pr : p
	pr --> pg
	pg --> nr : timer
```

#### Whole System
There are some unfilled state transitions here, e.g. (Pedestrians, Red) --> (Pedestrians, Green) and (Has Cars, Red) --> (Has Cars, Green). This is because they are based upon the other lights.

## REMOVE
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
2. As an add on to the above, or more likely, an alternative: The open green light with turns allowed. In such a light, cars may cross right and left, buy only if there is no other cars or pedestrians impeding their path. This is very interesting, as it may lead to certain scenarios where a crossing is bottle necked by cars turning right.