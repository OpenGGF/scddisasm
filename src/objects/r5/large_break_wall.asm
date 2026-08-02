; ------------------------------------------------------------------------------

LargeBreakWallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EA08(pc,d0.w),d0
	jsr	off_20EA08(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20EA08:
	dc.w	LargeBreakWallObject_0_Routine0-*
	dc.w	LargeBreakWallObject_0_Routine2-off_20EA08
	dc.w	LargeBreakWallObject_0_Routine4-off_20EA08

; ------------------------------------------------------------------------------

LargeBreakWallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$30,obj.height(a0)
	move.b	#$EE,obj.collide_type(a0)
	move.w	#$446B,obj.sprite_tile(a0)
	move.l	#Spr_20EB34,obj.sprite_data(a0)

LargeBreakWallObject_0_Routine2:
	move.b	obj.collide_status(a0),d6
	beq.s	loc_20EA6A
	clr.b	obj.collide_status(a0)
	lea	(player_object).w,a1
	asr	obj.x_speed(a1)
	asr	obj.ground_speed(a1)
	jsr	SolidObject
	beq.s	loc_20EA68
	jsr	GetOffObject

loc_20EA68:
	bra.s	loc_20EA74

; ------------------------------------------------------------------------------

loc_20EA6A:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

loc_20EA74:
	move.w	#$B0,d0
	jsr	PlayFmSound
	addq.b	#2,obj.routine(a0)
	clr.b	obj.collide_type(a0)
	lea	word_20EBAA(pc),a6
	lea	dword_20EBCA(pc),a5
	lea	unk_20EBA2(pc),a4
	moveq	#7,d6
	movea.w	a0,a1
	bra.s	loc_20EAD0

; ------------------------------------------------------------------------------

loc_20EA98:
	jsr	SpawnObject
	bne.s	LargeBreakWallObject_0_Routine4
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)

loc_20EAD0:
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$C,obj.height(a1)
	move.w	(a6)+,d0
	move.w	(a6)+,d1
	add.w	d0,obj.x(a1)
	add.w	d1,obj.y(a1)
	move.l	(a5)+,obj.var_2a(a1)
	move.l	(a5)+,obj.var_2e(a1)
	move.b	(a4)+,obj.sprite_frame(a1)
	dbf	d6,loc_20EA98

LargeBreakWallObject_0_Routine4:
	addi.l	#$4000,obj.var_2e(a0)
	move.l	obj.var_2a(a0),d0
	move.l	obj.var_2e(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)
	lea	(player_object).w,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#-$E0,d0
	ble.s	loc_20EB2E
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20EB2E:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Spr_20EB34:
	dc.w	@Spr_20EB34_0-*
	dc.w	@Spr_20EB34_1-Spr_20EB34
	dc.w	@Spr_20EB34_2-Spr_20EB34
	dc.w	@Spr_20EB34_3-Spr_20EB34
	dc.w	@Spr_20EB34_4-Spr_20EB34
	dc.w	@Spr_20EB34_5-Spr_20EB34
	dc.w	@Spr_20EB34_6-Spr_20EB34
	dc.w	@Spr_20EB34_7-Spr_20EB34

@Spr_20EB34_0:
	dc.b	$A
	dc.b	$E0, 5, 0, $C, $F0
	dc.b	$E0, 5, 0, $18, 0
	dc.b	$F0, 5, 0, $10, $F0
	dc.b	$F0, 5, 0, $18, 0
	dc.b	0, 5, 0, $14, $F0
	dc.b	0, 5, 0, $18, 0
	dc.b	$10, 5, $10, $C, $F0
	dc.b	$10, 5, 0, $18, 0
	dc.b	$18, $E, $10, 0, $F0
	dc.b	$D0, $E, 0, 0, $F0

@Spr_20EB34_1:
	dc.b	1
	dc.b	$F4, $E, 0, 0, $F0

@Spr_20EB34_2:
	dc.b	1
	dc.b	$F8, 5, 0, $C, $F8

@Spr_20EB34_3:
	dc.b	1
	dc.b	$F8, 5, 0, $10, $F8

@Spr_20EB34_4:
	dc.b	1
	dc.b	$F8, 5, 0, $14, $F8

@Spr_20EB34_5:
	dc.b	1
	dc.b	$F8, 5, 0, $18, $F8

@Spr_20EB34_6:
	dc.b	1
	dc.b	$F4, $E, $10, 0, $F0

@Spr_20EB34_7:
	dc.b	1
	dc.b	$F8, 5, $10, $C, $F8
	dc.b	0

unk_20EBA2:
	dc.b	2
	dc.b	5
	dc.b	3
	dc.b	5
	dc.b	4
	dc.b	5
	dc.b	7
	dc.b	5

word_20EBAA:
	dc.w	-8, -$18
	dc.w	$10, 0
	dc.w	0, $10
	dc.w	$10, $10
	dc.w	0, $20
	dc.w	$10, $20
	dc.w	0, $30
	dc.w	$10, $30

dword_20EBCA:
	dc.l	-$12D2D, -$20000
	dc.l	$12D2D, -$20000
	dc.l	-$28000, -$18000
	dc.l	$28000, -$18000
	dc.l	-$50000, $8000
	dc.l	$50000, $8000
	dc.l	-$28000, $10000
	dc.l	$28000, $10000
	
; ------------------------------------------------------------------------------