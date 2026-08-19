; ------------------------------------------------------------------------------

PlatformChainObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EC4E(pc,d0.w),d0
	jsr	off_20EC4E(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20EC48
	rts

; ------------------------------------------------------------------------------

loc_20EC48:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20EC4E:
	dc.w	PlatformChainObject_0_Routine0-*
	dc.w	PlatformChainObject_0_Routine2-off_20EC4E

; ------------------------------------------------------------------------------

sub_20EC52:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	TopSolidObject
	beq.s	locret_20EC80
	move.w	obj.y(a0),d0
	move.b	obj.height(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.b	obj.height(a1),d1
	ext.w	d1
	sub.w	d1,d0
	addq.w	#2,d0
	move.w	d0,obj.y(a1)

locret_20EC80:
	rts

; ------------------------------------------------------------------------------

PlatformChainObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$4340,obj.sprite_tile(a0)
	cmpi.b	#2,act
	bne.s	loc_20ECA2
	move.w	#$4400,obj.sprite_tile(a0)

loc_20ECA2:
	move.l	#PlatformChainSprites,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20ECF6
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	moveq	#1,d1
	moveq	#7,d2

loc_20ECCC:
	jsr	SpawnObject
	bne.s	loc_20ECF0
	move.b	#$3E,obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	d1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.var_32(a1)

loc_20ECF0:
	addq.b	#1,d1
	dbf	d2,loc_20ECCC

loc_20ECF6:
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	lea	byte_20ED38(pc,d0.w),a1
	move.b	(a1)+,obj.var_3e(a0)
	move.b	(a1)+,obj.sprite_frame(a0)
	move.b	#1,obj.sprite_layer(a0)
	tst.b	obj.sprite_frame(a0)
	beq.s	loc_20ED22
	move.b	#3,obj.sprite_layer(a0)
	subi.w	#$4000,obj.sprite_tile(a0)

loc_20ED22:
	move.w	#$100,d0
	btst	#4,obj.subtype(a0)
	beq.s	loc_20ED30
	neg.w	d0

loc_20ED30:
	move.w	d0,obj.var_30(a0)
	bra.w	PlatformChainObject_0_Routine2

; ------------------------------------------------------------------------------

byte_20ED38:
	dc.b	$20, 0
	dc.b	0, 0
	dc.b	-$20, 0
	dc.b	$18, 1
	dc.b	$10, 1
	dc.b	8, 1
	dc.b	-8, 1
	dc.b	-$10, 1
	dc.b	-$18, 1

; ------------------------------------------------------------------------------

PlatformChainObject_0_Routine2:
	bsr.w	sub_20EDB8
	move.w	obj.var_30(a0),d0
	add.w	d0,obj.var_3e(a0)
	moveq	#0,d0
	moveq	#0,d1
	move.b	obj.var_3e(a0),d0
	jsr	SineCosine
	muls.w	#6,d0
	muls.w	#6,d1
	asr.w	#4,d0
	asr.w	#4,d1
	swap	d0
	swap	d1
	moveq	#0,d4
	moveq	#0,d5
	move.w	obj.var_32(a0),d4
	move.w	obj.var_36(a0),d5
	swap	d4
	swap	d5
	add.l	d4,d0
	add.l	d5,d1
	move.l	obj.y(a0),d2
	move.l	obj.x(a0),d3
	move.l	d0,obj.y(a0)
	move.l	d1,obj.x(a0)
	sub.l	d2,d0
	sub.l	d3,d1
	asl.l	#8,d0
	asl.l	#8,d1
	swap	d0
	swap	d1
	move.w	d0,obj.y_speed(a0)
	move.w	d1,obj.x_speed(a0)
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20EDB6
	bsr.w	sub_20EC52

locret_20EDB6:
	rts

; ------------------------------------------------------------------------------

sub_20EDB8:
	btst	#7,obj.subtype(a0)
	bne.s	locret_20EDEA
	move.b	obj.subtype(a0),d0
	andi.w	#$F,d0
	lea	switch_flags,a1
	btst	#7,(a1,d0.w)
	beq.s	loc_20EDE6
	tst.b	obj.var_3d(a0)
	bne.s	locret_20EDEA
	neg.w	obj.var_30(a0)
	move.b	#1,obj.var_3d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EDE6:
	clr.b	obj.var_3d(a0)

locret_20EDEA:
	rts

; ------------------------------------------------------------------------------

PlatformChainSprites:
	include	"src/sprites/r4/platform_chain.asm"
	even

; ------------------------------------------------------------------------------
