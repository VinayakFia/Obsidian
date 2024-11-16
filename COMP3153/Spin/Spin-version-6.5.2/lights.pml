// SETUP
mtype = { stop, ready, car, go };

chan light1 = [16] of { mtype };
chan light2 = [16] of { mtype };
int cars[2] = { 0, 0 };

// HELPERS
proctype Broadcast(int n; mtype msg) {
  if
    :: n == 0 -> light2!msg;
    :: else -> light2!msg;
  fi;
}

proctype DecrementCar(int n; chan c) {
  if
    :: c?[car] -> c?car;
    :: !c?[car] && cars[n] > 0 -> cars[n] = cars[n] - 1;
    :: else -> skip;
  fi;
}

// STATES

proctype Sensor(int i; chan c) {
  //do
    //:: printf("Car for %d\n", i); c!car;
    //:: printf("No cars for %d\n", i); skip;
  //od
  // TODO: make this run sometimes not always
  int count = 0;
  do
    ::
      if
        :: count = 0;
        :: count = 1;
        :: count = 2;
        :: count = 3;
        :: count = 4;
      fi;

      if
        :: count == 4 ->
          printf("Car for %d\n", i);
          c!car;
        :: else ->
          printf("No cars for %d\n", i);
      fi;
  od
}

proctype Stop(int n; chan c) {
  printf("Light %d stopped\n", n);

  if
    :: c?go -> run Waiting(n, c);
    :: c?car ->
      cars[n] = cars[n] + 1;
      run StoppedCar(n, c);
  fi;
}

proctype StoppedCar(int n; chan c) {
  printf("Light %d stoppedCar\n", n);

  if
    :: c?car ->
      cars[n] = cars[n] + 1;
      run StoppedCar(n, c);
    :: c?go ->
      run Broadcast(n, ready);
      run Ready(n, c);
  fi;
}

proctype Ready(int n; chan c) {
  printf("Light %d ready\n", n);

  if
    :: c?[car] ->
      c?car;
      cars[n] = cars[n] + 1;
      run Ready(n, c);
    :: else ->
      run Broadcast(n, stop);
      run Green(n, c, 5);
  fi;
}

proctype Green(int n; chan c; int timer) {
  printf("Light %d is green on time %d\n", n, timer);

  run DecrementCar(n, c);

  if
    :: timer == 3 -> run Amber(n, c, 3);
    :: else -> run Green(n, c, timer - 1);
  fi;
}

proctype Amber(int n; chan c; int timer) {
  printf("Light %d is amber on time %d\n", n, timer);

  run DecrementCar(n, c);

  if
    :: timer == 0 -> {
      if
        :: cars[n] == 0 -> run Waiting(n, c);
        :: else ->
          run Broadcast(n, ready);
          run Ready(n, c);
      fi;
    }
    :: else -> run Amber(n, c, timer - 1);
  fi;
}

proctype Waiting(int n; chan c) {
  printf("Light %d waiting\n", n);

  if
    :: c?stop ->
      run Stop(n, c);
    :: c?car ->
      cars[n] = cars[n] + 1;
      run Broadcast(n, ready);
      run Ready(n, c);
    :: c?ready ->
      run Waiting(n, c);
  fi;
}

// MAIN
init {
  run Waiting(0, light1);
  run Waiting(1, light2);

  run Sensor(0, light1);
  run Sensor(1, light2);
}

