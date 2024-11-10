## B.1
$$aB_1b \equiv \textbf{F}a \wedge (a \implies \textbf{G}\neg a \wedge \textbf{F} b)$$
$$\forall n > 1, aB_nb \equiv \textbf{F}a \wedge a \implies B_{n-1}$$

**Proof**
**Base case**
$aB_1b \equiv \textbf{F}a \wedge (a \implies \textbf{G}\neg a \wedge \textbf{F} b)$. $B_1$ should satisfy that a holds true exactly one time on a path before $b$ hols true. This is equivalent to $a$ holding true eventually and given that $a$ holds true, $a$ is always false and $b$ eventually holds true.

**Inductive case**
Assumption, $aB_nb$ is the operator that specifies that $a$ holds true exactly $n$ times before $b$ holds true.

We have $aB_nb \equiv \textbf{F}a \wedge a \implies B_{n-1}$. That is, $a$ occurs eventually and $a$ implies that 