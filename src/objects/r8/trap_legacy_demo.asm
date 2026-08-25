; ------------------------------------------------------------------------------
; Japan/Europe DEMO82A uses the older R8 trap object graph.  The individual
; implementations remain shared with the retail R8 sources; this file only
; restores their historical order.
; ------------------------------------------------------------------------------

LegacyTrapCleanup:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20CCAC
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20CCAC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

	include	"objects/r8/trap_1.asm"
	include	"objects/r8/trap_door_legacy_demo.asm"
	include	"objects/r8/trap_2.asm"
	include	"objects/r8/trap_spikes_1.asm"

; ------------------------------------------------------------------------------
