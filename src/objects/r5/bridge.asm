; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Bridge object (R5)
; ------------------------------------------------------------------------------

bridge.pieces		equ obj.var_2a				; Bridge pieces
bridge.y		equ obj.var_32				; Origin Y
bridge.parent		equ obj.var_34				; Parent
bridge.x		equ obj.var_36				; Origin X
bridge.sink_angle	equ obj.var_3a				; Sink angle
bridge.piece_id		equ obj.var_3c				; Bridge piece ID
bridge.bend_x		equ obj.var_3d				; Bend X
bridge.is_piece		equ obj.var_3f				; Bridge piece flag

; ------------------------------------------------------------------------------

BridgeObject:
	moveq	#0,d0						; Run routine
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jsr	.Routines(pc,d0.w)

	jmp	DrawObject					; Draw sprite

; ------------------------------------------------------------------------------

.Routines:
	dc.w	BridgeInit-.Routines				; Initialization
	dc.w	BridgeMain-.Routines				; Main
	dc.w	BridgePiece-.Routines				; Bridge piece

; ------------------------------------------------------------------------------
; Initialization
; ------------------------------------------------------------------------------

BridgeInit:
	addq.b	#2,obj.routine(a0)				; Next routine
	ori.b	#4,obj.sprite_flags(a0)				; Set sprite flags
	move.b	#3,obj.sprite_layer(a0)				; Set sprite layer
	move.w	#$4300,obj.sprite_tile(a0)			; Set sprite tile
	move.l	#BridgeSprites,obj.sprite_data(a0)		; Set sprite data
	move.w	obj.x(a0),bridge.x(a0)				; Set origin position
	move.w	obj.y(a0),bridge.y(a0)
	move.b	#$40,obj.width_2(a0)				; Set width
	move.b	#8,obj.height(a0)				; Set height
	move.b	#1,obj.sprite_frame(a0)				; Set sprite frame

	lea	bridge.pieces(a0),a2				; Bridge pieces
	moveq	#8-1,d1						; Number of bridge pieces

.SpawnPieces:
	jsr	SpawnObject					; Spawn bridge piece
	bne.w	.NextPiece					; If it failed, branch

	move.w	a1,d0						; Set object slot ID
	subi.w	#object_spawn_pool,d0
	lsr.w	#6,d0
	andi.b	#$7F,d0
	move.b	d0,(a2)+

	move.b	#$2F,obj.id(a1)					; Set ID
	move.b	#4,obj.routine(a1)				; Set routine
	move.w	obj.x(a0),bridge.x(a1)				; Set origin position
	move.w	obj.y(a0),bridge.y(a1)
	move.w	obj.y(a0),obj.y(a1)				; Set Y position
	ori.b	#4,obj.sprite_flags(a1)				; Set sprite flags
	move.b	#3,obj.sprite_layer(a1)				; Set sprite layer
	move.w	#$4300,obj.sprite_tile(a1)			; Set sprite tile
	move.l	#BridgeSprites,obj.sprite_data(a1)		; Set sprite data
	move.b	#8,obj.height(a1)				; Set height
	move.b	#8,obj.width_2(a1)				; Set width
	move.w	a0,bridge.parent(a1)				; Set parent
	move.b	#-1,bridge.is_piece(a1)				; Mark as bridge piece

	moveq	#0,d2						; Set bridge piece ID
	move.b	d1,d2
	move.b	d2,bridge.piece_id(a1)

	add.w	d2,d2						; Set X position
	lea	.XOffsets(pc,d2.w),a3
	move.w	(a3)+,d2
	add.w	obj.x(a0),d2
	move.w	d2,obj.x(a1)

.NextPiece:
	dbf	d1,.SpawnPieces					; Loop until finished
	rts

; ------------------------------------------------------------------------------

.XOffsets:
	dc.w	$30, $20, $10, 0, -$10, -$20, -$30, -$40

; ------------------------------------------------------------------------------
; Bridge piece
; ------------------------------------------------------------------------------

BridgePiece:
	movea.w	bridge.parent(a0),a1				; Get parent
	cmpi.b	#$2F,obj.id(a1)					; Does it exist?
	bne.s	.Delete						; If not, branch
	tst.b	bridge.is_piece(a1)				; Is the parent somehow a bridge piece?
	bne.s	.Delete						; If so, branch
	rts

.Delete:
	jmp	DeleteObject					; Delete ourselves

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

BridgeMain:
	clr.b	bridge.bend_x(a0)				; Clear bend X
	bsr.w	BridgeCheckPlayer				; Check player collision
	beq.s	.CheckBend					; If we aren't being stood on, branch
	bsr.w	BridgeSetBendX					; If we are, set bend X

.CheckBend:
	tst.b	bridge.bend_x(a0)				; Are we being stood on?
	beq.w	.NotStoodOn					; If not, branch

	move.b	bridge.sink_angle(a0),d0			; Get sink angle
	cmpi.b	#$40,d0						; Have we fully sinked?
	beq.s	.HandleBend					; If so, branch
	addq.b	#4,bridge.sink_angle(a0)			; If not, increase sink angle

