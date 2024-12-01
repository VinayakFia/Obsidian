mtype = { RED, GREEN, AMBER };

bool Cars[2] = false;
mtype LStates[2] = RED;

bool Peds[2] = false;
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
  :: Cars[i] == true -> Cars[i] = false;
  :: else -> skip
  fi;
}

inline DecrementPed(i, n)
{
  if
  :: Peds[i] == true -> Peds[i] = false;
  :: else -> skip
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
  :: atomic { Cars[light] = true };
  :: atomic { Peds[light] = true }
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
    Cars[this] == true &&
    PStates[other] == RED ->
    printf("L%d->Green\n", this);
    LStates[this] = GREEN;
    counter = 5;
  };

  // Light flow
  :: atomic
  {
    LStates[this] == GREEN &&
    Cars[other] == false &&
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
    DecrementCar(this, 1);
  };
  :: atomic
  {
    LStates[this] == AMBER &&
    counter == 0 ->
    printf("L%d->Red\n", this);
    counter = 3;
    LStates[this] = RED;
    DecrementCar(this, 1);
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
    Peds[this] == true ->
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

// Cars at Light 0 can eventually go
never { /* FGa */
T0_init :    /* init */
	if
	:: (1) -> goto T0_init
	:: (Cars[0] == true) -> goto accept_S2
	fi;
accept_S2 :    /* 1 */
	if
	:: (Cars[0] == true) -> goto accept_S2
	fi;
}

never {
	if
	:: (!(Cars[0] == true)) -> goto will_come_eventually
	:: (Cars[0] == true) -> goto eventually_leaves
	fi;
will_come_eventually:
	if
	:: (!Cars[0] == true) -> goto will_come_eventually
  :: else -> goto eventually_arrives
	fi;
eventually_arrives:
	if
	:: (Cars[0] == true) -> goto eventually_leaves
	:: else -> goto eventually_arrives
	fi;
eventually_leaves:
	if
	:: (!Cars[0] == true) -> goto accept
	:: else -> goto eventually_leaves
	fi;
accept:
	skip
}

// Cars at Light 1 can eventually go
never {
	if
	:: (!(Cars[1] == true)) -> goto will_come_eventually2
	:: (Cars[1] == true) -> goto eventually_leaves2
	fi;
will_come_eventually2:
	if
	:: (!Cars[1] == true) -> goto will_come_eventually2
  :: else -> goto eventually_arrives2
	fi;
eventually_arrives2:
	if
	:: (Cars[1] == true) -> goto eventually_leaves2
	:: else -> goto eventually_arrives2
	fi;
eventually_leaves2:
	if
	:: (!Cars[1] == true) -> goto accept2
	:: else -> goto eventually_leaves2
	fi;
accept2:
	skip
}

// This is also modelled in the safety thread
never {
  do
  :: ((LStates[0] != RED && LStates[1] != RED) || (PStates[0] != RED && LStates[1] != RED) || (PStates[1] != RED && LStates[0] != RED));
  od;
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

init {
  // Setup
  run TrafficLight(0);
  run TrafficLight(1);

  run PedestrianLight(0);
  run PedestrianLight(1);

  run Signal(40);

  // Safety
  run Safety();
};
