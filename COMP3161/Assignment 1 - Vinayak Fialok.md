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

## TODOOO
$$\frac{}{True \ P_{atom}}, \frac{}{False \ P_{atom}}$$
$$\frac{p \ P_{atom}}{p \ P_{brac}}, \frac{p \ P_{atom}}{(p) P_{brac}}$$
$$\frac{p \ P_{brac}}{p \ P_{and}}, \frac{p_1 \ P_{brac} \ p_2 \ P_{and}}{p_2 \wedge p_2 \ P_{and}}$$
$$\frac{p \ P_{and}}{p \ P_{not}}, \frac{p \ P_{and}}{\neg p \ P_{not}}$$
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


