; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos roll tunnel object
; -------------------------------------------------------------------------

ObjRollTunnel:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjRollTunnel_Index(pc,d0.w),d0
	jsr	ObjRollTunnel_Index(pc,d0.w)
	tst.b	debugCheat
	beq.s	.NoDraw
	jsr	DrawObject

.NoDraw:
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjRollTunnel_Index:
	dc.w	ObjRollTunnel_Init-ObjRollTunnel_Index
	dc.w	ObjRollTunnel_Main-ObjRollTunnel_Index

; -------------------------------------------------------------------------

ObjRollTunnel_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.w	#$544,oTile(a0)
	move.l	#MapSpr_Powerup,oMap(a0)
	move.b	oSubtype(a0),oMapFrame(a0)
	addq.b	#1,oMapFrame(a0)

; -------------------------------------------------------------------------

ObjRollTunnel_Main:
	lea	objPlayerSlot.w,a1
	cmpi.b	#$2B,oAnim(a1)
	beq.w	.End
	cmpi.b	#6,oRoutine(a1)
	bcc.w	.End
	bsr.w	ObjRollTunnel_CheckPlayer
	beq.w	.End
	tst.b	oSubtype(a0)
	bne.s	.Vertical

	move.w	oXVel(a1),d0
	bpl.s	.GetMaxSpeed
	neg.w	d0

.GetMaxSpeed:
	move.w	#$A00,d1
	cmpi.b	#5,zone
	bne.s	.CapSpeed
	move.w	#$D00,d1

.CapSpeed:
	cmp.w	d1,d0
	bcc.s	.SetSpeed
	move.w	d1,d0

.SetSpeed:
	tst.w	oXVel(a1)
	bpl.s	.SetGroundSpeed
	neg.w	d0

.SetGroundSpeed:
	move.w	d0,oXVel(a1)
	move.w	d0,oPlayerGVel(a1)
	move.b	oAngle(a1),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	cmpi.b	#$80,d0
	bne.s	.Activate
	neg.w	oPlayerGVel(a1)
	bra.s	.Activate

; -------------------------------------------------------------------------

.Vertical:
	cmpi.b	#2,oSubtype(a0)
	bcc.s	.Controlled
	move.w	oYVel(a1),d0
	bpl.s	.GetVerticalSpeed
	neg.w	d0

.GetVerticalSpeed:
	cmpi.w	#$D00,d0
	bcc.s	.SetVerticalSpeed
	move.w	#$D00,d0

.SetVerticalSpeed:
	tst.w	oYVel(a1)
	bpl.s	.SetVerticalGroundSpeed
	neg.w	d0

.SetVerticalGroundSpeed:
	move.w	d0,oYVel(a1)
	move.w	d0,oPlayerGVel(a1)
	bset	#1,oFlags(a1)

	.Activate:
		bset	#2,oFlags(a1)
		bne.s	.End
		move.b	#$E,oYRadius(a1)
		if def(CC_LEGACY_ROLL_TUNNEL_ABI)
			if CC_LEGACY_ROLL_TUNNEL_ABI<>0
				move.b	#7,oXRadius(a1)
			else
				if (REGION=USA)|(STAGE_R13)
					move.b	#7,oXRadius(a1)
				else
					move.b	#7,oWidth(a1)
				endif
			endif
		else
			if (REGION=USA)|(STAGE_R13)
				move.b	#7,oXRadius(a1)
			else
				move.b	#7,oWidth(a1)
			endif
		endif
		addq.w	#5,oY(a1)
		move.b	#2,oAnim(a1)

.End:
	rts

; -------------------------------------------------------------------------

.Controlled:
	move.b	p1CtrlHold.w,d1
	cmpi.b	#4,oSubtype(a0)
	beq.s	.Reverse
	cmpi.b	#2,oSubtype(a0)
	bne.s	.CheckDown
	tst.w	oYVel(a1)
	bpl.s	.Activate
	bra.s	.SetControlledSpeed

.CheckDown:
	tst.w	oYVel(a1)
	bmi.s	.Activate

.SetControlledSpeed:
	move.w	#$D00,d0
	btst	#3,d1
	bne.s	.SetControlledXSpeed
	btst	#2,d1
	beq.s	.Activate
	neg.w	d0

.SetControlledXSpeed:
	cmpi.b	#2,oSubtype(a0)
	beq.s	.SetControlledVelocity
	bset	#1,oFlags(a1)

.SetControlledVelocity:
	move.w	d0,oXVel(a1)
	move.w	d0,oPlayerGVel(a1)
	bra.s	.Activate

.Reverse:
	tst.w	oXVel(a1)
	bmi.s	.Activate
	btst	#0,d1
	beq.w	.Activate
	move.w	#-$A00,d0
	bra.w	.SetVerticalGroundSpeed

; -------------------------------------------------------------------------

ObjRollTunnel_CheckPlayer:
	if def(CC_LEGACY_ROLL_TUNNEL_ABI)
		if CC_LEGACY_ROLL_TUNNEL_ABI<>0
			tst.b	debugMode
		else
			if (REGION=USA)|(STAGE_R13)
				tst.b	debugMode
			else
				tst.w	debugMode
			endif
		endif
	else
		if (REGION=USA)|(STAGE_R13)
			tst.b	debugMode
		else
			tst.w	debugMode
		endif
	endif
	bne.s	.NoCollision
	move.w	oX(a1),d0
	sub.w	oX(a0),d0
	addi.w	#$28,d0
	bmi.s	.NoCollision
	cmpi.w	#$50,d0
	bcc.s	.NoCollision
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	addi.w	#$28,d0
	bmi.s	.NoCollision
	cmpi.w	#$50,d0
	bcc.s	.NoCollision
	moveq	#1,d0
	rts

.NoCollision:
	moveq	#0,d0
	rts

; -------------------------------------------------------------------------
