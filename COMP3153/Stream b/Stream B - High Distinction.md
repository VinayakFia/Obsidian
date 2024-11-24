#### Part A
> For all n, exactly one of An or Bn satisfies the LTL formula: $FGp$. With justification, which structure(s) do and which structures do not?

Consider $A_0$:
![[Pasted image 20241115151228.png]]
Lets call the node on the left $q_0$ and the node on the right $q_1$. We may go on the infinite cycle $q_0 \rightarrow q_1 \rightarrow q_0 \rightarrow q_1 ...$ . Here the requirement $\textbf{FG}p$, that is, *eventually $p$ will always be satisfied is not held*. **So, $A_n$ does not satisfy $\textbf{FG}p$.**

Consider $B$, lets start with the base case $B_0$:
![[Pasted image 20241115151621.png]]
Here, after 1 step, $p$ will always be satisfied as there is a loop on the rhs node.

Going with an induction approach, lets assume that $B_{n-1}$ satisfies $\textbf{FG}p$. Does $B_{n}$ satisfy $\textbf{FG}p$? Lets consider $B_n$:
![[Pasted image 20241115151805.png]]
Lets call the lhs node $q_0$ and the rhs node $q_1$. After 1 step we reach $q_1$. Here, we either loop forever at $q_1$ which satisfies $\textbf{FG}p$, or we eventually go to $B_{n-1}$, which satisfied $\textbf{FG}p$ according to the inductive hypothesis.

**As such, $B_n$ satisfies $\textbf{FG}p$.**

#### Part B
**Base Case**
Given that $|\alpha|=1$
$$A_{\geq1} \models \alpha \iff B_{\geq1} \models \alpha$$
We have 3 cases here, $\alpha = true$ (this trivially satisfies our requirement as $A_1$ and $B_1$ would both always be true), $\alpha=p$ and $\alpha \neq p$.
**A_1**
![[Pasted image 20241123184628.png]]
**B_1**
![[Pasted image 20241123185008.png]]

*First lets consider $a = p$*.
This can not be satisfied for $A_1$ or $B_1$ as the first state is the empty set $\emptyset$. As such our condition $A_1 \models \alpha \iff B_1 \models \alpha$ trivially holds true.

*Next lets consider $a \neq p$*.
Here $A_1$ and $B_1$ are always satisfy our CTL formula. Again, it trivially holds true.

**Inductive hypothesis**
Assume that $A_j \models \alpha \iff B_j \models \alpha$ holds for $|a| = k, j \geq k$. (IH)

**Recursive case**
*Case 1: $\alpha$ is a state formula*
*Case 1.1 $\textbf{X}\alpha$*
*Case 1.1.1 suppose $X\alpha$ holds for $B_{k+1}$, prove that $X\alpha$ holds true for $A_{k+1}$*
![[Pasted image 20241123213239.png]]
lets call the rhs state be $q_2\{p\}$ and the lhs state be $q_1{\emptyset}$. The only difference between $B_{k+1}$ and $A_{k+1}$ is that $q_2$ in $A_{k+1}$ has an edge to $q_1$, which is the case for $B_{k+1}$. **All cases other than taking this edge satisfy $\textbf{X}a$ since the behaviour would be the same as $B_{k+1}$.** Now, if the edge was followed, we would simply return to the initial state, we are now left with, does $\alpha$ hold for $A_{k+1}$? Well, from our IH, $\alpha$ holds for all $A_j$ where $j > k$. In this case, $j=k+1$, so $A_{k+1}$ satisfies $\alpha$.

*Case 1.1.2 suppose $X\alpha$ does not hold for $B_{k+1}$, prove that $X\alpha$ does not hold for $A_{k+1}$*
Like *1.1.1*, we are left to prove that $\alpha$ does not hold for $A_{k+1}$. From our IH, $A_{\geq k}$ would not hold since $B_{\geq k}$ does not hold. So, $A_{k+1}$ does not satisfy $\alpha$.

*Case 1.2* $F\alpha$
*Case 1.1.1 suppose $F\alpha$ holds for $B_{k+1}$, prove that $F\alpha$ holds for $A_{k+1}$*
The only reason that $F\alpha$ would not be satisfied in $A_{k+1}$ is if the loop of $q_1, q_2$ causes the LTL to be not satisfied. We know that this is not the case as $B_k$ holds true.