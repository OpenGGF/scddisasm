; ------------------------------------------------------------------------------

BreakWallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F8B2(pc,d0.w),d0
	jmp	off_20F8B2(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F8B2:
	dc.w	BreakWallObject_0_Routine0-*
	dc.w	BreakWallObject_0_Routine2-off_20F8B2
	dc.w	BreakWallObject_0_Routine4-off_20F8B2

; ------------------------------------------------------------------------------

BreakWallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.b	#$EF,obj.collide_type(a0)
	move.w	#$44BE,obj.sprite_tile(a0)
	move.l	#BreakWallSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)

BreakWallObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20F914
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	lea	(player_object).w,a1
	move.w	obj.x_speed(a1),obj.var_2a(a0)
	move.w	obj.y_speed(a1),obj.var_2e(a0)
	bra.s	loc_20F92A

; ------------------------------------------------------------------------------

loc_20F914:
	lea	(player_object).w,a1
	jsr	(SolidObject).l
	jsr	(DrawObject).l
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

loc_20F92A:
	move.w	#$B0,d0
	jsr	(PlayFmSound).l
	lea	(player_object).w,a6
	asr	obj.x_speed(a6)
	lea	byte_20FB36(pc),a5
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	lsl.w	#3,d0
	adda.w	d0,a5
	lea	word_20FB76(pc),a4
	lea	dword_20FB8E(pc),a3
	moveq	#5,d6
	movea.w	a0,a1
	bra.s	loc_20F990

; ------------------------------------------------------------------------------

loc_20F958:
	jsr	(SpawnObject).l
	bne.s	BreakWallObject_0_Routine4
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)

loc_20F990:
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	(a5)+,obj.sprite_frame(a1)
	move.w	(a4)+,d0
	move.w	(a4)+,d1
	add.w	d0,obj.x(a1)
	add.w	d1,obj.y(a1)
	move.l	(a3)+,d0
	move.l	(a3)+,obj.var_2e(a1)
	tst.w	obj.x_speed(a6)
	bpl.s	loc_20F9C0
	neg.l	d0

loc_20F9C0:
	move.l	d0,obj.var_2a(a1)
	dbf	d6,loc_20F958

BreakWallObject_0_Routine4:
	addi.l	#$4000,obj.var_2e(a0)
	move.l	obj.var_2a(a0),d0
	move.l	obj.var_2e(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)
	lea	(player_object).w,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#-$E0,d0
	ble.s	loc_20F9F8
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

loc_20F9F8:
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

BreakWallSprites:
	include	"src/sprites/r1/break_wall.asm"
	even

byte_20FB36:
	dc.b	8, 9, 8, $C, $D, $C, 0, 0
	dc.b	8, 9, 8, $A, $B, $A, 0, 0
	dc.b	$A, $B, $A, $A, $B, $A, 0, 0
	dc.b	$A, $B, $A, $C, $D, $C, 0, 0
	dc.b	9, 8, 9, $D, $C, $D, 0, 0
	dc.b	9, 8, 9, $B, $A, $B, 0, 0
	dc.b	$B, $A, $B, $B, $A, $B, 0, 0
	dc.b	$B, $A, $B, $D, $C, $D, 0, 0

word_20FB76:
	dc.w	-8, -$10
	dc.w	0, $10
	dc.w	0, $20
	dc.w	$10, 0
	dc.w	$10, $10
	dc.w	$10, $20

dword_20FB8E:
	dc.l	-$2F684, -$148B0
	dc.l	-$3DA12, 0
	dc.l	-$2F684, $148B0
	dc.l	-$2F684, -$1BBBB
	dc.l	-$3684B, 0
	dc.l	-$2F684, $1BBBB

; ------------------------------------------------------------------------------