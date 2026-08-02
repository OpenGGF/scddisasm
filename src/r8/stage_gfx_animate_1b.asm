; ------------------------------------------------------------------------------

AnimateStageGfx:
	jmp	LoadPowerupArt

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20EB00
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20EADE
	moveq	#0,d0

loc_20EADE:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(stage_anim_gfx).l,a3

loc_20EAEE:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20EAEE
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20EB00:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

byte_20EB0C:
	dc.b	6
	dc.b	4
        dc.l	byte_2345CA
        dc.l	byte_2346CA
        dc.l	byte_2347CA
        dc.l	byte_2346CA

byte_20EB1E:
	dc.b	3
	dc.b	4
        dc.l	byte_2348CA
        dc.l	byte_2349CA
        dc.l	byte_234ACA
        dc.l	byte_234BCA

byte_20EB30:
	dc.b	4
	dc.b	4
        dc.l	byte_234CCA
        dc.l	byte_234ECA
        dc.l	byte_2350CA
        dc.l	byte_2352CA

; ------------------------------------------------------------------------------