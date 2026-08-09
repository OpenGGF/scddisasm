; ------------------------------------------------------------------------------

LauncherObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208E6C(pc,d0.w),d0
	jsr	off_208E6C(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_208E6C:
	dc.w	LauncherObject_0_Routine0-*
	dc.w	LauncherObject_0_Routine2-off_208E6C
	dc.w	LauncherObject_0_Routine4-off_208E6C
	dc.w	LauncherObject_0_Routine6-off_208E6C
	dc.w	LauncherObject_0_Routine8-off_208E6C

; ------------------------------------------------------------------------------

LauncherObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$400,obj.sprite_tile(a0)
	move.l	#LaunchSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_2e(a0)
	move.b	#$1C,obj.width(a0)
	move.b	#$1C,obj.width_2(a0)
	move.b	#4,obj.height(a0)
	addq.b	#2,obj.routine(a0)
	jsr	SpawnObjectAfter
	move.b	#4,obj.id(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	#$400,obj.sprite_tile(a1)
	move.l	#LaunchSprites,obj.sprite_data(a1)
	move.b	#4,obj.width(a1)
	move.b	#$C,obj.height(a1)
	move.b	#1,obj.sprite_frame(a1)
	move.l	a0,obj.var_2a(a1)
	move.b	#8,obj.routine(a1)

LauncherObject_0_Routine2:
	lea	(player_object).w,a1
	jsr	TopSolidObject
	beq.s	locret_208F10
	bset	#0,obj.var_2c(a1)
	move.w	obj.x(a0),obj.x(a1)
	bclr	#0,obj.flags(a1)
	move.b	#$3A,obj.anim_id(a1)
	addq.b	#2,obj.routine(a0)
	move.w	#$C00,obj.x_speed(a0)

locret_208F10:
	rts

; ------------------------------------------------------------------------------

LauncherObject_0_Routine4:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	move.l	obj.x(a0),d1
	add.l	d0,d1
	move.l	d1,obj.x(a0)
	lea	(player_object).w,a1
	jsr	TopSolidObject
	move.w	(p1_joy_hold).w,d0
	andi.b	#$70,d0
	beq.s	loc_208F76
	bclr	#0,obj.var_2c(a1)
	move.w	#$F980,obj.y_speed(a1)
	move.w	obj.x_speed(a0),obj.x_speed(a1)
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)
	bset	#2,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)
	move.w	#$92,d0
	jsr	PlayFmSound

loc_208F76:
	move.w	obj.var_2e(a0),d0
	addi.w	#$390,d0
	cmp.w	obj.x(a0),d0
	bcc.s	locret_208FB2
	move.w	d0,obj.x(a0)
	addq.b	#2,obj.routine(a0)
	btst	#3,obj.flags(a0)
	beq.s	locret_208FB2
	bclr	#0,obj.var_2c(a1)
	move.w	obj.x_speed(a0),obj.x_speed(a1)
	move.b	#0,obj.anim_id(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)

locret_208FB2:
	rts

; ------------------------------------------------------------------------------

LauncherObject_0_Routine6:
	subq.w	#4,obj.x(a0)
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.x(a0),d0
	bcs.s	locret_208FCE
	move.w	obj.var_2e(a0),obj.x(a0)
	move.b	#2,obj.routine(a0)

locret_208FCE:
	rts

; ------------------------------------------------------------------------------

LauncherObject_0_Routine8:
	movea.l	obj.var_2a(a0),a1
	cmpi.b	#4,obj.routine(a1)
	bcc.s	locret_208FFE
	move.w	obj.x(a1),obj.x(a0)
	subi.w	#$18,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$10,obj.y(a0)
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

locret_208FFE:
	rts

; ------------------------------------------------------------------------------

LaunchSprites:
	include	"src/sprites/r6/launch.asm"
	even

; ------------------------------------------------------------------------------