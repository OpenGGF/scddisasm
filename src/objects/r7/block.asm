; ------------------------------------------------------------------------------

BlockObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20E38E
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4376,obj.sprite_tile(a0)
	move.l	#BlockSprites,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.b	d0,obj.sprite_frame(a0)
	add.w	d0,d0
	lea	byte_20E3A4(pc,d0.w),a1
	move.b	(a1)+,d0
	move.b	(a1),d1
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)

loc_20E38E:
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

byte_20E3A4:
	dc.b	$C, $11
	dc.b	$1C, $11
	dc.b	$2C, $11
	dc.b	$3C, $11
	dc.b	$C, $21
	dc.b	$C, $31

BlockSprites:
	include	"src/sprites/r7/block.asm"
	even

; ------------------------------------------------------------------------------
