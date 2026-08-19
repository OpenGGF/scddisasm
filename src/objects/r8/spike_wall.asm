; ------------------------------------------------------------------------------

SpikeWallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E718(pc,d0.w),d0
	jmp	off_20E718(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E718:
	dc.w	SpikeWallObject_0_Routine0-*
	dc.w	SpikeWallObject_0_Routine2-off_20E718

; ------------------------------------------------------------------------------

SpikeWallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#Spr_20E7A6,obj.sprite_data(a0)
	move.w	#$8440,obj.sprite_tile(a0)
	move.w	obj.x(a0),obj.var_30(a0)
	move.b	#$B1,obj.var_33(a0)
	move.l	#$5000,obj.var_2c(a0)
	move.l	#$4C100110,obj.height(a0)

SpikeWallObject_0_Routine2:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	moveq	#0,d0
	tst.b	stage_layer
	bne.s	loc_20E766
	move.b	obj.var_33(a0),d0

loc_20E766:
	move.b	d0,obj.collide_type(a0)
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20E786
	move.w	#$199,obj.var_2a(a0)
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

loc_20E786:
	lea	SpikeWallAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_30(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

SpikeWallAnims:
	include	"src/anims/r8/spike_wall.asm"
	even

Spr_20E7A6:
	dc.w	@Spr_20E7A6_0-*
	dc.w	@Spr_20E7A6_1-Spr_20E7A6

@Spr_20E7A6_0:
	dc.b	$15
	dc.b	$B4, 1, 0, 2, $F8
	dc.b	$B4, 1, 8, 2, 0
	dc.b	$3C, 1, $10, 2, $F8
	dc.b	$3C, 1, $18, 2, 0
	dc.b	$C4, 6, 0, 4, $F8
	dc.b	$C4, 2, 0, $A, $F0
	dc.b	$C4, 2, 8, $A, 8
	dc.b	$DC, 6, 0, 4, $F8
	dc.b	$DC, 2, 0, $A, $F0
	dc.b	$DC, 2, 8, $A, 8
	dc.b	$F4, 6, 0, 4, $F8
	dc.b	$F4, 2, 0, $A, $F0
	dc.b	$F4, 2, 8, $A, 8
	dc.b	$C, 6, 0, 4, $F8
	dc.b	$C, 2, 0, $A, $F0
	dc.b	$C, 2, 8, $A, 8
	dc.b	$24, 6, 0, 4, $F8
	dc.b	$24, 2, 0, $A, $F0
	dc.b	$24, 2, 8, $A, 8
	dc.b	$B5, 0, 8, 0, $F0
	dc.b	$43, 0, 8, 1, $F0

@Spr_20E7A6_1:
	dc.b	$15
	dc.b	$B4, 1, 0, 2, $F8
	dc.b	$B4, 1, 8, 2, 0
	dc.b	$3C, 1, $10, 2, $F8
	dc.b	$3C, 1, $18, 2, 0
	dc.b	$C4, 6, 0, 4, $F8
	dc.b	$C4, 2, 0, $A, $F0
	dc.b	$C4, 2, 8, $A, 8
	dc.b	$DC, 6, 0, 4, $F8
	dc.b	$DC, 2, 0, $A, $F0
	dc.b	$DC, 2, 8, $A, 8
	dc.b	$F4, 6, 0, 4, $F8
	dc.b	$F4, 2, 0, $A, $F0
	dc.b	$F4, 2, 8, $A, 8
	dc.b	$C, 6, 0, 4, $F8
	dc.b	$C, 2, 0, $A, $F0
	dc.b	$C, 2, 8, $A, 8
	dc.b	$24, 6, 0, 4, $F8
	dc.b	$24, 2, 0, $A, $F0
	dc.b	$24, 2, 8, $A, 8
	dc.b	$B5, 0, 8, 1, $F0
	dc.b	$43, 0, 8, 0, $F0

; ------------------------------------------------------------------------------
