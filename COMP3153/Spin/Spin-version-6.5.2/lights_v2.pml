mtype = { RED, AMBER, GREEN }; // Trafficlight States
mtype = { L0_Complete, L1_Complete }; // Signals for intersection controller

chan Chan_L0 = [1] of { mtype };
chan Chan_L1 = [1] of { mtype };
chan Chan_Intersection [1] of { mtype };

int Cars[2] = { 0, 0 };

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
  :: nr < chance -> Cars[light] = Cars[light] + 1;
  :: else -> skip;
  fi;

  goto car_start;
}

proctype TrafficLight0()
{
  int counter == 0;
  do
  :: Cars[0] > 0 && LStates[1] == RED -> atomic { printf("L0->Red\n"); LStates[0] = GREEN; counter = 5 };
  :: LStates[0] == GREEN && counter > 0 -> counter = counter - 1;
  :: LStates[0] == GREEN && counter == 0 -> atomic { counter = 3; LStates[0] = AMBER; }
  :: LStates[0] == AMBER && counter > 0 -> counter = counter - 1;
  :: LStates[0] == AMBER && counter == 0 -> atomic { counter = 3; LStates[0] = RED; }
  od;
}

