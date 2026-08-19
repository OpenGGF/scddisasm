; ------------------------------------------------------------------------------

LoadStageData:
	moveq	#0,d0
	lea	StageDataIndex,a2
	move.l	a2,-(sp)
	addq.l	#4,a2
	move.l	(a2)+,d1
	andi.l	#$3FFFFF,d1
	movea.l	d1,a0
	lea	stage_blocks,a4
	bsr.w	DecompNemesis
	movea.l	(a2)+,a0
	bsr.w	LoadStageMap
	move.w	(a2)+,d0
	move.w	(a2),d0
	andi.w	#$FF,d0
	bsr.w	LoadFadePalette
	movea.l	(sp)+,a2
	addq.w	#4,a2
	tst.b	spawn_mode
	beq.s	loc_20336A
	jmp	InitSectionGfx

; ------------------------------------------------------------------------------

loc_20336A:
	btst	#1,stage_start_flags
	beq.s	locret_20337E
	moveq	#0,d0
	move.b	(a2),d0
	beq.s	locret_20337E
	bsr.w	AddGfxQueue

locret_20337E:
	rts
	
; ------------------------------------------------------------------------------

LoadStageMap:
	lea	stage_map,a3
	move.w	#$1FF,d1
	moveq	#0,d0

loc_20338A:
	move.l	d0,(a3)+
	dbf	d1,loc_20338A
	lea	stage_map,a3
	moveq	#0,d1
	bsr.w	sub_2033A0
	lea	stage_map+$40,a3
	moveq	#2,d1

; ------------------------------------------------------------------------------

sub_2033A0:
	moveq	#0,d0
	add.w	d1,d0
	lea	StageMaps,a1
	move.w	(a1,d0.w),d0
	lea	(a1,d0.w),a1
	moveq	#0,d1
	move.w	d1,d2
	move.b	(a1)+,d1
	move.b	(a1)+,d2

loc_2033BA:
	move.w	d1,d0
	movea.l	a3,a0

loc_2033BE:
	move.b	(a1)+,(a0)+
	dbf	d0,loc_2033BE
	lea	$80(a3),a3
	dbf	d2,loc_2033BA
	rts

; ------------------------------------------------------------------------------
