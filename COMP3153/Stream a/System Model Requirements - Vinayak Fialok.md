> [!note] I abstracted my model so that the number of cars waiting was maxed at 1 in order to enable promela to verify. When attempting to verify without this abstraction, it would not run and tell me there were too many states.

## Requirement 1
**Safety property: perpendicular lights should not be green or amber at the same time.**

Here I'll have 2 LTL's one for traffic lights and one for pedestrian and traffic lights. Note that these can easily be combined into 1 LTL with a $\wedge$ if required.

*For traffic lights*
We have variables $\alpha$ and $\beta$:
1. $\alpha$ is light 1 is green or amber
2. $\beta$ is light 2 is green or amber
We have the LTL formula:
$$\textbf{G}(\neg(\alpha \wedge \beta))$$
That is, $\alpha$ and $\beta$ will never be true simultaneously. That is, light 1 is never green or amber at the same time light 2 is green or amber.

*For pedestrian lights*
We have the additional variables $c, d$:
3. $c$ is pedestrian light 1 is green (where pedestrian light 1 crosses traffic light 1)
4. $d$ is pedestrian light 2 is green (where pedestrian light 2 crosses traffic light 2)
$$\textbf{G}(\neg(\alpha \wedge c)) \wedge \textbf{G}(\neg(\beta \wedge d))$$
This formula ensures that pedestrian lights that cross in the path of traffic lights are not allowing pedestrians through while the traffic light is on.

*Combined Formula*
Combining the above formulas we get:
$$\textbf{G}(\neg(\alpha \wedge \beta)) \wedge \textbf{G}(\neg(\alpha \wedge c)) \wedge \textbf{G}(\neg(\beta \wedge d))$$

Expressed as a never claim we have the below:
```c
never {
  do
  :: ((LStates[0] != RED && LStates[1] != RED) || (PStates[0] != RED && LStates[1] != RED) || (PStates[1] != RED && LStates[0] != RED));
  od;
}
```

This requirement has also been programmed in promela as a safety process. This was my initial idea before I understood how never worked.
```c
proctype Safety() {
  do
  // Perpendicular lights should not be on at the same time
  :: assert(!(LStates[0] == GREEN && LStates[1] == GREEN));
  :: assert(!(LStates[0] == AMBER && LStates[1] == AMBER));
  :: assert(!(LStates[0] == AMBER && LStates[1] == GREEN));
  :: assert(!(LStates[0] == GREEN && LStates[1] == AMBER));

  // Perpendicular pedestrian and traffic lights should not be on at the same time
  :: assert(!(PStates[0] == GREEN && LStates[1] == GREEN));
  :: assert(!(PStates[1] == GREEN && LStates[0] == GREEN));
  od
}
```

## Requirement 2
**Liveliness property: If a car arrives at a light, it should eventually be let through.**

We have the LTL formula:
$$\textbf{F}a \implies \textbf{F}(a\wedge\textbf{F}(\neg a))$$
Where $\alpha$ refers to light 1 having  more than 0 cars waiting. *In my abstract model, this refers to light 1 having a car waiting*.
This requirement states that *if* a car arrives at light 1, then that car will eventually leave. We can easily modify this formula for light 2 by using index 1 instead of 0 in our condition $a$.

A never claim for this would be the opposite of this, that is, eventually a car will always be present at light 0:
$$\textbf{FG}a$$

In promela we have:
```c
never { /* FGa */
T0_init :    /* init */
	if
	:: (Cars[0] == false) -> goto T0_init
	:: (Cars[0] == true) -> goto arrived
	fi;
arrived:    /* 1 */
	if
	:: (Cars[0] == true) -> goto arrived;
	fi;
}
```