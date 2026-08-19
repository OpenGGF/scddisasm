; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Swing object (R5)
; ------------------------------------------------------------------------------

swing.parent		equ obj.var_2a				; Parent
swing.angle		equ obj.var_2c				; Angle
swing.max_angle		equ obj.var_2e				; Maximum angle
swing.speed		equ obj.var_32				; Speed
swing.length		equ obj.var_36				; Length
swing.links		equ obj.var_38				; Chain links

; ------------------------------------------------------------------------------

SwingObject:
	tst.b	obj.subtype_2(a0)				; Are we the main object?
	beq.s	.Main						; If so, branch
	bpl.w	SwingLinkObject					; If we are a chain link, branch
	bra.w	SwingPlatformObject				; If we are a platform, branch

.Main:
	tst.b	obj.routine(a0)					; Have we been initialized?
	bne.w	SwingMain					; If so, branch
	
; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

SwingInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.b	#8,obj.width(a0)				; Set width
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)				; Set height
	move.b	#3,obj.sprite_layer(a0)				; Set sprite layer
	move.w	#$358,obj.sprite_tile(a0)			; Set sprite tile
	move.l	#SwingSprites,obj.sprite_data(a0)		; Set sprite data

	lea	SwingProperties(pc),a1				; Get subtype properties
	move.b	obj.subtype(a0),d0
	andi.w	#$FFFE,d0
	add.w	d0,d0
	adda.w	d0,a1
	move.w	(a1)+,swing.length(a0)				; Set length
	move.w	(a1),swing.max_angle+2(a0)			; Set maximum angle

	move.w	#$100,swing.speed+2(a0)				; Set speed
	btst	#0,obj.subtype(a0)				; Should we swing the opposite direction?
	beq.s	.InitChainLinks					; If not, branch
	neg.l	swing.max_angle(a0)				; If so, reverse maximum angle
	neg.l	swing.speed(a0)					; If so, reverse speed

.InitChainLinks:
	lea	swing.links(a0),a6				; Get chain links
	move.w	swing.length(a0),d6				; Get length

.InitChainLinksLoop:
	jsr	SpawnObjectAfter				; Spawn chain link
	bne.w	SwingDelete					; If it failed, delete ourselves

	move.w	a1,d0						; Set chain link slot
	lsr.w	#6,d0
	move.b	d0,(a6)+
	
	move.b	#1,obj.subtype_2(a1)				; Set chain link subtype
	move.w	a0,swing.parent(a1)				; Set parent
	move.b	obj.id(a0),obj.id(a1)				; Set ID
	move.w	obj.x(a0),obj.x(a1)				; Set X position
	move.w	obj.y(a0),obj.y(a1)				; Set Y position
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)	; Set sprite flags
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)		; Set sprite data

	dbf	d6,.InitChainLinksLoop				; Loop until finished
	
	move.b	#-1,obj.subtype_2(a1)				; Set last link to platform

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

SwingMain:
	move.l	swing.angle-2(a0),d6				; Increment angle
	add.l	swing.speed(a0),d6

	move.l	swing.max_angle(a0),d5				; Should we be swinging at all?
	beq.s	.UpdateAngle					; If not, branch

	move.l	d6,d1						; Get angle
	move.l	d5,d0						; Get maximum angle
	bpl.s	.CheckMinAngle					; If it's positive, branch
	neg.l	d1						; Get absolute value of angle
	neg.l	d0						; Get absolute value of maximum angle

.CheckMinAngle:
	tst.l	d1						; Has it reached the minimum angle?
	bge.s	.CheckMaxAngle					; If so, branch
	moveq	#0,d6						; If not, cap at minimum angle
	bra.s	.Reverse					; Reverse direction

.CheckMaxAngle:
	cmp.l	d0,d1						; Has it reached the maximum angle?
	ble.s	.UpdateAngle					; If not, branch
	move.l	d5,d6						; If so, cap at maximum angle

.Reverse:
	neg.l	swing.speed(a0)					; Reverse direction

.UpdateAngle:
	move.l	d6,swing.angle-2(a0)				; Update angle

	lea	swing.links(a0),a6				; Get chain links
	move.w	swing.length(a0),d6				; Get length without platform
	subq.w	#1,d6

	move.l	obj.x(a0),d5					; Get position
	move.l	obj.y(a0),d4

	moveq	#0,d1						; Get sine and cosine of angle
	moveq	#0,d0
	move.b	swing.angle(a0),d0
	jsr	SineCosine
	swap	d1						; Extend them to 16.16 fixed point
	swap	d0
	asr.l	#4,d1						; Divide them by 16
	asr.l	#4,d0

