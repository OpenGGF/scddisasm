; ------------------------------------------------------------------------------

ElectricBeamsObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	ElectricBeamsRoutineTable(pc,d0.w),d0
	jsr	ElectricBeamsRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Electric Beams object routine pointers.
ElectricBeamsRoutineTable:
	dc.w	ElectricBeamsObject_0_Routine0-*
	dc.w	ElectricBeamsObject_0_Routine2-ElectricBeamsRoutineTable
	dc.w	ElectricBeamsObject_0_Routine4-ElectricBeamsRoutineTable

; ------------------------------------------------------------------------------

ElectricBeamsObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$6358,obj.sprite_tile(a0)
	move.l	#ElectricBeamsSprites,obj.sprite_data(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	bsr.w	ElectricBeamsFindOrSpawnCompanion

ElectricBeamsObject_0_Routine2:
	tst.b	obj.subtype(a0)
	beq.s	ElectricBeamsIdleReturn
	bsr.w	ElectricBeamsSyncToPlayer
	tst.w	obj.var_3a(a0)
	bne.s	ElectricBeamsActivationCountdown
	bsr.w	ElectricBeamsLoadZonePalette
	cmpi.b	#2,time_zone
	bne.s	ElectricBeamsCheckActivationZone
	tst.b	good_future
	bne.s	ElectricBeamsIdleReturn

ElectricBeamsCheckActivationZone:
	tst.b	act
	bne.s	ElectricBeamsSelectActivationDelay
	move.w	scroll_fg_y,d0
	cmpi.w	#$400,d0
	bcc.s	ElectricBeamsIdleReturn

ElectricBeamsSelectActivationDelay:
	move.w	#$168,d0
	move.b	time_zone,d1
	beq.s	ElectricBeamsStoreActivationDelay
	move.w	#$1E0,d0
	subq.b	#1,d1
	beq.s	ElectricBeamsStoreActivationDelay
	move.w	#$F0,d0

ElectricBeamsStoreActivationDelay:
	move.w	d0,obj.var_3a(a0)

ElectricBeamsIdleReturn:
	rts

; ------------------------------------------------------------------------------

