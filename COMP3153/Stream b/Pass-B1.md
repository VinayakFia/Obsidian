```mermaid
stateDiagram-v2
	[*] --> q0
	q0 --> q1 : a
	q0 -> q2 : bc
	q1 --> q2 : b, c
	q2 --> q1 : a
	q2 --> q0 : b, c
```
