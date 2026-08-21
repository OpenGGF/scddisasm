; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Circling platform object (R5)
; ------------------------------------------------------------------------------

circle_ptfm.parent	equ obj.var_2a				; Parent
circle_ptfm.x		equ obj.var_2c				; Origin X
circle_ptfm.y		equ obj.var_30				; Origin Y
circle_ptfm.angle	equ obj.var_34				; Angle
circle_ptfm.speed	equ obj.var_36				; Speed

; ------------------------------------------------------------------------------

CirclePlatformObject:
	tst.b	obj.routine(a0)					; Are we initialized?
	bne.w	CirclePlatformMain				; If so, branch

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

CirclePlatformInit:
	lea	CirclePtfmProperties(pc),a1			; Get properties
	moveq	#0,d0
	move.b	time_zone,d0
	add.w	d0,d0
	add.w	d0,d0

	move.w	(a1,d0.w),d1					; Get speed
	movea.w	2(a1,d0.w),a5					; Get number of adjacent platforms
	tst.b	obj.subtype(a0)					; Are we going in reverse?
	beq.s	.SetSpeed					; If not, branch
	neg.w	d1						; If so, reverse speed

.SetSpeed:
	move.w	d1,circle_ptfm.speed(a0)			; Set speed

	moveq	#4-1,d6						; Number of quadrants
	moveq	#0,d5						; Reset number of adjacent platforms
	moveq	#0,d4						; Reset quadrant angle
	moveq	#0,d3						; Reset adjacent angle

	movea.w	a0,a1						; Initialize first platform
	bra.s	.InitFirstPlatform

.QuadrantLoop:
	moveq	#0,d5						; Reset number of adjacent platforms
	move.w	d4,d3						; Set adjacent angle to quadrant angle

.SpawnLoop:
	jsr	SpawnObject					; Spawn platform
	bne.s	.End						; If it failed, branch

.InitFirstPlatform:
	bsr.s	.Initialize					; Initialize platform
	move.w	d3,circle_ptfm.angle(a1)			; Set angle
	addi.w	#$800,d3					; Next adjacent angle
	addq.w	#1,d5						; Increment number of adjacent platforms
	cmp.w	a5,d5						; Have all the adjancent platforms been spawned?
	ble.s	.SpawnLoop					; If not, branch
	addi.w	#$4000,d4					; Next quadrant angle
	dbf	d6,.QuadrantLoop				; Loop until finished

.End:
	clr.w	circle_ptfm.parent(a0)				; First platform is the parent
	rts

; ------------------------------------------------------------------------------

.Initialize:
	move.w	a0,circle_ptfm.parent(a1)			; Set parent
	ori.b	#4,obj.sprite_flags(a1)				; Set sprite flags
	move.b	#2,obj.routine(a1)				; Set main routine
	move.b	#3,obj.sprite_layer(a1)				; Set sprite layer
	move.b	#8,obj.width(a1)				; Set width
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)				; Set height
	move.w	#$4300,obj.sprite_tile(a1)			; Set sprite tile
	move.l	#CirclePlatformSprites,obj.sprite_data(a1)			; Set sprite data
	move.w	obj.id(a0),obj.id(a1)				; Set ID and sprite flags
	move.w	obj.x(a0),obj.x(a1)				; Set position
	move.w	obj.y(a0),obj.y(a1)
	move.l	obj.x(a0),circle_ptfm.x(a1)			; Set origin position
	move.l	obj.y(a0),circle_ptfm.y(a1)
	move.w	circle_ptfm.speed(a0),circle_ptfm.speed(a1)	; Set speed
	rts

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

CirclePlatformMain:
	move.w	circle_ptfm.parent(a0),d0			; Get parent
	beq.s	.Move						; If there's no parent, branch

	movea.w	d0,a1						; Has the parent been deleted?
	cmpi.b	#$27,obj.id(a1)
	beq.s	.Move						; If not, branch
	jmp	DeleteObject					; If so, delete ourselves

.Move:
	move.w	circle_ptfm.speed(a0),d0			; Increment angle
	add.w	d0,circle_ptfm.angle(a0)

	moveq	#0,d1						; Get sine and cosine of angle
	moveq	#0,d0
	move.b	circle_ptfm.angle(a0),d0
	jsr	SineCosine
	swap	d1						; Multiply sine and cosine by 0.375
	swap	d0
	asr.l	#2,d1
	asr.l	#2,d0
	move.l	d1,d5
	move.l	d0,d4
	asr.l	#1,d5
	asr.l	#1,d4
	add.l	d1,d5
	add.l	d0,d4
	add.l	circle_ptfm.x(a0),d5				; Add origin position
	add.l	circle_ptfm.y(a0),d4
	move.l	obj.x(a0),d3					; Get X position
	move.l	d5,obj.x(a0)					; Set position
	move.l	d4,obj.y(a0)
	sub.l	d3,d5						; Set X speed based on distance traveled
	asr.l	#8,d5
	move.w	d5,obj.x_speed(a0)

	; This keeps the player on top of the platform when moving downwards
	lea	player_object,a1				; Get player
	move.w	obj.x_speed(a0),-(sp)				; Save X speed
	move.w	#0,obj.x_speed(a0)				; Stop X movement
	move.b	#$A,obj.height(a0)				; Extend height
	jsr	SolidObject					; Handle solidity
	sne	d0						; Store result

	; This moves the player horizontally with the platform
	move.w	(sp)+,obj.x_speed(a0)				; Restore X speed
	move.b	#8,obj.height(a0)				; Restore height
	tst.b	d0						; Was there a collision?
	beq.s	.Draw						; If not, branch
	jsr	SolidObject					; If so, handle solidity again

.Draw:
	jsr	DrawObject					; Draw sprite
	tst.w	circle_ptfm.parent(a0)				; Do we have a parent?
	bne.s	.End						; If so, branch

	move.w	circle_ptfm.x(a0),d0				; Check despawn
	jmp	CheckObjectDespawn2

.End:
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

CirclePtfmProperties:
	dc.w	$80, 2-1					; Speed 0.5
	dc.w	$C0, 2-1					; Speed 0.75
	dc.w	$100, 2-1					; Speed 1

CirclePlatformSprites:
	include	"sprites/r5/circle_platform.asm"
	even

; ------------------------------------------------------------------------------
