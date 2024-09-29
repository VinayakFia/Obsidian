> [!link] https://cgi.cse.unsw.edu.au/~cs3161/24T3/Assignment%200/Spec.pdf

## Part A
### 1
> Write down a set of inference rules that define the set P. The rules may be ambiguous. *(5 marks)*

$$\frac{}{True}, \frac{}{False}, \frac{p \space P}{\neg p}, \frac{p \space P}{(p)}, \frac{p_1 \space P \space p_2 \space P}{p_1 \wedge p_2}$$
### 2
> The operator ¬ has the highest precedence, and logical and is right-associative. Define a set of simultaneous judgements to define the language without any ambiguity. *(5 marks)*

$$True \wedge False \wedge True$$
$$P_{and}(P_{atom} \wedge P_{and}(P_{atom} \wedge P_{and}(P_{atom})))$$**DELETE ABOVE 2 lines**
$$\frac{}{True}P_{atom}, \frac{}{False}P_{atom}$$
$$\frac{p \space P_{atom}}{p}P_{and}, \frac{p_1 \space P_{atom} \space p_2 \space P_{and}}{p_2 \wedge p_2}P_{and}$$
$$\frac{p \space P_{and}}{p}P_{brac}, \frac{p \space P_{and}}{(p)}P_{brac}$$
$$\frac{p \space P_{brac}}{p}P, \frac{p \space P_{brac}}{\neg p}P$$

### 3
> Here is an abstract syntax B for the same language: `B ::= Not B | And B B | True | False` Write an inductive definition for the parsing relation connecting your unambiguous judgements to this abstract syntax. *(5 marks)*
