PROG SEGMENT CODE
CSEG AT 0
JMP start
RSEG PROG
 start:
	sprawdz_czy_przycisk_wcisniety:
		sprawdz_diode0:
			JNB P3.0,czy_zapalic_diode0
			SETB P2.0	; jezeli przycisk jest zwolniony to zgas palaca sie diode
						; w przypadku gdy dioda jest zgaszona to nadal zgaszona pozostanie
		sprawdz_diode1:
			JNB P3.1,czy_zapalic_diode1
			SETB P2.1
		sprawdz_diode2:
			JNB P3.2,czy_zapalic_diode2
			SETB P2.2
		sprawdz_diode3:
			JNB P3.3,czy_zapalic_diode3
			SETB P2.3
		sprawdz_diode4:
			JNB P3.4,czy_zapalic_diode4
			SETB P2.4
		sprawdz_diode5:
			JNB P3.5,czy_zapalic_diode5
			SETB P2.5
		sprawdz_diode6:
			JNB P3.6,czy_zapalic_diode6
			SETB P2.6
		sprawdz_diode7:
			JNB P3.7,czy_zapalic_diode7
			SETB P2.7
		JMP sprawdz_diode0
		czy_zapalic_diode0:
			JNB P2.0,sprawdz_diode1
			CLR P2.0	
			JMP sprawdz_diode1
		czy_zapalic_diode1:
			JNB P2.1,sprawdz_diode2
			CLR P2.1	
			JMP sprawdz_diode2
		czy_zapalic_diode2:
			JNB P2.2,sprawdz_diode3
			CLR P2.2	
			JMP sprawdz_diode3
		czy_zapalic_diode3:
			JNB P2.3,sprawdz_diode4
			CLR P2.3	
			JMP sprawdz_diode4
		czy_zapalic_diode4:
			JNB P2.4,sprawdz_diode5
			CLR P2.4	
			JMP sprawdz_diode5
		czy_zapalic_diode5:
			JNB P2.5,sprawdz_diode6
			CLR P2.5	
			JMP sprawdz_diode6
		czy_zapalic_diode6:
			JNB P2.6,sprawdz_diode7
			CLR P2.6	
			JMP sprawdz_diode7
		czy_zapalic_diode7:
			JNB P2.7,sprawdz_diode0
			CLR P2.7	
			JMP sprawdz_diode0
END 