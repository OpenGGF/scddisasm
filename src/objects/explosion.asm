; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Explosion object
; ------------------------------------------------------------------------------

explode.points		equ obj.var_3e				; Points

; ------------------------------------------------------------------------------
; Spawn points from explosion
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Explosion object slot
; ------------------------------------------------------------------------------

ExplosionSpawnPoints:
	tst.b	obj.routine_2(a0)				; Did a badnik explode?
	bne.s	SpawnPointsEnd					; If not, branch
	
	moveq	#0,d1						; Get points sprite frame
	move.w	explode.points(a0),d1
	lsr.b	#1,d1

; ------------------------------------------------------------------------------
; Spawn points
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d1.b - Points sprite frame
; ------------------------------------------------------------------------------

SpawnPoints:
	ori.b	#$80,d1						; Points subtype
	
	jsr	SpawnObject					; Spawn points object
	bne.s	SpawnPointsEnd					; If it failed, branch
	
	move.b	#$1C,obj.id(a1)					; Set ID
	move.w	obj.x(a0),obj.x(a1)				; Set position
	move.w	obj.y(a0),obj.y(a1)
	move.b	d1,obj.subtype(a1)				; Set subtype

SpawnPointsEnd:
	rts

; ------------------------------------------------------------------------------

ExplosionObject:
	moveq	#0,d0						; Run routine
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jmp	.Routines(pc,d0.w)

; ------------------------------------------------------------------------------

.Routines:
	dc.w	ExplosionInit-.Routines				; Initialization
	dc.w	ExplosionMain-.Routines				; Main
	dc.w	ExplosionDone-.Routines				; Done

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

ExplosionInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.b	#1,obj.sprite_layer(a0)				; Set sprite layer
	if STAGE_ZONE<>2
		move.w	#$8680,obj.sprite_tile(a0)		; Set sprite tile
		tst.b	obj.subtype_2(a0)			; Should it be low priority?
		beq.s	.GotPriority				; If not, branch
		andi.b	#$7F,obj.sprite_tile(a0)		; If so, clear priority flag

	.GotPriority:
	else
		move.w	#$680,obj.sprite_tile(a0)		; Set sprite tile
	endif
	move.l	#ExplosionSprites,obj.sprite_data(a0)		; Set sprite data

	bsr.s	ExplosionSpawnPoints				; Spawn points
	
	move.b	#0,obj.collide_type(a0)				; Disable collision
	move.b	#0,obj.anim_index(a0)				; Reset animation
	move.b	#0,obj.anim_timer(a0)
	move.w	#0,obj.anim_id(a0)
	tst.b	obj.subtype(a0)					; Should we use the firey animation?
	beq.s	ExplosionMain					; If so, branch
	move.w	#$100,obj.anim_id(a0)				; If not, use the smokey animation

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

ExplosionMain:
	lea	ExplosionAnims,a1				; Animate sprite
	bsr.w	AnimateObject
	jmp	DrawObject					; Draw sprite

; ------------------------------------------------------------------------------
; Done
; ------------------------------------------------------------------------------

ExplosionDone:
	tst.b	obj.routine_2(a0)				; Did a badnik explode?
	beq.s	.SpawnFlower					; If so, branch
	jmp	DeleteObject					; If not, delete ourselves

.SpawnFlower:
	move.b	#$1F,obj.id(a0)					; Turn into flower
	move.b	#0,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------