; ------------------------------------------------------------------------------

PointsObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_209620(pc,d0.w),d0
	jsr	off_209620(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_209620:
	dc.w	PointsInit-*
	dc.w	PointsMain-off_209620

; ------------------------------------------------------------------------------

PointsInit:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$6C6,obj.sprite_tile(a0)
	move.l	#PointsSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	andi.b	#$7F,obj.sprite_frame(a0)
	move.b	#$18,obj.var_2a(a0)

PointsMain:
	subq.b	#1,obj.var_2a(a0)
	bne.s	loc_20965A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20965A:
	subq.w	#2,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

PointsSprites:
	dc.w	@PointsSprite_0-*
	dc.w	@PointsSprite_1-PointsSprites
	dc.w	@PointsSprite_2-PointsSprites
	dc.w	@PointsSprite_3-PointsSprites
	dc.w	@PointsSprite_4-PointsSprites
	dc.w	@PointsSprite_5-PointsSprites
@PointsSprite_0:
	dc.b	2
	dc.b	0, 0, 0, 0, $F8
	dc.b	0, 0, 0, 3, 0
	dc.b	0
@PointsSprite_1:
	dc.b	2
	dc.b	0, 0, 0, 1, $F8
	dc.b	0, 0, 0, 3, 0
	dc.b	0
@PointsSprite_2:
	dc.b	2
	dc.b	0, 0, 0, 2, $F8
	dc.b	0, 0, 0, 3, 0
	dc.b	0
@PointsSprite_3:
	dc.b	2
	dc.b	0, 0, 0, 4, $F8
	dc.b	0, 0, 0, 3, 0
	dc.b	0
@PointsSprite_4:
	dc.b	1
	dc.b	0, 0, 0, 4, $FC
@PointsSprite_5:
	dc.b	3
	dc.b	0, 0, 0, 0, $F4
	dc.b	0, 0, 0, 3, $FC
	dc.b	0, 0, 0, 3, 4

; ------------------------------------------------------------------------------

HudPointsObject:

	tst.b	obj.subtype(a0)
	bmi.w	PointsObject

HudObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2096C8(pc,d0.w),d0
	jmp	off_2096C8(pc,d0.w)

; ------------------------------------------------------------------------------

off_2096C8:
	dc.w	HudInit-*
	dc.w	HudMain-off_2096C8

; ------------------------------------------------------------------------------

HudInit:
	addq.b	#2,obj.routine(a0)
	move.l	#HudSprites,obj.sprite_data(a0)
	move.w	#$8568,obj.sprite_tile(a0)
	move.w	#$90,obj.x(a0)
	move.w	#$88,obj.x+2(a0)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_2096F8
	move.b	#3,obj.sprite_frame(a0)
	bra.s	HudMain

; ------------------------------------------------------------------------------

loc_2096F8:
	tst.w	(debug_cheat).l
	beq.s	loc_209706
	move.b	#2,obj.sprite_frame(a0)

loc_209706:
	tst.b	obj.subtype(a0)
	beq.s	HudMain
	move.w	#$148,obj.x+2(a0)
	move.b	#1,obj.sprite_frame(a0)

HudMain:
	tst.b	obj.subtype(a0)
	bne.s	loc_20975C
	tst.b	obj.subtype_2(a0)
	beq.s	loc_209748
	tst.w	(rings).l
	beq.s	loc_209734
	bclr	#5,obj.sprite_tile(a0)
	bra.s	loc_20975C

; ------------------------------------------------------------------------------

loc_209734:
	move.b	(stage_vblank_frames+3).l,d0
	andi.b	#$F,d0
	bne.s	loc_20975C
	eori.b	#$20,obj.sprite_tile(a0)
	bra.s	loc_20975C

; ------------------------------------------------------------------------------

loc_209748:
	move.b	#0,obj.sprite_frame(a0)
	tst.w	(debug_cheat).l
	beq.s	loc_20975C
	move.b	#2,obj.sprite_frame(a0)

loc_20975C:
	jmp	DrawObject

; ------------------------------------------------------------------------------

HudSprites:
	dc.w	@HudSprite_0-*
	dc.w	@HudSprite_1-HudSprites
	dc.w	@HudSprite_2-HudSprites
	dc.w	@HudSprite_3-HudSprites
@HudSprite_0:
	dc.b	$E
	dc.b	0, 1, 0, 0, 0
	dc.b	0, 5, 0, 2, 8
	dc.b	0, 1, 0, 6, $18
	dc.b	0, 1, 0, 8, $20
	dc.b	0, 9, 0, $1B, $28
	dc.b	0, $D, 0, $21, $40
	dc.b	$10, 9, 0, $A, 0
	dc.b	$10, 1, 0, 8, $18
	dc.b	$10, 1, 0, $29, $28
	dc.b	$10, 0, 0, $18, $30
	dc.b	$10, 5, 0, $2B, $38
	dc.b	$10, 0, 0, $19, $48
	dc.b	$10, 5, 0, $2F, $50
	dc.b	$20, 9, 0, $33, $30
	dc.b	0
@HudSprite_1:
	dc.b	3
	dc.b	0, 5, 0, $39, 0
	dc.b	8, 0, 0, $1A, $10
	dc.b	4, 1, 0, $3D, $18
@HudSprite_2:
	dc.b	$B
	dc.b	0, 1, 0, 0, 0
	dc.b	0, 5, 0, 2, 8
	dc.b	0, 1, 0, 6, $18
	dc.b	0, 1, 0, 8, $20
	dc.b	0, 9, 0, $1B, $28
	dc.b	0, 9, 0, $21, $40
	dc.b	$10, 9, 0, $A, 0
	dc.b	$10, 1, 0, 8, $18
	dc.b	$10, 5, 0, $2B, $38
	dc.b	$10, 5, 0, $2F, $48
	dc.b	$20, 9, 0, $33, $30
@HudSprite_3:
	dc.b	3
	dc.b	$20, 1, 0, $10, 0
	dc.b	$20, 9, 0, $12, 8
	dc.b	$20, 1, 0, 0, $20

; ------------------------------------------------------------------------------

AddPoints:
	move.b	#1,(update_hud_score).l
	lea	(score).l,a3
	add.l	d0,(a3)
	move.l	#999999,d1
	cmp.l	(a3),d1
	bhi.s	loc_209826
	move.l	d1,(a3)

loc_209826:
	move.l	(a3),d0
	cmp.l	(next_life_score).l,d0
	bcs.s	locret_209850
	addi.l	#5000,(next_life_score).l
	addq.b	#1,(lives).l
	addq.b	#1,(update_hud_lives).l
	move.w	#$7A,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_209850:
	rts

; ------------------------------------------------------------------------------

UpdateHudNumbers:
	tst.w	(debug_cheat).l
	beq.s	loc_2098A8
	bsr.w	DrawHudPosition
	move.l	#$73600002,d0
	moveq	#0,d1
	move.b	(object_states).l,d1
	move.w	(player_object+obj.y).w,d2
	lsr.w	#1,d2
	andi.w	#$380,d2
	move.b	(player_object+obj.x).w,d1
	andi.w	#$7F,d1
	add.w	d1,d2
	lea	(stage_map).w,a1
	moveq	#0,d1
	move.b	(a1,d2.w),d1
	andi.w	#$7F,d1
	move.w	(debug_block).l,d1
	andi.w	#$7FF,d1
	lea	(Hud100).l,a2
	moveq	#2,d6
	bsr.w	DrawHudNumber
	bra.w	loc_209902

; ------------------------------------------------------------------------------

loc_2098A8:
	tst.b	(update_hud_score).l
	beq.s	loc_2098CC
	bpl.s	loc_2098B6
	bsr.w	ResetHudScore

loc_2098B6:
	clr.b	(update_hud_score).l
	move.l	#$70600002,d0
	move.l	(score).l,d1
	bsr.w	DrawHudScore

loc_2098CC:
	tst.b	(update_hud_rings).l
	beq.s	loc_209902
	bpl.s	loc_2098DA
	bsr.w	ResetHudRings

loc_2098DA:
	clr.b	(update_hud_rings).l
	move.l	#$73600002,d0
	moveq	#0,d1
	move.w	(rings).l,d1
	cmpi.w	#1000,d1
	bcs.s	loc_2098FE
	move.w	#999,d1
	move.w	d1,(rings).l

loc_2098FE:
	bsr.w	DrawHudRings

loc_209902:
	tst.w	(debug_cheat).l
	bne.w	loc_2099AE
	tst.b	(update_hud_time).l
	beq.w	loc_2099AE
	tst.w	(paused).w
	bne.w	loc_2099AE
	lea	(time).l,a1
	cmpi.l	#$93B3B,(a1)+
	beq.w	loc_209A0C
	tst.b	(control_locked).w
	bne.s	loc_209958
	addq.b	#1,-(a1)
	cmpi.b	#$3C,(a1)
	bcs.s	loc_209958
	move.b	#0,(a1)
	addq.b	#1,-(a1)
	cmpi.b	#$3C,(a1)
	bcs.s	loc_209958
	move.b	#0,(a1)
	addq.b	#1,-(a1)
	cmpi.b	#9,(a1)
	bcs.s	loc_209958
	move.b	#9,(a1)

loc_209958:
	move.l	#$72200002,d0
	moveq	#0,d1
	move.b	(time_minutes).l,d1
	bsr.w	DrawHudMinutes
	move.l	#$72600002,d0
	moveq	#0,d1
	move.b	(time_seconds).l,d1
	bsr.w	DrawHudSeconds
	move.l	#$72E00002,d0
	moveq	#0,d1
	move.b	(time_frames).l,d1
	mulu.w	#100,d1
	divu.w	#60,d1
	swap	d1
	move.w	#0,d1
	swap	d1
	cmpi.l	#$93B3B,(time).l
	bne.s	loc_2099AA
	move.w	#99,d1

loc_2099AA:
	bsr.w	DrawHudSeconds

loc_2099AE:
	tst.b	(update_hud_lives).l
	beq.s	loc_2099C0
	clr.b	(update_hud_lives).l
	bsr.w	DrawHudLives

loc_2099C0:
	tst.b	(update_hud_bonus).w
	beq.s	locret_209A0A
	clr.b	(update_hud_bonus).w
	move.l	#$47800002,d0
	cmpi.w	#$502,(zone).l
	bne.s	loc_2099E0
	move.l	#$6D400001,d0

loc_2099E0:
	moveq	#0,d1
	move.w	(time_bonus).w,d1
	bsr.w	DrawHudBonus
	move.l	#$48C00002,d0
	cmpi.w	#$502,(zone).l
	bne.s	loc_209A00
	move.l	#$6E800001,d0

loc_209A00:
	moveq	#0,d1
	move.w	(ring_bonus).w,d1
	bsr.w	DrawHudBonus

locret_209A0A:
	rts

; ------------------------------------------------------------------------------

loc_209A0C:
	btst	#7,(time_zone).l
	bne.s	locret_209A38
	clr.b	(update_hud_time).l
	move.l	#0,(time).l
	lea	(player_object).w,a0
	movea.l	a0,a2
	bsr.w	KillPlayer
	move.b	#1,(time_over).l

locret_209A38:
	rts

; ------------------------------------------------------------------------------

ResetHudRings:
	move.l	#$73600002,(VDP_CTRL).l
	lea	HudRingResetTiles(pc),a2
	move.w	#2,d2
	bra.s	ResetHudNumber

; ------------------------------------------------------------------------------

ResetHudScore:
	lea	(VDP_DATA).l,a6
	bsr.w	DrawHudLives
	move.l	#$70600002,(VDP_CTRL).l
	lea	HudScoreResetTiles(pc),a2
	move.w	#6,d2

ResetHudNumber:
	lea	(HudNumbersGfx).l,a1

loc_209A70:
	move.w	#$F,d1
	move.b	(a2)+,d0
	bmi.s	loc_209A8C
	ext.w	d0
	lsl.w	#5,d0
	lea	(a1,d0.w),a3

loc_209A80:
	move.l	(a3)+,(a6)
	dbf	d1,loc_209A80

loc_209A86:
	dbf	d2,loc_209A70
	rts

; ------------------------------------------------------------------------------

loc_209A8C:
	move.l	#0,(a6)
	dbf	d1,loc_209A8C
	bra.s	loc_209A86

; ------------------------------------------------------------------------------

HudScoreResetTiles:
	dc.b	$FF, $FF, $FF, $FF, $FF, $FF, 0, 0
HudRingResetTiles:
	dc.b	$FF, $FF, 0
	dc.b	0

; ------------------------------------------------------------------------------

DrawHudPosition:
	move.l	#$70E00002,d0
	moveq	#0,d1
	move.w	(player_object+obj.x).w,d1
	bsr.w	DrawHudHexNumber
	move.l	#$72600002,d0
	move.w	(player_object+obj.y).w,d1
	bra.w	DrawHudHexNumber

; ------------------------------------------------------------------------------

DrawHudBonus:
	lea	(Hud10000).l,a2
	moveq	#4,d6
	moveq	#0,d4
	lea	(HudNumbersGfx).l,a1

loc_209AD2:
	moveq	#0,d2
	move.l	(a2)+,d3

loc_209AD6:
	sub.l	d3,d1
	bcs.s	loc_209ADE
	addq.w	#1,d2
	bra.s	loc_209AD6

; ------------------------------------------------------------------------------

loc_209ADE:
	add.l	d3,d1
	tst.w	d2
	beq.s	loc_209AE8
	move.w	#1,d4

loc_209AE8:
	move.l	d0,4(a6)
	tst.w	d4
	bne.s	loc_209AF4
	tst.w	d6
	bne.s	loc_209B26

loc_209AF4:
	lsl.w	#6,d2
	lea	(a1,d2.w),a3
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)

