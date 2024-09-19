mtype = { STOP, START, TERMINATE, RESUME, SUSPEND};

chan obs = [0] of {mtype};

active proctype task(){

q0:   obs!START; goto q1;
q1:   if
      :: obs!STOP; goto q0;
      :: obs!SUSPEND; goto q2;
      :: obs!TERMINATE; goto q3;
      fi
q2:   obs!RESUME; goto q1;
q3:   skip;

}

active proctype scheduler(){
  do
  :: obs?START;
     printf("Scheduler has started!!");
  od

}

active proctype observer(){
   mtype x;
   do
   :: obs?x;
      if
      :: x == START -> printf("Observer saw Starting!");
      :: else -> skip;
      fi
   od
}