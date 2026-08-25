; ------------------------------------------------------------------------------
; Shared USA R5 legacy pre-chunk suffix.
;
; R51B/R51C/R51D and R52A/R52B/R52C/R52D all carry this exact 0x48C-byte
; suffix at different Padding1 offsets. R51A carries the same suffix after
; its leading six-byte record. The retained 68000 routines are now labeled
; below; their graphics and mapping tables remain declarative data.
; ------------------------------------------------------------------------------

	if def(USA_R5_SHARED_PRECHUNK_OMIT_RECORD)
	else
USA_R5_SHARED_PRECHUNK_OMIT_RECORD equ 0
	endif

	if USA_R5_SHARED_PRECHUNK_OMIT_RECORD=0
USA_R5_LegacySharedRecord:
	dc.w	$0020, $B9DE, $7DE0
	endif

; Retained object/helper code preceding the shared graphics table.
USA_R5_LegacyObjectHelper:
	add.b	d0,d0
	move.w	$10(a1),$2A(a0)
	move.w	$12(a1),$2E(a0)
	jsr	$2087CA.L
	beq.s	USA_R5_LegacyObjectHelper_Continue
	jsr	$20867C.L
USA_R5_LegacyObjectHelper_Continue:
	bra.s	USA_R5_LegacyBreakBlock
USA_R5_LegacyObjectHelper_Alternate:
	lea	($FFFFD000).w,a1
	jsr	$2087CA.L
	jsr	$203AAA.L
	jmp	$207896.L

USA_R5_LegacyBreakBlock:
	move.w	#$B0,d0
	jsr	$20259C.L
	lea	USA_R5_LegacySpawnOffsets(pc),a6
	lea	USA_R5_LegacySpawnVelocities(pc),a5
	lea	($FFFFD000).w,a1
	move.w	$2A(a0),d0
	move.w	d0,d2
	bpl.s	USA_R5_LegacyBreakBlock_AbsX
	neg.w	d0
USA_R5_LegacyBreakBlock_AbsX:
	move.w	$2E(a0),d1
	bpl.s	USA_R5_LegacyBreakBlock_Compare
	neg.w	d1
USA_R5_LegacyBreakBlock_Compare:
	cmp.w	d1,d0
	blt.s	USA_R5_LegacyBreakBlock_ClearPlayer
	adda.w	#$20,a5
	tst.w	d2
	bpl.s	USA_R5_LegacyBreakBlock_ClearPlayer
	adda.w	#$20,a5
USA_R5_LegacyBreakBlock_ClearPlayer:
	clr.w	$10(a1)
	clr.w	$12(a1)
	clr.w	$14(a1)
	moveq	#3,d6
	movea.w	a0,a1
	bra.s	USA_R5_LegacyBreakBlock_ExistingPiece

USA_R5_LegacyBreakBlock_SpawnPiece:
	jsr	$207860.L
	bne.s	USA_R5_LegacyBreakBlock_Advance
	move.b	$0(a0),$0(a1)
	move.b	$24(a0),$24(a1)
	move.w	$8(a0),$8(a1)
	move.w	$C(a0),$C(a1)
	move.b	$1(a0),$1(a1)
	move.b	$18(a0),$18(a1)
	move.l	$4(a0),$4(a1)
	move.w	$2(a0),$2(a1)
USA_R5_LegacyBreakBlock_ExistingPiece:
	move.b	#$1,$1A(a1)
	move.b	#$8,$17(a1)
	move.b	#$8,$19(a1)
	move.b	#$8,$16(a1)
	move.w	(a6)+,d0
	move.w	(a6)+,d1
	add.w	d0,$8(a1)
	add.w	d1,$C(a1)
	move.l	(a5)+,$2A(a1)
	move.l	(a5)+,$2E(a1)
	dbra	d6,USA_R5_LegacyBreakBlock_SpawnPiece

USA_R5_LegacyBreakBlock_Advance:
	addi.l	#$4000,$2E(a0)
	move.l	$2A(a0),d0
	move.l	$2E(a0),d1
	add.l	d0,$8(a0)
	add.l	d1,$C(a0)
	lea	($FFFFD000).w,a1
	move.w	$C(a1),d0
	sub.w	$C(a0),d0
	cmpi.w	#$FF20,d0
	ble.s	USA_R5_LegacyBreakBlock_Delete
	jmp	$203AAA.L
USA_R5_LegacyBreakBlock_Delete:
	jmp	$203B56.L

