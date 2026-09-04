; ------------------------------------------------------------------------------

InitVdp:
	lea	VDP_CTRL,a0
	lea	VDP_DATA,a1
	lea	VdpRegisterInitTable,a2
	moveq	#$12,d7

VdpRegisterInitLoop:
	move.w	(a2)+,(a0)
	dbf	d7,VdpRegisterInitLoop
	move.w	VdpRegisterInitTable+2,d0
	move.w	d0,display_vdp_reg
	move.w	#$8ADF,hblank_vdp_reg
	moveq	#0,d0
	move.l	#$C0000000,VDP_CTRL
	move.w	#$3F,d7

VdpClearVramLoop:
	move.w	d0,(a1)
	dbf	d7,VdpClearVramLoop
	clr.l	scroll_y
	clr.l	scroll_x
	move.l	d1,-(sp)
	lea	VDP_CTRL,a5
	move.w	#$8F01,(a5)
	move.l	#$94FF93FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$40000080,(a5)
	move.w	#0,VDP_DATA

VdpWaitDma:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	VdpWaitDma
	move.w	#$8F02,(a5)
	move.l	(sp)+,d1
	rts

; ------------------------------------------------------------------------------

; VDP register defaults written in R0-R18 order during startup.
VdpRegisterInitTable:
	dc.w	$8004
	dc.w	$8134
	dc.w	$8230
	dc.w	$8328
	dc.w	$8407
	dc.w	$857C
	dc.w	$8600
	dc.w	$8700
	dc.w	$8800
	dc.w	$8900
	dc.w	$8A00
	dc.w	$8B00
	dc.w	$8C81
	dc.w	$8D3F
	dc.w	$8E00
	dc.w	$8F02
	dc.w	$9001
	dc.w	$9100
	dc.w	$9200

; ------------------------------------------------------------------------------

ClearScreen:
	lea	VDP_CTRL,a5
	move.w	#$8F01,(a5)
	move.l	#$940F93FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$40000083,(a5)
	move.w	#0,VDP_DATA

VdpWaitPlaneAClear:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	VdpWaitPlaneAClear
	move.w	#$8F02,(a5)
	lea	VDP_CTRL,a5
	move.w	#$8F01,(a5)
	move.l	#$940F93FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$60000083,(a5)
	move.w	#0,VDP_DATA

VdpWaitPlaneBClear:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	VdpWaitPlaneBClear
	move.w	#$8F02,(a5)
	clr.l	scroll_y
	clr.l	scroll_x
	lea	sprites,a1
	moveq	#0,d0
	move.w	#$A0,d1

VdpClearSpriteTableLoop:
	move.l	d0,(a1)+
	dbf	d1,VdpClearSpriteTableLoop
	lea	scroll_lines,a1
	moveq	#0,d0
	move.w	#$100,d1

VdpClearScrollTableLoop:
	move.l	d0,(a1)+
	dbf	d1,VdpClearScrollTableLoop
	rts

; ------------------------------------------------------------------------------
