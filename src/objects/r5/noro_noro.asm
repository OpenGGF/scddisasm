; ------------------------------------------------------------------------------

NoroNoroObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20D130
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CFB6(pc,d0.w),d0
	jsr	off_20CFB6(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20CFB6:
	dc.w	NoroNoroObject_0_Routine0-*
	dc.w	NoroNoroObject_0_Routine2-off_20CFB6
	dc.w	NoroNoroObject_0_Routine4-off_20CFB6

; ------------------------------------------------------------------------------

NoroNoroObject_0_Routine0:
	move.w	obj.x(a0),obj.var_2a(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$2390,obj.sprite_tile(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$F,obj.height(a0)
	move.b	#$2F,obj.collide_type(a0)
	move.l	#-$4000,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)
	lea	NoroNoroSprites1(pc),a1
	tst.b	obj.subtype(a0)
	beq.s	loc_20D006
	lea	NoroNoroSprites2(pc),a1

loc_20D006:
	move.l	a1,obj.sprite_data(a0)

NoroNoroObject_0_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20D024
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)

locret_20D024:
	rts

; ------------------------------------------------------------------------------

NoroNoroObject_0_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2a(a0),d0
	bpl.s	loc_20D03A
	neg.w	d0

loc_20D03A:
	cmpi.w	#$50,d0
	bge.w	loc_20D0FA
	jsr	CheckBlockDown
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcc.w	loc_20D0FA
	add.w	d1,obj.y(a0)
	tst.b	obj.subtype(a0)
	bne.w	loc_20D0F0
	lea	player_object,a6
	bsr.w	sub_20D10C
	bcc.w	loc_20D0D4
	move.b	#1,obj.anim_id(a0)
	tst.w	obj.var_3e(a0)
	bne.w	loc_20D0F0
	jsr	SpawnObject
	bne.s	loc_20D0F0
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#-$14,obj.y(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	#NoroSpikesSprites,obj.sprite_data(a1)
	move.b	#$B0,obj.collide_type(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_3e(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20D0D2
	move.w	#$B7,d0
	jsr	PlayFmSound

loc_20D0D2:
	bra.s	loc_20D0F0

; ------------------------------------------------------------------------------

loc_20D0D4:
	move.b	#0,obj.anim_id(a0)
	tst.w	obj.var_3e(a0)
	beq.s	loc_20D0F0
	movea.w	obj.var_3e(a0),a1
	jsr	DeleteOtherObject
	move.w	#0,obj.var_3e(a0)

loc_20D0F0:
	lea	NoroNoroAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20D0FA:
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D10C:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$78,d0
	subi.w	#$F0,d0
	bcc.s	locret_20D12E
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$78,d0
	subi.w	#$F0,d0

locret_20D12E:
	rts

; ------------------------------------------------------------------------------

loc_20D130:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$20,obj.id(a1)
	bne.s	loc_20D15E
	move.b	obj.subtype_2(a0),d0
	cmp.b	obj.subtype_2(a1),d0
	bne.s	loc_20D15E
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	addi.w	#-$14,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20D15E:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

NoroNoroAnims:
	include	"anims/r5/noro_noro.asm"
	even

NoroNoroSprites1:
	include	"sprites/r5/noro_noro_1.asm"
	even

NoroNoroSprites2:
	include	"sprites/r5/noro_noro_2.asm"
	even

NoroSpikesSprites:
	include	"sprites/r5/noro_spikes.asm"
	even

; ------------------------------------------------------------------------------
