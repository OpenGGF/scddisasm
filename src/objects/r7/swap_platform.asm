; ------------------------------------------------------------------------------

SwapPlatformObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20F610
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$20,obj.width(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$11,obj.height(a0)
	move.l	#SwapPlatformSprites,obj.sprite_data(a0)

loc_20F610:
	move.b	debug_cheat,obj.sprite_frame(a0)
	tst.b	stage_layer
	beq.s	loc_20F630
	lea	player_object,a1
	jsr	SolidObject
	sne	obj.var_2a(a0)
	bra.s	loc_20F644

; ------------------------------------------------------------------------------

loc_20F630:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20F644
	clr.b	obj.var_2a(a0)
	lea	player_object,a1
	jsr	GetOffObject

loc_20F644:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

SwapPlatformSprites:
	include	"sprites/r7/swap_platform.asm"
	even

; ------------------------------------------------------------------------------
