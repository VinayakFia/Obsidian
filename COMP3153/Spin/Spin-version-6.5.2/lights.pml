mtype = { stop, ready, car, go }

proctype Car(chan c) {
  if
    :: c!stop;
    :: else skip;
  fi;
}

proctype Stop(int n, chan c) {
  printf("Light %d stopped\n", n);
}

proctype Waiting(int n, chan c) {
  printf("Light %d waiting\n", n);

  if
    :: chan?stop -> run Stop(n, c)
  fi;
}

init {
  chan light1 = [1] of { stop };
  run Light(1, c);
  Car(c);
}

