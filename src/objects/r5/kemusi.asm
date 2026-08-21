; ------------------------------------------------------------------------------

KemusiObject:
	tst.b	obj.subtype_2(a0)
	bne.s	loc_20D5E0
	jsr	DestroyInGoodFuture

loc_20D5E0:
	tst.b	obj.routine(a0)
	beq.s	loc_20D604
	movem.w	obj.var_3a(a0),a1-a3
	cmpi.b	#$22,obj.id(a1)
	bne.s	loc_20D634
	cmpi.b	#$22,obj.id(a2)
	bne.s	loc_20D634
	cmpi.b	#$22,obj.id(a3)
	bne.s	loc_20D634

loc_20D604:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D62A(pc,d0.w),d0
	jsr	off_20D62A(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype_2(a0)
	bne.s	locret_20D628
	move.w	obj.var_34(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20D628:
	rts

; ------------------------------------------------------------------------------

off_20D62A:
	dc.w	KemusiObject_0_Routine0-*
	dc.w	KemusiObject_0_Routine2-off_20D62A
	dc.w	KemusiObject_0_Routine4-off_20D62A
	dc.w	KemusiObject_0_Routine6-off_20D62A
	dc.w	KemusiObject_0_Routine8-off_20D62A

; ------------------------------------------------------------------------------

loc_20D634:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

KemusiObject_0_Routine0:
	move.w	#3,obj.var_2a(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$33,obj.collide_type(a0)
	movea.w	a0,a1
	bsr.w	sub_20D710
	tst.b	obj.subtype(a0)
	bne.s	loc_20D668
	move.w	#$24,d0
	move.w	#6,d1
	bra.s	loc_20D670

; ------------------------------------------------------------------------------

loc_20D668:
	move.w	#$24,d0
	move.w	#$C,d1

loc_20D670:
	move.w	d0,obj.var_2c(a0)
	move.w	d1,obj.var_30(a0)
	lea	obj.var_3a(a0),a6
	move.w	#2,d6
	move.w	obj.x(a0),d5
	tst.b	obj.subtype(a0)
	bne.s	loc_20D692
	moveq	#2,d4
	moveq	#$B,d3
	moveq	#$FFFFFFB4,d2
	bra.s	loc_20D698

; ------------------------------------------------------------------------------

loc_20D692:
	moveq	#3,d4
	moveq	#7,d3
	moveq	#$33,d2

loc_20D698:
	jsr	SpawnObjectAfter
	bne.s	loc_20D634
	move.w	a1,(a6)+
	move.w	d6,obj.var_2a(a1)
	addi.w	#$C,d5
	move.w	d5,obj.x(a1)
	move.b	d4,obj.sprite_frame(a1)
	move.b	d3,obj.height(a1)
	move.b	d2,obj.collide_type(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_2c(a0),obj.var_2c(a1)
	move.w	obj.var_30(a0),obj.var_30(a1)
	move.b	#$FF,obj.subtype_2(a1)
	bsr.s	sub_20D710
	dbf	d6,loc_20D698
	movem.w	obj.var_3a(a0),a1-a3
	move.w	a0,obj.var_3a(a1)
	move.w	a2,obj.var_3c(a1)
	move.w	a3,obj.var_3e(a1)
	move.w	a0,obj.var_3a(a2)
	move.w	a1,obj.var_3c(a2)
	move.w	a3,obj.var_3e(a2)
	move.w	a0,obj.var_3a(a3)
	move.w	a1,obj.var_3c(a3)
	move.w	a2,obj.var_3e(a3)
	rts

; ------------------------------------------------------------------------------

sub_20D710:
	move.b	#2,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.w	#$23FE,obj.sprite_tile(a1)
	move.l	#KemusiSprites,obj.sprite_data(a1)
	move.w	obj.x(a0),obj.var_34(a1)
	rts

; ------------------------------------------------------------------------------

KemusiObject_0_Routine2:
	addq.w	#1,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20D76A
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	movea.w	a0,a1
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D766
	movea.w	obj.var_3a(a0),a1

loc_20D766:
	addq.w	#1,obj.var_36(a1)

locret_20D76A:
	rts

; ------------------------------------------------------------------------------

KemusiObject_0_Routine4:
	tst.b	obj.subtype_2(a0)
	bne.s	locret_20D792
	cmpi.w	#4,obj.var_36(a0)
	bne.s	locret_20D792
	movem.w	obj.var_3a(a0),a1-a3
	addq.b	#2,obj.routine(a0)
	addq.b	#2,obj.routine(a1)
	addq.b	#2,obj.routine(a2)
	addq.b	#2,obj.routine(a3)
	bra.s	KemusiObject_0_Routine6

; ------------------------------------------------------------------------------

locret_20D792:
	rts

; ------------------------------------------------------------------------------

KemusiObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	eori.w	#3,obj.var_2a(a0)
	move.w	obj.var_2c(a0),obj.var_2e(a0)
	move.w	obj.var_30(a0),obj.var_32(a0)
	tst.b	obj.subtype_2(a0)
	bne.s	KemusiObject_0_Routine8
	eori.b	#1,obj.sprite_frame(a0)

KemusiObject_0_Routine8:
	move.w	obj.var_2a(a0),d0
	sub.w	d0,obj.var_32(a0)
	bne.s	loc_20D7EE
	move.w	obj.var_30(a0),obj.var_32(a0)
	bsr.s	sub_20D80A
	move.w	obj.var_34(a0),d0
	sub.w	obj.x(a0),d0
	bpl.s	loc_20D7D4
	neg.w	d0

loc_20D7D4:
	cmpi.w	#$50,d0
	bge.s	loc_20D7FA
	jsr	CheckBlockDown
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcc.s	loc_20D7FA
	add.w	d1,obj.y(a0)

loc_20D7EE:
	subq.w	#1,obj.var_2e(a0)
	bne.s	locret_20D7F8
	subq.b	#2,obj.routine(a0)

locret_20D7F8:
	rts

; ------------------------------------------------------------------------------

loc_20D7FA:
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bsr.s	sub_20D80A
	bra.s	KemusiObject_0_Routine8

; ------------------------------------------------------------------------------

sub_20D80A:
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20D818
	subq.w	#1,obj.x(a0)
	bra.s	locret_20D81C

; ------------------------------------------------------------------------------

loc_20D818:
	addq.w	#1,obj.x(a0)

locret_20D81C:
	rts

; ------------------------------------------------------------------------------

KemusiSprites:
	include	"sprites/r5/kemusi.asm"
	even

; ------------------------------------------------------------------------------
