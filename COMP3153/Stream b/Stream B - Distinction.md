## B.1
$$a\textbf{B}_1b \equiv \neg b \textbf{U} (a \wedge \textbf{X}(\neg a\textbf{U}b))$$
$$\forall n > 1, a\textbf{B}_nb \equiv \textbf{F}(a \wedge \textbf{XB}_{n-1})$$

**Proof**
**Base case**
$a\textbf{B}_1b \equiv \wedge \neg b \textbf{U} (a \wedge \textbf{X}(\neg a\textbf{U}b)$

Firstly we have $a \wedge \textbf{X}(\neg a \textbf{U} b)$. This means that $a$ must be satisfied and after 1 step, $a$ must not be satisfied until $b$. So, $a$ must be satisfied now, and never again until $b$ is satisfied. This accepts words like `abbbaa` and `accccb` but not `cccab` which should be accepted.

$\neg b \textbf{U} (a \wedge \textbf{X}(\neg a\textbf{U}b)$. This requires $b$ does not occur until

$$a\textbf{B}_1b \equiv \textbf{F}b \wedge \neg b \textbf{U} (a \wedge \textbf{XG} \neg a)$$

This would now not accept `cccaaa`

**Inductive case**
Assumption, $aB_nb$ is the operator that specifies that $a$ holds true exactly $n$ times before $b$ holds true.

We have $aB_{n+1}b \equiv \textbf{F}a \wedge a \implies B_{n}$. That is, $a$ occurs eventually and $a$ implies that $a$ holds true exactly $n$ times before $b$ holds true. So we have that $aB_{n+1}b$ is equivalent to $a$ occurring $n+1$ times before $b$ holds true.

## B.2
Algorithm:
$$\phi \wedge \varphi = \text{if } b_1 \text{ then } \phi_1 \wedge \varphi_1 \text{ else } \phi_2 \wedge \varphi_2$$
We know that these are $OBDD$'s and not $ROBDD$'s, so we can assume that they are full at all levels. If the n'th level has $w_a$ nodes, then $w_a = $ 