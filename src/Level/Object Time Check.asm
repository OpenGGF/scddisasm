; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Object time zone check functions
; -------------------------------------------------------------------------

	if def(R3_SEMANTIC_TIME_CHECK)
		if R3_SEMANTIC_TIME_CHECK<>0
DestroyInGoodFuture:
		endif
	endif
DestroyOnGoodFuture:
	tst.b	goodFuture
	beq.s	.End
	cmpi.b	#1,timeZone
	bne.s	.Destroy
	tst.b	oSubtype(a0)
	beq.s	.End

	.Destroy:
	move.w	oX(a0),d5
	move.w	oY(a0),d6
	if def(R43_LEGACY_DATA_PREFIX)
		jsr	R43LegacyDeleteObject
	else
	jsr	DeleteObject
	endif
	move.w	d5,oX(a0)
	move.w	d6,oY(a0)
	move.b	#$18,oID(a0)
	tst.b	oSprFlags(a0)
	bpl.s	.NoReturn
	move.w	#FM_EXPLODE,d0
	if def(R43_LEGACY_DATA_PREFIX)
		jsr	R43LegacyPlayFMSound
	else
	jsr	PlayFMSound
	endif

.NoReturn:
	addq.l	#4,sp

.End:
	rts

; -------------------------------------------------------------------------

	if def(R43_LEGACY_DATA_PREFIX)
	if R43_LEGACY_DATA_PREFIX<>0
R43DemoCheckAnimalPrescence:
		else
CheckAnimalPrescence:
		endif
	else
CheckAnimalPrescence:
	endif
	tst.b	oSubtype(a0)
	bmi.s	.End
	cmpi.b	#2,timeZone
	bge.s	.ChkGoodFuture
	tst.b	projDestroyed
	bne.s	.End
	addq.l	#4,sp
	if def(R3_SEMANTIC_TIME_CHECK)
		if R3_SEMANTIC_TIME_CHECK<>0
	jmp	CheckObjectDespawn
		else
	jmp	CheckObjDespawn
		endif
	else
	jmp	CheckObjDespawn
	endif

.ChkGoodFuture:
	tst.b	goodFuture
	bne.s	.End
	addq.l	#4,sp
	if def(R43_LEGACY_DATA_PREFIX)
		jmp	R43LegacyDeleteObject
	else
	jmp	DeleteObject
	endif

.End:
	rts

; -------------------------------------------------------------------------
