## B.1
$$\alpha\textbf{B}_1\beta ≡ (¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$$
$$\forall n > 1, \alpha\textbf{B}_n\beta \equiv (\neg \alpha \wedge \neg \beta)\textbf{U}(\alpha \wedge \textbf{X}(\alpha\textbf{B}_{n-1}\beta))$$

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

**Inductive Hypothesis**
Inductive hypothesis (IH), $\alpha \textbf{B}_k \beta$ is the operator that specifies that $\alpha$ holds true exactly $k$ times before $\beta$ holds true.

**Inductive Case**
That is, we must prove that $\alpha \textbf{B}_{k+1}\beta$ is the operator that specifies that $\alpha$ holds true exactly $k + 1$ times before $\beta$ holds true.

$$\alpha\textbf{B}_{k+1}\beta \equiv (\neg \alpha \wedge \neg \beta)\textbf{U}(\alpha \wedge \textbf{X}(\alpha\textbf{B}_{k}\beta))$$

Lets start with the RHS of until $(\alpha \wedge \textbf{X}(\alpha\textbf{B}_{k}\beta))$. This can be expressed as $\alpha$ holds and after 1 step $\alpha$ holds true exactly $k$ times before $\beta$ holds true (IH). *That is $\alpha$ holds true now and $k$ more times until $\beta$ holds true.*

Next the whole expression $(\neg \alpha \wedge \neg \beta)\textbf{U}(\alpha \wedge \textbf{X}(\alpha\textbf{B}_{k}\beta))$. *This can be expressed as $\alpha$ and $\beta$ do not hold true until $\alpha$ holds true and is seen $k$ more times until $\beta$ holds true.* This is equivalent to the statement $\alpha$ holds true $k + 1$ times before $\beta$ holds true.

In practice lets consider $\alpha\textbf{B}_2 \beta$:
$$\alpha\textbf{B}_{2}\beta \equiv (\neg \alpha \wedge \neg \beta)\textbf{U}(\alpha \wedge \textbf{X}(\alpha\textbf{B}_{1}\beta))$$$$\alpha \textbf{B}_2 \beta \equiv (\neg \alpha \wedge \neg \beta)\textbf{U}(\alpha \wedge \textbf{X}((¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta)))) \qquad \text{substituting } \alpha \textbf{B}_1\beta$$
`cacacb...`.
- At position 4 we satisfy $(\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$
- At position 3 we satisfy $(¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta)$
- At position 2 we satisfy $(\alpha \wedge \textbf{X}((¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$
	- At position 2 we satisfy $\textbf{X}((¬\alpha ∧ ¬\beta) \textbf{U} (\alpha ∧ \textbf{X}(¬\alpha \textbf{U} \beta))$
	- At position 2 we also satisfy $a$
- Until position 2 $\neg a \wedge \neg b$ is never satisfied.
*So this word satisfied $\alpha \textbf{B}_2 \beta$.*
## B.2
Algorithm (from lectures):
$$\phi \wedge \varphi = \text{if } b_1 \text{ then } \phi_1 \wedge \varphi_1 \text{ else } \phi_2 \wedge \varphi_2$$

For personal clarity I will rewrite this in something akin to haskell:
```haskell
data TreeNode = Leaf Bool | Node Int TreeNode TreeNode

and :: TreeNode -> TreeNode -> TreeNode
and (Leaf v1) (Leaf v2) = Leaf $ v1 && v2
and (Leaf v1) (TreeNode h fn tn) = TreeNode h ((Leaf v1) `and` fn) ((Leaf v1) `and` tn)
and (TreeNode h fn tn) (Leaf v1) = (Leaf v1) `and` (TreeNode h fn tn)
and (TreeNode h fn tn) (TreeNode h' fn' tn')
	| h == h' = TreeNode h (fn `and` fn') (tn `and` tn')
```