; ------------------------------------------------------------------------------

MosquiObject:
	jsr	(DestroyInGoodFuture).l
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B5AA(pc,d0.w),d0
	jsr	off_20B5AA(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	jmp	(CheckObjectDespawn2).l

; ------------------------------------------------------------------------------

off_20B5AA:
	dc.w	MosquiObject_0_Routine0-*
	dc.w	MosquiObject_0_Routine2-off_20B5AA
	dc.w	MosquiObject_0_Routine4-off_20B5AA
	dc.w	MosquiObject_0_Routine6-off_20B5AA
	dc.w	MosquiObject_0_Routine8-off_20B5AA

; ------------------------------------------------------------------------------

MosquiObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$2B,obj.collide_type(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	moveq	#0,d0
	jsr	(SetObjectSpriteTile).l
	tst.b	obj.subtype(a0)
	bne.s	loc_20B600
	lea	MosquiSprites(pc),a1
	lea	MosquiAnims(pc),a2
	move.l	#-$10000,d0
	bra.s	loc_20B60E

; ------------------------------------------------------------------------------

loc_20B600:
	lea	MosquiDecaySprites(pc),a1
	lea	MosquiDecayAnims(pc),a2
	move.l	#-$8000,d0

loc_20B60E:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_30(a0)
	move.l	d0,obj.var_2c(a0)

MosquiObject_0_Routine2:
	tst.w	(debug_mode).l
	bne.s	loc_20B62A
	lea	(player_object).w,a1
	bsr.s	sub_20B66C
	bcs.s	loc_20B660

loc_20B62A:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2a(a0),d0
	bpl.s	loc_20B63E
	neg.w	d0

loc_20B63E:
	cmpi.w	#$80,d0
	blt.s	loc_20B656
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bra.s	loc_20B62A

; ------------------------------------------------------------------------------

loc_20B656:
	movea.l	obj.var_30(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

loc_20B660:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

sub_20B66C:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$30,d0
	subi.w	#$70,d0
	bcc.s	locret_20B690
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d1
	subi.w	#-$30,d1
	subi.w	#$60,d1

locret_20B690:
	rts

; ------------------------------------------------------------------------------

MosquiObject_0_Routine4:
	movea.l	obj.var_30(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

MosquiObject_0_Routine6:
	addq.w	#6,obj.y(a0)
	jsr	(CheckBlockDown).l
	cmpi.w	#-8,d1
	bgt.s	locret_20B6C8
	subi.w	#-8,d1
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20B6C8
	move.w	#$A7,d0
	jsr	(PlayFmSound).l

locret_20B6C8:
	rts

; ------------------------------------------------------------------------------

MosquiObject_0_Routine8:
	tst.b	obj.sprite_flags(a0)
	bmi.s	locret_20B6D6
	jmp	(DespawnObject).l

; ------------------------------------------------------------------------------

locret_20B6D6:
	rts

; ------------------------------------------------------------------------------

MosquiAnims:
	dc.w	@MosquiAnims_0-*
	dc.w	@MosquiAnims_1-MosquiAnims

@MosquiAnims_0:
	dc.b	1
	dc.b	0, 1
	dc.b	$FF

@MosquiAnims_1:
	dc.b	6
	dc.b	2, 3, 4
	dc.b	$FC
	dc.b	0

MosquiDecayAnims:
	dc.w	@MosquiDecayAnims_0-*
	dc.w	@MosquiDecayAnims_1-MosquiDecayAnims

@MosquiDecayAnims_0:
	dc.b	4
	dc.b	0, 1
	dc.b	$FF

@MosquiDecayAnims_1:
	dc.b	$E
	dc.b	2, 3, 4
	dc.b	$FC
	dc.b	0

MosquiSprites:
	dc.w	@MosquiSprites_0-*
	dc.w	@MosquiSprites_1-MosquiSprites
	dc.w	@MosquiSprites_2-MosquiSprites
	dc.w	@MosquiSprites_3-MosquiSprites
	dc.w	@MosquiSprites_4-MosquiSprites

@MosquiSprites_0:
	dc.b	3
	dc.b	$F4, 8, 0, 0, $F8
	dc.b	$FC, 5, 0, 3, $F0
	dc.b	$FC, 5, 0, 7, 0

@MosquiSprites_1:
	dc.b	2
	dc.b	$FC, 5, 0, 3, $F0
	dc.b	$FC, 5, 0, $B, 0

@MosquiSprites_2:
	dc.b	2
	dc.b	$F0, $A, 0, $F, $F8
	dc.b	8, 4, 0, $18, $F0

@MosquiSprites_3:
	dc.b	1
	dc.b	$F0, $B, 0, $1A, $F8

@MosquiSprites_4:
	dc.b	1
	dc.b	$F0, $B, 0, $26, $F4

MosquiDecaySprites:
	dc.w	@MosquiDecaySprites_0-*
	dc.w	@MosquiDecaySprites_1-MosquiDecaySprites
	dc.w	@MosquiDecaySprites_2-MosquiDecaySprites
	dc.w	@MosquiDecaySprites_3-MosquiDecaySprites
	dc.w	@MosquiDecaySprites_4-MosquiDecaySprites

@MosquiDecaySprites_0:
	dc.b	3
	dc.b	$F4, 8, 0, 0, $F8
	dc.b	$FC, 5, 0, $32, $F0
	dc.b	$FC, 5, 0, 7, 0

@MosquiDecaySprites_1:
	dc.b	2
	dc.b	$FC, 5, 0, $32, $F0
	dc.b	$FC, 5, 0, $B, 0

@MosquiDecaySprites_2:
	dc.b	2
	dc.b	$F0, $A, 0, $F, $F8
	dc.b	8, 4, 0, $36, $F0

@MosquiDecaySprites_3:
	dc.b	1
	dc.b	$F0, $B, 0, $38, $F8

@MosquiDecaySprites_4:
	dc.b	2
	dc.b	0, 1, 0, $44, $FC
	dc.b	$F0, $B, 0, $26, $F4
	dc.b	0

; ------------------------------------------------------------------------------