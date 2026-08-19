; ------------------------------------------------------------------------------

DoorObject:
	move.w	obj.var_2a(a0),d0
	bne.w	loc_20D14A
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CF84(pc,d0.w),d0
	jmp	off_20CF84(pc,d0.w)

; ------------------------------------------------------------------------------

off_20CF84:
	dc.w	DoorObject_0_Routine0-*
	dc.w	DoorObject_0_Routine2-off_20CF84
	dc.w	DoorObject_0_Routine4-off_20CF84
	dc.w	DoorObject_0_Routine6-off_20CF84
	dc.w	DoorObject_0_Routine8-off_20CF84

; ------------------------------------------------------------------------------

DoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	subi.w	#$10,obj.var_2e(a0)
	lea	off_20D02C(pc),a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a1,d0.w),obj.sprite_data(a0)
	jsr	SpawnObjectAfter
	bne.w	loc_20D156
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	a0,obj.var_2a(a1)
	move.w	a1,obj.var_2c(a0)
	bsr.s	sub_20CFF6
	sub.w	d0,obj.y(a1)
	sub.w	d0,obj.var_30(a1)
	sub.w	d1,obj.var_32(a1)
	movea.w	a0,a1
	bsr.s	sub_20CFF6
	add.w	d0,obj.y(a1)
	add.w	d0,obj.var_30(a1)
	add.w	d1,obj.var_32(a1)
	rts

; ------------------------------------------------------------------------------

sub_20CFF6:
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.w	#$47E,obj.sprite_tile(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#$10,obj.height(a1)
	move.w	obj.var_2e(a0),obj.y(a1)
	move.w	obj.var_2e(a0),obj.var_30(a1)
	move.w	obj.var_2e(a0),obj.var_32(a1)
	moveq	#$10,d0
	moveq	#$31,d1
	rts

; ------------------------------------------------------------------------------

off_20D02C:
	dc.l	Unk20D162Sprites
	dc.l	off_20D16C
	dc.l	off_20D186

; ------------------------------------------------------------------------------

DoorObject_0_Routine2:
	bsr.w	sub_20D112
	tst.b	obj.var_3f(a0)
	beq.s	loc_20D048
	clr.b	obj.var_3f(a0)
	bra.s	loc_20D062

; ------------------------------------------------------------------------------

loc_20D048:
	move.b	obj.subtype(a0),d0
	beq.s	loc_20D066
	moveq	#8,d4
	moveq	#$40,d5
	cmpi.b	#1,d0
	beq.s	loc_20D05C
	moveq	#-$48,d4
	moveq	#$40,d5

loc_20D05C:
	bsr.w	sub_20D12A
	bcc.s	loc_20D066

loc_20D062:
	addq.b	#2,obj.routine(a0)

loc_20D066:
	lea	DoorAnims(pc),a1
	jsr	AnimateObject
	movea.w	obj.var_2c(a0),a1
	move.b	obj.sprite_frame(a0),obj.sprite_frame(a1)
	move.w	a0,-(sp)
	movea.w	a1,a0
	jsr	DrawObject
	movea.w	(sp)+,a0
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

DoorObject_0_Routine4:
	bsr.w	sub_20D112
	movea.w	obj.var_2c(a0),a1
	addq.w	#2,obj.y(a0)
	subq.w	#2,obj.y(a1)
	move.w	obj.y(a0),d0
	cmp.w	obj.var_32(a0),d0
	blt.s	loc_20D0BC
	addq.b	#2,obj.routine(a0)
	move.w	obj.var_32(a0),obj.y(a0)
	move.w	obj.var_32(a1),obj.y(a1)

loc_20D0BC:
	bra.s	loc_20D066

; ------------------------------------------------------------------------------

DoorObject_0_Routine6:
	bsr.w	sub_20D112
	move.b	obj.subtype(a0),d0
	beq.s	loc_20D0E0
	moveq	#-$28,d4
	moveq	#$70,d5
	cmpi.b	#1,d0
	beq.s	loc_20D0D6
	moveq	#-$48,d4
	moveq	#$70,d5

loc_20D0D6:
	bsr.w	sub_20D12A
	bcs.s	loc_20D0E0
	addq.b	#2,obj.routine(a0)

loc_20D0E0:
	bra.s	loc_20D066

; ------------------------------------------------------------------------------

DoorObject_0_Routine8:
	bsr.w	sub_20D112
	movea.w	obj.var_2c(a0),a1
	subq.w	#2,obj.y(a0)
	addq.w	#2,obj.y(a1)
	move.w	obj.y(a0),d0
	cmp.w	obj.var_30(a0),d0
	bgt.s	loc_20D10E
	move.b	#2,obj.routine(a0)
	move.w	obj.var_30(a0),obj.y(a0)
	move.w	obj.var_30(a1),obj.y(a1)

loc_20D10E:
	bra.w	loc_20D066

; ------------------------------------------------------------------------------

sub_20D112:
	move.w	a0,-(sp)
	movea.w	obj.var_2c(a0),a0
	lea	player_object,a1
	jsr	SolidObject
	movea.w	(sp)+,a0
	jmp	SolidObject

; ------------------------------------------------------------------------------

sub_20D12A:
	move.w	player_object+obj.x,d0
	sub.w	obj.x(a0),d0
	sub.w	d4,d0
	sub.w	d5,d0
	bcc.s	locret_20D148
	move.w	player_object+obj.y,d0
	sub.w	obj.var_2e(a0),d0
	subi.w	#-$30,d0
	subi.w	#$60,d0

locret_20D148:
	rts

; ------------------------------------------------------------------------------

loc_20D14A:
	movea.w	d0,a1
	cmpi.b	#$29,obj.id(a1)
	bne.s	loc_20D156
	rts

; ------------------------------------------------------------------------------

loc_20D156:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

DoorAnims:
	include	"src/anims/r8/door.asm"
	even

Unk20D162Sprites:
	dc.w	Unk20D162Sprite_0-*
	dc.w	Unk20D162Sprite_0-Unk20D162Sprites
Unk20D162Sprite_0:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $F8
	
off_20D16C:
	dc.w	byte_20D170-*
	dc.w	byte_20D17B-off_20D16C
byte_20D170:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F8
	dc.b	$FC, 0, 8, 8, 8
byte_20D17B:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F8
	dc.b	$FC, 0, 8, 9, 8

off_20D186:
	dc.w	byte_20D18A-*
	dc.w	byte_20D195-off_20D186
byte_20D18A:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F8
	dc.b	$FC, 0, 0, 8, $F0
byte_20D195:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F8
	dc.b	$FC, 0, 0, 9, $F0

; ------------------------------------------------------------------------------
