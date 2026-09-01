; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Standard object-animation scripts: a frame delay followed by frame indices;
; $FF loops to the start of the script.
.Table:
	dc.w	.Freed-.Table
	dc.w	.Hologram-.Table

.Freed:
	dc.b	3
	dc.b	0, 1
	dc.b	$FF
	even

.Hologram:
	dc.b	0
	dc.b	0, 0, 2, 0, 0, 2, 0, 0
	dc.b	2, 0, 0, 2, 1, 1, 2, 2
	dc.b	1, 1, 2, 2, 1, 1, 2, 2
	dc.b	1, 1, 2, 2, 0, 0, 2, 0
	dc.b	0, 2, 0, 0, 2, 0, 0, 2
	dc.b	1, 1, 2, 2, 1, 1, 2, 2
	dc.b	1, 1, 2, 2, 1, 1, 2, 2
	dc.b	$FF

; ------------------------------------------------------------------------------
