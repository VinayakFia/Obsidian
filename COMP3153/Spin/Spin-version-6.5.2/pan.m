#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - lights_v2.pml:109 - [(run TrafficLight(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - lights_v2.pml:110 - [(run TrafficLight(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!(addproc(II, 1, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - lights_v2.pml:112 - [(run PedestrianLight(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		if (!(addproc(II, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - lights_v2.pml:113 - [(run PedestrianLight(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][4] = 1;
		if (!(addproc(II, 1, 2, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - lights_v2.pml:115 - [(run Signal(40))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		if (!(addproc(II, 1, 0, 40)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - lights_v2.pml:116 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Safety */
	case 9: // STATE 1 - lights_v2.pml:96 - [assert(!(((LStates[0]==GREEN)&&(LStates[1]==GREEN))))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		spin_assert( !(((now.LStates[0]==2)&&(now.LStates[1]==2))), " !(((LStates[0]==2)&&(LStates[1]==2)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 2 - lights_v2.pml:97 - [assert(!(((LStates[0]==AMBER)&&(LStates[1]==AMBER))))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		spin_assert( !(((now.LStates[0]==1)&&(now.LStates[1]==1))), " !(((LStates[0]==1)&&(LStates[1]==1)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - lights_v2.pml:98 - [assert(!(((LStates[0]==AMBER)&&(LStates[1]==GREEN))))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		spin_assert( !(((now.LStates[0]==1)&&(now.LStates[1]==2))), " !(((LStates[0]==1)&&(LStates[1]==2)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - lights_v2.pml:99 - [assert(!(((LStates[0]==GREEN)&&(LStates[1]==AMBER))))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		spin_assert( !(((now.LStates[0]==2)&&(now.LStates[1]==1))), " !(((LStates[0]==2)&&(LStates[1]==1)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - lights_v2.pml:102 - [assert(!(((PStates[0]==GREEN)&&(LStates[1]==GREEN))))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		spin_assert( !(((now.PStates[0]==2)&&(now.LStates[1]==2))), " !(((PStates[0]==2)&&(LStates[1]==2)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 6 - lights_v2.pml:103 - [assert(!(((PStates[1]==GREEN)&&(LStates[0]==GREEN))))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		spin_assert( !(((now.PStates[1]==2)&&(now.LStates[0]==2))), " !(((PStates[1]==2)&&(LStates[0]==2)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 10 - lights_v2.pml:105 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC PedestrianLight */
	case 16: // STATE 1 - lights_v2.pml:14 - [tmp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->_6_17_tmp);
		((P2 *)_this)->_6_17_tmp = 0;
#ifdef VAR_RANGES
		logval("PedestrianLight:tmp", ((int)((P2 *)_this)->_6_17_tmp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - lights_v2.pml:16 - [tmp = lock] (0:8:2 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P2 *)_this)->_6_17_tmp);
		((P2 *)_this)->_6_17_tmp = ((int)now.lock);
#ifdef VAR_RANGES
		logval("PedestrianLight:tmp", ((int)((P2 *)_this)->_6_17_tmp));
#endif
		;
		/* merge: lock = 1(8, 3, 8) */
		reached[2][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.lock);
		now.lock = 1;
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 5 - lights_v2.pml:20 - [(tmp)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (!(((int)((P2 *)_this)->_6_17_tmp)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _6_17_tmp */  (trpt+1)->bup.oval = ((P2 *)_this)->_6_17_tmp;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->_6_17_tmp = 0;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 14 - lights_v2.pml:83 - [(((LStates[other]==RED)&&(Peds[0]>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		if (!(((now.LStates[ Index(((P2 *)_this)->other, 2) ]==3)&&(now.Peds[0]>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 16 - lights_v2.pml:83 - [printf('P%d->Green\\n',this)] (0:33:2 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		Printf("P%d->Green\n", ((P2 *)_this)->this);
		/* merge: PStates[this] = GREEN(33, 17, 33) */
		reached[2][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.PStates[ Index(((P2 *)_this)->this, 2) ];
		now.PStates[ Index(((P2 *)_this)->this, 2) ] = 2;
#ifdef VAR_RANGES
		logval("PStates[PedestrianLight:this]", now.PStates[ Index(((P2 *)_this)->this, 2) ]);
#endif
		;
		/* merge: counter = 3(33, 18, 33) */
		reached[2][18] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->counter;
		((P2 *)_this)->counter = 3;
#ifdef VAR_RANGES
		logval("PedestrianLight:counter", ((P2 *)_this)->counter);
#endif
		;
		/* merge: .(goto)(0, 31, 33) */
		reached[2][31] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 21: // STATE 20 - lights_v2.pml:86 - [(((PStates[this]==GREEN)&&(counter>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!(((now.PStates[ Index(((P2 *)_this)->this, 2) ]==2)&&(((P2 *)_this)->counter>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 22 - lights_v2.pml:86 - [printf('P%d-Green\\n',this)] (0:33:1 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		Printf("P%d-Green\n", ((P2 *)_this)->this);
		/* merge: counter = (counter-1)(33, 23, 33) */
		reached[2][23] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->counter;
		((P2 *)_this)->counter = (((P2 *)_this)->counter-1);
#ifdef VAR_RANGES
		logval("PedestrianLight:counter", ((P2 *)_this)->counter);
#endif
		;
		/* merge: .(goto)(0, 31, 33) */
		reached[2][31] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 25 - lights_v2.pml:87 - [(((PStates[this]==GREEN)&&(counter==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][25] = 1;
		if (!(((now.PStates[ Index(((P2 *)_this)->this, 2) ]==2)&&(((P2 *)_this)->counter==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 27 - lights_v2.pml:87 - [printf('P%d->RED\\n',this)] (0:33:1 - 1)
		IfNotBlocked
		reached[2][27] = 1;
		Printf("P%d->RED\n", ((P2 *)_this)->this);
		/* merge: PStates[this] = RED(33, 28, 33) */
		reached[2][28] = 1;
		(trpt+1)->bup.oval = now.PStates[ Index(((P2 *)_this)->this, 2) ];
		now.PStates[ Index(((P2 *)_this)->this, 2) ] = 3;
#ifdef VAR_RANGES
		logval("PStates[PedestrianLight:this]", now.PStates[ Index(((P2 *)_this)->this, 2) ]);
#endif
		;
		/* merge: .(goto)(0, 31, 33) */
		reached[2][31] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: // STATE 32 - lights_v2.pml:28 - [lock = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		(trpt+1)->bup.oval = ((int)now.lock);
		now.lock = 0;
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		_m = 3; goto P999; /* 0 */

		 /* PROC TrafficLight */
	case 26: // STATE 1 - lights_v2.pml:14 - [tmp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_5_3_tmp);
		((P1 *)_this)->_5_3_tmp = 0;
#ifdef VAR_RANGES
		logval("TrafficLight:tmp", ((int)((P1 *)_this)->_5_3_tmp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 2 - lights_v2.pml:16 - [tmp = lock] (0:8:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->_5_3_tmp);
		((P1 *)_this)->_5_3_tmp = ((int)now.lock);
#ifdef VAR_RANGES
		logval("TrafficLight:tmp", ((int)((P1 *)_this)->_5_3_tmp));
#endif
		;
		/* merge: lock = 1(8, 3, 8) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.lock);
		now.lock = 1;
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 28: // STATE 5 - lights_v2.pml:20 - [(tmp)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(((int)((P1 *)_this)->_5_3_tmp)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _5_3_tmp */  (trpt+1)->bup.oval = ((P1 *)_this)->_5_3_tmp;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->_5_3_tmp = 0;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 14 - lights_v2.pml:60 - [(((((LStates[this]==RED)&&(LStates[other]==RED))&&(Cars[this]>0))&&(PStates[other]==RED)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!(((((now.LStates[ Index(((P1 *)_this)->this, 2) ]==3)&&(now.LStates[ Index(((P1 *)_this)->other, 2) ]==3))&&(now.Cars[ Index(((P1 *)_this)->this, 2) ]>0))&&(now.PStates[ Index(((P1 *)_this)->other, 2) ]==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 16 - lights_v2.pml:60 - [printf('L%d->Green\\n',this)] (0:56:2 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		Printf("L%d->Green\n", ((P1 *)_this)->this);
		/* merge: LStates[this] = GREEN(56, 17, 56) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.LStates[ Index(((P1 *)_this)->this, 2) ];
		now.LStates[ Index(((P1 *)_this)->this, 2) ] = 2;
#ifdef VAR_RANGES
		logval("LStates[TrafficLight:this]", now.LStates[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: counter = 5(56, 18, 56) */
		reached[1][18] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->counter;
		((P1 *)_this)->counter = 5;
#ifdef VAR_RANGES
		logval("TrafficLight:counter", ((P1 *)_this)->counter);
#endif
		;
		/* merge: .(goto)(0, 54, 56) */
		reached[1][54] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 31: // STATE 20 - lights_v2.pml:63 - [((((LStates[this]==GREEN)&&(Cars[other]==0))&&(counter>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!((((now.LStates[ Index(((P1 *)_this)->this, 2) ]==2)&&(now.Cars[ Index(((P1 *)_this)->other, 2) ]==0))&&(((P1 *)_this)->counter>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 22 - lights_v2.pml:63 - [printf('L%d-GreenInf\\n',this)] (0:56:1 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		Printf("L%d-GreenInf\n", ((P1 *)_this)->this);
		/* merge: Cars[this] = (Cars[this]-1)(56, 23, 56) */
		reached[1][23] = 1;
		(trpt+1)->bup.oval = now.Cars[ Index(((P1 *)_this)->this, 2) ];
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = (now.Cars[ Index(((P1 *)_this)->this, 2) ]-1);
#ifdef VAR_RANGES
		logval("Cars[TrafficLight:this]", now.Cars[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: .(goto)(0, 54, 56) */
		reached[1][54] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 33: // STATE 25 - lights_v2.pml:64 - [((((LStates[this]==GREEN)&&(Cars[other]>0))&&(counter>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (!((((now.LStates[ Index(((P1 *)_this)->this, 2) ]==2)&&(now.Cars[ Index(((P1 *)_this)->other, 2) ]>0))&&(((P1 *)_this)->counter>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 27 - lights_v2.pml:64 - [printf('L%d-Green%d\\n',this,counter)] (0:56:2 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		Printf("L%d-Green%d\n", ((P1 *)_this)->this, ((P1 *)_this)->counter);
		/* merge: counter = (counter-1)(56, 28, 56) */
		reached[1][28] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->counter;
		((P1 *)_this)->counter = (((P1 *)_this)->counter-1);
#ifdef VAR_RANGES
		logval("TrafficLight:counter", ((P1 *)_this)->counter);
#endif
		;
		/* merge: Cars[this] = (Cars[this]-1)(56, 29, 56) */
		reached[1][29] = 1;
		(trpt+1)->bup.ovals[1] = now.Cars[ Index(((P1 *)_this)->this, 2) ];
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = (now.Cars[ Index(((P1 *)_this)->this, 2) ]-1);
#ifdef VAR_RANGES
		logval("Cars[TrafficLight:this]", now.Cars[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: .(goto)(0, 54, 56) */
		reached[1][54] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 35: // STATE 31 - lights_v2.pml:65 - [(((LStates[this]==GREEN)&&(counter==0)))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][31] = 1;
		if (!(((now.LStates[ Index(((P1 *)_this)->this, 2) ]==2)&&(((P1 *)_this)->counter==0))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: counter */  (trpt+1)->bup.oval = ((P1 *)_this)->counter;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->counter = 0;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 33 - lights_v2.pml:65 - [printf('L%d->Amber\\n',this)] (0:56:3 - 1)
		IfNotBlocked
		reached[1][33] = 1;
		Printf("L%d->Amber\n", ((P1 *)_this)->this);
		/* merge: counter = 3(56, 34, 56) */
		reached[1][34] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->counter;
		((P1 *)_this)->counter = 3;
#ifdef VAR_RANGES
		logval("TrafficLight:counter", ((P1 *)_this)->counter);
#endif
		;
		/* merge: LStates[this] = AMBER(56, 35, 56) */
		reached[1][35] = 1;
		(trpt+1)->bup.ovals[1] = now.LStates[ Index(((P1 *)_this)->this, 2) ];
		now.LStates[ Index(((P1 *)_this)->this, 2) ] = 1;
#ifdef VAR_RANGES
		logval("LStates[TrafficLight:this]", now.LStates[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: Cars[this] = (Cars[this]-1)(56, 36, 56) */
		reached[1][36] = 1;
		(trpt+1)->bup.ovals[2] = now.Cars[ Index(((P1 *)_this)->this, 2) ];
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = (now.Cars[ Index(((P1 *)_this)->this, 2) ]-1);
#ifdef VAR_RANGES
		logval("Cars[TrafficLight:this]", now.Cars[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: .(goto)(0, 54, 56) */
		reached[1][54] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 37: // STATE 38 - lights_v2.pml:66 - [(((LStates[this]==AMBER)&&(counter>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][38] = 1;
		if (!(((now.LStates[ Index(((P1 *)_this)->this, 2) ]==1)&&(((P1 *)_this)->counter>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 40 - lights_v2.pml:66 - [printf('L%d-Amber%d\\n',this,counter)] (0:56:2 - 1)
		IfNotBlocked
		reached[1][40] = 1;
		Printf("L%d-Amber%d\n", ((P1 *)_this)->this, ((P1 *)_this)->counter);
		/* merge: counter = (counter-1)(56, 41, 56) */
		reached[1][41] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->counter;
		((P1 *)_this)->counter = (((P1 *)_this)->counter-1);
#ifdef VAR_RANGES
		logval("TrafficLight:counter", ((P1 *)_this)->counter);
#endif
		;
		/* merge: Cars[this] = (Cars[this]-1)(56, 42, 56) */
		reached[1][42] = 1;
		(trpt+1)->bup.ovals[1] = now.Cars[ Index(((P1 *)_this)->this, 2) ];
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = (now.Cars[ Index(((P1 *)_this)->this, 2) ]-1);
#ifdef VAR_RANGES
		logval("Cars[TrafficLight:this]", now.Cars[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: .(goto)(0, 54, 56) */
		reached[1][54] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 39: // STATE 44 - lights_v2.pml:67 - [(((LStates[this]==AMBER)&&(counter==0)))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][44] = 1;
		if (!(((now.LStates[ Index(((P1 *)_this)->this, 2) ]==1)&&(((P1 *)_this)->counter==0))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: counter */  (trpt+1)->bup.oval = ((P1 *)_this)->counter;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->counter = 0;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 46 - lights_v2.pml:67 - [printf('L%d->Red\\n',this)] (0:56:3 - 1)
		IfNotBlocked
		reached[1][46] = 1;
		Printf("L%d->Red\n", ((P1 *)_this)->this);
		/* merge: counter = 3(56, 47, 56) */
		reached[1][47] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->counter;
		((P1 *)_this)->counter = 3;
#ifdef VAR_RANGES
		logval("TrafficLight:counter", ((P1 *)_this)->counter);
#endif
		;
		/* merge: LStates[this] = RED(56, 48, 56) */
		reached[1][48] = 1;
		(trpt+1)->bup.ovals[1] = now.LStates[ Index(((P1 *)_this)->this, 2) ];
		now.LStates[ Index(((P1 *)_this)->this, 2) ] = 3;
#ifdef VAR_RANGES
		logval("LStates[TrafficLight:this]", now.LStates[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: Cars[this] = (Cars[this]-1)(56, 49, 56) */
		reached[1][49] = 1;
		(trpt+1)->bup.ovals[2] = now.Cars[ Index(((P1 *)_this)->this, 2) ];
		now.Cars[ Index(((P1 *)_this)->this, 2) ] = (now.Cars[ Index(((P1 *)_this)->this, 2) ]-1);
#ifdef VAR_RANGES
		logval("Cars[TrafficLight:this]", now.Cars[ Index(((P1 *)_this)->this, 2) ]);
#endif
		;
		/* merge: .(goto)(0, 54, 56) */
		reached[1][54] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 41: // STATE 55 - lights_v2.pml:28 - [lock = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][55] = 1;
		(trpt+1)->bup.oval = ((int)now.lock);
		now.lock = 0;
#ifdef VAR_RANGES
		logval("lock", ((int)now.lock));
#endif
		;
		_m = 3; goto P999; /* 0 */

		 /* PROC Signal */
	case 42: // STATE 1 - lights_v2.pml:38 - [light = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->light;
		((P0 *)_this)->light = 1;
#ifdef VAR_RANGES
		logval("Signal:light", ((P0 *)_this)->light);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 2 - lights_v2.pml:39 - [light = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->light;
		((P0 *)_this)->light = 0;
#ifdef VAR_RANGES
		logval("Signal:light", ((P0 *)_this)->light);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 5 - lights_v2.pml:43 - [Cars[light] = (Cars[light]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = now.Cars[ Index(((P0 *)_this)->light, 2) ];
		now.Cars[ Index(((P0 *)_this)->light, 2) ] = (now.Cars[ Index(((P0 *)_this)->light, 2) ]+1);
#ifdef VAR_RANGES
		logval("Cars[Signal:light]", now.Cars[ Index(((P0 *)_this)->light, 2) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 7 - lights_v2.pml:44 - [Peds[light] = (Peds[light]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = now.Peds[ Index(((P0 *)_this)->light, 2) ];
		now.Peds[ Index(((P0 *)_this)->light, 2) ] = (now.Peds[ Index(((P0 *)_this)->light, 2) ]+1);
#ifdef VAR_RANGES
		logval("Peds[Signal:light]", now.Peds[ Index(((P0 *)_this)->light, 2) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