loc_20E8BC:
	moveq	#$FFFFFFFF,d2					; Get chain link
	move.b	(a6)+,d2
	lsl.w	#6,d2
	movea.w	d2,a1

	add.l	d1,d5						; Move down chain
	add.l	d0,d4
	move.l	d5,obj.x(a1)					; Set chain link position
	move.l	d4,obj.y(a1)

	dbf	d6,loc_20E8BC					; Loop until finished
	
	moveq	#$FFFFFFFF,d2					; Get platform
	move.b	(a6),d2
	lsl.w	#6,d2
	movea.w	d2,a1

	add.l	d1,d5						; Move down chain
	add.l	d0,d4
	move.l	obj.x(a1),d3					; Get platform X position
	move.l	d5,obj.x(a1)					; Set platform position
	move.l	d4,obj.y(a1)
	sub.l	d3,d5						; Set platform X speed based on distance moved
	asr.l	#8,d5
	move.w	d5,obj.x_speed(a1)

	jsr	DrawObject					; Draw sprite
	jmp	CheckObjectDespawn				; Check despawn

; ------------------------------------------------------------------------------
; Chain link
; ------------------------------------------------------------------------------

SwingLinkObject:
	tst.b	obj.routine(a0)					; Have we been initialized?
	bne.w	SwingLinkUpdate					; If so, branch

; ------------------------------------------------------------------------------
; Chain link initialization
; ------------------------------------------------------------------------------

SwingLinkInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	move.b	#1,obj.sprite_frame(a0)				; Set sprite frame
	move.b	#8,obj.width(a0)				; Set width
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)				; Set height
	move.b	#3,obj.sprite_layer(a0)				; Set sprite layer
	move.w	#$358,obj.sprite_tile(a0)			; Set sprite tile
	rts

; ------------------------------------------------------------------------------
; Platform
; ------------------------------------------------------------------------------

SwingPlatformObject:
	tst.b	obj.routine(a0)					; Have we been initialized?
	bne.s	SwingPlatformUpdate				; If so, branch

; ------------------------------------------------------------------------------
; Platform initialization
; ------------------------------------------------------------------------------

SwingPlatformInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	move.b	#2,obj.sprite_frame(a0)				; Set sprite frame
	move.b	#$20,obj.width(a0)				; Set width
	move.b	#$20,obj.width_2(a0)
	move.b	#8,obj.height(a0)				; Set height
	move.b	#2,obj.sprite_layer(a0)				; Set sprite layer
	move.w	#$431C,obj.sprite_tile(a0)			; Set sprite tile
	
; ------------------------------------------------------------------------------
; Platform update
; ------------------------------------------------------------------------------

SwingPlatformUpdate:
	lea	player_object,a1				; Handle solidity
	bsr.w	SwingPlatformSolid

; ------------------------------------------------------------------------------
; Chain link update
; ------------------------------------------------------------------------------

SwingLinkUpdate:
	movea.w	swing.parent(a0),a1				; Get parent
	cmpi.b	#$2A,obj.id(a1)					; Was it deleted?
	bne.s	SwingDelete					; If so, branch
	jmp	DrawObject					; If not, draw sprite

; ------------------------------------------------------------------------------
; Delete
; ------------------------------------------------------------------------------

SwingDelete:
	jmp	DeleteObject					; Delete ourselves

; ------------------------------------------------------------------------------
; Handle platform solidity
; ------------------------------------------------------------------------------

SwingPlatformSolid:
	; This keeps the player on top of the platform when moving downwards
	move.w	obj.x_speed(a0),-(sp)				; Save X speed
	move.w	#0,obj.x_speed(a0)				; Stop X movement
	move.b	#$A,obj.height(a0)				; Extend height
	jsr	TopSolidObject					; Handle solidity
	sne	d0						; Store result
	
	; This moves the player horizontally with the platform
	move.w	(sp)+,obj.x_speed(a0)				; Restore X speed
	move.b	#8,obj.height(a0)				; Restore height
	tst.b	d0						; Was there a collision?
	beq.s	.End						; If not, branch
	jsr	TopSolidObject					; If so, handle solidity again
	beq.s	.End						; If there's no collision, branch

	moveq	#2,d0						; Conveyor speed
	tst.b	r5_conveyor_reverse				; Are conveyor belts reversed?
	beq.s	.MovePlayer					; If not, branch
	neg.w	d0						; If so, reverse speed

.MovePlayer:
	add.w	d0,obj.x(a1)					; Move player

.End:
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

SwingSprites:
	include	"src/sprites/r5/swing.asm"
	even

SwingProperties:
	dc.w	6-1, 0
	dc.w	6-1, $8000
	dc.w	8-1, $4000
	
; ------------------------------------------------------------------------------
