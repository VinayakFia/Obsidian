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
> Let A and B be OBDDs over n variables. Let $w_A (w_B)$ be the maximum number of nodes appearing in any row of A (B, respectively) – so A has at most $nw_A$ nodes (excluding T/F) and B has at most $nw_B$ nodes (excluding T/F). By considering a Dynamic Programming solution to compute $A ⊗ B$ (or otherwise), prove that $A ⊗ B$ has at most $nw_Aw_B$ nodes (excluding T/F)

Algorithm (from lectures):
$$\phi \wedge \varphi = \text{if } b_1 \text{ then } \phi_1 \wedge \varphi_1 \text{ else } \phi_2 \wedge \varphi_2$$

For concreteness I will rewrite this in pseudocode :
```haskell
data TreeNode = Leaf Bool | Node Int TreeNode TreeNode

fn And(TreeNode a, TreeNode b):
	if a is (Leaf v1) and b is (Leaf v2):
		return Leaf (v2 && v2)
	if a is (Leaf v1) and b is (Node h fn tn):
		return Node h And(Leaf v1, fn) And(Leaf v1, tn)
	if a is (Node h fn tn) and b is (Leaf v1):
		return Node h And(fn, Leaf v1) And(tn, Leaf v1)
	if a is (Node h fn tn) and b is (Node h' fn' tn'):
		if h == h':
			return Node h And(fn, fn') And(tn, tn')
		if h < h':
			return Node h And(fn, (Node h' fn' tn')) And(tn, (Node h' fn' tn'))
		return Node h And((Node h fn tn), fn') And((Node h fn tn), tn')
```

Now the above formula *is* certainly exponential, but we can optimise this with *memoisation*. We get:

```haskell
data TreeNode = Leaf Bool | Node Int Int TreeNode TreeNode

-- Node and Leaf have been extended with an `Int` which is a unique identifier for that `TreeNode`

-- a map from (Int, Int) -> TreeNode where the first int represents the unique identifier from tree a and the second int represents the unique identifier from tree b
-- the TreeNode contained is the result of the and call
map :: Map((Int, Int), TreeNode) = {}

fn And(TreeNode a, TreeNode b):
	if a is (Leaf v1) and b is (Leaf v2):
		return Leaf (v2 && v2)
	if a is (Leaf v1) and b is (Node h fn tn):
		return Node h And(Leaf v1, fn) And(Leaf v1, tn)
	if a is (Node h fn tn) and b is (Leaf v1):
		return Node h And(fn, Leaf v1) And(tn, Leaf v1)
	if a is (Node h fn tn) and b is (Node h' fn' tn'):
		if h == h':
			return Node h And(fn, fn') And(tn, tn')
		if h < h':
			return Node h And(fn, (Node h' fn' tn')) And(tn, (Node h' fn' tn'))
		return Node h And((Node h fn tn), fn') And((Node h fn tn), tn')
```
