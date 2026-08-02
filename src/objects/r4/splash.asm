; ------------------------------------------------------------------------------

SplashObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2066EE(pc,d0.w),d0
	jmp	off_2066EE(pc,d0.w)

; ------------------------------------------------------------------------------

off_2066EE:
	dc.w	SplashObject_0_Routine0-*
	dc.w	SplashObject_0_Routine2-off_2066EE
	dc.w	SplashObject_0_Routine4-off_2066EE

; ------------------------------------------------------------------------------

SplashObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#SplashSprites,obj.sprite_data(a0)
	move.w	#$298,obj.sprite_tile(a0)
	move.b	obj.subtype(a0),obj.anim_id(a0)
	moveq	#$D,d0
	move.w	#$A2,d0
	cmpi.b	#2,obj.subtype(a0)
	bcs.s	loc_20672A
	move.w	#$A1,d0

loc_20672A:
	jsr	PlayFmSound

SplashObject_0_Routine2:
	move.w	(water_y).w,obj.y(a0)
	addq.w	#4,obj.y(a0)
	lea	(SplashAnims).l,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

SplashObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------