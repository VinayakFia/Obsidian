## B.1
#### Part A
```mermaid
stateDiagram-v2
	direction LR
	
	and : p1, p2
	p2 : not p1, p2
	p1 : p1, not p2
	not : not p1, not p2

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