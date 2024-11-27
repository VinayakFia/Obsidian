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
$$\frac{}{\text{and } \square \ b_2 \ \triangleright \prec \mapsto \text{and }\square \ b_2 \triangleright s \succ b_1}$$