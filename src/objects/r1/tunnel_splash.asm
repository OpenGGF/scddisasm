; ------------------------------------------------------------------------------

TunnelSplashObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_205DD0(pc,d0.w),d0
	jmp	off_205DD0(pc,d0.w)

; ------------------------------------------------------------------------------

off_205DD0:
	dc.w	TunnelSplashObject_0_Routine0-off_205DD0
	dc.w	TunnelSplashObject_0_Routine2-off_205DD0
	dc.w	TunnelSplashObject_0_Routine4-off_205DD0

; ------------------------------------------------------------------------------

TunnelSplashObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#TunnelSplashSprites,obj.sprite_data(a0)
	move.w	#$3E4,obj.sprite_tile(a0)
	tst.b	time_zone
	bne.s	loc_205DFC
	move.w	#$39E,obj.sprite_tile(a0)

loc_205DFC:
	move.b	#1,obj.sprite_layer(a0)

TunnelSplashObject_0_Routine2:
	lea	TunnelSplashAnims,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

TunnelSplashObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------
