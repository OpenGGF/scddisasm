; ------------------------------------------------------------------------------

StageEvents:
	lea	(player_object).w,a6
	bsr.w	sub_203550
	moveq	#4,d1
	move.w	(target_bottom_bound).w,d0
	sub.w	(bottom_bound).w,d0
	beq.s	locret_20352A
	bcc.s	loc_20352C
	neg.w	d1
	move.w	(scroll_fg_y).w,d0
	cmp.w	(target_bottom_bound).w,d0
	bls.s	loc_203520
	move.w	d0,(bottom_bound).w
	andi.w	#$FFFE,(bottom_bound).w

loc_203520:
	add.w	d1,(bottom_bound).w
	move.b	#1,(bottom_bound_shift).w

locret_20352A:
	rts

; ------------------------------------------------------------------------------

loc_20352C:
	move.w	(scroll_fg_y).w,d0
	addq.w	#8,d0
	cmp.w	(bottom_bound).w,d0
	bcs.s	loc_203544
	btst	#1,obj.flags(a6)
	beq.s	loc_203544
	add.w	d1,d1
	add.w	d1,d1

loc_203544:
	add.w	d1,(bottom_bound).w
	move.b	#1,(bottom_bound_shift).w
	rts

; ------------------------------------------------------------------------------

sub_203550:
	moveq	#0,d0
	move.b	(act).l,d0
	add.w	d0,d0
	move.w	off_203562(pc,d0.w),d0
	jmp	off_203562(pc,d0.w)

; ------------------------------------------------------------------------------

off_203562:
	dc.w	sub_203568-*
	dc.w	sub_203568-off_203562
	dc.w	sub_203570-off_203562

; ------------------------------------------------------------------------------

sub_203568:
	move.w	#$710,(target_bottom_bound).w
	rts

; ------------------------------------------------------------------------------

sub_203570:
	tst.b	(boss_flags).w
	bne.s	loc_20357E
	move.w	#$310,(target_bottom_bound).w
	rts

; ------------------------------------------------------------------------------

loc_20357E:
	move.w	#$10C,d0
	move.w	d0,(bottom_bound).w
	move.w	d0,(target_bottom_bound).w
	rts

; ------------------------------------------------------------------------------