loc_209B1A:
	addi.l	#$400000,d0
	dbf	d6,loc_209AD2
	rts

; ------------------------------------------------------------------------------

loc_209B26:
	moveq	#$F,d5

loc_209B28:
	move.l	#0,(a6)
	dbf	d5,loc_209B28
	bra.s	loc_209B1A

; ------------------------------------------------------------------------------

DrawHudRings:
	lea	(Hud100).l,a2
	moveq	#2,d6
	bra.s	loc_209B46

; ------------------------------------------------------------------------------

DrawHudScore:
	lea	(Hud100000).l,a2
	moveq	#5,d6

loc_209B46:
	moveq	#0,d4
	lea	(HudNumbersGfx).l,a1

loc_209B4E:
	moveq	#0,d2
	move.l	(a2)+,d3

loc_209B52:
	sub.l	d3,d1
	bcs.s	loc_209B5A
	addq.w	#1,d2
	bra.s	loc_209B52

; ------------------------------------------------------------------------------

loc_209B5A:
	add.l	d3,d1
	tst.w	d2
	beq.s	loc_209B64
	move.w	#1,d4

loc_209B64:
	tst.w	d4
	beq.s	loc_209B92
	lsl.w	#6,d2
	move.l	d0,4(a6)
	lea	(a1,d2.w),a3
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)

