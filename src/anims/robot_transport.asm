; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Standard object-animation script. The first byte is the frame delay and $FF
; loops the four active-Past generator frames.
.Table:
	dc.w	.ActivePast-.Table

.ActivePast:
	dc.b	3
	dc.b	3, 4, 5, 6
	dc.b	$FF

; ------------------------------------------------------------------------------
