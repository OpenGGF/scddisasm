; ------------------------------------------------------------------------------

Random:
	move.l	d1,-(sp)
	move.l	random_seed,d1
	bne.s	loc_20213A
	move.l	#$2A6D365A,d1

loc_20213A:
	move.l	d1,d0
	asl.l	#2,d1
	add.l	d0,d1
	asl.l	#3,d1
	add.l	d0,d1
	move.w	d1,d0
	swap	d1
	add.w	d1,d0
	move.w	d0,d1
	swap	d1
	move.l	d1,random_seed
	move.l	(sp)+,d1
	rts

; ------------------------------------------------------------------------------
