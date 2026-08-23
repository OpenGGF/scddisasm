; ------------------------------------------------------------------------------
; Regional Act 1 Future legacy object routine, animation data, and PLC records.
; The final region is shared with the source-backed Act 1 Past suffix.
; ------------------------------------------------------------------------------

	if REGION=USA
	dc.l	$00202316		; Tail address from the preceding legacy JSR
	else
	dc.l	$00202312
	endif
	lea	$FFFFD000.w,a6
	asr.w	$10(a6)
	lea	.SpawnTypes(pc),a5
	moveq	#0,d0
	move.b	$28(a0),d0
	lsl.w	#3,d0
	adda.w	d0,a5
	lea	.SpawnOffsets(pc),a4
	lea	.SpawnVelocities(pc),a3
	moveq	#5,d6
	movea.w	a0,a1
	bra.b	.InitializeMotion
.SpawnLoop:
	if REGION=USA
	jsr	$2076A0
	else
	jsr	$2076AE
	endif
	bne.b	.AfterSpawn
	move.b	0(a0),0(a1)
	move.b	$24(a0),$24(a1)
	move.w	8(a0),8(a1)
	move.w	$C(a0),$C(a1)
	move.b	1(a0),1(a1)
	move.b	$18(a0),$18(a1)
	move.l	4(a0),4(a1)
	move.w	2(a0),2(a1)
.InitializeMotion:
	move.b	#8,$17(a1)
	move.b	#8,$19(a1)
	move.b	#8,$16(a1)
	move.b	(a5)+,$1A(a1)
	move.w	(a4)+,d0
	move.w	(a4)+,d1
	add.w	d0,8(a1)
	add.w	d1,$C(a1)
	move.l	(a3)+,d0
	move.l	(a3)+,$2E(a1)
	tst.w	$10(a6)
	bpl.b	.KeepDirection
	neg.l	d0
.KeepDirection:
	move.l	d0,$2A(a1)
	dbra	d6,.SpawnLoop
.AfterSpawn:
	addi.l	#$4000,$2E(a0)
	move.l	$2A(a0),d0
	move.l	$2E(a0),d1
	add.l	d0,8(a0)
	add.l	d1,$C(a0)
	lea	$FFFFD000.w,a1
	move.w	$C(a1),d0
	sub.w	$C(a0),d0
	cmpi.w	#$FF20,d0
	ble.b	.KeepObject
	if REGION=USA
	jmp	$2038F6
	else
	jmp	$2038F2
	endif
.KeepObject:
	if REGION=USA
	jmp	$2039A2
	else
	jmp	$20399E
	endif

.AnimationAndOffsetRecords:
	dc.w	$001C, $003B, $005A, $0079, $0098, $00B7, $00D6, $00F5
	dc.w	$0114, $011A, $0120, $0126, $012C, $0132, $06E8, $0500
	dc.w	$29F0, $F805, $0031, $F008, $0500, $29F0, $E805, $002D
	dc.w	$00F8, $0500, $3500, $0805, $002D, $0006, $E805, $0029
	dc.w	$F0F8, $0500, $31F0, $0805, $0029, $F0E8, $0500, $3300
	dc.w	$F805, $002B, $0008, $0500, $3300, $06E8, $0500, $33F0
	dc.w	$F805, $002B, $F008, $0500, $33F0, $E805, $0033, $00F8
	dc.w	$0500, $2B00, $0805, $0033, $0006, $E805, $0033, $F0F8
	dc.w	$0500, $2BF0, $0805, $0033, $F0E8, $0500, $2D00, $F805
	dc.w	$0035, $0008, $0500, $2D00, $06E8, $0500, $31F0, $F805
	dc.w	$0029, $F008, $0500, $31F0, $E805, $0035, $00F8, $0500
	dc.w	$2D00, $0805, $0035, $0006, $E805, $0031, $F0F8, $0500
	dc.w	$29F0, $0805, $0031, $F0E8, $0500, $2B00, $F805, $0033
	dc.w	$0008, $0500, $2B00, $06E8, $0500, $2BF0, $F805, $0033
	dc.w	$F008, $0500, $2BF0, $E805, $002B, $00F8, $0500, $3300
	dc.w	$0805, $002B, $0006, $E805, $002B, $F0F8, $0500, $33F0
	dc.w	$0805, $002B, $F0E8, $0500, $3500, $F805, $002D, $0008
	dc.w	$0500, $3500, $01F8, $0500, $29F8, $01F8, $0500, $31F8
	dc.w	$01F8, $0500, $33F8, $01F8, $0500, $2BF8, $01F8, $0500
	dc.w	$2DF8, $01F8, $0500, $35F8
