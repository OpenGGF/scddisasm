; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Spikes object (R5)
; ------------------------------------------------------------------------------

spikes.y		equ obj.var_32				; Origin Y
spikes.attach		equ obj.var_34				; Attachment object
spikes.x		equ obj.var_36				; Origin X
spikes.attach_x		equ obj.var_38				; Attachment X offset
spikes.attach_y		equ obj.var_39				; Attachment Y offset
spikes.timer		equ obj.var_3a				; Timer
spikes.offset		equ obj.var_3b				; Move offset
spikes.direction	equ obj.var_3c				; Move direction

; ------------------------------------------------------------------------------

SpikesObject:
	moveq	#0,d0						; Run routine
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jsr	.Routines(pc,d0.w)

	jsr	DrawObject					; Draw sprite

	moveq	#0,d1						; Get attachment
	move.w	spikes.attach(a0),d1
	beq.s	.CheckDespawn					; If there's no attachment, branch

	movea.w	d1,a1						; Position ourselves onto attachment
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	spikes.attach_x(a0),d0				; Add X offset
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	spikes.attach_y(a0),d0				; Add Y offset
	ext.w	d0
	add.w	d0,obj.y(a0)

.CheckDespawn:
	move.w	spikes.x(a0),d0					; Get distance off screen
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0					; Are we far enough off screen?
	bhi.s	.Despawn					; If so, branch
	rts

.Despawn:
	bra.w	SpikesDespawn					; Despawn

; ------------------------------------------------------------------------------

.Routines:
	dc.w	SpikesInit-.Routines				; Initialization
	dc.w	SpikesMain-.Routines				; Main

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

SpikesProperties:
	dc.b	$12, $C, 0					; Up
	dc.b	$12, $C, $83					; Down
	dc.b	$A, $E, $82					; Right
	dc.b	$A, $E, $82					; Left

; ------------------------------------------------------------------------------

SpikesInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.w	#$44B,d0					; Set sprite tile
	move.w	d0,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)				; Set sprite layer
	move.l	#SpikesSprites,obj.sprite_data(a0)		; Set sprite data
	move.w	obj.x(a0),spikes.x(a0)				; Set origin position
	move.w	obj.y(a0),spikes.y(a0)

	moveq	#0,d0						; Get type
	move.b	obj.subtype(a0),d0
	andi.b	#3,d0
	move.b	d0,d1
	move.b	d0,obj.sprite_frame(a0)				; Set sprite frame

	add.b	d0,d0						; Get properties
	add.b	d1,d0
	lea	SpikesProperties(pc,d0.w),a1
	move.b	(a1)+,obj.width_2(a0)				; Set width
	move.b	(a1)+,obj.height(a0)				; Set height
	move.b	(a1)+,obj.collide_type(a0)			; Set collision type

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

SpikesMain:
	jsr	SpikesMove(pc)					; Handle movement
	tst.b	obj.sprite_frame(a0)				; Are we facing upwards?
	beq.s	.Upwards					; If so, branch

	lea	player_object,a1				; Handle solidity
	jmp	SolidObject

.Upwards:
	lea	player_object,a1				; Handle solidity
	jsr	SolidObject
	beq.s	.End						; If there was no collision, branch
	btst	#3,obj.flags(a0)				; Is the player standing on us?
	beq.s	.End						; If not, branch
	tst.b	warping						; Is the player warping?
	bne.s	.End						; If so, branch
	tst.b	invincible					; Is the player invincible?
	bne.s	.End						; If so, branch

	move.l	a0,-(sp)					; Save registers

	movea.l	a0,a2						; Mark us as the hazardous object
	lea	player_object,a0				; Get player
	cmpi.b	#4,obj.routine(a0)				; Is the player hurt or dead?
	bcc.s	.NoHurt						; If so, branch
	tst.w	obj.var_30(a0)					; Is the player temporarily invulernable?
	bne.s	.NoHurt						; If so, branch

	move.l	obj.y(a0),d3					; Reverse player's Y movement
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)

	jsr	HurtPlayer					; Hurt the player

