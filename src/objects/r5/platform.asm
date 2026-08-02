; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Platform object (R5)
; ------------------------------------------------------------------------------

ptfm.offset		equ obj.var_2c				; Move offset
ptfm.speed		equ obj.var_2e				; Move speed
ptfm.accelerate		equ obj.var_30				; Move acceleration
ptfm.y			equ obj.var_32				; Origin Y
ptfm.x			equ obj.var_36				; Origin X
ptfm.timer		equ obj.var_3b				; Timer
ptfm.direction		equ obj.var_3c				; Move direction
ptfm.stood_on		equ obj.var_3d				; Stood on flag/routine
ptfm.sink		equ obj.var_3e				; Sink offset
ptfm.flags		equ obj.var_3f				; Flags

; ------------------------------------------------------------------------------

PlatformObject:
	moveq	#0,d0						; Run routine
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jsr	.Routines(pc,d0.w)

	jsr	DrawObject					; Draw sprite
	move.w	ptfm.x(a0),d0					; Check despawn
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

.Routines:
	dc.w	PlatformInit-.Routines				; Initialization
	dc.w	PlatformMain-.Routines				; Main

; ------------------------------------------------------------------------------
; Handle solidity
; ------------------------------------------------------------------------------

PlatformSolid:
	lea	player_object,a1				; Handle solidity
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

PlatformProperties:
	dc.b	0, $10						; Small (Static)
	dc.b	1, $10						; Small (Horizontal 48, Conveyor)
	dc.b	0, $10						; Small (Horizontal 48, Spring)
	dc.b	0, $10						; Small (Vertical 48)
	dc.b	1, $10						; Small (Vertical 48, Conveyor)
	dc.b	0, $10						; Small (Up)
	dc.b	0, $10						; Small (Fall)
	dc.b	2, $20						; Medium (Static)
	dc.b	2, $20						; Medium (Horizontal 32)
	dc.b	3, $20						; Medium (Horizontal 32, Conveyor)
	dc.b	2, $20						; Medium (Vertical 48)
	dc.b	3, $20						; Medium (Vertical 48, Conveyor)
	dc.b	2, $20						; Medium (Horizontal 48)
	dc.b	3, $20						; Medium (Horizontal 48, Conveyor)
	dc.b	2, $20						; Medium (Horizontal 48, Springs)
	dc.b	2, $20						; Medium (Up)
	dc.b	2, $20						; Medium (Fall)
	dc.b	4, $30						; Large (Static)
	dc.b	5, $30						; Large (Static, Conveyor)
	dc.b	4, $30						; Large (Vertical 48)
	dc.b	4, $30						; Large (Horizontal 48)
	dc.b	5, $30						; Large (Horizontal 48, Conveyor)
	dc.b	4, $30						; Large (Horizontal 48, Springs)
	dc.b	4, $30						; Large (Up)
	dc.b	4, $30						; Large (Fall)

