## A
### 1.
```haskell
(and not false (and true not true)) (4) -> (3)
-> (and true (and true not true)) (5)
-> (and true not true) (5)
-> not true (2)
-> false
```

### 2.
No, they are not ambiguous. This is because at each step there is exactly 1 evaluation rule (small-step semantic) that can be applied. *This is primary because and is parenthesised*.

### 3.
```haskell
data Value = T | F

|- true V T
|- false V F
b bool V T |- not b V F
b bool V F |- not b V T
b1 bool V F, b2 bool V b' |- (and b1 b2) V F
b1 bool V T, b2 bool V b' |- (and b1 b2) V b'
```

### 4.
$$\succ \prec \triangleright \square \circ $$
$$\frac{}{s\succ\text{true}\mapsto s \prec T}$$
$$\frac{}{s\succ\text{false}\mapsto s \prec F}$$
$$\frac{}{s\succ\text{not } b\mapsto \text{not }\square \triangleright s \succ b}$$
$$\frac{}{\text{not } \square \ \triangleright s \prec T \mapsto s \prec F}$$
$$\frac{}{\text{not } \square \ \triangleright s \prec F \mapsto s \prec T}$$
$$\frac{}{s\succ\text{and } b_1 \ b_2\mapsto \text{and }\square \ b_2 \triangleright s \succ b_1}$$
$$\frac{}{\text{and } \square \ b_2 \ \triangleright s \prec F \mapsto s \prec F}$$
$$\frac{}{\text{and } \square \ b_2 \ \triangleright s \prec T \mapsto s \succ b_2}$$

## B
### 1.
$$1. \qquad \forall\alpha, \beta,  (\alpha + (\beta + (\text{int} \times \text{int})))$$
$$2.\qquad \forall\alpha, \beta, \theta (\alpha \times (\beta \times \theta)) \rightarrow \beta$$
$$3.\qquad \forall\beta,  ((\text{Bool} \rightarrow \text{Bool}) + \beta) \rightarrow \text{Bool}$$
### 2.
> *(6 Marks)* Explain, with the help of an example, why most-general-type inference is not possible for the simple rec-based recursive types we added to MinHS in lectures. _Hint_: Consider the type(s) of the term: `roll (InR (roll (InL 3)))`

This is because the problem of determining the most-general type is computationally intensive. Take the example `roll (InR (roll (InL 3)))`. First lets consider `roll (InL 3)`. We have the type `rec t. Int + ?`. Then `roll (InR (roll (InL 3)))` is `rec t. b + (rec t'. Int + a)`. Here determining the type of `t` and `t'`
### 3.
 > [!warning] I don't think this is part of this term's couse

### 4.
