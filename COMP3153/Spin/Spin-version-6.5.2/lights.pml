mtype = { stop, ready, car, go }

proctype Sensor(int i; chan c) {
  do
    :: printf("Car for %d\n", i); c!stop;
    :: printf("No cars for %d\n", i); skip;
  od
}

proctype Stop(int n; chan c) {
  printf("Light %d stopped\n", n);
}

proctype Waiting(int n; chan c) {
  printf("Light %d waiting\n", n);

  if
    :: c?stop -> run Stop(n, c);
  fi;
}

init {
  chan light1 = [16] of { mtype };
  chan light2 = [16] of { mtype };

  run Waiting(1, light1);
  run Waiting(2, light2);

  run Sensor(1, light1);
  run Sensor(2, light2);
}

