; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Flower object
; ------------------------------------------------------------------------------

FlowerObject:
	moveq	#0,d0						; Run routine
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jsr	.Routines(pc,d0.w)
	jmp	DrawObject					; Draw sprite

; ------------------------------------------------------------------------------

.Routines:
	dc.w	FlowerInit-.Routines				; Initialization
	dc.w	FlowerSeed-.Routines				; Seed
	dc.w	FlowerAnimate-.Routines				; Animate
	dc.w	FlowerGrowing-.Routines				; Growing
	dc.w	FlowerGrown-.Routines				; Grown

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

FlowerInit:
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.b	#1,obj.sprite_layer(a0)				; Set sprite layer
	move.b	#0,obj.height(a0)				; Set height
	if STAGE_ZONE<>2
		; Not Tidal Tempest
		move.w	#$A6D7,obj.sprite_tile(a0)		; Set flower sprite tile
		tst.b	obj.subtype_2(a0)			; Should it be low priority?
		beq.s	.GotPriority				; If not, branch
		andi.b	#$7F,obj.sprite_tile(a0)		; If so, clear priority flag

	.GotPriority:
	else
		; Tidal Tempest
		move.w	#$26D7,obj.sprite_tile(a0)		; Set flower sprite tile
	endif
	move.l	#FlowerSprites,obj.sprite_data(a0)		; Set sprite data
	
	; This appears to be unfinished code in relation to respawning flowers that have
	; been despawned. However, flowers never despawn and the flag checked is never
	; set to begin with. As such, this code doesn't really do anything.

	tst.b	obj.subtype(a0)					; Are we being tracked?
	bne.s	.InitSeed					; If not, branch

	bsr.w	FlowerGetState					; Get state
	move.b	(a1),d0
	move.b	#4,obj.routine(a0)				; Set to start growing
	move.b	#3,obj.anim_id(a0)
	btst	#6,d0						; Have we already landed before?
	bne.s	FlowerAnimate					; If so, branch

.InitSeed:
	move.w	#2,obj.anim_id(a0)				; Set as a seed
	move.b	#2,obj.routine(a0)
	move.w	#$6D7,obj.sprite_tile(a0)			; Set seed sprite tile

; ------------------------------------------------------------------------------
; Seed
; ------------------------------------------------------------------------------

FlowerSeed:
	jsr	CheckBlockDown					; Check floor collision
	tst.w	d1
	bpl.s	.Fall						; If we haven't landed, branch
	add.w	d1,obj.y(a0)					; Align with floor
	
	; This appears to be unfinished code in relation to respawning flowers that
	; have been despawned. However, the flower position buffer is always cleared
	; during stage initialization, and the function that would have handled this
	; is never called. As such, this code doesn't really do anything.

	tst.b	obj.subtype(a0)					; Are we being tracked?
	bne.s	.StartGrow					; If not, branch

	bsr.w	FlowerGetState					; Increment flower count
	lea	flower_counts,a2
	move.b	(a2,d1.w),d0
	addq.b	#1,(a2,d1.w)

	bsr.w	FlowerGetPosition				; Add to position buffer
	move.w	obj.x(a0),(a1,d0.w)
	move.w	obj.y(a0),2(a1,d0.w)

.StartGrow:
	move.b	#4,obj.routine(a0)				; Start growing
	move.b	#1,obj.anim_id(a0)
	move.b	#$30,obj.height(a0)				; Set height
	bra.w	FlowerAnimate					; Animate sprite

.Fall:
	addq.w	#2,obj.y(a0)					; Fall
	
; ------------------------------------------------------------------------------
; Animate
; ------------------------------------------------------------------------------

FlowerAnimate:
	lea	FlowerAnims,a1					; Animate sprite
	bra.w	AnimateObject

; ------------------------------------------------------------------------------
; Get state
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Flower object slot
; RETURNS:
;	d0.w - Slot offset
;	d1.w - Time zone
;	a1.l - State slot
; ------------------------------------------------------------------------------

FlowerGetState:
	moveq	#0,d0						; Get object state slot
	move.b	obj.state_id(a0),d0
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1						; Get time zone specific slot
	move.b	time_zone,d1
	bclr	#7,d1
	add.w	d1,d0
	lea	object_states,a1				; Get state
	lea	2(a1,d0.w),a1
	rts

; ------------------------------------------------------------------------------
; Get position buffer
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w - Slot ID
; RETURNS:
;	d0.w - Slot offset
;	a1.l - Position buffer
; ------------------------------------------------------------------------------

FlowerGetPosition:
	andi.w	#$3F,d0						; Get position slot
	add.w	d0,d0
	add.w	d0,d0
	moveq	#0,d1						; Get time zone specific slot
	move.b	time_zone,d1
	bclr	#7,d1
	lsl.w	#8,d1
	add.w	d1,d0
	lea	flower_positions,a1				; Get position buffer
	rts

; ------------------------------------------------------------------------------
; Growing
; ------------------------------------------------------------------------------

FlowerGrowing:
	move.w	#$26D7,obj.sprite_tile(a0)			; Set flower sprite tile
	move.b	#2,obj.anim_id(a0)				; Set growing animation
	bra.s	FlowerAnimate					; Animate sprite

; ------------------------------------------------------------------------------
; Grown
; ------------------------------------------------------------------------------

FlowerGrown:
	move.b	#3,obj.anim_id(a0)				; Set grown animation
	move.b	#4,obj.routine(a0)				; Animate sprite
	bra.s	FlowerAnimate

; ------------------------------------------------------------------------------