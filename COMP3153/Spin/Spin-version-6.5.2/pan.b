	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 7
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Safety */
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 16: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC PedestrianLight */

	case 17: // STATE 1
		;
		((P2 *)_this)->_6_17_tmp = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 3
		;
		now.lock = trpt->bup.ovals[1];
		((P2 *)_this)->_6_17_tmp = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 19: // STATE 5
		;
	/* 0 */	((P2 *)_this)->_6_17_tmp = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 21: // STATE 18
		;
		((P2 *)_this)->counter = trpt->bup.ovals[1];
		now.PStates[ Index(((P2 *)_this)->this, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 23: // STATE 23
		;
		((P2 *)_this)->counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 25: // STATE 28
		;
		now.PStates[ Index(((P2 *)_this)->this, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 32
		;
		now.lock = trpt->bup.oval;
		;
		goto R999;

		 /* PROC TrafficLight */

	case 27: // STATE 1
		;
		((P1 *)_this)->_5_3_tmp = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 3
		;
		now.lock = trpt->bup.ovals[1];
		((P1 *)_this)->_5_3_tmp = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 29: // STATE 5
		;
	/* 0 */	((P1 *)_this)->_5_3_tmp = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 31: // STATE 18
		;
		((P1 *)_this)->counter = trpt->bup.ovals[1];
		now.LStates[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 33: // STATE 23
		;
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 35: // STATE 29
		;
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[1];
		((P1 *)_this)->counter = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 36: // STATE 31
		;
	/* 0 */	((P1 *)_this)->counter = trpt->bup.oval;
		;
		;
		goto R999;

	case 37: // STATE 36
		;
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[2];
		now.LStates[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[1];
		((P1 *)_this)->counter = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 39: // STATE 42
		;
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[1];
		((P1 *)_this)->counter = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 40: // STATE 44
		;
	/* 0 */	((P1 *)_this)->counter = trpt->bup.oval;
		;
		;
		goto R999;

	case 41: // STATE 49
		;
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[2];
		now.LStates[ Index(((P1 *)_this)->this, 2) ] = trpt->bup.ovals[1];
		((P1 *)_this)->counter = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 42: // STATE 55
		;
		now.lock = trpt->bup.oval;
		;
		goto R999;

		 /* PROC Signal */

	case 43: // STATE 1
		;
		((P0 *)_this)->light = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 2
		;
		((P0 *)_this)->light = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 5
		;
		now.Cars[ Index(((P0 *)_this)->light, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 46: // STATE 7
		;
		now.Peds[ Index(((P0 *)_this)->light, 2) ] = trpt->bup.oval;
		;
		goto R999;
	}

