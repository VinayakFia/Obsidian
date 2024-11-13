## B.1
$$a\textbf{B}_1b \equiv \textbf{F}b \wedge \neg b \textbf{U} (a \wedge \textbf{XG} \neg a)$$
$$\forall n > 1, a\textbf{B}_nb \equiv \textbf{F}(a \wedge \textbf{XB}_{n-1})$$

**Proof**
**Base case**
$a\textbf{B}_1b \equiv \textbf{F}b \wedge \neg b \textbf{U} (a \wedge \textbf{XG} \neg a)$

Here we have $a \wedge \textbf{XG}\neg a$. This means that $a$ must be satisfied and after 1 step, $a$ must never be satisfied again. So, *a is satisfied exactly once*.

Next we have $\neg b \textbf{U}(a \wedge \textbf{XG}\neg a$). That is, $b$ will not be satisfied until *a is satisfied exactly once*.

$a\textbf{B}_1b \equiv \textbf{F}(a \wedge \textbf{XG}\neg a)$. $\texbf{B}_1$ should satisfy that $a$ holds true exactly one time on a path before $b$ holds true. This is equivalent to $a$ holding true eventually and given that $a$ holds true, $a$ is always false and $b$ eventually holds true.

**Inductive case**
Assumption, $aB_nb$ is the operator that specifies that $a$ holds true exactly $n$ times before $b$ holds true.

We have $aB_{n+1}b \equiv \textbf{F}a \wedge a \implies B_{n}$. That is, $a$ occurs eventually and $a$ implies that $a$ holds true exactly $n$ times before $b$ holds true. So we have that $aB_{n+1}b$ is equivalent to $a$ occurring $n+1$ times before $b$ holds true.

## B.2
Algorithm:
$$\phi \wedge \varphi = \text{if } b_1 \text{ then } \phi_1 \wedge \varphi_1 \text{ else } \phi_2 \wedge \varphi_2$$
We know that these are $OBDD$'s and not $ROBDD$'s, so we can assume that they are full at all levels. If the n'th level has $w_a$ nodes, then $w_a = $ 