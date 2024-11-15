## B.1
![[Pasted image 20241110180404.png]]
#### Part A
![[Pasted image 20241110181246.png]]
p1, p2 has:
- q12

p1, not p2 has:
- q10

not p1, p2 has:
- q11
- q02
- q20
- q21
- q22

not p1, not p2 has:
- q00
- q01
#### Part B
![[Pasted image 20241110182542.png]]

p1, p2, not p3 has:
- q12

p1, not p2, p3 has:
- q10

not p1, p2, p3 has:
- q11
- q20
- q21
- q22

not p1, p2, not p3 has:
- q02

not p1, not p2, not p3 has:
- q00
- q01

## B.2
$$(\textbf{GF}a) \rightarrow (\textbf{FG}\neg c)$$
that is, if a is to occur infinitely, then eventually c will never occur again

## B.3
We have the formula
$$(\textbf{GF}a) \rightarrow (\textbf{FG}\neg c)$$
We can replace $a\rightarrow b$ with $\neg a \vee b$, so we have:
$$\neg(\textbf{GF}a)\vee(\textbf{FG}\neg c)$$
Lets replace $\textbf{Ga}$ with $\neg\textbf{F}\neg{a}$ in the LHS of this formula, we get:

$$\neg(\neg\textbf{F}\neg(\textbf{F}a))\vee(\textbf{FG}\neg c)$$
simplifying we get
$$\textbf{F}\neg(\textbf{F}a)\vee(\textbf{FG}\neg c)$$
Lets consider $\textbf{F}\neg(\textbf{F}a)$. $\textbf{F}a$ means that eventually $a$ occur. $\neg\textbf{F}a$ means that a will not occur now or in the future. $\textbf{F}\neg(\textbf{F}a)$ means that eventually $a$ will never occur again. Similarly $\textbf{FG}\neg c$ means that eventually $c$ will never occur. **So eventually, either $a$ will not occur again or $c$ will not occur again.** So we get the diagram:
![[Pasted image 20241115145340.png|250]]

Here, we can accept `abc` at $q_0$, but eventually to have an accepting word we must go to $q_2$ where we never accept $c$ or $q_1$ where we never accept $a$.