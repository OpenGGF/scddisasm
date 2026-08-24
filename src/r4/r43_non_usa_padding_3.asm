; ------------------------------------------------------------------------------
; Japan/Europe R43 retained helper links
;
; The discarded Act 2 switch and door code remains in the R43C/R43D retail
; layout.  Those regional binaries link this historical body to the older
; helper addresses, while the reconstructed source normally resolves the
; symbolic calls to the newer R4 helpers.  Patch the instruction operands in
; source form and leave the rest of the retained body untouched.
; ------------------------------------------------------------------------------

; SwitchObject: SolidObject, PlayFmSound, DrawObject, and despawn helpers.
	org	Padding1+$016E+R43_NON_USA_ADJUST
	jsr	$2087D8.L
	org	Padding1+$01A8+R43_NON_USA_ADJUST
	jsr	$202598.L
	org	Padding1+$01F4+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0200+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0226+R43_NON_USA_ADJUST
	jmp	$2078C6.L

; DoorObject and its collision helper.
	org	Padding1+$0270+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0276+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0288+R43_NON_USA_ADJUST
	jmp	$2087D8.L
