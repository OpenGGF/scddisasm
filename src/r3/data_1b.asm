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
	include	"Level/Collision Chaos/Data/R31B Padding 3.asm"
