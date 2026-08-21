; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present object index
; -------------------------------------------------------------------------

	if CC_VARIANT<>0
	include	"Level/Collision Chaos/Object Index (Act 1 Variant).asm"
	else

ObjectIndex:
	dc.l	ObjSonic			; $01 - Sonic
	dc.l	ObjSonic			; $02 - Player 2 Sonic
	dc.l	ObjPowerup			; $03 - Power up
	dc.l	ObjNull			; $04 - Unused
	dc.l	ObjNull			; $05 - Unused
	dc.l	ObjTestBadnik			; $06 - Test badnik
	dc.l	ObjNull			; $07 - Unused
	dc.l	ObjNull			; $08 - Unused
	dc.l	ObjNull			; $09 - Unused
	dc.l	ObjSpring			; $0A - Spring
	dc.l	ObjTunnelDoorSplash		; $0B - Spin tunnel door splash
	dc.l	ObjTunnelDoorSplashSet	; $0C - Spin tunnel door splash setup
	dc.l	ObjTunnelDoor			; $0D - Spin tunnel door
	dc.l	ObjSpinSplash			; $0E - Spin tunnel splash
	dc.l	ObjMovingSpring			; $0F - Moving spring
	dc.l	ObjRing			; $10 - Ring
	dc.l	ObjLostRing			; $11 - Lost ring
	dc.l	ObjFloatBlock			; $12 - Floating block
	dc.l	ObjCheckpoint			; $13 - Checkpoint
	dc.l	ObjBigRing			; $14 - Big ring
	dc.l	ObjCapsule			; $15 - Flower capsule
	dc.l	ObjGoalPost			; $16 - Goal post
	dc.l	ObjSignpost			; $17 - Signpost
	dc.l	ObjExplosion			; $18 - Explosion
	dc.l	ObjMonitorTimePost		; $19 - Monitor/time post
	dc.l	ObjMonitorItem			; $1A - Monitor item
	dc.l	ObjBoulder			; $1B - Boulder
	dc.l	ObjHUDPoints			; $1C - HUD/points
	dc.l	ObjBumper			; $1D - Bumper
	dc.l	ObjFlipper			; $1E - Flipper
	dc.l	ObjFlower			; $1F - Flower
	dc.l	ObjSpikes			; $20 - Spikes
	dc.l	ObjBlock			; $21 - Block
	dc.l	ObjHiddenBlock			; $22 - Hidden block
	dc.l	ObjMetalPlatform			; $23 - Metal platform
	dc.l	ObjKamaKama			; $24 - KamaKama
	dc.l	ObjKamaSickle			; $25 - Kama sickle
	dc.l	ObjDoor			; $26 - Door
	dc.l	ObjFireShooter			; $27 - Fire shooter
	dc.l	ObjDrumPlatform			; $28 - Drum platform
	dc.l	ObjGlassShatter			; $29 - Glass shatter
	dc.l	ObjBumperPlatform			; $2A - Bumper platform
	dc.l	ObjTeleporter			; $2B - Teleporter
	dc.l	ObjSpikeChain			; $2C - Spike chain
	dc.l	ObjGa			; $2D - Ga
	dc.l	ObjTentou			; $2E - Tentou
	dc.l	ObjPocket			; $2F - Pocket
	dc.l	ObjIntroSpikes			; $30 - Intro spikes
	dc.l	ObjMetalSonic			; $31 - Metal Sonic
	dc.l	ObjAmyRose			; $32 - Amy Rose
	dc.l	ObjAmyHeart			; $33 - Amy heart
	dc.l	ObjMetalSonic_Exhaust			; $34 - Metal Sonic exhaust
	dc.l	ObjRollTunnel			; $35 - Roll tunnel
	dc.l	ObjNull			; $36 - Blank
	dc.l	ObjRobotGenerator		; $37 - Robot generator
	dc.l	ObjProjector			; $38 - Metal Sonic projector
	dc.l	ObjCCAnimal			; $39 - Animal
	dc.l	ObjResults			; $3A - End of level results
	dc.l	ObjGameOver			; $3B - Game over text
	dc.l	ObjTitleCard			; $3C - Title card

; -------------------------------------------------------------------------

ObjNull:
	move.b	#0,(a0)
	rts

	endif
