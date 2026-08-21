; ------------------------------------------------------------------------------

DrainBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20AC3E(pc,d0.w),d0
	jsr	off_20AC3E(pc,d0.w)
	movea.w	obj.var_36(a0),a1
	cmpi.b	#$36,obj.id(a1)
	bne.s	loc2_20AC38
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc2_20AC38:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20AC3E:
	dc.w	DrainBlockObject_0_Routine0-*
	dc.w	DrainBlockObject_0_Routine2-off_20AC3E
	dc.w	DrainBlockObject_0_Routine4-off_20AC3E
	dc.w	DrainBlockObject_0_Routine6-off_20AC3E
	dc.w	DrainBlockObject_0_Routine8-off_20AC3E
	dc.w	DrainBlockObject_0_Routine2-off_20AC3E

; ------------------------------------------------------------------------------

DrainBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$43E,obj.sprite_tile(a0)
	move.l	#DrainBlockSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)

DrainBlockObject_0_Routine2:
	cmpi.b	#2,obj.sprite_frame(a0)
	bne.s	locret_20ACB4
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	locret_20ACB4
	bclr	#3,obj.flags(a1)
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.w	#0,obj.x_speed(a1)
	move.w	#-$400,obj.y_speed(a1)

locret_20ACB4:
	rts

; ------------------------------------------------------------------------------

DrainBlockObject_0_Routine4:
	move.w	#$FF,obj.anim_id(a0)
	addq.b	#4,obj.routine(a0)
	bra.s	DrainBlockObject_0_Routine8

; ------------------------------------------------------------------------------

DrainBlockObject_0_Routine6:
	move.w	#$1FF,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)

DrainBlockObject_0_Routine8:
	lea	DrainBlockAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

DrainBlockAnims:
	include	"anims/r3/drain_block.asm"
	even

DrainBlockSprites:
	include	"sprites/r3/drain_block.asm"
	even

; ------------------------------------------------------------------------------
