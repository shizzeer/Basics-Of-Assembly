PROG SEGMENT CODE
 

CSEG AT 0
JMP start
 
RSEG PROG
start:
	sprawdz_diode0:
		JNB P3.0,czy_trzymany0	; sprawdzenie czy przycisk 0 zostal wcisniety
		JMP sprawdz_diode1
	czy_trzymany0:
		CLR C					; jezeli przycisk 0 jest wcisniety to wyzeruj Carry Flag
		ORL C, P3.0				; Carry Flag OR przycisk 0, flaga bedzie ustawiona jezeli przycisk zostal juz zwolniony
		JC klik0				; Jezeli przycisk byl wcisniety, ale juz jest zwolniony to skocz to klik0
		JMP czy_trzymany0		; Jezeli przycisk do tego momentu nie zostal zwolniony (jest trzymany) to sprawdzaj 
								; do momentu az zostanie zwolniony.
	klik0:
		CPL P2.0				; Przycisk zostal wcisniety i zwolniony, czyli klikniety, wiec zmieniamy stan diody (NOT)
	sprawdz_diode1:
		JNB P3.1 ,czy_trzymany1
		JMP sprawdz_diode2
	czy_trzymany1:
		CLR C
		ORL C, P3.1
		JC klik1
		JMP czy_trzymany1
	klik1:
		CPL P2.1
	sprawdz_diode2:
		JNB P3.2 ,czy_trzymany2
		JMP sprawdz_diode3
	czy_trzymany2:
		CLR C
		ORL C, P3.2
		JC klik2
		JMP czy_trzymany2
	klik2:
		CPL P2.2
	sprawdz_diode3:
		JNB P3.3 ,czy_trzymany3
		JMP sprawdz_diode4
	czy_trzymany3:
		CLR C
		ORL C, P3.3
		JC klik3
		JMP czy_trzymany3
	klik3:
		CPL P2.3
	sprawdz_diode4:
		JNB P3.4 ,czy_trzymany4
		JMP sprawdz_diode5
	czy_trzymany4:
		CLR C
		ORL C, P3.4
		JC klik4
		JMP czy_trzymany4
	klik4:
		CPL P2.4
	sprawdz_diode5:
		JNB P3.5 ,czy_trzymany5
		JMP sprawdz_diode6
	czy_trzymany5:
		CLR C
		ORL C, P3.5
		JC klik5
		JMP czy_trzymany5
	klik5:
		CPL P2.5
	sprawdz_diode6:
		JNB P3.6 ,czy_trzymany6
		JMP sprawdz_diode7
	czy_trzymany6:
		CLR C
		ORL C, P3.6
		JC klik6
		JMP czy_trzymany6
	klik6:
		CPL P2.6
	sprawdz_diode7:
		JNB P3.7 ,czy_trzymany7
		JMP start
	czy_trzymany7:
		CLR C
		ORL C, P3.7
		JC klik7
		JMP czy_trzymany7
	klik7:
		CPL P2.7	
SJMP start
END