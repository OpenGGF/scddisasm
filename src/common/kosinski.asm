; ------------------------------------------------------------------------------

DecompKosinski:
	subq.l	#2,sp
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

loc_202836:
	lsr.w	#1,d5
	move	sr,d6
	dbf	d4,loc_202848
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

loc_202848:
	move	d6,ccr
	bcc.s	loc_202850
	move.b	(a0)+,(a1)+
	bra.s	loc_202836

; ------------------------------------------------------------------------------

loc_202850:
	moveq	#0,d3
	lsr.w	#1,d5
	move	sr,d6
	dbf	d4,loc_202864
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

loc_202864:
	move	d6,ccr
	bcs.s	loc_202894
	lsr.w	#1,d5
	dbf	d4,loc_202878
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

loc_202878:
	roxl.w	#1,d3
	lsr.w	#1,d5
	dbf	d4,loc_20288A
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

loc_20288A:
	roxl.w	#1,d3
	addq.w	#1,d3
	moveq	#$FFFFFFFF,d2
	move.b	(a0)+,d2
	bra.s	loc_2028AA

; ------------------------------------------------------------------------------

loc_202894:
	move.b	(a0)+,d0
	move.b	(a0)+,d1
	moveq	#$FFFFFFFF,d2
	move.b	d1,d2
	lsl.w	#5,d2
	move.b	d0,d2
	andi.w	#7,d1
	beq.s	loc_2028B6
	move.b	d1,d3
	addq.w	#1,d3

loc_2028AA:
	move.b	(a1,d2.w),d0
	move.b	d0,(a1)+
	dbf	d3,loc_2028AA
	bra.s	loc_202836

; ------------------------------------------------------------------------------

loc_2028B6:
	move.b	(a0)+,d1
	beq.s	loc_2028C6
	cmpi.b	#1,d1
	beq.w	loc_202836
	move.b	d1,d3
	bra.s	loc_2028AA

; ------------------------------------------------------------------------------

loc_2028C6:
	addq.l	#2,sp
	rts

; ------------------------------------------------------------------------------