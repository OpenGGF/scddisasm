; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos fire shooter object
; -------------------------------------------------------------------------

oFireShooterBaseX	EQU	oVar36
oFireShooterBaseY	EQU	oVar32

; -------------------------------------------------------------------------

ObjFireShooter:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	cmpi.b	#1,d0
	beq.w	ObjFireShooter_Flame
	cmpi.b	#2,d0
	beq.w	ObjFireShooter_Projectile

ObjFireShooter_Emitter:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjFireShooter_Emitter_Index(pc,d0.w),d0
	jsr	ObjFireShooter_Emitter_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oFireShooterBaseX(a0),d0
	jmp	CheckObjDespawn2
; End of function ObjFireShooter_Emitter

; -------------------------------------------------------------------------

ObjFireShooter_Emitter_Index:
	dc.w	ObjFireShooter_Emitter_Init-ObjFireShooter_Emitter_Index
	dc.w	ObjFireShooter_Emitter_Main-ObjFireShooter_Emitter_Index

; -------------------------------------------------------------------------

ObjFireShooter_Emitter_Init:
	ori.b	#4,oSprFlags(a0)
	move.w	#$379,oTile(a0)
	move.b	#2,oPriority(a0)
	move.l	#MapSpr_FireShoot,oMap(a0)
	move.w	oX(a0),oFireShooterBaseX(a0)
	move.w	oY(a0),oFireShooterBaseY(a0)
	move.b	#$10,oWidth(a0)
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$27,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),d0
	addq.w	#8,d0
	move.w	d0,oY(a1)
	move.b	#1,oSubtype(a1)
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjFireShooter_Emitter_Main:
	rts

; -------------------------------------------------------------------------

ObjFireShooter_Flame:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjFireShooter_Flame_Index(pc,d0.w),d0
	jsr	ObjFireShooter_Flame_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oFireShooterBaseX(a0),d0
	jmp	CheckObjDespawn2
; End of function ObjFireShooter_Flame

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Index:
	dc.w	ObjFireShooter_Flame_Init-ObjFireShooter_Flame_Index
	dc.w	ObjFireShooter_Flame_Main-ObjFireShooter_Flame_Index
	dc.w	ObjFireShooter_Flame_Raise-ObjFireShooter_Flame_Index
	dc.w	ObjFireShooter_Flame_Lower-ObjFireShooter_Flame_Index
	dc.w	ObjFireShooter_Flame_Wait-ObjFireShooter_Flame_Index

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Solid:
	lea	objPlayerSlot.w,a1
	jmp	SolidObject

; -------------------------------------------------------------------------

ObjFireShooter_Flame_SolidAt:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	SolidObject

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Init:
	ori.b	#4,oSprFlags(a0)
	move.w	#$379,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_FireShoot,oMap(a0)
	move.b	#$10,oWidth(a0)
	move.b	#$14,oYRadius(a0)
	move.w	oX(a0),oFireShooterBaseX(a0)
	move.w	oY(a0),oFireShooterBaseY(a0)
	move.b	#1,oMapFrame(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Main:
	tst.b	oVar3A(a0)
	bne.s	.Active
	bsr.w	ObjFireShooter_GetPlayer
	move.w	oX(a0),d0
	sub.w	oX(a1),d0
	bcc.s	.CheckRange
	neg.w	d0

.CheckRange:
	cmpi.w	#$78,d0
	bcs.s	.SetTimer
	bra.w	ObjFireShooter_Flame_Solid

.SetTimer:
	move.b	#$3C,oVar3A(a0)

.Active:
	subq.b	#1,oVar3A(a0)
	beq.s	.Raise
	tst.b	timeZone
	beq.s	.Solid
	cmpi.b	#1,timeZone
	beq.s	.Animate
	tst.b	goodFuture
	bne.s	.Solid

.Animate:
	lea	Ani_FireShoot(pc),a1
	jsr	AnimateObject

.Solid:
	bra.w	ObjFireShooter_Flame_Solid

.Raise:
	move.b	#0,oVar3A(a0)
	move.b	#1,oMapFrame(a0)
	addq.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Raise:
	addq.b	#8,oVar3B(a0)
	cmpi.b	#$20,oVar3B(a0)
	bcs.s	.ApplyHeight
	move.b	#$20,oVar3B(a0)

.ApplyHeight:
	moveq	#0,d0
	move.b	oVar3B(a0),d0
	neg.w	d0
	add.w	oFireShooterBaseY(a0),d0
	move.w	d0,oY(a0)
	cmpi.b	#$20,oVar3B(a0)
	beq.s	.AtTop
	bra.w	ObjFireShooter_Flame_Solid

.AtTop:
	jsr	ObjFireShooter_Flame_SpawnProjectiles
	jsr	ObjFireShooter_Flame_SolidAt
	bne.s	.HitPlayer
	move.b	#8,oVar3A(a0)
	addq.b	#2,oRoutine(a0)
	rts