.HandleBend:
	bsr.w	BridgeBend					; Handle bending
	tst.b	bridge.bend_x(a0)				; Are we being stood on?
	beq.s	.NoMovePlayer					; If not, branch
	bsr.w	BridgeMovePlayer				; If so, move player as we bend

.NoMovePlayer:
	bra.s	.CheckDespawn					; Check despawn

.NotStoodOn:
	tst.b	bridge.sink_angle(a0)				; Have we fully unsinked?
	beq.s	.CheckDespawn					; If so, branch
	subq.b	#4,bridge.sink_angle(a0)			; If not, decrease sink angle
	
	bsr.w	BridgeBend					; Handle bending

.CheckDespawn:
	jmp	CheckObjectDespawn				; Check despawn

; ------------------------------------------------------------------------------
; Set bend X
; ------------------------------------------------------------------------------

BridgeSetBendX:
	lea	player_object,a1				; Get player
	
	moveq	#8,d1						; Get bridge width
	lsl.w	#3,d1
	move.w	d1,d2
	addq.w	#8,d1
	add.w	d2,d2
	
	btst	#1,obj.flags(a1)				; Is the player in the air?
	bne.s	.NotStoodOn					; If so, branch
	
	move.w	obj.x(a1),d0					; Is the player standing on us?
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	.NotStoodOn					; If not, branch
	cmp.w	d2,d0
	bcs.s	.StoodOn					; If so, branch

.NotStoodOn:
	clr.b	bridge.bend_x(a0)				; Clear bend X
	rts

.StoodOn:
	lsr.w	#4,d0						; Set bend X
	move.b	d0,bridge.bend_x(a0)
	rts

; ------------------------------------------------------------------------------
; Move player as the bridge is bent
; ------------------------------------------------------------------------------

BridgeMovePlayer:
	lea	player_object,a1				; Get player
	
	moveq	#0,d0						; Get bridge piece the player is standing on
	move.b	bridge.bend_x(a0),d0
	move.b	bridge.pieces(a0,d0.w),d0
	lsl.w	#6,d0
	addi.l	#object_spawn_pool&$FFFFFF,d0
	movea.l	d0,a2
	
	move.w	obj.y(a2),d0					; Align player on top of bridge piece
	subq.w	#8,d0
	moveq	#0,d1
	move.b	obj.height(a1),d1
	sub.w	d1,d0
	move.w	d0,obj.y(a1)
	rts

; ------------------------------------------------------------------------------
; Handle bending
; ------------------------------------------------------------------------------

BridgeBend:
	moveq	#0,d3						; Get bend X
	move.b	bridge.bend_x(a0),d3

	move.b	bridge.sink_angle(a0),d0			; Get sink offset
	jsr	SineCosine
	move.w	d0,d4

	lea	BridgeBendYOffsets,a4				; Get Y offsets
	
	moveq	#8,d0						; 8 bridge pieces
	lsl.w	#4,d0
	move.w	d3,d2						; Get number of bridge pieces to bend

	add.w	d0,d3						; Get bend strength
	moveq	#0,d5
	lea	BridgeBendStrengths,a5
	move.b	(a5,d3.w),d5

	andi.w	#$F,d3						; Get initial Y offset
	lsl.w	#4,d3
	lea	(a4,d3.w),a3

	lea	bridge.pieces(a0),a2				; Bridge pieces

.BendRight:
	moveq	#0,d0						; Get bridge piece
	move.b	(a2)+,d0
	lsl.w	#6,d0
	addi.l	#object_spawn_pool&$FFFFFF,d0
	movea.l	d0,a1

	moveq	#0,d0						; Get Y offset
	move.b	(a3)+,d0
	addq.w	#1,d0
	mulu.w	d5,d0						; Multiply bend strength
	mulu.w	d4,d0						; Multiply sink offset
	swap	d0						; Set Y position of bridge piece 
	add.w	bridge.y(a1),d0
	move.w	d0,obj.y(a1)

	dbf	d2,.BendRight					; Loop until finished

	moveq	#0,d3						; Get remaining bridge pieces to bend
	move.b	bridge.bend_x(a0),d3
	moveq	#8,d0
	addq.b	#1,d3
	sub.b	d0,d3
	neg.b	d3
	bmi.s	.End						; If there are none, branch

	move.w	d3,d2						; Get initial Y offset
	lsl.w	#4,d3
	lea	(a4,d3.w),a3
	adda.w	d2,a3
	
	subq.w	#1,d2						; Decrement for loop
	bcs.s	.End						; If there's no bridge pieces to bend left, branch

.BendLeft:
	moveq	#0,d0						; Get bridge piece
	move.b	(a2)+,d0
	lsl.w	#6,d0
	addi.l	#object_spawn_pool&$FFFFFF,d0
	movea.l	d0,a1
	
	moveq	#0,d0						; Get Y offset
	move.b	-(a3),d0
	addq.w	#1,d0
	mulu.w	d5,d0						; Multiply bend strength
	mulu.w	d4,d0						; Multiply sink offset
	add.w	d0,d0						; This doesn't really do anything
	swap	d0						; Set Y position of bridge piece 
	add.w	bridge.y(a1),d0
	move.w	d0,obj.y(a1)

	dbf	d2,.BendLeft					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------

