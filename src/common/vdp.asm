; ------------------------------------------------------------------------------

InitVdp:
	lea	(VDP_CTRL).l,a0
	lea	(VDP_DATA).l,a1
	lea	(word_20222A).l,a2
	moveq	#$12,d7

loc_2021C2:
	move.w	(a2)+,(a0)
	dbf	d7,loc_2021C2
	move.w	(word_20222A+2).l,d0
	move.w	d0,(display_vdp_reg).w
	move.w	#$8ADF,(hblank_vdp_reg).w
	moveq	#0,d0
	move.l	#$C0000000,(VDP_CTRL).l
	move.w	#$3F,d7

loc_2021E8:
	move.w	d0,(a1)
	dbf	d7,loc_2021E8
	clr.l	(scroll_y).w
	clr.l	(scroll_x).w
	move.l	d1,-(sp)
	lea	(VDP_CTRL).l,a5
	move.w	#$8F01,(a5)
	move.l	#$94FF93FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$40000080,(a5)
	move.w	#0,(VDP_DATA).l

loc_20221A:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	loc_20221A
	move.w	#$8F02,(a5)
	move.l	(sp)+,d1
	rts

; ------------------------------------------------------------------------------

word_20222A:
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
	lea	(VDP_CTRL).l,a5
	move.w	#$8F01,(a5)
	move.l	#$940F93FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$40000083,(a5)
	move.w	#0,(VDP_DATA).l

loc_202272:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	loc_202272
	move.w	#$8F02,(a5)
	lea	(VDP_CTRL).l,a5
	move.w	#$8F01,(a5)
	move.l	#$940F93FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$60000083,(a5)
	move.w	#0,(VDP_DATA).l

loc_2022A0:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	loc_2022A0
	move.w	#$8F02,(a5)
	clr.l	(scroll_y).w
	clr.l	(scroll_x).w
	lea	(sprites).w,a1
	moveq	#0,d0
	move.w	#$A0,d1

loc_2022BE:
	move.l	d0,(a1)+
	dbf	d1,loc_2022BE
	lea	(scroll_lines).w,a1
	moveq	#0,d0
	move.w	#$100,d1

loc_2022CE:
	move.l	d0,(a1)+
	dbf	d1,loc_2022CE
	rts

; ------------------------------------------------------------------------------