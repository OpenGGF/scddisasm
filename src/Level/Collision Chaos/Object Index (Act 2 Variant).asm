; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos Act 2 object index
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
	dc.l	ObjBumper
	dc.l	ObjFlipper
	dc.l	ObjFlower
	dc.l	ObjSpikes
	dc.l	ObjBlock
	dc.l	ObjHiddenBlock
	dc.l	ObjMetalPlatform
	dc.l	ObjKamaKama
	dc.l	ObjKamaSickle
	dc.l	ObjDoor
	dc.l	ObjFireShooter
	dc.l	ObjDrumPlatform
	dc.l	ObjGlassShatter
	dc.l	ObjBumperPlatform
	dc.l	ObjTeleporter
	dc.l	ObjSpikeChain
	dc.l	ObjGa
	dc.l	ObjTentou
	dc.l	ObjPocket
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjRollTunnel
	dc.l	ObjNull
	dc.l	ObjRobotGenerator
	dc.l	ObjProjector
	dc.l	ObjCCAnimal
	dc.l	ObjResults
	dc.l	ObjGameOver
	dc.l	ObjTitleCard

; -------------------------------------------------------------------------

ObjNull:
	move.b	#0,(a0)
	rts
