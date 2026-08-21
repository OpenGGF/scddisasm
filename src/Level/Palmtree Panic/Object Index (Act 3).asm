; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 3 object index
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
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjBigRing
	dc.l	ObjCapsule
	dc.l	ObjGoalPost
	dc.l	ObjSignpost
	dc.l	ObjExplosion
	dc.l	ObjMonitorTimePost
	dc.l	ObjMonitorItem
	dc.l	ObjBoulder
	dc.l	ObjHUDPoints
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjFlower
	dc.l	ObjNull
	dc.l	ObjPlatform
	dc.l	ObjTamabboh
	dc.l	ObjMissile
	dc.l	ObjAnimal
	dc.l	ObjNull
	dc.l	ObjSpikes
	dc.l	ObjNull
	dc.l	ObjSpringBoard
	dc.l	ObjNull
	dc.l	EggmanObject
	dc.l	BossBodyObject
	dc.l	BossThighObject
	dc.l	BossCalfObject
	dc.l	BossFootObject
	dc.l	BossShoulderObject
	dc.l	BossArmObject
	dc.l	BossForearmObject
	dc.l	BossBumperObject
	dc.l	ObjNull
	dc.l	ObjRollTunnel
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjNull
	dc.l	ObjResults
	dc.l	ObjGameOver
	dc.l	ObjTitleCard
	dc.l	ObjMosqui
	dc.l	ObjPataBata
	dc.l	ObjAnton
	dc.l	ObjTagaTaga

; -------------------------------------------------------------------------

ObjNull:
	move.b	#0,(a0)
	rts
