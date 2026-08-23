; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R31B)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R31B Padding1.asm"
	else
		dc.b	0, $A, $33, $72, $20, 2, 0, 8, $33, $72, $20, 2, 0, $2C, $33
		dc.b	$72, $20, 4, 0, $2A, $13, $72, $20, 6, 0, $1A, $C, 1, 0, 5
		dc.b	$66, $A, $16, $39, 0, $FF, $15, 7, $D7, $29, 0, $1A, $13
		dc.b	$72, $20, 7, 0, $1E, $52, 1, $51, $CE, $FF, $A4, $4E, $75
		dc.b	$70, 8, $32, $28, 0, $2E, $B2, $68, 0, $A, $67, $E, $6C, 2
		dc.b	$44, $40, $D1, $68, 0, $A, $4E, $F9, 0, $20, $3A, $6E, $58
		dc.b	$28, 0, $24, $4E, $F9, 0, $20, $3A, $6E, $70, 8, $32, $28
		dc.b	0, $2A, $B2, $68, 0, 8, $67, $E, $6C, 2, $44, $40, $D1, $68
		dc.b	0, 8, $4E, $F9, 0, $20, $3A, $6E, $58, $28, 0, $24, $4E, $F9
		dc.b	0, $20, $3A, $6E, $4A, $28, 0, $1E, $67, $A, $53, $28, 0
		dc.b	$1E, $4E, $F9, 0, $20, $3A, $6E, $70, $10, $32, $28, 0, $30
		dc.b	$B2, $68, 0, $A, $67, $E, $6C, 2, $44, $40, $D1, $68, 0, $A
		dc.b	$4E, $F9, 0, $20, $3A, $6E, $58, $28, 0, $24, $11, $FC, 0
		dc.b	1, $F7, $44, $70, 2, $4E, $F9, 0, $20, $24, $48, $4A, $28
		dc.b	0, $1E, $67, $A, $53, $28, 0, $1E, $4E, $F9, 0, $20, $3A
		dc.b	$6E, $70, $10, $32, $28, 0, $2C, $B2, $68, 0, 8, $67, $E
		dc.b	$6C, 2, $44, $40, $D1, $68, 0, 8, $4E, $F9, 0, $20, $3A, $6E
		dc.b	$4E, $F9, 0, $20, $3B, $1A, $4A, $B8, $F6, $80, $66, $E, $42
		dc.b	$38, $F7, $44, $42, $38, $F7, $CC, $4E, $F9, 0, $20, $3B
		dc.b	$1A, $4E, $75, $70, 0, $10, $28, 0, $24, $30, $3B, 0, 6, $4E
		dc.b	$FB, 0, 2, 0, $A, 0, $1E, 0, $EA, 1, $24, 1, $D8, $53, $28
		dc.b	0, $32, $67, 2, $4E, $75, $70, $10, $4E, $B9, 0, $20, $24
		dc.b	$48, $54, $28, 0, $24, $4A, $B8, $F6, $80, $66, $1C, $C, $79
		dc.b	5, 2, 0, $FF, $15, 6, $67, $14, $4D, $F8, $D0, 0, $30, $38
		dc.b	$F7, 0, 6, $40, 1, $50, $B0, $6E, 0, 8, $65, 2, $4E, $75
		dc.b	$45, $F9, 0, $20, $F6, $EE, $7C, 2, $72, 0, $22, $48, $31
		dc.b	$7C, 1, $68, 0, $32, $60, 6, $4E, $B9, 0, $20, $7B, $A, $33
		dc.b	$7C, 1, $68, 0, $32, $13, $7C, 0, $3A
		dcb.b	2,0
		dc.b	$13, $7C, 0, 4, 0, $24, $33, $7C, $83, $C4, 0, 2, $C, $79
		dc.b	5, 2, 0, $FF, $15, 6, $66, $20, $33, $7C, $82, $F2, 0, 2
		dc.b	$23, $7C, 0, $20, $F7, $10, 0, 4, $4A, $39, 0, $FF, $15, $6A
		dc.b	$67, $22, $23, $7C, 0, $20, $F7, $24, 0, 4, $60, $18, $23
		dc.b	$7C, 0, $20, $F7, 6, 0, 4, $4A, $39, 0, $FF, $15, $6A, $67
		dc.b	8, $23, $7C, 0, $20, $F7, $1A, 0, 4, $34, 1, $E7, $4A, $33
		dc.b	$72, $20
		dcb.b	2,0
		dc.b	$A, $33, $72, $20, 2, 0, 8, $33, $72, $20, 4, 0, $2A, $13
		dc.b	$72, $20, 7, 0, $1A, $C, 1, 0, 2, $66, $A, $14, $39, 0, $FF
		dc.b	$15, 7, $D5, $29, 0, $1A, $52, 1, $51, $CE, $FF, $70, $4E
		dc.b	$75, $4A, $68, 0, $32, $67, 4, $53, $68, 0, $32, $70, 8, $32
		dc.b	$28, 0, $2A, $B2, $68, 0, 8, $67, $18, $6C, 2, $44, $40, $D1
		dc.b	$68, 0, 8, $C, $68, 1, $60, 0, $32, $64, 6, $4E, $F9, 0, $20
		dc.b	$3A, $6E, $4E, $75, $4A, $28, 0, $1A, $66, $EA, $54, $28
		dc.b	0, $24, $60, $E4, $11, $FC, 0, 1, $F7, $D6, $70, 0, $4A, $78
		dc.b	$F7, $D2, $66, $30, $4A, $78, $F7, $D4, $66, $3A, $53, $68
		dc.b	0, $32, $6A, 4, $54, $28, 0, $24, $C, $68, 0, $1E, 0, $32
		dc.b	$66, $12, $4A, $39, 0, $FF, $15, $6E, $67, $A, $30, $3C, 0
		dc.b	$C8, $4E, $B9, 0, $20, $22, $7E, $4E, $F9, 0, $20, $3A, $6E
		dc.b	6, $40, 0, $A, 4, $78, 0, $64, $F7, $D2, $4A, $78, $F7, $D4
		dc.b	$67, $A, 6, $40, 0, $A, 4, $78, 0, $64, $F7, $D4, $22, 0
		dc.b	$4A, $78, $F7, $D2, $66, $2A, $4A, $78, $F7, $D4, $66, $24
		dc.b	$4E, $B9, 0, $20, $22, $16, $13, $FC, 0, $9A, 0, $A0, $1C
		dc.b	9, $4E, $B9, 0, $20, $22, $32, $C, $68, 0, $2D, 0, $32, $64
		dc.b	$24, $31, $7C, 0, $2D, 0, $32, $60, $1C, $4A, $68, 0, $32
		dc.b	$67, 4, $53, $68, 0, $32, 8, $28
		dcb.b	3,0
		dc.b	$32, $66, $A, $30, $3C, 0, $BD, $4E, $B9, 0, $20, $22, $7E
		dc.b	$20, 1, $4E, $B9, 0, $20, $A9, 6, $4E, $F9, 0, $20, $3A, $6E
		dc.b	$33, $FC, 0, 2, 0, $FF, $15, 2, $13, $FC
		dcb.b	3,0
		dc.b	$FF, $15, $22, $42, $79, 0, $FF, $15, $74, $42, $B9, 0, $FF
		dc.b	$19, 0, $42, $39, 0, $FF, $15, $6C, $42, $39, 0, $FF, $15
		dc.b	$6D, $42, $39, 0, $FF, $15, $8E, $4A, $39, 0, $FF, $F, 1
		dc.b	$67
		dcb.b	2,8
		dc.b	$B9
		dcb.b	3,0
		dc.b	$FF, $15, $1C, 8, $B9, 0, 1, 0, $FF, $15, $1C, $13, $FC, 0
		dc.b	1, 0, $FF, $15, $2E, $30, $39, 0, $FF, $15, 6, $52, 0, $C
		dcb.b	2,0
		dc.b	2, $66, 8, $13, $FC, 0, 2, 0, $FF, $15, $2E, $C
		dcb.b	2,0
		dc.b	3, $66, $C, $10, $3C
		dcb.b	2,0
		dc.b	6, $40, 1, 0, $10, $3C
		dcb.b	2,0
		dc.b	$33, $C0, 0, $FF, $15, 6, $4E, $B9, 0, $20, $78, $F8, $4E
		dc.b	$B9, 0, $20, $5C, $34, $4E, $B9, 0, $20, $3A, $6E, $10, $39
		dc.b	0, $FF, $15, 7, $53, 0, $6A, 8, $42, $39, 0, $FF, $15, $90
		dc.b	$4E, $75, $4A, $39, 0, $FF, $F, 1, $66, $30, $C, $39, 0, $7F
		dc.b	0, $FF, $F, $20, $67, $1E, $4A, $39, 0, $FF, $15, $6A, $67
		dc.b	$1E, $42, $39, 0, $FF, $15, $6A, 1, $F9, 0, $FF, $15, $90
		dc.b	$C, $39, 0, 3, 0, $FF, $15, $90, $66, 8, $13, $FC, 0, 1, 0
		dc.b	$FF, $15, $6A, $4E, $75, 0, $CC
		dcb.b	2,0
		dc.b	1, $20
		dcb.b	2,0
		dc.b	1, $10, 2
		dcb.b	2,0
		dc.b	$F0, 0, 1, 0, $CC
		dcb.b	2,0
		dc.b	1, $20, 0, 2, 0, $28, 1, $DE, 0, $52, 0, $86, 0, $BA, 0, $1E
		dc.b	2, $1C, 0, $48, 0, $7C, 0, $B0, 0, $DA, 1, $CA, 1, $22, 1
		dc.b	$5A, 1, $92, 0, $D0, 2, 8, 1, $18, 1, $50, 1, $88, 8, $EC
		dc.b	5
		dcb.b	2,0
		dc.b	$BC, $EC, 5, 0, 4, $CC, $EC, 5, 0, 8, $DC, $EC, 1, 0, $C
		dcb.b	2,$EC
		dc.b	5, 0, $E, $F4, $EC, 5, 0, $12, $14, $EC, 5, 0, 4, $24, $EC
		dc.b	5, 0, $16, $34, 0, $A, 4, 5, 0, $16, $9C, 4, 5, 0, $1A, $AC
		dc.b	4, 5, 0, $1E, $BC, 4, 5, 0, 4, $CC, 4, 5, 0, $22, $DC, 4
		dc.b	5, 0, $12, $EC, 4, 5, 0, $1A, $FC, 4, $D, 0, $26, $1C, 4
		dc.b	9, 0, $2E, $3C, 4, 1, 0, $34, $5C, 0, $A, 4, 5, 0, $16, $9C
		dc.b	4, 5, 0, $1A, $AC, 4, 5, 0, $1E, $BC, 4, 5, 0, 4, $CC, 4
		dc.b	5, 0, $22, $DC, 4, 5, 0, $12, $EC, 4, 5, 0, $1A, $FC, 4, $D
		dc.b	0, $26, $1C, 4, 9, 0, $2E, $3C, 4, 5, 0, $4A, $5C, 0, $A
		dc.b	4, 5, 0, $16, $9C, 4, 5, 0, $1A, $AC, 4, 5, 0, $1E, $BC, 4
		dc.b	5, 0, 4, $CC, 4, 5, 0, $22, $DC, 4, 5, 0, $12, $EC, 4, 5
		dc.b	0, $1A, $FC, 4, $D, 0, $26, $1C, 4, 9, 0, $2E, $3C, 4, 5
		dc.b	0, $4E, $5C, 0, $E, $EC, 5
		dcb.b	2,0
		dc.b	$80, $EC, 5, 0, 4, $90, $EC, 5, 0, 8, $A0, $EC, 1, 0, $C
		dc.b	$B0, $EC, 5, 0, $E, $B8, $EC, 5, 0, $36, $D0, $EC, 5, 0, $3A
		dc.b	$E0, $EC, 5, 0, $3E, $F0, $EC, 5, 0, $42, 0, $EC, 5, 0, $3A
		dc.b	$20, $EC, 5, 0, $12, $40, $EC, 5, 0, 4, $50, $EC, 5, 0, 4
		dc.b	$60, $EC, 5, 0, $3E, $70, 0, $B, 4, 5, 0, $46, $90, 4, 5
		dc.b	0, $22, $A0, 4, 5, 0, $16, $B0, 4, 5, 0, $22, $C0, 4, 5, 0
		dc.b	$1E, $D0, 4, 5, 0, $42, $E0, 4, 1, 0, $C, 0, 4, 5, 0
		dcb.b	2,8
		dc.b	4, $D, 0, $26, $28, 4, 9, 0, $2E, $48, 4, 1, 0, $34, $68
		dc.b	$B, 4, 5, 0, $46, $90, 4, 5, 0, $22, $A0, 4, 5, 0, $16, $B0
		dc.b	4, 5, 0, $22, $C0, 4, 5, 0, $1E, $D0, 4, 5, 0, $42, $E0, 4
		dc.b	1, 0, $C, 0, 4, 5, 0
		dcb.b	2,8
		dc.b	4, $D, 0, $26, $28, 4, 9, 0, $2E, $48, 4, 5, 0, $4A, $68
		dc.b	$B, 4, 5, 0, $46, $90, 4, 5, 0, $22, $A0, 4, 5, 0, $16, $B0
		dc.b	4, 5, 0, $22, $C0, 4, 5, 0, $1E, $D0, 4, 5, 0, $42, $E0, 4
		dc.b	1, 0, $C, 0, 4, 5, 0
		dcb.b	2,8
		dc.b	4, $D, 0, $26, $28, 4, 9, 0, $2E, $48, 4, 5, 0, $4E, $68
		dc.b	$E, $E0, $D, 0, $52, $D4, $E0, 1, 0, $5A, $F4, $F8, $D, 0
		dc.b	$5C, $D4, $F8, $D, 0, $64, $FC, $F8, 5, 0, $6C, $1C, $10
		dc.b	$D, 0, $70, $D4, $10, $D, 0, $64, $FC, $10, 5, 0, $6C, $1C
		dc.b	$F8, $D, 0, $82, $58, $F8, 1, 0, $8A, $78, $10, $D, 0, $78
		dc.b	$58, $10, 1, 0, $80, $78, $E0, 9, 1, $BF, $48, $E0, $D, 1
		dc.b	$C5, $60, 0, $E, $E0, $D, 0, $52, $D4, $E0, 1, 0, $5A, $F4
		dc.b	$F8, $D, 0, $5C, $D4, $F8, $D, 0, $64, $FC, $F8, 5, 0, $6C
		dc.b	$1C, $10, $D, 0, $70, $D4, $10, $D, 0, $64, $FC, $10, 5, 0
		dc.b	$6C, $1C, $F8, $D, 0, $82, $58, $F8, 1, 0, $8A, $78, $10
		dc.b	$D, 0, $78, $58, $10, 1, 0, $80, $78, $E0, 9, 2, $91, $48
		dc.b	$E0, $D, 2, $97, $60, 0, 1, $30, 2, $28, 1, $68, 1, $5A, 1
		dc.b	0, 2, $38, 1, $78, 2, $5A, 1, 0, 2, $40, 1, $80, 2, $5A, 1
		dc.b	0, 2, $48, 1, $88, 2, $5A, 1, $20, 2, $30, 1, $70, 3, $5A
		dc.b	1, $40, 2, $48, 1, $88, 4, $5A, 1, 0, 1, $D0, 1, $10, 7, $5A
		dc.b	1, 0, 1, $D0, 1, $10, 8, $5A, 0, $12, 0, $32, 0, $3E, 0, $4A
		dc.b	0, $64, 0, $88, 0, $AC, 0, $D0, 0, $F4, 6, $90, $F
		dcb.b	2,0
		dc.b	$F0, $B0, $F
		dcb.b	2,0
		dc.b	$F0, $D0, $F
		dcb.b	2,0
		dcb.b	2,$F0
		dc.b	$F
		dcb.b	2,0
		dc.b	$F0, $10, $F
		dcb.b	2,0
		dc.b	$F0, $30, $F
		dcb.b	2,0
		dc.b	$F0, 0, 2, $F8, 9, 0, $10, $E8, 0, 8, 0, $16
		dcb.b	2,0
		dc.b	2, $E8, 2, 0, $19, $FC, 0, 2, 0, $1C, $FC, 0, 5, $F8, $D
		dc.b	0, $1F, $B0, $F8, $D, 0, $27, $D0, $F8, $D, 0, $2F, $F0, $F8
		dc.b	$D, 0, $37, $10, $F8, $D, 0, $3F, $30, 7, $E8, 6, 0, $47
		dc.b	$E8, 0, 6, $10, $47
		dcb.b	2,$E8
		dc.b	6, 8, $47, 8, 0, 6, $18, $47, 8, $E8, 4, 0, $4D, $F8, $F0
		dc.b	7, 0, $4F, $F8, $10, 4, 0, $57, $F8, 7, $E8, 6, 0, $47, $E8
		dc.b	0, 6, $10, $47
		dcb.b	2,$E8
		dc.b	6, 8, $47, 8, 0, 6, 0, $59, 8, $E8, 5, 0, $5F
		dcb.b	2,$F8
		dc.b	6, 0, $63, $F8, $10, 4, 0, $57, $F8, 7, $E8, 6, 0, $47, $E8
		dc.b	0, 6, $10, $47
		dcb.b	2,$E8
		dc.b	6, 8, $47, 8, 0, 6, $18, $47, 8, $E8, 5, 0, $5F
		dcb.b	2,$F8
		dc.b	5, 0, $69, $F8, 8, 5, $10, $5F, $F8, 7, $E8, $E, 0, $78, $10
		dc.b	$E8, $E, 0, $84, $30, $E8, 6, 0, $90, $50, $C8
		dcb.b	2,0
		dc.b	$70, 8, $C8, 3, 0, $71, 0, $E8, 2, 0, $75, 0, $F8
		dcb.b	2,0
		dc.b	$70, 8, 6, 0, $E, 0, $96, $10, 0, 6, 0, $A2, $30
		dcb.b	3,0
		dc.b	$70, 8, 0, 3, 0, $71, 0, $20, 2, 0, $75, 0, $30
		dcb.b	2,0
		dc.b	$70, 8, 0, $4E, $F9, 0, $20, $64, $EC, 3, $23, $7B, $EE, 2
		dc.b	$23, $6C, $76, 0, $21
		dcb.b	3,0
		dc.b	$81
		dcb.b	2,4
		dc.b	0, $26, 0, $34, 0, $90, 0, $26, 0, $A4, 0, $EE, 1, $32, 1
		dc.b	$7C, 1, $84, 1, $CE, 1, $D6, 1, $E4, 1, $F2, 0, $90, 0, $90
		dc.b	0, $90, 1, $FA, 0, $90
		dcb.b	2,2
		dc.b	0, 1, 0, $23, $7B, $EE
		dcb.b	3,0
		dc.b	$23, $35, $E8, $D9, $60, 0, $E, 0, $22, $F8, $FC, $60
		dcb.b	2,0
		dc.b	$23, $D, $A2, $6C
		dcb.b	2,0
		dc.b	$23, $39, $8C, $7A
		dcb.b	2,0
		dc.b	$23, $60, $D6, $8D, $40, 0, $23, $63, $EC, $92, $A0, 0, $23
		dc.b	$47, $9A, $93, $A0, 0, $23, $4A, 0, $99, $C0, 0, $23, $1E
		dc.b	$2E, $9E, $40, 0, $23, $21, $3A, $A4
		dcb.b	2,0
		dc.b	$23, $34, $BC, $AD
		dcb.b	2,0
		dcb.b	2,$23
		dc.b	$5C, $B5
		dcb.b	2,0
		dc.b	$23, $29, $60, $D0
		dcb.b	2,0
		dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
		dc.b	$2E, $48, $F5, $C0, 0, 2, 0, $23, $57, $F0, $63, $C0, 0, $23
		dc.b	$4E, $AC, $67, $C0, 0, $23, $4C, $14, $69, $C0, 0, $B, 0
		dc.b	$23, $4D, $3A, $63, $C0, 0, $23, $4E, $AC, $67, $C0, 0, $23
		dc.b	$4C, $14, $69, $C0, 0, $23, $67, 2, $6B, $C0, 0, $23, $50
		dc.b	$4A, $6E, $20, 0, $23, $50, $C6, $6F, $20, 0, $23, $4F, $90
		dc.b	$73, $E0, 0, $23, $65, $C6, $75, $E0, 0, $23, $68, $A2, $77
		dc.b	$A0, 0, $23, $6A, $C6, $7B, $40, 0, $23, $54, $52, $7E, $40
		dc.b	0, $23, $5B, $D6, $84, $20, 0, $A, 0, $23, $4D, $3A, $63
		dc.b	$C0, 0, $23, $69, $7A, $67, $C0, 0, $23, $67, 2, $6B, $C0
		dc.b	0, $23, $50, $4A, $6E, $20, 0, $23, $50, $C6, $6F, $20, 0
		dc.b	$23, $4F, $90, $73, $E0, 0, $23, $65, $C6, $75, $E0, 0, $23
		dc.b	$68, $A2, $77, $A0, 0, $23, $6A, $C6, $7B, $40, 0, $23, $54
		dc.b	$52, $7E, $40, 0, $23, $5B, $D6, $84, $20, 0, $B, 0, $23
		dc.b	$4D, $3A, $63, $C0, 0, $23, $4E, $AC, $67, $C0, 0, $23, $4C
		dc.b	$14, $69, $C0, 0, $23, $67, 2, $6B, $C0, 0, $23, $50, $4A
		dc.b	$6E, $20, 0, $23, $50, $C6, $6F, $20, 0, $23, $4F, $90, $73
		dc.b	$E0, 0, $23, $65, $C6, $75, $E0, 0, $23, $68, $A2, $77, $A0
		dc.b	0, $23, $6A, $C6, $7B, $40, 0, $23, $54, $52, $7E, $40, 0
		dc.b	$23, $5B, $D6, $84, $20
		dcb.b	3,0
		dc.b	$23, $57, $F0, $63, $C0, 0, $B, 0, $23, $4D, $3A, $63, $C0
		dc.b	0, $23, $4E, $AC, $67, $C0, 0, $23, $4C, $14, $69, $C0, 0
		dc.b	$23, $67, 2, $6B, $C0, 0, $23, $50, $4A, $6E, $20, 0, $23
		dc.b	$50, $C6, $6F, $20, 0, $23, $4F, $90, $73, $E0, 0, $23, $65
		dc.b	$C6, $75, $E0, 0, $23, $68, $A2, $77, $A0, 0, $23, $6A, $C6
		dc.b	$7B, $40, 0, $23, $54, $52, $7E, $40, 0, $23, $5B, $D6, $84
		dc.b	$20
		dcb.b	3,0
		dc.b	$23, $69, $7A, $67, $C0, 0, 1, 0, $23, $4E, $AC, $67, $C0
		dc.b	0, $23, $4C, $14, $69, $C0, 0, 1, 0, $23, $B4, $86, $6B, $C0
		dc.b	0, $23, $AA, $D8, $7A
		dcb.b	4,0
		dc.b	$23, $60, $D6, $8D, $40
		dcb.b	3,0
		dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
		dc.b	$22, $F4, $F2, $91
		dcb.b	2,0
		dc.b	$20, $DC, $DE, $7D, $E0, $71
		dcb.b	2,0
		dc.b	$23, $70, $2A, $74
		dcb.b	2,0
		dc.b	$23, $67, $6C, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
		dc.b	$AE, 2, $88, $20, 0, $23, $20, $DA, $9E, $E0, 0, 4, 0, $23
		dc.b	$F2, $A6, $6E
		dcb.b	2,0
		dc.b	$23, $84, $6C, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
		dc.b	$AE, 2, $88, $20, 0, $23, $20, $DA, $9E, $E0, 0, 5, 0, $23
		dc.b	$64, $C2, $6E, $80, 0, $23, $81, $C0, $71
		dcb.b	2,0
		dc.b	$23, $70, $2A, $74
		dcb.b	2,0
		dc.b	$23, $6E, $46, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
		dc.b	$AE, 2, $88, $20, 0, 2, 0, $23, $73, $78, $76
		dcb.b	2,0
		dc.b	$23, $6E, $46, $81, $20, 0, $23, $79, $50, $85
		dcb.b	2,0
		dc.b	6, 0, $23, $64, $C2, $6E, $80, 0, $23, $AC, 8, $74
		dcb.b	2,0
		dc.b	$23, $73, $78, $76
		dcb.b	2,0
		dc.b	$23, $68, $12, $7C, $80, 0, $23, $67, $6C, $81, $20, 0, $23
		dc.b	$5E, $C0, $83
		dcb.b	2,0
		dc.b	$23, $79, $50, $85
		dcb.b	2,0
		dc.b	5, 0, $23, $6E, $46, $6E
		dcb.b	2,0
		dc.b	$23, $81, $C0, $71
		dcb.b	2,0
		dc.b	$23, $70, $2A, $74
		dcb.b	2,0
		dc.b	$23, $67, $6C, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
		dc.b	$AE, 2, $88, $20, 0, 1, 0, $23, $F2, $A6, $6E
		dcb.b	2,0
		dc.b	$23, $84, $6C, $81, $20
		dcb.b	3,0
		dc.b	$23, $28, $76, $78, $80, 0, 2, 0, $23, $22, $9A, $87, $80
		dc.b	0, $23, $1C, $D0, $91
		dcb.b	2,0
		dc.b	$20, $DB, $4A, $7D, $E0, $4E, $F9, 0, $20, $62, $94, 3, $23
		dc.b	$8E, $82, 2, $23, $7C, $FA, 0, $21
		dcb.b	3,0
		dc.b	$81
		dcb.b	2,5
		dc.b	0, $26, 0, $34, 0, $72, 0, $26, 0, $8C, 0, $72, 0, $72, 0
		dc.b	$72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72
		dc.b	0, $72, 0, $9A, 0, $72, 0, $A2, 0, 1, 0, $23, $8E, $82
		dcb.b	3,0
		dc.b	$23, $C8, $5C, $4A
		dcb.b	2,0
		dc.b	9, 0, $23, $D, $A2, $6C
		dcb.b	2,0
		dc.b	$23, $39, $E4, $7A
		dcb.b	2,0
		dc.b	$23, $1E, $2E, $9E, $40, 0, $23, $21, $3A, $A4
		dcb.b	2,0
		dc.b	$23, $34, $BC, $AD
		dcb.b	2,0
		dcb.b	2,$23
		dc.b	$5C, $B5
		dcb.b	2,0
		dc.b	$23, $29, $60, $D0
		dcb.b	2,0
		dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
		dc.b	$2E, $48, $F5, $C0, 0, 3, 0, $23, $3B, $2E, $57, $80, 0, $23
		dc.b	$54, $50, $6B, $60, 0, $23, $D0, $C6, $6F
		dcb.b	2,0
		dc.b	$23, $DD, $E0, $74
		dcb.b	2,0
		dc.b	1, 0, $23, $44, $40, $6E, $60, 0, $22, $EE, $4A, $90, $20
		dcb.b	3,0
		dc.b	$23, 0, $98, $78, $80
		dcb.b	3,0
		dc.b	$22, $EE, $4A, $90, $20
		dcb.b	3,0
		dc.b	$10, 2, 3, 4
		dcb.b	3,5
		dc.b	$FF, $FD, 9, $7C, $FF, $FE, $B7, $50, $FF, $FC, $25, $EE
		dcb.b	4,0
		dc.b	$FF, $FD, 9, $7C, 0, 1, $48, $B0, $4E, $F9, 0, $20, $63, $76
		dc.b	3, $23, $8F, $74, 2, $23, $7C, $F2, 0, $21
		dcb.b	3,0
		dc.b	$81
		dcb.b	2,4
		dc.b	0, $26, 0, $34, 0, $72, 0, $26, 0, $8C, 0, $72, 0, $72, 0
		dc.b	$72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72
		dc.b	0, $72, 0, $9A, 0, $72, 0, $A2, 0, 1, 0, $23, $8F, $74
		dcb.b	3,0
		dc.b	$23, $C4, $FA, $4A, $80, 0, 9, 0, $23, $D, $A2, $6C
		dcb.b	2,0
		dc.b	$23, $39, $E4, $7A
		dcb.b	2,0
		dc.b	$23, $1E, $2E, $9E, $40, 0, $23, $21, $3A, $A4
		dcb.b	2,0
		dc.b	$23, $34, $BC, $AD
		dcb.b	2,0
		dcb.b	2,$23
		dc.b	$5C, $B5
		dcb.b	2,0
		dc.b	$23, $29, $60, $D0
		dcb.b	2,0
		dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
		dc.b	$2E, $48, $F5, $C0, 0, 3, 0, $23, $3B, $2E, $57, $80, 0, $23
		dc.b	$54, $50, $6B, $60, 0, $23, $D3, $92, $6F
		dcb.b	2,0
		dc.b	$23, $E0, $4C, $74
		dcb.b	2,0
		dc.b	1, 0, $23, $44, $40, $6E, $60, 0, $22, $EE, $4A, $90, $20
		dcb.b	3,0
		dc.b	$23, 0, $98, $78, $80
		dcb.b	3,0
		dc.b	$22, $EE, $4A, $90, $20, $29, $60, $D0
		dcb.b	2,0
		dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
		dc.b	$2E, $48, $F5, $C0, 0, $B, 0, $23, $3B, $22, $60
		dcb.b	2,0
		dc.b	$23, $3F, $3E, $67
		dcb.b	2,0
		dc.b	$23, $40, $E2, $69, $A0, 0, $23, $B6, $26, $6C, $C0, 0, $23
		dc.b	$CD, $C8, $6E, $C0, 0, $23, $D0, 4, $70, $C0, 0, $23, $CA
		dc.b	$DC, $71, $C0, 0, $23, $B9, $E6, $72, $C0, 0, $22, $F8, $FC
		dc.b	$75, $C0, 0, $23, $D5, $9E, $78, $C0, 0, $23, $C4, $40, $7D
		dc.b	$20, 0, $23, $D0, $C4, $8B, $A0
		dcb.b	3,0
		dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
	dc.b	$22, $F4, $F2
	endif
