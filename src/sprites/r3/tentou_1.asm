; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w .FlightA-.Sprites
	dc.w .FlightB-.Sprites
	dc.w .FlightC-.Sprites

; Each frame starts with a piece count, followed by five-byte sprite pieces:
; Y offset, size, tile attributes, tile index, and X offset.
.FlightA:
	dc.b 7
	dc.b $F0, 8, 0, 0, $F8
	dc.b $F8, $C, 0, 3, $F0
	dc.b 0, 4, 0, 7, $F0
	dc.b 0, 0, 0, 9, 0
	dc.b 0, 1, 0, $A, 8
	dc.b 8, 0, 0, $C, $F0
	dc.b 8, 4, 0, $D, $F8
	even

.FlightB:
	dc.b 7
	dc.b $F0, $D, 0, $F, $F0
	dc.b 0, 4, 0, 7, $F0
	dc.b 0, 0, 0, $17, 0
	dc.b 0, 0, 0, $18, 8
	dc.b 8, 0, 0, $C, $F0
	dc.b 8, 4, 0, $D, $F8
	dc.b 8, 0, 0, $19, 8
	even

.FlightC:
	dc.b 7
	dc.b $F0, $D, 0, $1A, $F0
	dc.b 0, 4, 0, 7, $F0
	dc.b 0, 0, 0, $22, 0
	dc.b 0, 0, 0, $23, 8
	dc.b 8, 0, 0, $C, $F0
	dc.b 8, 4, 0, $D, $F8
	dc.b 8, 0, 0, $19, 8

; ------------------------------------------------------------------------------
