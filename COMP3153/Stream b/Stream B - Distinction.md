## B.1
$$a\textbf{B}_1b \equiv \neg b \textbf{U} (a \wedge \textbf{X}(\neg a\textbf))$$
$$\forall n > 1, a\textbf{B}_nb \equiv \textbf{F}(a \wedge \textbf{XB}_{n-1})$$

**Proof**
**Base case**
$a\textbf{B}_1b \equiv \textbf{F}b \wedge \neg b \textbf{U} (a \wedge \textbf{XG} \neg a)$

Here we have $a \wedge \textbf{XG}\neg a$. This means that $a$ must be satisfied and after 1 step, $a$ must never be satisfied again. So, *a is satisfied exactly once*. This would accept a word like `abbbbb...`, but not word like `babbb...`.

Next we have $\neg b \textbf{U}(a \wedge \textbf{XG}\neg a$). That is, $b$ will not be satisfied until *a is satisfied exactly once*. This would accept a word like `abbbbb...` and `ccccabbbbb`, however it would fail to accept words like `cccccccacccc...` where $b$ never occurs. To remedy this we add the condition $\textbf{F}b$ resulting in

$$a\textbf{B}_1b \equiv \textbf{F}b \wedge \neg b \textbf{U} (a \wedge \textbf{XG} \neg a)$$

This would now not accept `cccaaa`

**Inductive case**
Assumption, $aB_nb$ is the operator that specifies that $a$ holds true exactly $n$ times before $b$ holds true.

We have $aB_{n+1}b \equiv \textbf{F}a \wedge a \implies B_{n}$. That is, $a$ occurs eventually and $a$ implies that $a$ holds true exactly $n$ times before $b$ holds true. So we have that $aB_{n+1}b$ is equivalent to $a$ occurring $n+1$ times before $b$ holds true.

## B.2
Algorithm:
$$\phi \wedge \varphi = \text{if } b_1 \text{ then } \phi_1 \wedge \varphi_1 \text{ else } \phi_2 \wedge \varphi_2$$
We know that these are $OBDD$'s and not $ROBDD$'s, so we can assume that they are full at all levels. If the n'th level has $w_a$ nodes, then $w_a = $ 