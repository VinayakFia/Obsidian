// SETUP
mtype = { stop, ready, car, go }

chan light1 = [16] of { mtype };
chan light2 = [16] of { mtype };

// HELPERS

proctype Broadcast(mtype msg) {
  light1!msg;
  light2!msg;
}

// STATES
proctype Sensor(int i; chan c) {
  do
    :: printf("Car for %d\n", i); c!car;
    :: printf("No cars for %d\n", i); skip;
  od
}

proctype Stop(int n; chan c) {
  printf("Light %d stopped\n", n);

  if
    :: c?go -> run Waiting(n, c);
    :: c?car -> {
      car[n] = car[n] + 1;
      run StoppedCar(n, c);
    };
  fi;
}

proctype StoppedCar(int n; chan c) {
  printf("Light %d stoppedCar\n", n);
}

proctype Ready(int n; chan c) {
  printf("Light %d ready\n", n);
}

proctype Waiting(int n; chan c) {
  printf("Light %d waiting\n", n);

  if
    :: c?stop -> run Stop(n, c);
    :: c?car -> {
      car[n] = car[n] + 1;
      run Broadcast(ready);
      run Ready(n, c);
    };
  fi;
}

// MAIN
init {
  run Waiting(1, light1);
  run Waiting(2, light2);

  run Sensor(1, light1);
  run Sensor(2, light2);
}

