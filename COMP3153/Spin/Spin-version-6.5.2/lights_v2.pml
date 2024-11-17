mtype = { RED, GREEN, AMBER };

int Cars[2] = { 0, 0 };
mtype LStates[2] = RED;

int Peds[2] = { 0, 0 };
mtype PStates[2] = RED;

// LOCK
bool lock = false;
inline AquireLock()
{
  bool tmp = false;
  do
  :: atomic {
    tmp = lock;
    lock = true;
  } ->
    if
      :: tmp;
      :: else -> break;
    fi;
  od;
}

inline ReleaseLock()
{
  lock = false;
}

// LOCK

proctype Signal(int chance)
{
  int light = 0
car_start:
  if
  :: light = 1
  :: light = 0
  fi;

  if
  :: atomic { Cars[light]++ };
  :: atomic { Peds[light]++ }
  fi;

  goto car_start;
}

proctype TrafficLight(int this)
{
  int counter = 0;
  int other = (this + 1) % 2;

t_start:
  AquireLock();
  printf("HERE2\n");
  if
  // Has cars and other light is not green
  :: atomic { LStates[this] == RED && LStates[other] == RED && Cars[this] > 0 && PStates[other] == RED } -> atomic { printf("L%d->Green\n", this); LStates[this] = GREEN; counter = 5 };

  // Light flow
  :: atomic { LStates[this] == GREEN && Cars[other] == 0 && counter == 5 } -> atomic { printf("L%d-GreenInf\n", this); Cars[this]-- }; // Green Infinity state from diagram
  :: atomic { LStates[this] == GREEN && counter > 0 && counter < 5 }-> atomic { printf("L%d-Green%d\n", this, counter); counter = counter - 1; Cars[this]-- };
  :: atomic { LStates[this] == GREEN && counter == 0 }-> atomic { printf("L%d->Amber\n", this); counter = 3; LStates[this] = AMBER; Cars[this]-- }
  :: atomic { LStates[this] == AMBER && counter > 0 }-> atomic { printf("L%d-Amber%d\n", this, counter); counter = counter - 1; Cars[this]-- }
  :: atomic { LStates[this] == AMBER && counter == 0 }-> atomic { printf("L%d->Red\n", this); counter = 3; LStates[this] = RED; Cars[this]-- }
  :: else -> skip;
  fi;
  ReleaseLock();
  printf("here2\n");
  goto t_start;
}

proctype PedestrianLight(int this)
{
  int counter = 0;
  int other = (this + 1) % 2;

p_start:
  AquireLock();
  printf("HERE\n");
  if
  // Has pedestrians and perpendicular light is RED
  :: atomic { PStates[this] == RED && LStates[other] == RED && Peds[this] > 0 } -> atomic { printf("P%d->Green\n", this); PStates[this] = GREEN; counter = 3 };

  // Light flow
  :: atomic { PStates[this] == GREEN && counter > 0 } -> atomic { printf("P%d-Green%d\n", this, counter); counter--; Peds[this]--; };
  :: atomic { PStates[this] == GREEN && counter == 0 } -> atomic { printf("P%d->RED\n", this); PStates[this] = RED; Peds[this]--; };
  :: else -> skip;
  fi;
  ReleaseLock();
  printf("here\n");
  goto p_start;
}

proctype Safety() {
  do
  // Perpendicular lights should not be on at the same time
  :: assert(!(LStates[0] == GREEN && LStates[1] == GREEN));
  :: assert(!(LStates[0] == AMBER && LStates[1] == AMBER));
  :: assert(!(LStates[0] == AMBER && LStates[1] == GREEN));
  :: assert(!(LStates[0] == GREEN && LStates[1] == AMBER));

  // Perpendicular pedestrian and traffic lights should not be on at the same time
  :: assert(!(PStates[0] == GREEN && LStates[1] == GREEN));
  :: assert(!(PStates[1] == GREEN && LStates[0] == GREEN));
  od
}

init {
  // Setup
  run TrafficLight(0);
  run TrafficLight(1);

  run PedestrianLight(0);
  run PedestrianLight(1);

  run Signal(40);

  // Setup Safety
  run Safety();
};