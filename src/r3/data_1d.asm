; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R31D)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R31D Padding1.asm"
	else
		dc.b	$DA, $36, $6E, $20, 0, $21, $DA, $B2, $6F, $20, 0, $21, $D9
		dc.b	$7C, $73, $E0, 0, $23, $54, $EC, $75, $E0, 0, $23, $56, 4
		dc.b	$75, $E0, 0, $23, $5B, $D8, $77, $A0, 0, $23, $6F, $78, $7B
		dc.b	$40, 0, $21, $DE, $3E, $7E, $40, 0, $23, $4C, $14, $84, $20
		dcb.b	3,0
		dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
		dc.b	$22, $F4, $F2, $91
		dcb.b	2,0
		dc.b	$20, $DC, $6E, $7D, $E0, $33, $72, $20, 2, 0, $2C, $33, $72
		dc.b	$20, 4, 0, $2A, $13, $72, $20, 6, 0, $1A, $C, 1, 0, 5, $66
		dc.b	$A, $16, $39, 0, $FF, $15, 7, $D7, $29, 0, $1A, $13, $72
		dc.b	$20, 7, 0, $1E, $52, 1, $51, $CE, $FF, $A4, $4E, $75, $70
		dc.b	8, $32, $28, 0, $2E, $B2, $68, 0, $A, $67, $E, $6C, 2, $44
		dc.b	$40, $D1, $68, 0, $A, $4E, $F9, 0, $20, $3A, $6E, $58, $28
		dc.b	0, $24, $4E, $F9, 0, $20, $3A, $6E, $70, 8, $32, $28, 0, $2A
		dc.b	$B2, $68, 0, 8, $67, $E, $6C, 2, $44, $40, $D1, $68, 0, 8
		dc.b	$4E, $F9, 0, $20, $3A, $6E, $58, $28, 0, $24, $4E, $F9, 0
		dc.b	$20, $3A, $6E, $4A, $28, 0, $1E, $67, $A, $53, $28, 0, $1E
		dc.b	$4E, $F9, 0, $20, $3A, $6E, $70, $10, $32, $28, 0, $30, $B2
		dc.b	$68, 0, $A, $67, $E, $6C, 2, $44, $40, $D1, $68, 0, $A, $4E
		dc.b	$F9, 0, $20, $3A, $6E, $58, $28, 0, $24, $11, $FC, 0, 1, $F7
		dc.b	$44, $70, 2, $4E, $F9, 0, $20, $24, $48, $4A, $28, 0, $1E
		dc.b	$67, $A, $53, $28, 0, $1E, $4E, $F9, 0, $20, $3A, $6E, $70
		dc.b	$10, $32, $28, 0, $2C, $B2, $68, 0, 8, $67, $E, $6C, 2, $44
		dc.b	$40, $D1, $68, 0, 8, $4E, $F9, 0, $20, $3A, $6E, $4E, $F9
		dc.b	0, $20, $3B, $1A, $4A, $B8, $F6, $80, $66, $E, $42, $38, $F7
		dc.b	$44, $42, $38, $F7, $CC, $4E, $F9, 0, $20, $3B, $1A, $4E
		dc.b	$75, $70, 0, $10, $28, 0, $24, $30, $3B, 0, 6, $4E, $FB, 0
		dc.b	2, 0, $A, 0, $1E, 0, $EA, 1, $24, 1, $D8, $53, $28, 0, $32
		dc.b	$67, 2, $4E, $75, $70, $10, $4E, $B9, 0, $20, $24, $48, $54
		dc.b	$28, 0, $24, $4A, $B8, $F6, $80, $66, $1C, $C, $79, 5, 2
		dc.b	0, $FF, $15, 6, $67, $14, $4D, $F8, $D0, 0, $30, $38, $F7
		dc.b	0, 6, $40, 1, $50, $B0, $6E, 0, 8, $65, 2, $4E, $75, $45
		dc.b	$F9, 0, $20, $F6, $EE, $7C, 2, $72, 0, $22, $48, $31, $7C
		dc.b	1, $68, 0, $32, $60, 6, $4E, $B9, 0, $20, $7B, $A, $33, $7C
		dc.b	1, $68, 0, $32, $13, $7C, 0, $3A
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
	incbin	"maps/r31d/chunks.bin"
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

SpikesHV2Gfx:
	incbin	"gfx/spikes_hv2.nem"
	even

KamaKamaSprites1:
	include	"sprites/r3/kama_kama_1.asm"
	even

KamaKamaSprites2:
	include	"sprites/r3/kama_kama_2.asm"

