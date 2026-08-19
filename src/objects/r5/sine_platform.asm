; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Sinusoidal moving platform object
; ------------------------------------------------------------------------------

sine_ptfm.parent	equ obj.var_2a				; Parent
sine_ptfm.x		equ obj.var_2c				; Origin X
sine_ptfm.left		equ obj.var_2e				; Left boundary
sine_ptfm.right		equ obj.var_32				; Right boundary
sine_ptfm.y		equ obj.var_36				; Origin Y
sine_ptfm.angle		equ obj.var_38				; Angle
sine_ptfm.x_speed	equ obj.var_3a				; Saved X speed

; ------------------------------------------------------------------------------

SinePlatformObject:
	tst.b	obj.routine(a0)					; Have we been initialized?
	bne.w	SinePlatformMain				; If so, branch

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

SinePlatformInit:
	move.w	obj.x(a0),d0					; Set origin X
	move.w	d0,sine_ptfm.x(a0)
	swap	d0						; Get left boundary
	clr.w	d0
	subi.l	#$800000,d0
	move.l	d0,sine_ptfm.left(a0)
	addi.l	#$800000*2,d0					; Get right boundary
	move.l	d0,sine_ptfm.right(a0)

	moveq	#2-1,d6						; Number of platforms to spawn
	move.w	obj.x(a0),d5					; Initial X position
	addi.w	#$40,d5
	move.w	#$80,d4						; Distance between platforms
	move.w	#$8000,d3					; Start from the top
	tst.b	obj.subtype(a0)					; Should we start from the bottom?
	beq.s	.StartSpawn					; If not, branch
	addi.w	#$8000,d3					; If so, do that

.StartSpawn:
	movea.w	a0,a1						; Initialize first platform
	bsr.s	.InitFirstPlatform
	bra.s	.SetPlatformX					; Set its position

.SpawnLoop:
	jsr	SpawnObject					; Spawn platform
	bne.s	.End						; If it failed, branch
	bsr.s	.InitPlatform					; Initialize it

.SetPlatformX:
	move.w	d5,obj.x(a1)					; Set X position
	sub.w	d4,d5						; Set next spawn position
	move.w	d3,sine_ptfm.angle(a1)				; Set angle
	dbf	d6,.SpawnLoop					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------

.InitPlatform:
	move.w	a0,sine_ptfm.parent(a1)				; Set parent
	move.w	obj.id(a0),obj.id(a1)				; Set ID
	move.l	sine_ptfm.left(a0),sine_ptfm.left(a1)		; Set left boundary
	move.l	sine_ptfm.right(a0),sine_ptfm.right(a1)		; Set right boundary
	move.w	obj.y(a0),obj.y(a1)				; Set Y position

.InitFirstPlatform:
	ori.b	#4,obj.sprite_flags(a1)				; Set sprite flags
	move.b	#2,obj.routine(a1)				; Next routine
	move.b	#3,obj.sprite_layer(a1)				; Set sprite layer
	move.b	#$20,obj.width(a1)				; Set width
	move.b	#$20,obj.width_2(a1)
	move.b	#$10,obj.height(a1)				; Set height
	move.w	#$4487,obj.sprite_tile(a1)			; Set sprite tile
	move.l	#SinePlatformSprites,obj.sprite_data(a1)	; Set sprite data
	move.w	obj.y(a0),sine_ptfm.y(a1)			; Set origin Y
	rts

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

SinePlatformMain:
	move.l	obj.x(a0),d0					; Get X position
	move.l	d0,d1						; Move left
	subi.l	#$8000,d1
	cmp.l	sine_ptfm.left(a0),d1				; Has we move past the left boundary?
	bgt.s	.SetX						; If not, branch
	move.l	sine_ptfm.right(a0),d0				; If so, wrap to right boundary
	move.l	d0,d1

.SetX:
	move.l	d1,obj.x(a0)					; Set X position
	sub.l	d0,d1						; Set X speed based on distance moved
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	
	addi.w	#$100,sine_ptfm.angle(a0)			; Increment angle
	move.w	sine_ptfm.angle(a0),d0				; Get cosine of angle
	asr.w	#8,d0
	jsr	SineCosine
	swap	d1						; Multiply it by 0.375
	asr.l	#2,d1
	move.l	d1,d0
	asr.l	#1,d0
	add.l	d1,d0
	addi.l	#$8000,d0					; Add 0.5 to it
	swap	d0						; Set Y position
	add.w	sine_ptfm.y(a0),d0
	move.w	d0,obj.y(a0)

	tst.w	sine_ptfm.parent(a0)				; Is this the parent platform?
	beq.s	.Parent						; If so, branch

	movea.w	sine_ptfm.parent(a0),a1				; Get parent
	cmpi.b	#$29,obj.id(a1)					; Has it been deleted?
	beq.s	.Update						; If not, branch
	jmp	DeleteObject					; If so, delete ourselves

.Parent:
	bsr.s	.Update						; Do updates
	move.w	sine_ptfm.x(a0),d0				; Check despawn
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

.Update:
	lea	player_object,a1				; Handle solidity
	bsr.s	.Solid
	jmp	DrawObject					; Draw sprite

; ------------------------------------------------------------------------------

.Solid:
	; This keeps the player on top of the platform when moving downwards
	move.w	obj.x_speed(a0),sine_ptfm.x_speed(a0)		; Save X speed
	move.w	#0,obj.x_speed(a0)				; Stop X movement
	move.b	#$12,obj.height(a0)				; Extend height
	jsr	TopSolidObject					; Handle solidity
	sne	d0						; Store result

	; This moves the player horizontally with the platform
	move.w	sine_ptfm.x_speed(a0),obj.x_speed(a0)		; Restore X speed
	move.b	#$10,obj.height(a0)				; Restore height
	tst.b	d0						; Was there a collision?
	beq.s	.End						; If not, branch
	jsr	TopSolidObject					; If so, handle solidity again

.End:
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

SinePlatformSprites:
	include	"src/sprites/r5/sine_platform.asm"
	even

; ------------------------------------------------------------------------------
