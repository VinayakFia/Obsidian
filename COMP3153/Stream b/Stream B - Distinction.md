## B.1
$$\alpha\textbf{B}_1\beta ≡ (¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$$
$$\forall n > 1, a\textbf{B}_nb \equiv $$

**Proof**
**Base case**
$\alpha\textbf{B}_1\beta ≡ (¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$

Firstly lets see $(\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$, lets call this formula (1). This means that $\alpha$ is satisfied now and that after 1 step $\alpha$  is not seen until $\beta$. *That is, $\alpha$ occurs now, and never again until $\beta$*.

Next lets see the whole formula $(¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$. This means that both $\alpha$ and $\beta$ are not seen until (1) is satisfied. *That is, $\alpha$ and $\beta$ are not seen until $\alpha$ occurs and does not occur again until $\beta$*.

In practice: (let position 1 of the word be the first letter)
- `aab...`. (1) is satisfied position 2 since $\alpha$ occurs and $\neg \alpha \textbf{U} \beta$ is satisfied at position 3. However, $\neg \alpha \wedge \neg \beta$ is not satisfied at position 1. *So this word is rejected.*
- `bbb...`. (1) is never satisfied as $a$ never occurs *so this is rejected.*
- `ccaccb...`. (1) is satisfied at position 3 since $\alpha$ occurs and $\alpha$ does not occur until $\beta$. Positions 1 and 2 do not contain $a$ or $b$ so the LHS of the until is also satisfied. *So this would be accepted.*
- `cabaaaaaaa...`. (1) is satisfied at position 2 since $\alpha$ occurs and $\beta$  occurs in the next step. Until position 2, that is position 1, both $\alpha$ and $\beta$ are not satisfied. *So this word is accepted.*

**Inductive case**
Assumption, $aB_nb$ is the operator that specifies that $a$ holds true exactly $n$ times before $b$ holds true.

We have $aB_{n+1}b \equiv \textbf{F}a \wedge a \implies B_{n}$. That is, $a$ occurs eventually and $a$ implies that $a$ holds true exactly $n$ times before $b$ holds true. So we have that $aB_{n+1}b$ is equivalent to $a$ occurring $n+1$ times before $b$ holds true.

## B.2
Algorithm:
$$\phi \wedge \varphi = \text{if } b_1 \text{ then } \phi_1 \wedge \varphi_1 \text{ else } \phi_2 \wedge \varphi_2$$
We know that these are $OBDD$'s and not $ROBDD$'s, so we can assume that they are full at all levels. If the n'th level has $w_a$ nodes, then $w_a = $ 