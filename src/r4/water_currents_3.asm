; 14-byte records: X/Y bounds (exclusive upper), X/Y velocity, mode, and
; switch_flags index. Mode 1 requires bit 6; mode 2 reverses velocity on bit 5.
; A negative first byte terminates the list.
WaterCurrents:
	dc.w	-1

; ------------------------------------------------------------------------------