.HitPlayer:
	move.w	#-$700,oYVel(a1)
	bset	#1,oFlags(a1)
	bclr	#3,oFlags(a1)
	move.b	#$10,oAnim(a1)
	bclr	#3,oFlags(a0)
	rts

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Lower:
	tst.b	oVar3A(a0)
	beq.s	.Lower
	subq.b	#1,oVar3A(a0)
	bra.w	ObjFireShooter_Flame_Solid

.Lower:
	subq.b	#4,oVar3B(a0)
	bcc.s	.ApplyHeight
	move.b	#0,oVar3B(a0)

.ApplyHeight:
	moveq	#0,d0
	move.b	oVar3B(a0),d0
	neg.w	d0
	add.w	oFireShooterBaseY(a0),d0
	move.w	d0,oY(a0)
	cmpi.b	#0,oVar3B(a0)
	beq.s	.SetTimer
	bra.s	.Solid

.SetTimer:
	move.b	#$3C,oVar3A(a0)
	addq.b	#2,oRoutine(a0)

.Solid:
	bra.w	ObjFireShooter_Flame_Solid

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Wait:
	tst.b	oVar3A(a0)
	beq.s	.Done
	subq.b	#1,oVar3A(a0)
	bra.w	ObjFireShooter_Flame_Solid

.Done:
	move.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjFireShooter_Flame_SpawnProjectiles:
	tst.b	timeZone
	beq.s	.End
	cmpi.b	#1,timeZone
	beq.s	.Spawn
	tst.b	goodFuture
	bne.s	.End

.Spawn:
	jsr	FindObjSlot
	bne.s	.SpawnSecond
	bsr.s	.InitProjectile
	move.w	oX(a0),d0
	subi.w	#$18,d0
	move.w	d0,oX(a1)

.SpawnSecond:
	jsr	FindObjSlot
	bne.s	.End
	bsr.s	.InitProjectile
	move.w	oX(a0),d0
	addi.w	#$18,d0
	move.w	d0,oX(a1)
	move.b	#1,oVar3A(a1)

.End:
	rts

.InitProjectile:
	move.b	#$27,oID(a1)
	move.b	#2,oSubtype(a1)
	move.w	oY(a0),d0
	addq.w	#8,d0
	move.w	d0,oY(a1)
	rts

; -------------------------------------------------------------------------

ObjFireShooter_Projectile:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjFireShooter_Projectile_Index(pc,d0.w),d0
	jsr	ObjFireShooter_Projectile_Index(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjDespawn
; End of function ObjFireShooter_Projectile

; -------------------------------------------------------------------------

ObjFireShooter_Projectile_Index:
	dc.w	ObjFireShooter_Projectile_Init-ObjFireShooter_Projectile_Index
	dc.w	ObjFireShooter_Projectile_Main-ObjFireShooter_Projectile_Index

; -------------------------------------------------------------------------

ObjFireShooter_Projectile_Init:
	ori.b	#4,oSprFlags(a0)
	move.w	#$379,oTile(a0)
	move.b	#4,oPriority(a0)
	move.b	#$98,oColType(a0)
	move.l	#MapSpr_FireShoot,oMap(a0)
	move.w	oX(a0),oFireShooterBaseX(a0)
	move.w	#$100,d0
	move.w	#$10,d1
	move.w	#2,d2
	move.w	oVar3A(a0),d3
	bne.s	.SetVelocity
	neg.w	d0
	neg.w	d1
	move.w	#1,d2

.SetVelocity:
	move.w	d0,oXVel(a0)
	move.w	d1,oVar3E(a0)
	move.b	d2,oAnim(a0)
	addq.b	#2,oRoutine(a0)
	lea	Ani_FireShoot(pc),a1
	jsr	AnimateObject

; -------------------------------------------------------------------------

ObjFireShooter_Projectile_Main:
	move.w	oVar3E(a0),d0
	add.w	d0,oXVel(a0)
	move.w	oXVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	lea	Ani_FireShoot(pc),a1
	jsr	AnimateObject
	move.w	oX(a0),d0
	sub.w	oFireShooterBaseX(a0),d0
	bcc.s	.CheckDistance
	neg.w	d0

.CheckDistance:
	cmpi.w	#$40,d0
	bcc.s	.ReachedEnd
	rts

.ReachedEnd:
	clr.b	oColType(a0)
	tst.b	oVar3B(a0)
	bne.s	.Countdown
	addq.b	#2,oAnim(a0)
	move.b	#$1E,oVar3B(a0)
	rts

.Countdown:
	subq.b	#1,oVar3B(a0)
	bne.s	.End
	jmp	DeleteObject

.End:
	rts

; -------------------------------------------------------------------------

ObjFireShooter_GetPlayer:
	lea	objPlayerSlot.w,a1
	rts

; -------------------------------------------------------------------------

Ani_FireShoot:
	include	"anims/r3/fire_shoot.asm"
	even

MapSpr_FireShoot:
	include	"sprites/r3/fire_shoot.asm"
	even

; -------------------------------------------------------------------------