PlatformConveyorFlags:
	dc.b	0						; Small (Static)
	dc.b	1						; Small (Horizontal 48, Conveyor)
	dc.b	0						; Small (Horizontal 48, Spring)
	dc.b	0						; Small (Vertical 48)
	dc.b	1						; Small (Vertical 48, Conveyor)
	dc.b	0						; Small (Up)
	dc.b	0						; Small (Fall)
	dc.b	0						; Medium (Static)
	dc.b	0						; Medium (Horizontal 32)
	dc.b	1						; Medium (Horizontal 32, Conveyor)
	dc.b	0						; Medium (Vertical 48)
	dc.b	1						; Medium (Vertical 48, Conveyor)
	dc.b	0						; Medium (Horizontal 48)
	dc.b	1						; Medium (Horizontal 48, Conveyor)
	dc.b	0						; Medium (Horizontal 48, Springs)
	dc.b	0						; Medium (Up)
	dc.b	0						; Medium (Fall)
	dc.b	0						; Large (Static)
	dc.b	1						; Large (Static, Conveyor)
	dc.b	0						; Large (Vertical 48)
	dc.b	0						; Large (Horizontal 48)
	dc.b	1						; Large (Horizontal 48, Conveyor)
	dc.b	0						; Large (Horizontal 48, Springs)
	dc.b	0						; Large (Up)
	dc.b	0						; Large (Fall)
	even

	; Unused
	dc.b	0						; Small (Static)
	dc.b	$C0						; Small (Horizontal 48, Conveyor)
	dc.b	$C0						; Small (Horizontal 48, Spring)
	dc.b	$C0						; Small (Vertical 48)
	dc.b	$C0						; Small (Vertical 48, Conveyor)
	dc.b	0						; Small (Up)
	dc.b	0						; Small (Fall)
	dc.b	0						; Medium (Static)
	dc.b	$40						; Medium (Horizontal 32)
	dc.b	$40						; Medium (Horizontal 32, Conveyor)
	dc.b	$C0						; Medium (Vertical 48)
	dc.b	$C0						; Medium (Vertical 48, Conveyor)
	dc.b	$C0						; Medium (Horizontal 48)
	dc.b	$C0						; Medium (Horizontal 48, Conveyor)
	dc.b	$C0						; Medium (Horizontal 48, Springs)
	dc.b	0						; Medium (Up)
	dc.b	0						; Medium (Fall)
	dc.b	0						; Large (Static)
	dc.b	0						; Large (Static, Conveyor)
	dc.b	$C0						; Large (Vertical 48)
	dc.b	$C0						; Large (Horizontal 48)
	dc.b	$C0						; Large (Horizontal 48, Conveyor)
	dc.b	$C0						; Large (Horizontal 48, Springs)
	dc.b	0						; Large (Up)
	dc.b	0						; Large (Fall)
	even

PlatformSpringCounts:
	dc.b	0						; Small (Static)
	dc.b	0						; Small (Horizontal 48, Conveyor)
	dc.b	1						; Small (Horizontal 48, Spring)
	dc.b	0						; Small (Vertical 48)
	dc.b	0						; Small (Vertical 48, Conveyor)
	dc.b	0						; Small (Up)
	dc.b	0						; Small (Fall)
	dc.b	0						; Medium (Static)
	dc.b	0						; Medium (Horizontal 32)
	dc.b	0						; Medium (Horizontal 32, Conveyor)
	dc.b	0						; Medium (Vertical 48)
	dc.b	0						; Medium (Vertical 48, Conveyor)
	dc.b	0						; Medium (Horizontal 48)
	dc.b	0						; Medium (Horizontal 48, Conveyor)
	dc.b	2						; Medium (Horizontal 48, Springs)
	dc.b	0						; Medium (Up)
	dc.b	0						; Medium (Fall)
	dc.b	0						; Large (Static)
	dc.b	0						; Large (Static, Conveyor)
	dc.b	0						; Large (Vertical 48)
	dc.b	0						; Large (Horizontal 48)
	dc.b	0						; Large (Horizontal 48, Conveyor)
	dc.b	3						; Large (Horizontal 48, Springs)
	dc.b	0						; Large (Up)
	dc.b	0						; Large (Fall)
	even

; ------------------------------------------------------------------------------

PlatformInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.b	#3,obj.sprite_layer(a0)				; Set sprite layer

	move.w	#$4304,d0					; Act 1/2 sprite tile
	cmpi.b	#2,act						; Are we in act 3?
	bne.s	loc_20C9BA					; If not, branch
	move.w	#$4378,d0					; Act 3 sprite tile

