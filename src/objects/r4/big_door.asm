; ------------------------------------------------------------------------------

BigDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CEEE(pc,d0.w),d0
	jmp	off_20CEEE(pc,d0.w)

; ------------------------------------------------------------------------------

off_20CEEE:
	dc.w	BigDoorObject_0_Routine0-*
	dc.w	BigDoorObject_0_Routine2-off_20CEEE
	dc.w	BigDoorObject_0_Routine4-off_20CEEE

; ------------------------------------------------------------------------------

BigDoorObject_0_Routine0:
	lea	switch_flags,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	adda.w	d0,a1
	tst.b	(a1)
	bne.w	loc_20CFE2
	move.l	a1,obj.var_30(a0)
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.l	#BigDoorSprites,obj.sprite_data(a0)
	move.l	#$40400340,obj.height(a0)

BigDoorObject_0_Routine2:
	movea.l	obj.var_30(a0),a1
	tst.b	(a1)
	bne.s	loc_20CF48
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20CF48:
	addq.b	#2,obj.routine(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$80,obj.var_2a(a0)
	move.l	#-$10000,obj.var_2c(a0)
	addq.b	#1,obj.sprite_frame(a0)
	subi.w	#$30,obj.x(a0)
	move.w	#2,d6
	move.w	obj.x(a0),d5

loc_20CF78:
	jsr	SpawnObjectAfter
	bne.w	loc_20CFE2
	movea.w	a0,a2
	movea.w	a1,a3
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	addi.w	#$20,d5
	move.w	d5,obj.x(a1)
	move.w	d6,d0
	andi.w	#1,d0
	bne.s	loc_20CFBE
	neg.l	obj.var_2c(a1)
	addq.b	#1,obj.sprite_frame(a1)

loc_20CFBE:
	dbf	d6,loc_20CF78
	bra.s	loc_20CFD2

; ------------------------------------------------------------------------------

BigDoorObject_0_Routine4:
	subq.w	#1,obj.var_2a(a0)
	bmi.s	loc_20CFE2
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.y(a0)

loc_20CFD2:
	lea	player_object,a1
	jsr	SolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20CFE2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BigDoorSprites:
	include	"src/sprites/r4/big_door.asm"
	even

; ------------------------------------------------------------------------------
