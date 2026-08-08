; ------------------------------------------------------------------------------

TamabbohObject:
	cmpi.b	#1,obj.subtype(a0)
	beq.w	loc_20B9B4
	jsr	(DestroyInGoodFuture).l
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B7A0(pc,d0.w),d0
	jsr	off_20B7A0(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	jmp	(CheckObjectDespawn2).l

; ------------------------------------------------------------------------------

off_20B7A0:
	dc.w	TamabbohObject_1_Routine0-*
	dc.w	TamabbohObject_1_Routine2-off_20B7A0
	dc.w	TamabbohObject_1_Routine4-off_20B7A0
	dc.w	TamabbohObject_1_Routine6-off_20B7A0
	dc.w	TamabbohObject_1_Routine8-off_20B7A0
	dc.w	TamabbohObject_1_RoutineA-off_20B7A0

; ------------------------------------------------------------------------------

TamabbohObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$2C,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$F,obj.height(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	moveq	#4,d0
	jsr	(SetObjectSpriteTile).l
	tst.b	obj.subtype(a0)
	bne.s	loc_20B7F8
	lea	TamabbohSprites1(pc),a1
	lea	TamabbohAnims1(pc),a2
	move.l	#-$A000,d0
	bra.s	loc_20B806

; ------------------------------------------------------------------------------

loc_20B7F8:
	lea	TamabbohSprites2(pc),a1
	lea	TamabbohAnims2(pc),a2
	move.l	#-$5000,d0

loc_20B806:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_30(a0)
	move.l	d0,obj.var_2c(a0)

TamabbohObject_1_Routine2:
	move.l	#$10000,d0
	add.l	d0,obj.y(a0)
	jsr	(CheckBlockDown).l
	tst.w	d1
	bpl.s	locret_20B82A
	addq.b	#2,obj.routine(a0)

locret_20B82A:
	rts

; ------------------------------------------------------------------------------

TamabbohObject_1_Routine4:
	tst.w	(debug_mode).l
	bne.s	loc_20B84E
	tst.b	obj.subtype(a0)
	bne.s	loc_20B84E
	tst.w	obj.var_34(a0)
	beq.s	loc_20B846
	subq.w	#1,obj.var_34(a0)
	bra.s	loc_20B84E

; ------------------------------------------------------------------------------

loc_20B846:
	lea	(player_object).w,a1
	bsr.s	sub_20B8A0
	bcs.s	loc_20B89A

loc_20B84E:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2a(a0),d0
	bpl.s	loc_20B862
	neg.w	d0

loc_20B862:
	cmpi.w	#$80,d0
	bge.s	loc_20B888
	jsr	(CheckBlockDown).l
	cmpi.w	#-7,d1
	blt.s	loc_20B888
	cmpi.w	#7,d1
	bgt.s	loc_20B888
	add.w	d1,obj.y(a0)
	movea.l	obj.var_30(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

loc_20B888:
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bra.s	TamabbohObject_1_Routine4

; ------------------------------------------------------------------------------

loc_20B89A:
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_20B8A0:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	locret_20B8C4
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d1
	subi.w	#-$50,d1
	subi.w	#$A0,d1

locret_20B8C4:
	rts

; ------------------------------------------------------------------------------

TamabbohObject_1_Routine6:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)

TamabbohObject_1_Routine8:
	movea.l	obj.var_30(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

TamabbohObject_1_RoutineA:
	move.b	#4,obj.routine(a0)
	move.b	#0,obj.anim_id(a0)
	move.w	#$78,obj.var_34(a0)
	tst.b	obj.subtype(a0)
	bne.s	locret_20B91E
	jsr	(SpawnObject).l
	bne.s	locret_20B91E
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20B90A
	move.w	#$A0,d0
	jsr	(PlayFmSound).l

loc_20B90A:
	bsr.s	sub_20B920
	sf	obj.var_3f(a1)
	jsr	(SpawnObject).l
	bne.s	locret_20B91E
	bsr.s	sub_20B920
	st	obj.var_3f(a1)

locret_20B91E:
	rts

; ------------------------------------------------------------------------------

sub_20B920:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$A,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

TamabbohAnims1:
	include	"src/anims/r1/tamabboh_1.asm"
	even

TamabbohAnims2:
	include	"src/anims/r1/tamabboh_2.asm"
	even

TamabbohSprites:
	include	"src/sprites/r1/tamabboh.asm"
	even
TamabbohSprites1	equ .Sprites1
TamabbohSprites2	equ .Sprites2

; ------------------------------------------------------------------------------

loc_20B9B4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B9C8(pc,d0.w),d0
	jsr	off_20B9C8(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20B9C8:
	dc.w	TamabbohObject_0_Routine0-*
	dc.w	TamabbohObject_0_Routine2-off_20B9C8

; ------------------------------------------------------------------------------

TamabbohObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$AD,obj.collide_type(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.l	#TamaMissileSprites,obj.sprite_data(a0)
	move.l	#0,obj.var_32(a0)
	move.l	#$2000,obj.var_36(a0)
	tst.b	obj.var_3f(a0)
	bne.s	loc_20BA1A
	move.l	#$20000,d0
	move.l	#-$40000,d1
	bra.s	loc_20BA26

; ------------------------------------------------------------------------------

loc_20BA1A:
	move.l	#-$20000,d0
	move.l	#-$40000,d1

loc_20BA26:
	move.l	d0,obj.var_2a(a0)
	move.l	d1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

TamabbohObject_0_Routine2:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20BA3C
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20BA3C:
	jsr	(CheckBlockDown).l
	tst.w	d1
	bpl.s	loc_20BA4C
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20BA4C:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	move.l	obj.var_32(a0),d0
	add.l	d0,obj.var_2a(a0)
	move.l	obj.var_36(a0),d0
	add.l	d0,obj.var_2e(a0)
	lea	TamaMissileAnims(pc),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

TamaMissileAnims:
	include	"src/anims/r1/tama_missile.asm"
	even

TamaMissileSprites:
	include	"src/sprites/r1/tama_missile.asm"
	even

; ------------------------------------------------------------------------------