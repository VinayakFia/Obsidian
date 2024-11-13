## B.1
![[Pasted image 20241111211751.png]]
we start at q1 which represents the odd position. Here, we only accept b and c moving to q2. Once at q2, which represents the even position, we can also accept a to go pack to the odd position.

For example, with string 'abc' starting at q1, we cannot go anywhere as the odd position does not accept a.  
  
With string 'bac', we accept b to go to q2, then accept a to go to q1, then accept c to go back to q2
## B.2
![[Pasted image 20241110152103.png]]

#### Part a
1. **XX**b
that is, for all starting paths from $q_0$
- after 2 steps
- satisfies $b$

*Not satisfied.*

Consider $q_0$ -> $q_1$ -> $q_2$, where $q_2$ does not have $b$ in its proposition set.

2. a**U**c
that is, for all paths starting from $q_0$
- $a$ is satisfied in all steps until we reach $c$

*This is not satisfied.*

Consider the cycle $q_0 \rightarrow q_1 \rightarrow q_4 \rightarrow q_0$. If this cycle were to occur infinitely, we would never satisfy $c$, and as such we would never satisfy $a\textbf{U}c$.

3. **GF**b
that is, for all paths starting from $q_0$, $b$ occurs infinitely often.

*This is satisfied*, it can be seen by noting that $q4$ is part of every cycle and will always eventually be reached. As such $b$ will occur infinitely often.

#### Part b
1. **AXEX**b
that is, starting from $q_0$
- for all paths
- after 1 step
- there exists a path
- after 1 step
- contains b in the proposition set

*This is satisfied*

The only path from $q_0$ in one step is to get to $q_1$. As such, we can simplify our requirements to *from $q_1$, there exists a path after 1 step that contains $b$ in the proposition set*. We can see that after 1 step from $q_1$, we can arrive at $q_4$ which has $b$ in its proposition set. As such, we have satisfied the LTL formula.

2. **E**a**U**c
that is, from $q_0$:
- there exists $a$ path
- that satisfies $a$ before it satisfies $c$

*This is satisfied*

The path starting from $q_0$:  $q_0 \rightarrow q_1 \rightarrow q_2$ satisfies $a$ until it reaches $q_2$ which satisfies $c$. So, there exists a path from $q_0$ where $a\textbf{U}c$ is satisfied, and as such we have satisfied the LTL.

3. **EGAF**b
that is, starting from $q_0$:
- there exists a path
- for each state in the path
- for all paths
- eventually the path will satisfy $b$

*This is satisfied*

This problem is equivalant to *for all states, all paths will eventually satisfy b*. $q4$ is part of every cycle and will always eventually be reached. As such $b$ will eventually occur for all paths from all states.

## B.3
a) paths that contain at least two a:
$$\textbf{F}(a∧\textbf{XF}a)$$
Eventually a must be satisfied, and after 1 step, a must be satisfied again eventually. As such, a must be satisfied at least twice.

b) paths that contain at least one a before the first b; We can rewrite this as *we do not encounter a $b$ before $a$ if we counter a b* which can be expressed as.
$$\textbf{F}b \implies\neg b \textbf{U} a$$
Consider the string `aaaa`, this would be accepted as the LHS of the implication is false.
Consider the string `cccc`, this would be accepted as the LHS of the implication is false.
Consider the string `bbbb...`, this would not be accepted as the LHS is true so $\neg b \textbf{U} a$ must be true, however $a$ is not satisfied.
Consider the string `caccccb`, this would be accepted as the LHS is true and until we reach an $a$ no $b$'s are found.
Consider the string `ccbaaa...`, this would not be accepted as the LHS of the implication is true, but $\neg b$ is satisfied at position $b$.

c) paths that eventually do not contain a c. that is, eventually, c will never again be satisfied, we can express this as: 
$$\textbf{FG}\neg c$$

## B.4
Construct an OBDD for $f(x, y, z) = (x ∨ y ∨ z) ∧ (¬x ∨ ¬y ∨ ¬z)$

**Table**

| x   | y   | z   | (x ∨ y ∨ z) ∧ (¬x ∨ ¬y ∨ ¬z) |
| --- | --- | --- | ---------------------------- |
| F   | F   | F   | F                            |
| F   | F   | T   | T                            |
| F   | T   | F   | T                            |
| F   | T   | T   | T                            |
| T   | F   | F   | T                            |
| T   | F   | T   | T                            |
| T   | T   | F   | T                            |
| T   | T   | T   | F                            |

**Diagram**

**Full OBDD**
```mermaid
stateDiagram-v2
	y0 : y
	y1 : y

	z0 : z
	z1 : z
	z2 : z
	z3 : z
		
	F0 : F
	F1 : F
	T0 : T 
	T1 : T
	T2 : T
	T3 : T
	T4 : T
	T5 : T

	x --> y0 : F
	x --> y1 : T

	y0 --> z0 : F
	y0 --> z1 : T
	y1 --> z2 : F
	y1 --> z3 : T

	z0 --> F0 : F
	z0 --> T0 : T
	z1 --> T1 : F
	z1 --> T2 : T
	z2 --> T3 : F
	z2 --> T4 : T
	z3 --> T5 : F
	z3 --> F1 : T
```

**ROBDD**
![[Pasted image 20241112202021.png]]
![[Pasted image 20241112202028.png]]