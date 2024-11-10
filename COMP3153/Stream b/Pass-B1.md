```tikz
\begin{document}
\begin{tikzpicture}[node distance=2cm,thick,auto]
% draw the states
\node[state,initial,accepting] (s_0) {$s_0$}; % note the semicolon
\node[state,accepting] (s_1) [right of=s_0] {$s_1$};
\node[state] (s_2) [right of=s_1] {$s_2$};
% draw the edges
\path[->] (s_0) edge node {1} (s_1)
edge [bend right] node [swap] {0} (s_2)
(s_1) edge [loop above] node {0,1} ()
(s_2) edge node [swap] {0} (s_1)
edge [loop right] node {1} (); % note the semicolon
\end{tikzpicture}
\end{document}
```
