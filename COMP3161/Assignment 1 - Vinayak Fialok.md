> [!link] https://cgi.cse.unsw.edu.au/~cs3161/24T3/Assignment%200/Spec.pdf

## Part A
### 1
> Write down a set of inference rules that define the set P. The rules may be ambiguous. *(5 marks)*

$$\frac{}{True}, \frac{}{False}, \frac{p \space P}{\neg p}, \frac{p \space P}{(p)}, \frac{p_1 \space P \space p_2 \space P}{p_1 \wedge p_2}$$
### 2
> The operator ¬ has the highest precedence, and logical and is right-associative. Define a set of simultaneous judgements to define the language without any ambiguity. *(5 marks)*

`!(...) and (!...)`

$$\frac{}{True \ P_{atom}}, \frac{}{False \ P_{atom}}$$
$$\frac{p \ P_{atom}}{p \ P_{brac}}, \frac{p \ P_{atom}}{(p) P_{brac}}$$
$$\frac{p \ P_{brac}}{p \ P_{and}}, \frac{p_1 \ P_{brac} \ p_2 \ P_{and}}{p_2 \wedge p_2 \ P_{and}}$$
$$\frac{p \ P_{and}}{p \ P_{not}}, \frac{p \ P_{and}}{\neg p \ P_{not}}$$

### 3
> Here is an abstract syntax B for the same language: `B ::= Not B | And B B | True | False` Write an inductive definition for the parsing relation connecting your unambiguous judgements to this abstract syntax. *(5 marks)*

$$\frac{}{True \ P_{atom} \longleftrightarrow True \ B}, \frac{}{False \ P_{atom} \longleftrightarrow False \ B}$$
$$\frac{p \ P_{atom} \longleftrightarrow b \ B}{p \ P_{brac} \longleftrightarrow b \ B}, \frac{p \ P_{atom} \longleftrightarrow b \ B}{(p) \ P_{brac} \longleftrightarrow b \ B}$$
$$\frac{p \ P_{brac} \longleftrightarrow b \ B}{p \ P_{and} \longleftrightarrow b \ B}, \frac{p_1 \ P_{brac} \ p_2 \ P_{and} \longleftrightarrow a \ B \ b \ B}{p_2 \wedge p_2 \ P_{and} \longleftrightarrow AND \ a \ b \ B}$$
$$\frac{p \ P_{and} \longleftrightarrow b \ B}{p \ P_{not} \longleftrightarrow b \ B}, \frac{p \ P_{and} \longleftrightarrow b \ B}{\neg p \ P_{not} \longleftrightarrow NOT \ b \ B}$$
### 4
#### a)
> Show the evaluation of `And (Not (And True False)) False` with a derivation tree (arguably this belongs in Part B). (5 marks)

```mermaid
stateDiagram-v2
	And1: And
	And2: And
	False2: False
	
	And1 --> Not
	And1 --> False
	Not --> And2
	And2 --> True
	And2 --> False2
```

#### b)
> Consider the following inference rule: $$\frac{x ⇓ v}{Not \ x ⇓ v^{-1}}$$ where we understand $v^{-1}$ to be defined by the following equations:
> $$True^{-1} = False$$
> $$False^{-1} = True$$
> Is this rule derivable? Is it admissible? Justify your answers. *(5 marks)*

Suppose $x$ evaluates to $True$. Then
$$\frac{x \Downarrow  v = True}{Not \ x \Downarrow v^{-1} = False}$$
Suppose $x$ evaluates to $False$. Then
$$\frac{x \Downarrow  v = False}{Not \ x \Downarrow v^{-1} = True}$$
So in all cases, we may derive the inference rule from the given big steps semantics. As such, it is derivable and admissable.

## Part B
![[Pasted image 20240930192553.png]]
### 1
> Show the full evaluation of the term `(If True (If False True False) False)`. *(5 marks)*

```python
		-> (If True (If False True False) False)
using 1 -> (If False True False)
using 3 -> (False)
```

### 2
> Define an equivalent big-step semantics for L. *(5 marks)*

$$\frac{c \Downarrow \text{False} \ t \Downarrow t' \ \ \ f \Downarrow f'}{(\text{If} \ c \ t \ f) \Downarrow f}$$
$$\frac{c \Downarrow \text{True} \ t \Downarrow t' \ \ \ f \Downarrow f'}{(\text{If} \ c \ t \ f) \Downarrow t}$$


### 3
> Prove that if $e \Downarrow v$ then $e \overset{*}{\mapsto} v$, where $\Downarrow$ is the big-step semantics you defined in the previous question, and $\overset{*}{\mapsto}$ is the reflexive and transitive closure of $\mapsto$. Use rule induction on $e \Downarrow v$. *(10 marks)*

The base case is the reflexive case if $e \Downarrow e$ then $e \overset{*}{\mapsto} e$. We have cases $e = \text{False}$, $e = \text{True}$, for which there are no steps in big step and small step semantics.

The inductive case is if $e \Downarrow v$ then $$\frac{e_1 \mapsto e_2 \ \ \ \ \ \ e_2 \overset{*}{\mapsto} e_3}{e_1 \overset{*}{\mapsto} e_3}$$
> [!danger] todo

## C
### 1
> Define a recursive compilation function c : B → L which converts expressions in B to expressions in L. *(5 marks)*