; Fixed retained piece table. PC-relative references above land on these
; historical offsets, so the labels preserve the original link layout.
USA_R5_LegacyCodeData:
	dc.b	$00, $04, $00, $19, $04, $F0, $05, $80, $00, $F0, $F0, $05, $80, $00, $00, $00
	dc.b	$05, $80, $00, $F0, $00, $05, $80, $00, $00, $01, $F8, $05, $80, $00, $F8, $00
USA_R5_LegacySpawnOffsets:
	dc.b	$FF, $F8, $FF, $F8, $00, $10, $00, $00, $00, $00, $00, $10, $00, $10, $00, $10
USA_R5_LegacySpawnVelocities:
	dc.b	$FF, $FE, $B7, $50, $FF, $FA, $00, $00, $00, $01, $48, $B0, $FF, $FA, $00, $00
	dc.b	$FF, $FD, $1C, $72, $FF, $FC, $00, $00, $00, $02, $E3, $8E, $FF, $FC, $00, $00
	dc.b	$FF, $FC, $25, $EE, $FF, $FE, $B7, $50, $FF, $FD, $1C, $72, $FF, $FD, $1C, $72
	dc.b	$FF, $FC, $25, $EE, $00, $01, $48, $B0, $FF, $FD, $1C, $72, $00, $02, $E3, $8E
	dc.b	$00, $03, $DA, $12, $FF, $FE, $B7, $50, $00, $02, $E3, $8E, $FF, $FD, $1C, $72
	dc.b	$00, $03, $DA, $12, $00, $01, $48, $B0, $00, $02, $E3, $8E, $00, $02, $E3, $8E

; Retained compatibility routines following the piece table.
USA_R5_LegacyCompatibilityHelper:
	tst.b	$FF156A
	beq.s	USA_R5_LegacyCompatibilityHelper_Return
	cmpi.b	#1,$FF152E
	bne.s	USA_R5_LegacyCompatibilityHelper_CheckSubtype
	tst.b	$28(a0)
	beq.s	USA_R5_LegacyCompatibilityHelper_Return
USA_R5_LegacyCompatibilityHelper_CheckSubtype:
	move.w	$8(a0),d5
	move.w	$C(a0),d6
	jsr	$203B56
	move.w	d5,$8(a0)
	move.w	d6,$C(a0)
	move.b	#$18,$0(a0)
	tst.b	$1(a0)
	bpl.s	USA_R5_LegacyCompatibilityHelper_Finish
	move.w	#$9E,d0
	jsr	$20259C
USA_R5_LegacyCompatibilityHelper_Finish:
	addq.l	#4,sp
USA_R5_LegacyCompatibilityHelper_Return:
	rts

USA_R5_LegacyCompatibilityTail:
	tst.b	$28(a0)
	bmi.s	USA_R5_LegacyCompatibilityTail_Return
	cmpi.b	#2,$FF152E
	bge.s	USA_R5_LegacyCompatibilityTail_CheckGlobal
	tst.b	$FF156D
	bne.s	USA_R5_LegacyCompatibilityTail_Return
	addq.l	#4,sp
	jmp	$207896
USA_R5_LegacyCompatibilityTail_CheckGlobal:
	tst.b	$FF156A
	bne.s	USA_R5_LegacyCompatibilityTail_Return
	addq.l	#4,sp
	jmp	$203B56
USA_R5_LegacyCompatibilityTail_Return:
	rts

USA_R5_LegacyObjectStateJump:
	jmp	$20679E

