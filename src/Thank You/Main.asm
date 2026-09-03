; -------------------------------------------------------------------------
; Sonic CD Disassembly
; "Thank You" screen main CPU program
; -------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/MMD.inc"

	if REGION=USA
ThankYouEarlyShift	equ	0
ThankYouFullShift	equ	0
	else
ThankYouEarlyShift	equ	6
ThankYouFullShift	equ	18
	endif

; The original uses the standard work-RAM file origin and reserves a
; nominal $5500-byte load area in its MMD header.
	MMD	0, &
		WORKRAMFILE, $5500, &
		Start, 0, 0

Start:
	move.l	#VInterrupt, $FFFFFD08.w
	moveq	#$0, d0
	move.l	d0, $a12010.l
	move.l	d0, $a12014.l
	move.l	d0, $a12018.l
	move.l	d0, $a1201c.l
	move.b	d0, $a1200e.l
	move.w	d0, $FFFFBA5C.w
	bsr.w	WaitSubCPUStart
	bsr.w	GiveWordRAMAccess
	bsr.w	WaitSubCPUStop
	lea.l	$FFFF9000.w, a0
	moveq	#$0, d0
	move.w	#$1aff, d7
L_FF2042:
	move.l	d0, (a0)+
	dbra	d7, L_FF2042
	move.w	#$f000, $a1201e.l
	bsr.w	InitMD
	bsr.w	LoadFirstGraphics
	bsr.w	LoadSecondGraphics
	move.l	#$4030201, d0
	jsr	ThankYou_LoadNemesisGraphics.l
	moveq	#$5, d0
	jsr	ThankYou_LoadNemesisGraphics.l
	bset.b	#$6, $ff0f17.l
	move.w	$ff0f16.l, $c00004.l
	lea.l	PaletteSequence.l, a0
	move.w	(a0), $FFFFBA46.w
	move.w	#$0, $FFFFBA44.w
	move.w	#$14, $FFFFBA76.w
	move.w	#$1, $FFFFBA74.w
	move.w	#$600, $FFFFBA78.w
	move.w	#$1, $FFFFBA7E.w
	if REGION=USA
	move.w	#$2a30, $FFFFBA80.w
	endif
	lea.l	L_FF38CE(pc), a0
	lea.l	$FFFFB680.w, a1
	moveq	#$1f, d7
L_FF20BA:
	move.l	(a0)+, (a1)+
	dbra	d7, L_FF20BA
L_FF20C0:
	moveq	#$0, d0
	move.w	$FFFFBA5C.w, d0
	add.w	d0, d0
	lea.l	CommandTable.l, a0
	move.w	(a0, d0.w), d0
	jsr	(a0, d0.w)
	tst.b	$FFFFBA40.w
	beq.b	L_FF20C0
	bsr.w	ThankYou_FadeInitializedPalettes
	bsr.w	StopSubCPU
	nop
	nop
	nop
	rts
CommandTable:
	dc.b	$00
	dc.b	$04,$00,$3C
MainLoop:
	bsr.w	ThankYou_UpdateDisplay
	bne.b	MainLoop
	bsr.w	BuildObjectList
	bsr.w	WritePalette
	lea.l	$FFFFBA64.w, a4
	move.w	#$258, (a4)+
	move.l	#$0, (a4)+
	move.l	#$0, (a4)+
	move.l	#$0, (a4)+
	move.w	#$258, (a4)+
	move.w	#$1, $FFFFBA5C.w
	bsr.w	ThankYou_FadeInPalettes
	rts
UpdateFrame:
	bsr.w	ThankYou_CheckExitSignal
	bsr.w	UpdateObjectTimers
	bsr.w	ThankYou_UpdateObjects
	bsr.w	ThankYou_WaitForVBlank
	rts
	dc.b	$4E,$BA,$13,$44,$70,$00,$4E,$75
BuildObjectList:
	lea.l	$200190.l, a0
	moveq	#$3, d1
	bsr.w	InsertObject
	lea.l	$200194.l, a0
	moveq	#$2, d1
	bsr.w	InsertObject
	lea.l	$200198.l, a0
	moveq	#$1, d1
	bsr.w	InsertObject
	moveq	#$0, d0
	move.w	#$ffff, d1
	lea.l	$FFFF9000.w, a0
	moveq	#$53, d7
L_FF2172:
	cmp.w	$4(a0), d1
	bgt.b	L_FF2180
	move.l	$0(a0), d0
	move.w	$4(a0), d1
L_FF2180:
	addq.l	#$6, a0
	dbra	d7, L_FF2172
	rts
InsertObject:
	moveq	#$1b, d7
L_FF218A:
	move.l	(a0), d0
	lea.l	$FFFF9000.w, a1
	moveq	#$53, d6
L_FF2192:
	cmp.l	$0(a1), d0
	beq.b	L_FF219E
	tst.l	$0(a1)
	bne.b	L_FF21A8
L_FF219E:
	move.l	d0, $0(a1)
	add.w	d1, $4(a1)
	bra.b	L_FF21B0
L_FF21A8:
	lea.l	$6(a1), a1
	dbra	d6, L_FF2192
L_FF21B0:
	adda.l	#$c, a0
	dbra	d7, L_FF218A
	rts
WritePalette:
	lea.l	$c00004.l, a2
	move.w	#$c149, d5
	move.l	#$462a0003, d3
	lsr.l	#$8, d0
	move.w	d0, d2
	andi.w	#$ff, d2
	bsr.w	ThankYou_WritePaletteBlock
	move.l	#$46260003, d3
	lsr.l	#$8, d0
	move.w	d0, d2
	andi.w	#$ff, d2
	bsr.w	ThankYou_WritePaletteBlock
	move.l	#$46220003, d3
	lsr.l	#$8, d0
	move.w	d0, d2
	andi.w	#$ff, d2
	bsr.w	ThankYou_WritePaletteBlock
	rts
; Write one palette block to the VDP.
ThankYou_WritePaletteBlock:
	moveq	#$2, d7
	cmpi.w	#$11, d2
	bne.b	L_FF2208
	moveq	#$3, d7
L_FF2208:
	add.w	d2, d2
	lea.l	L_FF67D0.l, a0
	lea.l	(a0, d2.w), a1
	adda.w	(a1), a0
	move.l	d7, d6
L_FF2218:
	move.l	d3, (a2)
	move.w	(a0)+, d4
	add.w	d5, d4
	move.w	d4, $c00000.l
	move.w	(a0)+, d4
	add.w	d5, d4
	move.w	d4, $c00000.l
	addi.l	#$800000, d3
	dbra	d6, L_FF2218
	rts
StopSubCPU:
	bset.b	#$6, $a1200e.l
	bsr.w	GiveWordRAMAccess
	nop
	nop
	nop
L_FF224C:
	btst.b	#$6, $a1200f.l
	beq.b	L_FF224C
	bclr.b	#$6, $a1200e.l
	nop
	nop
	nop
	rts
; Set the exit flag when the Sub CPU reports a stop signal.
ThankYou_CheckExitSignal:
	btst.b	#$7, $a1201f.l
	beq.b	L_FF2278
	move.b	#$1, $FFFFBA40.w
	bra.b	L_FF22AC
L_FF2278:
	btst.b	#$6, $a1201f.l
	beq.b	L_FF228A
	move.b	#$1, $FFFFBA40.w
	bra.b	L_FF22AC
L_FF228A:
	btst.b	#$4, $a1201f.l
	beq.b	L_FF229C
	move.b	#$1, $FFFFBA40.w
	bra.b	L_FF22AC
L_FF229C:
	btst.b	#$5, $a1201f.l
	beq.b	L_FF22AC
	move.b	#$1, $FFFFBA40.w
L_FF22AC:
	rts
	dc.b	$33,$FC,$00,$01,$00,$A1,$20,$12,$4A,$79,$00,$A1,$20,$22,$67,$F8
	dc.b	$33,$FC,$00,$00,$00,$A1,$20,$12,$4A,$79,$00,$A1,$20,$22,$66,$F8
	dc.b	$4E,$75
GiveWordRAMAccess:
	btst.b	#$1, $a12003.l
	bne.b	L_FF22EC
L_FF22DA:
	bset.b	#$1, $a12003.l
	btst.b	#$1, $a12003.l
	beq.b	L_FF22DA
L_FF22EC:
	rts
; Wait until the Sub CPU ready bit is asserted.
ThankYou_WaitSubCpuReady:
	btst.b	#$0, $a12003.l
	beq.b	ThankYou_WaitSubCpuReady
	rts
WaitSubCPUStart:
	btst.b	#$7, $a1200f.l
	beq.b	WaitSubCPUStart
	rts
WaitSubCPUStop:
	btst.b	#$7, $a1200f.l
	bne.b	WaitSubCPUStop
	rts
LoadFirstGraphics:
	move.l	#$40200000, $c00004.l
	lea.l	$210452.l, a0
	bsr.w	ThankYou_DecodeNemesisToVdp
	moveq	#$0, d0
	jsr	ThankYou_DecodeEnigmaToVdp(pc)
	rts
	dc.b	$45,$F9,$00,$C0,$00,$04,$43,$F9,$00,$21,$0A,$1C,$3C,$3C,$C0,$01
	dc.b	$20,$3C,$40,$00,$00,$03,$32,$3C,$00,$1B,$24,$80,$34,$3C,$00,$27
	dc.b	$36,$19,$D6,$46,$33,$C3,$00,$C0,$00,$00,$51,$CA,$FF,$F4,$06,$80
	dc.b	$00,$80,$00,$00,$51,$C9,$FF,$E4,$4E,$75
LoadSecondGraphics:
	move.l	#$53600000, $c00004.l
	lea.l	$210aaa.l, a0
	bsr.w	ThankYou_DecodeNemesisToVdp
	moveq	#$1, d0
	jsr	ThankYou_DecodeEnigmaToVdp(pc)
	rts
	dc.l	$45F900C0
	dc.l	$000443F9
	dc.l	$00211540
	dc.l	$3C3C209B
	dc.l	$203C6000
	dc.l	$0003323C
	dc.l	$001B2480
	dc.l	$343C0027
	dc.l	$3619D646
	dc.l	$33C300C0
	dc.l	$000051CA
	dc.l	$FFF40680
	dc.l	$00800000
	dc.l	$51C9FFE4
	dc.b	$4E,$75
; Dispatch the selected screen-data command and store its result.
ThankYou_DispatchScreenDataCommand:
	moveq	#$0, d0
	move.b	$200020.l, d0
	beq.b	L_FF2408
	subq.w	#$1, d0
	cmpi.w	#$9, d0
	bcc.b	L_FF23EE
	add.w	d0, d0
	lea.l	L_FF240A.l, a0
	move.w	(a0, d0.w), d0
	moveq	#$0, d1
	jsr	(a0, d0.w)
	bcs.b	L_FF23EE
	move.b	#$0, $200021.l
	bra.b	L_FF23F6
L_FF23EE:
	move.b	#$ff, $200021.l
L_FF23F6:
	move.w	d0, $200022.l
	move.w	d1, $200024.l
	clr.b	$200020.l
L_FF2408:
	rts
L_FF240A:
	dc.b	$00
	dc.b	$12,$00,$24,$00,$30,$00,$4A,$00,$6C,$00,$90,$00,$AA,$00,$B0,$00
	dc.b	$D6,$41,$F9
	dc.l	$00FF2502-ThankYouEarlyShift
	dc.w	$43F9
	dc.l	$00FF3182-ThankYouEarlyShift
	dc.w	$7000,$4EF8,$FDAE,$7001,$227C
	dc.l	$00FF3182-ThankYouEarlyShift
	dc.w	$4EF8,$FDAE
	dc.b	$20
	dc.b	$7C,$00,$20,$00,$30,$11,$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$0C,$70,$02,$4E,$F8,$FD,$AE,$20,$7C,$00,$20,$00,$30,$11
	dc.b	$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00,$00,$00,$0C,$22,$7C,$00
	dc.b	$20,$00,$40,$70,$03,$4E,$B8,$FD,$AE,$4E,$75,$20,$7C,$00,$20,$00
	dc.b	$30,$11,$79,$00,$20,$00,$29,$00,$0B,$31,$79,$00,$20,$00,$2A,$00
	dc.b	$0C,$22,$7C,$00,$20,$00,$40,$70,$04,$4E,$B8,$FD,$AE,$4E,$75,$20
	dc.b	$7C,$00,$20,$00,$30,$11,$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$0C,$70,$05,$4E,$F8,$FD,$AE,$70,$06,$4E,$F8,$FD,$AE,$20
	dc.b	$7C,$00,$20,$00,$30,$11,$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$0C,$22,$7C,$00,$20,$00,$44,$22,$39,$00,$20,$00,$40,$70
	dc.b	$07,$4E,$F8,$FD,$AE,$20,$7C,$00,$20,$00,$30,$11,$79,$00,$20,$00
	dc.b	$29,$00,$0B,$31,$79,$00,$20,$00,$2A,$00,$0C,$22,$7C,$00,$20,$00
	dc.b	$40,$70,$08,$4E,$F8,$FD,$AE,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dcb.b	$C84, 0
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00
	dc.b	$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B
	dc.b	$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$23
	dc.b	$19,$1F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dcb.b	$B, 0
	dc.b	$61,$00,$00,$16,$66,$02,$42,$00,$13,$C0,$00,$20,$00,$26,$4E,$75
; Return whether the display-update path is currently pending.
ThankYou_CheckDisplayUpdatePending:
	tst.b	$200026.l
	rts
	dc.b	$4A,$39,$00,$20,$00,$27,$4E,$75
; Run the per-frame display and screen-state update sequence.
ThankYou_UpdateDisplay:
	bsr.w	ThankYou_AdvanceDisplayState
	bsr.w	ThankYou_ResetDisplayCommand
	bsr.w	L_FF347C
	rts
	dc.l	$600002E6
L_FF347C:
	bra.w	L_FF3734
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.w	$41F9
	dc.l	$00FF318E-ThankYouEarlyShift
	dc.l	$43F90020
	dc.l	$0040303C
	dc.l	$00A822D8
	dc.l	$51C8FFFC
	dc.w	$41F9
	dc.l	$00FF3432-ThankYouEarlyShift
	dc.w	$43F9
	dc.l	$002002E4
	dc.l	$303C0005
	dc.l	$22D851C8
	dc.l	$FFFC13FC
	dc.l	$00000020
	dc.l	$002933FC
	dc.l	$000B0020
	dc.l	$002A4E75
; Reset display command state and install the SONICCD marker.
ThankYou_ResetDisplayCommand:
	move.b	#$0, $200029.l
	move.w	#$c, $20002a.l
	lea.l	L_FF34DC.l, a0
	bra.b	L_FF34E8
L_FF34DC:
	dc.b	$53
	dc.b	$4F,$4E,$49,$43,$43,$44,$5F,$5F,$5F,$5F,$00
L_FF34E8:
	movem.l	a0-a1, -(a7)
	movea.l	#$200030, a1
	move.l	(a0)+, (a1)+
	move.l	(a0)+, (a1)+
	move.w	(a0)+, (a1)+
	move.b	(a0)+, (a1)+
	movem.l	(a7)+, a0-a1
	rts
; Dispatch the pending display command or scripted screen-data command.
ThankYou_DispatchDisplayCommand:
	bsr.w	ThankYou_CheckDisplayUpdatePending
	bne.b	L_FF351E
	move.b	$ff0f1f.l, $200028.l
	jsr	GiveWordRAMAccess.l
	jsr	ThankYou_WaitSubCpuReady.l
	bra.b	L_FF3522
L_FF351E:
	bsr.w	ThankYou_DispatchScreenDataCommand
L_FF3522:
	tst.b	$200021.l
	rts
; Advance the display state and return its transition result.
ThankYou_AdvanceDisplayState:
	jsr	ThankYou_WaitSubCpuReady.l
	bsr.w	L_FF35B4
	bne.w	L_FF355A
	move.b	#$1, $200026.l
	move.b	#$1, $200020.l
	bsr.b	ThankYou_DispatchDisplayCommand
	tst.b	$200021.l
	beq.b	L_FF3564
	tst.w	$200024.l
	bne.b	L_FF35AE
L_FF355A:
	move.b	#$0, $200027.l
	bra.b	L_FF3570
L_FF3564:
	bsr.w	ThankYou_SelectScreenData2
	move.b	#$1, $200027.l
L_FF3570:
	move.b	#$0, $200026.l
	move.b	#$1, $200020.l
	bsr.w	ThankYou_DispatchDisplayCommand
	tst.b	$200021.l
	bne.b	L_FF35A8
	bsr.w	ThankYou_SelectScreenData2
	tst.b	$200027.l
	beq.b	L_FF359E
	move.w	#$0, d0
	rts
L_FF359E:
	move.w	#$1, d0
	move.w	#$0, d1
	rts
L_FF35A8:
	move.w	#$ffff, d0
	rts
L_FF35AE:
	move.w	#$fffe, d0
	rts
; Probe the cartridge/CD signatures and return the hardware status.
ThankYou_ProbeHardwareSignatures:
L_FF35B4:
	btst.b	#$7, $400001.l
	beq.b	L_FF35E4
	lea.l	$400010.l, a0
	lea.l	L_FF36B4.l, a1
	moveq	#$2, d0
L_FF35CC:
	cmpm.l	(a0)+, (a1)+
	bne.b	L_FF35E4
	dbra	d0, L_FF35CC
	movea.l	#$fffffdae, a0
	jsr	$400020.l
	bra.w	L_FF36A8