.NoHurt:
	movea.l	(sp)+,a0					; Restore registers

.End:
	rts

; ------------------------------------------------------------------------------
; Handle movement
; ------------------------------------------------------------------------------

SpikesMove:
	moveq	#0,d0						; Get type
	move.b	obj.subtype(a0),d0
	btst	#2,d0						; Should we move at all?
	beq.s	.End						; If not, branch
	andi.b	#3,d0						; If so, handle movement
	add.w	d0,d0
	move.w	.Movements(pc,d0.w),d0
	jmp	.Movements(pc,d0.w)

.End:
	rts

; ------------------------------------------------------------------------------

.Movements:
	dc.w	SpikesUpMove-.Movements				; Up
	dc.w	SpikesDownMove-.Movements			; Down
	dc.w	SpikesRightMove-.Movements			; Right
	dc.w	SpikesLeftMove-.Movements			; Left

; ------------------------------------------------------------------------------
; Up movement
; ------------------------------------------------------------------------------

SpikesUpMove:
	jsr	SpikesCheckMove(pc)				; Check movement

	moveq	#0,d0						; Apply offset to Y position
	move.b	spikes.offset(a0),d0
	add.w	spikes.y(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------
; Down movement
; ------------------------------------------------------------------------------

SpikesDownMove:
	jsr	SpikesCheckMove(pc)				; Check movement

	moveq	#0,d0						; Apply offset to Y position
	move.b	spikes.offset(a0),d0
	neg.w	d0
	add.w	spikes.y(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------
; Right movement
; ------------------------------------------------------------------------------

SpikesRightMove:
	jsr	SpikesCheckMove(pc)				; Check movement

	moveq	#0,d0						; Apply offset to X position
	move.b	spikes.offset(a0),d0
	neg.w	d0
	add.w	spikes.x(a0),d0
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------
; Left movement
; ------------------------------------------------------------------------------

SpikesLeftMove:
	jsr	SpikesCheckMove(pc)				; Check movement

	moveq	#0,d0						; Apply offset to X position
	move.b	spikes.offset(a0),d0
	add.w	spikes.x(a0),d0
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------
; Check movement
; ------------------------------------------------------------------------------

SpikesCheckMove:
	tst.b	spikes.timer(a0)				; Is the timer active?
	beq.s	.CheckDirection					; If not, branch
	subq.b	#1,spikes.timer(a0)				; Decrement timer
	bne.s	.End						; If it hasn't run out, branch

.CheckDirection:
	tst.b	spikes.direction(a0)				; Should we move inwards?
	beq.s	.MoveInwards					; If so, branch

	subq.b	#8,spikes.offset(a0)				; Move outwards
	bcc.s	.End						; If we aren't done, branch

	move.b	#0,spikes.offset(a0)				; Cap offset
	move.b	#0,spikes.direction(a0)				; Reverse direction
	move.b	#60,spikes.timer(a0)				; Reset timer
	bra.s	.End

.MoveInwards:
	addq.b	#8,spikes.offset(a0)				; Move inwards
	cmpi.b	#$20,spikes.offset(a0)				; Have we moved in enough?
	bcs.s	.End						; If not, branch

	move.b	#$20,spikes.offset(a0)				; Cap offset
	move.b	#1,spikes.direction(a0)				; Reverse direction
	move.b	#60,spikes.timer(a0)				; Reset timer

.End:
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

SpikesSprites:
	include	"sprites/r5/spikes.asm"
	even

; ------------------------------------------------------------------------------
; Despawn
; ------------------------------------------------------------------------------

SpikesDespawn:
	moveq	#0,d0						; Get state slot ID
	move.b	obj.state_id(a0),d0
	beq.s	.Delete						; If there's no state, branch

	lea	object_states,a1				; Get state slot
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1						; Get time zone specific slot
	move.b	time_zone,d1
	add.w	d1,d0

	bclr	#7,2(a1,d0.w)					; Clear spawned flag

.Delete:
	jmp	DeleteObject					; Delete ourselves

; ------------------------------------------------------------------------------
