; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Results-screen sprite mappings
; -------------------------------------------------------------------------

MapSpr_ResultsBad:
	dc.w	MapSpr_ResultsBadHeader-MapSpr_ResultsBad
	dc.w	MapSpr_ResultsScore-MapSpr_ResultsBad
	dc.w	MapSpr_ResultsBadAct1-MapSpr_ResultsBad
	dc.w	MapSpr_ResultsBadAct2-MapSpr_ResultsBad
	dc.w	MapSpr_ResultsBadAct3-MapSpr_ResultsBad

MapSpr_ResultsBadSSZ3:
	dc.w	MapSpr_ResultsBadHeader-MapSpr_ResultsBadSSZ3
	dc.w	MapSpr_ResultsSSZ3Score-MapSpr_ResultsBadSSZ3
	dc.w	MapSpr_ResultsBadAct1-MapSpr_ResultsBadSSZ3
	dc.w	MapSpr_ResultsBadAct2-MapSpr_ResultsBadSSZ3
	dc.w	MapSpr_ResultsBadAct3-MapSpr_ResultsBadSSZ3

MapSpr_ResultsGood:
	dc.w	MapSpr_ResultsGoodHeader-MapSpr_ResultsGood
	dc.w	MapSpr_ResultsScore-MapSpr_ResultsGood
	dc.w	MapSpr_ResultsGoodAct1-MapSpr_ResultsGood
	dc.w	MapSpr_ResultsGoodAct2-MapSpr_ResultsGood
	dc.w	MapSpr_ResultsGoodAct3-MapSpr_ResultsGood

MapSpr_ResultsGoodSSZ3:
	dc.w	MapSpr_ResultsGoodHeader-MapSpr_ResultsGoodSSZ3
	dc.w	MapSpr_ResultsSSZ3Score-MapSpr_ResultsGoodSSZ3
	dc.w	MapSpr_ResultsGoodAct1-MapSpr_ResultsGoodSSZ3
	dc.w	MapSpr_ResultsGoodAct2-MapSpr_ResultsGoodSSZ3
	dc.w	MapSpr_ResultsGoodAct3-MapSpr_ResultsGoodSSZ3

; Each frame starts with a piece count followed by five-byte sprite pieces:
; Y offset, size, tile attributes, tile index, and X offset.

MapSpr_ResultsBadHeader:
	dc.b	8
	dc.b	$EC, 5, 0, 0, $BC
	dc.b	$EC, 5, 0, 4, $CC
	dc.b	$EC, 5, 0, 8, $DC
	dc.b	$EC, 1, 0, $C, $EC
	dc.b	$EC, 5, 0, $E, $F4
	dc.b	$EC, 5, 0, $12, $14
	dc.b	$EC, 5, 0, 4, $24
	dc.b	$EC, 5, 0, $16, $34
	even

MapSpr_ResultsBadAct1:
	dc.b	$A
	dc.b	4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC
	dc.b	4, 5, 0, 4, $CC
	dc.b	4, 5, 0, $22, $DC
	dc.b	4, 5, 0, $12, $EC
	dc.b	4, 5, 0, $1A, $FC
	dc.b	4, $D, 0, $26, $1C
	dc.b	4, 9, 0, $2E, $3C
	dc.b	4, 1, 0, $34, $5C
	even

MapSpr_ResultsBadAct2:
	dc.b	$A
	dc.b	4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC
	dc.b	4, 5, 0, 4, $CC
	dc.b	4, 5, 0, $22, $DC
	dc.b	4, 5, 0, $12, $EC
	dc.b	4, 5, 0, $1A, $FC
	dc.b	4, $D, 0, $26, $1C
	dc.b	4, 9, 0, $2E, $3C
	dc.b	4, 5, 0, $4A, $5C
	even

MapSpr_ResultsBadAct3:
	dc.b	$A
	dc.b	4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC
	dc.b	4, 5, 0, 4, $CC
	dc.b	4, 5, 0, $22, $DC
	dc.b	4, 5, 0, $12, $EC
	dc.b	4, 5, 0, $1A, $FC
	dc.b	4, $D, 0, $26, $1C
	dc.b	4, 9, 0, $2E, $3C
	dc.b	4, 5, 0, $4E, $5C
	even

