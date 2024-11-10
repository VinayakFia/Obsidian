## B.1
#### Part A
```mermaid
stateDiagram-v2
	direction LR
	
	and : p1∧p2
	p2 : ¬p1∧p2
	p1 : p1∧¬p2
	not : ¬p1∧¬p2

	and --> p2
	p1 --> p2
	p2 --> not
	p2 --> p2
	p2 --> and
	not --> p1
	not --> not
	not --> p2
```

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
```mermaid
stateDiagram-v2
	direction LR

	p1p2 : p1∧p2∧¬p3
	p1p3 : p1∧¬p2∧p3
	p2p3 : ¬p1∧p2∧p3
	p2 : ¬p1∧p2∧¬p3
	not : ¬p1∧¬p2∧¬p3

	p1p2 --> p2p3
	
	p1p3 --> p2p3
	
	p2p3 --> not
	p2p3 --> p2p3

	p2 --> p1p2

	not --> p1p3
	not --> not
	not --> p2
```

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
$$\textbf{FG}a)\wedge()$$