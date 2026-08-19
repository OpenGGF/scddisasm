; ------------------------------------------------------------------------------

SpikesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20ED10(pc,d0.w),d0
	jmp	off_20ED10(pc,d0.w)

; ------------------------------------------------------------------------------

off_20ED10:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20ED10
	dc.w	SpikesObject_0_Routine4-off_20ED10

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4FC,obj.sprite_tile(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$2F,d0
	bsr.w	sub_20EEDA
	bne.s	loc_20ED6E
	move.w	a1,obj.var_2a(a0)
	moveq	#0,d1
	move.w	obj.x(a0),d0
	move.b	obj.width_2(a0),d1
	sub.w	d1,d0
	sub.w	8(a1),d0
	move.b	$19(a1),d1
	sub.w	d1,d0
	blt.s	loc_20ED6E
	bra.s	SpikesObject_0_Routine2

; ------------------------------------------------------------------------------

loc_20ED6E:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpikesObject_0_Routine2:
	tst.w	obj.var_2a(a0)
	beq.s	loc_20ED96
	movea.w	obj.var_2a(a0),a1
	move.w	obj.x(a0),d0
	sub.w	8(a1),d0
	bge.s	loc_20ED8A
	neg.w	d0

loc_20ED8A:
	moveq	#0,d1
	move.b	obj.width_2(a0),d1
	cmp.w	d1,d0
	blt.w	loc_20EE0A

loc_20ED96:
	lea	player_object,a1
	jsr	SolidObject
	beq.s	loc_20EDFE
	clr.b	obj.collide_type(a1)
	clr.b	obj.var_35(a0)
	btst	#3,obj.flags(a1)
	beq.s	loc_20EDFE
	move.b	#1,obj.var_35(a0)
	tst.b	invincible
	bne.s	loc_20EDFE
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	beq.s	loc_20EDFC
	tst.w	obj.var_30(a0)
	bne.s	loc_20EDFC
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer
	movea.l	(sp)+,a0
	lea	player_object,a1
	jsr	GetOffObject
	bra.s	loc_20EDFE

; ------------------------------------------------------------------------------

loc_20EDFC:
	movea.l	(sp)+,a0

loc_20EDFE:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20EE0A:
	move.w	#$A3,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	moveq	#$FFFFFFF4,d4
	moveq	#3,d3
	lea	word_20EEA2,a2

loc_20EE26:
	jsr	SpawnObject
	bne.s	loc_20EE8C
	move.b	#$32,obj.id(a1)
	move.b	#4,obj.routine(a1)
	move.b	#1,obj.sprite_frame(a1)
	move.b	#4,obj.sprite_flags(a1)
	move.b	#5,obj.sprite_layer(a1)
	move.b	#4,obj.width_2(a1)
	move.b	#$10,obj.height(a1)
	move.w	#$4FC,obj.sprite_tile(a1)
	move.l	#SpikesSprites,obj.sprite_data(a1)
	move.w	obj.x(a0),obj.x(a1)
	add.w	d4,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,obj.x_speed(a1)
	move.w	(a2)+,obj.y_speed(a1)
	move.w	(a2)+,obj.var_30(a1)
	move.w	(a2)+,obj.var_32(a1)
	addq.w	#8,d4
	dbf	d3,loc_20EE26

loc_20EE8C:
	tst.b	obj.var_35(a0)
	beq.s	loc_20EE9C
	lea	player_object,a1
	jsr	GetOffObject

loc_20EE9C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

word_20EEA2:
	dc.w	$240, -$200, 6, $10
	dc.w	$220, -$200, 0, $12
	dc.w	$200, -$200, 6, $14
	dc.w	$1E0, -$200, $A, $10

; ------------------------------------------------------------------------------

SpikesObject_0_Routine4:
	bsr.w	loc_20CEA0
	eori.b	#1,obj.var_34(a0)
	beq.s	loc_20EED4
	jsr	DrawObject

loc_20EED4:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

sub_20EEDA:
	lea	hud_score_object,a1
	moveq	#$7D,d1

loc_20EEE0:
	cmp.b	obj.id(a1),d0
	bne.s	loc_20EEE8
	rts

; ------------------------------------------------------------------------------

loc_20EEE8:
	adda.w	#$40,a1
	dbf	d1,loc_20EEE0
	moveq	#-1,d1
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"src/sprites/r7/spikes.asm"
	even

; ------------------------------------------------------------------------------
