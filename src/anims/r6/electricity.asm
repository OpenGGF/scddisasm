; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims

.Anim0:
	dc.b	1
	dc.b	0, 0, 0, 0, 0, 0, 0, 0
	dc.b	0, 0, 0, 0, 1, 2, 3, 4
	dc.b	5
	; This appears to be data for the original animation method
	; for the electricity in Wacky Workbench's boss. Instead of
	; using a flag to denote the end of the animation, the object
	; would have manually checked for it. The finalized animation
	; method is done in code, but notably, the sprite frame ID it
	; checks to end the animation matches the last frame ID here.

; ------------------------------------------------------------------------------
