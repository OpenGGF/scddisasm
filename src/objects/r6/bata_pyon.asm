; ------------------------------------------------------------------------------

BataPyonObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D90C(pc,d0.w),d0
	jsr	off_20D90C(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D90C:
	dc.w	BataPyonObject_0_Routine0-*
	dc.w	BataPyonObject_0_Routine2-off_20D90C
	dc.w	BataPyonObject_0_Routine4-off_20D90C
	dc.w	BataPyonObject_0_Routine6-off_20D90C

; ------------------------------------------------------------------------------

BataPyonObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$2438,obj.sprite_tile(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.l	#$70000,obj.var_2e(a0)
	move.l	#CheckBlockLeft,obj.var_36(a0)
	move.w	#$FFF0,obj.var_34(a0)
	move.b	#1,obj.sprite_frame(a0)
	bsr.w	sub_20DB08
	movea.l	#BataPyonSprites1,a1
	move.l	#-$A000,d0
	move.b	#7,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20D97C
	movea.l	#BataPyonSprites2,a1
	move.l	#-$8000,d0
	move.b	#3,d1

loc_20D97C:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_2a(a0)
	move.l	#$70000,obj.var_2e(a0)
	move.b	d1,obj.var_33(a0)
	move.b	d1,obj.var_32(a0)
	addq.b	#1,obj.var_32(a0)

BataPyonObject_0_Routine2:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	jsr	CheckBlockDown
	move.w	d1,obj.var_3e(a0)
	move.w	obj.var_34(a0),d3
	movea.l	obj.var_36(a0),a1
	jsr	(a1)
	tst.w	d1
	bpl.s	loc_20D9D2
	tst.w	obj.var_3e(a0)
	bpl.w	loc_20DAD4
	cmp.w	obj.var_3e(a0),d1
	ble.w	loc_20DAD4
	bra.s	loc_20D9F4

; ------------------------------------------------------------------------------

loc_20D9D2:
	tst.w	obj.var_3e(a0)
	bmi.s	loc_20D9F4
	addi.l	#$2000,obj.var_2e(a0)
	cmpi.l	#$70000,obj.var_2e(a0)
	blt.s	locret_20D9F2
	move.l	#$70000,obj.var_2e(a0)

locret_20D9F2:
	rts

; ------------------------------------------------------------------------------

loc_20D9F4:
	addq.b	#2,obj.routine(a0)
	move.w	obj.var_3e(a0),d0
	add.w	d0,obj.y(a0)
	move.w	#1,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20DA0E
	move.w	#$14,d0

loc_20DA0E:
	move.w	d0,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

BataPyonObject_0_Routine4:
	tst.b	obj.subtype(a0)
	beq.s	loc_20DA44
	move.w	#7,d6
	move.w	obj.var_3a(a0),d0
	cmpi.w	#6,d0
	beq.s	loc_20DA3C
	cmpi.w	#$B,d0
	beq.s	loc_20DA3A
	cmpi.w	#$F,d0
	beq.s	loc_20DA3C
	cmpi.w	#$12,d0
	bne.s	loc_20DA44

loc_20DA3A:
	neg.w	d6

loc_20DA3C:
	add.w	d6,obj.y(a0)
	bsr.w	sub_20DB08

loc_20DA44:
	subq.w	#1,obj.var_3a(a0)
	bne.s	locret_20DA72
	addq.b	#2,obj.routine(a0)
	subq.w	#7,obj.y(a0)
	bsr.w	sub_20DB08
	move.l	#-$60000,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20DA68
	move.l	#-$50000,d0

loc_20DA68:
	move.l	d0,obj.var_2e(a0)
	subq.b	#1,obj.var_32(a0)
	bmi.s	loc_20DAD4

locret_20DA72:
	rts

; ------------------------------------------------------------------------------

BataPyonObject_0_Routine6:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	jsr	CheckBlockUp
	move.w	d1,obj.var_3e(a0)
	move.w	obj.var_34(a0),d3
	movea.l	obj.var_36(a0),a1
	jsr	(a1)
	tst.w	d1
	bpl.s	loc_20DAAA
	tst.w	obj.var_3e(a0)
	bpl.s	loc_20DAD4
	cmp.w	obj.var_3e(a0),d1
	ble.s	loc_20DAD4
	bra.s	loc_20DABC

; ------------------------------------------------------------------------------

loc_20DAAA:
	tst.w	obj.var_3e(a0)
	bmi.s	loc_20DABC
	addi.l	#$2000,obj.var_2e(a0)
	bpl.s	loc_20DAC8
	rts

; ------------------------------------------------------------------------------

loc_20DABC:
	move.w	obj.var_3e(a0),d0
	sub.w	d0,obj.y(a0)
	clr.l	obj.var_2e(a0)

loc_20DAC8:
	subq.b	#4,obj.routine(a0)
	subi.w	#$B,obj.y(a0)
	bra.s	sub_20DB08

; ------------------------------------------------------------------------------

loc_20DAD4:
	move.b	obj.var_33(a0),obj.var_32(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	neg.l	obj.var_2a(a0)
	neg.w	obj.var_34(a0)
	lea	CheckBlockLeft,a1
	lea	CheckBlockRight,a2
	cmpa.l	obj.var_36(a0),a1
	bne.s	loc_20DB02
	exg	a1,a2

loc_20DB02:
	move.l	a1,obj.var_36(a0)
	rts

; ------------------------------------------------------------------------------

sub_20DB08:
	tst.b	obj.sprite_frame(a0)
	beq.s	loc_20DB16
	moveq	#0,d0
	moveq	#$13,d1
	moveq	#$2F,d2
	bra.s	loc_20DB1C

; ------------------------------------------------------------------------------

loc_20DB16:
	moveq	#1,d0
	moveq	#$1C,d1
	moveq	#$30,d2

loc_20DB1C:
	move.b	d0,obj.sprite_frame(a0)
	move.b	d1,obj.height(a0)
	move.b	d2,obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

BataPyonSprites1:
	include	"src/sprites/r6/bata_pyon_1.asm"
	even

BataPyonSprites2:
	include	"src/sprites/r6/bata_pyon_2.asm"
	even

; ------------------------------------------------------------------------------
