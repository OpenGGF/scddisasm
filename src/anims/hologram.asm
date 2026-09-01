; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Standard object-animation scripts. Each starts with a frame delay and ends
; in $FF to loop the beam or Metal Sonic hologram sequence.
.Table:
	dc.w	.ProjectorBeam-.Table
	dc.w	.MetalSonic-.Table

.ProjectorBeam:
	dc.b	0
	dc.b	2, 1, 3, 1
	dc.b	$FF
	even

.MetalSonic:
	dc.b	0
	dc.b	4, 4, 1, 4, 4, 1, 4, 4
	dc.b	1, 4, 4, 1, 4, 4, 1, 1
	dc.b	4, 4, 1, 1, 4, 4, 1, 1
	dc.b	4, 4, 1, 1, 5, 5, 1, 5
	dc.b	5, 1, 5, 5, 1, 5, 5, 1
	dc.b	5, 5, 1, 1, 5, 5, 1, 1
	dc.b	5, 5, 1, 1, 5, 5, 1, 1
	dc.b	$FF

; ------------------------------------------------------------------------------
