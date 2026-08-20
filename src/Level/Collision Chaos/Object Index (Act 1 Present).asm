; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present object index
; -------------------------------------------------------------------------

ObjectIndex:
	dc.l	ObjSonic
	dc.l	ObjSonic
	dc.l	ObjPowerup
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjTestBadnik
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjSpring
	dc.l	ObjTunnelDoorSplash
	dc.l	ObjTunnelDoorSplashSet
	dc.l	ObjTunnelDoor
	dc.l	ObjSpinSplash
	dc.l	ObjMovingSpring
	dc.l	ObjRing
	dc.l	ObjLostRing
	dc.l	ObjFloatBlock
	dc.l	ObjCheckpoint
	dc.l	ObjBigRing
	dc.l	ObjCapsule
	dc.l	ObjGoalPost
	dc.l	ObjSignpost
	dc.l	ObjExplosion
	dc.l	ObjMonitorTimePost
	dc.l	ObjMonitorItem
	dc.l	ObjBoulder
	dc.l	ObjHUDPoints
	dc.l	ObjNull			; 1D - Bumper (pending current port)
	dc.l	ObjNull			; 1E - Flipper (pending current port)
	dc.l	ObjFlower
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjSpikes
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjRobotGenerator
	dc.l	ObjProjector
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjResults
	dc.l	ObjGameOver
	dc.l	ObjTitleCard

; -------------------------------------------------------------------------

ObjNull:
	move.b	#0,(a0)
	rts
