; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w .FuseA-.Sprites
	dc.w .FuseB-.Sprites

; Each frame is one five-byte sprite piece after the piece count.
.FuseA:
	dc.b 1
	dc.b $F8, 5, 0, 0, $F8
	even

.FuseB:
	dc.b 1
	dc.b $F8, 5, 0, 4, $F8

; ------------------------------------------------------------------------------
