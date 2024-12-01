mtype = { RED, GREEN, AMBER };

int Cars[2] = { 0, 0 };
mtype LStates[2] = RED;

int Peds[2] = { 0, 0 };
mtype PStates[2] = RED;

// LOCK
// These are unused, however have been left here as they were my original
// solution before using atomic
bool lock = false;
inline AquireLock()
{
  bool tmp = false;
  do
  :: atomic
  {
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

// HELPERS

inline DecrementCar(i, n)
{
  if
  :: Cars[i] <= n -> Cars[i] = 0;
  :: else -> Cars[i] = Cars[i] - n;
  fi;
}

inline DecrementPed(i, n)
{
  if
  :: Peds[i] < n -> Peds[i] = 0;
  :: else -> Peds[i] = Peds[i] - n;
  fi;
}

// STATES

proctype Signal(int chance)
{
  // choose a light to add to
  int light = 0
car_start:
  if
  :: light = 1
  :: light = 0
  fi;

  // add to pedestrian or traffic light
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
  // AquireLock(); part of original design

  if
  // Has cars and other light is not green
  :: atomic
  {
    LStates[this] == RED &&
    LStates[other] == RED &&
    Cars[this] > 0 &&
    PStates[other] == RED ->
    printf("L%d->Green\n", this);
    LStates[this] = GREEN;
    counter = 5;
  };

  // Light flow
  :: atomic
  {
    LStates[this] == GREEN &&
    Cars[other] == 0 &&
    counter == 5 ->
    printf("L%d-GreenInf\n", this);
    DecrementCar(this, 1);
  }; // Green Infinity state from diagram
  :: atomic
  {
    LStates[this] == GREEN &&
    counter > 0 ->
    printf("L%d-Green%d\n", this, counter);
    counter = counter - 1;
    DecrementCar(this, 1);
  };
  :: atomic
  {
    LStates[this] == GREEN &&
    counter == 0 ->
    printf("L%d->Amber\n", this);
    counter = 3;
    LStates[this] = AMBER;
    DecrementCar(this, 1);
  };
  :: atomic
  {
    LStates[this] == AMBER &&
    counter > 0 ->
    printf("L%d-Amber%d\n", this, counter);
    counter = counter - 1;
    DecrementCar(this, 5);
  };
  :: atomic
  {
    LStates[this] == AMBER &&
    counter == 0 ->
    printf("L%d->Red\n", this);
    counter = 3;
    LStates[this] = RED;
    DecrementCar(this, 5);
  };
  :: else -> skip;
  fi;
  // ReleaseLock();
  goto t_start;
}

proctype PedestrianLight(int this)
{
  int counter = 0;
  int other = (this + 1) % 2;

p_start:
  // AquireLock(); initially I went with a lock based solution so that processes would not interleave, however this was solved through
  // the use of atomic

  if
  // Has pedestrians and perpendicular light is RED
  :: atomic
  {
    PStates[this] == RED &&
    LStates[other] == RED &&
    Peds[this] > 0 ->
    printf("P%d->Green\n", this);
    PStates[this] = GREEN;
    counter = 5;
  };

  // Light flow
  :: atomic
  {
    PStates[this] == GREEN &&
    counter > 0 ->
    printf("P%d-Green%d\n", this, counter);
    counter--;
    DecrementPed(this, 1);
  };
  :: atomic
  {
    PStates[this] == GREEN &&
    counter <= 0 ->
    printf("P%d->Red\n", this);
    PStates[this] = RED;
    DecrementPed(this, 1);
  };
  :: else -> skip;
  fi;

  // ReleaseLock();
  goto p_start;
}

// Checks that perpendicular lights are not on at the same time
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

never {
	if
	:: (!(Cars[0] > 0)) -> goto will_come_eventually
	:: (Cars[0] > 0) -> goto eventually_leaves
	fi;
will_come_eventually:
	if
	:: (!Cars[0] > 0) -> goto will_come_eventually
  :: else -> goto eventually_arrives
	fi;
eventually_arrives:
	if
	:: (Cars[0] > 0) -> goto eventually_leaves
	:: else -> goto eventually_arrives
	fi;
eventually_leaves:
	if
	:: (!Cars[0] > 0) -> goto accept
	:: else -> goto eventually_leaves
	fi;
accept:
	skip
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
