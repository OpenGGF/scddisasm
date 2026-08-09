; ------------------------------------------------------------------------------

BlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C1DA(pc,d0.w),d0
	jsr	off_20C1DA(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_32(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C1D6
	rts

; ------------------------------------------------------------------------------

loc_20C1D6:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20C1DA:
	dc.w	BlockObject_0_Routine0-*
	dc.w	BlockObject_0_Routine2-off_20C1DA

; ------------------------------------------------------------------------------

BlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$433E,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#BlockSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	cmpi.b	#2,obj.subtype(a0)
	bcs.s	BlockObject_0_Routine2
	jsr	SpawnObjectAfter
	beq.s	loc_20C22A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20C22A:
	move.b	#$A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$EA,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)
	move.b	obj.subtype(a0),d0
	andi.b	#1,d0
	add.b	d0,d0
	move.b	d0,obj.subtype(a1)

BlockObject_0_Routine2:
	bsr.s	sub_20C2B8
	tst.b	(time_zone).l
	beq.s	locret_20C28A

loc_20C25E:
	cmpi.b	#1,obj.subtype(a0)
	beq.s	locret_20C28A
	tst.b	obj.var_3a(a0)
	bne.s	loc_20C28C
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	byte_20C2CA(pc,d0.w),a1
	move.b	(a1)+,obj.var_3a(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,obj.var_38(a0)
	move.w	(a1)+,obj.var_36(a0)

locret_20C28A:
	rts

; ------------------------------------------------------------------------------

loc_20C28C:
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.var_36(a0)
	move.w	obj.var_36(a0),d0
	move.w	d0,obj.x_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20C2AC
	rts

; ------------------------------------------------------------------------------

loc_20C2AC:
	addq.b	#1,obj.var_3b(a0)
	andi.b	#3,obj.var_3b(a0)
	bra.s	loc_20C25E

; ------------------------------------------------------------------------------

sub_20C2B8:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

byte_20C2CA:
	dc.b	$40
	dc.b	-8
	dc.w	$200
	dc.b	$40
	dc.b	-8
	dc.w	0
	dc.b	$40
	dc.b	8
	dc.w	-$200
	dc.b	$40
	dc.b	8
	dc.w	0

BlockSprites:
	include	"src/sprites/r3/block.asm"
	even

; ------------------------------------------------------------------------------