; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos fire shooter object
;
; Subtype 0 is the emitter, subtype 1 is its rising/lowering flame, and subtype
; 2 is either horizontal projectile. The flame uses a five-state routine table;
; projectiles accelerate for $40 pixels, then play a timed burnout animation.
;
; CC_LEGACY_FIRE_SHOOTER_ABI preserves R31A's custom despawn paths, helper
; addressing, setup/return joins, and byte/word instruction choices.
; -------------------------------------------------------------------------

oFireShooterBaseX	EQU	oVar36
oFireShooterBaseY	EQU	oVar32

; -------------------------------------------------------------------------

ObjFireShooter:
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI=0
	moveq	#0,d0
		endif
	else
	moveq	#0,d0
	endif
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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	andi.w	#$FF80,d0
	move.w	cameraX.w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	.Despawn
	rts

.Despawn:
	bra.w	DespawnObjectR3
		else
	jmp	CheckObjDespawn2
		endif
	else
	jmp	CheckObjDespawn2
	endif
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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	beq.s	.SpawnChild
	rts

.SpawnChild:
		else
	bne.s	.End
		endif
	else
	bne.s	.End
	endif
	move.b	#$27,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),d0
	addq.w	#8,d0
	move.w	d0,oY(a1)
	move.b	#1,oSubtype(a1)
	addq.b	#2,oRoutine(a0)
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI=0

.End:
	rts
		endif
	else

.End:
	rts
	endif

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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	andi.w	#$FF80,d0
	move.w	cameraX.w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	.Despawn
	rts

.Despawn:
	bra.w	DespawnObjectR3
		else
	jmp	CheckObjDespawn2
		endif
	else
	jmp	CheckObjDespawn2
	endif
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

	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI=0
ObjFireShooter_Flame_SolidAt:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	SolidObject
		endif
	else
ObjFireShooter_Flame_SolidAt:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	SolidObject
	endif

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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	rts
		endif
	endif

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Main:
	tst.b	oVar3A(a0)
	bne.s	.Active
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	bsr.w	sub_20CF36
		else
	bsr.w	ObjFireShooter_GetPlayer
		endif
	else
	bsr.w	ObjFireShooter_GetPlayer
	endif
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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	move.w	#0,oVar3A(a0)
		else
	move.b	#0,oVar3A(a0)
		endif
	else
	move.b	#0,oVar3A(a0)
	endif
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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	move.b	oVar3B(a0),d0
	ext.w	d0
		else
	moveq	#0,d0
	move.b	oVar3B(a0),d0
		endif
	else
	moveq	#0,d0
	move.b	oVar3B(a0),d0
	endif
	neg.w	d0
	add.w	oFireShooterBaseY(a0),d0
	move.w	d0,oY(a0)
	cmpi.b	#$20,oVar3B(a0)
	beq.s	.AtTop
	bra.w	ObjFireShooter_Flame_Solid

.AtTop:
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	jsr	ObjFireShooter_Flame_SpawnProjectiles(pc)
	lea	objPlayerSlot.w,a1
	bsr.s	ObjFireShooter_Flame_SolidAt
		else
	jsr	ObjFireShooter_Flame_SpawnProjectiles
	jsr	ObjFireShooter_Flame_SolidAt
		endif
	else
	jsr	ObjFireShooter_Flame_SpawnProjectiles
	jsr	ObjFireShooter_Flame_SolidAt
	endif
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

	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0

ObjFireShooter_Flame_SolidAt:
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	SolidObject
		endif
	endif

; -------------------------------------------------------------------------

ObjFireShooter_Flame_Lower:
	tst.b	oVar3A(a0)
	beq.s	.Lower
	subq.b	#1,oVar3A(a0)
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	bra.s	.Solid
		else
	bra.w	ObjFireShooter_Flame_Solid
		endif
	else
	bra.w	ObjFireShooter_Flame_Solid
	endif

.Lower:
	subq.b	#4,oVar3B(a0)
	bcc.s	.ApplyHeight
	move.b	#0,oVar3B(a0)

.ApplyHeight:
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	move.b	oVar3B(a0),d0
	ext.w	d0
		else
	moveq	#0,d0
	move.b	oVar3B(a0),d0
		endif
	else
	moveq	#0,d0
	move.b	oVar3B(a0),d0
	endif
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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	addq.b	#8,d0
		else
	addq.w	#8,d0
		endif
	else
	addq.w	#8,d0
	endif
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
	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI<>0
	beq.s	.Delete
	rts

.Delete:
	jmp	DeleteObject
		else
	bne.s	.End
	jmp	DeleteObject

.End:
	rts
		endif
	else
	bne.s	.End
	jmp	DeleteObject

.End:
	rts
	endif

; -------------------------------------------------------------------------

	if def(CC_LEGACY_FIRE_SHOOTER_ABI)
		if CC_LEGACY_FIRE_SHOOTER_ABI=0
ObjFireShooter_GetPlayer:
	lea	objPlayerSlot.w,a1
	rts
		endif
	else
ObjFireShooter_GetPlayer:
	lea	objPlayerSlot.w,a1
	rts
	endif

; -------------------------------------------------------------------------

Ani_FireShoot:
	include	"anims/r3/fire_shoot.asm"
	even

MapSpr_FireShoot:
	include	"sprites/r3/fire_shoot.asm"
	even

	if def(R3_SEMANTIC_FIRE_SHOOTER)
		if R3_SEMANTIC_FIRE_SHOOTER<>0
FireShooterObject EQU	ObjFireShooter
FireShootAnims	EQU	Ani_FireShoot
FireShootSprites EQU	MapSpr_FireShoot
		endif
	endif

; -------------------------------------------------------------------------