MapSpr_ResultsGoodHeader:
	dc.b	$E
	dc.b	$EC, 5, 0, 0, $80
	dc.b	$EC, 5, 0, 4, $90
	dc.b	$EC, 5, 0, 8, $A0
	dc.b	$EC, 1, 0, $C, $B0
	dc.b	$EC, 5, 0, $E, $B8
	dc.b	$EC, 5, 0, $36, $D0
	dc.b	$EC, 5, 0, $3A, $E0
	dc.b	$EC, 5, 0, $3E, $F0
	dc.b	$EC, 5, 0, $42, 0
	dc.b	$EC, 5, 0, $3A, $20
	dc.b	$EC, 5, 0, $12, $40
	dc.b	$EC, 5, 0, 4, $50
	dc.b	$EC, 5, 0, 4, $60
	dc.b	$EC, 5, 0, $3E, $70
	even

MapSpr_ResultsGoodAct1:
	dc.b	$B
	dc.b	4, 5, 0, $46, $90
	dc.b	4, 5, 0, $22, $A0
	dc.b	4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0
	dc.b	4, 5, 0, $1E, $D0
	dc.b	4, 5, 0, $42, $E0
	dc.b	4, 1, 0, $C, 0
	dc.b	4, 5, 0, 8, 8
	dc.b	4, $D, 0, $26, $28
	dc.b	4, 9, 0, $2E, $48
	dc.b	4, 1, 0, $34, $68
	even

MapSpr_ResultsGoodAct2:
	dc.b	$B
	dc.b	4, 5, 0, $46, $90
	dc.b	4, 5, 0, $22, $A0
	dc.b	4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0
	dc.b	4, 5, 0, $1E, $D0
	dc.b	4, 5, 0, $42, $E0
	dc.b	4, 1, 0, $C, 0
	dc.b	4, 5, 0, 8, 8
	dc.b	4, $D, 0, $26, $28
	dc.b	4, 9, 0, $2E, $48
	dc.b	4, 5, 0, $4A, $68
	even

MapSpr_ResultsGoodAct3:
	dc.b	$B
	dc.b	4, 5, 0, $46, $90
	dc.b	4, 5, 0, $22, $A0
	dc.b	4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0
	dc.b	4, 5, 0, $1E, $D0
	dc.b	4, 5, 0, $42, $E0
	dc.b	4, 1, 0, $C, 0
	dc.b	4, 5, 0, 8, 8
	dc.b	4, $D, 0, $26, $28
	dc.b	4, 9, 0, $2E, $48
	dc.b	4, 5, 0, $4E, $68
	even

MapSpr_ResultsScore:
	dc.b	$E
	dc.b	$E0, $D, 0, $52, $D4
	dc.b	$E0, 1, 0, $5A, $F4
	dc.b	$F8, $D, 0, $5C, $D4
	dc.b	$F8, $D, 0, $64, $FC
	dc.b	$F8, 5, 0, $6C, $1C
	dc.b	$10, $D, 0, $70, $D4
	dc.b	$10, $D, 0, $64, $FC
	dc.b	$10, 5, 0, $6C, $1C
	dc.b	$F8, $D, 0, $82, $58
	dc.b	$F8, 1, 0, $8A, $78
	dc.b	$10, $D, 0, $78, $58
	dc.b	$10, 1, 0, $80, $78
	dc.b	$E0, 9, 1, $BF, $48
	dc.b	$E0, $D, 1, $C5, $60
	even

MapSpr_ResultsSSZ3Score:
	dc.b	$E
	dc.b	$E0, $D, 0, $52, $D4
	dc.b	$E0, 1, 0, $5A, $F4
	dc.b	$F8, $D, 0, $5C, $D4
	dc.b	$F8, $D, 0, $64, $FC
	dc.b	$F8, 5, 0, $6C, $1C
	dc.b	$10, $D, 0, $70, $D4
	dc.b	$10, $D, 0, $64, $FC
	dc.b	$10, 5, 0, $6C, $1C
	dc.b	$F8, $D, 0, $82, $58
	dc.b	$F8, 1, 0, $8A, $78
	dc.b	$10, $D, 0, $78, $58
	dc.b	$10, 1, 0, $80, $78
	dc.b	$E0, 9, 2, $91, $48
	dc.b	$E0, $D, 2, $97, $60

; ------------------------------------------------------------------------------
