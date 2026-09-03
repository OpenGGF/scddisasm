; ------------------------------------------------------------------------------
; R32B source-level padding 3
; Recovered from tracked historical assembly; no proprietary binary is included.
; ------------------------------------------------------------------------------
; +$0000-+$1205 retained tail of the shared R12C Nemesis graphics stream
; +$1206-+$15AB retained legacy animation offset table and records
; +$15AC-+$16AB retained wobble table
; +$16AC-+$1C0B retained legacy animation sequence, mapping offsets, and records
; +$1C0C-+$1DBD retained robot-transport Nemesis stream
; +$1DBE-+$1F6F retained hologram-animals Nemesis stream
; +$1F70-+$236F retained hologram Nemesis stream
; +$2370-+$2379 retained five-word legacy mapping offset table suffix
; +$237A-+$24EB retained legacy mapping/animation records
; +$24EC-+$2537 retained shared trailing mapping/animation records
; +$2538-+$2639 retained shared spin-platform rotation-vector table
;
; This slice begins at offset $1990 of the complete R12C graphics stream.
R32BRetainedR12CGfxNemesisTail:
	incbin	"maps/r12c/gfx.nem", $1990, $1206

	; Shared legacy R72 animation-tail offset table; its first entries precede
	; this retained slice in the complete stream.
R32BRetainedLegacyAnimationOffsets:
	dc.w	$0012, $001A, $0020, $003A, $0054, $006E, $007A, $00B4, $00EE, $0101

	; Legacy animation records follow the retained offset table.
R32BRetainedLegacyAnimationData:
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
	dc.b	0, 0

; Complete retained 256-byte wobble table copy.
R32BRetainedWobbleTable:
	incbin	"data/wobble.bin"

	; Legacy animation sequence and its retained mapping-offset table.
R32BRetainedSecondaryAnimationSequence:
	dc.b	0, 2, 3, 2, 3, $FF
R32BRetainedSecondaryMappingOffsets:
	dc.w	$0008, $001E, $002A, $0036, $04E8

	; Legacy mapping records follow the retained offset words.
R32BRetainedSecondaryMappingData:
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
	dc.b	$55, $61, $40, $59, $B0, $98

; Complete retained robot-transport Nemesis stream.
R32BRetainedRobotTransportNemesis:
	incbin	"gfx/robot_transport_b.nem"


; Complete retained hologram-animals Nemesis stream.
R32BRetainedHologramAnimalsNemesis:
	incbin	"gfx/r5/hologram_animals.nem"


; Complete retained hologram Nemesis stream.
R32BRetainedHologramNemesis:
	incbin	"gfx/hologram.nem"

	; The preceding offset-table entries are outside this retained slice.
R32BRetainedLegacyMappingOffsets:
	dc.w	$00D2, $00EC, $00FC, $010C, $04E8

	; Legacy mapping/animation records follow the retained offset words.
R32BRetainedLegacyMappingData:
	dc.b	$D, 0, $43, $F0, $F8
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
	dc.b	$E, $18, 3, 0

	; Shared mapping/animation records complete the retained $2370-$2537 range.
	include	"Level/Shared Padding3 Mapping Tail.asm"

	; Shared spin-platform rotation-vector pairs complete the retained suffix.
	include	"Level/Shared Padding3 Rotation Vectors.asm"

; ------------------------------------------------------------------------------
