; ------------------------------------------------------------------------------

drain_block.parent_link		equ obj.var_36	; Parent Drain switch object slot

DrainBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	DrainBlock_Routines(pc,d0.w),d0
	jsr	DrainBlock_Routines(pc,d0.w)
	movea.w	drain_block.parent_link(a0),a1
	cmpi.b	#$36,obj.id(a1)
	bne.s	.Delete
	jmp	DrawObject

; ------------------------------------------------------------------------------

.Delete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

DrainBlock_Routines:
	dc.w	DrainBlock_Init-*
	dc.w	DrainBlock_Solid-DrainBlock_Routines
	dc.w	DrainBlock_Raise-DrainBlock_Routines
	dc.w	DrainBlock_Lower-DrainBlock_Routines
	dc.w	DrainBlock_Animate-DrainBlock_Routines
	dc.w	DrainBlock_Solid-DrainBlock_Routines

; ------------------------------------------------------------------------------

DrainBlock_Init:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$43E,obj.sprite_tile(a0)
	move.l	#DrainBlockSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)

DrainBlock_Solid:
	cmpi.b	#2,obj.sprite_frame(a0)
	bne.s	.End
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	.End
	bclr	#3,obj.flags(a1)
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.w	#0,obj.x_speed(a1)
	move.w	#-$400,obj.y_speed(a1)

.End:
	rts

; ------------------------------------------------------------------------------

DrainBlock_Raise:
	move.w	#$FF,obj.anim_id(a0)
	addq.b	#4,obj.routine(a0)
	bra.s	DrainBlock_Animate

; ------------------------------------------------------------------------------

DrainBlock_Lower:
	move.w	#$1FF,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)

DrainBlock_Animate:
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
