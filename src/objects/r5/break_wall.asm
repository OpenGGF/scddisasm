; ------------------------------------------------------------------------------

BreakWallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F70A(pc,d0.w),d0
	jmp	off_20F70A(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F70A:
	dc.w	BreakWallObject_0_Routine0-*
	dc.w	BreakWallObject_0_Routine2-off_20F70A
	dc.w	BreakWallObject_0_Routine4-off_20F70A

; ------------------------------------------------------------------------------

BreakWallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.b	#$FC,obj.collide_type(a0)
	move.w	#$44A7,obj.sprite_tile(a0)
	move.l	#BreakWallSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#1,d0
	move.b	d0,obj.sprite_frame(a0)
	cmpi.b	#2,obj.subtype(a0)
	bne.s	BreakWallObject_0_Routine2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

BreakWallObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20F794
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	lea	player_object,a1
	move.w	obj.x_speed(a1),obj.var_2a(a0)
	move.w	obj.y_speed(a1),obj.var_2e(a0)
	jsr	SolidObject
	beq.s	loc_20F792
	jsr	GetOffObject

loc_20F792:
	bra.s	loc_20F7AA

; ------------------------------------------------------------------------------

loc_20F794:
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20F7AA:
	move.w	#$B0,d0
	jsr	PlayFmSound
	lea	byte_20F8BC(pc),a6
	lea	byte_20F8C2(pc),a5
	lea	dword_20F8C8(pc),a4
	btst	#0,obj.subtype(a0)
	beq.s	loc_20F7CA
	addq.w	#3,a5

loc_20F7CA:
	lea	player_object,a3
	asr	obj.x_speed(a3)
	moveq	#2,d6
	movea.w	a0,a1
	bra.s	loc_20F810

; ------------------------------------------------------------------------------

loc_20F7D8:
	jsr	SpawnObject
	bne.s	BreakWallObject_0_Routine4
	move.b	obj.id(a0),0(a1)
	move.b	obj.routine(a0),$24(a1)
	move.w	obj.x(a0),8(a1)
	move.w	obj.y(a0),$C(a1)
	move.b	obj.sprite_flags(a0),1(a1)
	move.b	obj.sprite_layer(a0),$18(a1)
	move.l	obj.sprite_data(a0),4(a1)
	move.w	obj.sprite_tile(a0),2(a1)

loc_20F810:
	move.b	(a5)+,obj.sprite_frame(a1)
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	(a6)+,d0
	add.w	d0,obj.y(a1)
	move.l	(a4)+,d0
	move.l	(a4)+,obj.var_2e(a1)
	tst.w	obj.x_speed(a3)
	bpl.s	loc_20F83A
	neg.l	d0

loc_20F83A:
	move.l	d0,obj.var_2a(a1)
	dbf	d6,loc_20F7D8

BreakWallObject_0_Routine4:
	addi.l	#$4000,obj.var_2e(a0)
	move.l	obj.var_2a(a0),d0
	move.l	obj.var_2e(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#-$E0,d0
	ble.s	loc_20F872
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F872:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BreakWallSprites:
	include	"sprites/r5/break_wall.asm"
	even

byte_20F8BC:
	dc.b	$FF
	dc.b	$F0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	$10

byte_20F8C2:
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	5
	dc.b	5

dword_20F8C8:
	dc.l	-$2F684, -$148B0
	dc.l	-$3DA12, 0
	dc.l	-$2F684, $148B0

; ------------------------------------------------------------------------------