loc_20C9BA:
	move.w	d0,obj.sprite_tile(a0)				; Set sprite tile
	move.l	#PlatformSprites,obj.sprite_data(a0)		; Set sprite data
	move.w	obj.x(a0),ptfm.x(a0)				; Set origin position
	move.w	obj.y(a0),ptfm.y(a0)
	move.b	#$10,obj.height(a0)				; Set height
	
	moveq	#0,d0						; Get subtype
	moveq	#0,d1
	move.b	obj.subtype(a0),d0
	andi.b	#$1F,d0
	move.b	d0,d1
	add.b	d1,d1

	lea	PlatformProperties,a2				; Get properties
	lea	(a2,d1.w),a2
	move.b	(a2)+,obj.sprite_frame(a0)			; Set sprite frame
	move.b	(a2)+,obj.width_2(a0)				; Set width

	lea	PlatformConveyorFlags,a2			; Set conveyor belt flag
	move.b	(a2,d0.w),ptfm.flags(a0)

	lea	PlatformSpringCounts,a2				; Get spring count
	move.b	(a2,d0.w),d1
	beq.s	.GoToMain					; If it's 0, branch
	
.CheckSpring1:
	cmpi.b	#1,d1						; Should we spawn 1 spring?
	bne.s	.CheckSpring2					; If not, branch

	clr.b	d2						; Spawn spring
	bsr.w	PlatformSpawnSpring
	bra.s	.GoToMain					; Go to main

.CheckSpring2:
	cmpi.b	#2,d1						; Should we spawn 2 springs?
	bne.s	.CheckSpring3					; If not, branch

	move.b	#-$10,d2					; Spawn left spring
	bsr.w	PlatformSpawnSpring
	move.b	#$10,d2						; Spawn right spring
	bsr.w	PlatformSpawnSpring
	bra.s	.GoToMain					; Go to main

.CheckSpring3:
	cmpi.b	#3,d1						; Should we spawn 3 springs?
	bne.s	.GoToMain					; If not, branch

	move.b	#-$20,d2					; Spawn left spring
	bsr.w	PlatformSpawnSpring
	clr.b	d2						; Spawn center spring
	bsr.w	PlatformSpawnSpring
	move.b	#$20,d2						; Spawn right spring
	bsr.w	PlatformSpawnSpring

.GoToMain:
	bra.w	PlatformMain					; Go to main

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

PlatformMain:
	move.b	obj.subtype(a0),d0				; Handle platform type
	andi.w	#$1F,d0
	add.w	d0,d0
	move.w	.Types(pc,d0.w),d0
	jsr	.Types(pc,d0.w)

	bsr.w	PlatformSink					; Handle sinking
	bsr.w	PlatformConveyor				; Handle conveyor belt
	bra.w	PlatformSolid					; Handle solidity

; ------------------------------------------------------------------------------

.Types:
	dc.w	PlatformStatic-.Types				; Small (Static)
	dc.w	PlatformMoveX48-.Types				; Small (Horizontal 48, Conveyor)
	dc.w	PlatformMoveX48-.Types				; Small (Horizontal 48, Spring)
	dc.w	PlatformMoveY48-.Types				; Small (Vertical 48)
	dc.w	PlatformMoveY48-.Types				; Small (Vertical 48, Conveyor)
	dc.w	PlatformMoveUp-.Types				; Small (Up)
	dc.w	PlatformFall-.Types				; Small (Fall)
	dc.w	PlatformStatic-.Types				; Medium (Static)
	dc.w	PlatformMoxeX32-.Types				; Medium (Horizontal 32)
	dc.w	PlatformMoxeX32-.Types				; Medium (Horizontal 32, Conveyor)
	dc.w	PlatformMoveY48-.Types				; Medium (Vertical 48)
	dc.w	PlatformMoveY48-.Types				; Medium (Vertical 48, Conveyor)
	dc.w	PlatformMoveX48-.Types				; Medium (Horizontal 48)
	dc.w	PlatformMoveX48-.Types				; Medium (Horizontal 48, Conveyor)
	dc.w	PlatformMoveX48-.Types				; Medium (Horizontal 48, Springs)
	dc.w	PlatformMoveUp-.Types				; Medium (Up)
	dc.w	PlatformFall-.Types				; Medium (Fall)
	dc.w	PlatformStatic-.Types				; Large (Static)
	dc.w	PlatformStatic-.Types				; Large (Static, Conveyor)
	dc.w	PlatformMoveY48-.Types				; Large (Vertical 48)
	dc.w	PlatformMoveX48-.Types				; Large (Horizontal 48)
	dc.w	PlatformMoveX48-.Types				; Large (Horizontal 48, Conveyor)
	dc.w	PlatformMoveX48-.Types				; Large (Horizontal 48, Springs)
	dc.w	PlatformMoveUp-.Types				; Large (Up)
	dc.w	PlatformFall-.Types				; Large (Fall)