Padding2:
		dc.b	7
		dcb.b	3,8
		dcb.b	3,9
		dcb.b	3,$A
		dcb.b	2,$B
		dcb.b	2,$C
		dc.b	3, 4, 6, 7, 9, $A, $C, $D, $F
		dcb.b	7,$10
		dc.b	5, 6
		dcb.b	2,7
		dcb.b	2,8
		dc.b	9
		dcb.b	2,$A
		dc.b	$B
		dcb.b	2,$C
		dcb.b	2,$D
		dc.b	$E, $F, 6
		dcb.b	3,7
		dcb.b	3,8
		dcb.b	3,9
		dcb.b	4,$A
		dcb.b	3,$B
		dcb.b	6,$C
		dcb.b	6,$D
		dcb.b	9,$E
		dcb.b	$A,$F
		dc.b	$E, $A, 6, 2
		dcb.b	$C,0
		dcb.b	4,$10
		dc.b	$E, $A, 6, 2
		dcb.b	8,0
		dcb.b	8,$10
		dc.b	$E, $A, 6, 2
		dcb.b	4,0
		dcb.b	$C,$10
		dc.b	$E, $A, 6, 2, $B, $C, $D, $E
		dcb.b	2,$F
		dcb.b	$A,$10
		dcb.b	$40,0
		dcb.b	$50,$10
		dcb.b	$1F,0
		dc.b	$10
		dcb.b	$E,0
		dcb.b	2,$10
		dcb.b	$D,0
		dcb.b	3,$10
		dcb.b	$C,0
		dcb.b	4,$10
		dcb.b	$B,0
		dcb.b	5,$10
		dcb.b	$A,0
		dcb.b	6,$10
		dcb.b	9,0
		dcb.b	7,$10
		dcb.b	8,0
		dcb.b	8,$10
		dcb.b	7,0
		dcb.b	9,$10
		dcb.b	6,0
		dcb.b	$A,$10
		dcb.b	5,0
		dcb.b	$B,$10
		dcb.b	4,0
		dcb.b	$C,$10
		dcb.b	3,0
		dcb.b	$D,$10
		dcb.b	2,0
		dcb.b	$E,$10
		dc.b	0
		dcb.b	$F,$10
		dcb.b	$E,0
		dc.b	8, $10
		dcb.b	$C,0
		dc.b	8
		dcb.b	3,$10
		dcb.b	$A,0
		dc.b	8
		dcb.b	5,$10
		dcb.b	8,0
		dc.b	8
		dcb.b	7,$10
		dcb.b	6,0
		dc.b	8
		dcb.b	9,$10
		dcb.b	4,0
		dc.b	8
		dcb.b	$B,$10
		dcb.b	2,0
		dc.b	8
		dcb.b	$D,$10
		dc.b	8
		dcb.b	$F,$10
		dcb.b	$C,0
		dc.b	4, 8, $C, $10
		dcb.b	8,0
		dc.b	4, 8, $C
		dcb.b	5,$10
		dcb.b	4,0
		dc.b	4, 8, $C
		dcb.b	9,$10
		dc.b	4, 8, $C
		dcb.b	$D,$10
		dcb.b	8,0
		dc.b	2, 4, 6, 8, $A, $C, $E, $10, 2, 4, 6, 8, $A, $C, $E
		dcb.b	9,$10
		dcb.b	2,9
		dcb.b	2,$A
		dcb.b	2,$B
		dcb.b	2,$C
		dcb.b	2,$D
		dcb.b	2,$E
		dcb.b	2,$F
		dcb.b	2,$10
		dcb.b	2,1
		dcb.b	2,2
		dcb.b	2,3
		dcb.b	2,4
		dcb.b	2,5
		dcb.b	2,6
		dcb.b	2,7
		dcb.b	2,8
		dcb.b	4,$D
		dcb.b	4,$E
		dcb.b	4,$F
		dcb.b	4,$10
		dcb.b	4,9
		dcb.b	4,$A
		dcb.b	4,$B
		dcb.b	4,$C
		dcb.b	4,5
		dcb.b	4,6
		dcb.b	4,7
		dcb.b	4,8
		dcb.b	4,1
		dcb.b	4,2
		dcb.b	4,3
		dcb.b	4,4
		dcb.b	$E,0
		dc.b	6, $10
		dcb.b	$A,0
		dc.b	3, 6, $A, $F
		dcb.b	2,$10
		dcb.b	3,0
		dc.b	2, 4, 6, 8, $A, $D
		dcb.b	7,$10
		dc.b	$D, $F
		dcb.b	$E,$10
		dcb.b	7,0
		dc.b	1, 2, 3, 4, 6, 7, 8, $A, $B, $A
		dcb.b	2,$B
		dc.b	$C, $D, $F
		dcb.b	$A,$10
		dcb.b	5,0
		dc.b	3
		dcb.b	$A,$10
		dc.b	0, 1, 8
		dcb.b	$D,$10
		dc.b	$B
		dcb.b	$F,$10
		dcb.b	$E,0
		dc.b	2, 6
		dcb.b	$A,0
		dc.b	3, 6, $A, $E
		dcb.b	2,$10
		dcb.b	5,0
		dc.b	1
		dcb.b	2,2
		dc.b	3, 4
		dcb.b	2,5
		dc.b	6, 7, 8, 9, $E
		dcb.b	2,$F
		dcb.b	$D,$10
		dc.b	2
		dcb.b	5,3
		dcb.b	4,4
		dcb.b	3,5
		dcb.b	3,6
		dcb.b	3,0
		dc.b	4, 8
		dcb.b	$B,$10
		dcb.b	$B,0
		dc.b	3
		dcb.b	4,$10
		dcb.b	$A,0
		dc.b	3, 6, 9, $C
		dcb.b	2,$10
		dcb.b	$F,0
		dc.b	4, 8, $C
		dcb.b	$E,$10
		dcb.b	3,7
		dcb.b	3,8
		dcb.b	2,9
		dcb.b	2,$A
		dcb.b	2,$B
		dcb.b	2,$C
		dcb.b	2,$D
		dcb.b	$A,1
		dcb.b	6,2
		dcb.b	$E,$10
		dc.b	$F2, $F8
		dcb.b	8,$10
		dc.b	$F2, $F4, $F6, $F8, $FA, $FE
		dcb.b	2,0
		dc.b	$F6, $F7, $F8, $FA, $FB, $FD, $FE
		dcb.b	9,0
		dc.b	$F9
		dcb.b	2,$FA
		dc.b	$FB
		dcb.b	2,$FC
		dcb.b	2,$FD
		dc.b	$FE, $FF
		dcb.b	6,0
		dcb.b	2,$F2
		dcb.b	3,$F3
		dcb.b	3,$F4
		dcb.b	2,$F5
		dcb.b	2,$F6
		dcb.b	2,$F7
		dcb.b	2,$F8
		dcb.b	8,$10
		dcb.b	6,$F1
		dcb.b	2,$F2
		dcb.b	$B,$10
		dc.b	$F1, $F2, $F3, $F4, $F5, 1, 2, 3, 4, 5, 6, 7, 8, 9, $A, $B
		dc.b	$C, $D, $E, $F, $10
		dcb.b	5,0
		dcb.b	5,1
		dcb.b	6,2
		dc.b	$F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
		dcb.b	6,0
		dc.b	9, $A, $B, $C, $D, $E, $F
		dcb.b	9,$10
		dcb.b	8,0
		dc.b	1, 2, 3, 4, 5, 6, 7, 8
		dcb.b	$B,0
		dc.b	1, 3, 6, $A, $10, 5, 6
		dcb.b	2,7
		dc.b	8, 9, $A, $B, $C, $E, $F
		dcb.b	5,$10
		dcb.b	6,1
		dcb.b	4,2
		dcb.b	3,3
		dcb.b	2,4
		dc.b	5
		dcb.b	8,$10
		dcb.b	8,0
		dcb.b	4,1
		dcb.b	3,2
		dcb.b	2,3
		dc.b	4, 5, 6, 7, 9, $C, $10
		dcb.b	$10,0
		dcb.b	$10,$F8
		dcb.b	$10,8
		dc.b	$10
		dcb.b	$17,0
		dc.b	3, 5, 7, 9, $A, $B, $C, $D
		dcb.b	3,0
		dc.b	$FF, $FE, $FD
		dcb.b	2,$FC
		dcb.b	2,$FB
		dcb.b	2,$FA
		dcb.b	2,$F9
		dcb.b	2,$F8
		dcb.b	$20,$10
		dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $E, $F
		dcb.b	5,$10
		dcb.b	4,0
		dc.b	1, 2, 4, 5, 7, 8, 9, $B, $C, $D, $F, $10, 6, $A, $D, $F
		dcb.b	$C,$10
		dc.b	$F5, $F2, $F1
		dcb.b	$D,$10
		dcb.b	9,0
		dc.b	2, 6, 8, $A, $C, $E, $10
		dcb.b	7,0
		dc.b	8, $E
		dcb.b	7,$10
		dcb.b	$E,0
		dc.b	2, 8
		dcb.b	8,0
		dc.b	2, 4, 6, 8, $C, $E
		dcb.b	2,$10
		dcb.b	$F,0
		dc.b	8
		dcb.b	$D,0
		dc.b	8
		dcb.b	2,$10
		dcb.b	$A,0
		dc.b	1, 3, 5, 8, $C, $10
		dcb.b	9,0
		dcb.b	7,$10
		dcb.b	$A,0
		dc.b	4, 8
		dcb.b	4,$10
		dcb.b	7,0
		dc.b	8
		dcb.b	8,$10
		dcb.b	2,$E
		dcb.b	6,$F
		dcb.b	8,$10
		dcb.b	2,8
		dcb.b	2,9
		dcb.b	2,$A
		dcb.b	2,$B
		dcb.b	3,$C
		dcb.b	3,$D
		dcb.b	2,$E
		dcb.b	6,0
		dc.b	1, 2
		dcb.b	2,3
		dc.b	4
		dcb.b	2,5
		dc.b	6
		dcb.b	2,7
		dc.b	$B, $C, $D, $E, $F
		dcb.b	$B,$10
		dcb.b	9,0
		dc.b	2, 3, 5, 6, 8, 9, $A
		dcb.b	2,0
		dc.b	2, 5, 8, $A, $C, $E
		dcb.b	8,$10
		dc.b	8, $E
		dcb.b	$E,$10
		dcb.b	6,0
		dc.b	4, 8
		dcb.b	8,$10
		dc.b	8
		dcb.b	$F,0
		dcb.b	2,$10
		dcb.b	$10,0
		dc.b	4, 7, $A, $C, $E
		dcb.b	9,$10
		dcb.b	8,0
		dc.b	8, $C
		dcb.b	6,$10
		dc.b	$F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
		dcb.b	8,0
		dc.b	$10, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB
		dc.b	$FC, $FD, $FE, $FF, $C
		dcb.b	2,$D
		dcb.b	3,$E
		dcb.b	4,$F
		dcb.b	6,$10
		dcb.b	4,0
		dc.b	1, 2, 4, 5, 6, 7, 8, 9
		dcb.b	2,$A
		dc.b	$B, $C, 6, $A, $D, $F
		dcb.b	$C,$10
		dcb.b	5,$F
		dcb.b	$B,$10
		dcb.b	3,$B
		dcb.b	3,$C
		dcb.b	4,$D
		dcb.b	5,$E
		dc.b	$F
		dcb.b	2,4
		dcb.b	2,5
		dcb.b	2,6
		dcb.b	2,7
		dcb.b	2,8
		dcb.b	3,9
		dcb.b	3,$A
		dcb.b	$B,0
		dcb.b	2,1
		dcb.b	2,2
		dc.b	3, 8, 9, $A, $B
		dcb.b	2,$C
		dc.b	$D, $E
		dcb.b	2,$F
		dcb.b	6,$10
		dc.b	6, 8, 9, $A, $C, $D, $E, $F
		dcb.b	8,$10
		dcb.b	$D,0
		dc.b	1, 3, 5
		dcb.b	6,0
		dc.b	3, 6, 8, $A, $C, $E
		dcb.b	4,$10
		dc.b	0, 1, 6, $A, $D
		dcb.b	$B,$10
		dcb.b	$D,0
		dc.b	2, 8, $10
		dcb.b	7,0
		dc.b	2, 4, 6, 8, $B, $E
		dcb.b	3,$10
		dc.b	7, 8, $A, $B, $D, $E
		dcb.b	$A,$10
		dcb.b	$A,0
		dc.b	1, 2, 3, 4, 5, 6
		dcb.b	2,$A
		dc.b	$B
		dcb.b	2,$C
		dc.b	$D
		dcb.b	2,$E
		dc.b	$F
		dcb.b	7,$10
		dcb.b	2,3
		dcb.b	3,4
		dcb.b	3,5
		dcb.b	2,6
		dcb.b	2,7
		dcb.b	2,8
		dcb.b	2,9
		dcb.b	8,1
		dcb.b	6,2
		dcb.b	2,3
		dcb.b	8,0
		dc.b	2, 4, 6, 8, $B, $E
		dcb.b	2,$10
		dc.b	3, 6, 8, 9, $A, $B, $C, $D, $E, $F
		dcb.b	6,$10
		dcb.b	8,$F8
		dcb.b	8,0
		dc.b	$FE, $FC, $FA, $F8, $F6, $F4, $F2
		dcb.b	9,$10
		dcb.b	8,0
		dc.b	$FE, $FC, $FA, $F8, $F6, $F4, $F2
		dcb.b	2,$10
		dc.b	$E, $C, $A, 8, 6, 4, 2
		dcb.b	8,0
		dcb.b	9,$10
		dc.b	$E, $C, $A, 8, 6, 4, 2
		dcb.b	8,8
		dcb.b	8,$10
		dcb.b	$A,0
		dc.b	1, 4, 7, $A, $D, $10
		dcb.b	5,0
		dc.b	2, 5, 8, $B, $E
		dcb.b	6,$10
		dc.b	3, 6, 9, $C, $F
		dcb.b	$B,$10
		dcb.b	$C,0
		dc.b	1, 6, $B, $10
		dcb.b	9,0
		dc.b	2, 7, $C
		dcb.b	4,$10
		dcb.b	6,0
		dc.b	3, 8, $D
		dcb.b	7,$10
		dcb.b	3,0
		dc.b	4, 9, $E
		dcb.b	$A,$10
		dc.b	5, $A, $F
		dcb.b	$D,$10
		dcb.b	$B,0
		dc.b	1, 4, 8, $B, $10
		dcb.b	3,0
		dc.b	1, 3, 5, 6, 8, $A, $C, $F
		dcb.b	5,$10
		dcb.b	8,0
		dc.b	1, 3, 5, 7, 9, $B, $D, $10, 7, 9, $A, $B, $C, $D, $F
		dcb.b	9,$10
		dc.b	$B, $D, $E, $F
		dcb.b	$C,$10
		dc.b	9
		dcb.b	2,$A
		dc.b	$B, $C, $D, $E
		dcb.b	2,$F
		dcb.b	7,$10
		dcb.b	5,0
		dc.b	1
		dcb.b	2,2
		dc.b	3, 4
		dcb.b	2,5
		dcb.b	2,6
		dc.b	7, 8
		dcb.b	5,0
		dc.b	1, 2, 4, 5, 7, 8, $A, $B, $D, $E, $10, 9, $B, $C, $E, $F
		dcb.b	$B,$10
		dcb.b	$B,0
		dc.b	2, 3, 5, 6, 8, 1, 3, 4, 6, 7, 9, $A, $C, $D, $F
		dcb.b	6,$10
		dcb.b	2,$C
		dcb.b	4,$D
		dcb.b	6,$E
		dcb.b	4,$F
		dcb.b	2,7
		dcb.b	2,8
		dcb.b	3,9
		dcb.b	3,$A
		dcb.b	4,$B
		dcb.b	2,$C
		dcb.b	3,0
		dc.b	1
		dcb.b	2,2
		dcb.b	2,3
		dcb.b	3,4
		dcb.b	2,5
		dcb.b	2,6
		dc.b	7, $F
		dcb.b	$F,$10
		dcb.b	2,5
		dc.b	6, 7
		dcb.b	2,8
		dc.b	9
		dcb.b	2,$A
		dc.b	$B
		dcb.b	2,$C
		dc.b	$D
		dcb.b	2,$E
		dc.b	$F
		dcb.b	$C,0
		dc.b	1, 2, 3, 4, 6, 7, 8, 9, $A, $B, $C, $D, $E, $F
		dcb.b	6,$10
		dc.b	0, 1, 3, 4, 6, 7, 9, $A, $C, $D, $E, $F
		dcb.b	4,$10
		dcb.b	9,0
		dc.b	1, 3, 5, 8, $A, $C, $D
		dcb.b	4,0
		dc.b	2, 6, 9, $C, $E
		dcb.b	7,$10
		dc.b	0, 4, $A, $E
		dcb.b	$C,$10
		dcb.b	8,0
		dcb.b	6,1
		dcb.b	2,2
		dcb.b	$C,$10
		dc.b	$F1, $F3, $F6, $FA
		dcb.b	6,$10
		dcb.b	4,$F1
		dcb.b	3,$F2
		dcb.b	2,$F3
		dcb.b	2,$F4
		dc.b	$F5
		dcb.b	2,$F6
		dc.b	$F7, $F8, $F9, $FA, $FB, $FC, $FE, $FF
		dcb.b	7,0
		dcb.b	4,1
		dcb.b	4,2
		dcb.b	3,3
		dcb.b	3,4
		dcb.b	2,5
		dcb.b	2,6
		dc.b	7
		dcb.b	2,8
		dc.b	9, $A, $B, $C, $D, $E, $F, $10
		dcb.b	7,$F1
		dcb.b	9,$10
		dcb.b	$B,0
		dcb.b	4,$FF
		dc.b	$FE
		dcb.b	3,2
		dcb.b	3,3
		dcb.b	3,4
		dcb.b	2,5
		dcb.b	2,6
		dc.b	7
		dcb.b	2,8
		dcb.b	5,0
		dc.b	4, 8, $C
		dcb.b	8,$10
		dc.b	0, 4, 8, $C
		dcb.b	$C,$10
		dc.b	6, 7, 8, $A, $B, $D, $E
		dcb.b	9,$10
		dcb.b	3,2
		dcb.b	2,3
		dcb.b	3,4
		dcb.b	2,5
		dcb.b	2,6
		dcb.b	2,7
		dcb.b	2,8
		dcb.b	8,0
		dcb.b	2,1
		dc.b	2
		dcb.b	2,3
		dcb.b	2,4
		dc.b	5
		dcb.b	3,$A
		dcb.b	3,$B
		dcb.b	3,$C
		dcb.b	2,$D
		dcb.b	2,$E
		dc.b	$F
		dcb.b	2,$10
		dc.b	1, 2, 3, 4, 5, 6, 7, 8
		dcb.b	2,9
		dc.b	$A
		dcb.b	2,$B
		dcb.b	2,$C
		dc.b	$D
		dcb.b	3,8
		dcb.b	4,9
		dcb.b	4,$A
		dcb.b	3,$B
		dcb.b	2,$C
		dcb.b	2,9
		dcb.b	2,$A
		dcb.b	2,$B
		dcb.b	2,$C
		dc.b	$D, $E, $F
		dcb.b	5,$10
		dc.b	3, 6, 8, 9, $A
		dcb.b	2,$B
		dc.b	$C
		dcb.b	2,$D
		dcb.b	2,$E
		dcb.b	2,$F
		dcb.b	2,$10
		dc.b	$C
		dcb.b	2,$D
		dcb.b	2,$E
		dc.b	$F
		dcb.b	$A,$10
		dc.b	$FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6, $F5, $F4
		dc.b	$F3, $F2, $F1
		dcb.b	2,$10
		dc.b	$F1, $F2, $F3, $F4, $F5, $6A, $F7
		dcb.b	2,$F8
		dc.b	$F9
		dcb.b	2,$FA
		dcb.b	2,$FB
		dcb.b	3,$FC
		dcb.b	3,$FD
		dcb.b	4,$FE
		dcb.b	$17,$FF
		dcb.b	8,8
		dc.b	9, $A, $B, $C, $D, $E, $F, $10, $F1, $F2, $F3, $F4, $F5, $F6
		dc.b	$F7
		dcb.b	9,$F8
		dc.b	$F9, $FA, $FB, $FC, $FD, $FE, $FF
		dcb.b	9,0
		dcb.b	2,1
		dc.b	2
		dcb.b	2,3
		dcb.b	2,4
		dcb.b	2,5
		dcb.b	7,6
		dcb.b	7,7
		dcb.b	4,8
		dcb.b	4,9
		dc.b	$A, 4, 7, 9, $A, $B, $C, $D
		dcb.b	2,$E
		dcb.b	3,$F
		dcb.b	4,$10
		dcb.b	2,9
		dc.b	$A
		dcb.b	2,$B
		dcb.b	2,$C
		dcb.b	2,$D
		dcb.b	7,$E
		dc.b	$10, $F, $E, $D, $C, $B, $A, 9, 8, 7, 6, 5, 4, 3, 2, 1, $B
		dc.b	$E
		dcb.b	$1A,$10
		dc.b	$F, 7
		dcb.b	5,0
		dc.b	1, 3, 5, 6, 8, 9, $A, $B, $C, $D, $E, $F, $10, 7, $B, $E
		dcb.b	$D,$10
		dc.b	$F9, $F5, $F2
		dcb.b	$D,$10
		dcb.b	3,0
		dc.b	$FF, $FD, $FB, $FA, $F8, $F7, $F6, $F5, $F4, $F3, $F2, $F1
		dc.b	$10, $FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8, $F6, $F5, $F3
		dc.b	$F1
		dcb.b	4,$10
		dcb.b	$C,0
		dc.b	$FE, $FB, $F7, $10
		dcb.b	$C,0
		dc.b	2, 5, 9, $10, 1, 2, 3, 4, 5, 6, 7, 8, $A, $B, $D, $F
		dcb.b	4,$10
		dcb.b	3,0
		dc.b	2, 5, 7, 8, $A, $C, $D, $E, $F
		dcb.b	4,$10
		dc.b	7, $C
		dcb.b	$E,$10
		dc.b	4, 5, 6, 7
		dcb.b	2,8
		dcb.b	2,9
		dc.b	$A
		dcb.b	2,$B
		dcb.b	3,$C
		dcb.b	2,$D
		dcb.b	4,$E
		dcb.b	5,$F
		dcb.b	7,$10
		dcb.b	2,$FF
		dc.b	$FE
		dcb.b	2,$FD
		dcb.b	2,$FC
		dcb.b	3,$FB
		dcb.b	3,$FA
		dcb.b	3,$F9
		dcb.b	9,$10
		dc.b	$F, 8, 4
		dcb.b	4,0
		dcb.b	$D,$10
		dc.b	$D, $A, 8, 6, 4, 2
		dcb.b	$D,0
		dcb.b	4,$10
		dc.b	$E, $D, $B, $A, 8, 7, 6, 5, 3, 2, 1, 0, $F, $E, $D
		dcb.b	2,$C
		dc.b	$B, $A, 9
		dcb.b	2,8
		dc.b	7
		dcb.b	2,6
		dc.b	5
		dcb.b	2,4
		dcb.b	2,3
		dcb.b	2,2
		dcb.b	2,1
		dcb.b	$A,0
		dcb.b	8,$10
		dcb.b	2,$F
		dcb.b	3,$E
		dcb.b	3,$D
		dcb.b	4,$C
		dcb.b	4,$B
		dcb.b	7,$A
		dcb.b	9,9
		dcb.b	8,8
		dc.b	0, $FD, $FA, $F7, $F5, $F3, $F2
		dcb.b	9,$10
		dcb.b	8,0
		dc.b	$FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8
		dcb.b	2,$F7
		dc.b	$F6
		dcb.b	2,$F5
		dcb.b	2,$F4
		dcb.b	3,$F3
		dcb.b	3,$F2
		dcb.b	3,$F1
		dcb.b	5,0
		dc.b	$FD, $F8, $F3
		dcb.b	8,$10
		dcb.b	8,0
		dc.b	$FE, $FA, $F6, $F2
		dcb.b	4,$10
		dcb.b	$C,0
		dc.b	$FE, $FB, $F8, $F5, 0, $FF, $FC, $F9, $F6, $F4, $F2
		dcb.b	9,$10
		dc.b	3, 4, 5, 7, 8, 9, $B, $C, $D, $F
		dcb.b	6,$10
		dcb.b	$B,0
		dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $D, $F
		dcb.b	$A,$10
		dcb.b	7,0
		dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $D, $F
		dcb.b	$E,$10
		dcb.b	3,0
		dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $D, $F
		dcb.b	2,$10
		dcb.b	4,0
		dc.b	2, 4, 7, $A, $D
		dcb.b	7,$10
		dc.b	7
		dcb.b	2,8
		dc.b	9
		dcb.b	2,$A
		dc.b	$B
		dcb.b	2,$C
		dc.b	$D
		dcb.b	2,$E
		dc.b	$F
		dcb.b	3,$10
		dc.b	0, 1, 2, 4, 6, 7, 9, $A, $C, $E, $F
		dcb.b	5,$10
		dcb.b	5,0
		dc.b	2, 6, 9, $C, $F
		dcb.b	6,$10
		dcb.b	2,0
		dc.b	3, 9, $F
		dcb.b	$B,$10
		dc.b	0, $A
		dcb.b	$E,$10
		dcb.b	2,0
		dcb.b	4,$FF
		dcb.b	4,$FE
		dcb.b	4,$FD
		dcb.b	4,$FC
		dcb.b	4,$FB
		dcb.b	4,$FA
		dcb.b	4,$F9
		dcb.b	4,$F8
		dcb.b	4,$F7
		dcb.b	4,$F6
		dcb.b	4,$F5
		dcb.b	4,$F4
		dcb.b	4,$F3
		dcb.b	4,$F2
		dcb.b	4,$F1
		dcb.b	2,$10
		dc.b	$A, $C, $D, $E, $F
		dcb.b	$B,$10
		dcb.b	$40,0
		dcb.b	$50,$10
		dcb.b	2,0
		dcb.b	8,$51
		dc.b	0
		dcb.b	9,$51
		dc.b	$40
		dcb.b	$F,$51
		dc.b	$18
		dcb.b	$D,$51
		dc.b	$39, $3A, $3B, $28
		dcb.b	6,$51
		dc.b	$24, $25, $26, $27, $50, $2F, $30, $37
		dcb.b	6,$51
		dc.b	$29, $3E, $31, $51, $38, $51, $50, $3F, $3C, $51, $3D, $3E
		dc.b	$38, $51, $37
		dcb.b	2,$51
		dc.b	$3D, $31, $51, $50, $3F, $3C, $39, $3A, $3B, $24, $25, $26
		dc.b	$27, $28, $29, $50, $51, $2F, $30
		dcb.b	8,$51
		dc.b	$38, $31
		dcb.b	4,$51
		dc.b	$37, $2F, $30, $28, $29, $24, $25, $26, $27, $51, $17, $51
		dc.b	$55, $2F, $28, $29, $26, $27, $51, $11, $19, $1A, $1B, $4F
		dc.b	$1F, $1E, $3D, $3E, $4E, $1D, 0, $1C, $1D, $1C, $1D, 0, $51
		dc.b	$16, $3E, $17, 0
		dcb.b	4,$51
		dcb.b	7,0
		dc.b	$51, $1C, $1D, $51
		dcb.b	$A,0
		dcb.b	$C,$51
		dcb.b	8,0
		dcb.b	2,$51
		dcb.b	3,0
		dc.b	$51
		dcb.b	2,0
		dcb.b	3,$51
		dcb.b	3,0
		dc.b	$50
		dcb.b	3,0
		dcb.b	2,$51
		dc.b	$1C, $1D, $1C, $1D
		dcb.b	4,0
		dcb.b	2,$51
		dc.b	$1A, $16, $17
		dcb.b	7,0
		dcb.b	3,$51
		dcb.b	$E,0
		dcb.b	2,$51
		dcb.b	$D0,0
		dcb.b	3,$51
		dc.b	0
		dcb.b	2,$51
		dcb.b	7,0
		dcb.b	$A,$51
		dcb.b	$B,0
		dcb.b	$B,$51
		dc.b	$1F, $1E
		dcb.b	6,$51
		dcb.b	7,0
		dcb.b	3,$51
		dc.b	0, $51
		dcb.b	2,0
		dcb.b	2,$51
		dcb.b	3,0
		dcb.b	2,$51
		dcb.b	3,0
		dc.b	$51
		dcb.b	9,0
		dcb.b	$12,$51
		dc.b	$27, $50
		dcb.b	$A,$51
		dc.b	$50
		dcb.b	3,$51
		dc.b	$38, $31, $37, $2F, $30, $28, $29, $24, $25, $26, $27, $51
		dc.b	$55, $11, $19, $1A, $4F
		dcb.b	2,$1C
		dc.b	$1D, 0, $16, $17
		dcb.b	3,$51
		dcb.b	3,0
		dc.b	$50, $1C, $1D, $1C, $1D, $1A, $16, $17
		dcb.b	2,0
		dcb.b	$D,$51
		dc.b	$1C, $1D
		dcb.b	2,$51
		dc.b	0, $51
		dcb.b	2,0
		dcb.b	4,$51
		dcb.b	$1A,0
		dcb.b	3,$51
		dcb.b	$6E,0
		dc.b	$48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2, $52, 3, $74
		dc.b	3, $74, 3, $78, 3, $78, 3, $78, 0, $48, 1, $6A, 1, $82, 1
		dc.b	$86, 3, $74, 2, $4E, 2, $52, 3, $74, 3, $74, 3, $78, 3, $78
		dc.b	3, $78, 0, $48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2
		dc.b	$52, 3, $74, 3, $74, 3, $78, 3, $78, 3, $78, $2F, 5
		dcb.b	$A,0
		dc.b	$15, 8
		dcb.b	2,0
		dc.b	2, $5F
		dcb.b	$2A,0
		dc.b	$15, $16
		dcb.b	3,0
		dc.b	$1A, 2
		dcb.b	6,0
		dc.b	3, 8
		dcb.b	2,0
		dc.b	$60, 5, 8
		dcb.b	$13,0
		dc.b	2, $24, 0, 4, 7, $C, $5F, 0, 2, 5, 8, 0, $2C, 0, $1B, $1F
		dc.b	$59, $5A, $37, 0, $2C, $60, 5, 8
		dcb.b	2,0
		dc.b	$2D, $2E, $16, 2, $1A, 0, 2, 0, $5F
		dcb.b	2,0
		dc.b	$24, 2, 0, $24, $1A
		dcb.b	5,0
		dc.b	$60, 1, $60, 2, 5, 8, $D, $20
		dcb.b	2,$12
		dc.b	6, $16, $24, $28, 0, $1C, $21, $24, $59, $5A, $24, $28, $2D
		dc.b	$2E, $16, 2, $2C, $22, $24, $59, $5A, $34
		dcb.b	2,0
		dc.b	2, 0, $2C
		dcb.b	5,0
		dc.b	$1B, 0, 2
		dcb.b	3,0
		dcb.b	4,3
		dc.b	6, 9, $E, $11
		dcb.b	2,$13
		dc.b	$15, $17
		dcb.b	2,$18
		dc.b	$19, $5B, $21, $25, $26, $27, $29, $2A, $2F, $30, 2, $24
		dc.b	$28
		dcb.b	3,$18
		dc.b	$20, $1D, 2
		dcb.b	3,0
		dc.b	$28, 0, $5F, 2, 0, $58, $5B
		dcb.b	5,0
		dcb.b	5,$B
		dc.b	$A, $F, $10, $14, $53
		dcb.b	2,$14
		dc.b	$53, $14, $56, $1E, $A
		dcb.b	3,$23
		dc.b	$31, $2B, $B, $1E, $64, $33, $32, $14, $56, $14, $56, $1E
		dcb.b	4,$35
		dc.b	$36, $39, $33
		dcb.b	2,$35
		dc.b	$5C, $5D, $39, $3A, $61, $3A, $61, 6, 2, $65, $68, $65, $68
		dc.b	$65, $68, $65, $67, $69, $6A, $6B
		dcb.b	2,$69
		dc.b	$6B
		dcb.b	7,$66
		dcb.b	5,0
		dc.b	$20, 5
		dcb.b	$21,0
		dc.b	$E, $2B, $16, $1C, 5, $2B, $16, 2, $37
		dcb.b	$C,0
		dc.b	$21, 3
		dcb.b	4,0
		dc.b	$21, $31, $24
		dcb.b	3,0
		dc.b	$C, $D, 6, $C, $1E, $D, $15, $11, $25, $32, $2B, $B, $2D
		dc.b	$B5, $2D, 7, $24, $12, $38, $24, $2D, $26, 8, 5, $2B, $B
		dc.b	$21, $26, $1F, $F
		dcb.b	3,0
		dcb.b	4,$1E
		dc.b	$A, $17
		dcb.b	2,$1E
		dcb.b	2,$C
		dc.b	$D, $19, $11, 8, $17
		dcb.b	8,$1E
		dc.b	$18, $D, 8, $23, $11, $20, $25
		dcb.b	3,$2D
		dcb.b	$10,$1E
		dcb.b	5,0
		dcb.b	2,$1E
		dc.b	$A, $17, $1E, $11, 8, $1D, 9
		dcb.b	2,$1E
		dcb.b	$17,0
		dcb.b	$A,$1E
		dcb.b	5,0
		dc.b	$2F, 5
		dcb.b	$E,0
		dc.b	$2D, $37
		dcb.b	$2C,0
		dc.b	$13, $38, $18, $F
		dcb.b	$23,0
		dc.b	$13, $38, $24, $14, 0, $13, $38, $27, 2, $1A, $26, $1F, $F
		dcb.b	2,0
		dc.b	$14, $21, $2D
		dcb.b	3,0
		dc.b	$13
		dcb.b	2,$33
		dc.b	$10, $24, $2C
		dcb.b	$12,0
		dc.b	$2D, $37, $16, $1B, $23, $25, $1A, 3, 6, $26, $1F
		dcb.b	3,$1E
		dc.b	$20, $25, $B5, $31, $1B, $23, $11
		dcb.b	2,$33
		dc.b	2, $1A
		dcb.b	2,$34
		dc.b	$19, $25, 6, $31, $27, 0, $16, 2, 7, 2, $37
		dcb.b	3,$2D
		dcb.b	2,$3C
		dcb.b	2,$2D
		dcb.b	3,0
		dc.b	$1E, $F, $15
		dcb.b	7,$1E
		dc.b	$20, $1F
		dcb.b	6,$1E
		dc.b	$C, $11, 9
		dcb.b	2,$34
		dc.b	$11
		dcb.b	4,$1E
		dcb.b	$1D,0
		dcb.b	2,$1E
		dc.b	$20, $11, 8, 9, $A, $1D, 9
		dcb.b	6,$1E
		dcb.b	$20,0
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

