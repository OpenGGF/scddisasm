; ------------------------------------------------------------------------------

drain_switch.cooldown		equ obj.var_2a	; Frames before another activation
drain_switch.block_link		equ obj.var_2c	; Linked drain block object slot
drain_switch.stage		equ obj.var_2e	; Light stage: -2, 0, 2, or 4
drain_switch.light_1_link	equ obj.var_30	; Newest linked indicator light
drain_switch.light_2_link	equ obj.var_32	; Middle linked indicator light
drain_switch.light_3_link	equ obj.var_34	; Oldest linked indicator light
drain_switch.player_inside	equ obj.var_3e	; Player overlap latch
drain_switch.player_2_inside	equ obj.var_3f	; Reserved second-player latch
drain_switch_child.parent_link	equ obj.var_36	; Parent switch object slot

DrainSwitchObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	DrainSwitch_Routines(pc,d0.w),d0
	jsr	DrainSwitch_Routines(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

DrainSwitch_Routines:
	dc.w	DrainSwitch_Init-*
	dc.w	DrainSwitch_Main-DrainSwitch_Routines

; ------------------------------------------------------------------------------

DrainSwitch_Init:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$443E,obj.sprite_tile(a0)
	move.l	#DrainSwitchSprites,obj.sprite_data(a0)
	move.w	#$FFFE,drain_switch.stage(a0)
	cmpi.b	#$FF,obj.subtype(a0)
	bne.s	.SpawnBlock
	move.w	#$80,drain_switch.cooldown(a0)
	st	drain_switch.player_inside(a0)
	st	drain_switch.player_2_inside(a0)

.SpawnBlock:
	jsr	SpawnObject
	bne.s	DrainSwitch_Main
	move.w	a1,drain_switch.block_link(a0)
	move.w	a0,drain_switch_child.parent_link(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	#$380,obj.x(a1)
	move.w	#$4F8,obj.y(a1)

DrainSwitch_Main:
	lea	player_object,a6
	lea	drain_switch.player_inside(a0),a5
	bsr.w	DrainSwitch_CheckPlayer
	tst.w	drain_switch.cooldown(a0)
	beq.s	.End
	addi.w	#-1,drain_switch.cooldown(a0)
	lea	DrainSwitchAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

DrainSwitch_CheckPlayer:
	move.w	obj.y(a0),d0
	sub.w	obj.y(a6),d0
	subi.w	#-$10,d0
	subi.w	#$20,d0
	bcc.s	.Outside
	move.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	subi.w	#-$10,d0
	subi.w	#$20,d0
	bcc.s	.Outside
	tst.b	(a5)
	bne.s	.End
	st	(a5)
	move.w	#$FF,obj.anim_id(a0)
	tst.w	obj.y_speed(a6)
	bpl.s	.SetCooldown
	move.w	#$1FF,obj.anim_id(a0)

.SetCooldown:
	move.w	drain_switch.cooldown(a0),d0
	move.w	#$80,drain_switch.cooldown(a0)
	tst.w	d0
	beq.s	DrainSwitch_AdvanceStage

.End:
	rts

; ------------------------------------------------------------------------------

.Outside:
	sf	(a5)
	rts

; ------------------------------------------------------------------------------

DrainSwitch_AdvanceStage:
	cmpi.w	#4,drain_switch.stage(a0)
	beq.s	DrainSwitch_Reset
	addq.w	#2,drain_switch.stage(a0)
	move.w	drain_switch.light_2_link(a0),drain_switch.light_3_link(a0)
	move.w	drain_switch.light_1_link(a0),drain_switch.light_2_link(a0)
	jsr	SpawnObject
	bne.s	.CheckRaised
	move.w	a1,drain_switch.light_1_link(a0)
	move.w	a0,drain_switch_child.parent_link(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.w	#$380,obj.x(a1)
	move.w	drain_switch.stage(a0),d0
	move.w	DrainSwitch_LightYPositions(pc,d0.w),obj.y(a1)

.CheckRaised:
	cmpi.w	#4,drain_switch.stage(a0)
	bne.s	.End
	movea.w	drain_switch.block_link(a0),a1
	move.b	#4,obj.routine(a1)

.End:
	rts

; ------------------------------------------------------------------------------

; Indicator-light Y positions selected by the even stage index 0, 2, or 4.
DrainSwitch_LightYPositions:
	dc.w	$498
	dc.w	$4B0
	dc.w	$4C8

; ------------------------------------------------------------------------------

DrainSwitch_Reset:
	move.w	#-2,drain_switch.stage(a0)
	movea.w	drain_switch.light_1_link(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	drain_switch.light_2_link(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	drain_switch.light_3_link(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	drain_switch.block_link(a0),a1
	move.b	#6,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

DrainSwitchAnims:
	include	"anims/r3/drain_switch.asm"
	even

DrainSwitchSprites:
	include	"sprites/r3/drain_switch.asm"
	even

; ------------------------------------------------------------------------------