; Packed legacy graphics/mapping records remain in their original order.
USA_R5_LegacyMappingData:
	dc.b	$03, $23, $CE, $0E, $02, $23, $C0, $88, $00, $21, $00, $00, $00, $81, $04, $04
	dc.b	$00, $26, $00, $2E, $00, $8A, $00, $26, $00, $8A, $00, $8A, $00, $8A, $00, $8A
	dc.b	$00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A
	dc.b	$00, $DA, $00, $8A, $00, $E2, $00, $00, $00, $23, $CE, $0E, $00, $00, $00, $0E
	dc.b	$00, $23, $8A, $42, $50, $00, $00, $23, $61, $28, $6C, $00, $00, $23, $91, $9C
	dc.b	$7A, $00, $00, $21, $DB, $10, $88, $00, $00, $21, $F1, $B4, $8A, $00, $00, $21
	dc.b	$D6, $D4, $8D, $40, $00, $23, $92, $A8, $91, $40, $00, $21, $D9, $8C, $A1, $40
	dc.b	$00, $23, $74, $C0, $A4, $00, $00, $23, $88, $42, $AD, $00, $00, $23, $76, $E2
	dc.b	$B5, $00, $00, $23, $7C, $E6, $D0, $00, $00, $23, $41, $6C, $D8, $C0, $00, $23
	dc.b	$8E, $F8, $DA, $E0, $00, $23, $81, $CE, $F5, $C0, $00, $0C, $00, $21, $D4, $00
	dc.b	$5F, $00, $00, $21, $ED, $3C, $62, $00, $00, $21, $D5, $44, $66, $00, $00, $21
	dc.b	$D9, $DE, $68, $00, $00, $21, $E3, $B0, $6C, $80, $00, $21, $E0, $92, $6E, $00
	dc.b	$00, $21, $E2, $3E, $70, $00, $00, $21, $D4, $AA, $74, $00, $00, $21, $EF, $08
	dc.b	$76, $00, $00, $21, $E8, $E8, $7A, $00, $00, $21, $EA, $66, $7E, $00, $00, $21
	dc.b	$E6, $44, $82, $C0, $00, $23, $4C, $82, $9E, $40, $00, $00, $00, $23, $54, $1E
	dc.b	$78, $80, $00, $02, $00, $23, $4E, $42, $87, $80, $00, $23, $48, $78, $91, $00
	dc.b	$00, $20, $B2, $68, $7D, $E0, $00, $23, $4E, $42, $87, $80, $00, $23, $48, $78
	dc.b	$91, $00, $00, $20, $B2, $7A, $7D, $E0, $00, $23, $61, $28, $6C, $00, $00, $21
	dc.b	$E2, $92, $7A, $00, $00, $21, $F0, $BE, $82, $C0, $00, $23, $FB, $70, $88, $00
	dc.b	$00, $23, $F7, $92, $8D, $40, $00, $21, $E3, $9E, $91, $40, $00, $23, $F9, $64
	dc.b	$A1, $40, $00, $23, $74, $C0, $A4, $00, $00, $23, $88, $42, $AD, $00, $00, $23
	dc.b	$76, $E2, $B5, $00, $00, $23, $7C, $E6, $D0, $00, $00, $23, $41, $6C, $D8, $C0
	dc.b	$00, $21, $DF, $EE, $DA, $E0, $00, $23, $81, $CE, $F5, $C0, $00, $00, $00, $23
	dc.b	$54, $1E, $78, $80, $00, $0D, $00, $23, $F6, $6A, $5F, $00, $00, $23, $FC, $56
	dc.b	$60, $00, $00, $23, $FA, $3A, $68, $00, $00, $23, $F9, $B6, $6B, $80, $00, $21
	dc.b	$EE, $4C, $6C, $80, $00, $21, $EB, $76, $6D, $00, $00, $21, $EA, $6C, $6E, $00
	dc.b	$00, $21, $EC, $18, $70, $00, $00, $23, $F6, $F8, $74, $00, $00, $21, $F7, $B6
	dc.b	$76, $00, $00, $21, $F3, $62, $7A, $00, $00, $21, $F4, $E0, $7E, $00, $00, $21
	dc.b	$FA, $62, $8A, $00, $00, $23, $4C, $82, $9E, $40, $00, $0D, $00, $23, $F6, $6A
	dc.b	$5F, $00, $00, $23, $FC, $56, $60, $00, $00, $23, $FA, $3A, $68, $00, $00, $23
	dc.b	$F9, $B6, $6B, $80, $00, $21, $EE, $4C, $6C, $80, $00, $21, $EB, $76, $6D, $00
	dc.b	$00, $21, $EA, $6C, $6E, $00, $00, $21, $EC, $18, $70, $00, $00, $23, $F6, $F8
	dc.b	$74, $00, $00, $21, $F7, $B6, $76, $00, $00, $21, $F3, $62, $7A, $00, $00, $21
	dc.b	$F4, $E0, $7E, $00, $00, $21, $FB, $C6, $8A, $00, $00, $23, $4C, $82, $9E, $40
	dc.b	$00, $00, $00, $21, $FA, $62, $8A, $00, $00, $00, $00, $21, $FB, $C6, $8A, $00
	dc.b	$00, $02, $00, $23, $4E, $42, $87, $80, $00, $23, $48, $78, $91, $00, $00, $20
	dc.b	$B1, $44, $7D, $E0, $00, $23, $D5, $9E, $78, $C0, $00, $23, $C4, $40, $7D, $20
	dc.b	$00, $23, $D0, $C4, $8B, $A0, $00, $00, $00, $23