PocketGfxD:
	incbin	"gfx/r3/pocket_d.nem"
	even

BossBarrierGfx2:
	incbin	"gfx/r3/boss_barrier.nem"
	even

BossDrainBlockGfxD:
	incbin	"gfx/r3/boss_drain_block_d.nem"
	even

BouncePlatformGfxD:
	incbin	"gfx/r3/bounce_platform_d.nem"
	even

GlassBreakGfxD:
	incbin	"gfx/r3/glass_break_d.nem"
	even

SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

BossBarrierGfx:
	incbin	"gfx/r3/boss_barrier.nem"
	even

EggmanGfx:
	incbin	"gfx/r3/eggman.nem"
	even

EggmanEscapeGfx:
	incbin	"gfx/r3/eggman_escape.nem"
	even

AnimalsGfx:
	incbin	"gfx/r3/animals.nem"
	even

BossBombLaunchGfx:
	incbin	"gfx/r3/boss_bomb_launch.nem"
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
	incbin	"maps/r31d/collision.bin"
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
	incbin	"maps/r31d/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r31d/background.bin"
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
	even

StageBlocks:
	incbin	"maps/r31d/blocks.nem"
	even

StageGfx:
	incbin	"maps/r31d/gfx.nem"
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
	include	"Level/Collision Chaos/Data/R31D Padding 3.asm"