L_FF35E4:
	btst.b	#$7, $400001.l
	bne.w	L_FF36B0
	move.b	$400001.l, d0
	andi.l	#$7, d0
	move.l	#$2000, d1
	lsl.l	d0, d1
	lsl.l	#$1, d1
	lea.l	$5fff80.l, a2
	adda.l	d1, a2
	movea.l	a2, a0
	adda.w	#$60, a0
	lea.l	L_FF36B4.l, a1
	movep.l	$1(a0), d1
	cmp.l	(a1), d1
	bne.w	L_FF366E
	movep.l	$9(a0), d1
	cmp.l	$4(a1), d1
	bne.w	L_FF366E
	movep.l	$11(a0), d1
	cmp.l	$8(a1), d1
	bne.w	L_FF366E
	movea.l	a2, a0
	adda.w	#$40, a0
	lea.l	L_FF36C0.l, a1
	movep.l	$1(a0), d1
	cmp.l	(a1), d1
	bne.w	L_FF366E
	movep.l	$9(a0), d1
	cmp.l	$4(a1), d1
	bne.w	L_FF366E
	movep.l	$11(a0), d1
	cmp.l	$8(a1), d1
	bne.w	L_FF366E
	bra.w	L_FF36A8
L_FF366E:
	bset.b	#$0, $7fffff.l
	lea.l	$600001.l, a0
	move.b	(a0), d0
	move.b	#$5a, (a0)
	cmpi.b	#$5a, (a0)
	bne.b	L_FF369E
	move.b	#$a5, (a0)
	cmpi.b	#$a5, (a0)
	bne.b	L_FF369E
	move.b	d0, (a0)
	bclr.b	#$0, $7fffff.l
	bra.b	L_FF36AC
L_FF369E:
	bclr.b	#$0, $7fffff.l
	bra.b	L_FF36B0
L_FF36A8:
	moveq	#$0, d0
	rts
L_FF36AC:
	moveq	#$0, d0
	rts
L_FF36B0:
	moveq	#$ff, d0
	rts
L_FF36B4:
	dc.b	$52
	dc.b	$41,$4D,$5F,$43,$41,$52,$54,$52,$49,$44,$47
L_FF36C0:
	dc.b	$53
	dc.b	$45,$47,$41,$5F,$43,$44,$5F,$52,$4F,$4D,$00,$2F,$00
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.w	$201F,$23C0
	dc.l	$00200040
	dc.w	$41F9
	dc.l	$00FF36F2-ThankYouEarlyShift
	dc.b	$61,$00,$FE,$04,$13,$FC,$00,$08,$00,$20,$00,$20,$60,$00,$FE
	dc.b	$10,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$00
; Select screen-data command 2 and dispatch it.
ThankYou_SelectScreenData2:
	jsr	ThankYou_WaitSubCpuReady.l
	move.b	#$2, $200020.l
	bra.w	ThankYou_DispatchDisplayCommand
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.w	$13FC
	dc.l	$00030020
	dc.l	$00206000
	dc.w	$FDE0,$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.l	$13FC0004
	dc.l	$00200020
	dc.l	$6000FDCE
L_FF3734:
	jsr	ThankYou_WaitSubCpuReady.l
	move.b	#$a, $200020.l
	bra.w	ThankYou_DispatchDisplayCommand
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.b	$13,$FC,$00,$05,$00,$20,$00,$20,$61,$00,$FD,$AA,$66,$04,$61,$00
	dc.b	$00,$3C,$4E,$75
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.b	$13,$FC,$00,$0B,$00,$20,$00,$20,$61,$00,$FD,$90,$4E,$75
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.b	$13,$FC,$00,$06,$00,$20,$00,$20,$60,$00,$FD,$7C
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.b	$13,$FC,$00,$07,$00,$20,$00,$20,$60,$00,$FD,$6A
	dc.w	$4EB9
	dc.l	$00FF22EE-ThankYouEarlyShift
	dc.b	$13,$FC,$00,$09,$00,$20,$00,$20
	dc.b	$60,$00,$FD,$58
InitMD:
	lea.l	L_FF394E(pc), a0
	move.w	#$8000, d0
	moveq	#$12, d7
L_FF37B4:
	move.b	(a0)+, d0
	move.w	d0, $c00004.l
	addi.w	#$100, d0
	dbra	d7, L_FF37B4
	moveq	#$40, d0
	move.b	d0, $a10009.l
	move.b	d0, $a1000b.l
	move.b	d0, $a1000d.l
	move.b	#$c0, $a10003.l
	bra.b	L_FF381A
	dc.b	$33,$FC,$01,$00,$00,$A1,$12,$00,$61,$00,$01,$76,$43,$F9,$00,$A0
	dc.b	$00,$00,$12,$FC,$00,$F3,$12,$FC,$00,$F3,$12,$FC,$00,$C3,$12,$FC
	dc.b	$00,$00,$12,$FC,$00,$00,$33,$FC,$00,$00,$00,$A1,$12,$00,$E0,$18
	dc.b	$33,$FC,$01,$00,$00,$A1,$12,$00
L_FF381A:
	bsr.w	ThankYou_HaltZ80
	lea.l	$c00004.l, a6
	move.w	#$8f01, (a6)
	move.l	#$93ff94ff, (a6)
	move.w	#$9780, (a6)
	move.l	#$40000080, (a6)
	move.w	#$0, $c00000.l
L_FF3840:
	btst.b	#$1, $1(a6)
	bne.b	L_FF3840
	move.l	#$40000000, (a6)
	move.w	#$0, $c00000.l
	move.w	#$8f02, (a6)
	nop
	move.l	#$40000003, $c00004.l
	move.w	#$7ff, d7
L_FF386A:
	move.w	#$6ff, $c00000.l
	dbra	d7, L_FF386A
	move.l	#$60000003, $c00004.l
	move.w	#$7ff, d7
L_FF3884:
	move.w	#$6ff, $c00000.l
	dbra	d7, L_FF3884
	move.l	#$c0000000, $c00004.l
	lea.l	L_FF38CE(pc), a0
	moveq	#$0, d0
	moveq	#$1f, d7
L_FF38A2:
	move.l	d0, $c00000.l
	dbra	d7, L_FF38A2
	move.l	#$40000010, $c00004.l
	move.l	#$0, $c00000.l
	bsr.w	ThankYou_ReleaseZ80
	move.w	#$8134, $ff0f16.l
	rts
L_FF38CE:
	dc.b	$00
	dc.b	$00,$00,$00,$06,$28,$08,$4A,$0E,$6E,$0E,$8E,$0E,$EE,$0A,$AA,$08
	dc.b	$88,$04,$44,$08,$AE,$00,$6C,$00,$C2,$00,$80,$08,$06,$00,$0E,$00
	dc.b	$00,$0E,$86,$0E,$A8,$0E,$CA,$0E,$CC,$0E,$64,$0E,$64,$0E,$64,$0E
	dc.b	$64,$0E,$CC,$0E,$CC,$0E,$CC,$0E,$CC,$0E,$64,$FF,$FF,$FF,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$00,$66,$00,$AA,$00,$EE,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$08,$22,$0A,$44,$0C,$66,$0E,$88,$0E,$EE,$0A,$AA,$08
	dc.b	$88,$04,$44,$08,$AE,$04,$6A,$00,$0E,$00,$08,$00,$00,$00,$EE
L_FF394E:
	dc.b	$04
	dc.b	$34,$30,$00,$07,$5E,$00,$00,$00,$00,$00,$00,$81,$34,$00,$02,$01
	dc.b	$00,$00,$00
; Halt the Z80 and save the current interrupt mask.
ThankYou_HaltZ80:
	move.w	sr, $FFFFBA50.w
	move.w	#$100, $a11100.l
L_FF396E:
	btst.b	#$0, $a11100.l
	bne.b	L_FF396E
	rts
; Release the Z80 and restore the saved interrupt mask.
ThankYou_ReleaseZ80:
	move.w	#$0, $a11100.l
	move.w	$FFFFBA50.w, sr
	rts
; Read controller buttons and update the communication bytes.
ThankYou_ReadController:
	lea.l	$a1201e.l, a0
	lea.l	$a10003.l, a1
	move.b	#$0, (a1)
	tst.w	(a0)
	move.b	(a1), d0
	lsl.b	#$2, d0
	andi.b	#$c0, d0
	move.b	#$40, (a1)
	tst.w	(a0)
	move.b	(a1), d1
	andi.b	#$3f, d1
	or.b	d1, d0
	not.b	d0
	move.b	d0, d1
	move.b	(a0), d2
	eor.b	d2, d0
	move.b	d1, (a0)+
	and.b	d1, d0
	move.b	d0, (a0)+
	rts
	dc.l	$33FC0100
	dc.l	$00A11200
	dc.l	$4EBAFF98
	dc.l	$43F900A0
	dc.l	$000012FC
	dc.l	$00F312FC
	dc.l	$00F312FC
	dc.l	$00C312FC
	dc.l	$000012FC
	dc.l	$000033FC
	dc.l	$000000A1
	dc.l	$1200E018
	dc.l	$33FC0100
	dc.l	$00A11200
	dc.l	$4EFAFF80
	dc.l	$4E7511C0
	dc.l	$F00B4E75
	dc.l	$11C0F00C
	dc.b	$4E,$75
SoundAndInterruptFunctions:
	jsr	ThankYou_HaltZ80.l
	tst.b	$FFFFF00B.w
	beq.b	L_FF3A26
	move.b	$FFFFF00B.w, $a01c09.l
	move.b	#$0, $FFFFF00B.w
	bra.b	L_FF3A3A
L_FF3A26:
	tst.b	$FFFFF00C.w
	beq.b	L_FF3A3A
	move.b	$FFFFF00C.w, $a01c09.l
	move.b	#$0, $FFFFF00C.w
L_FF3A3A:
	jmp	ThankYou_ReleaseZ80.l
VInterrupt:
	movem.l	d0-d7/a0-a6, -(a7)
	move.b	#$1, $a12000.l
	tst.b	$FFFFBA42.w
	beq.w	ThankYou_VIntIdleUpdate
	move.b	#$0, $FFFFBA42.w
	lea.l	$c00004.l, a1
	lea.l	$c00000.l, a2
	move.w	(a1), d0
	jsr	ThankYou_HaltZ80(pc)
	lea.l	$c00004.l, a6
	move.l	#$93409401, (a6)
	move.l	#$958096d1, (a6)
	move.w	#$977f, (a6)
	move.w	#$7c00, (a6)
	move.w	#$82, -(a7)
	move.w	(a7)+, (a6)
	move.l	#$7c000002, (a6)
	move.w	$FFFFA300.w, $c00000.l
	cmpi.b	#$2, $FFFFBA7B.w
	bne.b	L_FF3AAE
	subq.w	#$1, $FFFFBA7C.w
	bgt.b	L_FF3AAE
	move.b	#$0, $FFFFBA7B.w
L_FF3AAE:
	subq.w	#$1, $FFFFBA78.w
	bgt.b	L_FF3AE2
	lea.l	$FFFF9200.w, a0
	tst.w	$0(a0)
	beq.b	L_FF3AC4
	move.b	#$1, $FFFFBA7B.w
L_FF3AC4:
	move.w	#$384, $FFFFBA7C.w
	jsr	Random(pc)
	andi.l	#$7fff, d0
	divs.w	#$1000, d0
	swap	d0
	addi.w	#$2000, d0
	move.w	d0, $FFFFBA78.w
L_FF3AE2:
	tst.b	$FFFFBA40.w
	bne.b	L_FF3B66
	subq.w	#$1, $FFFFBA46.w
	bhi.b	L_FF3B2A
	cmpi.w	#$1f, $FFFFBA44.w
	blt.b	L_FF3AFC
	move.w	#$0, $FFFFBA44.w
L_FF3AFC:
	lea.l	PaletteSequence.l, a0
	move.w	$FFFFBA44.w, d0
	add.w	d0, d0
	move.w	(a0, d0.w), $FFFFBA46.w
	addq.w	#$1, $FFFFBA44.w
	lea.l	ObjectAnimationData.l, a1
	lea.l	(a1, d0.w), a2
	adda.w	(a2), a1
	lea.l	$FFFFB620.w, a0
	moveq	#$b, d7
L_FF3B24:
	move.l	(a1)+, (a0)+
	dbra	d7, L_FF3B24
L_FF3B2A:
	subq.w	#$1, $FFFFBA76.w
	bhi.b	L_FF3B66
	cmpi.w	#$2, $FFFFBA74.w
	blt.b	L_FF3B3E
	move.w	#$0, $FFFFBA74.w
L_FF3B3E:
	move.w	#$14, $FFFFBA76.w
	move.w	$FFFFBA74.w, d0
	add.w	d0, d0
	addq.w	#$1, $FFFFBA74.w
	lea.l	PaletteAnimationData.l, a1
	lea.l	(a1, d0.w), a2
	adda.w	(a2), a1
	lea.l	$FFFFB650.w, a0
	moveq	#$3, d7
L_FF3B60:
	move.l	(a1)+, (a0)+
	dbra	d7, L_FF3B60
L_FF3B66:
	lea.l	$c00004.l, a6
	move.l	#$93409400, (a6)
	move.l	#$950096db, (a6)
	move.w	#$977f, (a6)
	move.w	#$c000, (a6)
	move.w	#$80, -(a7)
	move.w	(a7)+, (a6)
	move.l	#$c0000000, (a6)
	move.w	$FFFFB600.w, $c00000.l
	jsr	SoundAndInterruptFunctions.l
	bsr.w	ThankYou_ReleaseZ80
	tst.w	$FFFFBA4C.w
	beq.b	L_FF3BA8
	subq.w	#$1, $FFFFBA4C.w
L_FF3BA8:
	if REGION=USA
	subq.w	#$1, $FFFFBA80.w
	bgt.b	L_FF3BB4
	move.b	#$1, $FFFFBA40.w
	endif
L_FF3BB4:
	addq.w	#$1, $FFFFBA4E.w
	jsr	ThankYou_ReadController(pc)
	movem.l	(a7)+, d0-d7/a0-a6
	rte
; Advance the idle-frame counter when no VDP update is pending.
ThankYou_VIntIdleUpdate:
	addq.l	#$1, $FFFFBA56.w
	move.b	$FFFFBA4B.w, $FFFFBA56.w
	movem.l	(a7)+, d0-d7/a0-a6
	rte
FillLongs:
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
FillObject:
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	move.l	d1, (a1)+
	rts
FillVDP:
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	move.l	d1, (a1)
	rts
CopyLongs:
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	move.l	(a1)+, (a2)+
	rts
CopyLongsFixed:
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	move.l	(a1)+, (a2)
	rts
; Trigger a V-blank service and wait for it to finish.
ThankYou_WaitForVBlank:
L_FF3CDA:
	move.b	#$1, $FFFFBA42.w
	move.w	#$2500, sr
L_FF3CE4:
	tst.b	$FFFFBA42.w
	bne.b	L_FF3CE4
	rts
SetVSRAMMode:
	move.w	#$ff00, $a1201e.l
	rts
Random:
	move.l	d1, -(a7)
	move.l	$FFFFBA52.w, d1
	bne.b	L_FF3D04
	move.l	#$2a6d365a, d1
L_FF3D04:
	move.l	d1, d0
	asl.l	#$2, d1
	add.l	d0, d1
	asl.l	#$3, d1
	add.l	d0, d1
	move.w	d1, d0
	swap	d1
	add.w	d1, d0
	move.w	d0, d1
	swap	d1
	move.l	d1, $FFFFBA52.w
	move.l	(a7)+, d1
	rts
CalcSine:
	addi.w	#$80, d3
	andi.w	#$1ff, d3
	move.w	d3, d4
	btst	#$7, d3
	beq.b	L_FF3D32
	not.w	d4
L_FF3D32:
	andi.w	#$7f, d4
	add.w	d4, d4
	move.w	SineTable(pc, d4.w), d4
	btst	#$8, d3
	beq.b	L_FF3D44
	neg.w	d4
L_FF3D44:
	move.w	d4, d3
	rts
SineTable:
	dc.b	$00
	dc.b	$00,$00,$03,$00,$06,$00,$09,$00,$0C,$00,$0F,$00,$12,$00,$16,$00
	dc.b	$19,$00,$1C,$00,$1F,$00,$22,$00,$25,$00,$28,$00,$2B,$00,$2F,$00
	dc.b	$32,$00,$35,$00,$38,$00,$3B,$00,$3E,$00,$41,$00,$44,$00,$47,$00
	dc.b	$4A,$00,$4D,$00,$50,$00,$53,$00,$56,$00,$59,$00,$5C,$00,$5F,$00
	dc.b	$62,$00,$65,$00,$68,$00,$6A,$00,$6D,$00,$70,$00,$73,$00,$76,$00
	dc.b	$79,$00,$7B,$00,$7E,$00,$81,$00,$84,$00,$86,$00,$89,$00,$8C,$00
	dc.b	$8E,$00,$91,$00,$93,$00,$96,$00,$99,$00,$9B,$00,$9E,$00,$A0,$00
	dc.b	$A2,$00,$A5,$00,$A7,$00,$AA,$00,$AC,$00,$AE,$00,$B1,$00,$B3,$00
	dc.b	$B5,$00,$B7,$00,$B9,$00,$BC,$00,$BE,$00,$C0,$00,$C2,$00,$C4,$00
	dc.b	$C6,$00,$C8,$00,$CA,$00,$CC,$00,$CE,$00,$D0,$00,$D1,$00,$D3,$00
	dc.b	$D5,$00,$D7,$00,$D8,$00,$DA,$00,$DC,$00,$DD,$00,$DF,$00,$E0,$00
	dc.b	$E2,$00,$E3,$00,$E5,$00,$E6,$00,$E7,$00,$E9,$00,$EA,$00,$EB,$00
	dc.b	$EC,$00,$EE,$00,$EF,$00,$F0,$00,$F1,$00,$F2,$00,$F3,$00,$F4,$00
	dc.b	$F5,$00,$F6,$00,$F7,$00,$F7,$00,$F8,$00,$F9,$00,$FA,$00,$FA,$00
	dc.b	$FB,$00,$FB,$00,$FC,$00,$FC,$00,$FD,$00,$FD,$00,$FE,$00,$FE,$00
	dc.b	$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00
