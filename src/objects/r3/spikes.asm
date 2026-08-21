; ------------------------------------------------------------------------------

SpikesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BFD6(pc,d0.w),d0
	jsr	off_20BFD6(pc,d0.w)
	jsr	DrawObject
	moveq	#0,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_20BFB4
	movea.w	d1,a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_20BFB4:
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20BFD2
	rts

; ------------------------------------------------------------------------------

loc_20BFD2:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20BFD6:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20BFD6

byte_20BFDA:
	dc.b	$10, 8, 0
	dc.b	$12, $C, $83
	dc.b	$C, $10, $82
	dc.b	$C, $10, $82

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$31E,d0
	cmpi.b	#2,act
	bne.s	loc_20C002
	move.w	#$3FC,d0

loc_20C002:
	move.w	d0,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	andi.b	#3,d0
	move.b	d0,d1
	move.b	d0,obj.sprite_frame(a0)
	add.b	d0,d0
	add.b	d1,d0
	lea	byte_20BFDA(pc,d0.w),a1
	move.b	(a1)+,obj.width_2(a0)
	move.b	(a1)+,obj.height(a0)
	move.b	(a1)+,obj.collide_type(a0)

SpikesObject_0_Routine2:
	jsr	sub_20C0AE(pc)
	tst.b	obj.sprite_frame(a0)
	beq.s	loc_20C058
	lea	player_object,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

loc_20C058:
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20C0AC
	btst	#3,obj.flags(a0)
	beq.s	locret_20C0AC
	tst.b	warping
	bne.s	locret_20C0AC
	tst.b	invincible
	bne.s	locret_20C0AC
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20C0AA
	tst.w	obj.var_30(a0)
	bne.s	loc_20C0AA
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer

loc_20C0AA:
	movea.l	(sp)+,a0

locret_20C0AC:
	rts

; ------------------------------------------------------------------------------

sub_20C0AE:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	btst	#2,d0
	beq.s	locret_20C0C8
	andi.b	#3,d0
	add.w	d0,d0
	move.w	off_20C0CA(pc,d0.w),d0
	jmp	off_20C0CA(pc,d0.w)

; ------------------------------------------------------------------------------

locret_20C0C8:
	rts

; ------------------------------------------------------------------------------

off_20C0CA:
	dc.w	SpikesObject_1_Routine0-*
	dc.w	SpikesObject_1_Routine2-off_20C0CA
	dc.w	SpikesObject_1_Routine4-off_20C0CA
	dc.w	SpikesObject_1_Routine6-off_20C0CA

; ------------------------------------------------------------------------------

SpikesObject_1_Routine0:
	jsr	sub_20C126(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpikesObject_1_Routine2:
	jsr	sub_20C126(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpikesObject_1_Routine4:
	jsr	sub_20C126(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	neg.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

SpikesObject_1_Routine6:
	jsr	sub_20C126(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

sub_20C126:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20C144
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20C182
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20C144
	move.w	#$B7,d0
	jsr	PlayFmSound

loc_20C144:
	tst.b	obj.var_3c(a0)
	beq.s	loc_20C164
	subq.b	#8,obj.var_3b(a0)
	bcc.s	locret_20C182
	move.b	#0,obj.var_3b(a0)
	move.b	#0,obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)
	bra.s	locret_20C182

; ------------------------------------------------------------------------------

loc_20C164:
	addq.b	#8,obj.var_3b(a0)
	cmpi.b	#$20,obj.var_3b(a0)
	bcs.s	locret_20C182
	move.b	#$20,obj.var_3b(a0)
	move.b	#1,obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)

locret_20C182:
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"sprites/r3/spikes.asm"
	even

; ------------------------------------------------------------------------------
