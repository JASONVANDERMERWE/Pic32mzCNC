_calcSteps:
;Steptodistance.c,7 :: 		signed long calcSteps(double mmsToMove,  double Dia){
;Steptodistance.c,13 :: 		circ = Dia*Pi;
LUI	R2, 16457
ORI	R2, R2, 5767
MTC1	R2, S0
MUL.S 	S0, S13, S0
;Steptodistance.c,17 :: 		cirDivision = mmsToMove / circ;
DIV.S 	S1, S12, S0
;Steptodistance.c,18 :: 		stepsToMove = cirDivision * SPR;
LUI	R2, 17736
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
;Steptodistance.c,20 :: 		return (signed long)stepsToMove;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,21 :: 		}
L_end_calcSteps:
JR	RA
NOP	
; end of _calcSteps
