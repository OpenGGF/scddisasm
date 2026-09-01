; ------------------------------------------------------------------------------
; Collision Chaos freed and projector-hologram animals
;
; Subtype bits 0-6 select the family: zero is the flying animal and nonzero is
; the ground animal. A negative subtype selects the corresponding projector
; hologram; var_3E then stores the projector slot's 16-bit work-RAM address.
; ------------------------------------------------------------------------------

AnimalObject:
	jsr	CheckAnimalPrescence
	move.b	obj.subtype(a0),d0
	andi.b	#$7F,d0
	bne.w	GroundAnimalObject
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	FlyingAnimalRoutineIndex(pc,d0.w),d0
	jmp	FlyingAnimalRoutineIndex(pc,d0.w)

; ------------------------------------------------------------------------------

FlyingAnimalRoutineIndex:
	dc.w	FlyingAnimalInit-*
	dc.w	FlyingAnimalMain-FlyingAnimalRoutineIndex
	dc.w	FlyingAnimalHologram-FlyingAnimalRoutineIndex

; ------------------------------------------------------------------------------

FlyingAnimalInit:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.l	#$8080108,obj.height(a0)
	move.l	#AnimalSprites1,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	move.w	obj.y(a0),obj.var_2c(a0)
	bsr.w	AnimalFlipX
	bsr.w	AnimalLoadBaseTile
	tst.b	obj.subtype(a0)
	bmi.s	.Hologram
	move.b	#1,obj.sprite_layer(a0)
	ori.w	#$8000,obj.sprite_tile(a0)
	move.w	#$101,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

.Hologram:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)
	move.b	#3,obj.sprite_layer(a0)
	rts

; ------------------------------------------------------------------------------

; Orbit the saved position using var_2E as phase and var_2F as its signed step.
FlyingAnimalMain:
	moveq	#1,d2
	moveq	#1,d3
	bsr.w	FlyingAnimalMove
	move.b	obj.var_2e(a0),d0
	add.b	obj.var_2f(a0),d0
	move.b	d0,d1
	subq.b	#1,d1
	subi.b	#$7F,d1
	bcs.s	.NoFlip
	move.b	obj.var_2e(a0),d0
	neg.b	obj.var_2f(a0)
	bsr.w	AnimalFlipX

.NoFlip:
	move.b	d0,obj.var_2e(a0)
	lea	AnimalAnims1(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

; Remain attached to a live Metal Sonic projector (object $38). The hologram
; uses a much smaller vertical orbit than a freed flying animal.
FlyingAnimalHologram:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$38,0(a1)
	bne.w	AnimalDelete
	tst.b	$3F(a1)
	bne.w	AnimalDelete
	moveq	#3,d2
	moveq	#4,d3
	bsr.w	FlyingAnimalMove
	addq.b	#4,obj.var_2e(a0)
	move.b	obj.var_2e(a0),d0
	andi.b	#$7F,d0
	beq.w	AnimalFlipX
	lea	AnimalAnims1(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

; In: d2 = horizontal sine shift, d3 = vertical cosine shift.
; Uses var_2A/var_2C as the orbit centre and var_2E as the phase.
FlyingAnimalMove:
	move.b	obj.var_2e(a0),d0
	jsr	SineCosine
	asr.w	d2,d1
	asr.w	d3,d0
	add.w	obj.var_2a(a0),d1
	add.w	obj.var_2c(a0),d0
	move.w	d1,obj.x(a0)
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

GroundAnimalObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	GroundAnimalRoutineIndex(pc,d0.w),d0
	jmp	GroundAnimalRoutineIndex(pc,d0.w)

; ------------------------------------------------------------------------------

GroundAnimalRoutineIndex:
	dc.w	GroundAnimalInit-*
	dc.w	GroundAnimalBounce-GroundAnimalRoutineIndex
	dc.w	GroundAnimalBounce-GroundAnimalRoutineIndex
	dc.w	GroundAnimalTurn-GroundAnimalRoutineIndex
	dc.w	GroundAnimalHologram-GroundAnimalRoutineIndex

; ------------------------------------------------------------------------------

GroundAnimalInit:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.l	#$C080408,obj.height(a0)
	move.l	#AnimalSprites2,obj.sprite_data(a0)
	bsr.w	AnimalLoadBaseTile
	tst.b	obj.subtype(a0)
	bmi.s	.Hologram
	move.l	#$10000,obj.var_2c(a0)
	move.l	#-$40000,obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

.Hologram:
	move.b	#8,obj.routine(a0)
	bra.w	AnimalFlipX

; ------------------------------------------------------------------------------

; Integrate 16.16 X/Y velocity, apply gravity, and alternate frames according
; to the sign of the vertical velocity. Each landing advances the state.
GroundAnimalBounce:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$2000,obj.var_30(a0)
	smi	d0
	addq.b	#1,d0
	move.b	d0,obj.sprite_frame(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	GroundAnimalDraw
	addq.b	#2,obj.routine(a0)
	add.w	d1,obj.y(a0)
	move.l	#-$40000,obj.var_30(a0)

GroundAnimalDraw:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

GroundAnimalTurn:
	move.b	#2,obj.routine(a0)
	neg.l	obj.var_2c(a0)
	bsr.s	AnimalFlipX
	bra.s	GroundAnimalDraw

; ------------------------------------------------------------------------------

GroundAnimalHologram:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$38,obj.id(a1)
	bne.w	AnimalDelete
	tst.b	obj.var_3f(a1)
	bne.w	AnimalDelete
	lea	AnimalAnims2(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

AnimalDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

AnimalFlipX:
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

; Select the base art tile from [act * 4 + time_zone]. The compact eleven-word
; table contains zero placeholders for combinations that do not provide art.
AnimalLoadBaseTile:
	lea	AnimalBaseTileTable(pc),a1
	moveq	#0,d0
	move.b	act,d0
	asl.w	#2,d0
	add.b	time_zone,d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------

AnimalAnims1:
	include	"anims/r3/animal_1.asm"
	even

AnimalAnims2:
	include	"anims/r3/animal_2.asm"
	even

AnimalSprites1:
	include	"sprites/r3/animal_1.asm"
	even

AnimalSprites2:
	include	"sprites/r3/animal_2.asm"
	even

AnimalBaseTileTable:
	dc.w	$797, $3DA, $3DA, 0
	dc.w	$797, $3DA, $3DA, 0
	dc.w	0, 0, $3DA

; ------------------------------------------------------------------------------
