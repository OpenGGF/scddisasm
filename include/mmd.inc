; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

mmd macro flags, origin, len, entry, hblank, vblank
	if (\origin)=WORD_RAM_2M
		org WORD_RAM_2M
	else
		org (\origin)-$100
	endif

	dc.b	\flags, 0
	if (\origin)=WORD_RAM_2M
		dc.l	0
		dc.w	0
	else
		dc.l	(\origin)-$100
		dc.w	(\len)/4-1
	endif
	dc.l	\entry, \hblank, \vblank
	
	dcb.b	$EC, 0
	endm

; ------------------------------------------------------------------------------