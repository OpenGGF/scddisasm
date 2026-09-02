; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Extend-.Anims

.Extend:
	dc.b	0
	dc.b	0, 1, 2, 3, 4, 5, 6, 7
	dc.b	7
	; Instead of using a flag to denote the end of the animation,
	; the object manually checks for it. Which sprite frame it
	; checks depends on the given width.

; ------------------------------------------------------------------------------
