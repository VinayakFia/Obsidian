> [!info] [Pdf](file:///C:/Users/vinay/Downloads/COMP3153-A.1P-1.pdf)

- [ ] COMP3153 - Preliminary Model 📅 2024-09-13

## SCATS - Sydney Coordinated Adaptive Traffic System

## Overview

> [!info] For more information about [SCATS](https://en.wikipedia.org/wiki/Sydney_Coordinated_Adaptive_Traffic_System)

I propose to model a traffic light system based on SCATS. The traffic light system will run on a common, *small* intersection setup as below:

![[COMP3153 Exalidraw.excalidraw|1000px]]

We have several key components here:

| Name                  | Count                                             | States                                                                                                     |
| --------------------- | ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Traffic Light         | 4                                                 | For simplicity, I have decided to settle on a traffic light with only three states: Red, amber, and green. |
| Pedestrian Light      | 4                                                 | These will have 2 states, Red and Green.                                                                   |
| Pedestrian(s) Present | 8 (can be simplified to 4, one for each crossing) | These will have 2 states, present, and not present.                                                        |
| Car Sensor            | 4                                                 | These will have 2 states, present, and not present.                                                        |
All together, this leads to a system that is much more complex, and have many more states than a simple traffic light system.

### Implementation Details
This will be run on a tick based simulation, where a tick is analogous to a second. We will have several non-deterministic transitions