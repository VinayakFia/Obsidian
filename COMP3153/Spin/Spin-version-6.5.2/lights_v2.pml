mtype = { RED, AMBER, GREEN }; /* traffic light states */
mtype = { CAR };

chan L0 = [1] of {mtype};
chan L1 = [1] of {mtype};

mtype LStates[2] = RED;
chan LChans[2] = { L0, L1 };

proctype Cars(int chance)
{
car_start:
	byte nr;	/* pick random value  */
	do
  :: nr++		/* randomly increment */
  :: nr--		/* or decrement       */
  :: break	/* or stop            */
	od;

  // pick a random light from 0 or 1
  int light;
  do
  :: light = 1
  :: light = 0
  :: break
  od;

  if
  :: nr < chance -> LChans[light]!CAR;
  :: else -> skip;
  fi;

  goto car_start;
}

proctype Cars() {
  if
    :: 
}
