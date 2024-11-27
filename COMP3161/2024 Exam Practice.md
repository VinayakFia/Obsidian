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

|- true 
```