; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos teleporter object
; -------------------------------------------------------------------------

ObjTeleporter:
	jmp	DeleteObject

; -------------------------------------------------------------------------

MapSpr_Teleporter:
	include	"sprites/r3/teleporter.asm"
	even

	if def(R3_SEMANTIC_TELEPORTER)
		if R3_SEMANTIC_TELEPORTER<>0
TeleporterObject	EQU	ObjTeleporter
TeleporterSprites	EQU	MapSpr_Teleporter
		endif
	endif

; -------------------------------------------------------------------------
