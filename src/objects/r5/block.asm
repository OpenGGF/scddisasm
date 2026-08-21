; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Block object (R5)
; ------------------------------------------------------------------------------

block.x_speed		equ obj.var_2a				; X speed
block.y_speed		equ obj.var_2e				; Y speed

; ------------------------------------------------------------------------------

BlockObject:
	tst.b	obj.subtype(a0)					; Are we a broken piece?
	bmi.w	BlockPieceObject				; If so, branch

	moveq	#0,d0						; Run routine
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jsr	.Routines(pc,d0.w)

	jsr	DrawObject					; Draw sprite
	jmp	CheckObjectDespawn				; Check despawn

; ------------------------------------------------------------------------------

.Routines:
	dc.w	BlockInit-.Routines				; Initialization
	dc.w	BlockMain-.Routines				; Main
	dc.w	BlockFall-.Routines				; Fall

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

BlockInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.b	#0,obj.sprite_frame(a0)				; Set sprite frame
	move.b	#3,obj.sprite_layer(a0)				; Set sprite layer
	move.b	#$10,obj.width(a0)				; Set width
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)				; Set height
	move.w	#$4332,obj.sprite_tile(a0)			; Set sprite tile
	move.l	#BlockSprites,obj.sprite_data(a0)		; Set sprite data

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

BlockMain:
	tst.b	obj.subtype(a0)					; Should we be able to fall?
	beq.s	.Solid						; If not, branch

	lea	player_object,a1				; Check if the player is nearby
	bsr.s	BlockCheckPlayer
	bcc.s	.Solid						; If not, branch
	addq.b	#2,obj.routine(a0)
	move.b	#$F8,obj.collide_type(a0)

.Solid:
	lea	player_object,a1				; Handle solidity
	jmp	SolidObject

; ------------------------------------------------------------------------------
; Check if the player is nearby
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Falling block object slot
;	a1.l - Player object slot
; RETURNS:
;	cc/cs - Not nearby/Nearby
; ------------------------------------------------------------------------------

BlockCheckPlayer:
	move.w	obj.y(a1),d0					; Is the player in range vertically?
	sub.w	obj.y(a0),d0
	subq.w	#8,d0
	subi.w	#$58,d0
	bcc.s	.End						; If not, branch

	move.w	obj.x(a1),d0					; Check if the player is in range horizontally
	sub.w	obj.x(a0),d0
	subi.w	#-8,d0
	subi.w	#$10,d0

.End:
	rts

; ------------------------------------------------------------------------------
; Fall
; ------------------------------------------------------------------------------

BlockFall:
	tst.b	obj.collide_status(a0)				; Has the player collided with us?
	bne.s	.Break						; If so, branch

	move.l	block.y_speed(a0),d0				; Apply Y speed
	add.l	d0,obj.y(a0)
	addi.l	#$4000,block.y_speed(a0)			; Apply gravity

	jsr	CheckBlockDown					; Have we touched the ground?
	tst.w	d1
	bmi.s	.Break						; If so, branch

	bra.w	BlockCheckOffScreen				; Check if we have fallen off screen?

.Break:
	lea	.Properties(pc),a6				; Broken piece properties
	moveq	#4-1,d6						; Number of broken pieces

.SpawnLoop:
	jsr	SpawnObject					; Spawn broken piece
	bne.s	.Explode					; If it failed, branch

	move.b	#3,obj.sprite_layer(a1)				; Set sprite layer
	move.b	#-1,obj.subtype(a1)				; Set broken piece subtype
	move.b	#8,obj.width(a1)				; Set width
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)				; Set height
	move.b	obj.id(a0),obj.id(a1)				; Set ID
	move.w	obj.x(a0),obj.x(a1)				; Set position
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)	; Set sprite flags
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)		; Set sprite data
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)		; Set sprite tile

	move.w	(a6)+,d0					; Set position offset
	move.w	(a6)+,d1
	add.w	d0,obj.x(a1)
	add.w	d1,obj.y(a1)
	move.l	(a6)+,block.x_speed(a1)				; Set trajectory
	move.l	(a6)+,block.y_speed(a1)

	move.b	d6,d0						; Set sprite frame
	addq.b	#1,d0
	move.b	d0,obj.sprite_frame(a1)

	dbf	d6,.SpawnLoop					; Loop until finished

.Explode:
	move.b	#$18,obj.id(a0)					; Turn into explosion
	move.b	#0,obj.routine(a0)
	move.b	#1,obj.routine_2(a0)				; Not from a badnik
	clr.w	obj.collide_type(a0)				; Disable collision

	tst.b	obj.sprite_flags(a0)				; Are we on screen?
	bpl.s	.End						; If not, branch

	move.w	#$9E,d0						; If so, play explosion sound
	jmp	PlayFmSound

.End:
	rts

; ------------------------------------------------------------------------------

.Properties:
	dc.w	-8, -8						; Top left
	dc.l	-$10000, -$40000
	dc.w	8, -8						; Top right
	dc.l	$10000, -$40000
	dc.w	-8, 8						; Bottom left
	dc.l	-$20000, -$30000
	dc.w	8, 8						; Bottom right
	dc.l	$20000, -$30000

; ------------------------------------------------------------------------------
; Block piece
; ------------------------------------------------------------------------------

BlockPieceObject:
	addi.l	#$4000,block.y_speed(a0)			; Apply gravity

	move.l	block.x_speed(a0),d0				; Apply speed
	move.l	block.y_speed(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)

	jsr	DrawObject					; Draw sprite

; ------------------------------------------------------------------------------
; Check if fallen off screen
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Falling block object slot
; ------------------------------------------------------------------------------

BlockCheckOffScreen:
	lea	player_object,a1				; Are we off screen?
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#-$E0,d0
	bgt.s	.End						; If not, branch
	jmp	DeleteObject					; If so, delete ourselves

.End:
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

BlockSprites:
	include	"sprites/r5/block.asm"
	even

; ------------------------------------------------------------------------------
