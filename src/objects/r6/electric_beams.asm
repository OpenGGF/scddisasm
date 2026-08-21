; ------------------------------------------------------------------------------

ElectricBeamsObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CBCC(pc,d0.w),d0
	jsr	off_20CBCC(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20CBCC:
	dc.w	ElectricBeamsObject_0_Routine0-*
	dc.w	ElectricBeamsObject_0_Routine2-off_20CBCC
	dc.w	ElectricBeamsObject_0_Routine4-off_20CBCC

; ------------------------------------------------------------------------------

ElectricBeamsObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$6358,obj.sprite_tile(a0)
	move.l	#ElectricBeamsSprites,obj.sprite_data(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	bsr.w	sub_20CCF4

ElectricBeamsObject_0_Routine2:
	tst.b	obj.subtype(a0)
	beq.s	locret_20CC5A
	bsr.w	sub_20CCE2
	tst.w	obj.var_3a(a0)
	bne.s	loc_20CC5C
	bsr.w	sub_20CD38
	cmpi.b	#2,time_zone
	bne.s	loc_20CC2C
	tst.b	good_future
	bne.s	locret_20CC5A

loc_20CC2C:
	tst.b	act
	bne.s	loc_20CC3E
	move.w	scroll_fg_y,d0
	cmpi.w	#$400,d0
	bcc.s	locret_20CC5A

loc_20CC3E:
	move.w	#$168,d0
	move.b	time_zone,d1
	beq.s	loc_20CC56
	move.w	#$1E0,d0
	subq.b	#1,d1
	beq.s	loc_20CC56
	move.w	#$F0,d0

loc_20CC56:
	move.w	d0,obj.var_3a(a0)

locret_20CC5A:
	rts

; ------------------------------------------------------------------------------

loc_20CC5C:
	subq.w	#1,obj.var_3a(a0)
	bne.s	locret_20CC5A
	addq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_3a(a0)
	move.w	#$5A,obj.var_30(a0)
	clr.b	obj.var_2e(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	ElectricBeamsObject_0_Routine4
	move.w	#$B2,d0
	jsr	PlayFmSound

ElectricBeamsObject_0_Routine4:
	bsr.w	sub_20CCE2
	tst.w	obj.var_30(a0)
	beq.s	loc_20CCA6
	move.b	obj.var_3c(a0),d0
	bsr.w	sub_20CE5C
	subq.w	#1,obj.var_30(a0)
	beq.s	loc_20CCA2
	rts

; ------------------------------------------------------------------------------

loc_20CCA2:
	bsr.w	sub_20CD38

loc_20CCA6:
	move.b	obj.var_3c(a0),d0
	addq.b	#1,d0
	move.b	d0,r6_beam_mode
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	bsr.w	sub_20CD80
	subq.w	#1,obj.var_3a(a0)
	bne.s	locret_20CCE0
	subq.b	#2,obj.routine(a0)
	clr.b	r6_beam_mode
	addq.b	#1,obj.var_3c(a0)
	cmpi.b	#3,obj.var_3c(a0)
	bcs.s	locret_20CCE0
	clr.b	obj.var_3c(a0)
	clr.w	obj.var_3e(a0)

locret_20CCE0:
	rts

; ------------------------------------------------------------------------------

sub_20CCE2:
	lea	player_object,a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20CCF4:
	lea	object_spawn_pool,a1
	move.w	#$5F,d0

loc_20CCFC:
	cmpi.b	#$21,obj.id(a1)
	bne.s	loc_20CD0A
	tst.b	obj.subtype(a1)
	bne.s	locret_20CD36

loc_20CD0A:
	lea	obj.struct_len(a1),a1
	dbf	d0,loc_20CCFC
	jsr	SpawnObject
	bne.s	locret_20CD36
	move.b	#$21,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	lea	player_object,a2
	move.w	obj.x(a2),obj.x(a1)
	move.w	obj.y(a2),obj.y(a1)

locret_20CD36:
	rts

; ------------------------------------------------------------------------------

sub_20CD38:
	lea	palette+$40,a3
	move.w	#$626,d0
	move.w	#$646,d2
	move.b	time_zone,d1
	beq.s	loc_20CD6E
	lea	palette+$7A,a3
	move.w	#$222,d0
	move.w	#$680,d2
	subq.b	#1,d1
	beq.s	loc_20CD6E
	move.w	#$402,d0
	move.w	#$246,d2
	tst.b	good_future
	beq.s	loc_20CD6E
	rts

; ------------------------------------------------------------------------------

loc_20CD6E:
	lea	palette+$64,a2
	move.w	d0,(a2)+
	move.w	d0,(a2)+
	move.w	d0,(a2)+
	move.w	d2,(a3)+
	rts

; ------------------------------------------------------------------------------

byte_20CD7C:
	dc.b	0
	dc.b	2
	dc.b	4
	dc.b	0

; ------------------------------------------------------------------------------

sub_20CD80:
	move.b	byte_20CD7C(pc,d0.w),d0
	lea	palette+$64,a2
	lea	(a2,d0.w),a2
	lea	word_20CE28,a1
	move.b	time_zone,d1
	beq.s	loc_20CDAA
	lea	word_20CE0E,a1
	subq.b	#1,d1
	beq.s	loc_20CDAA
	lea	word_20CE42,a1

loc_20CDAA:
	moveq	#0,d1
	move.b	obj.var_3e(a0),d1
	add.b	d1,d1
	lea	(a1,d1.w),a1
	move.w	(a1)+,(a2)+
	addq.b	#1,obj.var_3e(a0)
	move.w	(a1),d1
	cmpi.w	#$FFFF,d1
	bne.s	loc_20CDC8
	clr.b	obj.var_3e(a0)

loc_20CDC8:
	lea	palette+$40,a2
	lea	word_20CE38,a1
	move.b	time_zone,d1
	beq.s	loc_20CDEE
	lea	palette+$7A,a2
	lea	word_20CE1E,a1
	subq.b	#1,d1
	beq.s	loc_20CDEE
	lea	word_20CE52,a1

loc_20CDEE:
	moveq	#0,d1
	move.b	obj.var_3f(a0),d1
	add.b	d1,d1
	lea	(a1,d1.w),a1
	move.w	(a1)+,(a2)+
	addq.b	#1,obj.var_3f(a0)
	move.w	(a1),d1
	cmpi.w	#$FFFF,d1
	bne.s	locret_20CE0C
	clr.b	obj.var_3f(a0)

locret_20CE0C:
	rts

; ------------------------------------------------------------------------------

word_20CE0E:
	dc.w	0
	dc.w	$EE0
	dc.w	0
	dc.w	$EE
	dc.w	0
	dc.w	$E0E
	dc.w	0
	dc.w	$FFFF

word_20CE1E:
	dc.w	$A60
	dc.w	$AA0
	dc.w	$A60
	dc.w	$AA0
	dc.w	$FFFF

word_20CE28:
	dc.w	0
	dc.w	$EE0
	dc.w	0
	dc.w	$EE
	dc.w	0
	dc.w	$E0E
	dc.w	0
	dc.w	$FFFF

word_20CE38:
	dc.w	$846
	dc.w	$84A
	dc.w	$846
	dc.w	$84A
	dc.w	$FFFF

word_20CE42:
	dc.w	0
	dc.w	$EE0
	dc.w	0
	dc.w	$EE
	dc.w	0
	dc.w	$E0E
	dc.w	0
	dc.w	$FFFF

word_20CE52:
	dc.w	$244
	dc.w	$248
	dc.w	$244
	dc.w	$248
	dc.w	$FFFF

; ------------------------------------------------------------------------------

sub_20CE5C:
	move.b	byte_20CE7E(pc,d0.w),d0
	lea	palette+$64,a2
	lea	(a2,d0.w),a2
	move.w	#$80,d0
	tst.b	obj.var_2e(a0)
	beq.s	loc_20CE74
	moveq	#0,d0

loc_20CE74:
	move.w	d0,(a2)
	eori.b	#1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

byte_20CE7E:
	dc.b	0
	dc.b	2
	dc.b	4
	dc.b	0

ElectricBeamsSprites:
	include	"sprites/r6/electric_beams.asm"
	even

; ------------------------------------------------------------------------------