; Initialize the active palette and fade it in over successive V-blanks.
ThankYou_FadeInPalettes:
	move.w	#$3f, $FFFFBA5A.w
	moveq	#$0, d0
	lea.l	$FFFFB600.w, a0
	move.b	$FFFFBA5A.w, d0
	adda.w	d0, a0
	moveq	#$0, d1
	move.b	$FFFFBA5B.w, d0
L_FF3E60:
	move.w	d1, (a0)+
	dbra	d0, L_FF3E60
	move.w	#$15, d4
L_FF3E6A:
	move.b	#$a, $FFFFBA42.w
	bsr.w	ThankYou_WaitForVBlank
	bsr.b	ThankYou_AnimatePalette
	dbra	d4, L_FF3E6A
	rts
; Step the active palette toward its target colors.
ThankYou_AnimatePalette:
	moveq	#$0, d0
	lea.l	$FFFFB600.w, a0
	lea.l	$FFFFB680.w, a1
	move.b	$FFFFBA5A.w, d0
	adda.w	d0, a0
	adda.w	d0, a1
	move.b	$FFFFBA5B.w, d0
L_FF3E92:
	bsr.b	ThankYou_StepPaletteEntry
	dbra	d0, L_FF3E92
	bra.b	FadePalette
	dc.b	$70,$00,$41,$F8,$B7,$00,$43,$F8,$B7,$80,$10,$38,$BA,$5A,$D0,$C0
	dc.b	$D2,$C0,$10,$38,$BA,$5B,$61,$06,$51,$C8,$FF,$FC
FadePalette:
	rts
; Move one palette entry toward its target color values.
ThankYou_StepPaletteEntry:
	move.w	(a1)+, d2
	move.w	(a0), d3
	cmp.w	d2, d3
	beq.b	L_FF3EE0
	move.w	d3, d1
	addi.w	#$200, d1
	cmp.w	d2, d1
	bhi.b	L_FF3ECE
	move.w	d1, (a0)+
	rts
L_FF3ECE:
	move.w	d3, d1
	addi.w	#$20, d1
	cmp.w	d2, d1
	bhi.b	L_FF3EDC
	move.w	d1, (a0)+
	rts
L_FF3EDC:
	addq.w	#$2, (a0)+
	rts
L_FF3EE0:
	addq.w	#$2, a0
	rts
; Fade the initialized work palettes down to black.
ThankYou_FadeInitializedPalettes:
	move.w	#$3f, $FFFFBA5A.w
	move.w	#$15, d4
L_FF3EEE:
	move.b	#$a, $FFFFBA42.w
	bsr.w	ThankYou_WaitForVBlank
	bsr.b	ThankYou_FadePalettesToBlack
	dbra	d4, L_FF3EEE
	rts
; Fade both work palettes to black.
ThankYou_FadePalettesToBlack:
	moveq	#$0, d0
	lea.l	$FFFFB600.w, a0
	move.b	$FFFFBA5A.w, d0
	adda.w	d0, a0
	move.b	$FFFFBA5B.w, d0
L_FF3F10:
	bsr.b	ThankYou_DarkenPaletteEntry
	dbra	d0, L_FF3F10
	moveq	#$0, d0
	lea.l	$FFFFB700.w, a0
	move.b	$FFFFBA5A.w, d0
	adda.w	d0, a0
	move.b	$FFFFBA5B.w, d0
L_FF3F26:
	bsr.b	ThankYou_DarkenPaletteEntry
	dbra	d0, L_FF3F26
	rts
; Decrease one palette entry's RGB channels.
ThankYou_DarkenPaletteEntry:
	move.w	(a0), d2
	beq.b	L_FF3F5A
	move.w	d2, d1
	andi.w	#$e, d1
	beq.b	L_FF3F3E
	subq.w	#$2, (a0)+
	rts
L_FF3F3E:
	move.w	d2, d1
	andi.w	#$e0, d1
	beq.b	L_FF3F4C
	subi.w	#$20, (a0)+
	rts
L_FF3F4C:
	move.w	d2, d1
	andi.w	#$e00, d1
	beq.b	L_FF3F5A
	subi.w	#$200, (a0)+
	rts
L_FF3F5A:
	addq.w	#$2, a0
	rts
; Load up to four Nemesis graphics streams into the VDP.
ThankYou_LoadNemesisGraphics:
	lea.l	$c00004.l, a5
	moveq	#$3, d2
ThankYou_LoadNemesisGraphicsLoop:
	moveq	#$0, d1
	move.b	d0, d1
	beq.b	ThankYou_LoadNemesisGraphicsNext
	lsl.w	#$3, d1
	lea.l	ThankYou_NemesisStreamTable(pc), a0
	move.l	-$8(a0, d1.w), (a5)
	movea.l	-$4(a0, d1.w), a0
	jsr	ThankYou_DecodeNemesisToVdp(pc)
ThankYou_LoadNemesisGraphicsNext:
	ror.l	#$8, d0
	dbra	d2, ThankYou_LoadNemesisGraphicsLoop
	rts
; Nemesis stream descriptors: VDP destination followed by source pointer.
ThankYou_NemesisStreamTable:
	dc.b	$69
	dc.b	$20,$00,$00,$00,$21,$00,$00,$44,$E0,$00,$01,$00,$21,$16,$F0,$78
	dc.b	$E0,$00,$01,$00,$21,$2E,$70,$57,$20,$00,$02,$00,$21,$3C,$F0,$70
	dc.b	$A0,$00,$02,$00,$21,$57,$C4
; Decode one Nemesis stream directly into VDP tiles.
ThankYou_DecodeNemesisToVdp:
	movem.l	d0-d7/a0-a1/a3-a5, -(a7)
	lea.l	ThankYou_WriteNemesisTile.l, a3
	lea.l	$c00000.l, a4
	bra.b	ThankYou_DecodeNemesisStream
	dc.l	$48E7FFDC
	dc.l	$47F900FF
	dc.w	ThankYou_WriteNemesisTileAdvance-$FF0000
; Initialize the Nemesis code table and bitstream state.
ThankYou_DecodeNemesisStream:
	lea.l	$FFFFA600.w, a1
	move.w	(a0)+, d2
	lsl.w	#$1, d2
	bcc.b	ThankYou_DecodeNemesisCodeTableReady
	adda.w	#$a, a3
ThankYou_DecodeNemesisCodeTableReady:
	lsl.w	#$2, d2
	movea.w	d2, a5
	moveq	#$8, d3
	moveq	#$0, d2
	moveq	#$0, d4
	jsr	ThankYou_ReadNemesisByte(pc)
	move.b	(a0)+, d5
	asl.w	#$8, d5
	move.b	(a0)+, d5
	move.w	#$10, d6
	bsr.b	ThankYou_DecodeNemesisCode
	nop
	nop
	nop
	nop
	movem.l	(a7)+, d0-d7/a0-a1/a3-a5
	rts
; Decode one Nemesis codeword and emit its pixel run.
ThankYou_DecodeNemesisCode:
	move.w	d6, d7
	subq.w	#$8, d7
	move.w	d5, d1
	lsr.w	d7, d1
	cmpi.b	#$fc, d1
	bcc.b	ThankYou_DecodeNemesisLongCode
	andi.w	#$ff, d1
	add.w	d1, d1
	move.b	(a1, d1.w), d0
	ext.w	d0
	sub.w	d0, d6
	cmpi.w	#$9, d6
	bcc.b	ThankYou_DecodeNemesisRunLength
	addq.w	#$8, d6
	asl.w	#$8, d5
	move.b	(a0)+, d5
; Extract the run length and pixel value from a short codeword.
ThankYou_DecodeNemesisRunLength:
	move.b	$1(a1, d1.w), d1
	move.w	d1, d0
	andi.w	#$f, d1
	andi.w	#$f0, d0
; Append decoded pixels to the current four-bit tile word.
ThankYou_DecodeNemesisBuildRun:
	lsr.w	#$4, d0
ThankYou_DecodeNemesisAppendPixel:
	lsl.l	#$4, d4
	or.b	d1, d4
	subq.w	#$1, d3
	bne.b	ThankYou_DecodeNemesisContinueRun
	jmp	(a3)
; Reset the pixel accumulator after one tile has been emitted.
ThankYou_DecodeNemesisResetRun:
	moveq	#$0, d4
	moveq	#$8, d3
ThankYou_DecodeNemesisContinueRun:
	dbra	d0, ThankYou_DecodeNemesisAppendPixel
	bra.b	ThankYou_DecodeNemesisCode
; Decode the alternate long Nemesis codeword form.
ThankYou_DecodeNemesisLongCode:
	subq.w	#$6, d6
	cmpi.w	#$9, d6
	bcc.b	ThankYou_DecodeNemesisLongRun
	addq.w	#$8, d6
	asl.w	#$8, d5
	move.b	(a0)+, d5
ThankYou_DecodeNemesisLongRun:
	subq.w	#$7, d6
	move.w	d5, d1
	lsr.w	d6, d1
	move.w	d1, d0
	andi.w	#$f, d1
	andi.w	#$70, d0
	cmpi.w	#$9, d6
	bcc.b	ThankYou_DecodeNemesisBuildRun
	addq.w	#$8, d6
	asl.w	#$8, d5
	move.b	(a0)+, d5
	bra.b	ThankYou_DecodeNemesisBuildRun
; Emit a decoded Nemesis tile without advancing the VDP address.
ThankYou_WriteNemesisTile:
	dc.b	$28
	dc.b	$84,$53,$4D,$38,$0D,$66,$C2,$4E,$75
; Emit a decoded Nemesis tile by XORing the current VDP word.
ThankYou_WriteNemesisXorTile:
	eor.l	d4, d2
	move.l	d2, (a4)
	subq.w	#$1, a5
	move.w	a5, d4
	bne.b	ThankYou_DecodeNemesisResetRun
	rts
; Emit a decoded Nemesis tile and advance the VDP address.
ThankYou_WriteNemesisTileAdvance:
	move.l	d4, (a4)+
	subq.w	#$1, a5
	move.w	a5, d4
	bne.b	ThankYou_DecodeNemesisResetRun
	rts
; Emit a decoded Nemesis tile by XORing and advancing the VDP word.
ThankYou_WriteNemesisXorTileAdvance:
	dc.l	$B98228C2
	dc.l	$534D380D
	dc.l	$66A04E75
; Read one Nemesis control byte and update the decode table.
ThankYou_ReadNemesisByte:
	move.b	(a0)+, d0
ThankYou_ReadNemesisTableByte:
	cmpi.b	#$ff, d0
	bne.b	ThankYou_ReadNemesisTableHeader
	rts
ThankYou_ReadNemesisTableHeader:
	move.w	d0, d7
ThankYou_ReadNemesisTableEntry:
	move.b	(a0)+, d0
	cmpi.b	#$80, d0
	bcc.b	ThankYou_ReadNemesisTableByte
	move.b	d0, d1
	andi.w	#$f, d7
	andi.w	#$70, d1
	or.w	d1, d7
	andi.w	#$f, d0
	move.b	d0, d1
	lsl.w	#$8, d1
	or.w	d1, d7
	moveq	#$8, d1
	sub.w	d0, d1
	bne.b	ThankYou_ReadNemesisTableExpand
	move.b	(a0)+, d0
	add.w	d0, d0
	move.w	d7, (a1, d0.w)
	bra.b	ThankYou_ReadNemesisTableEntry
; Expand a variable-length code across its lookup-table slots.
ThankYou_ReadNemesisTableExpand:
	move.b	(a0)+, d0
	lsl.w	d1, d0
	add.w	d0, d0
	moveq	#$1, d5
	lsl.w	d1, d5
	subq.w	#$1, d5
	; Fill each table slot covered by this code length.
ThankYou_ReadNemesisTableExpandLoop:
	move.w	d7, (a1, d0.w)
	addq.w	#$2, d0
	dbra	d5, ThankYou_ReadNemesisTableExpandLoop
	bra.b	ThankYou_ReadNemesisTableEntry
; Decode an Enigma stream into VDP tiles.
ThankYou_DecodeEnigmaToVdp:
	andi.l	#$ffff, d0
	mulu.w	#$e, d0
	lea.l	ThankYou_EnigmaStreamTable.l, a1
	adda.w	d0, a1
	movea.l	(a1)+, a0
	move.w	(a1)+, d0
	move.l	a1, -(a7)
	lea.l	$FFFFA800.w, a1
	bsr.w	ThankYou_DecodeEnigmaToRam
	movea.l	(a7)+, a1
	move.w	(a1)+, d3
	move.w	(a1)+, d2
	move.l	(a1), d0
	lea.l	$FFFFA800.w, a0
	movea.l	#$c00000, a1
; Upload decoded Enigma tile rows to the VDP.
ThankYou_UploadEnigmaTilesLoop:
	move.l	d0, $c00004.l
	move.w	d3, d1
ThankYou_UploadEnigmaTileWords:
	move.w	(a0)+, (a1)
	dbra	d1, ThankYou_UploadEnigmaTileWords
	addi.l	#$800000, d0
	dbra	d2, ThankYou_UploadEnigmaTilesLoop
	rts
; Enigma stream descriptors: source pointer, dimensions, and VDP base.
ThankYou_EnigmaStreamTable:
	dc.b	$00
	dc.b	$21,$0A,$1C,$C0,$01,$00,$27,$00,$1B,$40,$00,$00,$03,$00,$21,$15
	dc.b	$40,$20,$9B,$00,$27,$00,$1B,$60,$00,$00,$03
; Decode Enigma words into the caller-provided RAM buffer.
ThankYou_DecodeEnigmaToRam:
	nop
	nop
	movem.l	d0-d7/a1-a5, -(a7)
	movea.w	d0, a3
	move.b	(a0)+, d0
	ext.w	d0
	movea.w	d0, a5
	move.b	(a0)+, d4
	lsl.b	#$3, d4
	movea.w	(a0)+, a2
	adda.w	a3, a2
	movea.w	(a0)+, a4
	adda.w	a3, a4
	move.b	(a0)+, d5
	asl.w	#$8, d5
	move.b	(a0)+, d5
	moveq	#$10, d6
; Decode the next Enigma word and dispatch its command.
ThankYou_DecodeEnigmaLoop:
	moveq	#$7, d0
	move.w	d6, d7
	sub.w	d0, d7
	move.w	d5, d1
	lsr.w	d7, d1
	andi.w	#$7f, d1
	move.w	d1, d2
	cmpi.w	#$40, d1
	bcc.b	ThankYou_DecodeEnigmaCodeReady
	moveq	#$6, d0
	lsr.w	#$1, d2

ThankYou_DecodeEnigmaCodeReady:
	bsr.w	ThankYou_RefillEnigmaBits
	andi.w	#$f, d2
	lsr.w	#$4, d1
	add.w	d1, d1
	jmp	ThankYou_DecodeEnigmaDispatchTable(pc, d1.w)
; Repeat one decoded word across the requested run length.
ThankYou_DecodeEnigmaRepeatWord:
	move.w	a2, (a1)+
	addq.w	#$1, a2
	dbra	d2, ThankYou_DecodeEnigmaRepeatWord
	bra.b	ThankYou_DecodeEnigmaLoop
	dc.b	$32,$CC,$51,$CA,$FF,$FC,$60,$C4,$61,$00,$00,$60,$32,$C1,$51,$CA
	dc.b	$FF,$FC,$60,$B8,$61,$00,$00,$54,$32,$C1,$52,$41,$51,$CA,$FF,$FA
	dc.b	$60,$AA,$61,$00,$00,$46,$32,$C1,$53,$41,$51,$CA,$FF,$FA,$60,$9C
	dc.b	$0C,$42,$00,$0F,$67,$1C,$61,$00,$00,$32,$32,$C1,$51,$CA,$FF,$F8
	dc.b	$60,$8A