loc_209B92:
	addi.l	#$400000,d0
	dbf	d6,loc_209B4E
	rts

; ------------------------------------------------------------------------------

DrawHudCounter:
	move.l	#$5F800003,(VDP_CTRL).l
	lea	(VDP_DATA).l,a6
	lea	(Hud10).l,a2
	moveq	#1,d6
	moveq	#0,d4
	lea	(HudNumbersGfx).l,a1

loc_209BBE:
	moveq	#0,d2
	move.l	(a2)+,d3

loc_209BC2:
	sub.l	d3,d1
	bcs.s	loc_209BCA
	addq.w	#1,d2
	bra.s	loc_209BC2

; ------------------------------------------------------------------------------

loc_209BCA:
	add.l	d3,d1
	lsl.w	#6,d2
	lea	(a1,d2.w),a3
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	dbf	d6,loc_209BBE
	rts

; ------------------------------------------------------------------------------

Hud100000:
	dc.l	100000
Hud10000:
	dc.l	10000
Hud1000:
	dc.l	1000
Hud100:
	dc.l	100
Hud10:
	dc.l	10
Hud1:
	dc.l	1

Hud1000h:
	dc.l	$1000
Hud100h:
	dc.l	$100
Hud10h:
	dc.l	$10
Hud1h:
	dc.l	1