StageChunks:
	incbin	"maps/r31b/chunks.bin"
	even

StageCollisionAngles:
	incbin	"maps/collision_angles.bin"
	even

StageCollisionColumns:
	incbin	"maps/collision_columns.bin"
	even

StageCollisionRows:
	incbin	"maps/collision_rows.bin"
	even

StageCollision:
	incbin	"maps/r31b/collision.bin"
	even

StageMaps:
	dc.w	StageMapFg-*
	dc.w	StageMapBg-StageMaps
	dc.w	StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapFg-StageMaps
	dc.w	StageMapBg-StageMaps
	dc.w	StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapFg-StageMaps
	dc.w	StageMapBg-StageMaps
	dc.w	StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps

StageMapFg:
	incbin	"maps/r31b/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r31b/background.bin"
	even

StageMapNull:
	incbin	"maps/empty.bin"
	even

StageMapUnk1:
	incbin	"maps/ghz2_foreground.bin"
	even

StageMapUnk3:
	incbin	"maps/empty.bin"
	even

StageMapUnk4:
	incbin	"maps/ghz3_foreground.bin"
	even

StageMapUnk2:
	incbin	"maps/empty.bin"
	even

StageMapUnk5:
	incbin	"maps/empty.bin"

Padding2:
		dc.b	8, $F4, $FC, 1, 8, $11, $C, 0, 2, $EC, $F
		dcb.b	2,0
		dc.b	$F8
		dcb.b	2,$C
		dc.b	0, $10, $F8, 0, 2, $EC, $F, 8, 0, $E8
		dcb.b	2,$C
		dc.b	8, $10, $E8
		dcb.b	2,0
		dc.b	$14, 0, $3E, 0, $6C, 0, $9A, 0, $C8, 0, $EC, 1, $C, 1, $5E
		dc.b	1, $AA, 1, $F2, 8, $E8, 1
		dcb.b	2,0
		dcb.b	2,$F8
		dc.b	8, 0, 2
		dcb.b	2,$E8
		dc.b	1, 8
		dcb.b	2,0
		dc.b	$F8
		dcb.b	2,8
		dc.b	2
		dcb.b	2,0
		dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
		dc.b	$18
		dcb.b	3,0
		dc.b	9, $E8, 9, 0, 5, $F4, $F8, $C, 0, $B, $E4, $F8, 4, 0, $F
		dc.b	4, 0, $C, $10, $B, $E4, 0, 4, $10, $F, 4, 8, 9, $10, 5, $F4
		dc.b	$E8, 5, 0, $37, $ED, $F8, 5, 0, $3B, $DD, 8, 5, $10, $37
		dc.b	$ED, 9, $E8, 9, 0, $11, $F3, $F8, $C, 0, $17, $E3, $F8, 4
		dc.b	0, $1B, 3, 0, $C, $10, $17, $E3, 0, 4, $10, $1B, 3, 8, 9
		dc.b	$10, $11, $F3, $E8, 5, 0, $37, $E6, $F8, 5, 0, $3B, $D8, 8
		dc.b	5, $10, $37, $E6, 9, $E8, 9, 0, $1D, $ED, $F8, $C, 0, $23
		dc.b	$E5, $F8
		dcb.b	2,0
		dc.b	$10, 5, 0, $C, $10, $23, $E5
		dcb.b	2,0
		dcb.b	2,$10
		dc.b	5, 8, 9, $10, $1D, $ED, $E8, 5, 0, $37, $E2, $F8, 5, 0, $3B
		dc.b	$D5, 8, 5, $10, $37, $E2, 7, $E8, 3, 0, $27, $D8, $E8, 3
		dc.b	0, $27, $E0, $E8, 3, 0, $27
		dcb.b	2,$E8
		dc.b	6, 0, $2B, $F0, $E8, 6, 0, $31
		dcb.b	2,0
		dc.b	6, $18, $31, $F0, 0, 6, $18, $2B, 0, 6, $F8, 3, $10, $27
		dc.b	$D8, $F8, 3, $10, $27, $E0, $E8, 6, 8, $31, $F0, $E8, 6, 8
		dc.b	$2B
		dcb.b	2,0
		dc.b	6, $10, $2B, $F0, 0, 6, $10, $31
		dcb.b	2,0
		dc.b	$10, $E8, 9, 0, $11, $F3, $F8, $C, 0, $17, $E3, $F8, 4, 0
		dc.b	$1B, 3, 0, $C, $10, $17, $E3, 0, 4, $10, $1B, 3, 8, 9, $10
		dc.b	$11, $F3, $E8, 3, 0, $27, $D8, $E8, 3, 0, $27, $E0, $E8, 3
		dc.b	0, $27
		dcb.b	2,$E8
		dc.b	6, 0, $2B, $F0, $E8, 6, 0, $31
		dcb.b	2,0
		dc.b	6, $18, $31, $F0, 0, 6, $18, $2B, 0, $E8, 5, 0, $37, $E6
		dc.b	$F8, 5, 0, $3B, $D8, 8, 5, 0, $37, $E6, 0, $F, $E8, 9, 0
		dc.b	$1D, $ED, $F8, $C, 0, $23, $E5, $F8
		dcb.b	2,0
		dc.b	$10, 5, 0, $C, $10, $23, $E5
		dcb.b	2,0
		dcb.b	2,$10
		dc.b	5, 8, 9, $10, $1D, $ED, $F8, 3, $10, $27, $D8, $F8, 3, $10
		dc.b	$27, $E0, $E8, 6, 8, $31, $F0, $E8, 6, 8, $2B
		dcb.b	2,0
		dc.b	6, $10, $2B, $F0, 0, 6, $10, $31, 0, $E8, 5, 0, $37, $E2
		dc.b	$F8, 5, 0, $3B, $D5, 8, 5, 0, $37, $E2, $C, $E8, 1
		dcb.b	2,0
		dcb.b	2,$F8
		dc.b	8, 0, 2
		dcb.b	2,$E8
		dc.b	1, 8
		dcb.b	2,0
		dc.b	$F8
		dcb.b	2,8
		dc.b	2
		dcb.b	2,0
		dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
		dc.b	$18
		dcb.b	2,0
		dc.b	$E8, 6, 0, $2B, $EC, $E8, 6, 0, $31, 4, 0, 6, $18, $2B, 4
		dc.b	0, 6, $18, $31
		dcb.b	2,$EC
		dc.b	3, 0, $27, $E4, $F4, 3, $18, $27, $14, 0, $C, $E8, 1
		dcb.b	2,0
		dcb.b	2,$F8
		dc.b	8, 0, 2
		dcb.b	2,$E8
		dc.b	1, 8
		dcb.b	2,0
		dc.b	$F8
		dcb.b	2,8
		dc.b	2
		dcb.b	2,0
		dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
		dc.b	$18
		dcb.b	2,0
		dc.b	$E8, 6, $10, $2B, 4, $E8, 6, $10, $31, $EC, 0, 6, 8, $2B
		dc.b	$EC, 0, 6, 8, $31, 4, $F4, 3, $10, $27, $E4, $EC, 3, 8, $27
		dc.b	$14, 0, $E0
		dcb.b	3,0
		dc.b	$E0
		dcb.b	3,0
		dc.b	$E0, 0
PlayerGfx:
	incbin	"gfx/player.unc"
	even

PlayerSprites:
	include	"sprites/player.asm"
	even

PlayerGfxScript:
	include	"sprites/player_gfx.asm"
	even

PointsGfx:
	incbin	"gfx/points.nem"
	even

CapsuleGfx:
	incbin	"gfx/capsule.nem"
	even

BigRingGfx:
	incbin	"gfx/big_ring.nem"
	even

GoalGfx:
	incbin	"gfx/goal.nem"
	even

SignpostGfx:
	incbin	"gfx/signpost.nem"
	even

ResultsGfx:
	incbin	"gfx/results.nem"
	even

TimeOverGfx:
	incbin	"gfx/time_over.unc"
	even

GameOverGfx:
	incbin	"gfx/game_over.unc"
	even

TitleCardGfx:
	incbin	"gfx/title_card.nem"
	even

ShieldGfx:
	incbin	"gfx/shield.unc"
	even

InvincibleGfx:
	incbin	"gfx/invincible.unc"
	even

WarpGfx:
	incbin	"gfx/warp.unc"
	even

Spring45Gfx:
	incbin	"gfx/spring_45.nem"
	even

SpringGfx:
	incbin	"gfx/spring.nem"
	even

MonitorTimeGfx:
	incbin	"gfx/monitor_time.nem"
	even

ExplosionGfx:
	incbin	"gfx/explosion.nem"
	even

RingGfx:
	incbin	"gfx/ring.nem"
	even

LivesIconsGfx:
	incbin	"gfx/lives_icons.unc"
	even

HudNumbersGfx:
	incbin	"gfx/hud_numbers.unc"
	even

HudGfx:
	incbin	"gfx/hud.nem"
	even

CheckpointGfx:
	incbin	"gfx/checkpoint.nem"
	even

FlowerAnims:
	include	"anims/flower.asm"
	even

FlowerSprites:
	include	"sprites/r3/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r3/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r3/title_card_text.nem"
	even

byte_233A9A:
	incbin	"data/r3/byte_233A9A.bin"
	even

FlipperGfx:
	incbin	"gfx/r3/flipper.nem"
	even

BumperGfx:
	incbin	"gfx/r3/bumper.nem"
	even

MetalPlatformGfx:
	incbin	"gfx/r3/metal_platform.nem"
	even

SpikesHV4Gfx:
	incbin	"gfx/spikes_hv4.nem"
	even

BlockGfx:
	incbin	"gfx/r3/block.nem"
	even

RetractBlockGfx:
	incbin	"gfx/r3/retract_block.nem"
	even

OneWayBarrierGfx:
	incbin	"gfx/r3/one_way_barrier.nem"
	even

FireShootGfx:
	incbin	"gfx/r3/fire_shoot.nem"
	even

RotatePlatformGfx:
	incbin	"gfx/r3/rotate_platform.nem"
	even

KamaKamaGfx:
	incbin	"gfx/r3/kama_kama.nem"
	even

SpikesV2Gfx:
	incbin	"gfx/spikes_v2.nem"
	even

KamaKamaSprites1:
	include	"sprites/r3/kama_kama_1.asm"
	even

KamaKamaSprites2:
	include	"sprites/r3/kama_kama_2.asm"
	even

GaGfx:
	incbin	"gfx/r3/ga.nem"
	even

TentouGfx:
	incbin	"gfx/r3/tentou.nem"
	even

SpikeBombGfx:
	incbin	"gfx/spike_bomb.nem"
	even

TeleporterGfx:
	incbin	"gfx/r3/teleporter.nem"
	even

PocketGfxBC:
	incbin	"gfx/r3/pocket_bc.nem"
	even

BossBarrierGfx:
	incbin	"gfx/r3/boss_barrier.nem"
	even

BouncePlatformGfxAB:
	incbin	"gfx/r3/bounce_platform_ab.nem"
	even

GlassBreakGfxB:
	incbin	"gfx/r3/glass_break_b.nem"
	even

SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

AnimalsGfx:
	incbin	"gfx/r3/animals.nem"
	even

HologramAnimalsGfx:
	incbin	"gfx/r3/hologram_animals.nem"
	even

HologramGfx:
	incbin	"gfx/hologram.nem"
	even

StageBlocks:
	incbin	"maps/r31b/blocks.nem"
	even

StageGfx:
	incbin	"maps/r31b/gfx.nem"
	even

PowerupAnims:
	include	"anims/powerup.asm"
	even

PowerupSprites:
	include	"sprites/powerup.asm"
	even

SplashAnims:
	include	"anims/splash.asm"
	even

SplashSprites:
	include	"sprites/splash.asm"
	even

HDoorAnims:
	include	"anims/r1/h_door.asm"
	even

HDoorSprites:
	include	"sprites/r1/h_door.asm"
	even

TunnelSplashAnims:
	include	"anims/r1/tunnel_splash.asm"
	even

TunnelSplashSprites:
	include	"sprites/r1/tunnel_splash.asm"
	even

ExplosionAnims:
	include	"anims/explosion.asm"
	even

ExplosionSprites:
	include	"sprites/explosion.asm"
	even

WobbleTable:
	incbin	"data/wobble.bin"
	even

CheckpointAnims:
	include	"anims/checkpoint.asm"
	even

CheckpointSprites:
	include	"sprites/checkpoint.asm"
	even

BigRingAnims:
	include	"anims/big_ring.asm"
	even

BigRingSprites:
	include	"sprites/big_ring.asm"
	even

SignpostAnims:
	include	"anims/signpost.asm"
	even

SignpostSprites:
	include	"sprites/signpost.asm"
	even

CapsuleAnims:
	include	"anims/capsule.asm"
	even

CapsuleSprites:
	include	"sprites/capsule.asm"

