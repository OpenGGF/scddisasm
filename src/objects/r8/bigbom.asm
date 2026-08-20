; ------------------------------------------------------------------------------

BigbomObject:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.w	off_20D498(pc,d0.w),d0
	jmp	off_20D498(pc,d0.w)

; ------------------------------------------------------------------------------

off_20D498:
	dc.w	BigbomObject_0_Routine0-*
	dc.w	BigbomObject_0_Routine2-off_20D498
	dc.w	BigbomObject_0_Routine4-off_20D498
	dc.w	BigbomObject_0_Routine6-off_20D498
	dc.w	BigbomObject_0_Routine8-off_20D498

; ------------------------------------------------------------------------------

BigbomObject_0_Routine0:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D4C4(pc,d0.w),d0
	jsr	off_20D4C4(pc,d0.w)
	cmpi.b	#2,obj.subtype_2(a0)
	beq.s	locret_20D4C2
	move.w	obj.var_2c(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20D4C2:
	rts

; ------------------------------------------------------------------------------

off_20D4C4:
	dc.w	BigbomObject_1_Routine0-*
	dc.w	BigbomObject_1_Routine2-off_20D4C4
	dc.w	BigbomObject_1_Routine4-off_20D4C4
	dc.w	BigbomObject_1_Routine6-off_20D4C4
	dc.w	BigbomObject_1_Routine8-off_20D4C4
	dc.w	BigbomObject_1_RoutineA-off_20D4C4
	dc.w	BigbomObject_1_RoutineC-off_20D4C4

; ------------------------------------------------------------------------------

BigbomObject_1_Routine0:
	move.w	obj.x(a0),obj.var_2c(a0)
	jsr	SpawnObject
	beq.s	loc_20D4E6
	jmp	DespawnObject

; ------------------------------------------------------------------------------

loc_20D4E6:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#2,obj.subtype(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_3c(a0)
	addq.b	#2,obj.routine(a0)

BigbomObject_1_Routine2:
	rts

; ------------------------------------------------------------------------------

BigbomObject_1_Routine4:
	move.w	#$1E,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

BigbomObject_1_Routine6:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20D578
	movea.w	obj.var_3c(a0),a1
	addq.b	#2,obj.routine(a1)
	jsr	SpawnObject
	beq.s	loc_20D53A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D53A:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#4,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),d0
	addi.w	#-$1F,d0
	move.w	d0,obj.y(a1)
	movea.w	obj.var_3c(a0),a2
	btst	#0,obj.sprite_flags(a2)
	beq.s	loc_20D574
	bchg	#0,obj.sprite_flags(a1)
	bchg	#0,obj.flags(a1)

loc_20D574:
	addq.b	#2,obj.routine(a0)

locret_20D578:
	rts

; ------------------------------------------------------------------------------

BigbomObject_1_Routine8:
	rts

; ------------------------------------------------------------------------------

BigbomObject_1_RoutineA:
	move.w	#0,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

BigbomObject_1_RoutineC:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$20,obj.var_2a(a0)
	bne.s	loc_20D59A
	movea.w	obj.var_3c(a0),a1
	addq.b	#2,obj.routine(a1)

loc_20D59A:
	cmpi.w	#$1E,obj.var_2a(a0)
	bne.s	loc_20D5C8
	jsr	SpawnObject
	beq.s	loc_20D5B0
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D5B0:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#6,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_20D5C8:
	cmpi.w	#$1F,obj.var_2a(a0)
	bne.w	loc_20D66C
	jsr	sub_20D67C
	move.l	#$FFFF0000,obj.var_2a(a1)
	move.l	#$FFFBE000,obj.var_2e(a1)
	jsr	sub_20D67C
	move.l	#$FFFE0000,obj.var_2a(a1)
	move.l	#$FFFAE000,obj.var_2e(a1)
	jsr	sub_20D67C
	move.l	#$FFFD0000,obj.var_2a(a1)
	move.l	#$FFF9E000,obj.var_2e(a1)
	jsr	sub_20D67C
	move.l	#$10000,obj.var_2a(a1)
	move.l	#$FFFBE000,obj.var_2e(a1)
	jsr	sub_20D67C
	move.l	#$20000,obj.var_2a(a1)
	move.l	#$FFFAE000,obj.var_2e(a1)
	jsr	sub_20D67C
	move.l	#$30000,obj.var_2a(a1)
	move.l	#$FFF9E000,obj.var_2e(a1)
	jsr	sub_20D67C
	move.l	#0,obj.var_2a(a1)
	move.l	#$FFFCE000,obj.var_2e(a1)

loc_20D66C:
	cmpi.w	#$28,obj.var_2a(a0)
	bne.s	locret_20D67A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20D67A:
	rts

; ------------------------------------------------------------------------------

sub_20D67C:
	jsr	SpawnObject
	beq.s	loc_20D68A
	jmp	DespawnObject

; ------------------------------------------------------------------------------

loc_20D68A:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#8,obj.subtype(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.l	#0,obj.var_32(a1)
	move.l	#$2000,obj.var_36(a1)
	rts

; ------------------------------------------------------------------------------

BigbomObject_0_Routine2:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D6EC(pc,d0.w),d0
	jsr	off_20D6EC(pc,d0.w)
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$23,obj.id(a1)
	bne.s	loc_20D6E6
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20D6E6:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20D6EC:
	dc.w	BigbomObject_2_Routine0-*
	dc.w	BigbomObject_2_Routine2-off_20D6EC
	dc.w	BigbomObject_2_Routine4-off_20D6EC
	dc.w	BigbomObject_2_Routine6-off_20D6EC
	dc.w	BigbomObject_2_Routine8-off_20D6EC
	dc.w	BigbomObject_2_RoutineA-off_20D6EC
	dc.w	BigbomObject_2_RoutineC-off_20D6EC
	dc.w	BigbomObject_2_RoutineE-off_20D6EC
	dc.w	BigbomObject_2_Routine10-off_20D6EC
	dc.w	BigbomObject_2_Routine12-off_20D6EC
	dc.w	BigbomObject_2_Routine14-off_20D6EC
	dc.w	BigbomObject_2_Routine16-off_20D6EC
	dc.w	BigbomObject_2_Routine18-off_20D6EC

; ------------------------------------------------------------------------------

BigbomObject_2_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$8340,obj.sprite_tile(a0)
	move.l	#BigbomSprites,obj.sprite_data(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#$1A,obj.height(a0)
	move.b	#$A6,obj.var_3d(a0)
	addq.b	#2,obj.routine(a0)

BigbomObject_2_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20D772
	add.w	d1,obj.y(a0)
	cmpi.b	#2,obj.subtype_2(a0)
	beq.s	loc_20D762
	move.b	#$C,obj.routine(a0)
	move.b	#$A6,obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D762:
	addq.b	#2,obj.routine(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

locret_20D772:
	rts

; ------------------------------------------------------------------------------

BigbomObject_2_Routine4:
	lea	player_object,a6
	bsr.w	sub_20D8B8
	bcc.s	locret_20D788
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	bpl.s	loc_20D78A

locret_20D788:
	rts

; ------------------------------------------------------------------------------

loc_20D78A:
	addq.b	#2,obj.routine(a0)

BigbomObject_2_Routine6:
	addq.b	#2,obj.routine(a0)
	move.l	#$28000,obj.var_2c(a0)
	move.w	#$E6,obj.var_2a(a0)
	move.w	#$12,obj.var_30(a0)
	move.b	#3,obj.sprite_frame(a0)

BigbomObject_2_Routine8:
	moveq	#0,d0
	tst.b	stage_layer
	bne.s	loc_20D7BA
	move.b	obj.var_3d(a0),d0

loc_20D7BA:
	move.b	d0,obj.collide_type(a0)
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	subq.w	#1,obj.var_30(a0)
	bpl.s	loc_20D7E8
	addq.b	#1,obj.sprite_frame(a0)
	andi.b	#3,obj.sprite_frame(a0)
	lea	word_20D8B0(pc),a1
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.var_30(a0)

loc_20D7E8:
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	locret_20D7F4
	addq.b	#2,obj.routine(a0)

locret_20D7F4:
	rts

; ------------------------------------------------------------------------------

BigbomObject_2_RoutineA:
	moveq	#0,d0
	tst.b	stage_layer
	bne.s	loc_20D804
	move.b	obj.var_3d(a0),d0

loc_20D804:
	move.b	d0,obj.collide_type(a0)
	tst.b	stage_layer
	bne.s	locret_20D820
	lea	player_object,a6
	bsr.w	sub_20D8B8
	bcc.s	locret_20D820
	move.b	#$10,obj.routine(a0)

locret_20D820:
	rts

; ------------------------------------------------------------------------------

BigbomObject_2_RoutineC:
	addq.b	#2,obj.routine(a0)
	move.l	#$FFFF6000,obj.var_2c(a0)
	move.w	#0,obj.var_2a(a0)
	move.w	#0,obj.var_30(a0)
	move.b	#3,obj.sprite_frame(a0)

BigbomObject_2_RoutineE:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	jsr	CheckBlockDown
	add.w	d1,obj.y(a0)
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	loc_20D87C
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	move.w	#$CC,d0
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D878
	move.w	#$19,d0

loc_20D878:
	move.w	d0,obj.var_2a(a0)

loc_20D87C:
	addi.w	#-1,obj.var_30(a0)
	bpl.s	loc_20D8A0
	addq.b	#1,obj.sprite_frame(a0)
	andi.b	#3,obj.sprite_frame(a0)
	lea	word_20D8B0(pc),a1
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.var_30(a0)

loc_20D8A0:
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20D8AE
	lea	player_object,a6
	bsr.s	sub_20D8B8
	bcs.s	loc_20D8DC

locret_20D8AE:
	rts

; ------------------------------------------------------------------------------

word_20D8B0:
	dc.w	$19
	dc.w	$F
	dc.w	$19
	dc.w	$12

; ------------------------------------------------------------------------------

sub_20D8B8:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#$FF60,d0
	subi.w	#$F0,d0
	bcc.s	locret_20D8DA
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	subi.w	#$FFA0,d0
	subi.w	#$C0,d0

locret_20D8DA:
	rts

; ------------------------------------------------------------------------------

loc_20D8DC:
	addq.b	#2,obj.routine(a0)

BigbomObject_2_Routine10:
	addq.b	#2,obj.routine(a0)
	movea.w	obj.var_3e(a0),a1
	addq.b	#2,$24(a1)

BigbomObject_2_Routine12:
	cmpi.b	#2,obj.subtype_2(a0)
	bne.s	locret_20D906
	moveq	#0,d0
	tst.b	stage_layer
	bne.s	loc_20D902
	move.b	obj.var_3d(a0),d0

loc_20D902:
	move.b	d0,obj.collide_type(a0)

locret_20D906:
	rts

; ------------------------------------------------------------------------------

BigbomObject_2_Routine14:
	move.b	#4,obj.sprite_frame(a0)
	addq.b	#2,obj.routine(a0)

BigbomObject_2_Routine16:
	bra.s	BigbomObject_2_Routine12

; ------------------------------------------------------------------------------

BigbomObject_2_Routine18:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BigbomSprites:
	include	"src/sprites/r8/bigbom.asm"
	even

; ------------------------------------------------------------------------------

BigbomObject_0_Routine4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D9E8(pc,d0.w),d0
	jsr	off_20D9E8(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20D9E8:
	dc.w	BigbomObject_3_Routine0-*
	dc.w	BigbomObject_3_Routine2-off_20D9E8
	dc.w	BigbomObject_3_Routine4-off_20D9E8
	dc.w	BigbomObject_3_Routine6-off_20D9E8

; ------------------------------------------------------------------------------

BigbomObject_3_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.w	#$8340,obj.sprite_tile(a0)
	move.l	#BigbomFuseSprites,obj.sprite_data(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$3C,obj.var_2a(a0)

BigbomObject_3_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20DA32
	move.w	#$4C,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

loc_20DA32:
	lea	BigbomFuseAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

BigbomObject_3_Routine4:
	addi.l	#$5000,obj.y(a0)
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	loc_20DA50
	addq.b	#2,obj.routine(a0)

loc_20DA50:
	lea	BigbomFuseAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

BigbomObject_3_Routine6:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$23,0(a1)
	bne.s	loc_20DA6A
	addq.b	#2,$24(a1)

loc_20DA6A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BigbomFuseAnims:
	include	"src/anims/r8/bigbom_fuse.asm"
	even

BigbomFuseSprites:
	include	"src/sprites/r8/bigbom_fuse.asm"
	even

; ------------------------------------------------------------------------------

BigbomObject_0_Routine6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DA9A(pc,d0.w),d0
	jsr	off_20DA9A(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20DA9A:
	dc.w	BigbomObject_4_Routine0-*
	dc.w	BigbomObject_4_Routine2-off_20DA9A

; ------------------------------------------------------------------------------

BigbomObject_4_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$8680,obj.sprite_tile(a0)
	move.l	#BigbomExplodeSprites,obj.sprite_data(a0)
	move.w	#$28,obj.var_2a(a0)

BigbomObject_4_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20DAD0
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DAD0:
	lea	BigbomExplodeAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

BigbomExplodeAnims:
	include	"src/anims/r8/bigbom_explode.asm"
	even

BigbomExplodeSprites:
	include	"src/sprites/r8/bigbom_explode.asm"
	even

; ------------------------------------------------------------------------------

BigbomObject_0_Routine8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DB5C(pc,d0.w),d0
	jsr	off_20DB5C(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20DB5C:
	dc.w	BigbomObject_5_Routine0-*
	dc.w	BigbomObject_5_Routine2-off_20DB5C

; ------------------------------------------------------------------------------

BigbomObject_5_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$8340,obj.sprite_tile(a0)
	move.l	#BigbomDebrisSprites,obj.sprite_data(a0)
	move.b	#$A7,obj.collide_type(a0)
	move.b	#$A7,obj.var_3d(a0)

BigbomObject_5_Routine2:
	cmpi.b	#2,obj.subtype_2(a0)
	bne.s	loc_20DBB0
	moveq	#0,d0
	tst.b	stage_layer
	bne.s	loc_20DBAC
	move.b	obj.var_3d(a0),d0

loc_20DBAC:
	move.b	d0,obj.collide_type(a0)

loc_20DBB0:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	move.l	obj.var_32(a0),d0
	add.l	d0,obj.var_2a(a0)
	move.l	obj.var_36(a0),d0
	add.l	d0,obj.var_2e(a0)
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	cmpi.w	#$E0,d0
	blt.s	loc_20DBE8
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DBE8:
	lea	BigbomDebrisAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

BigbomDebrisAnims:
	include	"src/anims/r8/bigbom_debris.asm"
	even

BigbomDebrisSprites:
	include	"src/sprites/r8/bigbom_debris.asm"
	even

; ------------------------------------------------------------------------------