; ------------------------------------------------------------------------------

DrawHudHexNumber:
	moveq	#3,d6
	lea	(Hud1000h).l,a2
	bra.s	DrawHudNumber

; ------------------------------------------------------------------------------

DrawHudLives:
	move.l	#$74A00002,d0
	moveq	#0,d1
	move.b	(lives).l,d1
	cmpi.b	#9,d1
	bcs.s	loc_209C40
	moveq	#9,d1

loc_209C40:
	lea	(Hud1).l,a2
	moveq	#0,d6
	bra.s	DrawHudNumber

; ------------------------------------------------------------------------------

DrawHudMinutes:
	lea	(Hud1).l,a2
	moveq	#0,d6
	bra.s	DrawHudNumber

; ------------------------------------------------------------------------------

DrawHudSeconds:
	lea	(Hud10).l,a2
	moveq	#1,d6

; ------------------------------------------------------------------------------

DrawHudNumber:
	moveq	#0,d4
	lea	(HudNumbersGfx).l,a1

loc_209C64:
	moveq	#0,d2
	move.l	(a2)+,d3

loc_209C68:
	sub.l	d3,d1
	bcs.s	loc_209C70
	addq.w	#1,d2
	bra.s	loc_209C68

; ------------------------------------------------------------------------------

loc_209C70:
	add.l	d3,d1
	tst.w	d2
	beq.s	loc_209C7A
	move.w	#1,d4

loc_209C7A:
	lsl.w	#6,d2
	move.l	d0,4(a6)
	lea	(a1,d2.w),a3
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	addi.l	#$400000,d0
	dbf	d6,loc_209C64
	rts

; ------------------------------------------------------------------------------