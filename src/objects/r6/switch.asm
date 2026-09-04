; ------------------------------------------------------------------------------

SwitchObject:
	tst.b	obj.routine(a0)
	bne.s	SwitchActive
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$39A,obj.sprite_tile(a0)
	move.l	#SwitchSprites,obj.sprite_data(a0)
	move.b	#8,obj.height(a0)
	lea	switch_flags,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	lea	(a1,d0.w),a1
	move.w	a1,obj.var_3c(a0)

SwitchActive:
	move.b	obj.var_3f(a0),obj.var_3e(a0)
	lea	player_object,a1
	jsr	SolidObject
	movea.w	obj.var_3c(a0),a4
	sne	obj.var_3f(a0)
	bne.s	SwitchSetPressedState
	bclr	#7,(a4)
	bra.s	SwitchUpdateState

; ------------------------------------------------------------------------------

SwitchSetPressedState:
	bset	#7,(a4)
	bset	#6,(a4)

SwitchUpdateState:
	cmpi.w	#$FF,obj.var_3e(a0)
	bne.s	SwitchHandleRelease
	tst.b	obj.sprite_flags(a0)
	bpl.s	SwitchApplyPressMotion
	move.w	#$BF,d0
	jsr	PlayFmSound


SwitchApplyPressMotion:
	bchg	#5,(a4)
	addq.w	#8,obj.y(a1)
	addq.w	#4,obj.y(a0)
	addq.b	#1,obj.sprite_frame(a0)
	subq.b	#4,obj.height(a0)

SwitchHandleRelease:
	cmpi.w	#-$100,obj.var_3e(a0)
	bne.s	SwitchDrawAndDespawn
	subq.w	#8,obj.y(a1)
	subq.w	#4,obj.y(a0)
	subq.b	#1,obj.sprite_frame(a0)
	addq.b	#4,obj.height(a0)

SwitchDrawAndDespawn:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

SwitchSprites:
	include	"sprites/r6/switch.asm"
	even

; ------------------------------------------------------------------------------
