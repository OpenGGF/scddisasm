; USA retained animated/static helper and orphan PLC graph.
; Shared by the Palmtree Panic USA padding stream and Collision Chaos R32C/D.
; Relative ranges: helper $000-$0E1, static metadata $0E2-$0F9, graph $0FA-$223.
; ------------------------------------------------------------------------------
USARetainedHelperAndGraph:
; Retained animated/static helper machine code and animated metadata.
	dc.w	$FE60, $3C3C, $001F, $6100, $002A, $6624, $4BF9, $00C0
	dc.w	$0004, $2ABC, $9400, $9340, $2ABC, $968C, $95C0, $3ABC
	dc.w	$977F, $3ABC, $5540, $31FC, $0081, $F640, $3AB8, $F640
	dc.w	$4E75, $5312, $6A42, $7000, $1014, $5200, $B011, $6502
	dc.w	$7000, $1880, $D040, $14B1, $0002, $1031, $0003, $4880
	dc.w	$D040, $D040, $7200, $1211, $D241, $D041, $2271, $0002
	dc.w	$47F9, $00FF, $1980, $26D9, $51CE, $FFFC, $D4FC, $0001
	dc.w	$D8FC, $0001, $7000, $4E75, $D4FC, $0001, $D8FC, $0001
	dc.w	$7001, $4E75, $0400, $0400, $0901, $0402, $0F03, $0023
	dc.w	$3F0C, $0023, $3F8C, $0023, $400C, $0023, $408C, $5312
	dc.w	$6A00, $0034, $1491, $7000, $1014, $5200, $B029, $0001
	dc.w	$6502, $7000, $1880, $D040, $D040, $2271, $0002, $47F9
	dc.w	$00FF, $1980, $26D9, $51CE, $FFFC, $D4FC, $0001, $D8FC
	dc.w	$0001, $7000, $4E75, $D4FC, $0001, $D8FC, $0001, $7001
	dc.w	$4E75
; Static PLC metadata: reset/frame counts followed by frame pointers.
USARetainedStaticPLCMetadata:
	dc.b	4, 3
	dc.l	$00233C0C, $00233D0C, $00233E0C
	dc.b	3, 2
	dc.l	$00233B0C, $00233B8C
; Orphan stage descriptor, PLC index, and retained PLC lists.
USARetainedOrphanStagePLCGraph:
	dc.w	$0323, $81DC, $0223, $6F30, $0021, $0000, $0081, $0404
	dc.w	$0026, $002E, $008A, $0026, $008A, $008A, $008A, $008A
	dc.w	$008A, $008A, $008A, $008A, $008A, $008A, $008A, $008A
	dc.w	$00E6, $008A, $00EE, $0000, $0023, $81DC, $0000, $000E
	dc.w	$0023, $0DA2, $6C00, $0023, $39BC, $7A00, $0023, $CA20
	dc.w	$8700, $0023, $CC94, $8AE0, $0023, $CFF4, $9100, $0023
	dc.w	$D458, $9500, $0023, $D2B6, $9900, $0023, $DC52, $9A00
	dc.w	$0023, $213A, $A400, $0023, $34BC, $AD00, $0023, $235C
	dc.w	$B500, $0023, $2960, $D000, $0022, $EDE6, $D8C0, $0023
	dc.w	$3732, $DAE0, $0023, $2E48, $F5C0, $000E, $0022, $F8FC
	dc.w	$5780, $0023, $4378, $5C20, $0023, $4220, $6200, $0023
	dc.w	$B174, $6800, $0023, $C8EE, $6B00, $0023, $B2B2, $6D40
	dc.w	$0023, $BE78, $7340, $0023, $BECA, $7400, $0023, $D378
	dc.w	$7500, $0023, $D6B0, $7700, $0023, $BD98, $7D00, $0023
	dc.w	$DB7A, $7F00, $0023, $410C, $8000, $0023, $C34E, $8200
	dc.w	$0023, $C066, $9D00, $0000, $0023, $0098, $7880, $0002
	dc.w	$0022, $FABC, $8780, $0022, $F4F2, $9100, $0020, $BBBC
	dc.w	$7DE0, $7DE0, $0023, $D59E, $78C0, $0023, $C440, $7D20
	dc.w	$0023, $D0C4, $8BA0, $0000, $0023
