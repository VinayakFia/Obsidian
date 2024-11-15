proctype Light(int n) {
  printf("Hello world, this is process %d\n", _pid);
}

init {
  run Light(0);
  run Light(1);
  run Light(2);
}