ElectricBeamsActivationCountdown:
	subq.w	#1,obj.var_3a(a0)
	bne.s	ElectricBeamsIdleReturn
	addq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_3a(a0)
	move.w	#$5A,obj.var_30(a0)
	clr.b	obj.var_2e(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	ElectricBeamsObject_0_Routine4
	move.w	#$B2,d0
	jsr	PlayFmSound

ElectricBeamsObject_0_Routine4:
	bsr.w	ElectricBeamsSyncToPlayer
	tst.w	obj.var_30(a0)
	beq.s	ElectricBeamsAnimateMode
	move.b	obj.var_3c(a0),d0
	bsr.w	ElectricBeamsToggleFlashPalette
	subq.w	#1,obj.var_30(a0)
	beq.s	ElectricBeamsFinishFlash
	rts

; ------------------------------------------------------------------------------

ElectricBeamsFinishFlash:
	bsr.w	ElectricBeamsLoadZonePalette

ElectricBeamsAnimateMode:
	move.b	obj.var_3c(a0),d0
	addq.b	#1,d0
	move.b	d0,r6_beam_mode
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	bsr.w	ElectricBeamsAnimatePalette
	subq.w	#1,obj.var_3a(a0)
	bne.s	ElectricBeamsActiveReturn
	subq.b	#2,obj.routine(a0)
	clr.b	r6_beam_mode
	addq.b	#1,obj.var_3c(a0)
	cmpi.b	#3,obj.var_3c(a0)
	bcs.s	ElectricBeamsActiveReturn
	clr.b	obj.var_3c(a0)
	clr.w	obj.var_3e(a0)

ElectricBeamsActiveReturn:
	rts

; ------------------------------------------------------------------------------

ElectricBeamsSyncToPlayer:
	lea	player_object,a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

ElectricBeamsFindOrSpawnCompanion:
	lea	object_spawn_pool,a1
	move.w	#$5F,d0

ElectricBeamsScanObjectPool:
	cmpi.b	#$21,obj.id(a1)
	bne.s	ElectricBeamsSpawnCompanion
	tst.b	obj.subtype(a1)
	bne.s	ElectricBeamsCompanionReturn

ElectricBeamsSpawnCompanion:
	lea	obj.struct_len(a1),a1
	dbf	d0,ElectricBeamsScanObjectPool
	jsr	SpawnObject
	bne.s	ElectricBeamsCompanionReturn
	move.b	#$21,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	lea	player_object,a2
	move.w	obj.x(a2),obj.x(a1)
	move.w	obj.y(a2),obj.y(a1)

ElectricBeamsCompanionReturn:
	rts

; ------------------------------------------------------------------------------

ElectricBeamsLoadZonePalette:
	lea	palette+$40,a3
	move.w	#$626,d0
	move.w	#$646,d2
	move.b	time_zone,d1
	beq.s	ElectricBeamsStoreZonePalette
	lea	palette+$7A,a3
	move.w	#$222,d0
	move.w	#$680,d2
	subq.b	#1,d1
	beq.s	ElectricBeamsStoreZonePalette
	move.w	#$402,d0
	move.w	#$246,d2
	tst.b	good_future
	beq.s	ElectricBeamsStoreZonePalette
	rts

; ------------------------------------------------------------------------------

ElectricBeamsStoreZonePalette:
	lea	palette+$64,a2
	move.w	d0,(a2)+
	move.w	d0,(a2)+
	move.w	d0,(a2)+
	move.w	d2,(a3)+
	rts

; ------------------------------------------------------------------------------

; Palette slot offsets selected by beam mode.
ElectricBeamsPaletteSlotOffsets:
	dc.b	0
	dc.b	2
	dc.b	4
	dc.b	0

; ------------------------------------------------------------------------------

ElectricBeamsAnimatePalette:
	move.b	ElectricBeamsPaletteSlotOffsets(pc,d0.w),d0
	lea	palette+$64,a2
	lea	(a2,d0.w),a2
	lea	ElectricBeamsMainPaletteCycleDefault,a1
	move.b	time_zone,d1
	beq.s	ElectricBeamsAnimateMainPalette
	lea	ElectricBeamsMainPaletteCycleZone1,a1
	subq.b	#1,d1
	beq.s	ElectricBeamsAnimateMainPalette
	lea	ElectricBeamsMainPaletteCycleZone2,a1

ElectricBeamsAnimateMainPalette:
	moveq	#0,d1
	move.b	obj.var_3e(a0),d1
	add.b	d1,d1
	lea	(a1,d1.w),a1
	move.w	(a1)+,(a2)+
	addq.b	#1,obj.var_3e(a0)
	move.w	(a1),d1
	cmpi.w	#$FFFF,d1
	bne.s	ElectricBeamsAnimateSecondaryPalette
	clr.b	obj.var_3e(a0)

ElectricBeamsAnimateSecondaryPalette:
	lea	palette+$40,a2
	lea	ElectricBeamsSecondaryPaletteCycleDefault,a1
	move.b	time_zone,d1
	beq.s	ElectricBeamsAnimateSecondaryPaletteCycle
	lea	palette+$7A,a2
	lea	ElectricBeamsSecondaryPaletteCycleZone1,a1
	subq.b	#1,d1
	beq.s	ElectricBeamsAnimateSecondaryPaletteCycle
	lea	ElectricBeamsSecondaryPaletteCycleZone2,a1

ElectricBeamsAnimateSecondaryPaletteCycle:
	moveq	#0,d1
	move.b	obj.var_3f(a0),d1
	add.b	d1,d1
	lea	(a1,d1.w),a1
	move.w	(a1)+,(a2)+
	addq.b	#1,obj.var_3f(a0)
	move.w	(a1),d1
	cmpi.w	#$FFFF,d1
	bne.s	ElectricBeamsAnimatePaletteReturn
	clr.b	obj.var_3f(a0)

ElectricBeamsAnimatePaletteReturn:
	rts

; ------------------------------------------------------------------------------

; Zone-one main beam palette cycle.
ElectricBeamsMainPaletteCycleZone1:
	dc.w	0
	dc.w	$EE0
	dc.w	0
	dc.w	$EE
	dc.w	0
	dc.w	$E0E
	dc.w	0
	dc.w	$FFFF

; Zone-one secondary beam palette cycle.
ElectricBeamsSecondaryPaletteCycleZone1:
	dc.w	$A60
	dc.w	$AA0
	dc.w	$A60
	dc.w	$AA0
	dc.w	$FFFF

; Default-zone main beam palette cycle.
ElectricBeamsMainPaletteCycleDefault:
	dc.w	0
	dc.w	$EE0
	dc.w	0
	dc.w	$EE
	dc.w	0
	dc.w	$E0E
	dc.w	0
	dc.w	$FFFF

; Default-zone secondary beam palette cycle.
ElectricBeamsSecondaryPaletteCycleDefault:
	dc.w	$846
	dc.w	$84A
	dc.w	$846
	dc.w	$84A
	dc.w	$FFFF

; Zone-two main beam palette cycle.
ElectricBeamsMainPaletteCycleZone2:
	dc.w	0
	dc.w	$EE0
	dc.w	0
	dc.w	$EE
	dc.w	0
	dc.w	$E0E
	dc.w	0
	dc.w	$FFFF

; Zone-two secondary beam palette cycle.
ElectricBeamsSecondaryPaletteCycleZone2:
	dc.w	$244
	dc.w	$248
	dc.w	$244
	dc.w	$248
	dc.w	$FFFF

; ------------------------------------------------------------------------------

ElectricBeamsToggleFlashPalette:
	move.b	ElectricBeamsFlashPaletteSlotOffsets(pc,d0.w),d0
	lea	palette+$64,a2
	lea	(a2,d0.w),a2
	move.w	#$80,d0
	tst.b	obj.var_2e(a0)
	beq.s	ElectricBeamsFlashPaletteNormal
	moveq	#0,d0

ElectricBeamsFlashPaletteNormal:
	move.w	d0,(a2)
	eori.b	#1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

; Palette slot offsets for the beam flash toggle.
ElectricBeamsFlashPaletteSlotOffsets:
	dc.b	0
	dc.b	2
	dc.b	4
	dc.b	0

ElectricBeamsSprites:
	include	"sprites/r6/electric_beams.asm"
	even

; ------------------------------------------------------------------------------
