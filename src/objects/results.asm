; ------------------------------------------------------------------------------

ResultsObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20AADC(pc,d0.w),d0
	jmp	off_20AADC(pc,d0.w)

; ------------------------------------------------------------------------------

off_20AADC:
	dc.w	ResultsLoadGfx-*
	dc.w	ResultsInit-off_20AADC
	dc.w	ResultsMove-off_20AADC
	dc.w	ResultsBonus-off_20AADC
	dc.w	ResultsNextStage-off_20AADC

; ------------------------------------------------------------------------------

ResultsLoadGfx:
	subq.b	#1,obj.var_32(a0)
	beq.s	loc_20AAEE
	rts

; ------------------------------------------------------------------------------

loc_20AAEE:
	moveq	#$10,d0
	jsr	AddGfxQueue
	addq.b	#2,obj.routine(a0)

ResultsInit:
	tst.l	(gfx_queue).w
	bne.s	locret_20AB1C
	cmpi.w	#$502,(zone).l
	beq.s	loc_20AB1E
	lea	(player_object).w,a6
	move.w	(scroll_fg_x).w,d0
	addi.w	#$150,d0
	cmp.w	obj.x(a6),d0
	bcs.s	loc_20AB1E

locret_20AB1C:
	rts

; ------------------------------------------------------------------------------

loc_20AB1E:
	lea	(word_20AD8E).l,a2
	moveq	#2,d6
	moveq	#0,d1
	movea.l	a0,a1
	move.w	#$168,obj.var_32(a0)
	bra.s	loc_20AB38

; ------------------------------------------------------------------------------

loc_20AB32:
	jsr	SpawnObject

loc_20AB38:
	move.w	#$168,obj.var_32(a1)
	move.b	#$3A,obj.id(a1)
	move.b	#4,obj.routine(a1)
	move.w	#$83C4,obj.sprite_tile(a1)
	cmpi.w	#$502,(zone).l
	bne.s	loc_20AB7A
	move.w	#$82F2,obj.sprite_tile(a1)
	move.l	#BadResultsSpritesR73,obj.sprite_data(a1)
	tst.b	(good_future).l
	beq.s	loc_20AB92
	move.l	#GoodResultsSpritesR73,obj.sprite_data(a1)
	bra.s	loc_20AB92

; ------------------------------------------------------------------------------

loc_20AB7A:
	move.l	#BadResultsSprites,obj.sprite_data(a1)
	tst.b	(good_future).l
	beq.s	loc_20AB92
	move.l	#GoodResultsSprites,obj.sprite_data(a1)

loc_20AB92:
	move.w	d1,d2
	lsl.w	#3,d2
	move.w	(a2,d2.w),obj.x+2(a1)
	move.w	2(a2,d2.w),obj.x(a1)
	move.w	4(a2,d2.w),obj.var_2a(a1)
	move.b	7(a2,d2.w),obj.sprite_frame(a1)
	cmpi.b	#2,d1
	bne.s	loc_20ABBE
	move.b	(act).l,d2
	add.b	d2,obj.sprite_frame(a1)

loc_20ABBE:
	addq.b	#1,d1
	dbf	d6,loc_20AB32
	rts

; ------------------------------------------------------------------------------

ResultsMove:
	tst.w	obj.var_32(a0)
	beq.s	loc_20ABD0
	subq.w	#1,obj.var_32(a0)

loc_20ABD0:
	moveq	#8,d0
	move.w	obj.var_2a(a0),d1
	cmp.w	obj.x(a0),d1
	beq.s	loc_20ABF4
	bge.s	loc_20ABE0
	neg.w	d0

loc_20ABE0:
	add.w	d0,obj.x(a0)

loc_20ABE4:
	cmpi.w	#$160,obj.var_32(a0)
	bcc.s	locret_20ABF2
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20ABF2:
	rts

; ------------------------------------------------------------------------------

loc_20ABF4:
	tst.b	obj.sprite_frame(a0)
	bne.s	loc_20ABE4
	addq.b	#2,obj.routine(a0)
	bra.s	loc_20ABE4

; ------------------------------------------------------------------------------