Padding3:
		dc.b	$EA, $EB, $2B, $D4, $3A, $CB, 5, $CD, $40, 0, $B5, $76, $A4
		dc.b	$AD, $2F, $77, $2B, $7E, $91, $5F, $AF, $ED, $21, $AD, $D5
		dc.b	$D6, $E8, $2F, $ED, $1C, $AD, $FB, $47, $2B, $6B, $C5, $FA
		dc.b	$BD, $40, $E, $D6, $FD, $40
		dcb.b	2,0
		dc.b	3, $BD, $DD, $A9, $7B, $DB, $5A, $B2, $94, $95, $EA, $E9
		dc.b	$30, $5A, $AF
		dcb.b	2,$2B
		dc.b	$D7, $CD, $5F, $24, $25, $7A, $DD, $C2, $C1, $78, $57, $2B
		dc.b	$3D, $49, $61, $C2, $F0, $CB, $77, $F1, $14, $97, $F4, $9E
		dc.b	$EE, $48, $49, $C9, $25, $10, $59, $29, $6B, $27, $29, $2F
		dc.b	$29, $41, $79, $4A, $BE, $E0, 0, 6, $B7, $F2, $BF, $A8, $25
		dc.b	$85, $BD, $DE, $A4, $D0, $5F, $35, $82, $43, $56, $96, $A4
		dc.b	$BE, $6A, $E5, $F3, $58, $21, $2B, $96, $17, $6A, $4B, $22
		dc.b	$91, $2C, $38, $72, $FE, $90, $B8, $77, $B, $C2, $BB, $DD
		dc.b	$1E, $AE, $56, $5B, $D5, $EA, 0, $17, $ED, $D, $9A, $EA, $DC
		dc.b	$A8, $F4, $64, $BC, $C6, $67, $7A, $32, $67, $72, $A4, $36
		dc.b	$6B, $AF, $D8, 0, 6, $D7, $DC, $DB, $41, $16, $EC, $D1, $92
		dc.b	$F3, $19, $9D, $E8, $C8, $F4, $5B, $AB, $73, $6D, $D, $80
		dc.b	2, $1B, $43, $6E, $4F, $4E, $46, $AE, $46, $35, $4A, $A4
		dc.b	$11, $8F, $34, $19, $A5, $51, $8C, $25, $51, $8D, $52, 9
		dc.b	$C8, $D6, $1B, $72, $BF, $61, $B5, $FC, $B6, $82, $9F, $24
		dc.b	$82, $29, $B2, $55, 1, $B2, $55, 6, $69, $99, $B2, $41, $2A
		dc.b	$8A, $6C, $8E, $53, $E4, $8F, $E5, $B4, $36, 2, $A9, $5D
		dc.b	$9A, 9, $C8, $DE, $8C, $46, $8E, $46, $23, $4A, $9A, $3D
		dc.b	$18, $D0, $3D, $18, $D0, 0, 4, $11, $8D, 5, $51, $8D, $33
		dc.b	$34, $82, $31, $1A, $41, $18, $8D, $20, $9C, $8E, $BB, $36
		dc.b	$68, $5F, $D3, $24, $FE, $BA, $37, $F4, $58, $FF, $A6, $69
		dc.b	$7A
		dcb.b	5,0
		dc.b	1, $2F, $43, $FE, $99, $B7, $F4, $59, $3F, $AE, $85, $FD
		dc.b	$32, $4C, $DB, $6A, $9F, $24, $82, $19, $32, $41, $C, $99
		dc.b	$20, $87, $9A, $1B, $20, $AA, $1B, $20, 0, 8, $21, $B2, 7
		dc.b	$A1, $B2, $3D, $E, $A8, $64, $C8, $E4, $32, $64, $79, $F2
		dc.b	$48, $36, $D5, $40, 5, $E9, $7A, $35, $51, $AA, $8D, $93
		dc.b	$D1, $8C, $91, $C8, $CE, $4A, $9A, $3D, $18, $C2, 7, $A3
		dc.b	$18, $40, 0, $19, $A4, $11, $8C, 2, $48, $23, $18, $34, $82
		dc.b	$33, $92, 8, $C6, $49, 4, $6C, $AA, $8D, $9A, $36, $68, $21
		dc.b	$FB, $32, $F6, $FD, $BA, $79, $FE, $C5, $BC, $8B, $D8, $CB
		dc.b	$D9, $FB
		dcb.b	8,0
		dc.b	$BF, $6B, $CC, $BD, $9E, $DE, $45, $FB
		dcb.b	2,$3F
		dc.b	$D8, $97, $B7, $ED, $FF, $E7, $FB, $7F, $62, $FD, $8F, $9F
		dc.b	$EC, $CB, $C9, $9F, $EC, $47, $7E, $C0
		dcb.b	7,0
		dc.b	$2F, $D9, $FE, $C4, $7E, $C5, $E4, $DF, $B1, $F3, $4F, $DB
		dc.b	$FB, $17, $EC, $C4, $13, $36, $4C, $D9, $2B, $93, $24, $10
		dc.b	$8D, $92, 8, $E6, $48, $21, $83, $64, $82, 0, $46, $C9, 4
		dc.b	0, 1, $9A, 3, $64, $F, $40, $6C, $8F, $43, $AA, $39, $91
		dc.b	$C8, $46, $C8, $FC, $99, $2A, $C9, $56, $4B, $D0, $66, 0
		dc.b	$71, $80, 5, $D, $15, $F, $25, $11, $35, $C, $45, $13, $56
		dc.b	$2A, $66, $2F, $73, 0, $81, 5, $14, $17, $73, $82, 5, 6, $15
		dc.b	$10, $26, $34, $37, $70, $83, 5, 7, $16, $31, $27, $6A, $84
		dc.b	5, $16, $17, $72, $38, $F1, $85, 7, $74, $18, $F4, $86, 5
		dc.b	$12, $17, $71, $27, $76, $87, 5, $E, $17, $6E, $88, 5, $A
		dc.b	$18, $EF, $89
		dcb.b	2,4
		dc.b	$17, $75, $8A, 6, $2B, $16, $30, $27, $6F, $38, $EE, $8B
		dc.b	4, 2, $16, $2E, $27, $79, $38, $F6, $8C, 6, $32, $16, $36
		dc.b	$8D, 6, $33, $18, $F0, $28, $F5, $8E, 5, $B, $17, $6B, $FF
		dcb.b	2,0
		dc.b	4, $F5, $30, $FA, $44, $FC, $2A, $80, $AB, $16, $7E, $CE
		dc.b	$3F, $C3, $8E, $30, $38, 0, 1, $FC, $38, $9F, $92, $CD, $FA
		dc.b	$FD, $4B, $AC, $DE, $90, $3A, $F0, $37, $43, $1F, $F1, $EB
		dc.b	$2A, $CD, $D0, $C7, $FC, $7A, $ED, $FA, $53, $FE, $3C, $FC
		dc.b	$BD, $34, $3F, $E9, $D, $68, $1F, $C7, $4C, $79, $1E, $40
		dc.b	0, $19, $66, $7A, $59, $9D, $39, $7A, $72, $69, $FC, $7A
		dc.b	$3C, $FE, $3D, $1F, $D2, $D8, $9A, $CF, $F4, $B1, $8F, $1F
		dc.b	$D2, $E3, $1F, $D9, $DA, $32, $4A, $1E, $91, $97, $3B, $52
		dc.b	$67, $FE, $15, $E6, $9E, $A6, $6A, $33, $F, $A4, $4F, $C2
		dc.b	$26, $C, $86, $3C, $8F, $2D, $31, $B1, $E5, $C3, $12, $B7
		dc.b	$F0, $8B, 8, $52, 5, $86, $94, $85, $D0, $5F, $AE, $B6, $C3
		dc.b	$C, $F6, $97, $3E, $89, $19, $75, $92, $91, $FD, $AB, $E6
		dc.b	$FE, $E2, $8D, $6B, $B9, $97, $54, $BB, $F2, $CC, $A7, $C
		dc.b	$3C, $36, $32, $2B, $D7, $64, $DC, $BF, $DE, $A7, $F6, $EB
		dc.b	$6A, $7B, $60, $F4, $F6, $AE, $3A, $ED, $3D, $76, $7E, $59
		dc.b	$94, $FC, $2A, $CF, 2, $65, $D8, $14, $6B, $F6, $8D, $64
		dcb.b	2,0
		dc.b	1, $3A, $5F, $4B, $E9, $1D, $66, $B3, $17, $65, $99, $E8
		dc.b	$AD, $CA, $59, $A8, $B5, $19
		dcb.b	2,$52
		dc.b	$51, $70
		dcb.b	2,$92
		dc.b	$CB, $87, $8C, $97, $F, $19, $7F, $C4, 4, $55, $56, $FD, $4B
		dc.b	$3A, $49, $C8, $E4, $7F, $67, $23, $91, $BD, $9D, $47, $51
		dc.b	$BF, $E1, $89, $FF, $85, $79, $A7, $A9, $9A, $8C, $C3, $E9
		dc.b	$13, $F0, $89, $83, $21, $8F, $23, $CB, $4C, $6C, $79, $70
		dc.b	$C4, $AD, $FC, $22, $C2, $14, $81, $61, $A5, $21, $74, $3F
		dc.b	$5D, $EA, $F8, $61, $9E, $52, $E7, $D1, $23, $2E, $B2, $52
		dc.b	$3F, $B5, $7C, $DF, $DC, $51, $AD, $77, $32, $EA, $97, $7E
		dc.b	$59, $DF, $C, $3C, $32, $6A, $39, $5E, $B9, $27, $E9, $F5
		dc.b	$F8, $23, $BF, $B6, $D4, $75, $D5, $DC, $FE, $B5, $DD, $5B
		dc.b	$20, $B3, $30, $D6, $86, $59, $D5, $96, $75, $66, $58, $32
		dc.b	$BB, $B0, $27, $E1, $75, $71, $2C
		dcb.b	3,0
		dc.b	$19, $4B, $E9, $7D, $22, $6B, $36, $11, $5D, $9D, 6, $A2
		dc.b	$B7, $2A, $14, $5A, $8C, $A9, $29, $28, $B8
		dcb.b	2,$49
		dc.b	$65, $C3, $C6, $4B, $87, $8C, $BF, $E2, 2, $2A, $AB, $7E
		dc.b	$A5, $9D, $24, $E4, $72, $3F, $B3, $91, $C8, $DE, $CE, $A3
		dc.b	$A8, $DF, $F0, $C4, $FF, $C2, $BC, $D3, $D4, $CD, $46, $61
		dc.b	$F4, $89, $F8, $44, $C0, 1, $14, $BD, $2F, $40
		dcb.b	2,0
		dc.b	$B, $E9, $7D, $2F, $A4, $31, $E4, $79, $69, $8D, $8F, $2E
		dc.b	$18, $95, $BF, $84, $58, $42, $90, $2C, $34, $A4, $2E, $86
		dc.b	$BF, $DE, $BC, $DE, $18, $66, $D3, $38, $AB, $2F, 4, $92
		dc.b	$48, $BD, $7F, $4E, $8A, $D7, $9E, $EE, $FF, $6F, $D4
		dcb.b	2,$5D
		dc.b	$C9, $DE, $8D, $AC, $AB, $6F, $57, $EB, $34, $D7, $63, $31
		dc.b	$66, $B1, $9E, $A5, $99, $B0, $6A, $2B, $72, $A1, $45, $A8
		dc.b	$CA
		dcb.b	2,$92
		dc.b	$8B, $84, $94, $96, $5C, $3C, $64, $B8, $78, $CB, $FE, $32
		dc.b	$E7, $D1, $23, $2E, $B2, $52, $3F, $B5, $7C, $DF, $DC, $51
		dc.b	$AD, $77, $32, $EA, $B5, $D5, $B6, $73, $DB, $39, $ED, $9C
		dc.b	$FC, $2B, $26, $15, $65, $81, $3F, 2, $C2, $35, $F9, 0, 6
		dc.b	$22, $AA, $B7, $EA, $59, $D2, $4E, $47, $23, $FB, $39, $1C
		dc.b	$8D, $EC, $EA, $3A, $8D, $FF, $C, $4F, $FC, $2B, $CD, $3D
		dc.b	$4C, $D4, $66, $1F, $48, $9F, $84, $4C, $F8, $5E, $55, $15
		dc.b	$73, $81, $4C, $C4, $E9, $96, $EA, $B7, $55, $DF, $7A, $80
		dc.b	$17, $A5, $54, $5D, $54, $5C, $E8, $B3, $4E, $8B, $34, $FF
		dc.b	$43, $C, $79, $1E, $5A
		dcb.b	2,$63
		dc.b	$CB, $86, $25, $6F, $E1, $16, $10, $A4, $B, $D, $29, $B, $97
		dc.b	$FC, $D7, $E0, $59, $ED, $9B, $75, $F8, $6D, $99, $57, $EB
		dc.b	$B6, $6A, $E2, $AF, $5C, $38, $A2, $8A, $BB, $B7, $22, $8B
		dc.b	2, $FD, $47, $9C, $3B, $EC, $D5, $9A, $2B, $B3, $56, $68
		dc.b	$AE, $CD, $59, $A2, $BB, $39, $66, $53, $79, $39, $46, $B2
		dc.b	$28, $D6, $54, $94, $96, $4E
		dcb.b	2,$52
		dc.b	$5B, $A4, $8D, $E3, $D8, $DE, $3D, $BF, $E3, $2E, $7D, $12
		dc.b	$32, $EB, $25, $23, $FB, $57, $CD, $FD, $C5, $1A, $D7, $73
		dc.b	$2E, 0, $54, $A7, $55, $FA, $89, $E0, $93, $2C, $27, $D4
		dc.b	0, 5, $5D, $6A, $72, $39, $19, $27, $23, $92, $32, $75, $1D
		dc.b	$48, $FF, 4
		dcb.b	5,0
		dc.b	$F, $38
		dcb.b	2,0
		dc.b	$CF, $D9, $BF, $FE, $7F, $B3, $E4, $FE, $18, $B3, $43, $B2
		dc.b	7, $FC, $7C, $CC, $7F, $C7, $BF, $F6, $7F, $8F, $FE, $1E
		dc.b	$9A, $BF, $84, $76, $FF, $48, $E0, 0, $2F, $B6, $2C, $F4
		dc.b	$59, $BF, $5F, $D3, $92, $EB, $37, $A1, $F9, $2F, 3, $74
		dc.b	$3F, $25, $95, $66, $F4, $B1, $D7, $6F, $E2, $FE, $93, $D0
		dc.b	$DF, $A5, $FD, $21, $AD, $AB, $C4, $D2, $4A, $1F, $91, $F8
		dc.b	$F3, 0
		dcb.b	2,$B
		dc.b	$EC, $DE, $4C, $F4, $B4, $F9, $74, $9D, $B1, $B3, $E, $66
		dc.b	$99, $86, $3D, $58, $D4, $7B, $54, $7A, $55, $6A
		dcb.b	3,0
		dc.b	6, $F0, $3B, $38, $3F, $56, $8D, $D5, $C0, $FF, $D2, $A3
		dc.b	$FF, $A5, $35, $F8, $46, $1E, $4F, $C8, $FC, $79, $E3, $63
		dc.b	$F1, $EA, $6C, $4A, $DD, $A0, $5F, $CA, $81, $6F, $59, $52
		dc.b	$1E, $CD, $F5, $9E, $7F, $AC, $67, $44, $AA, $4A, $49, $D7
		dc.b	$CE, $75, $95, $44
		dcb.b	2,0
		dc.b	1, $51, $AA, $31, $E6, $6C, $58, $6D, $4F, $35, $DB, $A4
		dc.b	$D3, $5C, $A7, $71, $6C, $11, $4E, $E2, $FB, $BA, $EE, $32
		dc.b	$FD, $BA, $E2, $BF, $E5, $9F, $92, $DB, $E5, $D2, $86, $34
		dc.b	$6C, $9D, $B3, $24, $AC, $B3, $63, $95, $9E, $F2, $6A, $92
		dc.b	$B2, $DE, $49, $59, $57, $73, $F7, $93, $A, $B6, $EB, $BF
		dc.b	$5B, $95, $14, $C6, $CA, $7A, $29, $D6, $47, $3D, $1D, $C6
		dc.b	$C8, $F4, $77, $17, $19, $FD, $77, $2A, $91, $4F, $D0, $80
		dc.b	$D4, $74, $B5, $D1, $EA, $45, $4C, $CB, $A9, $60, 0, $18
		dc.b	$B7, $29, $9C, $91, $4C, $36, $A6, $1B, $53, $D, $A9, $8B
		dc.b	$36, $33, $FD, $70, $53, $8E, $EE, $2E, $6E, $3D, $B7, $27
		dc.b	$2E, $3B, $91, $A7, $B1, $B7, $23, $F1, $37, $58, $9B, $5C
		dc.b	$D6
		dcb.b	3,0
		dc.b	5, $4A, $9F, $7B, $98, $AD, $D2, $62, $2B, $74, $D1, $48
		dc.b	$2F, $5D, $EB, $AB, $5D, $5A, $EA, $D7, $56, $BB, $D6, 0
		dc.b	$8F, 3, $B3, $83, $F5, $68, $DD, $5C, $F, $FD, $2A, $3F, $FA
		dc.b	$53, $5F, $83, $37, $92, $B7, $F9, $CE, $4A, $B8, $DE, $B2
		dc.b	$72, $9A, $6B, $B3, $FD, $3F, $9C, $11, $C7, $2E, $E5, $A2
		dc.b	$CE, $67, $FE, $FB, $15, $7F, $38, $E6, $47, $EB, $C4, $C8
		dc.b	$F5, $E2, $66, $2D, $49, $35, $25, $48, 0, $BC, $FC, $8F
		dc.b	$C7, $9E, $36, $3F, $1E, $A6, $C4, $AD, $DA, 5, $FC, $A8
		dc.b	$16, $F5, $95, $21, $EC, $DF, $59, $E7, $FA, $C6, $67, $FA
		dc.b	$C2, $7B, $B3, $DB, $3B, $91, $5F, $BD, $7A, $92, $B2, $C2
		dc.b	$E5, $26, 5, $81, $35, $28, $76, $96, 4, $FA, $5A, $F5, $D9
		dc.b	$4E, $93, $16, $E9, $2A, $CF, $B7, $55, $5A, $4D, $87, $E9
		dc.b	$1D, $26, $9B, $55, $BB, $DB, $D, $4A, $5B, $74, $3F, $EB
		dc.b	$9B, $F, $D7, $73, $7E, $BE, $6F, $E8, $95
		dcb.b	2,$49
		dc.b	$3A, $F9, $CE, $B2, $A8, $80, $17, $A9, $D5, $71, $74, $FF
		dc.b	$4F, $3E, $F4, $9F, $50, 5, $4E, $EC, $CE, $3B, $94, $B7
		dc.b	$B9, $5F, $AE, $A3, $FF, $7D, $48, $EB, $E6, $CE, $60
		dcb.b	2,0
		dc.b	$66, $33, $3E, $C, $3E, $F6, $16, 5, $12, $C0, $A9, $12, $AC
		dc.b	$B9, $C4, $AB, $2E, $71, $2C, $A, $91, $2D, $E4, $C2, $DE
		dc.b	$C2, $DF, $3B, $AB, $69, $DA, $76, $9E, $3A, $1C, $C7, $8F
		dc.b	3, $B6, $8A, $E0, $FA, $28, $FF, $A4, $39, $B9, $E1, $C6
		dc.b	$C7, $FE, $D4, $8F, $E7, $F9, $5F, $A1, $2E, $EF, $D8, $96
		dc.b	$FF, $D8, $96, $FD, $57, $6F, $F3, $DC, $5F, $EA, $2F, $ED
		dc.b	$5D, $FC, $A2, $59, $80, 0, $1A, $F8, $54, $73, $54, $78
		dc.b	$4C, $A1, $32, $D1, $85, $A3, $38, $33, $83, $38, $32, $D
		dc.b	$30, $7A, $CA, $A7, $4A, $68, $A9, $4D, $14, $E9, $A7, $7D
		dc.b	$5D, $58, $4D, $BA, $77, $57, $55, $64, 0, 2, $F7, $5E, $79
		dc.b	$98, $EA, $62, $9D, $8C, $54, $E9, $38, $F1, $53, $B8, $BA
		dc.b	$29, $BB, $BD, $9F, $B9, 3, $F9, $6B, $83, $BF, $7D, $A4
		dc.b	$B3, $74, $9D, $9C, $1D, $9B, $B8, $AA, $A, $CF, $F4, $EA
		dc.b	$82, $78, $7E, $A1, $1B, $75, $7F, $A9, $F6, $DE, $55, $FB
		dc.b	$56, $55, $93, $4E, $B6, $99, $71, $3A, $DE, $6D, $6F, $3A
		dc.b	$E3, 6, $9D, $6C, $DC, $75, $B3, $F6, $EB, $89, $E4, $E5
		dc.b	$99, $6F, $3E, $B3, $99, $6F, $3B, $8F, 5, $BD, $67, $85
		dc.b	$18, $6A, $24, $E8, 0, $BE, $15, $69, $79, $A6, $66, $9A
		dc.b	$66, $BC, $C2, $F2, 0, $5E, $E6, $FE, $9E, $2E, $E2, $EE
		dc.b	$F7, $9D, $5F, $A1, $53, $D5, $4F, $D7, $51, $F4, $FE, $73
		dc.b	$FF, $9D, $1F, $DF, $33, $F5, $C0, 0, 5, $E7, $6E, $2F, $C5
		dc.b	$A7, $81, $DF, $FE, $27, $F0, $3D, $9E, $A3, $1C, $AB, $93
		dc.b	$E8, $AB, $6F, $69, $8F, $CF, $7B, $4E, $58, $79, $69, $60
		dc.b	$5F, $A1, $3E, 5, $FB, $13, $E0, $5F, $B1, $3E, 5, $FA, $13
		dc.b	$B4, $B0, $2A, $62, $D2, $DF
		dcb.b	2,$E5
		dc.b	$FC, $A0, 6, $93, $B6, $30, $8C, $AB, $23, $E8, $DE, $EE
		dc.b	$1D, $C5, $A1, $77, $14, $28, $5B, $CA, $14, $2D, $E5, 3
		dc.b	$96, $F2, $81, $CB, $79, $2C, $C5, $DC, $4B, $37, $71, $2E
		dc.b	$1B, $C9, $7A
		dcb.b	3,0
		dc.b	$D7, $9A, $F8, $55, $A, $B4, $9E, $93, $E0, $C3, $3C, $CC
		dc.b	$80, $6D, $DB, $E7, $E6, $A5, $3A, $68, $A9, $4D, $14, $EA
		dc.b	$91, $55, $12, $4F, $C8, 2, $AE, $F9, $AF, $73, $54, $E9
		dc.b	$1D, $4B, $EF, $DD, $C4, $EA, $5A, $2B, $72, $B5, $75, $EF
		dc.b	$D4, $B6, $FE, $E7, $F4, $20, 0, 6, 4, $BE, 5, $AD, $D2, $54
		dc.b	$15, $9A, $B8, $B9, $C, $EC, $D5, $B9, $48, $67, $66, $9B
		dc.b	$94, $8D, $57, $87, $EA, $6E, $4F, $F5, $D7, $E7, $7D, $D5
		dc.b	$F9, $32, $E2, $75, $B4, $CB, $79, $D6, $F3, $2D, $A7, $5B
		dc.b	$D, $AD, $53, $33, $94, $C4, $3E, $B6, $24, $B5, $B1, $1D
		dc.b	$AE, $7A, $EA, $4B, $D0, 0, 6, $97, $9A, $66, $BC, $D7, $9A
		dc.b	$FB, $AA, $20, 0, $BD, $77, $B9, $69, $39, $38, $E8, $C9
		dc.b	$3B, $14, $8B, $96, $A3, $A4, $57, $BB, $1A, $3D, $4E, $D5
		dc.b	$47, $E2, $EE, $2A, $46, $9D, $DC, $5C, $AA, $35, $4E, $E2
		dc.b	$E5, $51, $A8, $AF, $D3, $AA, $8F, $A7, $EA, $12, $91, $FD
		dc.b	$88, 0, $B, $F6, $9E, $57, $64, $CD, $AE, $9E, $C5, $56, $D7
		dc.b	$E4
		dcb.b	3,0
		dc.b	3, $F6, $9E, $57, $65, $1C, $AE, $DA, $37, $6C, $C2, $DA
		dc.b	$7B, $55, $90
		dcb.b	3,0
		dc.b	$11, $FD, $63, $36, $AC, $B2, $8E, $57, $56, $51, $DA, $EA
		dc.b	$D9, $B5, $D3, $D8, $AA, $DA, $FC, $80
		dcb.b	2,0
		dc.b	$1B, $FA, $C6, $64, $55, $ED, $12, $AE, $EC, $A3, $5D, $DB
		dc.b	$46, $ED, $98, $5B, $4F, $6A, $B2
		dcb.b	3,0
		dc.b	$11, $C9, $B9, $33, $26, $93, $72, $61, $36, $B6, $64, $D2
		dc.b	$6D, $6C, $C9, $A5, $56, $4D, $2A, $B2, $19
		dcb.b	3,0
		dc.b	$3F, $26, $E4, $CC, $9A, $4D, $C9, $F9, $36, $B6, $93, $2B
		dc.b	$69, $37, $27, $D6, $D2, $6E, $4C, $26, $E4, $C2, $6E, $55
		dc.b	$65, $56, $40, $5E
		dcb.b	2,0
		dc.b	$20, 0, $2C, 0, $38, 0, $58, 0, $78, 0, $98, 0, $B8, 0, $D8
		dc.b	0, $F8, 1, $18, 1, $38, 1, $3E, 1, $44, 1, $4A, 1, $50, 1
		dc.b	$52, 2, $F4, $B
		dcb.b	2,0
		dc.b	$E8, $F4, $B, 0, $C
		dcb.b	2,0
		dc.b	2, $F4, $B, 0, $18, $E8, $F4, $B, 0, $24
		dcb.b	2,0
		dc.b	6, $E8, $F, 0, $30, $EC, 8, 9, 0, $40, $F4, $E8, $A, 0, $5C
		dc.b	$E0, 0, $A, 0, $65, $E0, $E8, $A, $18, $5C, 8, 0, $A, $18
		dc.b	$65, 8, 0, 6, $E8, $F, 0, $30, $EC, 8, 9, 0, $40, $F4, $E8
		dc.b	$A, $18, $65, 8, 0, $A, $18, $5C, 8, $E8, $A, 0, $65, $E0
		dc.b	0, $A, 0, $5C, $E0, 0, 6, $E8, $F, 0, $30, $EC, 8, 9, 0, $40
		dc.b	$F4, $E8, $A, $10, $65, $E0, 0, $A, $10, $5C, $E0, $E8, $A
		dc.b	8, $65, 8, 0, $A, 8, $5C, 8, 0, 6, $E8, $F, 0, $30, $EC, 8
		dc.b	9, 0, $40, $F4, $E8, $A, 8, $5C, 8, 0, $A, 8, $65, 8, $E8
		dc.b	$A, $10, $5C, $E0, 0, $A, $10, $65, $E0, 0, 6, $E8, $F, 0
		dc.b	$30, $EC, 8, 9, 0, $40, $F4, $E8, $A, 0, $5C, $E0, 0, $A
		dc.b	0, $65, $E0, $E8, $A, $10, $5C, 8, 0, $A, $10, $65, 8, 0
		dc.b	6, $E8, $F, 0, $30, $EC, 8, 9, 0, $40, $F4, $E8, $A, $18
		dc.b	$65, $10, 0, $A, $18, $5C, $10, $E8, $A, 8, $65, $D8, 0, $A
		dc.b	8, $5C, $D8, 0, 6, $E8, $F, 0, $30, $EC, 8, 9, 0, $40, $F4
		dc.b	$E0, $A, $10, $65, $D8, 8, $A, $10, $5C, $D8, $E0, $A, 0
		dc.b	$65, $10, 8, $A, 0, $5C, $10, 0, 6, $E8, $F, 0, $30, $EC
		dc.b	8, 9, 0, $40, $F4, $E0, $A, 8, $5C, $18, 8, $A, 8, $65, $18
		dc.b	$E0, $A, $18, $5C, $D0, 8, $A, $18, $65, $D0, 0, 1, $F8, 5
		dc.b	0, $6E, $F8, 1, $F8, 5, 0, $72, $F8, 1, $F4, $A, 0, $76, $F4
		dc.b	1, $F0, $F, 0, $7F, $F0
		dcb.b	2,0
		dc.b	2, $E8, $F, 0, $30, $EC, 8, 9, 0, $40, $F4
		dcb.b	2,0
		dc.b	$1C, 0, $32, 0, $3E, 0, $4A, 0, $60, 0, $76, 0, $82, 0, $8E
		dc.b	0, $9A, 0, $9A, 0, $9C, 0, $A2, 0, $A8, 0, $9A, 4, $EC, $D
		dc.b	0, $28, $F0, $FC, $C, 0, $30, $F0, 4, 8, 0, $34, $F0
		dcb.b	2,$C
		dc.b	0, $37, $F0, 0, 2, $EC, 9
		dcb.b	2,0
		dc.b	$F4, $FC, $A, 0, $1F, $F4, 0, 2, $EC, $D, 0, $28, $F0, $FC
		dc.b	$E, 0, $3B, $F0, 0, 4, $EC, 9
		dcb.b	2,0
		dc.b	$F4, $FC, 8, 0, 6, $F4
		dcb.b	2,4
		dc.b	0, 9, $FC, $C, 8, 0, $B, $F4, 0, 4, $EC, 9
		dcb.b	2,0
		dc.b	$F4, $FC, 8, 0, $E, $F4
		dcb.b	2,4
		dc.b	0, $11, $FC, $C, 8, 0, $13, $F4, 0, 2, $EC, 9
		dcb.b	2,0
		dc.b	$F4, $FC, $A, 0, $16, $F4, 0, 2, $EC, 9, 0, $47, $F4, $FC
		dc.b	$A, 0, $4D, $F4, 0, 2, $EC, 9, 0, $56, $F4, $FC, $A, 0, $5C
		dc.b	$F4
		dcb.b	3,0
		dc.b	1, $F8, 5, 0, $65, $F8, 1, $F8, 5, 0, $69, $F8, 1, $F8, 5
		dc.b	0, $6D, $F8, 0, $1E, 0, $34, 0, $3A, 0, $40, 0, $46, 0, $4C
		dc.b	0, $52, 0, $58, 0, $5E, 0, $64, 0, $7A, 0, $80, 0, $86, 0
		dc.b	$8C, 0, $92, 4, $F0, 5
		dcb.b	2,0
		dc.b	$F0, 0, 5, 0, 4
		dcb.b	2,$F0
		dc.b	5
		dcb.b	4,0
		dc.b	5, 0, 4
		dcb.b	2,0
		dc.b	1, $F0, 5
		dcb.b	2,0
		dc.b	$F0, 1, 0, 5, 0, 4, $F0, 1, $F0, 5
		dcb.b	3,0
		dc.b	1, 0, 5, 0, 4, 0, 1, $F0, 5, 8, $C, $F0, 1, 0, 5, 8, $C, $F0
		dc.b	1, $F0, 5
		dcb.b	2,8
		dc.b	0, 1, 0, 5
		dcb.b	2,8
		dc.b	0, 4, $F0, 5, 8, $C, $F0, 0, 5, 8, $C
		dcb.b	2,$F0
		dc.b	5
		dcb.b	2,8
		dcb.b	2,0
		dc.b	5
		dcb.b	2,8
		dcb.b	2,0
		dc.b	1, $F0, 5, 0, 8, $F0, 1, 0, 5, 0, 8, $F0, 1, $F0, 5, 0, $C
		dc.b	0, 1, 0, 5, 0, $C, 0, 4, $F0, 5, 0, 8, $F0, 0, 5, 0, 8
		dcb.b	2,$F0
		dc.b	5, 0, $C
		dcb.b	2,0
		dc.b	5, 0, $C
		dcb.b	3,0
		dc.b	8, 0, $12, 0, $1C, 0, $22, 3, $27, 4, 9, 5, $27, 4, 9, $FF
		dcb.b	2,0
		dc.b	3, 1
		dcb.b	2,2
		dc.b	3, 1, 2, $FF, 0, 6, $D, 7, $D, $FF, 0, 8, $13
		dcb.b	2,9
		dc.b	$FF, 0, $CF, $D4, $F8, $73, $F5, $73, $CB, 7, $E7, $E9, $FB
		dc.b	$EF, $DE, $FE, $FB, $F7, $BF, $BE, $FE, $9F, $F7, $BA, $9F
		dc.b	$F7, $DD, $4F, $FB, $E7, $EA, $A6, $1F, $BE, $EA, $E8, $FD
		dc.b	$5D, $1F, $AB, $9F, $A3, $F5, $3E, $F, $D4, $F8, $4B, $A9
		dc.b	$FF, $7B, $CF, $87, $EF, $7A, $3F, $57, $47, $EA, $E9, $FB
		dc.b	$D9, $61, $FD, $DC, $3F, $BC, $FD, $1F, $F, $DE, $F3, $E1
		dc.b	$CF, $2E, $AE, $77, $FD
		dcb.b	2,$EF
		dc.b	$BA, $3F, $EF, $8B, $67, $91, $6A, $FE, $E9, $6A, $FE, $EB
		dc.b	$EC, $8D, $7D, $3F, $FB, $1C, $FF, $DD, $E7, $FE, $EE, $AC
		dc.b	$75, $3F, $F7, $9F, $FB, $DD, $54, $EA, $A7, $FF, $BF, $FD
		dc.b	$FF, $ED, $58, $EA, $E9, $FA, $E6, $8D, $71, $D3, $C9, $F6
		dc.b	$46, $BD, $5E, $5D, $35, $79, $74, $2F, $E9, $C7, $F0, $CB
		dc.b	$9F, $FB, $AF, $FD, $E7, $FE, $F7, $F3, $63, $F8, $7E, $58
		dc.b	$7E, $BB, $C9, $FF, $BB, $87, $F7, $5F, $F5, $D1, $FC, $E8
		dc.b	$E7, $1F, $DE, $FE, $1C, $7F, $F, $FF, $D1, $FF, $DF, $EE
		dc.b	$D7, $CB, 8, $F2, $C3, $FB, $B8, $7F, $77, $9E, $9D, $45
		dc.b	$FC, $D8, $D7, $4E, $7F, $E9, $F3, $FF, $4F, $5E, $AF, $F1
		dc.b	$CB, $F5, $D5, $FE, $76, $C8, $E7, $D9, $FA, $EA, $FF, $FB
		dc.b	$F5, $DD, $5F, $BE, $7E, $AF, $DF, $75, $47, $95, $7C, $9F
		dc.b	$F5, $D1, $D5, $FA, $E2, $FF, $EF, $49, $6C, $2E, $9E, $5A
		dc.b	$BA, $7E, $F7, $FC, $7A, $F5, $7F, $4F, $A8, $7F, $4F, $5B
		dc.b	$17, $F3, $A3, $FF, $DF, $AE, $D9, $CF, $1E, $5C, $F4, $FE
		dc.b	$6F, $EB, $8B, $A4, $6B, $FF, $F7, $EB, $A5, $D3, $F7, $DF
		dc.b	$BD, $FD, $73, $7F, $B5, $9F, $F8, $7A, $9F, $F8, $7A, $BF
		dc.b	$7B, $D, $FB, $D8, $6E, $AA, $B7, $3F, $FC, $FA, $3F, $F4
		dc.b	$DF, $FF, $DF, $CE, $8D, $8F, $FA, $ED, $95, $FF, $D9, $EC
		dc.b	$92, $6C, $EF, 0, 1, $AB, $CB, $F7, $80, 2, $E5, $AB, $5C
		dc.b	$B9, $23, $17, $5C, $20, $74, $96, $6E, $DB, $7E, $6F, $78
		dc.b	$CF, $7E, $7B, $C6, $C2, $E5, $81, $72, $EB, $99, $37, $5C
		dc.b	$C3, $B4, $33, $EA, $8D, $42, $5A, $A9, $CA, $5A, $AB, $C3
		dc.b	$5F, $28, $E5, $5E, $F, $C0, $8C, $BF, $36, $F9, $11, $97
		dc.b	7, $3E, $5A, $F9, $73, $C7, $80, $FC, $D7, $6B, $A, $4C, $17
		dc.b	$E9, $DE, $63, $F8, $7A, $27, $45, 5, $7B, $42, $88, $9B
		dc.b	$AE, $61, $17, $A4, $DF, $F6, $BF, $B7, $94, $C0, $9E, $3A
		dc.b	$FF, $31, $F9, $CA, $5D, $FA, $EA, $EE, $8F, $CC, $76, $75
		dc.b	$F9, $44, $C5, $38, $F5, $57, $3C, $A7, $1E, $5A, $75, $C6
		dc.b	$71, $CB, $57, $E7, $FF, $77, $A, $29, $AB, $F3, $55, $CF
		dc.b	$25, $8F, $D5, $72, $DF, $19, $C7, $D, $FF, $9B, $FD, $FC
		dc.b	$94, 5, $C7, $7F, $3F, $E6, $E9, $77, $85, $77, $49
		dcb.b	2,$4D
		dc.b	$4A, $F7, $32, $30, $48, $70, $C4, $98, $B0, $B8, $12, $52
		dc.b	$E2, $32, $6B, $81, $5C, $48, $1D, 3, $B2, $34, $23, $43
		dc.b	4, $D8, $6C, $64, $C7, 6, $21, $1D, 9, $24, $D0, $60, $9A
		dc.b	$12, $8C
		dcb.b	3,$4C
		dc.b	$EC, $46, $ED, $23, 4, $64, $72, $61, $C, $4D, $43, $96, $9A
		dc.b	$26, $F2
		dcb.b	2,$62
		dc.b	$64, $73, $23, 5, $74, $20, $24, $84, $26, $74, 1, $AE, $8B
		dc.b	$8C, $3A, $12, $50, $C9, 9, 1, $23, $13, $42, 9, $32, $13
		dc.b	$11, $91, $EC, $15, $68, $64, $24, 6, $20, $EA, $6E
		dcb.b	3,$C4
		dc.b	$C8, $48, $46, $49, $84, $19, $30, $23, $93, 3, $76, $26
		dc.b	$11, $A5, $DA, $5B, $CB, $56, 8, $D5, $D7, $46, $7D, $45
		dcb.b	2,$AA
		dc.b	$E8, $21, $85, $4D, $5D, 9, $35, $16, $F6
		dcb.b	2,$52
		dc.b	$D4, $5A, $A4, $80, $12, $55, $96, $4D, $56, $AB, $49, $59
		dc.b	$4D, $49, $58, 7, $59, $31, $34, $DC, $C5, $52, $70, $B5
		dc.b	$9C, $4D, $90, $92, $AB, $13, $A1, $82, $32, $37, $6C, $4E
		dc.b	$26, $53, $11, $C8, $AE, $EB, $2E, $55, $D6, $83, $52, $6A
		dc.b	$AA, $8A
		dcb.b	2,$31
		dc.b	$21, $30, $59, $26, $A2, $DE
		dcb.b	2,$6A
		dc.b	$5A, $8B, $54, $90, $8C
		dcb.b	2,$90
		dc.b	$42, $51, $44
		dcb.b	2,$98
		dc.b	$90, $99, $D5, $94, $D4, $94, $3B, $11, $91, $C9, $71, $9C
		dc.b	$8C, $11, $BC, $E1, $6B, $37, $39, $92, $1A, $1C, $95, $CE
		dc.b	$6E, $95, $38, $30, $D8, $9C, $4D, $A6, $20, $C8, $D8, $CB
		dc.b	$70, $A1, $C3, $12, $62, $D2, $39, $20, $24, $A1, $A6, $44
		dc.b	$C4, $80, $90, $48, $D0, $42, $55, $A1, $A8, $6E
		dcb.b	3,$C6
		dc.b	$59, $46, $41, $D0, $13, $41, $83, $68, $41
		dcb.b	2,$23
		dc.b	$62, $3C, $4C, $11, $96, $40, 3, $91, $D1, $C
		dcb.b	2,$8C
		dc.b	$8D, $C, $51, $21, 1, $24, $21, $B0, $10, $C6, $86, $E8, $46
		dc.b	4, $19, $21, $A0, $24, 1, $CD, $9C
		dcb.b	2,$C8
		dc.b	$D8, $DA, $46, $1A, $18, $41, $83, $73, $A9, $83, $43, $42
		dc.b	$32, $42, $68, $32, $60, $59, 9, $18, 6, $ED
		dcb.b	2,$23
		dc.b	$63, $43, $12, $60, $E6, $E8, $21, $85, $72, $74, $24, $73
		dc.b	$63, $23, 8, 1, $25, $58, $E4, $D5, $6A, $B4, $8D, $B7, $11
		dc.b	$B0, $E, $72, $62, $68, $31, $54, $91, $87, $63, $23, $A9
		dc.b	$87, $30
		dcb.b	2,$46
		dc.b	$1C, $C0
		dcb.b	2,$23
		dc.b	$43, $23, $A2, 2, $4A, $18, $A3, $13, $12, $13, 3, $92, $3F
		dc.b	$F0, $82, $11, $92, $12, 8, $4A, $18, $93, $13, $12, $13
		dc.b	$39, $B6, $E2, $30, $EC, $46, $47, $23, $12, $30, $47, $43
		dc.b	6, $FF, $B2, $91, $B9, $C2, $54, $E0, $C0, $39, $30, $96
		dc.b	$A9, $EA, $B6, $A9, $EA, $E3, $FB, $E8, $D7, $FB, $E0, $5E
		dc.b	$55, $F2, $FF, $F7, $FF, $BF, $FD, $FF, $3F, $FE, $C7, $FF
		dc.b	$45, $7F, $FB, $FF, $DF, $F9, $FE, $BB, $F8, $71, $FC, $D1
		dc.b	$FF, $DF, $FE, $C7, $F3, $63, $FF, $BF, $CD, $97, $49, $74
		dc.b	$FD, $EC, $BF, $7D, $FF, $3F, $F9, $FF, $CF, $A6, $2C, $FF
		dc.b	$C3, $8F, $E9, $D3, $FA, $7D, $5C, $FD, $3C, $B5, $7E, $F6
		dc.b	$1B, $F7, $BD, $3F, $7B, $FF, $EF, $DF, $6C, $AE, $C2, $FF
		dc.b	$F4, $BF, $FD, $FC, $38, $FE, $1C, $7F, $CF, $A7, $EF, $7A
		dc.b	$7E, $FA, $5F, $F3, $FD, $EF, $4E, $AE, $7F, $EE, $F3, $FE
		dcb.b	2,$F7
		dc.b	$DD, $25, $FF, $EF, $FF, $74, $97, $EF, $7F, $7C, $25, $FB
		dcb.b	2,$DF
		dc.b	$74, $FF, $F0, $FF, $F7, $FF, $A9, $D5, $4E, $AF, $FF, $7F
		dc.b	$FB, $FF, $DC, $FF, $D3, $7F, $EE, $CB, $FF, $B2, $FF
		dcb.b	2,$EF
		dc.b	$A5, $FB, $EF, $DE, $FE, $FB, $F7, $BD, $3F
		dcb.b	2,$FB
		dc.b	$DF, $FF, $7F, $FA, $5F, $FD, $E9, $FB
		dcb.b	2,$DF
		dc.b	$7F, $F7, $FE, $7C, $FF, $D3, $7F, $EE, $CB, $FF, $B2, $FF
		dc.b	$9F, $FC, $E5, $D0, $7E
		dcb.b	2,$F7
		dc.b	$DF, $ED, $D5, $FE, $32, $E9, $2F, $DE, $FE, $FB, $AB, $FB
		dc.b	$DD, $5F, $FE, $E7, $97, $4F, $DF, $74, $1F, $BE, $97, $EF
		dc.b	$A3, $F8, $71, $FF, $3F, $F9, $B7, $EF, $76, $17, $EF, $A3
		dc.b	$FE, $7F, $F3, $69, $7E
		dcb.b	2,$F7
		dc.b	$DF, $BD, $FD, $F7, $49, $7F, $FB, $F7, $D2, $E9, $FB, $EE
		dc.b	$92, $FF, $F0, $FD, $F4, $BF, $7D, $2F, $DF, $FE, $EE, $14
		dc.b	$97, $34, $95, $33, $3A, $92, $E6, $B5, $66, $8C, $4A, $F6
		dc.b	$42, $49, $1B, $9A, $C4, $C9, $A, $6B, $B, $3B, $56, $76
		dc.b	$30, $69, $34, $29, $DB, $24, $9B, $CE, $C7, 8, $26, $73
		dc.b	$23, $49, $AC, $ED, $95, $9D, $49, $66, $65, $91, $2E, $37
		dc.b	$1B, $E6, $2D, $B3, $C7, $31, $66, $2D, $B9, $4B, $BC, $B2
		dc.b	$2F, $DA, $17, $ED, $56, $67, $19, $89, $2F, $24, $E6, $6E
		dc.b	$D0, $5D, $ED, $DA, $B3, $4C, $3F, $4C, $17, $36, $DD, $C5
		dc.b	$3D, $BD, $7F, $9F, $EB, $C5, $A4, $C2, $E0, $92, $42, $3A
		dc.b	$A3, $9D, $8F, $32, 3, $62, $B1, $E6, $86, $12, $32, $4A
		dc.b	$9B, $A4, $8C, $8E, $8C, $46, $A, $7B, $7A, $F9, $75, $E9
		dc.b	$C4, $FF, $5F, $FB, $E2, $C0, $AE, $24, $9F, $E6, $FF, $51
		dc.b	$A7, $89, $7F, $88, $BF, $C3, $3F, $F2, $14, $E9, $63, $1F
		dc.b	$CC
		dcb.b	2,$FC
		dc.b	$F2, $23, $2C, $B, $B3, $86, $9F, $D5, $97, $F8, $A7, $FE
		dc.b	$12, $FF, $26, $65, $85
		dcb.b	2,$98
		dc.b	$85, $9A, $65, $B, $34, $32, $45, $AA, $2D
		dcb.b	2,$16
		dc.b	$68, $65, $99, $A, $E6, $2C, $8B, $BC, $B3, $27, $EC, $A5
		dc.b	$FB, $50, $59, $8B, $F6, $A5, $92, $7E, $C8, $AE, $2E, $F2
		dc.b	$D0, $9F, $B4, $2E, $62, $E6, $2D, $C5, $B8, $B9, $8B, $98
		dc.b	$17, $31, $73, $16, $E2, $DC, $5C, $C5, $CD, $AA, $C5, $FC
		dc.b	$3E, $B7, $BD, $A0, $F6, $99, $34, $B6, $92, $DF, $23, $B2
		dc.b	$3A, $39, $CC, $92, $F2, $47, $39, $AE, $F7, $42, $39, $A9
		dc.b	$77, $16, $4D, $BF, $73, $D9, $FF, $4F, $5B, $15, $AB, $62
		dc.b	$B4, $33, $ED, $84, $73, $B4, $5C, $53, $2B, $4C, $AE, $8B
		dc.b	$4C, $B3, $16, $82, $E6, $25, $24, $2D, $CE, $C6, $5C, $C1
		dc.b	$D8, $CB, $98, $94, $90, $B7, $3E, $82, $E6, $20
		dcb.b	2,0
		dc.b	$12, 0, $1A, 0, $20, 0, $3A, 0, $54, 0, $6E, 0, $7A, 0, $B4
		dc.b	0, $EE
		dcb.b	2,1
		dc.b	0, 2, 0, 3, 0, $FF, 5, 4, 5, 6, 7, $FF, 0
		dcb.b	2,4
		dc.b	0
		dcb.b	2,4
		dc.b	0
		dcb.b	2,5
		dc.b	0
		dcb.b	2,5
		dc.b	0
		dcb.b	2,6
		dc.b	0
		dcb.b	2,6
		dc.b	0
		dcb.b	2,7
		dc.b	0
		dcb.b	2,7
		dc.b	0, $FF, 0
		dcb.b	2,4
		dc.b	0, 4
		dcb.b	2,0
		dcb.b	2,5
		dc.b	0, 5
		dcb.b	2,0
		dcb.b	2,6
		dc.b	0, 6
		dcb.b	2,0
		dcb.b	2,7
		dc.b	0, 7
		dcb.b	2,0
		dc.b	$FF, 0, 4
		dcb.b	2,0
		dc.b	4
		dcb.b	2,0
		dc.b	5
		dcb.b	2,0
		dc.b	5
		dcb.b	2,0
		dc.b	6
		dcb.b	2,0
		dc.b	6
		dcb.b	2,0
		dc.b	7
		dcb.b	2,0
		dc.b	7
		dcb.b	2,0
		dc.b	$FF, 0, 8, 9, $A, $B, $C, $B, $A, 9, 8, 0, $FF, 0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$C
		dc.b	0
		dcb.b	2,$C
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$FF
		dcb.b	2,0
		dcb.b	2,8
		dc.b	0, 8
		dcb.b	2,0
		dcb.b	2,9
		dc.b	0, 9
		dcb.b	2,0
		dcb.b	2,$A
		dc.b	0, $A
		dcb.b	2,0
		dcb.b	2,$B
		dc.b	0, $B
		dcb.b	2,0
		dcb.b	2,$C
		dc.b	0, $C
		dcb.b	2,0
		dcb.b	2,$B
		dc.b	0, $B
		dcb.b	2,0
		dcb.b	2,$A
		dc.b	0, $A
		dcb.b	2,0
		dcb.b	2,9
		dc.b	0, 9
		dcb.b	2,0
		dcb.b	2,8
		dc.b	0, 8
		dcb.b	3,0
		dc.b	$FF
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$C
		dcb.b	2,0
		dc.b	$C
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	8
		dcb.b	3,0
		dc.b	$FF
		dcb.b	2,0
		dc.b	$25, 0, $1A, 0, $2F, 0, $44, 0, $59, 0, $6E, 0, $83, 0, $98
		dc.b	0, $AE, 0, $C4, 0, $DA, 0, $F0, 1, 6, 4, $E8, $A
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$A, 0, 9
		dcb.b	2,0
		dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
		dcb.b	2,$E8
		dc.b	$A, 0, $1B
		dcb.b	2,0
		dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B, 0, 4, $E8, $A, 8, 9
		dcb.b	2,$E8
		dc.b	$A, 8
		dcb.b	3,0
		dc.b	$A, $18, 9, $E8, 0, $A, $18
		dcb.b	2,0
		dc.b	4, $E8, $A
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$A, 0, 9
		dcb.b	2,0
		dc.b	$A, $18, 9, $E8, 0, $A, $18
		dcb.b	2,0
		dc.b	4, $E8, $A, 8, 9
		dcb.b	2,$E8
		dc.b	$A, 8
		dcb.b	3,0
		dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
		dcb.b	2,$E8
		dc.b	$A, 0, $1B
		dcb.b	2,0
		dc.b	$A, $18, $1B, $E8, 0, $A, $18, $12, 0, 4, $E8, $A, 8, $1B
		dcb.b	2,$E8
		dc.b	$A, 8, $12
		dcb.b	2,0
		dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B
		dcb.b	2,0
		dc.b	4, $F0, 5
		dcb.b	2,0
		dcb.b	2,$F0
		dc.b	5, 8
		dcb.b	3,0
		dc.b	5, $10, 0, $F0, 0, 5, $18
		dcb.b	3,0
		dc.b	4, $F0, 5, 0, 4
		dcb.b	2,$F0
		dc.b	5, 8, 4
		dcb.b	2,0
		dc.b	5, $10, 4, $F0, 0, 5, $18, 4
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, 8
		dcb.b	2,$E8
		dc.b	$A
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$A, $10, 8, $E8, 0, $A, $18, 8
		dcb.b	2,0
		dc.b	4, $F0, 5, 0, $11
		dcb.b	2,$F0
		dc.b	5, 0, $15
		dcb.b	2,0
		dc.b	5, $18, $15, $F0, 0, 5, $18, $11
		dcb.b	2,0
		dc.b	2, $F4, 6, 0, $19, $F0, $F4, 6, 8, $19
		dcb.b	3,0
		dc.b	6, 0, $E, 0, $14, 3, 0, 4, 3, 1, 2, $FC, 0, 3, 0, 1, 2, $FC
		dc.b	0, 3, 6, 5, $FC, 0, $E, 0, $1A, 0, $26, 0, $2C, 0, $42, 0
		dc.b	$58, 0, $5E, 2, $F0, 5
		dcb.b	2,0
		dc.b	$FC, $F8
		dcb.b	2,0
		dc.b	4, $F4, 0, 2, $E0
		dcb.b	2,0
		dc.b	5, $F8, $E8, $E, 0, 6, $F0, 0, 1, $E0, $F, 0, $12, $F0, 4
		dc.b	$D0, 6, 0, $22, $F8, $D8
		dcb.b	2,0
		dc.b	$28, $F0, $E0
		dcb.b	2,0
		dc.b	$29, 8, $E8, $E, 0, $2A, $F0, 0, 4, $C0
		dcb.b	2,0
		dc.b	$36, $F8, $C8, 6, 0, $37, $F8, $D8
		dcb.b	2,0
		dc.b	$3D, $F0, $E0, $F, 0, $3E, $F0, 0, 1, $F0, 9, 0, $4E, $F4
		dc.b	1, $F8, 4, 0, $54, $F8, 0, 2
		dcb.b	3,0
		dcb.b	8,1
		dc.b	$FC, 0, $10, 0, 4, 2, $D0, 3
		dcb.b	2,0
		dc.b	$E4, $F0, 1, 0, 4, $E4, 0, 2, $F8, $C, 0, 6, $E8, $F8, 4
		dc.b	0, $A, 8
		dcb.b	2,0
		dc.b	2, 3, 0, 1, 2, $FC
		dcb.b	2,0
		dc.b	6, 0, $C, 0, $12, 1, $F0, $F
		dcb.b	2,0
		dc.b	$F0, 1, $F4, $A, 0, $10, $F4, 1, $F8, 5, 0, $19, $F8, 0, 4
		dc.b	0, $C, 3, 0, 5, 6, 3, 4, $FC, 0, 3, 0, 1, 2, 3, 4, $FC
		dcb.b	2,0
		dc.b	$E, 0, $1A, 0, $2A, 0, $40, 0, $56, 0, $6C, 0, $7C, 2, $F8
		dc.b	5
		dcb.b	2,0
		dc.b	$F0, $F8, 5, 8
		dcb.b	3,0
		dc.b	3, $F0, $D, 0, 4, $F0, 0, 5, 0, $C, $F0, 0, 5, 8, $C, 0, 4
		dc.b	$F0, 5, 0, $10
		dcb.b	2,$F0
		dc.b	5, 0, $14
		dcb.b	2,0
		dc.b	5, 0, $18, $F0, 0, 5, $18, $10
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, $1C
		dcb.b	2,$E8
		dc.b	$A, 8, $1C
		dcb.b	2,0
		dc.b	$A, $10, $1C, $E8, 0, $A, $18, $1C
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, $25
		dcb.b	2,$E8
		dc.b	$A, 8, $25
		dcb.b	2,0
		dc.b	$A, $10, $25, $E8, 0, $A, $18, $25
		dcb.b	2,0
		dc.b	3, $F0, $D, 0, $2E, $F0, 0, 5, 0, $36, $F0, 0, 5, 8, $36
		dc.b	0, 4, $F0, 5, 0, $3A
		dcb.b	2,$F0
		dc.b	5, 0, $3E
		dcb.b	2,0
		dc.b	5, 0, $42, $F0, 0, 5, $18, $3A
		dcb.b	8,0
		dcb.b	5,1
		dcb.b	7,2
		dcb.b	$1D,3
		dcb.b	7,2
		dcb.b	5,1
		dcb.b	6,0
		dcb.b	5,$FF
		dcb.b	5,$FE
		dcb.b	7,$FD
		dcb.b	$1D,$FC
		dcb.b	7,$FD
		dcb.b	5,$FE
		dcb.b	5,$FF
		dcb.b	6,0
		dcb.b	5,1
		dcb.b	7,2
		dcb.b	$1D,3
		dcb.b	7,2
		dcb.b	5,1
		dcb.b	6,0
		dcb.b	5,$FF
		dcb.b	5,$FE
		dcb.b	7,$FD
		dcb.b	$1D,$FC
		dcb.b	7,$FD
		dcb.b	5,$FE
		dcb.b	5,$FF
		dc.b	0, 2, 3, 2, 3, $FF, 0, 8, 0, $1E, 0, $2A, 0, $36, 4, $E8
		dc.b	3
		dcb.b	2,0
		dc.b	$F8, $E8, 3, 8
		dcb.b	2,0
		dc.b	8, 1, 0, 4, $F8, 8, 1, 8, 4
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, 6
		dcb.b	2,$F8
		dc.b	1, 8, 6
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, 8
		dcb.b	2,$F8
		dc.b	1
		dcb.b	2,8
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, $A
		dcb.b	2,$F8
		dc.b	1, 8, $A
		dcb.b	3,0
		dc.b	2, 7, 0, 1, 2, 3, $FF, 0, 8, 0, $3C, 0, $70, 0, $7C, $A, $E0
		dc.b	9
		dcb.b	2,0
		dc.b	$E8, $E0, 9, 0, 6, 0, $E8
		dcb.b	2,0
		dc.b	$C, $E0, $E8
		dcb.b	2,0
		dc.b	$D, $18, $F0, 7, 0, $E, $E0, $10
		dcb.b	2,0
		dc.b	$16, $E0, $10, 9, 0, $17, $E8, $10, 9, 0, $1D, 0, $10
		dcb.b	2,0
		dc.b	$23, $18, $F0, 7, 0, $24, $10, 0, $A, $E0, $D, 0, $2C, $F0
		dc.b	$E8
		dcb.b	2,0
		dc.b	$34, $E8, $F0, 7, 0, $35, $E8, $10
		dcb.b	2,0
		dc.b	$3D, $E8, $10, $D, 0, $3E, $F0, $E8
		dcb.b	2,0
		dc.b	$46, $10, $F0
		dcb.b	2,0
		dc.b	$47, 0, $F0, 7, 0, $48
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$50, 0, $10
		dcb.b	2,0
		dc.b	$51, $10, 0, 2, $E0, $B, 0, $52, $F4, 0, $B, 0, $5E, $F4
		dc.b	0, $A, $E0, $D, 8, $2C, $F0, $E8, 0, 8, $34, $10, $F0, 7
		dc.b	8, $35, 8, $10, 0, 8, $3D
		dcb.b	2,$10
		dc.b	$D, 8, $3E, $F0, $E8, 0, 8, $46, $E8, $F0, 0, 8, $47, $F8
		dc.b	$F0, 7, 8, $48, $E8, 8, 0, 8, $50, $F8, $10, 0, 8, $51, $E8
		dcb.b	2,0
		dc.b	2, 1, 0, 1, 2, 4
		dcb.b	2,3
		dc.b	1, 2, 4, $FF
		dcb.b	2,0
		dc.b	$C, 0, $22, 0, $32, 0, $42, 0, $58, 0, $68, 4, $D4, $B
		dcb.b	2,0
		dc.b	$E8, $D4, $B, 0, $C, 0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
		dc.b	$F0, 0, 3, $D4, $F, 0, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C
		dc.b	0, $48, $F0, 3, $D4, 3, 0, $28, $FC, $F4, 5, 0, $44, $F8
		dc.b	4, $C, 0, $48, $F0, 4, $D4, $B, 0, $2C, $E8, $D4, $B, 0, $38
		dc.b	0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0, 0, 3, $D4, $F
		dc.b	8, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0, 4, $E4
		dc.b	2
		dcb.b	2,0
		dc.b	$EC, $E4, $F, 0, 3, $F4, 4, 1, 0, $13, $FC, $14, 8, 0, $15
		dc.b	$F4
		dcb.b	2,0
		dc.b	4, 0, $2C, 1
		dcb.b	$1E,0
		dc.b	1
		dcb.b	2,0
		dc.b	1
		dcb.b	2,0
		dc.b	1, $FF, 0, 2, 3, 4, 5, 6, 7, 8, $FF, 0, $12, 0, $50, 0, $8E
		dc.b	0, $AE, 0, $B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
		dcb.b	2,0
		dc.b	$F8, $E0, 1, 8
		dcb.b	2,0
		dc.b	$F0, 8, 0, 2, $E8, $F0, 8, 0, 5, 0, $F8, $D, 0, 8, $E0, $F8
		dc.b	$D, 0, $10, 0, 8, $D, 0, $18, $E0, 8, $D, 8, $18, 0, $18
		dc.b	$C, 0, $20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0
		dc.b	$20, 7, 8, $54
		dcb.b	2,0
		dc.b	$C, $E0, 1, 0, $24, $F8, $E0, 1, 8, $24, 0, $F0, 8, 0, $26
		dc.b	$E8, $F0, 8, 0, $29, 0, $F8, $D, 0, $2C, $E0, $F8, $D, 0
		dc.b	$34, 0, 8, $D, 0, $3C, $E0, 8, $D, 8, $3C, 0, $18, $C, 0
		dc.b	$20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7
		dc.b	8, $54
		dcb.b	2,0
		dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20
		dc.b	$E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
		dcb.b	2,0
		dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5
		dc.b	0, $64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8
		dc.b	1, $F8, 5, 8, $5C, $F8, $BE, $B7, $12, 3, $FF, $9A, $6E, $8C
		dc.b	$AE, $2C, $B0, $24, $2C, $E6, $46, $D2, $C8, $8D, $25, $81
		dc.b	$24, $AE, $A1, $E1, $76, $4D, $71, $64, $E6, $46, $59, $D9
		dc.b	9, $93, $2B, $8B, $26, $73, $7C, $F0, $92, $CE, $48, $E8
		dc.b	$48, $57, $76, $ED, $BE, $D9, $9F, $A3, $F3, $F4, $97, $EF
		dc.b	$B0, $A7, $FF, $9F, $FB, $DD, $5F, $DE, $EA, $E9, $CE, $FF
		dc.b	$BD, $7E, $7F, $DE, $BF, $3C, $BA, $A5, $D3, $9F, $AB, $9F
		dc.b	$A7, $57, $3F, $4E, $AE, $7E, $9F, $BD, $E9, $FB, $DE, $7C
		dc.b	$3F, $7C, $FD, $5F, $BE, $7E, $A7, $FD, $EB, $F5, $7F, $4F
		dc.b	$AB, $9F, $A7, $EF, $5F, $A7, $EF, $79, $F0, $FD, $F4, $BA
		dc.b	$73, $FF, $4D, $F0, $7F, $DF, $75, $73, $CB, $AB, $F7, $CF
		dc.b	$83, $F3, $BF, $3B, $F3, $F5, $73, $E1, $CF, $D4, $F8, $73
		dc.b	$F5, $73, $CB, 7, $E7, $E9, $FB, $EF, $DE, $FE, $FB, $F7
		dc.b	$BF, $BE, $FE, $9F, $F7, $BA, $9F, $F7, $DD, $4F, $FB, $E7
		dc.b	$EA, $A6, $1F, $BE, $EA, $E8, $FD, $5D, $1F, $AB, $9F, $A3
		dc.b	$F5, $3E, $F, $D4, $F8, $4B, $A9, $FF, $7B, $CF, $87, $EF
		dc.b	$7A, $3F, $57, $47, $EA, $E9, $FB, $D9, $61, $FD, $DC, $3F
		dc.b	$BC, $FD, $1F, $F, $DE, $F3, $E1, $CF, $2E, $AE, $77, $FD
		dcb.b	2,$EF
		dc.b	$BA, $3F, $EF, $8B, $67, $91, $6A, $FE, $E9, $6A, $FE, $EB
		dc.b	$EC, $8D, $7D, $3F, $FB, $1C, $FF, $DD, $E7, $FE, $EE, $AC
		dc.b	$75, $3F, $F7, $9F, $FB, $DD, $54, $EA, $A7, $FF, $BF, $FD
		dc.b	$FF, $ED, $58, $EA, $E9, $FA, $E6, $8D, $71, $D3, $C9, $F6
		dc.b	$46, $BD, $5E, $5D, $35, $79, $74, $2F, $E9, $C7, $F0, $CB
		dc.b	$9F, $FB, $AF, $FD, $E7, $FE, $F7, $F3, $63, $F8, $7E, $58
		dc.b	$7E, $BB, $C9, $FF, $BB, $87, $F7, $5F, $F5, $D1, $FC, $E8
		dc.b	$E7, $1F, $DE, $FE, $1C, $7F, $F, $FF, $D1, $FF, $DF, $EE
		dc.b	$D7, $CB, 8, $F2, $C3, $FB, $B8, $7F, $77, $9E, $9D, $45
		dc.b	$FC, $D8, $D7, $4E, $7F, $E9, $F3, $FF, $4F, $5E, $AF, $F1
		dc.b	$CB, $F5, $D5, $FE, $76, $C8, $E7, $D9, $FA, $EA, $FF, $FB
		dc.b	$F5, $DD, $5F, $BE, $7E, $AF, $DF, $75, $47, $95, $7C, $9F
		dc.b	$F5, $D1, $D5, $FA, $E2, $FF, $EF, $49, $6C, $2E, $9E, $5A
		dc.b	$BA, $7E, $F7, $FC, $7A, $F5, $7F, $4F, $A8, $7F, $4F, $5B
		dc.b	$17, $F3, $A3, $FF, $DF, $AE, $D9, $CF, $1E, $5C, $F4, $FE
		dc.b	$6F, $EB, $8B, $A4, $6B, $FF, $F7, $EB, $A5, $D3, $F7, $DF
		dc.b	$BD, $FD, $73, $7F, $B5, $9F, $F8, $7A, $9F, $F8, $7A, $BF
		dc.b	$7B, $D, $FB, $D8, $6E, $AA, $B7, $3F, $FC, $FA, $3F, $F4
		dc.b	$DF, $FF, $DF, $CE, $8D, $8F, $FA, $ED, $95, $FF, $D9, $EC
		dc.b	$92, $6C, $EF, 0, 1, $AB, $CB, $F7, $80, 2, $E5, $AB, $5C
		dc.b	$B9, $23, $17, $5C, $20, $74, $96, $6E, $DB, $7E, $6F, $78
		dc.b	$CF, $7E, $7B, $C6, $C2, $E5, $81, $72, $EB, $99, $37, $5C
		dc.b	$C3, $B4, $33, $EA, $8D, $42, $5A, $A9, $CA, $5A, $AB, $C3
		dc.b	$5F, $28, $E5, $5E, $F, $C0, $8C, $BF, $36, $F9, $11, $97
		dc.b	7, $3E, $5A, $F9, $73, $C7, $80, $FC, $D7, $6B, $A, $4C, $17
		dc.b	$E9, $DE, $63, $F8, $7A, $27, $45, 5, $7B, $42, $88, $9B
		dc.b	$AE, $61, $17, $A4, $DF, $F6, $BF, $B7, $94, $C0, $9E, $3A
		dc.b	$FF, $31, $F9, $CA, $5D, $FA, $EA, $EE, $8F, $CC, $76, $75
		dc.b	$F9, $44, $C5, $38, $F5, $57, $3C, $A7, $1E, $5A, $75, $C6
		dc.b	$71, $CB, $57, $E7, $FF, $77, $A, $29, $AB, $F3, $55, $CF
		dc.b	$25, $8F, $D5, $72, $DF, $19, $C7, $D, $FF, $9B, $FD, $FC
		dc.b	$94, 5, $C7, $7F, $3F, $E6, $E9, $77, $85, $77, $49
		dcb.b	2,$4D
		dc.b	$4A, $F7, $32, $30, $48, $70, $C4, $98, $B0, $B8, $12, $52
		dc.b	$E2, $32, $6B, $81, $5C, $48, $1D, 3, $B2, $34, $23, $43
		dc.b	4, $D8, $6C, $64, $C7, 6, $21, $1D, 9, $24, $D0, $60, $9A
		dc.b	$12, $8C
		dcb.b	3,$4C
		dc.b	$EC, $46, $ED, $23, 4, $64, $72, $61, $C, $4D, $43, $96, $9A
		dc.b	$26, $F2
		dcb.b	2,$62
		dc.b	$64, $73, $23, 5, $74, $20, $24, $84, $26, $74, 1, $AE, $8B
		dc.b	$8C, $3A, $12, $50, $C9, 9, 1, $23, $13, $42, 9, $32, $13
		dc.b	$11, $91, $EC, $15, $68, $64, $24, 6, $20, $EA, $6E
		dcb.b	3,$C4
		dc.b	$C8, $48, $46, $49, $84, $19, $30, $23, $93, 3, $76, $26
		dc.b	$11, $A5, $DA, $5B, $CB, $56, 8, $D5, $D7, $46, $7D, $45
		dcb.b	2,$AA
		dc.b	$E8, $21, $85, $4D, $5D, 9, $35, $16, $F6
		dcb.b	2,$52
		dc.b	$D4, $5A, $A4, $80, $12, $55, $96, $4D, $56, $AB, $49, $59
		dc.b	$4D, $49, $58, 7, $59, $31, $34, $DC, $C5, $52, $70, $B5
		dc.b	$9C, $4D, $90, $92, $AB, $13, $A1, $82, $32, $37, $6C, $4E
		dc.b	$26, $53, $11, $C8, $AE, $EB, $2E, $55, $D6, $83, $52, $6A
		dc.b	$AA, $8A
		dcb.b	2,$31
		dc.b	$21, $30, $59, $26, $A2, $DE
		dcb.b	2,$6A
		dc.b	$5A, $8B, $54, $90, $8C
		dcb.b	2,$90
		dc.b	$42, $51, $44
		dcb.b	2,$98
		dc.b	$90, $99, $D5, $94, $D4, $94, $3B, $11, $91, $C9, $71, $9C
		dc.b	$8C, $11, $BC, $E1, $6B, $37, $39, $92, $1A, $1C, $95, $CE
		dc.b	$6E, $95, $38, $30, $D8, $9C, $4D, $A6, $20, $C8, $D8, $CB
		dc.b	$70, $A1, $C3, $12, $62, $D2, $39, $20, $24, $A1, $A6, $44
		dc.b	$C4, $80, $90, $48, $D0, $42, $55, $A1, $A8, $6E
		dcb.b	3,$C6
		dc.b	$59, $46, $41, $D0, $13, $41, $83, $68, $41
		dcb.b	2,$23
		dc.b	$62, $3C, $4C, $11, $96, $40, 3, $91, $D1, $C
		dcb.b	2,$8C
		dc.b	$8D, $C, $51, $21, 1, $24, $21, $B0, $10, $C6, $86, $E8, $46
		dc.b	4, $19, $21, $A0, $24, 1, $CD, $9C
		dcb.b	2,$C8
		dc.b	$D8, $DA, $46, $1A, $18, $41, $83, $73, $A9, $83, $43, $42
		dc.b	$32, $42, $68, $32, $60, $59, 9, $18, 6, $ED
		dcb.b	2,$23
		dc.b	$63, $43, $12, $60, $E6, $E8, $21, $85, $72, $74, $24, $73
		dc.b	$63, $23, 8, 1, $25, $58, $E4, $D5, $6A, $B4, $8D, $B7, $11
		dc.b	$B0, $E, $72, $62, $68, $31, $54, $91, $87, $63, $23, $A9
		dc.b	$87, $30
		dcb.b	2,$46
		dc.b	$1C, $C0
		dcb.b	2,$23
		dc.b	$43, $23, $A2, 2, $4A, $18, $A3, $13, $12, $13, 3, $92, $3F
		dc.b	$F0, $82, $11, $92, $12, 8, $4A, $18, $93, $13, $12, $13
		dc.b	$39, $B6, $E2, $30, $EC, $46, $47, $23, $12, $30, $47, $43
		dc.b	6, $FF, $B2, $91, $B9, $C2, $54, $E0, $C0, $39, $30, $96
		dc.b	$A9, $EA, $B6, $A9, $EA, $E3, $FB, $E8, $D7, $FB, $E0, $5E
		dc.b	$55, $F2, $FF, $F7, $FF, $BF, $FD, $FF, $3F, $FE, $C7, $FF
		dc.b	$45, $7F, $FB, $FF, $DF, $F9, $FE, $BB, $F8, $71, $FC, $D1
		dc.b	$FF, $DF, $FE, $C7, $F3, $63, $FF, $BF, $CD, $97, $49, $74
		dc.b	$FD, $EC, $BF, $7D, $FF, $3F, $F9, $FF, $CF, $A6, $2C, $FF
		dc.b	$C3, $8F, $E9, $D3, $FA, $7D, $5C, $FD, $3C, $B5, $7E, $F6
		dc.b	$1B, $F7, $BD, $3F, $7B, $FF, $EF, $DF, $6C, $AE, $C2, $FF
		dc.b	$F4, $BF, $FD, $FC, $38, $FE, $1C, $7F, $CF, $A7, $EF, $7A
		dc.b	$7E, $FA, $5F, $F3, $FD, $EF, $4E, $AE, $7F, $EE, $F3, $FE
		dcb.b	2,$F7
		dc.b	$DD, $25, $FF, $EF, $FF, $74, $97, $EF, $7F, $7C, $25, $FB
		dcb.b	2,$DF
		dc.b	$74, $FF, $F0, $FF, $F7, $FF, $A9, $D5, $4E, $AF, $FF, $7F
		dc.b	$FB, $FF, $DC, $FF, $D3, $7F, $EE, $CB, $FF, $B2, $FF
		dcb.b	2,$EF
		dc.b	$A5, $FB, $EF, $DE, $FE, $FB, $F7, $BD, $3F
		dcb.b	2,$FB
		dc.b	$DF, $FF, $7F, $FA, $5F, $FD, $E9, $FB
		dcb.b	2,$DF
		dc.b	$7F, $F7, $FE, $7C, $FF, $D3, $7F, $EE, $CB, $FF, $B2, $FF
		dc.b	$9F, $FC, $E5, $D0, $7E
		dcb.b	2,$F7
		dc.b	$DF, $ED, $D5, $FE, $32, $E9, $2F, $DE, $FE, $FB, $AB, $FB
		dc.b	$DD, $5F, $FE, $E7, $97, $4F, $DF, $74, $1F, $BE, $97, $EF
		dc.b	$A3, $F8, $71, $FF, $3F, $F9, $B7, $EF, $76, $17, $EF, $A3
		dc.b	$FE, $7F, $F3, $69, $7E
		dcb.b	2,$F7
		dc.b	$DF, $BD, $FD, $F7, $49, $7F, $FB, $F7, $D2, $E9, $FB, $EE
		dc.b	$92, $FF, $F0, $FD, $F4, $BF, $7D, $2F, $DF, $FE, $EE, $14
		dc.b	$97, $34, $95, $33, $3A, $92, $E6, $B5, $66, $8C, $4A, $F6
		dc.b	$42, $49, $1B, $9A, $C4, $C9, $A, $6B, $B, $3B, $56, $76
		dc.b	$30, $69, $34, $29, $DB, $24, $9B, $CE, $C7, 8, $26, $73
		dc.b	$23, $49, $AC, $ED, $95, $9D, $49, $66, $65, $91, $2E, $37
		dc.b	$1B, $E6, $2D, $B3, $C7, $31, $66, $2D, $B9, $4B, $BC, $B2
		dc.b	$2F, $DA, $17, $ED, $56, $67, $19, $89, $2F, $24, $E6, $6E
		dc.b	$D0, $5D, $ED, $DA, $B3, $4C, $3F, $4C, $17, $36, $DD, $C5
		dc.b	$3D, $BD, $7F, $9F, $EB, $C5, $A4, $C2, $E0, $92, $42, $3A
		dc.b	$A3, $9D, $8F, $32, 3, $62, $B1, $E6, $86, $12, $32, $4A
		dc.b	$9B, $A4, $8C, $8E, $8C, $46, $A, $7B, $7A, $F9, $75, $E9
		dc.b	$C4, $FF, $5F, $FB, $E2, $C0, $AE, $24, $9F, $E6, $FF, $51
		dc.b	$A7, $89, $7F, $88, $BF, $C3, $3F, $F2, $14, $E9, $63, $1F
		dc.b	$CC
		dcb.b	2,$FC
		dc.b	$F2, $23, $2C, $B, $B3, $86, $9F, $D5, $97, $F8, $A7, $FE
		dc.b	$12, $FF, $26, $65, $85
		dcb.b	2,$98
		dc.b	$85, $9A, $65, $B, $34, $32, $45, $AA, $2D
		dcb.b	2,$16
		dc.b	$68, $65, $99, $A, $E6, $2C, $8B, $BC, $B3, $27, $EC, $A5
		dc.b	$FB, $50, $59, $8B, $F6, $A5, $92, $7E, $C8, $AE, $2E, $F2
		dc.b	$D0, $9F, $B4, $2E, $62, $E6, $2D, $C5, $B8, $B9, $8B, $98
		dc.b	$17, $31, $73, $16, $E2, $DC, $5C, $C5, $CD, $AA, $C5, $FC
		dc.b	$3E, $B7, $BD, $A0, $F6, $99, $34, $B6, $92, $DF, $23, $B2
		dc.b	$3A, $39, $CC, $92, $F2, $47, $39, $AE, $F7, $42, $39, $A9
		dc.b	$77, $16, $4D, $BF, $73, $D9, $FF, $4F, $5B, $15, $AB, $62
		dc.b	$B4, $33, $ED, $84, $73, $B4, $5C, $53, $2B, $4C, $AE, $8B
		dc.b	$4C, $B3, $16, $82, $E6, $25, $24, $2D, $CE, $C6, $5C, $C1
		dc.b	$D8, $CB, $98, $94, $90, $B7, $3E, $82, $E6, $20
		dcb.b	2,0
		dc.b	$12, 0, $1A, 0, $20, 0, $3A, 0, $54, 0, $6E, 0, $7A, 0, $B4
		dc.b	0, $EE
		dcb.b	2,1
		dc.b	0, 2, 0, 3, 0, $FF, 5, 4, 5, 6, 7, $FF, 0
		dcb.b	2,4
		dc.b	0
		dcb.b	2,4
		dc.b	0
		dcb.b	2,5
		dc.b	0
		dcb.b	2,5
		dc.b	0
		dcb.b	2,6
		dc.b	0
		dcb.b	2,6
		dc.b	0
		dcb.b	2,7
		dc.b	0
		dcb.b	2,7
		dc.b	0, $FF, 0
		dcb.b	2,4
		dc.b	0, 4
		dcb.b	2,0
		dcb.b	2,5
		dc.b	0, 5
		dcb.b	2,0
		dcb.b	2,6
		dc.b	0, 6
		dcb.b	2,0
		dcb.b	2,7
		dc.b	0, 7
		dcb.b	2,0
		dc.b	$FF, 0, 4
		dcb.b	2,0
		dc.b	4
		dcb.b	2,0
		dc.b	5
		dcb.b	2,0
		dc.b	5
		dcb.b	2,0
		dc.b	6
		dcb.b	2,0
		dc.b	6
		dcb.b	2,0
		dc.b	7
		dcb.b	2,0
		dc.b	7
		dcb.b	2,0
		dc.b	$FF, 0, 8, 9, $A, $B, $C, $B, $A, 9, 8, 0, $FF, 0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$C
		dc.b	0
		dcb.b	2,$C
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$FF
		dcb.b	2,0
		dcb.b	2,8
		dc.b	0, 8
		dcb.b	2,0
		dcb.b	2,9
		dc.b	0, 9
		dcb.b	2,0
		dcb.b	2,$A
		dc.b	0, $A
		dcb.b	2,0
		dcb.b	2,$B
		dc.b	0, $B
		dcb.b	2,0
		dcb.b	2,$C
		dc.b	0, $C
		dcb.b	2,0
		dcb.b	2,$B
		dc.b	0, $B
		dcb.b	2,0
		dcb.b	2,$A
		dc.b	0, $A
		dcb.b	2,0
		dcb.b	2,9
		dc.b	0, 9
		dcb.b	2,0
		dcb.b	2,8
		dc.b	0, 8
		dcb.b	3,0
		dc.b	$FF
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$C
		dcb.b	2,0
		dc.b	$C
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	8
		dcb.b	3,0
		dc.b	$FF
		dcb.b	2,0
		dc.b	$25, 0, $1A, 0, $2F, 0, $44, 0, $59, 0, $6E, 0, $83, 0, $98
		dc.b	0, $AE, 0, $C4, 0, $DA, 0, $F0, 1, 6, 4, $E8, $A
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$A, 0, 9
		dcb.b	2,0
		dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
		dcb.b	2,$E8
		dc.b	$A, 0, $1B
		dcb.b	2,0
		dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B, 0, 4, $E8, $A, 8, 9
		dcb.b	2,$E8
		dc.b	$A, 8
		dcb.b	3,0
		dc.b	$A, $18, 9, $E8, 0, $A, $18
		dcb.b	2,0
		dc.b	4, $E8, $A
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$A, 0, 9
		dcb.b	2,0
		dc.b	$A, $18, 9, $E8, 0, $A, $18
		dcb.b	2,0
		dc.b	4, $E8, $A, 8, 9
		dcb.b	2,$E8
		dc.b	$A, 8
		dcb.b	3,0
		dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
		dcb.b	2,$E8
		dc.b	$A, 0, $1B
		dcb.b	2,0
		dc.b	$A, $18, $1B, $E8, 0, $A, $18, $12, 0, 4, $E8, $A, 8, $1B
		dcb.b	2,$E8
		dc.b	$A, 8, $12
		dcb.b	2,0
		dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B
		dcb.b	2,0
		dc.b	4, $F0, 5
		dcb.b	2,0
		dcb.b	2,$F0
		dc.b	5, 8
		dcb.b	3,0
		dc.b	5, $10, 0, $F0, 0, 5, $18
		dcb.b	3,0
		dc.b	4, $F0, 5, 0, 4
		dcb.b	2,$F0
		dc.b	5, 8, 4
		dcb.b	2,0
		dc.b	5, $10, 4, $F0, 0, 5, $18, 4
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, 8
		dcb.b	2,$E8
		dc.b	$A
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$A, $10, 8, $E8, 0, $A, $18, 8
		dcb.b	2,0
		dc.b	4, $F0, 5, 0, $11
		dcb.b	2,$F0
		dc.b	5, 0, $15
		dcb.b	2,0
		dc.b	5, $18, $15, $F0, 0, 5, $18, $11
		dcb.b	2,0
		dc.b	2, $F4, 6, 0, $19, $F0, $F4, 6, 8, $19
		dcb.b	3,0
		dc.b	6, 0, $E, 0, $14, 3, 0, 4, 3, 1, 2, $FC, 0, 3, 0, 1, 2, $FC
		dc.b	0, 3, 6, 5, $FC, 0, $E, 0, $1A, 0, $26, 0, $2C, 0, $42, 0
		dc.b	$58, 0, $5E, 2, $F0, 5
		dcb.b	2,0
		dc.b	$FC, $F8
		dcb.b	2,0
		dc.b	4, $F4, 0, 2, $E0
		dcb.b	2,0
		dc.b	5, $F8, $E8, $E, 0, 6, $F0, 0, 1, $E0, $F, 0, $12, $F0, 4
		dc.b	$D0, 6, 0, $22, $F8, $D8
		dcb.b	2,0
		dc.b	$28, $F0, $E0
		dcb.b	2,0
		dc.b	$29, 8, $E8, $E, 0, $2A, $F0, 0, 4, $C0
		dcb.b	2,0
		dc.b	$36, $F8, $C8, 6, 0, $37, $F8, $D8
		dcb.b	2,0
		dc.b	$3D, $F0, $E0, $F, 0, $3E, $F0, 0, 1, $F0, 9, 0, $4E, $F4
		dc.b	1, $F8, 4, 0, $54, $F8, 0, 2
		dcb.b	3,0
		dcb.b	8,1
		dc.b	$FC, 0, $10, 0, 4, 2, $D0, 3
		dcb.b	2,0
		dc.b	$E4, $F0, 1, 0, 4, $E4, 0, 2, $F8, $C, 0, 6, $E8, $F8, 4
		dc.b	0, $A, 8
		dcb.b	2,0
		dc.b	2, 3, 0, 1, 2, $FC
		dcb.b	2,0
		dc.b	6, 0, $C, 0, $12, 1, $F0, $F
		dcb.b	2,0
		dc.b	$F0, 1, $F4, $A, 0, $10, $F4, 1, $F8, 5, 0, $19, $F8, 0, 4
		dc.b	0, $C, 3, 0, 5, 6, 3, 4, $FC, 0, 3, 0, 1, 2, 3, 4, $FC
		dcb.b	2,0
		dc.b	$E, 0, $1A, 0, $2A, 0, $40, 0, $56, 0, $6C, 0, $7C, 2, $F8
		dc.b	5
		dcb.b	2,0
		dc.b	$F0, $F8, 5, 8
		dcb.b	3,0
		dc.b	3, $F0, $D, 0, 4, $F0, 0, 5, 0, $C, $F0, 0, 5, 8, $C, 0, 4
		dc.b	$F0, 5, 0, $10
		dcb.b	2,$F0
		dc.b	5, 0, $14
		dcb.b	2,0
		dc.b	5, 0, $18, $F0, 0, 5, $18, $10
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, $1C
		dcb.b	2,$E8
		dc.b	$A, 8, $1C
		dcb.b	2,0
		dc.b	$A, $10, $1C, $E8, 0, $A, $18, $1C
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, $25
		dcb.b	2,$E8
		dc.b	$A, 8, $25
		dcb.b	2,0
		dc.b	$A, $10, $25, $E8, 0, $A, $18, $25
		dcb.b	2,0
		dc.b	3, $F0, $D, 0, $2E, $F0, 0, 5, 0, $36, $F0, 0, 5, 8, $36
		dc.b	0, 4, $F0, 5, 0, $3A
		dcb.b	2,$F0
		dc.b	5, 0, $3E
		dcb.b	2,0
		dc.b	5, 0, $42, $F0, 0, 5, $18, $3A
		dcb.b	8,0
		dcb.b	5,1
		dcb.b	7,2
		dcb.b	$1D,3
		dcb.b	7,2
		dcb.b	5,1
		dcb.b	6,0
		dcb.b	5,$FF
		dcb.b	5,$FE
		dcb.b	7,$FD
		dcb.b	$1D,$FC
		dcb.b	7,$FD
		dcb.b	5,$FE
		dcb.b	5,$FF
		dcb.b	6,0
		dcb.b	5,1
		dcb.b	7,2
		dcb.b	$1D,3
		dcb.b	7,2
		dcb.b	5,1
		dcb.b	6,0
		dcb.b	5,$FF
		dcb.b	5,$FE
		dcb.b	7,$FD
		dcb.b	$1D,$FC
		dcb.b	7,$FD
		dcb.b	5,$FE
		dcb.b	5,$FF
		dc.b	0, 2, 3, 2, 3, $FF, 0, 8, 0, $1E, 0, $2A, 0, $36, 4, $E8
		dc.b	3
		dcb.b	2,0
		dc.b	$F8, $E8, 3, 8
		dcb.b	2,0
		dc.b	8, 1, 0, 4, $F8, 8, 1, 8, 4
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, 6
		dcb.b	2,$F8
		dc.b	1, 8, 6
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, 8
		dcb.b	2,$F8
		dc.b	1
		dcb.b	2,8
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, $A
		dcb.b	2,$F8
		dc.b	1, 8, $A
		dcb.b	3,0
		dc.b	2, 7, 0, 1, 2, 3, $FF, 0, 8, 0, $3C, 0, $70, 0, $7C, $A, $E0
		dc.b	9
		dcb.b	2,0
		dc.b	$E8, $E0, 9, 0, 6, 0, $E8
		dcb.b	2,0
		dc.b	$C, $E0, $E8
		dcb.b	2,0
		dc.b	$D, $18, $F0, 7, 0, $E, $E0, $10
		dcb.b	2,0
		dc.b	$16, $E0, $10, 9, 0, $17, $E8, $10, 9, 0, $1D, 0, $10
		dcb.b	2,0
		dc.b	$23, $18, $F0, 7, 0, $24, $10, 0, $A, $E0, $D, 0, $2C, $F0
		dc.b	$E8
		dcb.b	2,0
		dc.b	$34, $E8, $F0, 7, 0, $35, $E8, $10
		dcb.b	2,0
		dc.b	$3D, $E8, $10, $D, 0, $3E, $F0, $E8
		dcb.b	2,0
		dc.b	$46, $10, $F0
		dcb.b	2,0
		dc.b	$47, 0, $F0, 7, 0, $48
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$50, 0, $10
		dcb.b	2,0
		dc.b	$51, $10, 0, 2, $E0, $B, 0, $52, $F4, 0, $B, 0, $5E, $F4
		dc.b	0, $A, $E0, $D, 8, $2C, $F0, $E8, 0, 8, $34, $10, $F0, 7
		dc.b	8, $35, 8, $10, 0, 8, $3D
		dcb.b	2,$10
		dc.b	$D, 8, $3E, $F0, $E8, 0, 8, $46, $E8, $F0, 0, 8, $47, $F8
		dc.b	$F0, 7, 8, $48, $E8, 8, 0, 8, $50, $F8, $10, 0, 8, $51, $E8
		dcb.b	2,0
		dc.b	2, 1, 0, 1, 2, 4
		dcb.b	2,3
		dc.b	1, 2, 4, $FF
		dcb.b	2,0
		dc.b	$C, 0, $22, 0, $32, 0, $42, 0, $58, 0, $68, 4, $D4, $B
		dcb.b	2,0
		dc.b	$E8, $D4, $B, 0, $C, 0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
		dc.b	$F0, 0, 3, $D4, $F, 0, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C
		dc.b	0, $48, $F0, 3, $D4, 3, 0, $28, $FC, $F4, 5, 0, $44, $F8
		dc.b	4, $C, 0, $48, $F0, 4, $D4, $B, 0, $2C, $E8, $D4, $B, 0, $38
		dc.b	0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0, 0, 3, $D4, $F
		dc.b	8, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0, 4, $E4
		dc.b	2
		dcb.b	2,0
		dc.b	$EC, $E4, $F, 0, 3, $F4, 4, 1, 0, $13, $FC, $14, 8, 0, $15
		dc.b	$F4
		dcb.b	2,0
		dc.b	4, 0, $2C, 1
		dcb.b	$1E,0
		dc.b	1
		dcb.b	2,0
		dc.b	1
		dcb.b	2,0
		dc.b	1, $FF, 0, 2, 3, 4, 5, 6, 7, 8, $FF, 0, $12, 0, $50, 0, $8E
		dc.b	0, $AE, 0, $B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
		dcb.b	2,0
		dc.b	$F8, $E0, 1, 8
		dcb.b	2,0
		dc.b	$F0, 8, 0, 2, $E8, $F0, 8, 0, 5, 0, $F8, $D, 0, 8, $E0, $F8
		dc.b	$D, 0, $10, 0, 8, $D, 0, $18, $E0, 8, $D, 8, $18, 0, $18
		dc.b	$C, 0, $20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0
		dc.b	$20, 7, 8, $54
		dcb.b	2,0
		dc.b	$C, $E0, 1, 0, $24, $F8, $E0, 1, 8, $24, 0, $F0, 8, 0, $26
		dc.b	$E8, $F0, 8, 0, $29, 0, $F8, $D, 0, $2C, $E0, $F8, $D, 0
		dc.b	$34, 0, 8, $D, 0, $3C, $E0, 8, $D, 8, $3C, 0, $18, $C, 0
		dc.b	$20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7
		dc.b	8, $54
		dcb.b	2,0
		dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20
		dc.b	$E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
		dcb.b	2,0
		dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5
		dc.b	0, $64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8
		dc.b	1, $F8, 5, 8, $5C, $F8, $2D, $CE, $AE, $DC, $E5, $89, $76
		dc.b	$E7, $19, $39, $76, $E6, $5C, $B3, $97, $6E, $7D, $8E, $59
		dc.b	$CB, $B1, $EC, $72, $CE, $5E, $3B, $1C, $B3, $CF, $B1, $CB
		dc.b	$3C, $FB, $1C, $B5, $FB, $1F, $3E, $C7, $CF, $B3, $9E, $6D
		dc.b	$A5, $5C, $F3, $FE, $49, $73, $FD, $1C, $D8, $FF, $44, $B9
		dc.b	$FE, $1B, $C7, $F0, $7B, $34, $FE, $D8, $FD, $33, $7E, $99
		dc.b	$BF, $4E, $7F, $4E, $7B, $8F, $71, $E4, $79, $1F, $D3, $37
		dc.b	$E9, $98, $46, $9F, $98, $D0, $F5, $57, $73, $43, $62, $CE
		dc.b	$97, $A2, $75, $43, $C2, $65, $26, $A1, $EB, $97, $63, $A3
		dc.b	$B4, $D5, $37, $47, $E6, $F9, $EF, $D3, $9F, $E6, $E9, $85
		dc.b	$BF, $2D, $AB, $9A, $E4, $E9, $1B, $59, $8F, $A7, $5E, $BC
		dc.b	$13, $AF, $F8, $67, 6, $EA, $6F, $D5, $76, $73, $E0, $9B
		dc.b	$AB, $D4, $FC, $E3, $77, $D, $BA, $A9, $C3, $AD, $BA, $A4
		dc.b	$8E, $DD, $6D, $2E, $BE, $1B, $9A, $79, $16, $13, $6C, $F7
		dc.b	$35, $7A, $DF, $FA, $40, 0, $23, $F8, $CB, $F9, $6B, $A6
		dc.b	$B1, $7D, $53, $C4, 1, $AA, $78, $8E, $29, $FB, $71, $B4
		dc.b	$F7, $80, $36, $9E, $F0, $8C, $68, $69, $85, $80, 0, 1, $F9
		dc.b	$FE, $BE, $7E, $1F, $AD, $48, $D9, $8F, $86, $4E, $71, $D2
		dc.b	$36, $63, $E1, $E, $71, $D2, $48, $C7, $C2, $78, $E9, $5F
		dc.b	$A, $E9, $2D, $5B, $E3, $56, $3B, $15, $2E, $50, $D2, $B4
		dc.b	$87, $CE, $8B, $BE, $DB, $51, $69, $D3, $95, $16, $9D, $39
		dc.b	$6A, $9E, $AC, $7F, $69, $E3, $FB, $4F, $1F, $DA, $6B, $2D
		dc.b	$F9, $66, $2E, $D, $2D, $B5, $A9, $1F, $D4, $38, $B3, $E5
		dc.b	$F9, $60
		dcb.b	2,0
		dc.b	$61, $CF, $C3, $AF, $CB, $B3, $C0, $FE, $73, $A5, $7D, $37
		dc.b	$D7, $F3, $F6, $CF, $80, $E7, $A6, $69, $5D, $B4, $FD, $56
		dc.b	$82, $AD, $A0, $BB, $68, $2E, $DA, $A, $E8, $2B, $A0, $AE
		dc.b	$95, $7C, $F4, 2, $38, $7E, $63, $BE, $3A, $F0, $2F, $57
		dc.b	$3D, $E, $E5, $7D, $FE, $51, $45, $FC, $E4, $75, $27, $A4
		dc.b	$FF, $3E, $2B, $DF, $E9, $3F, $CB, $7A, $4F, $F3, $E0, 0
		dc.b	4, $69, $F9, $AE, $C9, $A1, $CA, $34, $E7, $8C, $D0, $E4
		dc.b	$92, $EC, $78, $CA, $69, 9, $1D
		dcb.b	2,$8C
		dc.b	$F5, $74, $68, $EC, $97, $67, $30, $3C, 6, $83, $B2, $5D
		dc.b	$82, $48, $C9, $89, $EA, $F2, $FD, $46, $8D, $89, $ED, $8C
		dc.b	$4F, $6C, $62, $7B, $63, $F3, $FC, $3B, $6F, $DB, $F9, $B9
		dc.b	$7E, $B7, $19, $72, $8F, $D7
		dcb.b	2,$CB
		dc.b	$F5, $F2, $FE, $C, $BA, $B8, 9, $6B, 2, $FC, $63, $AF, $F3
		dc.b	$1F, $AA, $D3, $C0, 0, $54, 0, $A3, $F7, $FD, $72, $D3, $8D
		dc.b	$F9, $F1, $84, $8D, $13, $3E, $C4, $29, $7E, $C0, $99, $FE
		dc.b	$EB, $F7, $67, $5D, $FF, $83, $1F, $C3, $38, $A4, $65, $F
		dc.b	$D9, $C, $71, $8F, $D4, $9C, $6F, $FA, $AE, $CF, $E2, $EB
		dc.b	$8E, $D3, $8C, $76, $9C, $63, $B4, $E3, $1D, $A7, $18, $ED
		dc.b	$38, $C7, $69, $C6, $3B, $4E, $2C, $BF, $9F, $53, $89, $B4
		dc.b	$29, $C6, $49, $F9, $FC, $74, $E7, $3C, $6B, $AE, $1A, $38
		dc.b	$75, 2, $D1, $8C, $75, $70, $EA, $E1, $FA, $FE, $F, $F9, $F7
		dc.b	$FD, $96, $25, $D3, $86, $E4, $E1, $E, $90, $92, $74, $84
		dc.b	$87, $DD, $D7, $1C, $25, $CA, $31, $AF, $67, $53, $9E, $CE
		dc.b	$AE, $1D
		dcb.b	2,$53
		dc.b	$8C, $93, $F3, $F8, $F3, $DD, $3C, $6B, $AE, $1A, $38, $75
		dc.b	2, $D1, $8C, $76, $73, $EA, $FD, $F7, $53, $1F, $EA, $16
		dc.b	$FE, $A4, $5B, $F8, $92, $6F, $DA, $4E, $DD, $B7, $6D, $52
		dc.b	$FD, $4D, $8F, $1E, $7E, $56, $3F, $B4, $F1, $FD, $A7, $8F
		dc.b	$ED, $3C, $7F, $5C, $BE, $32, $5C, $7F, $3F, $2D, $DF, $9C
		dc.b	$C6, $5C, $A3, $F3, $1D, $5F, $AE
		dcb.b	2,$FC
		dc.b	$7F, 8, $EF, $AF, $F9, $6C, $3F, $8A, $25, $FC, $2F, $D3
		dc.b	$CB, $F8, $52, $FE, $10, $E9, $FD, $21, $1F, $B5, $1B, $7F
		dc.b	$5F, $6A, $ED, $3F, $D9, 1, $E3, $FB, $31, $2F, $FA, $5F
		dc.b	$FA, $BD, $39, 9, $6C, $39, $4B, $11, $FD, $1D, $43, $5F
		dc.b	$1E, $9C, $BF, $8B, $2F, $FA, $F7, 1, $1F, $D7, $FE, $17
		dc.b	$F1, $F9, $74, $97, $F0, $A5, $FC, $53, $BC, $7F, $5F, $FE
		dc.b	$5B, $E, $EF, $E1, $77, $7F, $1E, $5F, $C5, $E4, $3F, $85
		dc.b	$AC, $F, $E0, $8F, $D3, $7F, 6, $9D, 5, $D3, $3F, $F8, $DF
		dc.b	$5F, $68, $D5, $DC, $9D, $29, $FB, $37, $A1, $4C, $26, $F4
		dc.b	$29, $86, $30, $F4, $29, $69, $BE, $C6, $D3, $FD, $B0, 0
		dc.b	$60, $E1, $EE, $F1, $85, $E9, $F, $2B, $25, $21, $E5, $82
		dcb.b	2,$3C
		dc.b	$B0, $34, $87, $95, $92, $99, $A5, $2B, $B5, $26, $94, $B2
		dc.b	$4B, $A, $43, $C2, $CA, $90, $B4, $8A, $24, $2B, $DA, $1E
		dc.b	$C2, $1C, $42, $57, $A5, $FA, $5E, $D2, $C1, $CE, $16, $8E
		dc.b	$EC, $2D, $14, $46, $5E, $85, $D1, $ED, $16, $C0, $BD, $A5
		dc.b	$48, $B4, $B0, $63, $69, $B9, $B5, $DE, $D5, $B6, $78, $6B
		dc.b	$C3, $B4, $F7, $1E, $EB, $F7, $1E, $40, $F2, 7, $90, $3C
		dc.b	$AF, $DC, $7B, $8F, $71, $EE, 0, $4D, $3B, $85, $F5, $E0
		dc.b	$A0, $42, $8B, $EA, 0, $2E, $BC, $3F, $69, $2C, $29, $37
		dc.b	$96, $A0
		dcb.b	2,$68
		dc.b	$21, $C0, $2A, $55, $17, $7E, $1D, $C8, 0, $EE, $40, $3B
		dc.b	$90, $4F, $B9, 0, $1D, $C8, 0, $EE, $4E, $E3, $DC, $FB, $CA
		dc.b	$77, $1F, $DA, $CB, 3, $43, $4E, $5D, $39, $66, $F3, $E4
		dc.b	$FC, $AB, $BD, $F6, $63, $43, $47, $2F, $84, $51, $B, $B5
		dc.b	$D, $12, $A9, $26, $97, $8C, $F8, $BF, $72, $A, $2D, $30
		dc.b	$A6, $2A, $28, $68, $A, $8B, $A8, $17, $6E, $8D, $FA, $76
		dc.b	3, $5D, 0, $12, $59, $EB, $3F, $E5, $51, $3E, $D0, $F, $69
		dc.b	$D6, 1, $ED, $3D, $C0, $1E, $D0, 0, $3D, $B7, $D6, $14, 9
		dc.b	$28, $13, $D7, $37, $FD, $35, $BF, $4C, $80, $B, $A8, $19
		dc.b	$A1, $4E, $DC, $1E, $CE, $80, 1, $C8, $F7, $20, $1F, $A7
		dc.b	$41, $3E, $E4, 0, 1, $3E, $40, 7, $E4, 0, 7, $93, $80, 0
		dc.b	$12, $7E, $57, $FF, $35, $80, $16, $AD, $81, $C0, $D8, $DA
		dc.b	$17, $36, $C0, $D8, $BE, $F, $3C, $1E, $78, $A
		dcb.b	2,$D8
		dc.b	$52, $1E, $AE, $A, $B2, $2D, $B2, $5E, $57, $D6, $79, $1D
		dc.b	$74, 3, $90, $5E, $42, $9C, $97, $35, $1C, $82, $89, $EB
		dc.b	$3C, $8E, $B9, $BE, $1D, $98, $76, $2E, $8B, $A0, $CD, $24
		dc.b	$C5, $F3, $60, $5C, $17, $CD, $CA, $16, $2E, $B, $8B, $B8
		dc.b	$93, $DD, $A4, $C0, $B1, $62, $D2, $49, $20, $93, $82, $D2
		dc.b	$40, $5A, $4E, $33, $62, $99, $A0, $28, $50, 0, $50, $49
		dc.b	$F3, $71, $9B, $C9, $C1, $79, $39, $60, $24, $C5, $E4, $E5
		dc.b	0, $92, $17, $2E, $B, $81, $26, $CD, $8B, $B, $B4, $98, $49
		dc.b	4, $92, $E8, $B, $97, $28, $5C, $B4, $90, $B0, $28, $2E, $80
		dc.b	$49, $B3, $62, $E2, $EC, $2E, $E2, $4C, $2E, $92, $72, $F2
		dc.b	$61, $27, 0, $BD, $DA, $ED, $76, $BB, $5D, $8A, $49, $80
		dc.b	$CD, $8B, $49, 5, $DC, $66, $C0, $49, 1, $42, $80, $C, $DC
		dc.b	$17, 5, $C0, $BB, $16, $2E, $58, $5D, $E4, $85, 1, $72, $85
		dc.b	$CB, $89, $38, $12, $62, $C5, $CB, $49, $8A, $B, $B1, $42
		dc.b	$80, $14, 5, 6, $69, $24, $29, $9A, $49, $EE, $92, $40, $2E
		dc.b	$C2, $EE, $50, $A1, $70, $33, $62, $D2, $C0, $E1, $BB, $A
		dc.b	$AE, $1C, $ED, $CC, $E9, $18, $5B, $68, $C3, $4C, $37, $5B
		dc.b	$C1, $74, 1, $25, $85, $D0, $B8, $2B, $25, $F0, $A7, $82
		dc.b	$E8, $7C, $21, $4D, $1E, $9E, $14, $F0, $C3, $C2, $DE, $16
		dc.b	5, $8A, $14, $19, $A9, $43, $49, $F5, $9D, $1B, $9D, $BA
		dc.b	$8D, $25, $B5, $A1, $74, $C3, $C2, $9E, $18, $69, $86, $69
		dc.b	$27, $BA, $1A, $14, $11, $D7, $35, $EA, $ED, $DD, $F, $82
		dc.b	$C2, $BE, $E8, $A7, $87, $7F, $86, $EF, $D, $3C, 0, $15, $FC
		dc.b	$B1, $FE, $34, $2E, $69, $9F, $E6, $FF, $93, $CF, $68, $E2
		dc.b	$7F, $65, $FB, $3C, $63, $94, $B5, $C2, $78, $B7, $29, $FF
		dc.b	$8B, $5C, $71, $38, $CB, $5D, $FF, $83, $1F, $C3, $38, $A4
		dc.b	$65, $E, $90, $C7, $19, $64, $71, $39, $1D, $6C, $98, $B7
		dc.b	$22, $DB, $47, $13, $FB, $2F, $D9, $E3, $1C, $A5, $AE, $13
		dc.b	$C5, $B6, $EC, $9F, $EA, $4F, $EE, $E7, $FB, $AE, $CE, $47
		dc.b	$5F, $64, $F1, $EC, $9E, $5C, $E1, $21, $34, $AF, $65, $D0
		dc.b	4, $FF, $B0, $CF, $A8, 0, 1, $FC, $FF, $94, $7E, $7C, $BE
		dc.b	$5D, $72, $76, $BB, $80, 6, $7E, $5F, $AD, $EB, $3D, $55
		dc.b	$EA, $AF, $50, $2F, $57, 0, $1F, $2F, $D6, $B2, $70, $C7
		dc.b	$29, $75, $E3, $95, $D8, 0, $2B, $C3, $F7, $AD, $B4, $FA
		dc.b	$AB, $D4, $5C, $BC, $DD, 5, $DD, $AF, $D5, $5E, $A7, $67
		dc.b	$97, 4, $62, $E5, $19, $F9, $33, $CF, $16, $79, $3E, $53
		dc.b	$76, $87, $93, $17, $15, $7A, $EE, $C5, $1B, $67, $9B, $96
		dc.b	$3B, $A1, $CB, $39, $79, $33, $C9, $C4, $3D, $50, $4D, $32
		dc.b	$47, $3B, $39, $CA, $4F, $37, $9B, $DD, $9E, $1C, $43, $14
		dc.b	$69, $E2, $3A, $FD, $3F, $98, $3A, $C7, $A7, $95, $58, $F0
		dc.b	$9B, $81, $74, $62, $91, $BB, $AF, $62, $FB, $3C, $D8, $66
		dc.b	$E0, 9, $A6, $25, $1F, $F3, $90, $E5, $8F, $5D, $DE, $3A
		dc.b	$C3, $3C, $9C, 8, $7C, $FF, $F8, $2B, $D5, $C2, $FD, $41
		dc.b	$EA, $E5, $84, $B8, $75, $39, $69, $70, $FC, $FF, $90, $E1
		dc.b	$BB, $F3, $97, $67, $3D, $72, $C8, $A, $B6, $7C, $3D, $3F
		dc.b	$38, 0, $9F, $57, $D, $D3, $EA, $76, $3D, $72, $71, $F, $34
		dc.b	$72, $CF, $D7, $BB, $84, $9E, $AE, $5E, $18, $B9, $48, $71
		dc.b	$D, $77, $2E
		dcb.b	3,0
		dc.b	$2A, $8D, $B6, $31, $8E, $58, $CD, $C5, $DD, $8B, $89, $A0
		dc.b	$7A, $FF, $F0, $7E, $BB, $75, $F2, $7E, $B9, $36, $31, $D6
		dc.b	$21, $EF, $D6, $3A, $D3, $18, $FD, $64, $3C, $7E, $70, $75
		dc.b	$86, $70, $2A, $E0, 1, $6A, $D9, $F0, $A1, $B5, $6C, $F8
		dc.b	$51, $C4, $9E, $5F, $A6, $A7, $E9, $A8, $D, $AB, $67, $C2
		dc.b	$82, $6F, $3A, $56, $86, $90, $D5, $63, $94, $A9, $C, $58
		dc.b	$4D, $32, $9A, $14, $C9, $2A, $85, $18, $E, $4D, $AD, $81
		dc.b	$4A, $A1, $46, $2D, $56, $2D, $56, $AB, $16, 7, $F4, $FF
		dc.b	$B6, $A1, $B5, $6C, $F8, $50, $DA, $B6, $7C, $28, $E2, $4F
		dc.b	$36, $AB, $16, $86, $8A, $26, $FC, $29, $85, $2C, $F8, $50
		dc.b	$4D, $E7, $4A, $D0, $D2, $1A, $AC, $5A, $18, $D2, $6C, $58
		dc.b	$FE, $D7, $F4, $D4
		dcb.b	2,0
		dc.b	$6D, $5B, $3E, $14, $36, $8B, $7E, $5A, $86, $C0, 1, $2B
		dc.b	$56, $CF, $85, $26, $E2, $56, $FC, $B5, $B, $C3, $C9, $CB
		dc.b	$B1, $7A, $B9, $76, 0, $5D, $E1, $CB, $B5, $9A, $D8, $39
		dc.b	$76, $A1, $A0, $AB, $1A, $4D, $8B, $43, $D5, $CB, $B1, $72
		dc.b	$D3, $72, $F2, $74, $7D, $A1, $E5, $B1
		dcb.b	2,$6D
		dc.b	$D, $7C, $63, $8F, $5E, $47, $AB, $AE, $1B, $AF, $A9, $A3
		dc.b	$29, $75, $16, $D8, $B4, $7A, $6D, $FB, $F8, $73, $C9, $E4
		dc.b	$D3, $D7, $7C, $BA, $8F, $8B, $4B, $F6, $69, $D4, $75, $F5
		dc.b	$3C, $34, $6E, $9F, 8, $6F, $20, $78, $1D, $D3, $DC, $77
		dc.b	$47, $D, $DC, $24, $DB, $A4, $C5, $8B, $16, $8D, $D2, $DC
		dc.b	$77, $70, $63, $C2, $7B, $B8, $47, 3, $C2, $FB, $9A, $18
		dc.b	$F0, $96, $E8, $DC, $77, $49, $A3, $73, $1E, $11, $C1, $A1
		dc.b	$8B, $5F, $84, $70, $3C, $1A, $5C, $F, $4E, $FF, $DB, $78
		dc.b	$B1, $C8, $B, $B0, 2, $79, $4F, $2F, $E8, $81, $56, $4C, $DA
		dc.b	$AE, $E, $5B, $62, $C0, $F8, $FE, $CF, $C4, $F, $1C, $DC
		dc.b	$65, $B6, $4E, $C3, $28, $C9, $DA, $F8, $83, $8D, $71, $87
		dc.b	$12, $DF, $6A, $2D, $96, $D7, $68, $D6, $75, $9E, $37, $C3
		dc.b	$66, $71, $B4, $6D, $92, $F4, $38, $74, $59, $6A, $A5, $BF
		dc.b	$2D, $4B, $D, $60, $EB, $3C, $4E, $36, $53, $B5, $B1, $8B
		dc.b	$4B, $A4, $B1, $BB, $EA, $3F, $B3, $3A, $EF, $AC, 0, 5, $F5
		dc.b	$D7, $1F, $D9, $80, 0, $19, $6D, $C4
		dcb.b	2,0
		dc.b	$13, $67, $86, $1C, $61, $CB, $CF, $12, $E0, $1D, $62, $74
		dc.b	$B2, $D9, $7B, $8B, $1C, $A4, $DA, $DB, $5C, $FF, $66, $79
		dc.b	$6A, $8F, $DB, $C6, $A0, $2D, $DB, $69, $31, $FE, $8E, $5C
		dc.b	$AF, $DD, $35, $9B, $22, $D5, $AA, $E0, $EC, $DB, $14, $73
		dc.b	$88, $11, $88, 5, $CF, $11, $2C, $BC, $51, $83, $17, 0, 9
		dc.b	$62, $B, $1D, $6C, $93, $D6
		dcb.b	2,0
		dc.b	$1C, $B1, $DB, $10, $27, $96, $20, 0, $79, $46, $20, $33
		dc.b	$80, 5, $76, $FC, $B5, $3B, $1A, $7B, $AB, $B8, $EE, $E0
		dc.b	$82, $6D, $27, $86, $E0, $DB, $84, $F8, $43, $57, $80, $AE
		dc.b	$EA, $EE, $8E, $17, $6D, $D7, $62, $C3, $75, $F8, $4D, $79
		dc.b	$F0, $3C, $19, $79, $9E, 7, $74, $F7, $1D, $C7, $77, $D, $C2
		dc.b	$37, $16, $97, 6, $2D, $C1, $B7, $30, $DC, $5B, $84, $34
		dc.b	$79, $1D, $DF, $AE, $3B, $A7, $BA, $5B, $8B, $6E, $6D, $C5
		dc.b	$8E, $E1, $1C, $B, $70, $63, $C1, $8B, $5F, $84, $70, $86
		dc.b	$8D, $D1, $4F, $CD, $D2, $DD, $9E, $14, 0, $4D, $C0, $12
		dc.b	$4C, $8F, $1C, $F6, $CD, $C3, $E5, $27, 0, $16, $BE, $49
		dc.b	$C6, $6F, $C7, $C4, 0, 6, $F, $BD, $79, $9E, $72, $DD, $3D
		dc.b	$C7, $71, $DD, $C0, $5D, $A5, $C1, $8B, $70, $6D, $C0, $EE
		dc.b	$8E, $10, $D1, $C2, $5C, $21, $84, $B7, $4F, $71, $DD, $1C
		dc.b	$F, 9, $36, $E9, $31, $62, $C3, $71, $DD, $C2, $38, $5F, $9F
		dc.b	3, $C1, $95, $81, $E0, $77, $4F, $A8, $EE, $8E, $1B, $B8
		dc.b	$49, $37, $75, $4B, $A9, $A4, $DD, $50, $E5, $B, $CB, $62
		dc.b	$90, $9D, $4D, $BB, $A8, $F5, $24, $F7, $34, $31, $E1, $2D
		dc.b	$D1, $D4, $77, $49, $A3, $73, $1E, 5, $F8, $43, $A1, $DB
		dc.b	$A8, $A4, $75, $14, $9A, $42, $78, $7E, $A7, $C3, $F3, $5E
		dc.b	1, $C0, 0, $67, $96, $D9, 1, $5C, $B1, 0, $78, $73, $5E, $74
		dc.b	$EC, $E6, $BC, $F4, $C3, $B2, $9F, $9B, $A5, $76, $CD, $C3
		dc.b	$E5, $27, 0
		dcb.b	2,$E1
		dc.b	$4E, $7E, $14, $F0, $C2, $9E, $14, $E7, $E1, $4E, $CA, $27
		dc.b	$19, $BF, $1F, $10, 6, $1D, $94, $F0, $EC, $5D, $17, $73
		dc.b	$96, $EA, $E0, $C7, $4E, $C5, $E6, $BF, $9A, $50, 0, $B, $F9
		dc.b	$A5, $E6, $BD, $9A, $16, $E1, $D4, $C5, $F7, $1D, $F, $56
		dc.b	$EE, $1C, $F8, 9, $6E, $9F, $51, $DD, $1C, $F, 9, $26, $EE
		dc.b	$A9, $B4, $FA, $8F, $63, $94, $3D, $92, $D8, $A4, $7A, $79
		dc.b	$6E, $EB, $E1, $B8, $BC, $B6, $2D, $AD, $A1, $AF, $8C, $71
		dc.b	$EB, $C8, $F5, $75, $C3, $75, $D1, $A3, $29, $60, $5B, $F2
		dc.b	$C5, $A3, $84, $B8, 9, $F0, $AF, $54, $F8, $5F, $B3, $77
		dc.b	$54, $BA, $AF, $D9, $1D, $85, $F, $E6, $E3, $62, $87, $B3
		dc.b	$A6, $FB, $77, $14, $68, $4F, $CB, $33, $B2, $2E, $11, $C4
		dc.b	$E1, $D2, $19, $FF, $2D, $36, $7C, $2D, $18, $14, $64, $F1
		dc.b	$29, $1C, $9D, $2A, $98, $6D, $57, $C1, $76, $2C, $6C, $6D
		dc.b	$F9, $6C, $A2, $C7, $A3, $AF, $43, $8A, $3D, $A1, $F2, $4E
		dc.b	$98, $9D, $BF, $4F, $CB, $25, $C8, $4F, $29, $6A, $6C, $61
		dc.b	$7A, $39, $46, $2A, $5D, $1C, $B1, $46, $75, $B3, $21, $46
		dc.b	$8B, $32, $31, $C9, $5A, $18, $55, $8E, $51, $FB, $39, $E5
		dc.b	$89, $69, $B9, $B7, $19, $21, $B3, $16, $96, $AE, $27, $22
		dc.b	$B6, $56, $92, $DA, $4C, $5A, $CF, $6C, $1C, $B9, $4C, $4B
		dc.b	$21, $C9, $F2, $7D, $9D, $E, $25, $A4, $97, $49, $B2, $5D
		dc.b	$1B, $94, $91, $8E, $32, $E3, $89, $D8, $B1, $47, $4C, $64
		dc.b	$D6, $73, $D0, $F4, $8B, $45, $A4, $DF, $E4, $6C, $D8, $A3
		dc.b	$94, $63, $FC, $37, $2F, $62, $98, $96, $43, $FA, $7C, $2C
		dc.b	$D3, $B4, $5A, $76, $8B, $1E, $93, $E8, $22, $D1, $D2, $7D
		dc.b	$F, $49, $F4, $36, $95, $A5, $6A, $D8, $BC, $74, $C2, $30
		dc.b	$FD, $BE, $1D, $2F, $6C, $25, $63, $D3, $B, $45, $8F, $43
		dc.b	$D0, $DA, $5D, $D, $A2, $D5, $B0, $2F, $C, $FC, $53, $27
		dc.b	$2E, $CE, $58, $A3, $21, $D9, $E1, $21, $D9, $24, $8E, $CF
		dc.b	$26, $47, $49, $B1, $62, $D2, $72, $C8, $D0, $C9, $93, $80
		dc.b	5, $5E, $32, $2C, $50, $B6, $2B, $6E, $36, $FC, $B7, $4C
		dc.b	$4D, $2C, $6C, $70, $42, $96, $3D, $22, $D2, $FD, $3C, $74
		dc.b	$36, $3F, $A7, $8B, $4A, $C6, $D3, $B4, $DE, $4E, $71, $36
		dc.b	$87, $B7, $E9, $8F, $F1, $CF, $F1, $E2, $CF, $E, $5C, $E3
		dc.b	$E, $5C, $BD, $71, $2E, $5C, $B9, $F1, $93, $39, $6D, $99
		dc.b	$1F, $60, $33, $C6, $6E, $8E, $D0, $E8, $CE, $5C, $BB, $63
		dc.b	$91, $64, $78, $63, $FF, $31, $36, $AB, $66, $ED, $26, $DA
		dc.b	$EE, $71, $BB, $E5, $37, $B7, $EC, $CB, $1B, $6B, $39, $62
		dc.b	$5D, $B, $A6, $B2, $CF, $F, $27, $39, $17, $2D, $E2, $5C
		dc.b	$BE, $51, $C5, $E6, $83, $60, $93, $42, $97, $67, $64, $9B
		dc.b	$96, $BE, $40, 0, $C7, $29, $71, $86, $93, $46, $CE, $C8
		dc.b	$F1, $CB, $8E, $DA, $CA, $62, $C9, $94, $DF, $27, $8C, $A1
		dc.b	$DB, $6C, $66, $85, $8E, $29, 8, $78, $A1, $D9, $E4, $9E
		dc.b	$27, $89, $CB, $14, $C9, $2E, $CE, $52, $69, $E, $DB, $16
		dc.b	$9E, $2C, $52, $58, $C3, $A6, $31, $8A, $14, $3F, $C3, $48
		dc.b	$DB, $14, $84, $CA, $69, $95, $D3, $1C, $92, $48, $CE, $C7
		dc.b	$18, $76, $74, $C6, $58, $CF, $12, $F2, $72
		dcb.b	2,$E5
		dc.b	$8A, $32, $3C, $D3, $8A, $5D, $F2, $7B, $EB, 0, $C, $9D, $3F
		dc.b	$67, $B3, $B6, $B3, $89, $7F, $D9, $CF, $58, 0, $16, $46
		dc.b	$2D, $77, $46, $2D, $F, $B4, $93, $29, $B2
		dcb.b	2,0
		dc.b	$86, $D4, $D1, $A8, $F4, $2C, $9F, $96, $69, $39, $D8, $B6
		dc.b	$25, $27, $C8, 2, $D1, $97, $26, $9A, $3C, $F2, $2C, $EC
		dc.b	$97, $C9, 0, $15, $C9, $19, $32, $4F, $13, $8B, $16, $7F
		dc.b	$D9, $C3, $62, $99, $1D, $99, $D9, $1A, $7E, $37, $C4, $B8
		dc.b	$4F, $F9, $BF, $29, $6D, $89, $DB, $22, $E7, $5A, $14, $69
		dc.b	$EC, $51, $E7, $91, $79, $E3, $54, $CB, $1D, $9B, $13, $B4
		dc.b	$21, $43, $AD, $9C, $B3, $ED, $89, $D9, $A1, $23, $5C, $9E
		dc.b	$7A, $CB, $C3, $97, $3A, $D3, $A5, $D, $9C, $B7, $46, $38
		dc.b	$5D, $64, $D2, $62, $D8, $31, $C1, $A1, $B0, $8C, $1A, $ED
		dc.b	$26, $C2, $1A, $4D, $81, $53, $D0, $AB, $16, $8B, $15, $6E
		dc.b	$86, $D3, $B5, $DB, 8, $69, $36, $10, $D2, $CA, $56, $63
		dc.b	$C6, $2C, $D2, $68, $B2, $D6, $CA, $5A, $59, $43, $15, $E3
		dc.b	$35, $69, $E5, $1A, $2D, $8E, $51, $A2, $DA, $56, $93, $4A
		dc.b	$D2, $69, $31, $C8, $B4, $31, $C8, $B1, $B2, $C5, $96, $3A
		dc.b	$45, $96, $4D, $3C, $A3, 6, $8C, $A3, 6, $3A, $2D, $A4, $C7
		dc.b	$45, $B4, $98, $49, $74, $36, $69, $2E, $86, $CD, $9B, $59
		dc.b	$AE, $D6, $69, $31, $6B, $29, $62, $C5, $AC, $A5, $8B, $1C
		dc.b	$8E, $10, $C7, $23, $85, $F0, $6A, $E0, $C0, $B4, $59, $A4
		dc.b	$D1, $66, $2D, $A2, $C9, $8B, $68, $B2, $61, $C, $B6, $38
		dc.b	$34, $32, $D8, $E0, $D3, $6B, $1D, $15, $A1, $AC, $74, $56
		dc.b	$96, $92, $B2, $E8, $74, $95, $97, $42, $C5, $B4, $2D, $C
		dc.b	$5B, $42, $C2, $59, $58, $AC, $B2, $B1, $56, $85, $69, $34
		dc.b	$2B, $16, $5B, $43, $2E, $8C, $B6, $86, $5D, 4, $68, $AC
		dc.b	$74, $65, $6D, $15, $8E, $8D, $B9, $58
		dcb.b	2,$B4
		dc.b	$B3, $16, $A, $5A, $CD, $25, $2D, $6C, $AC, $B7, $6B, $2D
		dc.b	$B4, $AD, $B4, $17, $65, $2D, $66, $C0, $B2, $96, $B3, $60
		dc.b	$26, $A5, $AD, $94, $29, $6B, $64, $1B, 6, $B3, $15, $2D
		dc.b	$83, $59, $8A, $89, $D8, $E8, $D3, $B1, $D1, $8D, $8A, $DE
		dc.b	$C5, $42, $96, $B3, $49, $4B, $59, $81, $B1, $D3, $8E, $85
		dc.b	$7B, $F2, $5D, $B, $69, $2B, $1D, $27, $A1, $5D, $27, $A1
		dc.b	$D4, $D6, $D2, $6A, $D6, $D2, $76, $5D, $25, $A2, $D9, $74
		dc.b	$96, $8B, $1A, $2B, $5B, $49, $68, $AD, $6D, $D, $AA, $CA
		dc.b	$DA, $4F, $8E, $83, $45, $6B, $68, $D6, $EF, $56, $B6, $8D
		dc.b	$6D, 5, $D4, $DB, $2C, $1A, $CA, $6D, $97, $53, $2D, $F4
		dc.b	$2D, $84, $5A, $78, $45, $A4, $B3, $52, $D6, $36, $85, $39
		dc.b	$1B, 5, $2D, $66, $C3, $2B, $15, $CB, $E, $26, $CA, $33, $6E
		dc.b	$99, $68, $72, $E9, $96, $85, $84, $9B, $A5, $7A, $5D, $B4
		dc.b	$CB, $49, $E8, $D6, $D1, $AE, $A5, $82, $D5, $95, $AE, $C7
		dc.b	$22, $B7, $62, $BA, $16, $5B, $4B, $42, $CB, $62, $DD, $2E
		dc.b	$DD, $26, $D6, $6C, $18, $DA, $2C, $D8, $31, $B1, $60, $2A
		dc.b	$B2, $52, $DD, $24, $A5, $AC, $C5, $73, $5A, $D8, $E9, $C4
		dc.b	$F4, $3A, $65, $CC, $BD, $F4, $38, $16, $B3, $60, $DD, $30
		dc.b	$6B, $36, $D, $D3, 9, $F1, $2A, $5A, $C6, $9C, $CA, $96, $B3
		dc.b	$61, $A0, $6D, $D, $A6, $DA, $1B, $4E, $C5, $4E, 5, $4D, $8A
		dc.b	$97, $3B, $96, $76, $3A, $28, $9E, $85, $6D, $3D, $A, $D8
		dc.b	$29, $B2, $61, $62, $AC, $6C, $98, $58, $AB, $94, $2A, $6C
		dc.b	$70, $28, $54, $D8, $A9, $E8, $57, $65, $2D, $4D, $16, $92
		dc.b	$54, $D0, $D9, 0, $96, $85, $52, $7A, $15, $40, $3A, $1D
		dc.b	$10, $A6, $1C, $2C, $74, $42, $98, $68, $23, $42, $A9, $24
		dc.b	$DC, $77, $24, $91, $4E, $82, $7A, $21, $54, $3F, $A9, $A1
		dc.b	$54, $3D, $E6, $D2, $5C, $D4, $A2, $9D, $26, $8A, $74, 2
		dc.b	$FB, $1D, $47, $56, 9, $A6, $A3, $DA, $74, $3A, $15, $BE
		dc.b	$85, $6C, $74, $4D, $D, $8D, $8E, $89, $A1, $B1, $D0, $AE
		dc.b	$86, $C8, $BA, $15, $D0, $D9, $14, 4, $84, $53, $A1, $48
		dc.b	$45, $3A, 9, $D8, $E9, $B4, $AC, $74, $D8, $1B, $67, $6A
		dc.b	$D9, $30, $B1, $58, $B7, $66, $C, $8A, $50, $E8, $55, $21
		dc.b	$E, $86, $D7, $D0, $DA, $6A, $6C, $70, $54, $2A, $6C, $70
		dc.b	$DC, $8B, $7D, $A, $CD, $4D, $91, $4E, $85, $4D, $91, $4E
		dc.b	$97, $53, $D1, $A, $E9, $82, $35, $BB, $2C, $DA, $6C, $A7
		dc.b	$4E, $99, $E9, $9E, $92, $B1, $D1, $34, $95, $8E, $94, $EF
		dc.b	$BD, $8E, $96, $42, $9A, $29, $56, $4D, $13, $45, $3A, $8E
		dc.b	$97, $54, $84, $53, $A2, $A4, $22, $9D, $2D, $9D, $10, $E8
		dc.b	$6D, $1B, $1D, $D, $80, $84, $B1, $52, $B0, $94, $D5, $86
		dc.b	$E4, $52, $8A, $70, $D1, $17, $B, $15, $9E, $16
		dcb.b	2,$2B
		dc.b	$1B, $15, $28, $5C, $D8, $A9, $43, $80, $1B, $31, $53, $A1
		dc.b	$D9, $8A, $9D, 4, $29, $C0, $A9, $B2, $EE, $2E, $54, $D9
		dc.b	$3A, $B0, $EB, $FC, $DF, $E6, $25, $FA, $91, $F9, $AF, $CB
		dc.b	$30, $AD, 1, $FD, $3C, $50, $7F, $F, $55, $2A, $A0, $E0, $D2
		dc.b	$51, $2A, $42, $EF, $12, $C1, $E9, $1F, $B5, $FD, $BC, $E8
		dc.b	5, $33, $DD, $F9, $8F, $CE, $57, $1F, $D7, $5F, $94, $BF
		dc.b	$31, $DF, $D7, $FA, $D9, $50, $57, $C3, $D2, $FA, $E7, $49
		dc.b	$7E, $B7, $4D, $D2, $D6, $3A, $B8, $7E, $7F, $F7, $72, $51
		dc.b	$5E, $1F, $9A, $BE, $B9, $AC, $BF, $55, $D5, $CE, $5A, $C7
		dc.b	$67, $3F, $CD
		dcb.b	2,$FE
		dc.b	$6A, 2, $E7, $CF, $CB, $F3, $75, $C7, $F5, $37, $E5, $2D
		dc.b	$3B, $3F, $31, $CF, $F5, $25, $21, $2B, $B4, $92, $36, $3C
		dc.b	$8E, 9, $1B, $46, 9, $74, $92, $3C, $24, $91, $CA, $4F, 8
		dc.b	$42, $91, $81, $48, $49, $A5, $DD, $21, $24, $E9, 9, $2D
		dc.b	$A4, $E8, $79, $43, $A4, $93, $4D, $DC, $FA, $F9, $EE, $D3
		dc.b	$AA, $10, $A0, $2E, $92, $62, $F9, $B0, $C4, $17, $AE, $25
		dc.b	$B, $62, $E, $25, $C4, $38, $86, $76, $93, $B4, $98, $3F
		dc.b	$14, $64, $2C, $92, $41, $27, $87, $2F, $36, $92, 2, $D2
		dc.b	$7A, $B1, $62, $C5, $A1, $8A, $43, $4D, 1, $42, $93, $61
		dc.b	$26, $2D, $54, $9E, $95, $7E, $65, $8B, $16, $78, $42, $80
		dc.b	$E3, $27, 5, $E4, $E5, $A1, $C0, $6C, $65, $8A, 8, $72, $F5
		dc.b	$42, $E5, $C1, $76, $2D, $27, $13, $67, $2C, $50, $A7, $11
		dc.b	$76, $93, $39, $70, $82, $49, $74, $86, $2C, $58, $B3, $97
		dc.b	$28, $5F, $29, $21, $60, $52, $6C, $12, $18, $B0, $96, $90
		dc.b	$D3, $E6, $78, $64, $ED, $7D, $D5, $68, $E0, $78, $5D, $61
		dc.b	$C4, $98, $5D, $16, $1C, $BF, 3, $CD, $94, $A9, $E0, $78
		dc.b	$4D, $C0, $2F, $76, $59, $B5, $DA, $ED, $35, $65, $45, $2A
		dc.b	$C0, $42, $CD, $8B, $52, $10, $5D, $E9, $25, $BD, $25, $46
		dc.b	$72, $F7, $59, $52, $A8, $A, $14, $86, $CD, $25, $43, $41
		dc.b	$2E, $A3, $8F, $59, $EA, $BE, $E7, $1C, $1F, $85, $D4, $55
		dc.b	$8B, $17, $2C, $16, $6F, $C0, $F3
		dcb.b	2,$45
		dc.b	$3C, $F, 9, $B9, $42, $E5, $C4, $9E, $AA, $26, $C5, $8B, $96
		dc.b	$85, $65, $45, $2A, $21, $8A, $14, $9A, $E7, $49, $A0, $29
		dc.b	$14, $92, $DE, $90, $94, $2E, $8E, $93, $58, $4A, $43, $DD
		dc.b	$24, $81, $B3, $49, $51, $A8, $24, $85, $19, $F, $21, $54
		dc.b	$93, $17, $CD, $A6, $93, $70, $5E, $A8, $FB, $16, $2E, $B
		dc.b	$89, $A3, $89, $3D, $DA, $4D, $54, $86
		dcb.b	2,$46
		dc.b	$43, $B4, $B6, $10, $E0, $B4, $90, $23, $49, $C4, $D0, $A3
		dc.b	$14, $CD, 1, $43, $B0, 1, $26, $95, $74, $28, $50, $A3, $A0
		dc.b	$AB, $C9, $C1, $79, $3A, $30, $12, $64, $74, $87, $28, 4
		dc.b	$90, $BA, $38, $2E, 4, $23, $42, $14, $28, $C8, $D3, $40
		dc.b	$D2, $61, $24
		dcb.b	2,9
		dc.b	$74, 8, $E8, $E5, $B, $96, $92, $16, 7, $61, $34, 1, $21
		dc.b	$A6, $85, $19, $1D, 4, $D8, $42, $43, $89, $30, $BE, $D0
		dc.b	$E5, $E1, $19, $A, 7, 0, $BD, $D9, $26, $D7, $6B, $B4, $D1
		dc.b	$B9, $14, $60, $21, $26, $C5, $A4, $82, $EF, $34, $10, $C8
		dc.b	$52, $E8, $21, 1, $42, $82, $10, 2, $85, $1D, $A, $55, $C1
		dc.b	$7A, $A0, $AB, $16, $2E, $58, $24, $DE, $3F, $84, $1C, $A1
		dc.b	$72, $E2, $4F, $54, $13, $62, $C5, $CB, $42, $37, $22, $82
		dc.b	$18, $A1, $49, $A0, $9A, 2, $95, $40, $91, $FB, $29, $A4
		dc.b	$24, $9E, $E9, $24, 1, $26, $C2, $78, $75, $61, $D4, $BB
		dc.b	$B0, $DC, $52, $12, $BB, $49, $3B, $E, $C7, $6D, $1F, $9E
		dc.b	$87, $B3, $69, $F6, $3F, $3D, $1C, $49, $E5, $E1, $F9, $AD
		dc.b	$39, $F5, $F3, $D1, $A, $46, 5, $F, $62, $4D, $3B, $1F, $9E
		dc.b	$85, $D2, $AE, $85, $E7, $A2, $5F, $43, $D8, $85, $AE, $9C
		dc.b	$FB, $39, $E9, $D9, $DF, $1A, $42, $4B, $B1, $F9, $E8, $9D
		dc.b	$95, $D1, $F9, $E8, $E2, $4F, $36, $AB, $16, $86, $8E, $C4
		dc.b	$EF, $E7, $D5, $CF, $BD, $F9, $E8, $70, $29, $9A, $3C, $F4
		dc.b	$4B, $E8, $7B, $21, $AA, $C5, $A1, $8E, $93, $62, $C7, $4E
		dc.b	$CE, $FF, $F, $CD, $68, $52, $12, $BB, $49, $23, $63, $C8
		dc.b	$E0, $91, $B4, $60, $97, $EC, $92, $39, $EC, $7E, $7A, $1D
		dc.b	$1C, $E9, $F9, $AD, $E, $E8, $42, $91, $81, $48, $49, $A5
		dc.b	$DD, $21, $24, $E9, $1A, $4B, $63, $D8, $FC, $F4, $3C, $9E
		dc.b	$A9, $D9, $CF, $C3, $48, $72, $E5, $1E, $1C, $BA, $17, $2E
		dc.b	$71, $67, $2E, $75, $C3, $9C, $9D, $A1, $18, $E4, $79, $B3
		dc.b	$C3, $3E, $8F, $E1, $D8, $74, $2F, $D9, $CF, $B3, $44, $EC
		dc.b	$64, $28, $C5, $CB, $C2, $36, $B3, $FF, $16, $8C, $4E, $39
		dc.b	$73, $3C, $51, $B4, $7F
		dcb.b	2,$CD
		dc.b	$E6, $F1, $FA, $DE, $E, $71, $92, $95, $DF, $35, $7D, $F0
		dc.b	$A5, $77, $DA, $F4, $76, $2B, $16, $72, $F3, $48, $45, $95
		dc.b	$B, $9A, $2D, $E8, 2, $3D, $16, $68, $F4, $50, $28, $D6, $28
		dc.b	$F4, $5A, $5B, $6B, $42, $95, $A2, $1D, $8A, $CF, $79, $C5
		dc.b	$2F, $D2, $99, $EF, $3B, $CF, $4D, $8E, $C7, $C4, $E2, $7F
		dc.b	$68, $75, $6F, $5A, $24, $B7, $97, $C2, $3B, $9B, $F2, $C2
		dc.b	$35, $B7, $E5, $96, $8F, $97, $E9, $82, $EF, $E9, $C8, $AD
		dc.b	$2D, $D7, $F9, $FE, $BC, $DA, $6C, $31, $F, $37, $29, $77
		dc.b	$84, $56, $B5, $1C, $23, $15, $6B, $52, $4C, $26, $85, $EE
		dc.b	$90, $F3, $42, $95, $62, $80, $AD, $2D, $D7, $D5, $D7, $A6
		dc.b	$6F, $FA, $FF, $DF, $73, $C8, $E2, $5C, $FE, $6F, $F5, $1A
		dc.b	$78, $75, $FF, $88, $FF, $86, $9F, $E4, $6A, $55, $5F, $3F
		dc.b	$F, $E6, $7E, $7F, $91, $43, $97, $5F, $7F, $66, $9F, $AB
		dc.b	$3F, $E2, $A7, $F8, $5B, $FC, $98, $51, $64, $B4, $14, $12
		dc.b	$5A, $3E, $D2, $5A, $3A, $17, $5B, $BA, $D5, $64, $B4, $74
		dc.b	$3B, $CA, $EF, $B1, $D8, $FE, $D0, $EF, $3E, $33, $FD, $B8
		dc.b	$3B, $CF, $ED, $CE, $C7, $C4, $E2, $7F, $68, $75, $5F, $FE
		dc.b	$9F, $F1, $FF, $B8, $FF, $BF, $FC, $7F, $E8, 0, $12, 0, $1A
		dc.b	0, $20, 0, $3A, 0, $54, 0, $6E, 0, $7A, 0, $B4, 0, $EE
		dcb.b	2,1
		dc.b	0, 2, 0, 3, 0, $FF, 5, 4, 5, 6, 7, $FF, 0
		dcb.b	2,4
		dc.b	0
		dcb.b	2,4
		dc.b	0
		dcb.b	2,5
		dc.b	0
		dcb.b	2,5
		dc.b	0
		dcb.b	2,6
		dc.b	0
		dcb.b	2,6
		dc.b	0
		dcb.b	2,7
		dc.b	0
		dcb.b	2,7
		dc.b	0, $FF, 0
		dcb.b	2,4
		dc.b	0, 4
		dcb.b	2,0
		dcb.b	2,5
		dc.b	0, 5
		dcb.b	2,0
		dcb.b	2,6
		dc.b	0, 6
		dcb.b	2,0
		dcb.b	2,7
		dc.b	0, 7
		dcb.b	2,0
		dc.b	$FF, 0, 4
		dcb.b	2,0
		dc.b	4
		dcb.b	2,0
		dc.b	5
		dcb.b	2,0
		dc.b	5
		dcb.b	2,0
		dc.b	6
		dcb.b	2,0
		dc.b	6
		dcb.b	2,0
		dc.b	7
		dcb.b	2,0
		dc.b	7
		dcb.b	2,0
		dc.b	$FF, 0, 8, 9, $A, $B, $C, $B, $A, 9, 8, 0, $FF, 0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$C
		dc.b	0
		dcb.b	2,$C
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$B
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,$A
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,9
		dc.b	0
		dcb.b	2,8
		dc.b	0
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$FF
		dcb.b	2,0
		dcb.b	2,8
		dc.b	0, 8
		dcb.b	2,0
		dcb.b	2,9
		dc.b	0, 9
		dcb.b	2,0
		dcb.b	2,$A
		dc.b	0, $A
		dcb.b	2,0
		dcb.b	2,$B
		dc.b	0, $B
		dcb.b	2,0
		dcb.b	2,$C
		dc.b	0, $C
		dcb.b	2,0
		dcb.b	2,$B
		dc.b	0, $B
		dcb.b	2,0
		dcb.b	2,$A
		dc.b	0, $A
		dcb.b	2,0
		dcb.b	2,9
		dc.b	0, 9
		dcb.b	2,0
		dcb.b	2,8
		dc.b	0, 8
		dcb.b	3,0
		dc.b	$FF
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$C
		dcb.b	2,0
		dc.b	$C
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$B
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	$A
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	9
		dcb.b	2,0
		dc.b	8
		dcb.b	2,0
		dc.b	8
		dcb.b	3,0
		dc.b	$FF
		dcb.b	2,0
		dc.b	$25, 0, $1A, 0, $2F, 0, $44, 0, $59, 0, $6E, 0, $83, 0, $98
		dc.b	0, $AE, 0, $C4, 0, $DA, 0, $F0, 1, 6, 4, $E8, $A
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$A, 0, 9
		dcb.b	2,0
		dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
		dcb.b	2,$E8
		dc.b	$A, 0, $1B
		dcb.b	2,0
		dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B, 0, 4, $E8, $A, 8, 9
		dcb.b	2,$E8
		dc.b	$A, 8
		dcb.b	3,0
		dc.b	$A, $18, 9, $E8, 0, $A, $18
		dcb.b	2,0
		dc.b	4, $E8, $A
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$A, 0, 9
		dcb.b	2,0
		dc.b	$A, $18, 9, $E8, 0, $A, $18
		dcb.b	2,0
		dc.b	4, $E8, $A, 8, 9
		dcb.b	2,$E8
		dc.b	$A, 8
		dcb.b	3,0
		dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
		dcb.b	2,$E8
		dc.b	$A, 0, $1B
		dcb.b	2,0
		dc.b	$A, $18, $1B, $E8, 0, $A, $18, $12, 0, 4, $E8, $A, 8, $1B
		dcb.b	2,$E8
		dc.b	$A, 8, $12
		dcb.b	2,0
		dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B
		dcb.b	2,0
		dc.b	4, $F0, 5
		dcb.b	2,0
		dcb.b	2,$F0
		dc.b	5, 8
		dcb.b	3,0
		dc.b	5, $10, 0, $F0, 0, 5, $18
		dcb.b	3,0
		dc.b	4, $F0, 5, 0, 4
		dcb.b	2,$F0
		dc.b	5, 8, 4
		dcb.b	2,0
		dc.b	5, $10, 4, $F0, 0, 5, $18, 4
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, 8
		dcb.b	2,$E8
		dc.b	$A
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$A, $10, 8, $E8, 0, $A, $18, 8
		dcb.b	2,0
		dc.b	4, $F0, 5, 0, $11
		dcb.b	2,$F0
		dc.b	5, 0, $15
		dcb.b	2,0
		dc.b	5, $18, $15, $F0, 0, 5, $18, $11
		dcb.b	2,0
		dc.b	2, $F4, 6, 0, $19, $F0, $F4, 6, 8, $19
		dcb.b	3,0
		dc.b	6, 0, $E, 0, $14, 3, 0, 4, 3, 1, 2, $FC, 0, 3, 0, 1, 2, $FC
		dc.b	0, 3, 6, 5, $FC, 0, $E, 0, $1A, 0, $26, 0, $2C, 0, $42, 0
		dc.b	$58, 0, $5E, 2, $F0, 5
		dcb.b	2,0
		dc.b	$FC, $F8
		dcb.b	2,0
		dc.b	4, $F4, 0, 2, $E0
		dcb.b	2,0
		dc.b	5, $F8, $E8, $E, 0, 6, $F0, 0, 1, $E0, $F, 0, $12, $F0, 4
		dc.b	$D0, 6, 0, $22, $F8, $D8
		dcb.b	2,0
		dc.b	$28, $F0, $E0
		dcb.b	2,0
		dc.b	$29, 8, $E8, $E, 0, $2A, $F0, 0, 4, $C0
		dcb.b	2,0
		dc.b	$36, $F8, $C8, 6, 0, $37, $F8, $D8
		dcb.b	2,0
		dc.b	$3D, $F0, $E0, $F, 0, $3E, $F0, 0, 1, $F0, 9, 0, $4E, $F4
		dc.b	1, $F8, 4, 0, $54, $F8, 0, 2
		dcb.b	3,0
		dcb.b	8,1
		dc.b	$FC, 0, $10, 0, 4, 2, $D0, 3
		dcb.b	2,0
		dc.b	$E4, $F0, 1, 0, 4, $E4, 0, 2, $F8, $C, 0, 6, $E8, $F8, 4
		dc.b	0, $A, 8
		dcb.b	2,0
		dc.b	2, 3, 0, 1, 2, $FC
		dcb.b	2,0
		dc.b	6, 0, $C, 0, $12, 1, $F0, $F
		dcb.b	2,0
		dc.b	$F0, 1, $F4, $A, 0, $10, $F4, 1, $F8, 5, 0, $19, $F8, 0, 4
		dc.b	0, $C, 3, 0, 5, 6, 3, 4, $FC, 0, 3, 0, 1, 2, 3, 4, $FC
		dcb.b	2,0
		dc.b	$E, 0, $1A, 0, $2A, 0, $40, 0, $56, 0, $6C, 0, $7C, 2, $F8
		dc.b	5
		dcb.b	2,0
		dc.b	$F0, $F8, 5, 8
		dcb.b	3,0
		dc.b	3, $F0, $D, 0, 4, $F0, 0, 5, 0, $C, $F0, 0, 5, 8, $C, 0, 4
		dc.b	$F0, 5, 0, $10
		dcb.b	2,$F0
		dc.b	5, 0, $14
		dcb.b	2,0
		dc.b	5, 0, $18, $F0, 0, 5, $18, $10
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, $1C
		dcb.b	2,$E8
		dc.b	$A, 8, $1C
		dcb.b	2,0
		dc.b	$A, $10, $1C, $E8, 0, $A, $18, $1C
		dcb.b	2,0
		dc.b	4, $E8, $A, 0, $25
		dcb.b	2,$E8
		dc.b	$A, 8, $25
		dcb.b	2,0
		dc.b	$A, $10, $25, $E8, 0, $A, $18, $25
		dcb.b	2,0
		dc.b	3, $F0, $D, 0, $2E, $F0, 0, 5, 0, $36, $F0, 0, 5, 8, $36
		dc.b	0, 4, $F0, 5, 0, $3A
		dcb.b	2,$F0
		dc.b	5, 0, $3E
		dcb.b	2,0
		dc.b	5, 0, $42, $F0, 0, 5, $18, $3A
		dcb.b	8,0
		dcb.b	5,1
		dcb.b	7,2
		dcb.b	$1D,3
		dcb.b	7,2
		dcb.b	5,1
		dcb.b	6,0
		dcb.b	5,$FF
		dcb.b	5,$FE
		dcb.b	7,$FD
		dcb.b	$1D,$FC
		dcb.b	7,$FD
		dcb.b	5,$FE
		dcb.b	5,$FF
		dcb.b	6,0
		dcb.b	5,1
		dcb.b	7,2
		dcb.b	$1D,3
		dcb.b	7,2
		dcb.b	5,1
		dcb.b	6,0
		dcb.b	5,$FF
		dcb.b	5,$FE
		dcb.b	7,$FD
		dcb.b	$1D,$FC
		dcb.b	7,$FD
		dcb.b	5,$FE
		dcb.b	5,$FF
		dc.b	0, 2, 3, 2, 3, $FF, 0, 8, 0, $1E, 0, $2A, 0, $36, 4, $E8
		dc.b	3
		dcb.b	2,0
		dc.b	$F8, $E8, 3, 8
		dcb.b	2,0
		dc.b	8, 1, 0, 4, $F8, 8, 1, 8, 4
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, 6
		dcb.b	2,$F8
		dc.b	1, 8, 6
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, 8
		dcb.b	2,$F8
		dc.b	1
		dcb.b	2,8
		dcb.b	2,0
		dc.b	2, $F8, 1, 0, $A
		dcb.b	2,$F8
		dc.b	1, 8, $A
		dcb.b	3,0
		dc.b	2, 7, 0, 1, 2, 3, $FF, 0, 8, 0, $3C, 0, $70, 0, $7C, $A, $E0
		dc.b	9
		dcb.b	2,0
		dc.b	$E8, $E0, 9, 0, 6, 0, $E8
		dcb.b	2,0
		dc.b	$C, $E0, $E8
		dcb.b	2,0
		dc.b	$D, $18, $F0, 7, 0, $E, $E0, $10
		dcb.b	2,0
		dc.b	$16, $E0, $10, 9, 0, $17, $E8, $10, 9, 0, $1D, 0, $10
		dcb.b	2,0
		dc.b	$23, $18, $F0, 7, 0, $24, $10, 0, $A, $E0, $D, 0, $2C, $F0
		dc.b	$E8
		dcb.b	2,0
		dc.b	$34, $E8, $F0, 7, 0, $35, $E8, $10
		dcb.b	2,0
		dc.b	$3D, $E8, $10, $D, 0, $3E, $F0, $E8
		dcb.b	2,0
		dc.b	$46, $10, $F0
		dcb.b	2,0
		dc.b	$47, 0, $F0, 7, 0, $48
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$50, 0, $10
		dcb.b	2,0
		dc.b	$51, $10, 0, 2, $E0, $B, 0, $52, $F4, 0, $B, 0, $5E, $F4
		dc.b	0, $A, $E0, $D, 8, $2C, $F0, $E8, 0, 8, $34, $10, $F0, 7
		dc.b	8, $35, 8, $10, 0, 8, $3D
		dcb.b	2,$10
		dc.b	$D, 8, $3E, $F0, $E8, 0, 8, $46, $E8, $F0, 0, 8, $47, $F8
		dc.b	$F0, 7, 8, $48, $E8, 8, 0, 8, $50, $F8, $10, 0, 8, $51, $E8
		dcb.b	2,0
		dc.b	2, 1, 0, 1, 2, 4
		dcb.b	2,3
		dc.b	1, 2, 4, $FF
		dcb.b	2,0
		dc.b	$C, 0, $22, 0, $32, 0, $42, 0, $58, 0, $68, 4, $D4, $B
		dcb.b	2,0
		dc.b	$E8, $D4, $B, 0, $C, 0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
		dc.b	$F0, 0, 3, $D4, $F, 0, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C
		dc.b	0, $48, $F0, 3, $D4, 3, 0, $28, $FC, $F4, 5, 0, $44, $F8
		dc.b	4, $C, 0, $48, $F0, 4, $D4, $B, 0, $2C, $E8, $D4, $B, 0, $38
		dc.b	0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0, 0, 3, $D4, $F
		dc.b	8, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0, 4, $E4
		dc.b	2
		dcb.b	2,0
		dc.b	$EC, $E4, $F, 0, 3, $F4, 4, 1, 0, $13, $FC, $14, 8, 0, $15
		dc.b	$F4
		dcb.b	2,0
		dc.b	4, 0, $2C, 1
		dcb.b	$1E,0
		dc.b	1
		dcb.b	2,0
		dc.b	1
		dcb.b	2,0
		dc.b	1, $FF, 0, 2, 3, 4, 5, 6, 7, 8, $FF, 0, $12, 0, $50, 0, $8E
		dc.b	0, $AE, 0, $B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
		dcb.b	2,0
		dc.b	$F8, $E0, 1, 8
		dcb.b	2,0
		dc.b	$F0, 8, 0, 2, $E8, $F0, 8, 0, 5, 0, $F8, $D, 0, 8, $E0, $F8
		dc.b	$D, 0, $10, 0, 8, $D, 0, $18, $E0, 8, $D, 8, $18, 0, $18
		dc.b	$C, 0, $20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0
		dc.b	$20, 7, 8, $54
		dcb.b	2,0
		dc.b	$C, $E0, 1, 0, $24, $F8, $E0, 1, 8, $24, 0, $F0, 8, 0, $26
		dc.b	$E8, $F0, 8, 0, $29, 0, $F8, $D, 0, $2C, $E0, $F8, $D, 0
		dc.b	$34, 0, 8, $D, 0, $3C, $E0, 8, $D, 8, $3C, 0, $18, $C, 0
		dc.b	$20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7
		dc.b	8, $54
		dcb.b	2,0
		dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20
		dc.b	$E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
		dcb.b	2,0
		dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5
		dc.b	0, $64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8
		dc.b	1, $F8, 5, 8, $5C, $F8, $CC, $ED, $A6, $CD, $3D, $1F, $47
		dc.b	$63, $B5, $71, $3B, $4B, $63, $B4, $D3, $5B, $E9, $56, $29
		dc.b	$A1, $6C, $B, $29, $64, $7C, $1B, $D0, $E2, $EC, $8C, $A7
		dc.b	$7A, $B1, $DB, $4D, $9F, $9D, $F4, $D8, $EF, $C4, $B6, $F7
		dc.b	$DE, $55, $D3, $F5, $E5, $17, $5A, $68, $77, $EB, $4C, $76
		dc.b	$6E, $BD, $A3, $F6, $7C, $EC, $58, $E2, $EB, $89, $57, $63
		dc.b	$AB, $4D, $FA, $D9, $79, $F4, $D4, $57, $7E, $1A, $16, $43
		dc.b	$BC, $E9, $FA, $F3, $86, $CD, $A3, $1D, $9D, $8B, $4D, $95
		dc.b	$F1, $75, $76, $D5, $8B, $A2, $BE, $A3, $BC, $EF, $7D, $EE
		dc.b	$9B, $27, $3A, $6F, $3A, $6B, $D3, $5F, $EB, $76, $5C, $19
		dc.b	$70, $3A, $B1, $57, $68, $6D, $6A, $E8, $59, $36, $2C, $59
		dc.b	$37, $96, $10, $D5, $57, $4D, $ED, $BB, $7A, $C2, $29
		dcb.b	2,$47
		dc.b	$42, $C5, $1D, $B, $43, $16, $D2, $B8, $D5, $4A, $3B
		dcb.b	2,$42
		dc.b	$B2, $A1, $6D, $95, $D1, $5D, $AB, $89, $D6, $C5, $1F, $45
		dc.b	$6F, 2, $8A, $FA, $1D, $B5, $26, $D1, $B2, $70, $76, $D1
		dc.b	$D9, $D4, $B1, $63, $8A, $6F, $85, $2A, $51, $D2, $6D, $36
		dc.b	$2C, $58, $B1, $58, $57, $C7, $69, $A9, $47, $62, $85, $A7
		dc.b	$DD, $A2, $1D, $11, $63, $C4, $7E, $6B, $F2, $CC, $25, $60
		dc.b	$7F, $4E, $F6, $1F, $C3, $EA, $B4, $A8, $E, $6D, $14, $11
		dc.b	$67, $A7, $30, $8C, $D2, $CF, $FB, $5F, $DB, $CE, $C0, $5A
		dc.b	$FD, $3C, $FC, $25, $87, $EB, $AB, $CA, $3C, $FA, $6B, $FD
		dc.b	$6C, $58, $4B, $8F, $5D, $77, $4E, $D1, $FA, $DC, $B4, $8D
		dc.b	$C3, $7E, $DD, $DF, $BB, $8A, 9, $6D, $F9, $AA, $EE, $9D
		dc.b	$23, $F5, $5B, $FB, $23, $70, $FC, $5F, $67, $E6, $FF, $7F
		dc.b	$3A, 1, $4B, $FB, $39, $FF, $37, $2C, $3C, $6B, $CA, $74
		dc.b	$5A, $2D, $E, $6E, $A5, $41, $45, $86, $29, $7B, $C, 1, $49
		dc.b	$60, $54, $B6, 0, $E0, $50, $3A, 7, $64, $68, $46, $86, 9
		dc.b	$C1, $59, $4B, $2C, $28, $84, $74, $29, $36, $85, 5, $A1
		dc.b	$24, $C5, $8B, $16, $76, $2A, $ED, $35, 5, $4A, $CD, $84
		dc.b	$31, $69, $2C, $F2, $92, $76, $16, $2C, $59, $1D, $4A, $83
		dc.b	$84, $20, $29, 8, $59, $D0, 6, $C2, $30, $50, $E8, $52, $4A
		dc.b	$50, $A0, $28, $C5, $A1, 4, $D9, $B, $15, $2B, $C0, $55, $A1
		dc.b	$90, $A0, $51, $B, $55, $76, $2C, $58, $B2, $14, $2A, $53
		dc.b	$18, $52, $C0, $AC, $D8, $2B, $B1, $61, $19, $3B, $4F, $B0
		dc.b	$ED, $8A, $35, $74, $93, $3E, $C7, $6A, $D1, $D0, $43, $A
		dc.b	$AD, $1D, $A, $6C, $7B, $1A, $86, $87, $63, $B4, $D0, 2, $95
		dc.b	$6A, $4D, $AA, $D5, $69, $D1, $A8, $B4, $34, $60, $1E, $93
		dc.b	$62, $D6, $75, $15, $4B, $45, $2B, $68, $B3, $21, $4A, $D2
		dc.b	$2D, $25, 5, $4A, $BB, $5E, $B1, $63, $61, $1B, $CE, $1A
		dc.b	$CE, $FA, $E8, $83, $64, $DA, $B4, $12, $62, $C5, $B, $A
		dc.b	$4D, $36, $3D, $8B, $45, $A1, $D8, $ED, $34, $2A, $50, $A0
		dc.b	$84, $95, 4, $D8, $B1, $42, $CF, $46, $A2
		dcb.b	2,$D0
		dc.b	$3B, $15, $2B, $3A, $5F, $69, $A8, $2A, $F6, $8A, $56, $CE
		dc.b	$B6, $28, $A8, $B3, $A3, $AD, $9D, $2A, $B0, $A1, $AF, $58
		dc.b	$B3, $58, $42, $95, $65, $3C, $84, $96, $18, $A5, $ED, $35
		dc.b	$9A, 2, $92, $54, $D4, $58, $A0, $28, $26, $A8, $21, $2A
		dc.b	$D0, $D2, $57
		dcb.b	3,$65
		dc.b	$3A, $A3, $50, $74, 5, $A1, $42, $B4, $20, $9A, $95, $62
		dc.b	$B7, $A8, $2A, $75, 0, $16, $6B, $24, $52, $A5, $4A, $A2
		dc.b	$89, $24, $20, $29, 8, $AC, 4, $32, $A2, $BA, $15, 2, $14
		dc.b	$A2, $A0, $28, 3, $AB, $3A, $95, $2A, $CA, $D3, $50, $D0
		dc.b	$C2, $14, $2B, $AD, $54
		dcb.b	2,$2A
		dc.b	$15, $28, $5A, $14, $B0, $3A, $84, $D4, 5, $76, $9A, $95
		dc.b	$65, $45, $13, $60, $EA, $E8, $21, $85, $75, $3A, $14, $75
		dc.b	$65, $2A, $10, 2, $95, $65, $9B, $55, $AA, $D3, $56, $E4
		dc.b	$55, $80, $75, $9B, $16, $85, $15, $49, $A8, $76, $52, $B5
		dc.b	$50, $EA, $A, $95, $E, $A0, $15, $2A, $8A, $56, $48, $A, $49
		dc.b	$44, $98, $B1, $42, $C1, $66, $8F, $FC, $20, $85, $4A, $14
		dc.b	$10, $92, $51, $36, $2C, $50, $B3, $AB, $72, $2A, $1D, $8A
		dc.b	$95, $9A, $89, $A8, $2B, $25, $A, $FF, $B2, $9A, $BA, $C2
		dc.b	$55, $61, $40, $59, $B0, $98, 0, $17, $80, 5, $12, $17, $76
		dc.b	$27, $7A, $36, $32, $46, $2F, $55, $13, $65, $F, $74, 4, $81
		dc.b	4, 6, $15, $14, $26, $35, $37, $6F, $46, $33, $57, $6E, $67
		dc.b	$7B, $76, $36, $86, 3, 0, $16, $31, $87, 4, 2, $17, $77, $28
		dc.b	$FA, $36, $2E, $46, $2A, $88, 4, 3, $15, $10, $26, $39, $36
		dc.b	$2B, $89, 5, $E, $15, $16, $26, $3A, $37, $79, $8B, 5, $11
		dc.b	$8C, $18, $F9, $8D, 8, $F8, $16, $38, $8E, 6, $30, $16, $34
		dc.b	$8F, 4, 5, $17, $78, $FF
		dcb.b	4,$44
		dc.b	$47, $C5, $E7, $38, $4E, $C8, $88, $8F, $29, $93, $91
		dcb.b	3,$11
		dc.b	$E7, $7F, $3E, $B9, $23, $F5, $9E, $5B, $EF, $D7, $F3, $6B
		dc.b	$1F, $DF, $C5, $62, $B1, $FD, $7C, 8, $EE
		dcb.b	2,$32
		dc.b	$3F, $AF, $FC, $C9, $DB, $BA, $A3, $99, $CD, $8B, $A8, $E6
		dc.b	$36, $3B, $53, $A6, $EA, $9E, $B3
		dcb.b	2,$44
		dc.b	$4C, $AB, $95, $64, $65, 2, $3B, $8E, $A1, $FD, $70, $43
		dc.b	$6D, $FC, $7C, $E7, $C7, $E3, $3F, $BF, $8F, $F7, $F1, $A8
		dc.b	$10, $B8, $16, $3F, $F9, $DB, $77, $5B, $DC, $61, $9D, $4B
		dc.b	$31, $B9, $9C, $CE, $A1, $66, $E6, $12, $D7, $8F, $9E, $D4
		dc.b	$E3, $E7, $D6, $77, $BA, $13, $71, $E5, $5C, $AB, $23, $28
		dc.b	$11, $DC, $75, $F, $EB, $82, $1B, $6F, $D3, $8C, $F4, $F8
		dc.b	$AF, $22, $32, $AE, $57, $19, $40, $85, $46, 8, $55, $B7
		dc.b	$1A, $6F, $F8, $D3, $3C, $AB, $95, $64, $65, 2, $3B, $8E
		dc.b	$A1, $FD, $70, $43, $6D, $DA, $7B, $C2, $BC, $88, $CA, $B9
		dc.b	$5C, $65, 2, $15, $18, $21, $56, $DA, $6E, $C3, $DF, $6C
		dc.b	$66, $A1, $EA, $88, $AF
		dcb.b	2,$F0
		dc.b	$F5, $B, $78, $5B, $D6, $6A, $F5, $9F, $8B, $D4, $3C, $2C
		dc.b	$F1, $9A, $87, $84, $78, $7A, $87, $AC, $FC, $4D, $5E, $AF
		dc.b	$57, $85, $78, $59, $AC, $C2, $DE, $A2, $78, $A4, $83, $C8
		dc.b	$4D, $8A, $F7, $37, $7C, $AB, $CA, $B9, $43, $B7, $EA, $E4
		dc.b	$E8, $4B, $59, $58, $E5, $66, $95, $8D, $D8, $F9, $36, $81
		dc.b	$75, $DD, $9C, $5E, $7B, $B4, $7C, $C1, $A3, $E6, $D, $19
		dc.b	$6E, $8A, $5F, $CF, $6F, $E4, $5B, $92, $76, $A4, $7D, $F3
		dc.b	$23, $2A, $1C, $56, $2B, $4B, $2C, $56, $34, $D3, $DE, $1D
		dc.b	$33, $87, $8E, $E3, $F9, $E5, $FC, $F8, $B4, $7C, $7E, $AE
		dc.b	$9F, $AB, $DE, $71, $D5, $D0, $F2, $D6, $A2, $73, $DB, $EB
		dc.b	$5A, $A9, $50, $FF, $38, $FF, $BB, $B9, $BB, 6, $C2, $D0
		dc.b	$2C, $1B, $F, $62, $CD, $87, $C5, 6, $DF, $C9, $83, $1D, $D6
		dc.b	$68, $7D, $6B, $68, $16, $E7, $18
		dcb.b	2,0
		dc.b	$14, $80, 5, $12, $15, $13, $26, $2E, $36, $32, $45, $18
		dc.b	$58, $F8, $66, $3A, $74, 3, $81
		dcb.b	2,4
		dc.b	$16, $34, $82, 4, 5, $16, $35, $27, $7B, $83, 4, 6, $16, $38
		dc.b	$28, $FB, $84, 6, $3C, $85, 5, $15, $16, $33, $86, 4, 7, $87
		dc.b	6, $2F, $88, 7, $77, $8A, 6, $37, $8B, 4, 2, $14, 8, $25
		dc.b	$16
		dcb.b	2,$36
		dc.b	$8C, $18, $F9, $8D, 3, 0, $15, $14, $26, $39, $8F, 7, $76
		dc.b	$17, $7A, $FF, $3F, $86, $35, $E9, $AE, $6A, $C9, $5A, $6B
		dc.b	$9E, $AD, $35, $CD, $95, $A6, $B9, $B2, $B4, $95, $97, $35
		dc.b	$65, $6C, $D6, $BA, $CE, $AF, $56, $AA, $CF, $B2, $E6, $CB
		dc.b	$2F, $4B, $FA, $19, $A7, $AF, $84, $B6, $3F, $42, $67, $36
		dc.b	$F2, $BE, $71
		dcb.b	2,$3F
		dc.b	$8A, $D2, $FE, $2B, $D5, $BF, $4A, $D7, $BD, $FC
		dcb.b	2,$57
		dc.b	$4B, $D5, $BD, $BA, $5E, $BF, $6A, $E9, $7A, $F1, $F2, $AF
		dc.b	$D9, $35, $F9, $D7, $D6, $9E, $E0, $CC, $CF, $A6, $35, $E9
		dc.b	$BE, $15, $BE, $15, $97, $A, $CA, $D2, $E2, $5E, $F8, $CD
		dc.b	$B5, $9D, $7F, $66, $B3, $CF, $EE, $B3, $ED, $9F, $DC, $BD
		dc.b	$12, $66, $D2, $EC, $49, $2D, $2B, $2E, $C4, $93, $54, $96
		dc.b	$86, $78, $6F, $2B, $E7, $13, $F3, $F8, $AD, $2F, $E2, $BD
		dc.b	$5B, $F4, $AD, $7B, $DF, $C5, $75, $74, $BD, $5B, $DB, $A5
		dc.b	$EB, $F6, $AE, $97, $EA, $DF, $2A, $FD, $91, $97, $E7, $5F
		dc.b	$4A, $9E, $E0, $E4, $DD, $57, $A4
		dcb.b	3,$33
		dc.b	$C4, $65, $14, $BA, $39, $BA, $96, $98, $B6, $93, $8D, $32
		dc.b	$24
		dcb.b	3,$33
		dc.b	$32, $A6, $B, $7A, $63, $FB, $77, $73, $69, $FF, $36, $24
		dc.b	$2D, $42, $90, $24, $81, 0, $A5, $A7, $24, $2E, $48, 5, $70
		dc.b	$B0, $B8, $59, $32, $8A, $64, 8, $16, $49, $63, $FE, $6D
		dc.b	$C0, $A8, $42, $62, 1, $38, $95, $22, $F7, $EE, $36, $74
		dc.b	$EE, $36, $74, $EE, $23, $72
		dcb.b	2,$74
		dc.b	$2F, $D5, $17, $E5, $B7, $2F, $F5, 2, $FE, $54, $93, $9C
		dc.b	$88, $10, $C9, $37, $18, 9, $F0, $41, $C, $CC, $CF, $AD, $AE
		dc.b	$2A, $6D, $28, $A5, $A7, $1C, $94, $D2, $D4, $B9, $36, $CB
		dc.b	$48, $C0, $D3, 2, $31, $42, $E8, $19, $99, $E4, $54, $C1
		dc.b	$6F, $4C, $6D, $8A, $46, $54, $B5, $C0, $B9, $29, $82, $D0
		dc.b	$85, $87, $FE, $FF, $96, $3F, $35, $B0, $B7, $EF, $4C, $CC
		dc.b	$F2, $FE, $6D, $C0, $A8, $42, $62, 1, $38, $95, $22, $F7
		dc.b	$EE, $36, $74, $EE, $36, $74, $EE, $23, $72
		dcb.b	2,$74
		dc.b	5, $F9, $A2, $FC, $B6, $F6, 9, $C9, $F, $F5, $CB, $F9, $A4
		dc.b	$60, 0, $33, $80, 5, $F, $15, $14, $25, $10, $36, $2E, $46
		dc.b	$2A, $56, $2B, $66, $34, $74, 2, $81, 3, 0, $15, $A, $27
		dc.b	$70, $82, 4, 3, $15, $12, $26, $36, $37, $74, $47, $76, $83
		dc.b	5, $B, $16, $30, $26, $35, $84, 5, $11, $16, $33, $28, $F4
		dc.b	$85, 7, $6E, $18, $F2, $86, 5, $16, $17, $78, $27, $7B, $87
		dc.b	4, 6, $17, $6F, $28, $EE, $88, 5, $E, $16, $27, $28, $F5
		dc.b	$89
		dcb.b	2,4
		dc.b	$16, $26, $28, $EF, $37, $75, $8A, 7, $73, $8B, 7, $71, $18
		dc.b	$F3, $8C, 6, $31, $17, $72, $8D, 6, $2F, $8F, 6, $32, $FF
		dc.b	$81, $FE, $CE, $E3, $D6, $E9, $61, $54, $97, $54, $97, $5C
		dc.b	$AB, $95, $56, $94, $2C, $F4, $95, $2C, $8F, $49, $52, $67
		dc.b	9, $51, $1C, $3B, $A0, $3B, $AD, $E, $23, $C0, $96, $1E, $6B
		dc.b	$F, $D9, $79, $AE, $9D, $30, $BB, $A5, $72
		dcb.b	3,$22
		dc.b	$FD, $9D, $D8, $67, $AB, $F0, $97, $A6, $A7, $91, $C7, $74
		dc.b	$56, $6E, $FC, $F9, $C7, $72, $CD, $DF, $AF, $5E, $E5, $9C
		dcb.b	2,$F9
		dc.b	$6B, $9E, $E8, $EE, $B2, $67, $2C, $D9, $22, $6A, $35, $A6
		dc.b	7, $C2, $5A, $9A, $92, $27, $81, $A9, $A2, $7A, $98, $61
		dc.b	$17, $59, $66, $10, $46, $74, $6B, 3, $11, $13, $B5, $8C
		dc.b	$44, $FD, $59, $E6, $D2, $F5, $93, $98, $38, $D2, $53, $B0
		dc.b	$65, $D1, $8D, $C1, $CB, $87, $4E, $24, $44, $BB, $8E, $91
		dc.b	$C3, $6A, $6E, $CD, $72, $A7, $E9, $62, $B3, $A7, $8F, $28
		dc.b	$AE, $9E, $3C, $A2, $BA, $7E, $D7, $35, $BD, $7F, $D4, $79
		dc.b	$E1, $E8, $B7, $ED, $A9, $BD, 7, $4A, $20, $6E, $14, $DE
		dc.b	$83, $7D, $38, $6F, $52, $78, $EE, $4A, $6F, $9D, $21, $3C
		dc.b	$C2, $87, $34, $83, $F8, $9E, $1E, $6B, $D, $C2, $FE, $26
		dc.b	$C0, $F8, $5F, $C4, $21, $82, $2D, $32, $E7, $59, $E5, $CE
		dc.b	$1C, $8E, $67, $FE, $F0, $DC, $3F, $78, $D6, $9C, $72, $6C
		dc.b	$5F, $64, $53, $B1, $55, $FC, $31, $E1, $F9, $DF, $D8, $BC
		dc.b	$5E, $EB, $C5, $C2, $F1, $52
		dcb.b	2,$88
		dc.b	$B4, $E4, $21, $C9, $B1, $10, $C6, $D8, $AA, $16, $C5, $57
		dc.b	$62, $AA, $95, $58
		dcb.b	4,$22
		dc.b	$86, $DC, $6A, $92, $EA, $DA, $B9, $56, $C9, $55, $92, $B3
		dc.b	$8D, $47, $1A, $CE, $35, $4A, $35, $4F, $35, 5, $F3, $E, $4F
		dc.b	$BD, $57, $FE, $B0, $38, $4F, $BE, $DF, $9D, $17, $FE, $F3
		dc.b	$FE, $3C, $32, $E6, $29, $E7, $95, $97, $F, $D9, $DC, $B3
		dcb.b	4,$22
		dc.b	$AF, $95, $7E, $DA, $EF, $E6, $43, $F8, $3A, $1E, $B5, $1E
		dc.b	$15, $49, $75, $CA, $B9, $68, $7A, $1E, $87, $A1, $E8, $75
		dc.b	$AC, $EB, $95, $72, $AB, 3, $7C, $B0, $CD, $74, $D9, $79
		dc.b	$C3, $A2, $EA, $DB, $43, $2D, $F, $43, $D2, $35, $C4, $EE
		dc.b	$E7, $97, $11, $E, $7F, $9F, $E2, $90, $FC, $FF, $14, $10
		dc.b	$E0, $E4, $87, $7C, $F7, $77, $91, $3D, $7A, $7F, $E, $1A
		dc.b	$E7, $FD, $39, $7A, $6A, $79, $1C, $77, $1A, $CD, $DF, $9F
		dc.b	$38, $9A, $CD, $DF, $AF, $59, $AC, $E7, $CF, $71, $EB, $9E
		dc.b	$E8, $9E, $19, $CA, $27, $84, $4D, $5B, $60, $7C, $25, $A9
		dc.b	$AB, $6C, $D, $5B, $6A, $61, $72, $75, $96, $61, $72, $9D
		dc.b	$1A, $DB, $2A, $76, $ED, $EA, $F7, $30, $71, $CE, $6E, $DE
		dc.b	$1A, $51, $63
		dcb.b	2,$70
		dc.b	$5F, $4F, $D9, $FF, $4B, 7, $F6, $C1, $9F, $D3, 4, $7F, $65
		dc.b	$A5, $3A, $2E, $A6, $4A, $D9, $2A, $38, $D6, $71, $22, $2A
		dc.b	$61, $71, $BF, $3C, $36, $7F, $96, $6B, $93, $FF, $6B, $15
		dc.b	$9B, $F7, $78, $F2, $8A, $DF, $BB, $C7, $94, $56, $F8, $FE
		dc.b	$D7, $3D, $7F, $A9, $2C, $3D, $16, $9B, $6A, $6C, $83, $A3
		dc.b	$D9, 3, $70, $64, $DE, $83, $7A, $7E, $C7, $7A, $BD, $F7
		dc.b	$23, $FB, $A7, $4A, $7A, $B2, $43, $AD, $CB, $F3, $5D, $C2
		dc.b	$FF, $35, $C1, $5C, $79, $AE, 2, $FC, $B9, $AE, $B, $CA, $CB
		dc.b	$68, $6A, $11, $A9, $B5, $11, $B4, $48, $E8, $64
		dcb.b	3,$44
		dc.b	$55, $B5, $5B, $D1, $A1, $CF, $2D, $E9, $4E, $7F, $9F, $E2
		dc.b	$20, $3C, $C5, $D1, $1C, $44, $CF, $89, $D5, $13, $AC, $CB
		dc.b	$44, 4
		dcb.b	5,$44
		dc.b	$55, $E7, $56, $32, $CD, $C3, $95, $E, $D3, $8C, $48
		dcb.b	2,$88
		dc.b	$89, 8, $8A, $EE, $42, $1C, $9B, $10, $FF, $D6, $5B, $15
		dc.b	$7E, $B2, $D8, $A9, $FC, $9B, $15, $53, $16, $C5, $50, $76
		dc.b	$2A, $BB, $15, $54, $A2
		dcb.b	4,$22
		dc.b	$2A, $86, $82, $B1, $7D, $6A, $81, $C6, $A9, $46, $AB, $3A
		dc.b	$6A, $B, $E6, $1F, $AC, $FC, $EF, $F, $D6, $4E, $A9, $F7
		dc.b	$FE, $75, $5F, $BC, $FF, $89, $11, $17, $EB, $2A, $6F, $6D
		dc.b	$F, $EE, $53, $FA, $35, $D9, $15, 1, $7F, 8, $F, $CE, $AA
		dc.b	2, $F7, $5E, $2E, $17, $8A, $94, $45, $57, $68, $7F, $15
		dc.b	$EA, $F4, $DA, $6F, $45, $6E, $9F, $F8, $B6, $9F, $77, $ED
		dc.b	$B7, $4D, $AA, $8D, $5B, $29, $EA, $ED, $F, $E0, $D0, $7F
		dc.b	$E, $8E, $ED, $44, $ED, $41, $DA, $EF, $D8, $DD, $FB, $88
		dc.b	$E, $B0, $1D, $60, $3A, $C0, $75, $7B, $AD, $FC, $90, $EF
		dc.b	$EB, $8F, $F4, $FF, $C4, $F4, $DC, $9F, $8E, $1F, $8E, $99
		dc.b	$E1, $AF, $17, $EF, $40, $D7, $8B, $FB, $85, $B1, $18, $FB
		dc.b	$16, $C4, $63, $EC, $3A, $F1, $7F, $A8, $4F, $C7, $F, $C7
		dc.b	$77, $84, $FD, $74, $CC, $3F, $92, $C8, $3B, $C3, $91, $53
		dc.b	7, $20, $60, $81, $C8, $A4, $53, $90, $39, $53, $A0, $72
		dc.b	$2A, $6F, $DB, $89, $9B, $AB, $23, $4C, $A9, $A7, $40, $E4
		dc.b	9, $3A, 4, $52, $4F, $32, $A6, $77, $FE, $7F, $F3, $FF, $12
		dc.b	$29, $AB, $DF, $35, $DE, $37, $A4, $3D, $B2, $42, $76, $B3
		dc.b	$25, $26, $F5, $13, $4F, $33, $83, 9, $9D, $30, $B2, $BA
		dc.b	$86, $E, $1D, $E1, $38, $4C, $1C, $8A, $98, $39, $15, $30
		dc.b	$72, $29, $E8, $1C, $9C, $1E, $1C, $8A, $40, $F7, $22, $A6
		dc.b	$F, $45, $77, $87, $AB, $A8, $78, $FE, $48, $7F, $77, $B7
		dc.b	$F, $F4, $FF, $C4, $15, $79, $11, $43, $2B, $B2, $2A, $B2
		dc.b	$22, $2A, $B2, $2A, $65, $6B, $B2, $A6, $4F, $CA, $EB, $5D
		dc.b	$91, $5C
		dcb.b	2,0
		dc.b	$D2, 0, $EC, 0, $FC, 1, $C, 4, $E8, $D, 0, $43, $F0, $F8
		dc.b	$C, 0, $4B, $F0, 0, 8, 0, $4F, $F0, 8, $C, 0, $52, $F0, 0
		dc.b	2, $E8, 9
		dcb.b	2,0
		dc.b	$F4, $F8, $A, 0, $3A, $F4, 0, 2, $E8, $D, 0, $43, $F0, $F8
		dc.b	$E, 0, $56, $F0, 0, 4, $E8, 9
		dcb.b	2,0
		dc.b	$F4, $F8, 8, 0, 6, $F4, 0, 4, 0, 9, $FC
		dcb.b	2,8
		dc.b	0, $B, $F4, 0, 4, $E8, 9
		dcb.b	2,0
		dc.b	$F4, $F8, 8, 0, $E, $F4, 0, 4, 0, $11, $FC
		dcb.b	2,8
		dc.b	0, $13, $F4, 0, 2, $E8, 9
		dcb.b	2,0
		dc.b	$F4, $F8, $A, 0, $16, $F4, 0, 3, $E8, $E, 0, $6E, $F0, 0
		dc.b	8, 0, $7A, $F0, 8, 4, 0, $7D, $F0, 2, $E8, $A, 0, $7F, $F8
		dc.b	0, $D, 0, $88, $F0, 0, 1, $F8, 5, 0, $62, $F8, 1, $F8, 5
		dc.b	0, $66, $F8, 1, $F8, 5, 0, $6A, $F8, 3, $E8, $A, 0, $1F, $F4
		dc.b	$F0
		dcb.b	2,0
		dc.b	$28, $C, 0, 9, 0, $32, $F4, 2, $E8, $A, 0, $29, $F4, 0, 9
		dc.b	0, $32, $F4, 0, 5, $F4, 4, 0, $38, $FE, $E8, 9
		dcb.b	2,0
		dc.b	$F4, $F8, 8, 0, $E, $F4, 0, 4, 0, $11, $FC
		dcb.b	2,8
		dc.b	0, $13, $F4, 3, $F8, 4, 0, $38, $FE, $EC, $A, 0, $7F, $F8
		dc.b	4, $D, 0, $88, $F0, 3, $F4, 4, 0, $38, $FE, $E8, $A, 0, $29
		dc.b	$F4, 0, 9, 0, $32, $F4, 3, $EC, $A, 0, $7F, $F8, 4, $C, 0
		dc.b	$90, $F0, $C, 8, 0, $94, $F0, 0, $24, 0, $C, 0, $16, 0, $20
		dc.b	0, $2A, 0, $30, 3, $B, 4, $B, 5, $B, 4, $B, $FF
		dcb.b	2,0
		dc.b	3, 1
		dcb.b	2,2
		dc.b	3, 1, 2, $FF, 0, $E, 9, $FF, 0, $B, $13, $C, $13, $FF, 0
		dc.b	6, 9, 7, 9, $FF, 0, $B, $1D, $C, $1D, $B, $1D, $C, $31, $FF
		dc.b	0, 5, 8, $22, $CB, $D5, 5, 8, $22, $D5, $DF, 5, 8, $22, $DF
		dc.b	$E9, 5, 8, $22, $E9, $F3, 5, 8, $1E, $F3, $E0, 8
		dcb.b	2,0
		dcb.b	2,$E8
		dc.b	$E, 0, 3
		dcb.b	2,$E0
		dcb.b	2,8
		dcb.b	2,0
		dc.b	$E8, $E, 8, 3, 0, $18, 8, $10, 0, $E8, 0, $E, $10, 3, $E0
		dc.b	$18, 8, $18
		dcb.b	3,0
		dc.b	$E, $18, 3, 0, 8, $54
		dcb.b	2,0
		dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20
		dc.b	$E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
		dcb.b	2,0
		dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5
		dc.b	0, $64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8
		dc.b	1, $F8, 5, 8, $5C, $F8, 5, 8, $5C, $F8, $56, $11, $57, $12
		dc.b	$58, $12, $59, $13, $5A, $13, $5B, $14, $5C, $15, $5D, $16
		dc.b	$5E, $17, $5F, $18, $60, $19, $61, $1A, $62, $1B, $63, $1C
		dc.b	$63, $1D, $64, $1E, $64, $1F, $64, $20, $65, $21, $65, $22
		dc.b	$65, $23, $66, $24, $66, $25, $66, $26, $66, $27, $66, $28
		dc.b	$66, $29, $66, $2A, $66, $2B, $66, $2C, $66, $2D, $65, $2E
		dc.b	$65, $2F, $65, $30, $64, $31, $64, $32, $64, $33, $63, $34
		dc.b	$62, $35, $62, $36, $61, $37, $60, $38, $5F, $39, $5E, $3A
		dc.b	$5D, $3B, $5C, $3C, $5B, $3C, $5A, $3D, $59, $3D, $58, $3D
		dc.b	$57, $3E, $56, $3E, $55, $3E, $54, $3F, $53, $3F, $52, $3F
		dc.b	$51, $3F, $50, $3F, $4F, $3F, $4E, $3F, $4D, $3F, $4C, $3F
		dc.b	$4B, $3F, $4A, $3F, $49, $3F, $48, $3E, $47, $3E, $46, $3E
		dc.b	$45, $3D, $44, $3D, $43, $3C, $42, $3C, $41, $3B, $40, $3B
		dc.b	$3F, $3A, $3E, $3A, $3D, $39, $3C, $39, $3B, $38, $3A, $38
		dc.b	$39, $37, $38
		dcb.b	2,$37
		dcb.b	3,$36
		dcb.b	2,$35
		dc.b	$34, $35, $33, $34, $32, $34, $31, $33, $30, $33, $2F, $32
		dc.b	$2E, $32, $2D, $31, $2C, $31, $2B, $30, $2A, $30, $29, $2F
		dc.b	$28, $2F, $27, $2E, $26, $2E, $25, $2D, $24, $2D, $23, $2C
		dc.b	$22, $2C, $21, $2B, $20, $2B, $1F, $2A, $1E, $2A, $1D, $29
		dc.b	$1C, $29, $1B, $28, $1A, $28, $19, $27, $18, $27, $17, $26
		dc.b	$16, $26, $15, $25, $14, $25, $13, $24, $12, $24, $11, $23
		dc.b	$10, $23, $F, $22, $E, $22, $D, $21, $C, $21, $B, $20, $A
		dc.b	$20, 9, $1F

	; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