; Enigma command jump table (encoded branch handlers follow).
ThankYou_DecodeEnigmaDispatchTable:
	bra.b	ThankYou_DecodeEnigmaRepeatWord
	dc.b	$60,$B0,$60,$B8,$60,$B6,$60,$BC,$60,$C6,$60,$D2,$60,$DE,$53,$48
	dc.b	$0C,$46,$00,$10,$66,$02,$53,$48,$30,$08,$E2,$48,$64,$02,$52,$48
	dc.b	$4C,$DF,$3E,$FF,$4E,$75,$36,$0B,$12,$04,$D2,$01,$64,$0A,$53,$46
	dc.b	$0D,$05,$67,$04,$00,$43,$80,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05
	dc.b	$67,$04,$06,$43,$40,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05,$67,$04
	dc.b	$06,$43,$20,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05,$67,$04,$00,$43
	dc.b	$10,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05,$67,$04,$00,$43,$08,$00
	dc.b	$32,$05,$3E,$06,$9E,$4D,$64,$28,$3C,$07,$06,$46,$00,$10,$44,$47
	dc.b	$EF,$69,$1A,$10,$EF,$3D,$DE,$47,$CA,$7B,$70,$2A,$D2,$45,$30,$0D
	dc.b	$D0,$40,$C2,$7B,$00,$20,$D2,$43,$1A,$18,$E1,$4D,$1A,$18,$4E,$75
	dc.b	$67,$10,$EE,$69,$30,$0D,$D0,$40,$C2,$7B,$00,$0A,$D2,$43,$30,$0D
	dc.b	$60,$24,$7C,$10,$60,$D8,$00,$01,$00,$03,$00,$07,$00,$0F,$00,$1F
	dc.b	$00,$3F,$00,$7F,$00,$FF,$01,$FF,$03,$FF,$07,$FF,$0F,$FF,$1F,$FF
	dc.b	$3F,$FF,$7F,$FF,$FF,$FF
; Refill the Enigma decoder bit buffer when fewer than nine bits remain.
ThankYou_RefillEnigmaBits:
	sub.w	d0, d6
	cmpi.w	#$9, d6
	bcc.b	ThankYou_RefillEnigmaBitsDone
	addq.w	#$8, d6
	asl.w	#$8, d5
	move.b	(a0)+, d5
ThankYou_RefillEnigmaBitsDone:
	rts
; Find the first empty object slot in the secondary object pool.
ThankYou_FindFirstEmptyObject:
	lea.l	$FFFF92C0.w, a1
	move.w	#$3c, d0
ThankYou_FindFirstEmptyObjectLoop:
	tst.w	(a1)
	beq.b	ThankYou_FindFirstEmptyObjectDone
	lea.l	$40(a1), a1
	dbra	d0, ThankYou_FindFirstEmptyObjectLoop
ThankYou_FindFirstEmptyObjectDone:
	rts
; Find the first active object slot in the primary object pool.
ThankYou_FindFirstActiveObject:
	lea.l	$FFFF9200.w, a1
	move.w	#$3c, d0
ThankYou_FindFirstActiveObjectLoop:
	tst.w	(a1)
	bne.b	ThankYou_FindFirstActiveObjectDone
	lea.l	$40(a1), a1
	dbra	d0, ThankYou_FindFirstActiveObjectLoop
ThankYou_FindFirstActiveObjectDone:
	rts
; Rebuild the per-priority linked lists for active objects.
ThankYou_RebuildObjectLists:
	lea.l	$FFFF9200.w, a0
	lea.l	$FFFFBA00.w, a1
	move.w	#$b800, $0(a1)
	move.w	#$b880, $2(a1)
	move.w	#$b900, $4(a1)
	move.w	#$b980, $6(a1)
	move.w	#$0, $FFFFB800.w
	move.w	#$0, $FFFFB880.w
	move.w	#$0, $FFFFB900.w
	move.w	#$0, $FFFFB980.w
	moveq	#$3f, d7
ThankYou_RebuildObjectListsLoop:
	tst.w	$0(a0)
	beq.b	ThankYou_RebuildObjectListsNext
	moveq	#$0, d0
	move.b	$34(a0), d0
	add.w	d0, d0
	lea.l	(a1, d0.w), a2
	movea.w	(a2), a3
	move.w	a0, (a3)+
	move.w	#$0, (a3)
	move.w	a3, (a2)
ThankYou_RebuildObjectListsNext:
	lea.l	$40(a0), a0
	dbra	d7, ThankYou_RebuildObjectListsLoop
	rts
; Update active objects, rebuild their lists, and queue their sprites.
ThankYou_UpdateObjects:
	lea.l	$FFFF9200.w, a0
	bsr.b	ThankYou_ProcessActiveObjects
	bsr.w	ThankYou_RebuildObjectLists
	bsr.w	ThankYou_BuildSpriteQueue
	rts
; Process each occupied object slot.
ThankYou_ProcessActiveObjects:
	moveq	#$3f, d7
ThankYou_ProcessActiveObjectsLoop:
	move.w	(a0), d0
	beq.b	ThankYou_ProcessActiveObjectsNext
	movem.l	d7/a0, -(a7)
	bsr.b	ThankYou_DispatchObjectHandler
	movem.l	(a7)+, d7/a0
ThankYou_ProcessActiveObjectsNext:
	lea.l	$40(a0), a0
	dbra	d7, ThankYou_ProcessActiveObjectsLoop
	rts
; Dispatch an object's handler and clear it when requested.
ThankYou_DispatchObjectHandler:
	add.w	d0, d0
	add.w	d0, d0
	movea.l	ObjectHandlerPointers-4(pc, d0.w), a1
	jsr	(a1)
	btst.b	#$4, $2e(a0)
	beq.b	ThankYou_ObjectProcessEnd
	bsr.w	ThankYou_ClearObject
ThankYou_ObjectProcessEnd:
	rts
ObjectHandlerPointers:
	if REGION=USA
	dc.b	$00,$FF,$47,$00,$00,$FF,$4C,$3C,$00,$FF,$52,$9E,$00,$FF,$5A,$74
	dc.b	$00,$FF,$58,$0E,$00,$FF,$59,$32,$00,$FF,$57,$8A,$00,$FF,$5A,$EA
	dc.b	$00,$FF,$5B,$76,$00,$FF,$59,$C4,$00,$FF,$58,$A0,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA
	dc.b	$00,$FF,$44,$AA,$00,$FF,$44,$AA,$00,$FF,$44,$AA,$31,$7C,$00,$00
	else
	dc.l	$00FF4700-ThankYouFullShift
	dc.l	$00FF4C3C-ThankYouFullShift
	dc.l	$00FF529E-ThankYouFullShift
	dc.l	$00FF5A74-ThankYouFullShift
	dc.l	$00FF580E-ThankYouFullShift
	dc.l	$00FF5932-ThankYouFullShift
	dc.l	$00FF578A-ThankYouFullShift
	dc.l	$00FF5AEA-ThankYouFullShift
	dc.l	$00FF5B76-ThankYouFullShift
	dc.l	$00FF59C4-ThankYouFullShift
	dc.l	$00FF58A0-ThankYouFullShift
	dcb.l	$34, $00FF44AA-ThankYouFullShift
	dc.w	$317C,$0000
	endif
	dc.b	$00,$00,$4E,$75
; Build the VDP sprite queue from the priority-linked object lists.
ThankYou_BuildSpriteQueue:
	lea.l	$FFFFA300.w, a1
	clr.l	(a1)+
	clr.l	(a1)+
	lea.l	$FFFFA300.w, a1
	moveq	#$0, d5
	lea.l	$FFFFBA00.w, a3
	move.w	#$b800, $0(a3)
	move.w	#$b880, $2(a3)
	move.w	#$b900, $4(a3)
	move.w	#$b980, $6(a3)
	moveq	#$0, d3
	moveq	#$3, d7
ThankYou_BuildSpriteQueuePriorityLoop:
	move.w	d3, d0
	add.w	d0, d0
	lea.l	(a3, d0.w), a4
	movea.w	(a4), a4
ThankYou_BuildSpriteQueueObjectLoop:
	tst.w	(a4)
	movea.w	(a4)+, a0
	bne.b	ThankYou_BuildSpriteQueueObjectFound
	addq.w	#$1, d3
	dbra	d7, ThankYou_BuildSpriteQueuePriorityLoop
	bra.w	ThankYou_BuildSpriteQueueEnd
ThankYou_BuildSpriteQueueObjectFound:
	tst.w	$0(a0)
	beq.w	ThankYou_BuildSpriteQueueNextObject
	movea.l	$2a(a0), a2
	bsr.w	ThankYou_AdvanceObjectAnimation
	move.w	$26(a0), d0
	add.w	d0, d0
	add.w	d0, d0
	adda.w	$4(a2, d0.w), a2
	move.w	(a2)+, d6
ThankYou_BuildSpriteQueueSpriteLoop:
	moveq	#$0, d4
	move.w	$4(a0), d0
	btst.b	#$7, $2e(a0)
	beq.b	ThankYou_BuildSpriteQueueNormalX
	sub.w	$6(a2), d0
	bset	#$b, d4
	bra.b	ThankYou_BuildSpriteQueueXReady
ThankYou_BuildSpriteQueueNormalX:
	sub.w	$4(a2), d0
ThankYou_BuildSpriteQueueXReady:
	addi.w	#$80, d0
	move.w	d0, $6(a1)
	move.w	$8(a0), d0
	btst.b	#$6, $2e(a0)
	beq.b	ThankYou_BuildSpriteQueueNormalY
	sub.w	$a(a2), d0
	bset	#$c, d4
	bra.b	ThankYou_BuildSpriteQueueYReady
ThankYou_BuildSpriteQueueNormalY:
	sub.w	$8(a2), d0
ThankYou_BuildSpriteQueueYReady:
	addi.w	#$80, d0
	move.w	d0, $0(a1)
	addq.w	#$1, d5
	move.w	d5, d0
	or.w	$0(a2), d0
	move.w	d0, $2(a1)
	move.w	$28(a0), d0
	btst.b	#$5, $2e(a0)
	beq.b	ThankYou_BuildSpriteQueueAttributesReady
	bset	#$f, d0
ThankYou_BuildSpriteQueueAttributesReady:
	add.w	$2(a2), d0
	eor.w	d4, d0
	move.w	d0, $4(a1)
	addq.l	#$8, a1
	adda.w	#$c, a2
	dbra	d6, ThankYou_BuildSpriteQueueSpriteLoop
ThankYou_BuildSpriteQueueNextObject:
	nop
	nop
	nop
	bra.w	ThankYou_BuildSpriteQueueObjectLoop
ThankYou_BuildSpriteQueueEnd:
	tst.w	d5
	beq.b	ThankYou_BuildSpriteQueueDone
	move.b	#$0, -$5(a1)
ThankYou_BuildSpriteQueueDone:
	rts
; Advance one object's animation frame and timer.
ThankYou_AdvanceObjectAnimation:
	subq.w	#$1, $24(a0)
	bhi.b	ThankYou_AdvanceObjectAnimationDone
	move.w	$26(a0), d0
	addq.w	#$1, d0
	cmp.w	(a2), d0
	bcs.b	ThankYou_AdvanceObjectAnimationFrameReady
	moveq	#$0, d0
ThankYou_AdvanceObjectAnimationFrameReady:
	move.w	d0, $26(a0)
	add.w	d0, d0
	add.w	d0, d0
	move.w	$2(a2, d0.w), $24(a0)
ThankYou_AdvanceObjectAnimationDone:
	rts
; Clear the current object slot through the shared object filler.
ThankYou_ClearObject:
	movea.l	a0, a1
	moveq	#$0, d1
	bra.w	FillObject
	dc.b	$43,$F8,$92,$00,$72,$00,$70,$3F,$4E,$BA,$F6,$1A,$51,$C8,$FF,$FA
	dc.b	$4E,$75
UpdateObjectTimers:
	lea.l	$FFFFBA64.w, a2
	moveq	#$7, d5
	cmpi.b	#$2, $FFFFBA7B.w
	bne.b	L_FF45F0
	subq.w	#$1, d5
L_FF45F0:
	subq.w	#$1, (a2)
	bcs.b	L_FF45FE
	adda.w	#$2, a2
	dbra	d5, L_FF45F0
	rts
L_FF45FE:
	move.w	d5, d0
	add.w	d0, d0
	add.w	d0, d0
	cmpi.b	#$2, $FFFFBA7B.w
	beq.b	L_FF4612
	lea.l	L_FF4640(pc, d0.w), a1
	bra.b	L_FF4616
L_FF4612:
	lea.l	L_FF4660(pc, d0.w), a1
L_FF4616:
	move.w	(a1)+, (a2)
	movem.l	d5/a1-a2, -(a7)
	jsr	Random(pc)
	movem.l	(a7)+, d5/a1-a2
	andi.l	#$ffff, d0
	moveq	#$0, d1
	move.w	(a1), d1
	divs.w	d1, d0
	swap	d0
	add.w	d0, (a2)
	move.w	d5, d0
	add.w	d0, d0
	move.w	ObjectJumpTable(pc, d0.w), d0
	jmp	ObjectJumpTable(pc, d0.w)
L_FF4640:
	dc.b	$00
	dc.b	$78,$00,$B4,$00,$B4,$01,$2C,$00,$F0,$02,$58,$02,$D0,$07,$08,$03
	dc.b	$48,$08,$E8,$02,$58,$08,$70,$00,$F0,$02,$58,$01,$2C,$02,$58
L_FF4660:
	dc.b	$00
	dc.b	$0A,$00,$19,$00,$0F,$00,$14,$00,$0A,$00,$19,$00,$14,$00,$32,$00
	dc.b	$1E,$00,$3C,$00,$14,$00,$3C,$00,$28,$00,$46,$03,$84,$05,$DC
