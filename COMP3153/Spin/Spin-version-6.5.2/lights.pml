mtype = { stop, ready, car, go }

proctype Car(chan c) {
  printf("VROOM\n");
  c!stop;
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
  chan light1 = [1] of { mtype };
  light1!stop;
  atomic{
  run Light(1, light1);
  run Car(light1);
  }
}

