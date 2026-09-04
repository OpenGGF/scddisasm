; ------------------------------------------------------------------------------

TitleCardObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	TitleCardRoutineTable(pc,d0.w),d0
	jmp	TitleCardRoutineTable(pc,d0.w)

; ------------------------------------------------------------------------------

; Title-card routine pointers.
TitleCardRoutineTable:
	dc.w	TitleCardInit-*
	dc.w	TitleCardSlideInY-TitleCardRoutineTable
	dc.w	TitleCardSlideInX-TitleCardRoutineTable
	dc.w	TitleCardSlideOutY-TitleCardRoutineTable
	dc.w	TitleCardSlideOutX-TitleCardRoutineTable
	dc.w	TitleCardWaitGfx-TitleCardRoutineTable

; ------------------------------------------------------------------------------

TitleCardInit:
	move.b	#2,obj.routine(a0)
	move.w	#$118,obj.x(a0)
	move.w	#$30,obj.x+2(a0)
	move.w	#$30,obj.var_30(a0)
	move.w	#$F0,obj.var_2e(a0)
	move.b	#$5A,obj.anim_timer(a0)
	move.w	#$8360,obj.sprite_tile(a0)
	move.l	#TitleCardSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_layer(a0)
	moveq	#0,d1
	moveq	#7,d6
	lea	TitleCardCharacterData,a2

TitleCardSpawnCharacter:
	jsr	SpawnObject
	move.b	#$3C,obj.id(a1)
	move.b	#4,obj.routine(a1)
	move.w	#$8360,obj.sprite_tile(a1)
	move.l	#TitleCardSprites,obj.sprite_data(a1)
	move.w	d1,d2
	lsl.w	#3,d2
	move.w	(a2,d2.w),obj.x+2(a1)
	move.w	2(a2,d2.w),obj.x(a1)
	move.w	2(a2,d2.w),obj.var_2c(a1)
	move.w	4(a2,d2.w),obj.var_2a(a1)
	move.b	6(a2,d2.w),obj.sprite_frame(a1)
	cmpi.b	#5,d1
	bne.s	TitleCardStoreCharacterFrame
	move.b	act,d3
	add.b	d3,obj.sprite_frame(a1)

TitleCardStoreCharacterFrame:
	move.b	7(a2,d2.w),obj.anim_timer(a1)
	addq.b	#1,d1
	dbf	d6,TitleCardSpawnCharacter
	rts

; ------------------------------------------------------------------------------

TitleCardSlideInY:
	moveq	#8,d0
	move.w	obj.var_2e(a0),d1
	cmp.w	obj.x+2(a0),d1
	beq.s	TitleCardSlideInYComplete
	bge.s	TitleCardSlideInYStep
	neg.w	d0

TitleCardSlideInYStep:
	add.w	d0,obj.x+2(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideInYComplete:
	addq.b	#4,obj.routine(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideInX:
	moveq	#8,d0
	move.w	obj.var_2a(a0),d1
	cmp.w	obj.x(a0),d1
	beq.s	TitleCardSlideInXComplete
	bge.s	TitleCardSlideInXStep
	neg.w	d0

TitleCardSlideInXStep:
	add.w	d0,obj.x(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideInXComplete:
	addq.b	#4,obj.routine(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideOutY:
	tst.b	obj.anim_timer(a0)
	beq.s	TitleCardSlideOutYAfterDelay
	subq.b	#1,obj.anim_timer(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideOutYAfterDelay:
	moveq	#$10,d0
	move.w	obj.var_30(a0),d1
	cmp.w	obj.x+2(a0),d1
	beq.s	TitleCardSlideOutYComplete
	bge.s	TitleCardSlideOutYStep
	neg.w	d0

TitleCardSlideOutYStep:
	add.w	d0,obj.x+2(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideOutYComplete:
	addq.b	#4,obj.routine(a0)
	move.b	#1,scroll_lock
	moveq	#2,d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

TitleCardSlideOutX:
	tst.b	obj.anim_timer(a0)
	beq.s	TitleCardSlideOutXAfterDelay
	subq.b	#1,obj.anim_timer(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideOutXAfterDelay:
	moveq	#$10,d0
	move.w	obj.var_2c(a0),d1
	cmp.w	obj.x(a0),d1
	beq.s	TitleCardSlideOutXComplete
	bge.s	TitleCardSlideOutXStep
	neg.w	d0

TitleCardSlideOutXStep:
	add.w	d0,obj.x(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideOutXComplete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TitleCardWaitGfx:
	tst.l	gfx_queue
	bne.s	TitleCardWaitReturn
	clr.b	scroll_lock
	clr.b	control_locked
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TitleCardWaitReturn:
	rts

; ------------------------------------------------------------------------------
