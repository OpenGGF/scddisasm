; -------------------------------------------------------------------------
; USA legacy Palmtree Panic Act 3 routines and animation pointers.
;
; The shared R13 first slices retain the common historical image.  The USA
; release points several of those routines at the earlier helper locations,
; and its animation records point at the corresponding USA code addresses.
; Keep the unchanged slice as an input, but express each regional record that
; differs as assembly so the USA image does not need a binary overlay.
; -------------------------------------------------------------------------

	if ACT2_FUTURE_VARIANT=1
R13_USA_PADDING_START EQU $E3BE
	else
R13_USA_PADDING_START EQU $EB82
	endif

	if ACT2_FUTURE_VARIANT=1
; -------------------------------------------------------------------------
; R13C legacy object routines.
; -------------------------------------------------------------------------

; Object initialization and state dispatch.
	org	Padding1+$02B4
	jsr	$20385E.l
	org	Padding1+$02C2
	jsr	$2075BA.l
	org	Padding1+$02D0
	jmp	$202438.l
	org	Padding1+$02E2
	jmp	$20390A.l
	org	Padding1+$02F4
	jsr	$202438.l

; Object child setup and animation dispatch.
	org	Padding1+$0336
	move.l	#$20E936,$4(a0)
	org	Padding1+$033E
	move.l	#$20E97A,$2C(a0)
	org	Padding1+$0346
	jsr	$207584.l
	org	Padding1+$0376
	jsr	$207584.l
	org	Padding1+$03A6
	jsr	$207584.l
	org	Padding1+$03D8
	jsr	$207584.l
	org	Padding1+$041A
	jmp	$208CF6.l
	org	Padding1+$0432
	jsr	$202438.l
	org	Padding1+$043C
	jsr	$208CF6.l
	org	Padding1+$0444
	jsr	$208BA8.l
	org	Padding1+$0468
	jsr	$207584.l
	org	Padding1+$0494
	jsr	$20226E.l

; Object transition and animation-state helpers.
	org	Padding1+$04FA
	move.l	#$20E936,$4(a0)
	org	Padding1+$0528
	jsr	$205A66.l
	org	Padding1+$052E
	jmp	$20385E.l

; R13C uses the USA helper set for its later object routines as well.
	org	Padding1+$0602
	jsr	$20390A.l
	org	Padding1+$0620
	jsr	$20226E.l
	org	Padding1+$0644
	jmp	$2075BA.l
	org	Padding1+$0654
	jmp	$20390A.l
	org	Padding1+$066A
	jsr	$20385E.l
	org	Padding1+$0674
	jmp	$2075BE.l
	org	Padding1+$068E
	jsr	$208CF0.l
	org	Padding1+$069C
	jsr	$208CF0.l

; R13C special-object setup.
	org	Padding1+$0726
	move.l	#$20EC32,$4(a0)
	org	Padding1+$0730
	jsr	$20CB22.l
	org	Padding1+$0768
	jsr	$207584.l
	endif

; -------------------------------------------------------------------------
; Records shared by R13C and R13D.
; -------------------------------------------------------------------------

; The routine begins at the same image offset in both variants, while the
; first padding slice starts at a different offset in each one.
	org	Padding1+($EC97-R13_USA_PADDING_START)-$5
	move.l	#$20EDAA,$4(a0)

	org	Padding1+($ECC8-R13_USA_PADDING_START)-$4
	jsr	$208CF6.l
	org	Padding1+($ECCF-R13_USA_PADDING_START)-$5
	jsr	$20385E.l
	org	Padding1+($ECD5-R13_USA_PADDING_START)-$5
	jmp	$2075BA.l
	org	Padding1+($ECDF-R13_USA_PADDING_START)-$5
	jsr	$20226E.l
	org	Padding1+($ED09-R13_USA_PADDING_START)-$5
	jsr	$207584.l
	org	Padding1+($EDA3-R13_USA_PADDING_START)-$5
	jmp	$20385E.l
	org	Padding1+($EDA9-R13_USA_PADDING_START)-$5
	jmp	$20390A.l

; Animation dispatch entry.
	org	Padding1+($EF6F-R13_USA_PADDING_START)-$5
	jmp	$2062DA.l

; Animation mapping records reference code in the same legacy image.
	org	Padding1+($F1E5-R13_USA_PADDING_START)-$3
	dc.l	$20D738
	org	Padding1+($F211-R13_USA_PADDING_START)-$3
	dc.l	$20D740
	org	Padding1+($F29E-R13_USA_PADDING_START)-$2
	dc.l	$20D7F2
	org	Padding1+($F2DF-R13_USA_PADDING_START)-$3
	dc.l	$20D866
	org	Padding1+($F387-R13_USA_PADDING_START)-$3
	dc.l	$20DB86

; Common state-update and animation helpers.
	org	Padding1+($F399-R13_USA_PADDING_START)-$5
	jsr	$2022F2.l
	org	Padding1+($F3A7-R13_USA_PADDING_START)-$5
	jsr	$20230E.l
	org	Padding1+($F3D3-R13_USA_PADDING_START)-$5
	jsr	$20235A.l
	org	Padding1+($F3DB-R13_USA_PADDING_START)-$5
	jsr	$20AE0E.l
	org	Padding1+($F3E1-R13_USA_PADDING_START)-$5
	jmp	$203AF2.l
	org	Padding1+($F463-R13_USA_PADDING_START)-$5
	jsr	$207636.l
	org	Padding1+($F469-R13_USA_PADDING_START)-$5
	jsr	$205CB6.l
	org	Padding1+($F46F-R13_USA_PADDING_START)-$5
	jsr	$203AF2.l

; Later object update and despawn helpers.
	org	Padding1+($F8DD-R13_USA_PADDING_START)-$5
	move.l	#$20F9F0,$4(a0)
	org	Padding1+($F90F-R13_USA_PADDING_START)-$5
	jsr	$209002.l
	org	Padding1+($F915-R13_USA_PADDING_START)-$5
	jsr	$203AF2.l
	org	Padding1+($F91B-R13_USA_PADDING_START)-$5
	jmp	$20787E.l
	org	Padding1+($F925-R13_USA_PADDING_START)-$5
	jsr	$20235A.l
	org	Padding1+($F94F-R13_USA_PADDING_START)-$5
	jsr	$207848.l
	org	Padding1+($F9E9-R13_USA_PADDING_START)-$5
	jmp	$203AF2.l
	org	Padding1+($F9EF-R13_USA_PADDING_START)-$5
	jmp	$203B9E.l
	org	Padding1+($FBB5-R13_USA_PADDING_START)-$5
	jmp	$20656E.l

; The final animation record immediately precedes the shared USA tail.
	org	Padding1+($FDD9-R13_USA_PADDING_START)-$3
	dc.w	$0020,$DB3C,$7DE0

	if ACT2_FUTURE_VARIANT=1
	org	Padding1+$1A1E
	else
	org	Padding1+$125A
	endif
