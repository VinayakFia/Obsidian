mtype = { RED, GREEN, AMBER };

int Cars[2] = { 0, 0 };
mtype LStates[2] = RED;

proctype Signal(int chance)
{
	byte nr;	/* pick random value  */

car_start:
	do
  :: nr++		/* randomly increment */
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
  :: nr < chance -> atomic { printf("Car for %d\n", light); Cars[light] = Cars[light] + 1 };
  :: else -> skip;
  fi;

  goto car_start;
}

proctype TrafficLight(int this)
{
  int counter = 0;
  int other = (this + 1) % 2;
  do
  // Has cars and other light is not green
  :: LStates[this] == RED && LStates[other] == RED && Cars[this] > 0 -> atomic { printf("L%d->Red\n", this); LStates[this] = GREEN; counter = 5 };

  // Light flow
  :: LStates[this] == GREEN && Cars[other] == 0 && counter > 0 -> atomic { Cars[this]-- }; // Green Infinity state from diagram
  :: LStates[this] == GREEN && Cars[other] > 0 && counter > 0 -> atomic { counter = counter - 1; Cars[this]-- };
  :: LStates[this] == GREEN && counter == 0 -> atomic { counter = 3; LStates[this] = AMBER; Cars[this]-- }
  :: LStates[this] == AMBER && counter > 0 -> atomic { counter = counter - 1; Cars[this]-- }
  :: LStates[this] == AMBER && counter == 0 -> atomic { counter = 3; LStates[this] = RED; Cars[this]-- }
  od;
}

init {
  run Signal(200);
  run TrafficLight(0);
  run TrafficLight(1);
};