.SpawnTypes:
	dc.w	$0809, $080C, $0D0C, $0000
	dc.w	$0809, $080A, $0B0A, $0000, $0A0B, $0A0A, $0B0A, $0000
	dc.w	$0A0B, $0A0C, $0D0C, $0000, $0908, $090D, $0C0D, $0000
	dc.w	$0908, $090B, $0A0B, $0000, $0B0A, $0B0B, $0A0B, $0000
	dc.w	$0B0A, $0B0D, $0C0D, $0000
.SpawnOffsets:
	dc.w	$FFF8, $FFF0, $0000, $0010
	dc.w	$0000, $0020, $0010, $0000, $0010, $0010, $0010, $0020
.SpawnVelocities:
	dc.w	$FFFD, $097C, $FFFE, $B750, $FFFC, $25EE, $0000, $0000
	dc.w	$FFFD, $097C, $0001, $48B0, $FFFD, $097C, $FFFE, $4445
	dc.w	$FFFC, $97B5, $0000, $0000, $FFFD, $097C, $0001
	dc.w	$BBBB

	if REGION=USA
	jmp	$206372
	else
	jmp	$206380
	endif
.PLCRecords:
	dc.w	$0323, $CABE, $0223, $BA3A, $0021, $0000, $0081, $0505
	dc.w	$0026, $002E, $008A, $0026, $01C6, $01CE, $00C2, $010C
	dc.w	$013E, $0170, $0184, $01AA, $01BE, $0026, $0026, $0026
	dc.w	$01D6, $008A, $01DE, $0000, $0023, $CABE, $0000, $000E
	dc.w	$0023, $76BA, $6500, $0023, $718C, $6680, $0023, $413C
	dc.w	$6C00, $0023, $6D90, $7A00, $0023, $6982, $9000, $0023
	dc.w	$51C8, $9200, $0023, $6EBA, $97C0, $0023, $8D7C, $9EE0
	dc.w	$0023, $54D4, $A400, $0023, $6856, $AD00, $0023, $56F6
	dc.w	$B500, $0023, $5CFA, $D000, $0023, $2180, $D8C0, $0023
	dc.w	$6B0A, $DAE0, $0023, $61E2, $F5C0, $0008, $0023, $8BD4
	dc.w	$6400, $0023, $707E, $68C0, $0023, $2C96, $6B40, $0023
	dc.w	$7328, $6E40, $0023, $8982, $7020, $0023, $7BE6, $72C0
	dc.w	$0023, $7A02, $7DA0, $0023, $850C, $8060, $0023, $7F34
	dc.w	$87E0, $000B, $0023, $8BD4, $6400, $0023, $707E, $68C0
	dc.w	$0023, $2C96, $6B40, $0023, $7328, $6E40, $0023, $8982
	dc.w	$7020, $0023, $73CE, $73C0, $0023, $B896, $7760, $0023
	dc.w	$6A7C, $7960, $0023, $B908, $7B60, $0023, $7A02, $7DA0
	dc.w	$0023, $F610, $8060, $0023, $7F34, $87E0, $0007, $0023
	dc.w	$8BD4, $6400, $0023, $707E, $68C0, $0023, $7328, $6E40
	dc.w	$0023, $8982, $7020, $0023, $7BE6, $72C0, $0023, $850C
	dc.w	$8060, $0023, $7F34, $87E0, $0023, $2C96, $6B40, $0007
	dc.w	$0023, $8BD4, $6400, $0023, $707E, $68C0, $0023, $7328
	dc.w	$6E40, $0023, $8982, $7020, $0023, $7BE6, $72C0, $0023
	dc.w	$850C, $8060, $0023, $F2AC, $87E0, $0023, $2C96, $6B40
	dc.w	$0002, $0023, $7BE6, $72C0, $0023, $7A02, $7DA0, $0023
	dc.w	$850C, $8060, $0005, $0023, $73CE, $73C0, $0023, $B896
	dc.w	$7760, $0023, $6A7C, $7960, $0023, $B908, $7B60, $0023
	dc.w	$7A02, $7DA0, $0023, $F610, $8060, $0002, $0023, $7BE6
	dc.w	$72C0, $0023, $850C, $8060, $0023, $7F34, $87E0, $0000
	dc.w	$0023, $F2AC, $87E0, $0000, $0023, $8D7C, $9EE0, $0000
	dc.w	$0023, $F45E, $9EE0, $0000, $0023, $3432, $7880, $0002
	dc.w	$0023, $2E56, $8780, $0023, $288C, $9100, $0020
	if REGION=USA
	dc.w	$DB86
	else
	dc.w	$DB94
	endif
	dc.w	$7DE0

	include	"Level/Palmtree Panic/Data/Legacy Data (Act 1 Past).asm"
