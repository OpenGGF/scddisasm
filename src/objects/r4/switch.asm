; ------------------------------------------------------------------------------

SwitchObject:
	tst.b	obj.routine(a0)
	bne.w	loc_20CBCE
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$50A,obj.sprite_tile(a0)
	move.l	#Spr_20CCEA,obj.sprite_data(a0)
	move.b	#$A,obj.height(a0)
	lea	(switch_flags).w,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	lea	(a1,d0.w),a1
	move.w	a1,obj.var_3c(a0)

loc_20CBCE:
	move.w	obj.var_34(a0),d0
	beq.s	loc_20CBFE
	movea.w	d0,a1
	move.w	obj.x(a0),d1
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	obj.x(a1),d0
	move.w	d0,obj.x(a0)
	sub.w	d1,d0
	asl.w	#8,d0
	move.w	d0,obj.x_speed(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	obj.y(a1),d0
	move.w	d0,obj.y(a0)

loc_20CBFE:
	move.b	obj.var_3f(a0),obj.var_3e(a0)
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	(player_object).w,a1
	jsr	SolidObject
	beq.s	loc_20CC1C
	bsr.w	sub_20CCCE

loc_20CC1C:
	movea.w	obj.var_3c(a0),a4
	sne	obj.var_3f(a0)
	bne.s	loc_20CC2C
	bclr	#7,(a4)
	bra.s	loc_20CC38

; ------------------------------------------------------------------------------

loc_20CC2C:
	bsr.w	sub_20CCCE
	bset	#7,(a4)
	bset	#6,(a4)

loc_20CC38:
	cmpi.w	#$FF,obj.var_3e(a0)
	bne.s	loc_20CC72
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20CC50
	move.w	#$BF,d0
	jsr	PlayFmSound

loc_20CC50:
	bchg	#5,(a4)
	addq.w	#8,obj.y(a1)
	tst.w	obj.var_34(a0)
	beq.s	loc_20CC64
	addq.b	#4,obj.var_39(a0)
	bra.s	loc_20CC68

; ------------------------------------------------------------------------------

loc_20CC64:
	addq.w	#4,obj.y(a0)

loc_20CC68:
	move.b	#1,obj.sprite_frame(a0)
	subq.b	#4,obj.height(a0)

loc_20CC72:
	cmpi.w	#-$100,obj.var_3e(a0)
	bne.s	loc_20CC96
	subq.w	#8,obj.y(a1)
	tst.w	obj.var_34(a0)
	beq.s	loc_20CC8A
	subq.b	#4,obj.var_39(a0)
	bra.s	loc_20CC8E

; ------------------------------------------------------------------------------

loc_20CC8A:
	subq.w	#4,obj.y(a0)

loc_20CC8E:
	clr.b	obj.sprite_frame(a0)
	addq.b	#4,obj.height(a0)

loc_20CC96:
	jsr	DrawObject
	move.w	obj.var_34(a0),d0
	bne.s	loc_20CCA8
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20CCA8:
	movea.w	d0,a1
	move.w	obj.var_36(a1),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20CCC8
	rts

; ------------------------------------------------------------------------------

loc_20CCC8:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

sub_20CCCE:
	move.w	obj.y(a0),d0
	move.b	obj.height(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.b	obj.height(a1),d1
	ext.w	d1
	sub.w	d1,d0
	addq.w	#1,d0
	move.w	d0,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

Spr_20CCEA:
	dc.w	@Spr_20CCEA_0-*
	dc.w	@Spr_20CCEA_1-Spr_20CCEA

@Spr_20CCEA_0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0

@Spr_20CCEA_1:
	dc.b	2
	dc.b	$FC, 4, 0, 4, $F0
	dc.b	$FC, 4, 8, 4, 0

; ------------------------------------------------------------------------------