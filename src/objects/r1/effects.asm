; ------------------------------------------------------------------------------

WaterfallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_207172(pc,d0.w),d0
	jsr	off_207172(pc,d0.w)
	lea	(WaterfallAnims).l,a1
	jsr	(AnimateObject).l
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_207172:
	dc.w	WaterfallObject_0_Routine0-*
	dc.w	WaterfallObject_0_Routine2-off_207172

; ------------------------------------------------------------------------------

WaterfallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#WaterfallSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$3BA,obj.sprite_tile(a0)
	andi.w	#$FFF0,obj.y(a0)
	move.w	obj.y(a0),obj.var_2a(a0)
	addi.w	#$180,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

WaterfallObject_0_Routine2:
	move.w	obj.y(a0),d0
	addq.w	#4,d0
	cmp.w	obj.var_2a(a0),d0
	bcs.s	loc_2071C0
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_2071C0:
	move.w	d0,obj.y(a0)
	moveq	#2,d3
	bset	#$D,d3
	move.w	obj.y(a0),d4
	move.w	obj.x(a0),d5
	subi.w	#$60,d5
	move.w	d4,d6
	andi.w	#$F,d6
	bne.s	locret_2071EE
	moveq	#$B,d6

loc_2071E0:
	jsr	(PlaceBlock).l
	addi.w	#$10,d5
	dbf	d6,loc_2071E0

locret_2071EE:
	rts

; ------------------------------------------------------------------------------

EarthquakeSetObject:
	rts

; ------------------------------------------------------------------------------

EarthquakeObject:
	rts

; ------------------------------------------------------------------------------

WaterfallAnims:
	dc.w	@WaterfallAnim_0-*

@WaterfallAnim_0:
	dc.b	4
	dc.b	0, 1
	dc.b	$FF

WaterfallSprites:
	dc.w	@WaterfallSprite_0-*
	dc.w	@WaterfallSprite_1-WaterfallSprites

@WaterfallSprite_0:
	dc.b	6
	dc.b	$F0, $F, 0, 0, $A0
	dc.b	$F0, $F, 0, 0, $C0
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0
	dc.b	$F0, $F, 0, 0, $20
	dc.b	$F0, $F, 0, 0, $40
	dc.b	0

@WaterfallSprite_1:
	dc.b	6
	dc.b	$F0, $F, 0, $10, $A0
	dc.b	$F0, $F, 0, $10, $C0
	dc.b	$F0, $F, 0, $10, $E0
	dc.b	$F0, $F, 0, $10, 0
	dc.b	$F0, $F, 0, $10, $20
	dc.b	$F0, $F, 0, $10, $40
	dc.b	0

; ------------------------------------------------------------------------------