; ------------------------------------------------------------------------------
; Static
; ------------------------------------------------------------------------------

PlatformStatic:
	bset	#7,ptfm.flags(a0)				; Enable sinking
	rts

; ------------------------------------------------------------------------------
; Move horizontally (48 range)
; ------------------------------------------------------------------------------

PlatformMoveX48:
	bset	#7,ptfm.flags(a0)				; Enable sinking
	
	move.w	#4,ptfm.accelerate(a0)				; Do movement
	move.w	#$30,d4
	bsr.w	PlatformMove
	
; ------------------------------------------------------------------------------
; Move horizontally
; ------------------------------------------------------------------------------

PlatformMoveX:
	move.w	ptfm.speed(a0),d0				; Get speed
	tst.b	obj.subtype(a0)					; Are we going in reverse?
	bpl.s	.SetXSpeed					; If not, branch
	neg.w	d0						; If so, reverse speed

.SetXSpeed:
	move.w	d0,obj.x_speed(a0)				; Set X speed

	move.w	obj.x_speed(a0),d0				; Apply X speed
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------
; Move vertically (48 range)
; ------------------------------------------------------------------------------

PlatformMoveY48:
	move.w	#4,ptfm.accelerate(a0)				; Do movement
	move.w	#$30,d4
	bsr.w	PlatformMove

	move.w	ptfm.speed(a0),d0				; Get speed
	tst.b	obj.subtype(a0)					; Are we going in reverse?
	bpl.s	.ApplyYSpeed					; If not, branch
	neg.w	d0						; If so, reverse speed

.ApplyYSpeed:
	ext.l	d0						; Apply Y speed
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------
; Move horizontally (32 range)
; ------------------------------------------------------------------------------

PlatformMoxeX32:
	bset	#7,ptfm.flags(a0)				; Enable sinking

	move.w	#4,ptfm.accelerate(a0)				; Do movement
	move.w	#$20,d4
	bsr.w	PlatformMove
	bra.w	PlatformMoveX					; Move horizontally

; ------------------------------------------------------------------------------
; Fall
; ------------------------------------------------------------------------------

PlatformFall:
	tst.b	ptfm.stood_on(a0)				; Have we been stood on?
	bne.s	.CheckTimer					; If so, branch

	bset	#7,ptfm.flags(a0)				; Enable sinking
	btst	#3,obj.flags(a0)				; Are we being stood on?
	bne.s	.StartTimer					; If so, branch
	rts

.StartTimer:
	move.b	#30,ptfm.timer(a0)				; Set timer
	move.b	#1,ptfm.stood_on(a0)				; Set stood on flag

.CheckTimer:
	tst.b	ptfm.timer(a0)					; Is the timer active?
	beq.s	.SetHeight					; If not, branch
	subq.b	#1,ptfm.timer(a0)				; Decrement timer
	bne.s	.End						; If it hasn't run out, branch
	bclr	#7,ptfm.flags(a0)				; If it has, disable sinking

.SetHeight:
	; This extends the height as the platform falls down so
	; that the player sticks to the top and doesn't fall off
	move.b	#$10,obj.height(a0)				; Set normal height
	cmpi.w	#$200,obj.y_speed(a0)				; Are we moving at least 2 px/frame?
	bcs.s	.Fall						; If not, branch
	move.b	#$12,obj.height(a0)				; If so, extend height
	cmpi.w	#$300,obj.y_speed(a0)				; Are we moving at least 3 px/frame?
	bcs.s	.Fall						; If not, branch
	move.b	#$14,obj.height(a0)				; If so, extend height even further

.Fall:
	move.w	obj.y_speed(a0),d0				; Are we falling fast enough?
	cmpi.w	#$400,d0
	bcc.s	.ApplyYSpeed					; If so, branch
	addi.w	#$20,obj.y_speed(a0)				; If not, apply gravity

