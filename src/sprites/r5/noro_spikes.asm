; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites

.Sprite0:
	; The actual spikes are in the main sprite graphics.
	; This is just dummy sprite data for the spikes' hitbox.
	dc.b	0

; ------------------------------------------------------------------------------
