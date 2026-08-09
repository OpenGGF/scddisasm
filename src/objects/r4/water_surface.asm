; ------------------------------------------------------------------------------

WaterSurfaceObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_206904(pc,d0.w),d0
	jsr	off_206904(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_206904:
	dc.w	WaterSurfaceObject_0_Routine0-*
	dc.w	WaterSurfaceObject_0_Routine2-off_206904

; ------------------------------------------------------------------------------

WaterSurfaceObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$8280,obj.sprite_tile(a0)
	move.l	#WaterSurfaceSprites,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)

WaterSurfaceObject_0_Routine2:
	move.w	(scroll_fg_x).w,d0
	addi.w	#$A0,d0
	moveq	#0,d1
	move.b	obj.var_2a(a0),d1
	addq.b	#1,d1
	cmpi.b	#2,d1
	bcs.s	loc_206938
	moveq	#0,d1

loc_206938:
	move.b	d1,obj.var_2a(a0)
	move.b	byte_20695E(pc,d1.w),d1
	ext.w	d1
	add.w	d1,d0
	move.w	d0,obj.x(a0)
	move.w	(water_y).w,obj.y(a0)
	addq.w	#2,obj.y(a0)
	lea	(WaterSurfaceAnims).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

byte_20695E:
	dc.b	$A0
	dc.b	$60

WaterSurfaceAnims:
	include	"src/anims/r4/water_surface.asm"
	even

WaterSurfaceSprites:
	include	"src/sprites/r4/water_surface.asm"
	even

; ------------------------------------------------------------------------------