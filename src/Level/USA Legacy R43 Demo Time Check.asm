; ------------------------------------------------------------------------------
; USA DEMO43C legacy padding: time-zone helpers
;
; The USA demo retains this earlier object-graph tail.  Keep the routines as
; source so the padding region is assembled rather than imported as a blob.
; ------------------------------------------------------------------------------

R43DemoDestroyOnGoodFuture:
	tst.b	goodFuture
	beq.s	.End
	cmpi.b	#1,timeZone
	bne.s	.Destroy
	tst.b	oSubtype(a0)
	beq.s	.End

.Destroy:
	move.w	oX(a0),d5
	move.w	oY(a0),d6
	jsr	R43LegacyDeleteObject
	move.w	d5,oX(a0)
	move.w	d6,oY(a0)
	move.b	#$18,oID(a0)
	tst.b	oSprFlags(a0)
	bpl.s	.NoReturn
	move.w	#FM_EXPLODE,d0
	jsr	R43LegacyPlayFMSound

.NoReturn:
	addq.l	#4,sp

.End:
	rts
; ------------------------------------------------------------------------------

R43DemoCheckAnimalPresence:
	tst.b	oSubtype(a0)
	bmi.s	.End
	cmpi.b	#2,timeZone
	bge.s	.ChkGoodFuture
	tst.b	projDestroyed
	bne.s	.End
	addq.l	#4,sp
	jmp	CheckObjDespawn

.ChkGoodFuture:
	tst.b	goodFuture
	bne.s	.End
	addq.l	#4,sp
	jmp	R43LegacyDeleteObject

.End:
	rts
