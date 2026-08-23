; -------------------------------------------------------------------------
; Shared discarded R43/R51 compatibility helper and packed legacy tables
; -------------------------------------------------------------------------

R43R51RetainedCompatibilityHelper:
	tst.b	$FF156A
	beq.s	.return
	cmpi.b	#1,$FF152E
	bne.s	.checkSubtype
	tst.b	obj.subtype(a0)
	beq.s	.return

.checkSubtype:
	move.w	obj.x(a0),d5
	move.w	obj.y(a0),d6
	jsr	$203B52
	move.w	d5,obj.x(a0)
	move.w	d6,obj.y(a0)
	move.b	#$18,obj.id(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	.finishCaller
	move.w	#$9E,d0
	jsr	$202598

.finishCaller:
	addq.l	#4,sp

.return:
	rts

R43R51RetainedCompatibilityTail:
	tst.b	obj.subtype(a0)
	bmi.s	.return
	cmpi.b	#2,$FF152E
	bge.s	.checkGlobal
	tst.b	$FF156D
	bne.s	.return
	addq.l	#4,sp
	jmp	$2078A4

.checkGlobal:
	tst.b	$FF156A
	bne.s	.return
	addq.l	#4,sp
	jmp	$203B52

.return:
	rts

	jmp	$2067AC

; Packed legacy records shared by the discarded R43/R51 tail. Their pointer,
; coordinate, and attribute fields remain in original record order.
R43R51RetainedPackedRecords:
	dc.w	$0323, $CE0E, $0223, $C088, $0021, $0000, $0081, $0404
	dc.w	$0026, $002E, $008A, $0026, $008A, $008A, $008A, $008A
	dc.w	$008A, $008A, $008A, $008A, $008A, $008A, $008A, $008A
	dc.w	$00DA, $008A, $00E2, $0000, $0023, $CE0E, $0000, $000E
	dc.w	$0023, $8A42, $5000, $0023, $6128, $6C00, $0023, $919C
	dc.w	$7A00, $0021, $DB10, $8800, $0021, $F1B4, $8A00, $0021
	dc.w	$D6D4, $8D40, $0023, $92A8, $9140, $0021, $D98C, $A140
	dc.w	$0023, $74C0, $A400, $0023, $8842, $AD00, $0023, $76E2
	dc.w	$B500, $0023, $7CE6, $D000, $0023, $416C, $D8C0, $0023
	dc.w	$8EF8, $DAE0, $0023, $81CE, $F5C0, $000C, $0021, $D400
	dc.w	$5F00, $0021, $ED3C, $6200, $0021, $D544, $6600, $0021
	dc.w	$D9DE, $6800, $0021, $E3B0, $6C80, $0021, $E092, $6E00
	dc.w	$0021, $E23E, $7000, $0021, $D4AA, $7400, $0021, $EF08
	dc.w	$7600, $0021, $E8E8, $7A00, $0021, $EA66, $7E00, $0021
	dc.w	$E644, $82C0, $0023, $4C82, $9E40, $0000, $0023, $541E
	dc.w	$7880, $0002, $0023, $4E42, $8780, $0023, $4878, $9100
	dc.w	$0020, $B26E, $7DE0, $0023, $4E42, $8780, $0023, $4878
	dc.w	$9100, $0020, $B280, $7DE0, $0023, $6128, $6C00, $0021
	dc.w	$E292, $7A00, $0021, $F0BE, $82C0, $0023, $FB70, $8800
	dc.w	$0023, $F792, $8D40, $0021, $E39E, $9140, $0023, $F964
	dc.w	$A140, $0023, $74C0, $A400, $0023, $8842, $AD00, $0023
	dc.w	$76E2, $B500, $0023, $7CE6, $D000, $0023, $416C, $D8C0
	dc.w	$0021, $DFEE, $DAE0, $0023, $81CE, $F5C0, $0000, $0023
	dc.w	$541E, $7880, $000D, $0023, $F66A, $5F00, $0023, $FC56
	dc.w	$6000, $0023, $FA3A, $6800, $0023, $F9B6, $6B80, $0021
	dc.w	$EE4C, $6C80, $0021, $EB76, $6D00, $0021, $EA6C, $6E00
	dc.w	$0021, $EC18, $7000, $0023, $F6F8, $7400, $0021, $F7B6
	dc.w	$7600, $0021, $F362, $7A00, $0021, $F4E0, $7E00, $0021
	dc.w	$FA62, $8A00, $0023, $4C82, $9E40, $000D, $0023, $F66A
	dc.w	$5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800, $0023
	dc.w	$F9B6, $6B80, $0021, $EE4C, $6C80, $0021, $EB76, $6D00
	dc.w	$0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023, $F6F8
	dc.w	$7400, $0021, $F7B6, $7600, $0021, $F362, $7A00, $0021
	dc.w	$F4E0, $7E00, $0021, $FBC6, $8A00, $0023, $4C82, $9E40
	dc.w	$0000, $0021, $FA62, $8A00, $0000, $0021, $FBC6, $8A00
	dc.w	$0002, $0023, $4E42, $8780, $0023, $4878, $9100, $0020
	dc.w	$B14A, $7DE0, $0098, $7880, $0002, $0022, $FABC, $8780
	dc.w	$0022, $F4F2

