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
  int light;
car_start:
  do
  :: light = 1
  :: light = 0
  :: break
  od;

  if
  :: atomic { printf("Car for %d\n", light); Cars[light]++ };
  :: atomic { printf("Pedestrian for %d\n", light); Peds[light]++ }
  :: else -> skip;
  fi;

  goto car_start;
}

proctype TrafficLight(int this)
{
  int counter = 0;
  int other = (this + 1) % 2;

t_start:
  AquireLock();
  if
  // Has cars and other light is not green
  :: atomic { LStates[this] == RED && LStates[other] == RED && Cars[this] > 0 } -> atomic { printf("L%d->Green\n", this); LStates[this] = GREEN; counter = 5 };

  // Light flow
  :: atomic { LStates[this] == GREEN && Cars[other] == 0 && counter > 0 } -> atomic { printf("L%d-GreenInf\n", this); Cars[this]-- }; // Green Infinity state from diagram
  :: atomic { LStates[this] == GREEN && Cars[other] > 0 && counter > 0 }-> atomic { printf("L%d-Green%d\n", this, counter); counter = counter - 1; Cars[this]-- };
  :: atomic { LStates[this] == GREEN && counter == 0 }-> atomic { printf("L%d->Amber\n", this); counter = 3; LStates[this] = AMBER; Cars[this]-- }
  :: atomic { LStates[this] == AMBER && counter > 0 }-> atomic { printf("L%d-Amber%d\n", this, counter); counter = counter - 1; Cars[this]-- }
  :: atomic { LStates[this] == AMBER && counter == 0 }-> atomic { printf("L%d->Red\n", this); counter = 3; LStates[this] = RED; Cars[this]-- }
  :: else -> skip;
  fi;
  ReleaseLock();
  goto t_start;
}

proctype PedestrianLight(int this)
{
  int counter = 0;
  int other = (this + 1) % 2;

p_start:
  AquireLock();
  if
  // Has pedestrians and perpendicular light is RED
  :: atomic { LStates[other] == RED && Peds[0] > 0 } -> atomic { printf("P%d->Green", this); PStates[this] = GREEN; counter = 3 };
  fi;
  ReleaseLock();
  goto p_start;
}

proctype Safety() {
  do
  :: assert(!(LStates[0] == GREEN && LStates[1] == GREEN));
  :: assert(!(LStates[0] == AMBER && LStates[1] == AMBER));
  :: assert(!(LStates[0] == AMBER && LStates[1] == GREEN));
  :: assert(!(LStates[0] == GREEN && LStates[1] == AMBER));
  od
}

init {
  // Setup
  run Signal(40);
  run TrafficLight(0);
  run TrafficLight(1);

  // Setup Safety
  run Safety();
};