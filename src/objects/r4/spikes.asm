; ------------------------------------------------------------------------------

SpikesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C0AC(pc,d0.w),d0
	jsr	off_20C0AC(pc,d0.w)
	jsr	DrawObject
	moveq	#0,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_20C0A2
	movea.w	d1,a1
	tst.b	obj.id(a1)
	bne.s	loc_20C082
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20C082:
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_20C0A2:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C0AC:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20C0AC

; ------------------------------------------------------------------------------

loc_20C0B0:
	tst.b	obj.sprite_frame(a0)
	beq.s	loc_20C0C0
	lea	player_object,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

loc_20C0C0:
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20C114
	btst	#3,obj.flags(a0)
	beq.s	locret_20C114
	tst.b	warping
	bne.s	locret_20C114
	tst.b	invincible
	bne.s	locret_20C114
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20C112
	tst.w	obj.var_30(a0)
	bne.s	loc_20C112
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer

loc_20C112:
	movea.l	(sp)+,a0

locret_20C114:
	rts

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$3A0,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	tst.w	obj.var_36(a0)
	bne.s	loc_20C140
	move.w	obj.x(a0),obj.var_36(a0)

loc_20C140:
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$12,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	tst.b	obj.subtype(a0)
	beq.s	SpikesObject_0_Routine2
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$83,obj.collide_type(a0)

SpikesObject_0_Routine2:
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20C17E
	jsr	sub_20C182(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)

loc_20C17E:
	bra.w	loc_20C0B0

; ------------------------------------------------------------------------------

sub_20C182:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20C1A0
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20C1DE
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20C1A0
	move.w	#$B7,d0
	jsr	PlayFmSound

loc_20C1A0:
	tst.b	obj.var_3c(a0)
	beq.s	loc_20C1C0
	subq.b	#8,obj.var_3b(a0)
	bcc.s	locret_20C1DE
	move.b	#0,obj.var_3b(a0)
	move.b	#0,obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)
	bra.s	locret_20C1DE

; ------------------------------------------------------------------------------

loc_20C1C0:
	addq.b	#8,obj.var_3b(a0)
	cmpi.b	#$20,obj.var_3b(a0)
	bcs.s	locret_20C1DE
	move.b	#$20,obj.var_3b(a0)
	move.b	#1,obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)

locret_20C1DE:
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"sprites/r4/spikes.asm"
	even

; ------------------------------------------------------------------------------
