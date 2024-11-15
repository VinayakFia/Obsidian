mtype = { stop, ready, car, go }

proctype Car() {
  if
    :: car_comes = true;
    :: car_comes = false;
  fi


}

proctype Light(int n) {
  
}

init {
  run Light(0);
  run Light(1);
  run Light(2);
}