BridgeBendStrengths:
	dc.b	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, $A, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, $A, $A, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, $A, $C, $A, 8, 6, 4, 2, 0, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, $A, $C, $C, $A, 8, 6, 4, 2, 0, 0, 0, 0
	dc.b	2, 4, 6, 8, $A, $C, $E, $C, $A, 8, 6, 4, 2, 0, 0, 0
	dc.b	2, 4, 6, 8, $A, $C, $E, $E, $C, $A, 8, 6, 4, 2, 0, 0
	dc.b	2, 4, 6, 8, $A, $C, $E, $10, $E, $C, $A, 8, 6, 4, 2, 0
	dc.b	2, 4, 6, 8, $A, $C, $E, $10, $10, $E, $C, $A, 8, 6, 4, 2

BridgeBendYOffsets:
	dc.b	$FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$B5, $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$7E, $DB, $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$61, $B5, $EC, $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$4A, $93, $CD, $F3, $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$3E, $7E, $B0, $DB, $F6, $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$38, $6D, $9D, $C5, $E4, $F8, $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$31, $61, $8E, $B5, $D4, $EC, $FB, $FF, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	$2B, $56, $7E, $A2, $C1, $DB, $EE, $FB, $FF, 0, 0, 0, 0, 0, 0, 0
	dc.b	$25, $4A, $73, $93, $B0, $CD, $E1, $F3, $FC, $FF, 0, 0, 0, 0, 0, 0
	dc.b	$1F, $44, $67, $88, $A7, $BD, $D4, $E7, $F4, $FD, $FF, 0, 0, 0, 0, 0
	dc.b	$1F, $3E, $5C, $7E, $98, $B0, $C9, $DB, $EA, $F6, $FD, $FF, 0, 0, 0, 0
	dc.b	$19, $38, $56, $73, $8E, $A7, $BD, $D1, $E1, $EE, $F8, $FE, $FF, 0, 0, 0
	dc.b	$19, $38, $50, $6D, $83, $9D, $B0, $C5, $D8, $E4, $F1, $F8, $FE, $FF, 0, 0
	dc.b	$19, $31, $4A, $67, $7E, $93, $A7, $BD, $CD, $DB, $E7, $F3, $F9, $FE, $FF, 0
	dc.b	$19, $31, $4A, $61, $78, $8E, $A2, $B5, $C5, $D4, $E1, $EC, $F4, $FB, $FE, $FF

; ------------------------------------------------------------------------------
; Check player collision
; ------------------------------------------------------------------------------
; RETURNS:
;	d0.b  - 0 if no collision, -1 if collision
;	eq/ne - No collision/Collision
; ------------------------------------------------------------------------------

BridgeCheckPlayer:
	lea	player_object,a1				; Get player
	cmpi.b	#6,obj.routine(a1)				; Is the player dead?
	beq.w	.NotStoodOn					; If so, branch
	tst.b	debug_mode					; Is debug mode active?
	bne.s	.NotStoodOn					; If so, branch

	moveq	#8,d1						; Get bridge width
	lsl.w	#3,d1
	move.w	d1,d2
	addq.w	#8,d1
	add.w	d2,d2
	
	tst.w	obj.y_speed(a1)					; Is the player moving upwards?
	bmi.w	.NotStoodOn					; If so, branch

	move.w	obj.x(a1),d0					; Is the player colliding horizontally?
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.w	.NotStoodOn					; If not, branch
	cmp.w	d2,d0
	bcc.w	.NotStoodOn					; If not, branch
	
	move.w	obj.y(a0),d0					; Is the player colliding vertically?
	subq.w	#8,d0
	move.w	obj.y(a1),d2
	move.b	obj.height(a1),d1
	ext.w	d1
	add.w	d2,d1
	addq.w	#4,d1
	sub.w	d1,d0
	bhi.w	.NotStoodOn					; If not, branch
	cmpi.w	#-$10,d0
	bcs.w	.NotStoodOn					; If not, branch

	cmpi.b	#6,obj.routine(a1)				; Is the player dead?
	bcc.w	.NotStoodOn					; If so, branch

	add.w	d0,d2						; Align player on top of us
	addq.w	#3,d2
	move.w	d2,obj.y(a1)

	jsr	StandOnObject					; Mark player as standing on an object
	moveq	#-1,d0						; Collision
	rts

.NotStoodOn:
	moveq	#0,d0						; Was the player standing on us?
	move.b	obj.var_3d(a1),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	cmpa.w	d0,a0
	bne.s	.NoCollision					; If not, branch

	clr.b	obj.var_38(a1)					; Clear stick to surface flag
	bclr	#3,obj.flags(a1)				; Clear standing on object flag

.NoCollision:
	moveq	#0,d0						; No collision
	rts

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

BridgeSprites:
	include	"src/sprites/r5/bridge.asm"
	even

; ------------------------------------------------------------------------------
