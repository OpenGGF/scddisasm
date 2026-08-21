; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Present animated tile update
; -------------------------------------------------------------------------

UpdateAnimTiles:
	jmp	LoadPowerupArt

; The current engine exposes the shared shield loader under a different
; name; keep the historical R12A entry point as a compatibility alias.
LoadPowerupArt:
	jmp	LoadShieldArt
