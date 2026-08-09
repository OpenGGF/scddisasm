; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims

.Anim0:
	dc.b	0
	dc.b	0, 1, 2, 3, 4, 5, 6, 7
	dc.b	7
	; Instead of using a flag to denote the end of the animation, 
	; the object manually checks for it.

; ------------------------------------------------------------------------------
