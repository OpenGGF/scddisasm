; ------------------------------------------------------------------------------

HiddenBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C318(pc,d0.w),d0
	jsr	off_20C318(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C314
	rts

; ------------------------------------------------------------------------------

loc_20C314:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20C318:
	dc.w	HiddenBlockObject_0_Routine0-*
	dc.w	HiddenBlockObject_0_Routine2-off_20C318

; ------------------------------------------------------------------------------

HiddenBlockObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$39F,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HiddenBlockSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),d0
	lsr.b	#2,d0
	move.b	d0,obj.sprite_frame(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$E,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	addq.b	#2,obj.routine(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	andi.b	#3,d0
	beq.s	HiddenBlockObject_0_Routine2
	moveq	#$20,d1
	cmpi.b	#1,d0
	beq.s	loc_20C372
	moveq	#$A,d1

loc_20C372:
	jsr	SpawnObjectAfter
	bne.s	HiddenBlockObject_0_Routine2
	move.b	d1,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$20,obj.var_38(a1)
	move.b	#2,obj.subtype(a1)
	cmpi.b	#$20,d1
	beq.s	HiddenBlockObject_0_Routine2
	move.b	#$18,obj.var_38(a1)
	move.b	obj.subtype(a0),d0
	andi.b	#1,d0
	add.b	d0,d0
	ori.b	#4,d0
	move.b	d0,obj.subtype(a1)

HiddenBlockObject_0_Routine2:
	jsr	sub_20C3CE(pc)
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

sub_20C3CE:
	btst	#2,obj.subtype(a0)
	bne.s	loc_20C3EA
	jsr	sub_20C400(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C3EA:
	jsr	sub_20C400(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20C400:
	lea	player_object,a1
	move.w	obj.x(a0),d0
	move.b	obj.width_2(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.w	obj.x(a1),d1
	sub.w	d0,d1
	bcs.s	loc_20C42E
	cmpi.w	#$50,d1
	bcc.s	loc_20C420
	rts

; ------------------------------------------------------------------------------

loc_20C420:
	subq.b	#8,obj.var_3b(a0)
	bcc.s	locret_20C440
	move.b	#0,obj.var_3b(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C42E:
	addq.b	#8,obj.var_3b(a0)
	cmpi.b	#$20,obj.var_3b(a0)
	bcs.s	locret_20C440
	move.b	#$20,obj.var_3b(a0)

locret_20C440:
	rts

; ------------------------------------------------------------------------------

HiddenBlockSprites:
	include	"src/sprites/r3/hidden_block.asm"
	even

; ------------------------------------------------------------------------------