.ApplyYSpeed:
	move.w	obj.y_speed(a0),d0				; Apply Y speed
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)

	move.w	scroll_fg_y,d0					; Have we gone off screen?
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcc.s	.End						; If not, branch

	lea	player_object,a1				; Force player off of us
	jsr	GetOffObject
	jmp	DeleteObject					; Delete ourselves

.End:
	rts

; ------------------------------------------------------------------------------
; Move up
; ------------------------------------------------------------------------------

PlatformMoveUp:
	move.b	ptfm.stood_on(a0),d0				; Handle movement
	andi.w	#$FF,d0
	move.w	.Movements(pc,d0.w),d0
	jmp	.Movements(pc,d0.w)

; ------------------------------------------------------------------------------

.Movements:
	dc.w	PlatformMoveUpWait-.Movements			; Wait for player
	dc.w	PlatformMoveUpDo-.Movements			; Move
	dc.w	PlatformMoveUpDone-.Movements			; Done

; ------------------------------------------------------------------------------

PlatformMoveUpWait:
	bset	#7,ptfm.flags(a0)				; Enable sinking

	btst	#3,obj.flags(a0)				; Are we being stood on?
	bne.s	.StartTimer					; If so, branch
	rts

.StartTimer:
	addq.b	#2,ptfm.stood_on(a0)				; Next routine
	move.b	#30,ptfm.timer(a0)				; Set timer
	
; ------------------------------------------------------------------------------

PlatformMoveUpDo:
	tst.b	ptfm.timer(a0)					; Is the timer active?
	beq.s	.Accelerate					; If not, branch
	subq.b	#1,ptfm.timer(a0)				; Decrement timer
	bne.s	PlatformMoveUpDone				; If it hasn't run out, branch

	bclr	#7,ptfm.flags(a0)				; Disable sinking
	move.b	#$E,obj.height(a0)				; Shrink height

.Accelerate:
	move.w	obj.y_speed(a0),d0				; Accelerate upwards
	subq.w	#8,d0
	cmpi.w	#-$300,d0					; Are we moving fast enough?
	bcc.s	.SetYSpeed					; If not, branch
	move.w	#-$300,d0					; If so, cap speed

.SetYSpeed:
	move.w	d0,obj.y_speed(a0)				; Set Y speed

	jsr	MoveObject					; Apply speed

	move.l	obj.y(a0),-(sp)					; Check for ceiling 48 pixels up
	subi.w	#$30,obj.y(a0)
	jsr	CheckBlockUp
	move.l	(sp)+,obj.y(a0)
	tst.w	d1						; Are we about to hit the ceiling?
	bpl.s	PlatformMoveUpDone				; If not, branch

	move.b	#$10,obj.height(a0)				; Reset height
	clr.w	obj.y_speed(a0)					; Stop moving
	move.w	obj.y(a0),ptfm.y(a0)				; Set new origin Y
	bset	#7,ptfm.flags(a0)				; Enable sinking
	addq.b	#2,ptfm.stood_on(a0)				; Next routine
	
; ------------------------------------------------------------------------------

PlatformMoveUpDone:
	rts

; ------------------------------------------------------------------------------
; Handle movement
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d4.w - Movement range
;	a0.l - Platform object slot
; ------------------------------------------------------------------------------

PlatformMove:
	move.w	ptfm.accelerate(a0),d2				; Get acceleration
	tst.b	ptfm.direction(a0)				; Are we accelerating left?
	bne.s	.Left						; If so, branch

.Right:
	move.w	ptfm.speed(a0),d0				; Accelerate right
	add.w	d2,d0
	move.w	d0,ptfm.speed(a0)
	add.w	d0,ptfm.offset(a0)				; Apply speed
	
	cmp.b	ptfm.offset(a0),d4				; Should we turn around?
	bhi.s	.End						; If not, branch
	move.b	#-1,ptfm.direction(a0)				; If so, reverse direction
	bra.s	.End

