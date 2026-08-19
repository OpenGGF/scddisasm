; ------------------------------------------------------------------------------

SwitchObject:
	tst.b	obj.routine(a0)
	bne.w	loc_20D870
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$4E4,d0
	cmpi.b	#2,act
	bne.s	loc_20D84C
	move.w	#$386,d0

loc_20D84C:
	move.w	d0,obj.sprite_tile(a0)
	move.l	#Spr_20D8F0,obj.sprite_data(a0)
	move.b	#8,obj.height(a0)
	lea	switch_flags,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	lea	(a1,d0.w),a1
	move.w	a1,obj.var_3c(a0)

loc_20D870:
	move.b	obj.var_3f(a0),obj.var_3e(a0)
	lea	player_object,a1
	jsr	SolidObject
	movea.w	obj.var_3c(a0),a2
	sne.b	obj.var_3f(a0)
	bne.w	loc_20D894
	bclr	#7,(a2)
	bra.w	loc_20D89C

; ------------------------------------------------------------------------------

loc_20D894:
	bset	#7,(a2)
	bset	#6,(a2)

loc_20D89C:
	cmpi.w	#$FF,obj.var_3e(a0)
	bne.w	loc_20D8CA
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20D8B6
	move.w	#$BF,d0
	jsr	PlayFmSound

loc_20D8B6:
	bchg	#5,(a2)
	addq.w	#8,obj.y(a1)
	addq.w	#4,obj.y(a0)
	addq.b	#1,obj.sprite_frame(a0)
	subq.b	#4,obj.height(a0)

loc_20D8CA:
	cmpi.w	#-$100,obj.var_3e(a0)
	bne.w	loc_20D8E4
	subq.w	#8,obj.y(a1)
	subq.w	#4,obj.y(a0)
	subq.b	#1,obj.sprite_frame(a0)
	addq.b	#4,obj.height(a0)

loc_20D8E4:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

Spr_20D8F0:
	dc.w	@Spr_20D8F0_0-*
	dc.w	@Spr_20D8F0_1-Spr_20D8F0
@Spr_20D8F0_0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0
@Spr_20D8F0_1:
	dc.b	2
	dc.b	$FC, 4, 0, 4, $F0
	dc.b	$FC, 4, 8, 4, 0

; ------------------------------------------------------------------------------
