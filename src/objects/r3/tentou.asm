; ------------------------------------------------------------------------------

TentouObject:
	move.b	obj.subtype(a0),d0
	addi.b	#-1,d0
	bmi.s	loc_20B944
	bra.w	loc_20BC42

; ------------------------------------------------------------------------------

loc_20B944:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B96E(pc,d0.w),d0
	jsr	off_20B96E(pc,d0.w)
	lea	TentouAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B96E:
	dc.w	TentouObject_0_Routine0-*
	dc.w	TentouObject_0_Routine2-off_20B96E
	dc.w	TentouObject_0_Routine4-off_20B96E
	dc.w	TentouObject_0_Routine6-off_20B96E
	dc.w	TentouObject_0_Routine8-off_20B96E
	dc.w	TentouObject_0_RoutineA-off_20B96E

; ------------------------------------------------------------------------------

TentouObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#$84,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#6,obj.collide_type(a0)
	move.b	#$E,obj.width_2(a0)
	move.b	#$E,obj.height(a0)
	move.w	#$A46A,obj.sprite_tile(a0)
	lea	TentouSprites2(pc),a1
	tst.b	obj.subtype(a0)
	bmi.s	loc_20B9B4
	lea	TentouSprites1(pc),a1
	st	obj.var_3f(a0)

loc_20B9B4:
	move.l	a1,obj.sprite_data(a0)

TentouObject_0_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	subq.w	#8,d1
	bgt.s	locret_20B9F0
	sub.w	d1,obj.y(a0)
	move.l	obj.y(a0),obj.var_32(a0)
	move.l	#$3000,obj.var_2e(a0)
	move.w	#8,obj.var_36(a0)
	addq.b	#2,obj.routine(a0)
	tst.l	obj.var_2a(a0)
	beq.s	locret_20B9F0
	addq.b	#2,obj.routine(a0)

locret_20B9F0:
	rts

; ------------------------------------------------------------------------------

TentouObject_0_Routine4:
	bsr.w	sub_20BB12
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	locret_20BA40
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	move.w	d0,d1
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	locret_20BA40
	addq.b	#2,obj.routine(a0)
	move.l	#-$C000,obj.var_2a(a0)
	tst.w	d1
	bmi.s	locret_20BA40
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	neg.l	obj.var_2a(a0)

locret_20BA40:
	rts

; ------------------------------------------------------------------------------

TentouObject_0_Routine6:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_32(a0),obj.y(a0)
	moveq	#0,d3
	move.b	obj.width(a0),d3
	lea	CheckBlockLeft,a1
	tst.l	obj.var_2a(a0)
	bmi.s	loc_20BA68
	lea	CheckBlockRight,a1

loc_20BA68:
	jsr	(a1)
	tst.w	d1
	bmi.s	loc_20BAC0
	jsr	CheckBlockDown
	cmpi.w	#$10,d1
	bge.s	loc_20BAC6
	subq.w	#8,d1
	add.w	d1,obj.y(a0)
	move.l	obj.y(a0),obj.var_32(a0)
	bsr.w	sub_20BB12
	tst.b	obj.var_3f(a0)
	beq.s	locret_20BABE
	andi.w	#$7F,obj.var_36(a0)
	bne.s	locret_20BABE
	jsr	SpawnObject
	bne.s	locret_20BABE
	move.b	obj.id(a0),obj.id(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.l	obj.y(a0),obj.y(a1)
	addi.w	#$10,obj.y(a1)
	move.b	#1,obj.subtype(a1)

locret_20BABE:
	rts

; ------------------------------------------------------------------------------

loc_20BAC0:
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BAC6:
	addq.b	#4,obj.routine(a0)
	bsr.w	sub_20BB12
	move.l	obj.y(a0),obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

TentouObject_0_Routine8:
	addi.l	#-$8000,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

TentouObject_0_RoutineA:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d3
	moveq	#0,d4
	move.b	obj.width_2(a0),d4
	sub.w	d4,d3
	tst.l	obj.var_2a(a0)
	bpl.s	loc_20BAFE
	add.w	d4,d3
	add.w	d4,d3

loc_20BAFE:
	jsr	CheckBlockDown2
	cmpi.w	#$10,d1
	blt.s	locret_20BB10
	addi.b	#-8,obj.routine(a0)

locret_20BB10:
	rts

; ------------------------------------------------------------------------------

sub_20BB12:
	addq.w	#1,obj.var_36(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_36(a0),d0
	andi.w	#$F,d0
	bne.s	locret_20BB2C
	neg.l	obj.var_2e(a0)

locret_20BB2C:
	rts

; ------------------------------------------------------------------------------

	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$100,d0
	subi.w	#$200,d0
	bcc.s	locret_20BB54
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$100,d0
	subi.w	#$200,d0

locret_20BB54:
	rts

; ------------------------------------------------------------------------------

TentouAnims:
	include	"src/anims/r3/tentou.asm"
	even

TentouSprites2:
	include	"src/sprites/r3/tentou_2.asm"
	even

TentouSprites1:
	include	"src/sprites/r3/tentou_1.asm"
	even

; ------------------------------------------------------------------------------

loc_20BC42:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BC56(pc,d0.w),d0
	jsr	off_20BC56(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20BC56:
	dc.w	TentouObject_1_Routine0-*
	dc.w	TentouObject_1_Routine2-off_20BC56
	dc.w	TentouObject_1_Routine4-off_20BC56
	dc.w	TentouObject_1_Routine6-off_20BC56
	dc.w	TentouObject_1_Routine8-off_20BC56

; ------------------------------------------------------------------------------

TentouObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#$8B,obj.collide_type(a0)
	move.b	#6,obj.width(a0)
	move.b	#6,obj.width_2(a0)
	move.b	#6,obj.height(a0)
	move.w	#$495,obj.sprite_tile(a0)
	move.l	#TentouBombSprites,obj.sprite_data(a0)

TentouObject_1_Routine2:
	tst.b	obj.collide_status(a0)
	bne.s	TentouObject_1_Routine8
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20BCBC
	add.w	d1,obj.y(a0)
	move.w	#$78,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

locret_20BCBC:
	rts

; ------------------------------------------------------------------------------

TentouObject_1_Routine4:
	tst.b	obj.collide_status(a0)
	bne.s	TentouObject_1_Routine8
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20BCD6
	move.w	#$78,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

locret_20BCD6:
	rts

; ------------------------------------------------------------------------------

TentouObject_1_Routine6:
	tst.b	obj.collide_status(a0)
	bne.s	TentouObject_1_Routine8
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20BCEA
	addq.b	#2,obj.routine(a0)

loc_20BCEA:
	lea	TentouBombAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

TentouObject_1_Routine8:
	move.b	#$18,obj.id(a0)
	move.b	#0,obj.routine(a0)
	move.b	#1,obj.routine_2(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20BD16
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20BD16:
	rts

; ------------------------------------------------------------------------------

TentouBombAnims:
	include	"src/anims/r3/tentou_bomb.asm"
	even

TentouBombSprites:
	include	"src/sprites/r3/tentou_bomb.asm"
	even
	
; ------------------------------------------------------------------------------
