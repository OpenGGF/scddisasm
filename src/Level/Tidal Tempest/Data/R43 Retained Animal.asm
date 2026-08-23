; -------------------------------------------------------------------------
; Discarded Animal object retained in the R43 historical data layout
; -------------------------------------------------------------------------

R43RetainedAnimal_AnimalObject:
	if REGION=USA
		jsr	$20FD6E
	else
		jsr	CheckAnimalPrescence
	endif
	tst.b	obj.routine(a0)
	bmi.w	R43RetainedAnimal_loc_20E45A
	bne.w	R43RetainedAnimal_loc_20E4EA
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	lea	R43RetainedAnimal_word_20E5C4(pc),a1
	moveq	#0,d0
	move.b	act,d0
	asl.w	#2,d0
	add.b	time_zone,d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.sprite_tile(a0)
	btst	#0,obj.subtype(a0)
	beq.s	R43RetainedAnimal_loc_20E3E0
	addi.w	#$2000,obj.sprite_tile(a0)

R43RetainedAnimal_loc_20E3E0:
	lea	R43RetainedAnimal_AnimalSprites1(pc),a1
	btst	#0,obj.subtype(a0)
	beq.s	R43RetainedAnimal_loc_20E3F0
	lea	R43RetainedAnimal_AnimalSprites2(pc),a1

R43RetainedAnimal_loc_20E3F0:
	move.l	a1,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	move.b	obj.subtype(a0),d0
	bpl.s	R43RetainedAnimal_loc_20E43E
	subq.b	#2,obj.routine(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	move.w	obj.x(a0),obj.var_38(a0)
	move.l	#$200,obj.var_34(a0)
	btst	#0,d0
	beq.s	R43RetainedAnimal_locret_20E43C
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	neg.l	obj.var_34(a0)
	move.l	#$3000,obj.var_30(a0)

R43RetainedAnimal_locret_20E43C:
	rts

; -------------------------------------------------------------------------

R43RetainedAnimal_loc_20E43E:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)
	move.l	#$10000,obj.var_2a(a0)
	move.l	#$100,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

R43RetainedAnimal_loc_20E45A:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$52,0(a1)
	bne.s	R43RetainedAnimal_loc_20E46C
	tst.b	$3F(a1)
	beq.s	R43RetainedAnimal_loc_20E472

R43RetainedAnimal_loc_20E46C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

R43RetainedAnimal_loc_20E472:
	move.b	obj.var_32(a0),d0
	jsr	$200700
	swap	d1
	swap	d0
	asr.l	#3,d1
	asr.l	#4,d0
	addi.l	#$8000,d1
	addi.l	#$8000,d0
	swap	d1
	swap	d0
	add.w	obj.var_38(a0),d1
	add.w	obj.var_2e(a0),d0
	move.w	d1,obj.x(a0)
	move.w	d0,obj.y(a0)
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.var_30(a0)
	move.l	obj.var_30(a0),d0
	andi.l	#$7FFF,d0
	bne.s	R43RetainedAnimal_loc_20E4DA
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	cmpi.b	#5,obj.sprite_layer(a0)
	beq.s	R43RetainedAnimal_loc_20E4D4
	move.b	#5,obj.sprite_layer(a0)
	bra.s	R43RetainedAnimal_loc_20E4DA

; ------------------------------------------------------------------------------

R43RetainedAnimal_loc_20E4D4:
	move.b	#3,obj.sprite_layer(a0)

R43RetainedAnimal_loc_20E4DA:
	lea	R43RetainedAnimal_AnimalAnims(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedAnimal_loc_20E4EA:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.b	obj.var_32(a0),d0
	jsr	$200700
	swap	d0
	asr.l	#3,d0
	addi.l	#$8000,d0
	swap	d0
	add.w	obj.var_2e(a0),d0
	move.w	d0,obj.y(a0)
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.var_30(a0)
	bmi.s	R43RetainedAnimal_loc_20E524
	cmpi.l	#$10000,obj.var_30(a0)
	blt.s	R43RetainedAnimal_loc_20E538

R43RetainedAnimal_loc_20E524:
	neg.l	obj.var_34(a0)
	neg.l	obj.var_2a(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

R43RetainedAnimal_loc_20E538:
	lea	R43RetainedAnimal_AnimalAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

R43RetainedAnimal_AnimalAnims:
	include	"anims/r4/animal.asm"
	even

R43RetainedAnimal_AnimalSprites1:
	include	"sprites/r4/animal_1.asm"
	even

R43RetainedAnimal_AnimalSprites2:
	include	"sprites/r4/animal_2.asm"
	even

R43RetainedAnimal_word_20E5C4:
	dc.w	$450, $450, $450, 0
	dc.w	$450, $450, $450, 0
	dc.w	0, 0, $450

; ------------------------------------------------------------------------------