ObjectJumpTable:
	ori.b	#$56, (a6)+
	ori.w	#$2c, -(a4)
	dc.l	$003A0048
	dc.l	$00720012
	dc.l	$4E7543F8
	dc.l	$9200337C
	dc.l	$00010000
	dc.l	$4E756100
	dc.l	$FC406606
	dc.l	$337C0004
	dc.l	$00004E75
	dc.l	$6100FC32
	dc.l	$6606337C
	dc.l	$00050000
	dc.l	$4E756100
	dc.l	$FC246606
	dc.l	$337C000B
	dc.l	$00004E75
	dc.l	$6100FC16
	dc.l	$6606337C
	dc.l	$00060000
	dc.l	$4E756100
	dc.l	$FC086606
	dc.l	$337C0008
	dc.l	$00004E75
	dc.l	$6100FBFA
	dc.l	$6606337C
	dc.l	$00090000
	dc.l	$4E756100
	dc.l	$FBEC6606
	dc.l	$337C000A
	dc.l	$00004E75
	dc.l	$4A38BA7B
	dc.l	$670608E8
	dc.l	$0002002E
	dc.w	$43F9
	dc.l	$00FF4718-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.l	$001C00BC
	dc.l	$01380222
	dc.l	$027202B8
	dc.l	$02F20332
	dc.l	$037203B8
	dc.l	$0420043E
	dc.l	$04B804BE
	dc.l	$4EBAF5C0
	dc.l	$02400001
	dc.l	$6716317C
	dc.l	$01480004
	dc.l	$217CFFFD
	dc.l	$0000000C
	dc.l	$08E80007
	dc.l	$002E6014
	dc.l	$317C01F0
	dc.l	$0004217C
	dc.l	$00030000
	dc.l	$000C08A8
	dc.l	$0007002E
	dc.l	$317C008C
	dc.l	$0008217C
	dcb.b	$5, 0
	dc.b	$10,$31,$7C,$00,$00,$00,$1C,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$14,$21,$7C,$00,$00,$00,$00,$00,$18,$31,$7C,$62,$27,$00,$28,$11
	dc.b	$7C,$00,$01,$00,$34,$43,$FA,$17,$E0,$21,$49,$00,$2A,$31,$69,$00
	dc.b	$02,$00,$24,$31,$7C,$00,$00,$00,$26,$4E,$BA,$F5,$42,$02,$80,$00
	dc.b	$00,$7F,$FF,$81,$FC,$00,$80,$48,$40,$31,$40,$00,$22,$06,$68,$00
	dc.b	$80,$00,$22,$31,$7C,$00,$02,$00,$02,$4E,$75,$61,$00,$15,$54,$21
	dc.b	$7C,$00,$03,$00,$00,$00,$0C,$08,$28,$00,$07,$00,$2E,$67,$04,$44
	dc.b	$A8,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$00,$00,$00
	dc.b	$1C,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$14,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$18,$43,$FA,$17,$6E,$21,$49,$00,$2A,$31
	dc.b	$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$4E,$BA,$F4,$D0,$02
	dc.b	$80,$00,$00,$7F,$FF,$81,$FC,$01,$00,$48,$40,$31,$40,$00,$22,$06
	dc.b	$68,$00,$40,$00,$22,$43,$F8,$92,$80,$33,$7C,$00,$03,$00,$00,$31
	dc.b	$7C,$00,$02,$00,$02,$4E,$75,$20,$28,$00,$0C,$D1,$A8,$00,$04,$20
	dc.b	$28,$00,$10,$D1,$A8,$00,$08,$08,$28,$00,$02,$00,$2E,$67,$08,$31
	dc.b	$7C,$00,$0B,$00,$02,$60,$78,$0C,$68,$01,$78,$00,$04,$6D,$16,$0C
	dc.b	$68,$01,$88,$00,$04,$6E,$0E,$31,$7C,$00,$80,$00,$38,$31,$7C,$00
	dc.b	$0C,$00,$02,$60,$5A,$4E,$BA,$F4,$66,$02,$80,$00,$00,$7F,$FF,$81
	dc.b	$FC,$06,$00,$48,$40,$4A,$40,$60,$08,$31,$7C,$00,$0D,$00,$02,$60
	dc.b	$3E,$4E,$BA,$F4,$4A,$02,$80,$00,$00,$7F,$FF,$81,$FC,$02,$00,$48
	dc.b	$40,$4A,$40,$66,$08,$31,$7C,$00,$09,$00,$02,$60,$22,$4D,$F8,$92
	dc.b	$80,$61,$00,$00,$1E,$67,$06,$31,$7C,$00,$03,$00,$02,$53,$68,$00
	dc.b	$22,$6E,$0C,$61,$00,$14,$C8,$67,$06,$31,$7C,$00,$03,$00,$02,$4E
	dc.b	$75,$0C,$6E,$00,$02,$00,$02,$6D,$44,$0C,$6E,$00,$04,$00,$02,$6E
	dc.b	$3C,$02,$68,$01,$FF,$00,$04,$02,$6E,$01,$FF,$00,$04,$08,$28,$00
	dc.b	$07,$00,$0C,$67,$0A,$08,$2E,$00,$07,$00,$0C,$66,$20,$60,$08,$08
	dc.b	$2E,$00,$07,$00,$0C,$67,$16,$3A,$2E,$00,$04,$9A,$68,$00,$04,$6C
	dc.b	$02,$44,$45,$0C,$45,$00,$08,$6E,$04,$70,$01,$4E,$75,$70,$00,$4E
	dc.b	$75,$61,$00,$13,$EE,$4A,$A8,$00,$0C,$6C,$0E,$31,$7C,$28,$00,$00
	dc.b	$1C,$08,$A8,$00,$07,$00,$2E,$60,$0C,$31,$7C,$D8,$00,$00,$1C,$08
	dc.b	$E8,$00,$07,$00,$2E,$43,$FA,$17,$66,$21,$49,$00,$2A,$31,$69,$00
	dc.b	$02,$00,$24,$31,$7C,$00,$00,$00,$26,$61,$00,$14,$72,$66,$0A,$10
	dc.b	$3C,$00,$90,$4E,$B9
	dc.l	$00FF39FE-ThankYouEarlyShift
	dc.b	$31,$7C,$00,$04,$00,$02,$4E
	dc.b	$75,$61,$00,$13,$70,$0C,$68,$00,$05,$00,$26,$6D,$38,$4D,$F8,$92
	dc.b	$80,$0C,$6E,$00,$02,$00,$02,$66,$08,$31,$7C,$00,$01,$00,$02,$60
	dc.b	$24,$61,$00,$13,$A2,$4E,$71,$4E,$71,$4E,$71,$66,$0A,$61,$00,$13
	dc.b	$82,$0C,$45,$00,$18,$6E,$08,$31,$7C,$00,$09,$00,$02,$60,$06,$31
	dc.b	$7C,$00,$05,$00,$02,$4E,$75,$21,$7C,$00,$00,$00,$00,$00,$0C,$43
	dc.b	$FA,$15,$28,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00
	dc.b	$00,$00,$26,$31,$7C,$00,$7F,$00,$22,$11,$7C,$00,$00,$00,$37,$43
	dc.b	$F8,$92,$40,$33,$7C,$00,$02,$00,$00,$31,$7C,$00,$06,$00,$02,$4E
	dc.b	$75,$4D,$F8,$92,$80,$61,$00,$13,$2A,$53,$68,$00,$22,$6C,$30,$4A
	dc.b	$28,$00,$37,$67,$10,$4B,$F8,$92,$40,$08,$AD,$00,$02,$00,$2E,$31
	dc.b	$7C,$00,$07,$00,$02,$43,$FA,$14,$F2,$21,$49,$00,$2A,$31,$69,$00
	dc.b	$02,$00,$24,$31,$7C,$00,$60,$00,$22,$11,$7C,$00,$01,$00,$37,$4E
	dc.b	$75,$61,$00,$12,$DE,$11,$7C,$00,$00,$00,$37,$43,$FA,$14,$EC,$21
	dc.b	$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$4E
	dc.b	$BA,$F2,$8C,$02,$80,$00,$00,$7F,$FF,$81,$FC,$00,$7F,$48,$40,$31
	dc.b	$40,$00,$22,$06,$68,$00,$7F,$00,$22,$31,$7C,$00,$08,$00,$02,$4E
	dc.b	$75,$4B,$F8,$92,$40,$4D,$F8,$92,$80,$02,$6E,$01,$FF,$00,$04,$61
	dc.b	$00,$12,$A0,$67,$08,$08,$E8,$00,$07,$00,$2E,$60,$06,$08,$A8,$00
	dc.b	$07,$00,$2E,$08,$AE,$00,$02,$00,$2E,$0C,$45,$00,$08,$6E,$02,$60
	dc.b	$0E,$53,$68,$00,$22,$6E,$0E,$31,$7C,$00,$09,$00,$02,$60,$06,$31
	dc.b	$7C,$00,$01,$00,$02,$4E,$75,$61,$00,$12,$58,$21,$7C,$00,$02,$00
	dc.b	$00,$00,$0C,$08,$28,$00,$07,$00,$2E,$67,$04,$44,$A8,$00,$0C,$21
	dc.b	$7C,$FF,$FA,$00,$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$14,$31,$7C,$40,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43
	dc.b	$FA,$16,$52,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00
	dc.b	$00,$00,$26,$61,$00,$12,$C4,$66,$0A,$10,$3C,$00,$92,$4E,$B9
	dc.l	$00FF39FE-ThankYouEarlyShift
	dc.b	$31,$7C,$00,$0A,$00,$02,$4E,$75,$61,$00,$11,$C2,$0C
	dc.b	$68,$00,$8C,$00,$08,$6D,$0E,$21,$7C,$00,$00,$00,$00,$00,$18,$31
	dc.b	$7C,$00,$01,$00,$02,$4E,$71,$4E,$75,$61,$00,$12,$A2,$4A,$38,$BA
	dc.b	$7B,$67,$00,$00,$6E,$4B,$F8,$92,$40,$4D,$F8,$92,$80,$4A,$A8,$00
	dc.b	$0C,$66,$00,$00,$5E,$4A,$6D,$00,$02,$67,$12,$0C,$6D,$00,$0D,$00
	dc.b	$02,$66,$00,$00,$4E,$4A,$AD,$00,$0C,$66,$00,$00,$46,$4A,$6E,$00
	dc.b	$02,$67,$12,$0C,$6E,$00,$0D,$00,$02,$66,$00,$00,$36,$4A,$AE,$00
	dc.b	$0C,$66,$00,$00,$2E,$08,$A8,$00,$07,$00,$2E,$43,$FA,$13,$D6,$21
	dc.b	$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$11
	dc.b	$7C,$00,$00,$00,$35,$31,$7C,$00,$60,$00,$22,$31,$7C,$00,$0D,$00
	dc.b	$02,$4E,$75,$61,$00,$12,$CA,$4E,$75,$4A,$28,$00,$35,$66,$5A,$53
	dc.b	$68,$00,$22,$6E,$58,$31,$7C,$01,$C0,$00,$04,$21,$7C,$00,$03,$00
	dc.b	$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$11,$FC,$00,$02,$BA
	dc.b	$7B,$49,$F8,$BA,$64,$38,$FC,$07,$08,$28,$FC,$00,$00,$00,$00,$28
	dc.b	$FC,$00,$00,$00,$00,$28,$FC,$00,$00,$00,$00,$38,$FC,$07,$08,$08
	dc.b	$A8,$00,$02,$00,$2E,$08,$AD,$00,$02,$00,$2E,$08,$AE,$00,$02,$00
	dc.b	$2E,$11,$7C,$00,$01,$00,$35,$60,$04,$61,$00,$12,$1E,$4E,$75,$4D
	dc.b	$F8,$92,$00,$4A,$38,$BA,$7B,$67,$06,$08,$E8,$00,$02,$00,$2E,$61
	dc.b	$00,$00,$2E
	dc.w	$43F9
	dc.l	$00FF4C5C-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00
	dc.b	$B2,$00,$FE,$01,$68,$01,$84,$02,$02,$02,$66,$03,$18,$03,$5E,$04
	dc.b	$00,$04,$70,$04,$D8,$05,$04,$05,$9C,$05,$CA,$06,$0E,$06,$3C,$0C
	dc.b	$68,$00,$02,$00,$02,$66,$00,$00,$88,$4A,$6E,$00,$00,$66,$0A,$31
	dc.b	$7C,$00,$0F,$00,$02,$60,$00,$00,$78,$61,$00,$10,$A2,$0C,$45,$00
	dc.b	$28,$6E,$18,$0C,$6E,$00,$05,$00,$02,$6D,$10,$0C,$6E,$00,$08,$00
	dc.b	$02,$6E,$08,$31,$7C,$00,$05,$00,$02,$60,$54,$4E,$BA,$F0,$3C,$02
	dc.b	$80,$00,$00,$7F,$FF,$81,$FC,$01,$00,$48,$40,$4A,$40,$66,$2C,$0C
	dc.b	$68,$01,$80,$00,$04,$66,$06,$31,$7C,$01,$8A,$00,$04,$61,$00,$10
	dc.b	$5E,$0C,$45,$00,$28,$6D,$14,$61,$00,$10,$68,$66,$0E,$31,$7C,$00
	dc.b	$40,$00,$22,$31,$7C,$00,$0B,$00,$02,$60,$14,$70,$00,$4A,$A8,$00
	dc.b	$0C,$6C,$02,$70,$01,$BC,$40,$67,$06,$31,$7C,$00,$09,$00,$02,$4E
	dc.b	$75,$31,$7C,$FF,$F6,$00,$04,$31,$7C,$00,$8D,$00,$08,$21,$7C,$00
	dc.b	$02,$40,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$03
	dc.b	$C7,$00,$28,$11,$7C,$00,$01,$00,$34,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$18,$43,$FA,$14,$7C,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31
	dc.b	$7C,$00,$00,$00,$26,$31,$7C,$00,$02,$00,$02,$4E,$75,$61,$00,$0F
	dc.b	$CE,$21,$7C,$00,$02,$40,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$10,$61,$00,$0F,$CA,$67,$0C,$44,$A8,$00,$0C,$08,$E8,$00,$07,$00
	dc.b	$2E,$60,$06,$08,$A8,$00,$07,$00,$2E,$31,$7C,$03,$C7,$00,$28,$31
	dc.b	$7C,$00,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00,$14,$31,$7C,$00
	dc.b	$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43,$FA,$14,$12,$21
	dc.b	$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31
	dc.b	$7C,$00,$02,$00,$02,$4E,$75,$61,$00,$0F,$36,$0C,$68,$01,$80,$00
	dc.b	$04,$67,$F4,$08,$28,$00,$02,$00,$2E,$67,$06,$31,$7C,$00,$0D,$00
	dc.b	$02,$4E,$75,$61,$00,$0F,$48,$31,$7C,$00,$8D,$00,$08,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$0C,$21,$7C,$FF,$FD,$00,$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$14,$31,$7C,$40,$00,$00,$1E,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$18,$43,$FA,$15,$96,$21,$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31
	dc.b	$69,$00,$02,$00,$24,$61,$00,$0F,$0E,$67,$08,$08,$E8,$00,$07,$00
	dc.b	$2E,$60,$06,$08,$A8,$00,$07,$00,$2E,$11,$7C,$00,$0C,$00,$38,$4E
	dc.b	$BA,$F4,$9A,$66,$0C,$31,$FC,$00,$01,$BA,$7E,$33,$7C,$00,$07,$00
	dc.b	$00,$31,$7C,$00,$04,$00,$02,$4E,$75,$61,$00,$0E,$9C,$0C,$68,$00
	dc.b	$8C,$00,$08,$6D,$08,$21,$7C,$00,$00,$00,$00,$00,$18,$53,$68,$00
	dc.b	$22,$6E,$30,$4A,$A8,$00,$18,$66,$2A,$31,$7C,$00,$8B,$00,$08,$31
	dc.b	$7C,$00,$01,$00,$02,$0C,$78,$00,$02,$BA,$7A,$66,$16,$08,$AE,$00
	dc.b	$02,$00,$2E,$4B,$F8,$92,$80,$08,$AD,$00,$02,$00,$2E,$11,$FC,$00
	dc.b	$00,$BA,$7A,$53,$28,$00,$38,$6C,$12,$61,$00,$F4,$30,$66,$0C,$33
	dc.b	$7C,$00,$07,$00,$00,$11,$7C,$00,$10,$00,$38,$4E,$75,$61,$00,$0E
	dc.b	$66,$31,$7C,$00,$8D,$00,$08,$21,$7C,$00,$01,$80,$00,$00,$0C,$21
	dc.b	$7C,$FF,$FD,$00,$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$14,$31,$7C,$40,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43
	dc.b	$FA,$14,$94,$21,$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31,$69,$00
	dc.b	$02,$00,$24,$61,$00,$0E,$2C,$67,$0C,$44,$A8,$00,$0C,$08,$E8,$00
	dc.b	$07,$00,$2E,$60,$06,$08,$A8,$00,$07,$00,$2E,$08,$28,$00,$07,$00
	dc.b	$2E,$67,$12,$08,$2E,$00,$07,$00,$2E,$67,$1A,$21,$7C,$FF,$FF,$00
	dc.b	$00,$00,$0C,$60,$10,$08,$2E,$00,$07,$00,$2E,$66,$08,$21,$7C,$00
	dc.b	$01,$00,$00,$00,$0C,$31,$7C,$00,$14,$00,$22,$11,$7C,$00,$10,$00
	dc.b	$38,$4E,$BA,$F3,$84,$66,$0C,$31,$FC,$00,$01,$BA,$7E,$33,$7C,$00
	dc.b	$07,$00,$00,$31,$7C,$00,$06,$00,$02,$4E,$75,$61,$00,$0D,$86,$0C
	dc.b	$68,$00,$8C,$00,$08,$6D,$08,$21,$7C,$00,$00,$00,$00,$00,$18,$53
	dc.b	$68,$00,$22,$6E,$12,$4A,$A8,$00,$18,$66,$0C,$31,$7C,$00,$8B,$00
	dc.b	$08,$31,$7C,$00,$07,$00,$02,$53,$28,$00,$38,$6C,$12,$61,$00,$F3
	dc.b	$38,$66,$0C,$33,$7C,$00,$07,$00,$00,$11,$7C,$00,$10,$00,$38,$4E
	dc.b	$75,$61,$00,$0D,$6E,$31,$7C,$00,$8D,$00,$08,$08,$2E,$00,$07,$00
	dc.b	$2E,$67,$18,$08,$E8,$00,$07,$00,$2E,$21,$6E,$00,$04,$00,$04,$06
	dc.b	$68,$00,$10,$00,$04,$44,$A8,$00,$0C,$60,$12,$08,$A8,$00,$07,$00
	dc.b	$2E,$21,$6E,$00,$04,$00,$04,$04,$68,$00,$10,$00,$04,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$18,$43,$FA,$13,$EA,$21,$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31
	dc.b	$69,$00,$02,$00,$24,$11,$7C,$00,$00,$00,$34,$11,$7C,$00,$0C,$00
	dc.b	$38,$4E,$BA,$F2,$9C,$66,$0C,$31,$FC,$00,$01,$BA,$7E,$33,$7C,$00
	dc.b	$07,$00,$00,$31,$7C,$00,$08,$00,$02,$4E,$75,$08,$2E,$00,$07,$00
	dc.b	$2E,$67,$18,$08,$E8,$00,$07,$00,$2E,$21,$6E,$00,$04,$00,$04,$06
	dc.b	$68,$00,$10,$00,$04,$44,$A8,$00,$0C,$60,$12,$08,$A8,$00,$07,$00
	dc.b	$2E,$21,$6E,$00,$04,$00,$04,$04,$68,$00,$10,$00,$04,$0C,$6E,$00
	dc.b	$05,$00,$02,$6D,$22,$0C,$6E,$00,$08,$00,$02,$6E,$1A,$53,$28,$00
	dc.b	$38,$6C,$26,$61,$00,$F2,$3A,$66,$20,$33,$7C,$00,$07,$00,$00,$11
	dc.b	$7C,$00,$10,$00,$38,$60,$12,$31,$7C,$00,$28,$00,$22,$31,$7C,$00
	dc.b	$03,$00,$02,$11,$7C,$00,$01,$00,$34,$4E,$75,$31,$7C,$00,$8D,$00
	dc.b	$08,$21,$7C,$00,$02,$40,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$10,$31,$7C,$E0,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00,$14,$31
	dc.b	$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43,$FA,$10
	dc.b	$BC,$21,$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31,$69,$00,$02,$00
	dc.b	$24,$08,$E8,$00,$07,$00,$2E,$61,$00,$0C,$20,$66,$0E,$08,$A8,$00
	dc.b	$07,$00,$2E,$44,$68,$00,$1C,$44,$A8,$00,$0C,$31,$7C,$00,$0A,$00
	dc.b	$02,$4E,$75,$61,$00,$0B,$C6,$30,$28,$00,$0C,$D0,$68,$00,$14,$66
	dc.b	$1C,$0C,$38,$00,$02,$BA,$7A,$66,$08,$31,$7C,$00,$50,$00,$22,$60
	dc.b	$06,$31,$7C,$00,$14,$00,$22,$31,$7C,$00,$03,$00,$02,$4E,$75,$61
	dc.b	$00,$0B,$C8,$31,$7C,$00,$8D,$00,$08,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$18,$4E,$BA,$EB,$5E,$02,$80,$00,$00,$7F,$FF,$81,$FC,$00,$02,$48
	dc.b	$40,$4A,$40,$66,$06,$43,$FA,$10,$C6,$60,$04,$43,$FA,$11,$20,$21
	dc.b	$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31,$69,$00,$02,$00,$24,$61
	dc.b	$00,$0B,$74,$67,$08,$08,$E8,$00,$07,$00,$2E,$60,$06,$08,$A8,$00
	dc.b	$07,$00,$2E,$11,$7C,$00,$10,$00,$38,$4E,$BA,$F1,$00,$66,$0C,$31
	dc.b	$FC,$00,$01,$BA,$7E,$33,$7C,$00,$07,$00,$00,$31,$7C,$00,$0C,$00
	dc.b	$02,$4E,$75,$02,$68,$01,$FF,$00,$04,$02,$6E,$01,$FF,$00,$04,$61
	dc.b	$00,$0B,$34,$67,$08,$08,$E8,$00,$07,$00,$2E,$60,$06,$08,$A8,$00
	dc.b	$07,$00,$2E,$53,$68,$00,$22,$6E,$06,$31,$7C,$00,$01,$00,$02,$4E
	dc.b	$75,$61,$00,$0B,$D2,$0C,$38,$00,$02,$BA,$7B,$66,$36,$31,$7C,$01
	dc.b	$C0,$00,$04,$21,$7C,$00,$02,$40,$00,$00,$0C,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$10,$08,$A8,$00,$07,$00,$2E,$43,$FA,$0F,$6C,$21,$49,$00
	dc.b	$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00
	dc.b	$0F,$00,$02,$4E,$75,$20,$28,$00,$0C,$D1,$A8,$00,$04,$20,$28,$00
	dc.b	$10,$D1,$A8,$00,$08,$4A,$AE,$00,$0C,$66,$16,$4B,$F8,$92,$80,$4A
	dc.b	$AD,$00,$0C,$66,$0C,$61,$00,$0B,$1A,$67,$06,$31,$7C,$00,$09,$00
	dc.b	$02,$4E,$75,$61,$00,$0B,$BC,$4E,$75,$4D,$F8,$92,$00,$4A,$38,$BA
	dc.b	$7B,$67,$06,$08,$E8,$00,$02,$00,$2E
	dc.w	$43F9
	dc.l	$00FF52BA-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$20,$00,$A0,$01,$2C,$01,$CA,$02,$14,$02
	dc.b	$2A,$02,$90,$02,$BE,$03,$10,$03,$32,$03,$9E,$03,$EE,$04,$46,$04
	dc.b	$7E,$04,$C4,$04,$CA,$31,$7C,$01,$50,$00,$04,$31,$7C,$00,$84,$00
	dc.b	$08,$21,$7C,$FF,$FC,$60,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00,$14,$31
	dc.b	$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$31,$7C,$64
	dc.b	$B9,$00,$28,$11,$7C,$00,$03,$00,$34,$08,$E8,$00,$07,$00,$2E,$43
	dc.b	$FA,$12,$2E,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00
	dc.b	$00,$00,$26,$4E,$BA,$E9,$BC,$02,$80,$00,$00,$7F,$FF,$81,$FC,$00
	dc.b	$80,$48,$40,$31,$40,$00,$22,$06,$68,$00,$80,$00,$22,$31,$7C,$00
	dc.b	$02,$00,$02,$4E,$75,$31,$7C,$00,$84,$00,$08,$21,$7C,$00,$03,$A0
	dc.b	$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$08,$28,$00,$07,$00
	dc.b	$2E,$67,$04,$44,$A8,$00,$0C,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$31
	dc.b	$7C,$64,$B9,$00,$28,$11,$7C,$00,$03,$00,$34,$43,$FA,$11,$AE,$21
	dc.b	$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$4E
	dc.b	$BA,$E9,$3C,$02,$80,$00,$00,$7F,$FF,$81,$FC,$00,$C0,$48,$40,$31
	dc.b	$40,$00,$22,$06,$68,$00,$80,$00,$22,$61,$00,$0A,$12,$66,$06,$11
	dc.b	$7C,$00,$01,$00,$36,$31,$7C,$00,$02,$00,$02,$4E,$75,$20,$28,$00
	dc.b	$0C,$D1,$A8,$00,$04,$20,$28,$00,$10,$D1,$A8,$00,$08,$61,$00,$0A
	dc.b	$D2,$08,$28,$00,$02,$00,$2E,$67,$0E,$11,$7C,$00,$00,$00,$36,$31
	dc.b	$7C,$00,$0D,$00,$02,$60,$72,$4A,$6E,$00,$00,$66,$0E,$11,$7C,$00
	dc.b	$00,$00,$36,$31,$7C,$00,$0F,$00,$02,$60,$5E,$0C,$68,$01,$78,$00
	dc.b	$04,$6D,$1C,$0C,$68,$01,$88,$00,$04,$6E,$14,$11,$7C,$00,$00,$00
	dc.b	$36,$31,$7C,$00,$80,$00,$38,$31,$7C,$00,$0E,$00,$02,$60,$3A,$53
	dc.b	$68,$00,$22,$6C,$34,$61,$00,$08,$DA,$31,$7C,$00,$00,$00,$22,$61
	dc.b	$00,$08,$E0,$0C,$45,$00,$28,$6D,$20,$4D,$F8,$92,$40,$61,$00,$08
	dc.b	$D2,$0C,$45,$00,$28,$6D,$12,$61,$00,$08,$DC,$66,$0C,$11,$7C,$00
	dc.b	$00,$00,$36,$31,$7C,$00,$03,$00,$02,$4E,$75,$31,$7C,$00,$88,$00
	dc.b	$08,$31,$7C,$C8,$00,$00,$1C,$08,$28,$00,$07,$00,$2E,$67,$04,$44
	dc.b	$68,$00,$1C,$21,$7C,$00,$00,$00,$00,$00,$14,$31,$7C,$00,$00,$00
	dc.b	$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43,$FA,$10,$F6,$21,$49,$00
	dc.b	$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00
	dc.b	$04,$00,$02,$4E,$75,$61,$00,$08,$2C,$30,$28,$00,$0C,$D0,$68,$00
	dc.b	$14,$66,$06,$31,$7C,$00,$05,$00,$02,$4E,$75,$61,$00,$08,$44,$0C
	dc.b	$68,$01,$80,$00,$04,$66,$06,$31,$7C,$01,$8A,$00,$04,$31,$7C,$00
	dc.b	$8C,$00,$08,$21,$7C,$00,$00,$00,$00,$00,$0C,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43
	dc.b	$FA,$10,$CA,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00
	dc.b	$00,$00,$26,$31,$7C,$00,$20,$00,$22,$31,$7C,$00,$06,$00,$02,$4E
	dc.b	$75,$53,$68,$00,$22,$6C,$26,$0C,$6E,$00,$0C,$00,$02,$67,$10,$0C
	dc.b	$6E,$00,$05,$00,$02,$6D,$10,$0C,$6E,$00,$08,$00,$02,$6E,$08,$31
	dc.b	$7C,$00,$0B,$00,$02,$60,$06,$31,$7C,$00,$07,$00,$02,$4E,$75,$61
	dc.b	$00,$07,$B0,$21,$7C,$00,$00,$00,$00,$00,$0C,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43
	dc.b	$FA,$0E,$DE,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00
	dc.b	$00,$00,$26,$31,$7C,$00,$40,$00,$22,$31,$7C,$00,$08,$00,$02,$4E
	dc.b	$75,$53,$68,$00,$22,$6C,$06,$31,$7C,$00,$09,$00,$02,$61,$00,$07
	dc.b	$62,$67,$08,$08,$E8,$00,$07,$00,$2E,$60,$06,$08,$A8,$00,$07,$00
	dc.b	$2E,$4E,$75,$61,$00,$07,$3C,$21,$7C,$00,$00,$00,$00,$00,$0C,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$61
	dc.b	$00,$07,$1C,$67,$08,$08,$E8,$00,$07,$00,$2E,$60,$06,$08,$A8,$00
	dc.b	$07,$00,$2E,$43,$FA,$10,$00,$21,$49,$00,$2A,$31,$69,$00,$02,$00
	dc.b	$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00,$10,$00,$22,$11,$7C,$00
	dc.b	$00,$00,$37,$31,$7C,$00,$0A,$00,$02,$4E,$75,$53,$68,$00,$22,$6C
	dc.b	$34,$4A,$28,$00,$37,$66,$28,$31,$7C,$00,$88,$00,$08,$43,$FA,$10
	dc.b	$04,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00
	dc.b	$26,$31,$7C,$00,$30,$00,$22,$11,$7C,$00,$01,$00,$37,$60,$06,$31
	dc.b	$7C,$00,$01,$00,$02,$61,$00,$06,$A6,$67,$08,$08,$E8,$00,$07,$00
	dc.b	$2E,$60,$06,$08,$A8,$00,$07,$00,$2E,$4E,$75,$61,$00,$06,$80,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31
	dc.b	$7C,$00,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00,$14,$31,$7C,$00
	dc.b	$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$43,$FA,$0D,$CE,$21
	dc.b	$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31
	dc.b	$7C,$00,$20,$00,$22,$11,$7C,$00,$00,$00,$37,$31,$7C,$00,$0C,$00
	dc.b	$02,$4E,$75,$53,$68,$00,$22,$6C,$30,$4A,$28,$00,$37,$66,$22,$43
	dc.b	$FA,$0D,$F0,$21,$49,$00,$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00
	dc.b	$00,$00,$26,$31,$7C,$00,$80,$00,$22,$11,$7C,$00,$01,$00,$37,$60
	dc.b	$08,$4E,$71,$31,$7C,$00,$09,$00,$02,$4E,$75,$61,$00,$06,$C0,$0C
	dc.b	$38,$00,$02,$BA,$7B,$66,$38,$70,$00,$31,$7C,$01,$C0,$00,$04,$21
	dc.b	$7C,$00,$03,$A0,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$08
	dc.b	$A8,$00,$07,$00,$2E,$43,$FA,$0D,$F0,$21,$49,$00,$2A,$31,$69,$00
	dc.b	$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00,$0F,$00,$02,$4E
	dc.b	$75,$61,$00,$07,$1C,$4E,$75,$61,$00,$06,$D0,$4E,$75
	dc.w	$43F9
	dc.l	$00FF5796-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$04,$00,$66,$43,$F8,$92
	dc.b	$40,$31,$69,$00,$04,$00,$04,$31,$69,$00,$08,$00,$08,$21,$7C,$00
	dcb.b	$4, 0
	dc.b	$0C,$21,$7C,$FF,$FF,$80,$00,$00,$10,$31,$7C,$00,$20,$00,$30,$31
	dc.b	$7C,$00,$04,$00,$32,$31,$7C,$00,$00,$00,$1C,$31,$7C,$00,$00,$00
	dc.b	$1E,$30,$3C,$03,$C7,$31,$40,$00,$28,$11,$7C,$00,$03,$00,$34,$43
	dc.b	$FA,$0C,$6A,$21,$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$11,$7C,$00
	dc.b	$20,$00,$36,$31,$7C,$00,$01,$00,$02,$4E,$75,$61,$00,$04,$A8,$0C
	dc.b	$68,$00,$03,$00,$26,$6D,$04,$60,$00,$04,$12,$4E,$75
	dc.w	$43F9
	dc.l	$00FF581A-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$04,$02,$3C,$31,$7C,$FF
	dc.b	$F6,$00,$04,$31,$7C,$00,$90,$00,$08,$21,$7C,$00,$00,$C0,$00,$00
	dc.b	$0C,$4E,$BA,$E4,$C2,$02,$80,$00,$00,$7F,$FF,$81,$FC,$02,$00,$30
	dc.b	$3C,$00,$00,$E0,$80,$D1,$A8,$00,$0C,$21,$7C,$FF,$FC,$80,$00,$00
	dc.b	$10,$4E,$BA,$E4,$A2,$02,$80,$00,$00,$7F,$FF,$81,$FC,$02,$00,$30
	dc.b	$3C,$00,$00,$E0,$80,$D1,$A8,$00,$10,$31,$7C,$38,$00,$00,$1E,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$18,$31,$7C,$65,$85,$00,$28,$11,$7C,$00
	dc.b	$03,$00,$34,$43,$FA,$0E,$B2,$21,$49,$00,$2A,$31,$69,$00,$02,$00
	dc.b	$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00,$01,$00,$02,$4E,$75
	dc.w	$43F9
	dc.l	$00FF58AC-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$04,$01,$AA,$31
	dc.b	$7C,$FF,$F6,$00,$04,$31,$7C,$00,$90,$00,$08,$21,$7C,$00,$00,$C0
	dc.b	$00,$00,$0C,$4E,$BA,$E4,$30,$02,$80,$00,$00,$7F,$FF,$81,$FC,$01
	dc.b	$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$0C,$21,$7C,$FF,$FC,$80
	dc.b	$00,$00,$10,$4E,$BA,$E4,$10,$02,$80,$00,$00,$7F,$FF,$81,$FC,$01
	dc.b	$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$10,$31,$7C,$38,$00,$00
	dc.b	$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$31,$7C,$65,$85,$00,$28,$11
	dc.b	$7C,$00,$03,$00,$34,$43,$FA,$0E,$92,$21,$49,$00,$2A,$31,$69,$00
	dc.b	$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00,$01,$00,$02,$4E
	dc.b	$75
	dc.w	$43F9
	dc.l	$00FF593E-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$04,$01
	dc.b	$18,$31,$7C,$FF,$F6,$00,$04,$31,$7C,$00,$A4,$00,$08,$21,$7C,$00
	dc.b	$00,$C0,$00,$00,$0C,$4E,$BA,$E3,$9E,$02,$80,$00,$00,$7F,$FF,$81
	dc.b	$FC,$01,$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$0C,$21,$7C,$FF
	dc.b	$FC,$80,$00,$00,$10,$4E,$BA,$E3,$7E,$02,$80,$00,$00,$7F,$FF,$81
	dc.b	$FC,$01,$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$10,$31,$7C,$38
	dc.b	$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$31,$7C,$65,$85,$00
	dc.b	$28,$11,$7C,$00,$03,$00,$34,$43,$FA,$0D,$B4,$21,$49,$00,$2A,$31
	dc.b	$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00,$01,$00
	dc.b	$02,$4E,$75
	dc.w	$43F9
	dc.l	$00FF59D0-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00
	dc.b	$04,$00,$86,$31,$7C,$FF,$F6,$00,$04,$31,$7C,$00,$A4,$00,$08,$21
	dc.b	$7C,$00,$00,$C0,$00,$00,$0C,$4E,$BA,$E3,$0C,$02,$80,$00,$00,$7F
	dc.b	$FF,$81,$FC,$02,$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$0C,$21
	dc.b	$7C,$FF,$FC,$80,$00,$00,$10,$4E,$BA,$E2,$EC,$02,$80,$00,$00,$7F
	dc.b	$FF,$81,$FC,$01,$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$10,$31
	dc.b	$7C,$40,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$31,$7C,$65
	dc.b	$85,$00,$28,$11,$7C,$00,$03,$00,$34,$43,$FA,$0D,$48,$21,$49,$00
	dc.b	$2A,$31,$69,$00,$02,$00,$24,$31,$7C,$00,$00,$00,$26,$31,$7C,$00
	dc.b	$01,$00,$02,$4E,$75,$61,$00,$01,$D0,$66,$00,$01,$C0,$61,$00,$02
	dc.b	$9C,$0C,$68,$00,$A0,$00,$08,$6D,$08,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$18,$4E,$75
	dc.w	$43F9
	dc.l	$00FF5A80-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00
	dc.b	$04,$01,$82,$4E,$71,$31,$7C,$FF,$F6,$00,$04,$4E,$BA,$E2,$68,$02
	dc.b	$80,$00,$00,$7F,$FF,$81,$FC,$00,$78,$48,$40,$31,$40,$00,$08,$21
	dc.b	$7C,$00,$01,$00,$00,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31
	dc.b	$7C,$00,$30,$00,$30,$31,$7C,$00,$04,$00,$32,$31,$7C,$00,$00,$00
	dc.b	$1C,$31,$7C,$00,$00,$00,$1E,$31,$7C,$65,$85,$00,$28,$11,$7C,$00
	dc.b	$03,$00,$34,$43,$FA,$0B,$F0,$21,$49,$00,$2A,$31,$7C,$00,$00,$00
	dc.b	$26,$31,$7C,$00,$01,$00,$02,$4E,$75
	dc.w	$43F9
	dc.l	$00FF5AF6-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$04,$01,$0C,$31,$7C,$FF,$F6,$00,$04,$4E
	dc.b	$BA,$E1,$F4,$02,$80,$00,$00,$7F,$FF,$81,$FC,$00,$78,$48,$40,$31
	dc.b	$40,$00,$08,$21,$7C,$00,$00,$80,$00,$00,$0C,$4E,$BA,$E1,$D8,$02
	dc.b	$80,$00,$00,$7F,$FF,$81,$FC,$01,$00,$30,$3C,$00,$00,$E0,$80,$D1
	dc.b	$A8,$00,$0C,$21,$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$00,$30,$00
	dc.b	$30,$31,$7C,$00,$04,$00,$32,$31,$7C,$00,$00,$00,$1C,$31,$7C,$00
	dc.b	$00,$00,$1E,$31,$7C,$65,$85,$00,$28,$11,$7C,$00,$03,$00,$34,$43
	dc.b	$FA,$0B,$B0,$21,$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31,$7C,$00
	dc.b	$01,$00,$02,$4E,$75
	dc.w	$43F9
	dc.l	$00FF5B82-ThankYouFullShift
	dc.w	$4EF9
	dc.l	$00FF5C10-ThankYouFullShift
	dc.b	$00,$04,$00,$80,$31,$7C,$FF,$F6,$00,$04,$4E,$BA,$E1,$68,$02
	dc.b	$80,$00,$00,$7F,$FF,$81,$FC,$00,$78,$48,$40,$31,$40,$00,$08,$21
	dc.b	$7C,$00,$00,$80,$00,$00,$0C,$4E,$BA,$E1,$4C,$02,$80,$00,$00,$7F
	dc.b	$FF,$81,$FC,$01,$00,$30,$3C,$00,$00,$E0,$80,$D1,$A8,$00,$0C,$21
	dc.b	$7C,$00,$00,$00,$00,$00,$10,$31,$7C,$00,$30,$00,$30,$31,$7C,$00
	dc.b	$04,$00,$32,$31,$7C,$00,$00,$00,$1C,$31,$7C,$00,$00,$00,$1E,$31
	dc.b	$7C,$65,$85,$00,$28,$11,$7C,$00,$03,$00,$34,$43,$FA,$0A,$FE,$21
	dc.b	$49,$00,$2A,$31,$7C,$00,$00,$00,$26,$31,$7C,$00,$01,$00,$02,$4E
	dc.b	$75,$61,$00,$00,$24,$66,$00,$00,$14,$61,$00,$00,$44,$4E,$75,$30
	dc.b	$28,$00,$02,$D0,$40,$D2,$F1,$00,$00,$4E,$D1,$10,$28,$00,$2F,$08
	dc.b	$E8,$00,$04,$00,$2E,$4E,$75,$0C,$68,$FF,$E0,$00,$04,$6F,$1C,$0C
	dc.b	$68,$01,$50,$00,$04,$6C,$14,$0C,$68,$FF,$FB,$00,$08,$6F,$0C,$0C
	dc.b	$68,$00,$E0,$00,$08,$6C,$04,$70,$00,$4E,$75,$70,$01,$4E,$75,$30
	dc.b	$28,$00,$1E,$91,$68,$00,$08,$36,$28,$00,$20,$4E,$BA,$E0,$C6,$30
	dc.b	$28,$00,$32,$C7,$C0,$E0,$83,$31,$43,$00,$1E,$D7,$68,$00,$08,$4E
	dc.b	$BA,$E0,$84,$02,$80,$00,$00,$7F,$FF,$32,$28,$00,$30,$81,$C1,$48
	dc.b	$40,$D1,$68,$00,$20,$0C,$68,$01,$FF,$00,$20,$6D,$06,$04,$68,$01
	dc.b	$FF,$00,$20,$20,$28,$00,$0C,$D1,$A8,$00,$04,$22,$28,$00,$10,$D3
	dc.b	$A8,$00,$08,$4E,$75,$30,$28,$00,$1C,$91,$68,$00,$04,$36,$28,$00
	dc.b	$20,$4E,$BA,$E0,$70,$30,$28,$00,$30,$C7,$C0,$E0,$83,$31,$43,$00
	dc.b	$1C,$D7,$68,$00,$04,$4E,$BA,$E0,$2E,$02,$80,$00,$00,$7F,$FF,$32
	dc.b	$28,$00,$32,$81,$C1,$48,$40,$D1,$68,$00,$20,$0C,$68,$01,$FF,$00
	dc.b	$20,$6D,$06,$04,$68,$01,$FF,$00,$20,$20,$28,$00,$0C,$D1,$A8,$00
	dc.b	$04,$22,$28,$00,$10,$D3,$A8,$00,$08,$4E,$75,$20,$28,$00,$0C,$D0
	dc.b	$A8,$00,$14,$D1,$A8,$00,$04,$20,$28,$00,$10,$D0,$A8,$00,$18,$D1
	dc.b	$A8,$00,$08,$30,$28,$00,$1C,$48,$C0,$D1,$A8,$00,$14,$30,$28,$00
	dc.b	$1E,$48,$C0,$D1,$A8,$00,$18,$4E,$75,$20,$28,$00,$04,$02,$80,$01
	dc.b	$FF,$FF,$FF,$21,$40,$00,$04,$4E,$75,$3A,$2E,$00,$04,$9A,$68,$00
	dc.b	$04,$6C,$06,$44,$45,$7C,$01,$4E,$75,$7C,$00,$4E,$75,$0C,$68,$01
	dc.b	$80,$00,$04,$67,$4C,$4A,$68,$00,$0C,$6D,$22,$0C,$68,$01,$08,$00
	dc.b	$04,$6D,$3A,$0C,$68,$01,$30,$00,$04,$6D,$36,$0C,$68,$01,$C0,$00
	dc.b	$04,$6D,$2A,$0C,$68,$01,$F0,$00,$04,$6D,$26,$60,$20,$0C,$68,$00
	dc.b	$28,$00,$04,$6D,$1C,$0C,$68,$01,$30,$00,$04,$6D,$10,$0C,$68,$01
	dc.b	$60,$00,$04,$6D,$0C,$0C,$68,$01,$F0,$00,$04,$6E,$04,$70,$00,$4E
	dc.b	$75,$70,$01,$4E,$75,$02,$A8,$01,$FF,$FF,$FF,$00,$04,$08,$28,$00
	dc.b	$07,$00,$2E,$66,$16,$0C,$68,$00,$70,$00,$04,$6D,$24,$0C,$68,$00
	dc.b	$78,$00,$04,$6E,$1C,$4E,$71,$70,$01,$4E,$75,$0C,$68,$00,$A8,$00
	dc.b	$04,$6D,$0E,$0C,$68,$00,$B0,$00,$04,$6E,$06,$4E,$71,$70,$01,$4E
	dc.b	$75,$70,$00,$4E,$75,$61,$00,$FF,$42,$0C,$68,$01,$30,$00,$04,$6E
	dc.b	$04,$70,$00,$4E,$75,$70,$01,$4E,$75,$61,$00,$FF,$00,$02,$68,$01
	dc.b	$FF,$00,$04,$0C,$68,$01,$50,$00,$04,$6D,$34,$0C,$68,$01,$60,$00
	dc.b	$04,$6E,$2C,$21,$7C,$00,$00,$00,$00,$00,$0C,$21,$7C,$00,$00,$00
	dc.b	$00,$00,$10,$31,$7C,$00,$00,$00,$1C,$21,$7C,$00,$00,$00,$00,$00
	dc.b	$14,$31,$7C,$00,$00,$00,$1E,$21,$7C,$00,$00,$00,$00,$00,$18,$08
	dc.b	$28,$00,$02,$00,$2E,$66,$0C,$08,$A8,$00,$02,$00,$2E,$31,$7C,$00
	dc.b	$01,$00,$02,$4E,$75,$02,$68,$01,$FF,$00,$04,$4A,$A8,$00,$0C,$6D
	dc.b	$14,$0C,$68,$01,$30,$00,$04,$6D,$20,$0C,$68,$01,$70,$00,$04,$6E
	dc.b	$18,$60,$00,$FD,$A8,$0C,$68,$01,$C0,$00,$04,$6D,$0C,$0C,$68,$01
	dc.b	$E0,$00,$04,$6E,$04,$60,$00,$FD,$94,$20,$28,$00,$0C,$D1,$A8,$00
	dc.b	$04,$20,$28,$00,$10,$D1,$A8,$00,$08,$4E,$75,$31,$7C,$01,$86,$00
	dc.b	$04,$53,$68,$00,$38,$6E,$20,$4E,$71,$4E,$71,$4E,$71,$4A,$A8,$00
	dc.b	$0C,$6D,$08,$31,$7C,$01,$90,$00,$04,$60,$06,$31,$7C,$01,$70,$00
	dc.b	$04,$31,$7C,$00,$02,$00,$02,$4E,$75,$4A,$28,$00,$36,$66,$30,$4A
	dc.b	$A8,$00,$0C,$6D,$12,$0C,$68,$00,$05,$00,$04,$6E,$22,$70,$00,$11
	dc.b	$7C,$00,$01,$00,$36,$60,$18,$0C,$68,$01,$30,$00,$04,$6D,$10,$0C
	dc.b	$68,$01,$38,$00,$04,$6E,$08,$70,$00,$11,$7C,$00,$01,$00,$36,$4E
	dc.b	$75,$00,$01,$00,$01,$00,$06,$00,$01,$0F,$00,$00,$00,$00,$00,$00
	dcb.b	$5, 0
	dc.b	$0C,$00,$00,$10,$00,$00,$00,$00,$FF,$E0,$00,$00,$00,$01,$00,$01
	dc.b	$00,$06,$00,$01,$0B,$00,$00,$14,$00,$00,$FF,$F8,$00,$00,$00,$00
	dc.b	$08,$00,$00,$20,$00,$00,$FF,$F8,$FF,$E0,$00,$00,$00,$02,$00,$0A
	dc.b	$00,$0A,$00,$0A,$00,$24,$00,$01,$0B,$00,$00,$24,$00,$00,$FF,$F8
	dcb.b	$4, 0
	dc.b	$0C,$00,$00,$20,$00,$00,$00,$00,$FF,$E0,$00,$00,$00,$01,$0B,$00
	dc.b	$00,$24,$00,$00,$FF,$F8,$00,$00,$00,$00,$0C,$00,$00,$30,$00,$00
	dc.b	$00,$00,$FF,$E0,$00,$00,$00,$06,$00,$03,$00,$1A,$00,$03,$00,$4C
	dc.b	$00,$03,$00,$7E,$00,$03,$00,$B0,$00,$03,$00,$E2,$00,$03,$01,$14
	dc.b	$00,$03,$0A,$00,$00,$34,$00,$00,$00,$00,$00,$00,$00,$00,$06,$00
	dc.b	$00,$3D,$FF,$E8,$00,$10,$00,$00,$00,$00,$09,$00,$00,$43,$00,$00
	dc.b	$00,$00,$FF,$E8,$00,$00,$05,$00,$00,$49,$FF,$E8,$00,$10,$FF,$E8
	dc.b	$00,$00,$00,$03,$0A,$00,$00,$4D,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$06,$00,$00,$56,$FF,$E8,$00,$10,$00,$00,$00,$00,$09,$00,$00,$5C
	dcb.b	$4, 0
	dc.b	$FF,$E8,$00,$00,$05,$00,$00,$62,$FF,$E8,$00,$10,$FF,$E8,$00,$00
	dc.b	$00,$03,$0A,$00,$00,$66,$00,$00,$00,$00,$00,$00,$00,$00,$06,$00
	dc.b	$00,$6F,$FF,$E8,$00,$10,$00,$00,$00,$00,$09,$00,$00,$75,$00,$00
	dc.b	$00,$00,$FF,$E8,$00,$00,$05,$00,$00,$7B,$FF,$E8,$00,$10,$FF,$E8
	dc.b	$00,$00,$00,$03,$0A,$00,$00,$7F,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$06,$00,$00,$88,$FF,$E8,$00,$10,$00,$00,$00,$00,$09,$00,$00,$8E
	dcb.b	$4, 0
	dc.b	$FF,$E8,$00,$00,$05,$00,$00,$94,$FF,$E8,$00,$10,$FF,$E8,$00,$00
	dc.b	$00,$03,$0A,$00,$00,$98,$00,$00,$00,$00,$00,$00,$00,$00,$06,$00
	dc.b	$00,$A1,$FF,$E8,$00,$10,$00,$00,$00,$00,$09,$00,$00,$A7,$00,$00
	dc.b	$00,$00,$FF,$E8,$00,$00,$05,$00,$00,$AD,$FF,$E8,$00,$10,$FF,$E8
	dc.b	$00,$00,$00,$03,$0A,$00,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$06,$00,$00,$BA,$FF,$E8,$00,$10,$00,$00,$00,$00,$09,$00,$00,$C0
	dcb.b	$4, 0
	dc.b	$FF,$E8,$00,$00,$05,$00,$00,$C6,$FF,$E8,$00,$10,$FF,$E8,$00,$00
	dc.b	$00,$06,$00,$05,$00,$1A,$00,$05,$00,$34,$00,$05,$00,$4E,$00,$05
	dc.b	$00,$34,$00,$05,$00,$74,$00,$03,$00,$74,$00,$01,$0F,$00,$00,$CA
	dcb.b	$8, 0
	dc.b	$0C,$00,$00,$DA,$00,$00,$00,$00,$FF,$E0,$00,$00,$00,$01,$0F,$00
	dc.b	$00,$DE,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$EE,$00,$00
	dc.b	$00,$00,$FF,$E0,$00,$00,$00,$02,$0F,$00,$00,$F2,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$0C,$00,$01,$02,$00,$00,$00,$00,$FF,$E0,$00,$00,$02,$00,$01,$06
	dc.b	$FF,$E0,$00,$00,$FF,$F0,$00,$00,$00,$02,$0F,$00,$01,$09,$00,$00
	dcb.b	$6, 0
	dc.l	$0C000119
	dcb.b	$4, 0
	dc.l	$FFE00000
	dc.l	$0200011D
	dc.l	$FFE00000
	dc.l	$FFF00000
	dc.l	$00050002
	dc.l	$00160002
	dc.l	$00240002
	dc.l	$00320002
	dc.l	$00400002
	dc.l	$004E0000
	dc.l	$0F000150
	dcb.b	$A, 0
	dc.b	$0F,$00,$01,$60,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$00
	dc.b	$01,$70,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$00,$01,$80
	dcb.b	$A, 0
	dc.l	$0F000190
	dcb.b	$9, 0
	dc.b	$06,$00,$04,$00,$1A,$00,$04,$00,$34,$00,$04,$00,$4E,$00,$04,$00
	dc.b	$68,$00,$04,$00,$82,$00,$04,$00,$9C,$00,$01,$0E,$00,$00,$3E,$00
	dcb.b	$7, 0
	dc.l	$0D00004A
	dcb.b	$4, 0
	dc.l	$FFE80000
	dc.l	$00010E00
	dc.l	$00520000
	dcb.b	$6, 0
	dc.b	$0D,$00,$00,$5E,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$01,$0E,$00
	dc.b	$00,$66,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$00,$00,$72,$00,$00
	dc.b	$00,$00,$FF,$E8,$00,$00,$00,$01,$0E,$00,$00,$7A,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$0D,$00,$00,$86,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$01,$0E,$00
	dc.b	$00,$8E,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$00,$00,$9A,$00,$00
	dc.b	$00,$00,$FF,$E8,$00,$00,$00,$01,$0E,$00,$00,$A2,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$0D,$00,$00,$AE,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$04,$00,$06
	dc.b	$00,$12,$00,$06,$00,$2C,$00,$06,$00,$46,$00,$06,$00,$2C,$00,$01
	dc.b	$09,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$00,$06
	dcb.b	$4, 0
	dc.b	$FF,$F0,$00,$00,$00,$01,$09,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$0A,$00,$00,$0F,$00,$00,$00,$00,$FF,$F0,$00,$00,$00,$01
	dc.b	$09,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$00,$18
	dcb.b	$4, 0
	dc.b	$FF,$F0,$00,$00,$00,$08,$00,$0E,$00,$22,$00,$0E,$00,$3C,$00,$0E
	dc.b	$00,$22,$00,$14,$00,$3C,$00,$06,$00,$56,$00,$06,$00,$3C,$00,$06
	dc.b	$00,$56,$00,$06,$00,$3C,$00,$01,$0A,$00,$00,$2D,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$09,$00,$00,$36,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$01,$0E,$00
	dc.b	$00,$21,$00,$00,$00,$08,$00,$00,$00,$00,$09,$00,$00,$36,$00,$00
	dc.b	$00,$00,$FF,$E8,$00,$00,$00,$02,$0A,$00,$00,$2D,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$09,$00,$00,$36,$00,$00,$00,$00,$FF,$E8,$00,$00,$0A,$00,$00,$2D
	dcb.b	$8, 0
	dc.b	$09,$00,$00,$36,$00,$00,$FF,$F8,$FF,$E8,$00,$00,$00,$01,$0E,$00
	dc.b	$00,$21,$00,$00,$FF,$F8,$00,$00,$00,$00,$09,$00,$00,$36,$00,$00
	dc.b	$FF,$F8,$FF,$E8,$00,$00,$00,$02,$0A,$00,$00,$2D,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$09,$00,$00,$36,$00,$00,$FF,$F8,$FF,$E8,$00,$00,$00,$01,$00,$0A
	dc.b	$00,$06,$00,$01,$0E,$00,$00,$B6,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$0D,$00,$00,$C2,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$04,$00,$0A
	dc.b	$00,$2C,$00,$0A,$00,$12,$00,$0A,$00,$46,$00,$0A,$00,$12,$00,$01
	dc.b	$0E,$00,$00,$B6,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$00,$00,$C2
	dcb.b	$4, 0
	dc.b	$FF,$E8,$00,$00,$00,$01,$0E,$00,$00,$CA,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$0D,$00,$00,$D6,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$01
	dc.b	$0E,$00,$00,$CA,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$00,$00,$DE
	dcb.b	$4, 0
	dc.b	$FF,$E8,$00,$00,$00,$02,$00,$0A,$00,$0A,$00,$0A,$00,$24,$00,$01
	dc.b	$0E,$00,$00,$CA,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$00,$00,$D6
	dcb.b	$4, 0
	dc.b	$FF,$E8,$00,$00,$00,$01,$0E,$00,$00,$CA,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$0D,$00,$00,$DE,$00,$00,$00,$00,$FF,$E8,$00,$00,$00,$04
	dc.b	$00,$28,$00,$12,$00,$14,$00,$20,$00,$14,$00,$2E,$00,$0A,$00,$2E
	dc.b	$00,$00,$05,$00,$00,$E6,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$05,$00,$00,$EA,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$00
	dc.b	$00,$EE,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$02,$00,$06
	dc.b	$00,$01,$0F,$00,$00,$31,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$00
	dc.b	$00,$41,$FF,$F8,$00,$08,$FF,$E0,$00,$00,$00,$02,$00,$28,$00,$0A
	dc.b	$00,$14,$00,$30,$00,$02,$0B,$00,$00,$00,$FF,$F8,$00,$00,$00,$00
	dc.b	$00,$00,$08,$00,$00,$0C,$00,$00,$FF,$F8,$FF,$E0,$00,$00,$04,$00
	dc.b	$00,$0F,$FF,$E8,$00,$08,$FF,$E0,$00,$00,$00,$02,$0F,$00,$00,$9D
	dcb.b	$8, 0
	dc.b	$08,$00,$00,$0C,$00,$00,$FF,$F8,$FF,$E0,$00,$00,$04,$00,$00,$0F
	dc.b	$FF,$E8,$00,$08,$FF,$E0,$00,$00,$00,$02,$00,$14,$00,$0A,$00,$14
	dc.b	$00,$30,$00,$02,$0F,$00,$00,$11,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$08,$00,$00,$0C,$00,$00,$FF,$F8,$FF,$E0,$00,$00,$04,$00,$00,$0F
	dc.b	$FF,$E8,$00,$08,$FF,$E0,$00,$00,$00,$02,$0F,$00,$00,$21,$00,$00
	dcb.b	$6, 0
	dc.l	$0800000C
	dc.l	$0000FFF8
	dc.l	$FFE00000
	dc.l	$0400000F
	dc.l	$FFE80008
	dc.l	$FFE00000
	dc.l	$00020002
	dc.l	$000A0002
	dc.l	$00300002
	dc.l	$0F000045
	dcb.b	$8, 0
	dc.l	$09000055
	dc.l	$FFF80000
	dc.l	$FFE00000
	dc.l	$0A0000B3
	dc.l	$0004FFF4
	dc.l	$FFF40000
	dc.l	$00020F00
	dc.l	$00450000
	dcb.b	$6, 0
	dc.b	$09,$00,$00,$55,$FF,$F8,$00,$00,$FF,$E0,$00,$00,$0F,$00,$00,$BC
	dc.b	$00,$0C,$FF,$F4,$FF,$F8,$00,$00,$00,$02,$00,$02,$00,$0A,$00,$02
	dc.b	$00,$30,$00,$02,$05,$00,$00,$AB,$FF,$EC,$00,$04,$FF,$F0,$00,$00
	dc.b	$0F,$00,$00,$5B,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$00,$00,$6B
	dc.b	$FF,$F8,$00,$08,$FF,$E0,$00,$00,$00,$01,$0F,$00,$00,$5B,$00,$00
	dcb.b	$6, 0
	dc.l	$0D00006B
	dc.l	$FFF80008
	dc.l	$FFE00000
	dc.l	$00020014
	dc.l	$000A0014
	dc.l	$00240001
	dc.l	$0F000073
	dcb.b	$8, 0
	dc.l	$0C000083
	dc.l	$FFF80008
	dc.l	$FFE00000
	dc.l	$00010F00
	dc.l	$00310000
	dcb.b	$6, 0
	dc.b	$0C,$00,$00,$41,$FF,$F8,$00,$08,$FF,$E0,$00,$00,$00,$01,$00,$28
	dc.b	$00,$0A,$00,$28,$00,$24,$00,$01,$0F,$00,$00,$31,$00,$00,$00,$00
	dcb.b	$4, 0
	dc.b	$0C,$00,$00,$41,$FF,$F8,$00,$08,$FF,$E0,$00,$00,$00,$01,$0F,$00
	dc.b	$00,$97,$FF,$F8,$00,$00,$FF,$F8,$00,$00,$0C,$00,$00,$A7,$FF,$F8
	dc.b	$00,$08,$FF,$D8,$00,$00,$00,$02,$00,$02,$00,$0A,$00,$02,$00,$30
	dc.b	$00,$02,$0F,$00,$00,$97,$FF,$F8,$00,$00,$FF,$F8,$00,$00,$0C,$00
	dc.b	$00,$A7,$FF,$F8,$00,$00,$FF,$D8,$00,$00,$05,$00,$00,$AF,$FF,$FC
	dc.b	$FF,$EE,$FF,$EC,$00,$00,$00,$02,$0F,$00,$00,$97,$FF,$F8,$00,$00
	dc.b	$FF,$F8,$00,$00,$0C,$00,$00,$A7,$FF,$F8,$00,$00,$FF,$D8,$00,$00
	dc.b	$0A,$00,$00,$B3,$00,$02,$FF,$F0,$FF,$F0,$00,$00,$00,$02,$00,$04
	dc.b	$00,$0A,$00,$04,$00,$18,$00,$00,$05,$00,$00,$00,$00,$00,$00,$00
	dcb.b	$6, 0
	dc.l	$05000004
	dcb.b	$9, 0
	dc.b	$02,$00,$04,$00,$0A,$00,$04,$00,$18,$00,$00,$05,$00,$00,$08,$00
	dcb.b	$9, 0
	dc.b	$05,$00,$00,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$04
	dc.b	$00,$0A,$00,$04,$00,$18,$00,$00,$05,$00,$00,$10,$00,$00,$00,$00
	dcb.b	$6, 0
	dc.l	$05000014
	dcb.b	$9, 0
	dc.b	$02,$00,$0C,$00,$0A,$00,$0C,$00,$18,$00,$00,$06,$00,$00,$18,$00
	dcb.b	$9, 0
	dc.b	$06,$00,$00,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$06
	dc.b	$00,$0A,$00,$06,$00,$18,$00,$00,$09,$00,$00,$24,$00,$00,$00,$00
	dcb.b	$6, 0
	dc.l	$0900002A
	dcb.b	$9, 0
	dc.b	$02,$00,$06,$00,$0A,$00,$06,$00,$18,$00,$00,$09,$00,$00,$30,$00
	dcb.b	$9, 0
	dc.b	$09,$00,$00,$36,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$0C
	dc.b	$00,$0A,$00,$0C,$00,$18,$00,$00,$06,$00,$00,$3C,$00,$00,$00,$00
	dcb.b	$6, 0
	dc.l	$06000042
	dcb.b	$8, 0
