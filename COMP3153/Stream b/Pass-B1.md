```mermaid
stateDiagram-v2
	direction LR

	classDef end = 

	[*] --> q0
	q0 --> q1 : a
	q0 --> q2 : b,c
	q1 --> q2 : b,c
	q2 --> q0 : b,c
```
