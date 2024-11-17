mtype = { RED, AMBER, GREEN }; // Trafficlight States
mtype = { L0_Complete, L1_Complete }; // Signals for intersection controller

chan Chan_L0 = [1] of { mtype };
chan Chan_L1 = [1] of { mtype };
chan Chan_Intersection [1] of { mtype };

mtype LStates[2] = RED;
chan LChans[2] = { Chan_L0, Chan_L1 };

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

proctype TrafficLight0()
{
l0_waiting:
  do
  :: Chan_L0?[CAR] -> atomic
  {
    Chan_L0?CAR;
    goto l0_green;
  };
  :: Chan_L0?[STOP] -> atomic
  {
    Chan_L0?STOP;
    goto l0_stop;
  };
  od;

l0_stop:
  do
  :: Chan_L0?[GO] -> atomic
  {
    Chan_L0
  };
  od;

l0_ready:
  do
}