.Left:
	move.w	ptfm.speed(a0),d0				; Accelerate left
	sub.w	d2,d0
	move.w	d0,ptfm.speed(a0)
	add.w	d0,ptfm.offset(a0)				; Apply speed
	
	cmp.b	ptfm.offset(a0),d4				; Should we turn around?
	bls.s	.End						; If not, branch
	clr.b	ptfm.direction(a0)				; If so, reverse direction

.End:
	rts

; ------------------------------------------------------------------------------
; Handle sinking
; ------------------------------------------------------------------------------

PlatformSink:
	btst	#7,ptfm.flags(a0)				; Is sinking enabled?
	beq.s	.End						; If not, branch

	btst	#3,obj.flags(a0)				; Are we being stood on?
	bne.s	.StoodOn					; If so, branch

	tst.b	ptfm.sink(a0)					; Have we moved back up enough?
	beq.s	.End						; If so, branch
	subq.b	#8,ptfm.sink(a0)				; If not, move back up
	bra.s	.MoveY						; Apply movement

.StoodOn:
	cmpi.b	#$40,ptfm.sink(a0)				; Have we moved down enough?
	beq.s	.End						; If so, branch
	addq.b	#8,ptfm.sink(a0)				; If not, move down

.MoveY:
	move.b	ptfm.sink(a0),d0				; Get Y offset
	jsr	SineCosine
	move.w	#$400,d1
	muls.w	d1,d0
	swap	d0
	add.w	ptfm.y(a0),d0					; Add origin Y
	move.w	d0,obj.y(a0)					; Set Y position

.End:
	rts

; ------------------------------------------------------------------------------
; Spawn spring
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d2.b - X offset
; ------------------------------------------------------------------------------

PlatformSpawnSpring:
	jsr	SpawnObject					; Spawn spring
	bne.s	.End						; If it failed, branch

	move.b	#$A,obj.id(a1)					; Set ID
	move.w	obj.y(a0),obj.y(a1)				; Set Y position
	move.w	obj.x(a0),obj.x(a1)				; Set X position
	move.b	d2,obj.var_38(a1)				; Set attachment X offset
	move.b	#-$18,obj.var_39(a1)				; Set attachment Y offset
	move.w	a0,obj.var_34(a1)				; Set attachment object
	move.b	#2,obj.subtype(a1)				; Set color to yellow

.End:
	rts

; ------------------------------------------------------------------------------
; Handle conveyor belt
; ------------------------------------------------------------------------------

PlatformConveyor:
	btst	#0,ptfm.flags(a0)				; Is the conveyor belt enabled?
	beq.s	.End						; If not, branch
	
	btst	#3,obj.flags(a0)				; Are we being stood on?
	beq.s	.End						; If not, branch
	
	lea	player_object,a1				; Get player
	tst.b	obj.id(a1)					; Does the player exist?
	beq.s	.End						; If not, branch
	btst	#3,obj.flags(a1)				; Is the player standing on an object?
	beq.s	.End						; If not, branch

	moveq	#0,d0						; Get object player is standing on
	move.b	obj.var_3d(a1),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	cmpa.w	d0,a0						; Is it us?
	bne.s	.End						; If not, branch

	move.b	time_zone,d1					; Get time zone
	
	move.l	#$8000,d0					; Past speed
	tst.b	d1						; Are we in the past?
	beq.s	.CheckDirection					; If so, branch

	move.l	#$10000,d0					; Present speed
	subq.b	#1,d1						; Are we in the present?
	beq.s	.CheckDirection					; If so, branch
	
	move.l	#$20000,d0					; Future speed

.CheckDirection:
	tst.b	r5_conveyor_reverse				; Are conveyor belts reversed?
	beq.s	.MovePlayerX					; If not, branch
	neg.l	d0						; If so, reverse speed

.MovePlayerX:
	add.l	d0,obj.x(a1)					; Move player horizontally

.End:
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

PlatformSprites:
	include	"src/sprites/r5/platform.asm"
	even

; ------------------------------------------------------------------------------