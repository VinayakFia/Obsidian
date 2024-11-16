mtype = { RED, AMBER, GREEN }; /* traffic light states */

chan L0 = [1] of {mtype};
chan L1 = [1] of {mtype};

mtype LStates[2] = RED;

inline randnr()
{
	byte nr;	/* pick random value  */
	do
	:: nr++		/* randomly increment */
	:: nr--		/* or decrement       */
	:: break	/* or stop            */
	od;
}

proctype Cars() {
  if
    :: 
}
