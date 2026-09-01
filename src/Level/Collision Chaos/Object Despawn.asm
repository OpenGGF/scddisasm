; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos saved-object despawn helper
;
; Each saved object owns three consecutive flag bytes, one for each time
; period. Bit 7 records that the object is loaded. The saved-object ID is
; converted to a three-byte record offset, the active time-period byte is
; selected, and its loaded bit is cleared before the object is deleted.
; -------------------------------------------------------------------------

DespawnObjectR3:
	moveq	#0,d0
	move.b	oSavedFlagsID(a0),d0
	beq.s	.Delete
	lea	savedObjFlags,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0			; Saved ID * three bytes per record
	moveq	#0,d1
	move.b	timeZone,d1
	add.w	d1,d0			; Select the current time-period byte
	bclr	#7,2(a1,d0.w)		; Mark the object as unloaded

.Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------