L_FF67D0:
	dc.b	$00
	dc.b	$00,$01,$88,$01,$94,$01,$A0,$01,$AC,$01,$B8,$01,$C4,$01,$D0,$01
	dc.b	$DC,$01,$E8,$01,$F4,$00,$4C,$00,$70,$00,$7C,$00,$88,$00,$58,$00
	dc.b	$64,$00,$94,$00,$A0,$00,$AC,$00,$B8,$00,$C4,$00,$D0,$00,$DC,$00
	dc.b	$E8,$00,$F4,$01,$00,$01,$0C,$01,$1C,$01,$28,$01,$34,$01,$40,$01
	dc.b	$4C,$01,$58,$01,$64,$01,$70,$01,$7C,$02,$00,$00,$00,$00,$01,$00
	dc.b	$02,$00,$03,$00,$04,$00,$05,$00,$06,$00,$07,$00,$08,$00,$07,$00
	dc.b	$09,$00,$0A,$00,$06,$00,$07,$00,$08,$00,$07,$00,$0B,$00,$0C,$00
	dc.b	$0D,$00,$0E,$00,$08,$00,$0F,$00,$10,$00,$11,$00,$12,$08,$12,$00
	dc.b	$0B,$00,$13,$00,$14,$08,$14,$00,$0D,$00,$15,$00,$0B,$08,$0B,$00
	dc.b	$10,$00,$16,$00,$12,$08,$12,$00,$0B,$00,$17,$00,$18,$00,$19,$00
	dc.b	$1A,$08,$1A,$00,$1B,$08,$1B,$00,$0B,$08,$0B,$00,$1C,$00,$1D,$00
	dc.b	$1E,$00,$1F,$00,$1E,$00,$1F,$00,$0C,$00,$20,$00,$0C,$00,$21,$00
	dc.b	$22,$00,$23,$00,$1A,$00,$24,$00,$25,$00,$26,$00,$0B,$00,$27,$08
	dc.b	$20,$00,$0C,$08,$21,$00,$0C,$08,$21,$00,$28,$00,$29,$00,$2A,$00
	dc.b	$2B,$00,$2C,$00,$2D,$00,$2E,$00,$2F,$08,$1A,$00,$30,$00,$31,$00
	dc.b	$32,$00,$33,$00,$12,$08,$12,$00,$0B,$08,$0B,$00,$14,$08,$14,$08
	dc.b	$20,$00,$34,$08,$21,$00,$35,$08,$21,$00,$0C,$00,$12,$08,$12,$00
	dc.b	$0B,$08,$0B,$00,$14,$00,$36,$00,$0C,$00,$37,$00,$0D,$00,$38,$00
	dc.b	$39,$00,$3A,$00,$0B,$08,$0B,$08,$38,$00,$38,$00,$3B,$00,$3C,$00
	dc.b	$3D,$08,$3D,$00,$3E,$00,$3F,$00,$1E,$00,$1F,$00,$1E,$00,$1F,$00
	dc.b	$1A,$08,$1A,$00,$0B,$08,$0B,$00,$14,$08,$14,$00,$40,$00,$41,$00
	dc.b	$42,$00,$43,$00,$44,$00,$45,$00,$46,$00,$47,$00,$48,$00,$49,$00
	dc.b	$4A,$00,$4B,$00,$4C,$00,$4D,$00,$4E,$00,$4F,$00,$50,$00,$51,$00
	dc.b	$52,$00,$53,$00,$54,$00,$55,$00,$56,$00,$1F,$00,$57,$00,$58,$00
	dc.b	$59,$00,$5A,$00,$5B,$00,$5C,$00,$12,$08,$12,$00,$0B,$08,$0B,$00
	dc.b	$14,$08,$14,$00,$5D,$00,$1D,$00,$1E,$00,$1F,$00,$5E,$00,$1F,$00
	dc.b	$12,$08,$12,$00,$5F,$00,$60,$00,$61,$00,$62,$00,$12,$08,$12,$00
	dc.b	$63,$00,$64,$00,$65,$08,$14,$00,$66,$00,$67,$00,$68,$00,$69,$00
	dc.b	$6A,$00,$6B,$00,$06,$08,$57,$00,$6C,$00,$6D,$00,$6E,$08,$14,$00
	dc.b	$12,$08,$12,$00,$6F,$00,$70,$00,$14,$08,$14,$00,$71,$00,$72,$00
	dc.b	$73,$00,$74,$00,$75,$00,$76,$00,$12,$08,$12,$00,$77,$08,$77,$00
	dc.b	$14,$08,$14,$00,$12,$08,$12,$00,$78,$00,$79,$00,$6E,$08,$14,$00
	dc.b	$0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00,$7A
