; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos intro spikes object
; -------------------------------------------------------------------------

oIntroSpikesChildType	EQU	oVar3C
oIntroSpikesAcceleration	EQU	oVar3E
oIntroSpikesTimer	EQU	oVar3A

; -------------------------------------------------------------------------

ObjIntroSpikes:
	tst.b	timeAttackMode
	bne.w	ObjIntroSpikes_Delete
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjIntroSpikes_Index(pc,d0.w),d0
	jsr	ObjIntroSpikes_Index(pc,d0.w)
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjIntroSpikes_Index:
	dc.w	ObjIntroSpikes_Init-ObjIntroSpikes_Index
	dc.w	ObjIntroSpikes_Routine2-ObjIntroSpikes_Index
	dc.w	ObjIntroSpikes_Routine4-ObjIntroSpikes_Index

; -------------------------------------------------------------------------

ObjIntroSpikes_Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjIntroSpikes_Init:
	tst.b	amyCaptured
	bne.w	ObjIntroSpikes_Delete
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.w	#$31E,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_IntroSpikes,oMap(a0)
	move.b	#$12,oWidth(a0)
	move.b	#8,oYRadius(a0)
	cmpi.b	#1,oSubtype(a0)
	beq.s	.SetFrame
	move.b	#$20,oYRadius(a0)
	cmpi.b	#0,oSubtype(a0)
	beq.s	.SetFrame
	move.b	#9,oMapFrame(a0)
	move.b	#$86,oColType(a0)
	move.b	#$C,oWidth(a0)
	cmpi.b	#2,oSubtype(a0)
	beq.s	.SetFrame
	move.b	#$E,oMapFrame(a0)

.SetFrame:
	tst.b	oIntroSpikesChildType(a0)
	beq.s	ObjIntroSpikes_Routine2
	clr.b	oColType(a0)
	addq.b	#2,oRoutine(a0)
	bsr.w	ObjIntroSpikes_SetMotion
	bra.w	ObjIntroSpikes_Routine4

; -------------------------------------------------------------------------

ObjIntroSpikes_Routine2:
	cmpi.b	#1,oSubtype(a0)
	beq.w	ObjIntroSpikes_SolidHurt
	lea	dynObjects.w,a1
	move.w	#DYNOBJCOUNT-1,d0

.FindMetal:
	cmpi.b	#$31,oID(a1)
	beq.s	.FoundMetal
	lea	oSize(a1),a1
	dbf	d0,.FindMetal
	bra.w	ObjIntroSpikes_Solid

.FoundMetal:
	move.b	oWidth(a0),d1
	ext.w	d1
	addi.w	#$10,d1
	move.w	oX(a1),d0
	sub.w	oX(a0),d0
	add.w	d1,d0
	bmi.w	ObjIntroSpikes_Solid
	move.w	d1,d2
	add.w	d2,d2
	cmp.w	d2,d0
	bcc.w	ObjIntroSpikes_Solid
	move.b	oYRadius(a0),d1
	ext.w	d1
	addi.w	#$10,d1
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	add.w	d1,d0
	bmi.w	ObjIntroSpikes_Solid
	move.w	d1,d2
	add.w	d2,d2
	cmp.w	d2,d0
	bcc.w	ObjIntroSpikes_Solid
	addq.b	#2,oRoutine(a0)
	bsr.w	ObjIntroSpikes_SpawnShards
	lea	objPlayerSlot.w,a1
	jmp	GetOffObject

; -------------------------------------------------------------------------

ObjIntroSpikes_Solid:
	lea	objPlayerSlot.w,a1
	jmp	SolidObject

; -------------------------------------------------------------------------

ObjIntroSpikes_SolidHurt:
	lea	objPlayerSlot.w,a1
	jsr	SolidObject
	beq.s	.End
	btst	#3,oFlags(a0)
	beq.s	.End
	tst.b	timeWarp
	bne.s	.End
	tst.b	invincible
	bne.s	.End
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	objPlayerSlot.w,a0
	cmpi.b	#4,oRoutine(a0)
	bcc.s	.Restore
	tst.w	oPlayerHurt(a0)
	bne.s	.Restore
	move.l	oY(a0),d3
	move.w	oYVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,oY(a0)
	jsr	HurtPlayer

.Restore:
	movea.l	(sp)+,a0

.End:
	rts

; -------------------------------------------------------------------------

ObjIntroSpikes_SpawnShards:
	moveq	#3,d1
	move.b	#4,oMapFrame(a0)
	moveq	#0,d2
	cmpi.b	#0,oSubtype(a0)
	beq.s	.Spawn
	move.b	#8,oMapFrame(a0)
	moveq	#4,d2
	cmpi.b	#2,oSubtype(a0)
	beq.s	.Spawn
	move.b	#$D,oMapFrame(a0)
	moveq	#9,d2

.Spawn:
	jsr	FindObjSlot
	bne.s	.NoSlot
	move.b	#$30,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	d1,d3
	add.b	d2,d3
	move.b	d3,oMapFrame(a1)
	move.b	d1,oIntroSpikesChildType(a1)

.NoSlot:
	subq.b	#1,d1
	bne.s	.Spawn
	btst	#7,oSprFlags(a0)
	beq.s	.End
	move.w	#FM_A3,d0
	jsr	PlayFMSound

.End:
	rts

; -------------------------------------------------------------------------

ObjIntroSpikes_SetMotion:
	moveq	#0,d0
	move.b	oIntroSpikesChildType(a0),d0
	asl.w	#2,d0
	lea	ObjIntroSpikes_Motion(pc,d0.w),a2
	move.w	(a2)+,oXVel(a0)
	move.w	(a2)+,oYVel(a0)
	move.w	#$60,oIntroSpikesAcceleration(a0)
	move.b	#$78,oIntroSpikesTimer(a0)
	rts

; -------------------------------------------------------------------------

ObjIntroSpikes_Motion:
	dc.w	$200,-$200
	dc.w	-$100,-$400
	dc.w	-$100,-$200
	dc.w	$200,-$400

; -------------------------------------------------------------------------

ObjIntroSpikes_Routine4:
	bsr.w	ObjIntroSpikes_Move
	move.w	oIntroSpikesAcceleration(a0),d0
	add.w	d0,oYVel(a0)
	subq.b	#1,oIntroSpikesTimer(a0)
	beq.w	ObjIntroSpikes_Delete
	rts

; -------------------------------------------------------------------------

ObjIntroSpikes_Move:
	move.w	oXVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	move.w	oYVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

MapSpr_IntroSpikes:
	include	"sprites/r3/intro_spikes.asm"
	even

; -------------------------------------------------------------------------
