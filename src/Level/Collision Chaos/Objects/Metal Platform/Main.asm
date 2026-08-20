; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos metal platform object
; -------------------------------------------------------------------------

ObjMetalPlatform:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjMetalPlatform_Index(pc,d0.w),d0
	jsr	ObjMetalPlatform_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oVar32(a0),d0
	jmp	CheckObjDespawn2
; End of function ObjMetalPlatform

; -------------------------------------------------------------------------

ObjMetalPlatform_Index:
	dc.w	ObjMetalPlatform_Init-ObjMetalPlatform_Index
	dc.w	ObjMetalPlatform_Main-ObjMetalPlatform_Index

; -------------------------------------------------------------------------

ObjMetalPlatform_Init:
	ori.b	#%00000100,oSprFlags(a0)
	move.w	#$34E,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_MetalPlatform,oMap(a0)
	move.b	#$20,oWidth(a0)
	move.b	#$10,oYRadius(a0)
	move.w	oX(a0),oVar32(a0)
	move.w	oY(a0),oVar30(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjMetalPlatform_Main:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	add.w	d0,d0
	move.w	ObjMetalPlatform_SubtypeIndex(pc,d0.w),d0
	jsr	ObjMetalPlatform_SubtypeIndex(pc,d0.w)
	bsr.w	ObjMetalPlatform_UpdateBob
	move.w	oVar32(a0),d0
	jmp	CheckObjDespawn2

; -------------------------------------------------------------------------

ObjMetalPlatform_Solid:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	TopSolidObject

; -------------------------------------------------------------------------

ObjMetalPlatform_SubtypeIndex:
	dc.w	ObjMetalPlatform_Subtype0-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_Subtype2-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_Subtype2-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_Subtype6-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_Subtype6-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_SubtypeA-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_SubtypeA-ObjMetalPlatform_SubtypeIndex
	dc.w	ObjMetalPlatform_SubtypeA-ObjMetalPlatform_SubtypeIndex

; -------------------------------------------------------------------------

ObjMetalPlatform_UpdateBob:
	tst.b	oVar3F(a0)
	beq.s	.End
	btst	#3,oFlags(a0)
	bne.s	.Raise
	tst.b	oVar3E(a0)
	beq.s	.End
	subq.b	#8,oVar3E(a0)
	bra.s	.Apply

.Raise:
	cmpi.b	#$40,oVar3E(a0)
	beq.s	.End
	addq.b	#8,oVar3E(a0)

.Apply:
	move.b	oVar3E(a0),d0
	jsr	CalcSine
	move.w	#$400,d1
	muls.w	d1,d0
	swap	d0
	add.w	oVar30(a0),d0
	move.w	d0,oY(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_Subtype0:
	move.b	#1,oVar3F(a0)
	jsr	ObjMetalPlatform_Solid
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_Subtype2:
	tst.b	oVar38(a0)
	bne.s	.Move
	move.b	#1,oVar3F(a0)
	lea	ObjMetalPlatform_HorizontalA(pc),a1
	cmpi.b	#1,oSubtype(a0)
	beq.s	.GetMotion
	lea	ObjMetalPlatform_HorizontalB(pc),a1

.GetMotion:
	moveq	#0,d0
	move.b	oVar39(a0),d0
	add.w	d0,d0
	add.w	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,oVar38(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oVar36(a0)
	move.w	(a1)+,oVar34(a0)

.Move:
	jsr	ObjMetalPlatform_Solid
	move.w	oVar34(a0),d0
	move.w	d0,oXVel(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	move.w	oVar36(a0),d0
	add.w	d0,oVar34(a0)
	subq.b	#1,oVar38(a0)
	bne.s	.End
	addq.b	#1,oVar39(a0)
	cmpi.b	#8,oVar39(a0)
	bne.s	ObjMetalPlatform_Subtype2
	move.b	#2,oVar39(a0)
	bra.s	ObjMetalPlatform_Subtype2

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_HorizontalA:
	dc.b	$1C, 0
	dc.w	$300
	dc.b	8, -$30
	dc.w	$300
	dc.b	8, -$30
	dc.w	0
	dc.b	$38, 0
	dc.w	-$300
	dc.b	8, $30
	dc.w	-$300
	dc.b	8, $30
	dc.w	0
	dc.b	$38, 0
	dc.w	$300
	dc.b	8, -$30
	dc.w	$300

ObjMetalPlatform_HorizontalB:
	dc.b	$1C, 0
	dc.w	-$300
	dc.b	8, $30
	dc.w	-$300
	dc.b	8, $30
	dc.w	0
	dc.b	$38, 0
	dc.w	$300
	dc.b	8, -$30
	dc.w	$300
	dc.b	8, -$30
	dc.w	0
	dc.b	$38, 0
	dc.w	-$300
	dc.b	8, $30
	dc.w	-$300

; -------------------------------------------------------------------------

ObjMetalPlatform_Subtype6:
	jsr	ObjMetalPlatform_Solid
	tst.b	oVar38(a0)
	bne.s	.Move
	clr.b	oVar3F(a0)
	lea	ObjMetalPlatform_VerticalA(pc),a1
	cmpi.b	#3,oSubtype(a0)
	beq.s	.GetMotion
	lea	ObjMetalPlatform_VerticalB(pc),a1

.GetMotion:
	moveq	#0,d0
	move.b	oVar39(a0),d0
	add.w	d0,d0
	add.w	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,oVar38(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oVar36(a0)
	move.w	(a1)+,oVar34(a0)

.Move:
	move.w	oVar34(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	move.w	oVar36(a0),d0
	add.w	d0,oVar34(a0)
	move.w	oVar34(a0),d0
	andi.w	#$FF00,d0
	move.w	d0,oYVel(a0)
	subq.b	#1,oVar38(a0)
	bne.s	.End
	addq.b	#1,oVar39(a0)
	cmpi.b	#8,oVar39(a0)
	bne.s	ObjMetalPlatform_Subtype6
	move.b	#2,oVar39(a0)
	bra.s	ObjMetalPlatform_Subtype6

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_VerticalA:
	dc.b	$23, 0
	dc.w	-$200
	dc.b	8, $40
	dc.w	-$200
	dc.b	8, $40
	dc.w	0
	dc.b	$46, 0
	dc.w	$200
	dc.b	8, -$40
	dc.w	$200
	dc.b	8, -$40
	dc.w	0
	dc.b	$46, 0
	dc.w	-$200
	dc.b	8, $40
	dc.w	-$200

ObjMetalPlatform_VerticalB:
	dc.b	$23, 0
	dc.w	$200
	dc.b	8, -$40
	dc.w	$200
	dc.b	8, -$40
	dc.w	0
	dc.b	$46, 0
	dc.w	-$200
	dc.b	8, $40
	dc.w	-$200
	dc.b	8, $40
	dc.w	0
	dc.b	$46, 0
	dc.w	$200
	dc.b	8, -$40
	dc.w	$200

; -------------------------------------------------------------------------

ObjMetalPlatform_SubtypeA:
	jsr	ObjMetalPlatform_Solid
	moveq	#0,d0
	move.b	oVar3A(a0),d0
	move.w	ObjMetalPlatform_SubtypeAIndex(pc,d0.w),d0
	jmp	ObjMetalPlatform_SubtypeAIndex(pc,d0.w)

; -------------------------------------------------------------------------

ObjMetalPlatform_SubtypeAIndex:
	dc.w	ObjMetalPlatform_SubtypeA_Init-ObjMetalPlatform_SubtypeAIndex
	dc.w	ObjMetalPlatform_SubtypeA_Move-ObjMetalPlatform_SubtypeAIndex
	dc.w	ObjMetalPlatform_SubtypeA_End-ObjMetalPlatform_SubtypeAIndex

; -------------------------------------------------------------------------

ObjMetalPlatform_SubtypeA_Init:
	tst.b	oVar38(a0)
	bne.s	.Wait
	move.b	#1,oVar3F(a0)
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jsr	TopSolidObject
	beq.s	.End
	move.b	#$1E,oVar38(a0)

.End:
	rts

.Wait:
	subq.b	#1,oVar38(a0)
	bne.s	.End
	clr.b	oVar3F(a0)
	addq.b	#2,oVar3A(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_SubtypeA_Move:
	tst.b	oVar38(a0)
	bne.s	.Move
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	lea	ObjMetalPlatform_FinalA(pc),a1
	subq.b	#5,d0
	beq.s	.GetMotion
	lea	ObjMetalPlatform_FinalB(pc),a1
	subq.b	#1,d0
	beq.s	.GetMotion
	lea	ObjMetalPlatform_FinalC(pc),a1

.GetMotion:
	moveq	#0,d0
	move.b	oVar39(a0),d0
	add.w	d0,d0
	add.w	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,oVar38(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oVar36(a0)
	move.w	(a1)+,oVar34(a0)

.Move:
	move.w	oVar36(a0),d0
	add.w	d0,oVar34(a0)
	move.w	oVar34(a0),d0
	move.w	d0,d1
	andi.w	#$FF00,d1
	move.w	d1,oYVel(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	subq.b	#1,oVar38(a0)
	bne.s	.End
	addq.b	#1,oVar39(a0)
	cmpi.b	#3,oVar39(a0)
	bne.s	ObjMetalPlatform_SubtypeA_Move
	clr.w	oYVel(a0)
	move.b	#1,oVar3F(a0)
	move.w	oY(a0),oVar30(a0)
	addq.b	#2,oVar3A(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_SubtypeA_End:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_FinalA:
	dc.b	$10, -$10
	dc.w	0
	dc.b	$30, 0
	dc.w	-$200
	dc.b	$10, $10
	dc.w	-$200

ObjMetalPlatform_FinalB:
	dc.b	$10, -$30
	dc.w	0
	dc.b	$45, 0
	dc.w	-$300
	dc.b	$10, $30
	dc.w	-$300

ObjMetalPlatform_FinalC:
	dc.b	$10, -$40
	dc.w	0
	dc.b	$58, 0
	dc.w	-$400
	dc.b	$10, $40
	dc.w	-$400

; -------------------------------------------------------------------------

MapSpr_MetalPlatform:
	include	"sprites/r3/metal_platform.asm"
	even

; -------------------------------------------------------------------------