ResultsBonus:
	move.b	#1,(update_hud_bonus).w
	moveq	#0,d0
	tst.w	(time_bonus).w
	bne.s	loc_20AC3E
	tst.w	(ring_bonus).w
	bne.s	loc_20AC4E
	subq.w	#1,obj.var_32(a0)
	bpl.s	loc_20AC1E
	addq.b	#2,obj.routine(a0)

loc_20AC1E:
	cmpi.w	#$1E,obj.var_32(a0)
	bne.s	loc_20AC38
	tst.b	(enter_special_stage).l
	beq.s	loc_20AC38
	move.w	#$C8,d0
	jsr	PlayFmSound

loc_20AC38:
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AC3E:
	addi.w	#10,d0
	subi.w	#100,(time_bonus).w
	tst.w	(ring_bonus).w
	beq.s	loc_20AC58

loc_20AC4E:
	addi.w	#10,d0
	subi.w	#100,(ring_bonus).w

loc_20AC58:
	move.l	d0,d1
	tst.w	(time_bonus).w
	bne.s	loc_20AC8A
	tst.w	(ring_bonus).w
	bne.s	loc_20AC8A
	jsr	StopZ80
	move.b	#$9A,(Z80_RAM+$1C09).l
	jsr	StartZ80
	cmpi.w	#$2D,obj.var_32(a0)
	bcc.s	loc_20ACA6
	move.w	#$2D,obj.var_32(a0)
	bra.s	loc_20ACA6

; ------------------------------------------------------------------------------

loc_20AC8A:
	tst.w	obj.var_32(a0)
	beq.s	loc_20AC94
	subq.w	#1,obj.var_32(a0)

loc_20AC94:
	btst	#0,obj.var_32(a0)
	bne.s	loc_20ACA6
	move.w	#$BD,d0
	jsr	PlayFmSound

loc_20ACA6:
	move.l	d1,d0
	jsr	AddPoints
	jmp	DrawObject

; ------------------------------------------------------------------------------

ResultsNextStage:
	move.w	#2,(restart_stage).l
	move.b	#0,(spawn_mode).l
	clr.w	(gfx_section_id).l
	clr.l	(flower_counts).l
	clr.b	(r5_bg_change).l
	clr.b	(projector_destroyed).l
	clr.b	(respawn_checkpoint).l
	tst.b	(time_attack).l
	beq.s	loc_20ACF2
	bclr	#0,(stage_start_flags).l

loc_20ACF2:
	bclr	#1,(stage_start_flags).l
	move.b	#1,(time_zone).l
	move.w	(zone).l,d0
	addq.b	#1,d0
	cmpi.b	#2,d0
	bne.s	loc_20AD18
	move.b	#2,(time_zone).l

loc_20AD18:
	cmpi.b	#3,d0
	bne.s	loc_20AD2A
	move.b	#0,d0
	addi.w	#$100,d0
	move.b	#0,d0

loc_20AD2A:
	move.w	d0,(zone).l
	jsr	ResetObjectStates
	jsr	FadeOutMusic
	jsr	DrawObject
	move.b	(act).l,d0
	subq.b	#1,d0
	bpl.s	loc_20AD54
	clr.b	(zone_good_futures).l
	rts

; ------------------------------------------------------------------------------

loc_20AD54:
	tst.b	(time_attack).l
	bne.s	locret_20AD8C
	cmpi.b	#$7F,(game_time_stones).l
	beq.s	loc_20AD84
	tst.b	(good_future).l
	beq.s	locret_20AD8C
	clr.b	(good_future).l
	bset	d0,(zone_good_futures).l
	cmpi.b	#3,(zone_good_futures).l
	bne.s	locret_20AD8C

loc_20AD84:
	move.b	#1,(good_future).l

locret_20AD8C:
	rts

; ------------------------------------------------------------------------------

word_20AD8E:
	dc.w	$CC, 0, $120, 0
	dc.w	$110, $200, $F0, 1
	dc.w	$CC, 0, $120, 2

ResultsSprites:
	include	"src/sprites/results.asm"
	even
BadResultsSprites	equ .BadSprites
BadResultsSpritesR73	equ .BadR73Sprites
GoodResultsSprites	equ .GoodSprites
GoodResultsSpritesR73	equ .GoodR73Sprites

; ------------------------------------------------------------------------------