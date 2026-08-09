; ------------------------------------------------------------------------------

PistonObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20CB64
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CA4E(pc,d0.w),d0
	jsr	off_20CA4E(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20CA4E:
	dc.w	PistonObject_0_Routine0-*
	dc.w	PistonObject_0_Routine2-off_20CA4E

; ------------------------------------------------------------------------------

loc_20CA52:
	lea	(player_object).w,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

PistonObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$340,obj.sprite_tile(a0)
	move.l	#PistonSprites,obj.sprite_data(a0)
	move.b	#$28,obj.height(a0)
	move.b	#$20,obj.width_2(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	jsr	SpawnObject
	bne.s	loc_20CA9C
	move.w	#-$20,d0
	bsr.w	sub_20CB2A

loc_20CA9C:
	jsr	SpawnObject
	bne.s	PistonObject_0_Routine2
	move.w	#$20,d0
	bsr.w	sub_20CB2A

PistonObject_0_Routine2:
	jsr	sub_20CAE2(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	tst.b	obj.var_3c(a0)
	beq.s	loc_20CACC
	tst.b	obj.var_3a(a0)
	beq.s	loc_20CADE

loc_20CACC:
	cmpi.b	#$21,obj.var_3b(a0)
	bcs.s	loc_20CADE
	lea	(player_object).w,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

loc_20CADE:
	jmp	loc_20CA52(pc)

; ------------------------------------------------------------------------------

sub_20CAE2:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20CAEE
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20CB28

loc_20CAEE:
	tst.b	obj.var_3c(a0)
	beq.s	loc_20CB0A
	subq.b	#1,obj.var_3b(a0)
	bcc.s	locret_20CB28
	clr.b	obj.var_3b(a0)
	clr.b	obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CB0A:
	addq.b	#8,obj.var_3b(a0)
	cmpi.b	#$50,obj.var_3b(a0)
	bcs.s	locret_20CB28
	move.b	#$50,obj.var_3b(a0)
	move.b	#1,obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)

locret_20CB28:
	rts

; ------------------------------------------------------------------------------

sub_20CB2A:
	move.b	#$20,obj.id(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$FF,obj.subtype(a1)
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.l	#PistonSprites,obj.sprite_data(a1)
	move.b	#$28,obj.height(a1)
	move.b	#1,obj.sprite_frame(a1)
	rts

; ------------------------------------------------------------------------------

loc_20CB64:
	movea.w	obj.var_34(a0),a1
	cmpi.b	#$20,0(a1)
	bne.s	loc_20CB86
	move.w	$C(a1),obj.y(a0)
	lea	(player_object).w,a1
	jsr	SolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20CB86:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PistonSprites:
	include	"src/sprites/r6/piston.asm"
	even

; ------------------------------------------------------------------------------