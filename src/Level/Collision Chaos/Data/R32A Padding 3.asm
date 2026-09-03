; ------------------------------------------------------------------------------
; R32A-specific Padding3 prefix; R31C provides the shared suffix.
; Recovered from tracked historical assembly; no proprietary binary is included.
; ------------------------------------------------------------------------------

; +$0000-+$07C3 R32A-specific retained data
; +$07C4-+$2E21 shared R31C Padding3 data
; ------------------------------------------------------------------------------
	dc.b	0
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
	dc.b	1, $F8, 5, 8, $5C, $F8, 0, $12, 0, $50, 0, $8E, 0, $AE, 0
	dc.b	$B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
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
		dc.b	$01, $F8, $05, $08, $5C, $F8

; Complete shared R31C Padding3 suffix.
		include	"Level/Collision Chaos/Data/R31C Padding 3.asm"