ObjectAnimationData:
	dc.b	$00
	dc.b	$40,$00,$70,$00,$A0,$00,$D0,$01,$00,$01,$30,$01,$60,$01,$90,$01
	dc.b	$C0,$01,$F0,$02,$20,$02,$50,$02,$80,$02,$B0,$02,$E0,$03,$10,$03
	dc.b	$40,$03,$10,$02,$E0,$02,$B0,$02,$80,$02,$50,$02,$20,$01,$F0,$01
	dc.b	$C0,$01,$90,$01,$60,$01,$30,$01,$00,$00,$D0,$00,$A0,$00,$70,$00
	dc.b	$00,$0E,$86,$0E,$A8,$0E,$CA,$0E,$CC,$0E,$64,$0E,$64,$0E,$64,$0E
	dc.b	$64,$0E,$CC,$0E,$CC,$0E,$CC,$0E,$CC,$0E,$64,$FF,$FF,$FF,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$0E,$66,$0E,$88,$0E,$AA,$0E,$AC,$0E,$44,$0E,$44,$0E,$44,$0E
	dc.b	$44,$0E,$AE,$0E,$AC,$0E,$AC,$0E,$AC,$0E,$44,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$0E,$46,$0E,$68,$0E,$8A,$0E,$8C,$0E,$24,$0E,$24,$0E,$24,$0E
	dc.b	$24,$0E,$8C,$0E,$8C,$0E,$8C,$0E,$8C,$0E,$24,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$0E,$26,$0E,$48,$0E,$6A,$0E,$6C,$0E,$04,$0E,$04,$0E,$04,$0E
	dc.b	$04,$0E,$6C,$0E,$6C,$0E,$6C,$0E,$6C,$0E,$04,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$0C,$26,$0C,$48,$0C,$6A,$0C,$6C,$0C,$04,$0C,$04,$0C,$04,$0E
	dc.b	$A0,$0C,$6C,$0C,$6C,$0C,$6C,$0E,$A0,$0C,$04,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$0C,$06,$0C,$48,$0C,$4A,$0C,$4C,$0C,$04,$0C,$04,$0C,$04,$0E
	dc.b	$A0,$0C,$4C,$0C,$4C,$0C,$4C,$0E,$A0,$0C,$04,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$0A,$06,$0A,$08,$0A,$0A,$0A,$0C,$0A,$04,$0A,$04,$0A,$04,$0E
	dc.b	$A0,$0A,$2C,$0A,$2C,$0A,$2C,$0E,$A0,$0A,$04,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$08,$06,$08,$08,$08,$0A,$08,$0C,$08,$04,$08,$04,$0E,$40,$0E
	dc.b	$A0,$08,$0C,$08,$0C,$0E,$60,$0E,$A0,$08,$04,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$08,$04,$08,$06,$08,$08,$08,$0A,$08,$02,$08,$02,$0E,$40,$0E
	dc.b	$A0,$08,$0A,$08,$0A,$0E,$60,$0E,$A0,$08,$02,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$0C,$66,$0E,$88,$0E,$CC,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$08,$02,$08,$04,$08,$06,$08,$08,$08,$00,$08,$00,$0E,$40,$0E
	dc.b	$A0,$08,$08,$08,$08,$0E,$60,$0E,$A0,$08,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$08,$44,$0C,$66,$0C,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$08,$00,$08,$02,$08,$04,$08,$06,$08,$00,$0E,$40,$0E,$A0,$0E
	dc.b	$EE,$08,$06,$0E,$60,$0E,$A0,$0E,$EE,$08,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$08,$44,$0C,$66,$0C,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$08,$00,$08,$00,$08,$02,$08,$04,$08,$00,$0E,$40,$0E,$A0,$0E
	dc.b	$EE,$08,$00,$0E,$40,$0E,$A0,$0E,$EE,$08,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$08,$44,$0C,$66,$0C,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$0E,$40,$0E,$A0,$0E
	dc.b	$EE,$08,$00,$0E,$40,$0E,$A0,$0E,$EE,$08,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$08,$44,$0C,$66,$0C,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$06,$00,$06,$00,$06,$00,$06,$00,$08,$00,$0E,$40,$0E,$A0,$0E
	dc.b	$EE,$08,$00,$0E,$40,$0E,$A0,$0E,$EE,$06,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$08,$44,$0C,$66,$0C,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$04,$00,$04,$00,$04,$00,$04,$00,$08,$00,$0E,$40,$0E,$A0,$0E
	dc.b	$EE,$08,$00,$0E,$40,$0E,$A0,$0E,$EE,$04,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$08,$44,$0C,$66,$0C,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dc.b	$00,$02,$00,$02,$00,$02,$00,$02,$00,$08,$00,$0E,$40,$0E,$A0,$0E
	dc.b	$EE,$08,$00,$0E,$40,$0E,$A0,$0E,$EE,$02,$00,$0F,$FF,$0F,$FF,$00
	dc.b	$00,$04,$44,$06,$66,$0A,$AA,$0E,$EE,$02,$2A,$00,$08,$00,$04,$00
	dcb.b	$9, 0
	dc.b	$08,$00,$0E,$40,$0E,$A0,$0E,$EE,$08,$00,$0E,$40,$0E,$A0,$0E,$EE
	dc.b	$00,$00,$0F,$FF,$0F,$FF,$00,$00,$04,$44,$06,$66,$0A,$AA,$0E,$EE
	dc.b	$02,$2A,$00,$08,$00,$04
PaletteAnimationData:
	dc.b	$00
	dc.b	$04,$00,$14,$00,$00,$00,$66,$00,$AA,$00,$EE,$00,$00,$00,$00,$00
	dcb.b	$5, 0
	dc.b	$06,$66,$0A,$AA,$0E,$EE,$00,$00,$00,$00,$00,$00,$00,$00
PaletteSequence:
	dc.b	$03
	dc.b	$0C,$00,$04,$00,$06,$00,$08,$00,$78,$00,$06,$00,$08,$00,$82,$00
	dc.b	$06,$00,$08,$00,$8C,$00,$06,$00,$08,$00,$96,$00,$06,$00,$08,$03
	dc.b	$0C,$00,$04,$00,$06,$00,$08,$00,$78,$00,$06,$00,$08,$00,$82,$00
	dc.b	$06,$00,$08,$00,$8C,$00,$06,$00,$08,$00,$96,$00,$06,$00,$08

; END_GENERATED_THANKS_MAIN
