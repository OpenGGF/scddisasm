; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Main CPU pencil test FMV handler
; ------------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/MMD.inc"

; ------------------------------------------------------------------------------
; Variables
; ------------------------------------------------------------------------------

	rsset	WORKRAM+$FF008000
frameDMA	rs.b	12

	rsset	WORKRAM+$FF00C080
frameCount	rs.w	1
curDataAddr	rs.l	1
readRoutine	rs.w	1
unkC088		rs.w	1
paletteLine	rs.w	1
paletteDelay	rs.w	1

	rsset	WORKRAM+$FF00C000
palette		rs.b	$20
paletteCopy	rs.b	$20
paletteFade	rs.b	$20

	rsset	WORKRAM+$FF00FA00
vsyncFlag	rs.b	1
		rs.b	$3F
vintRoutine	rs.w	1
timer		rs.w	1
vintCounter	rs.w	1
vdpRegLocal	rs.w	1
		rs.b	2
p1CtrlData	rs.b	0
p1CtrlHold	rs.b	1
p1CtrlTap	rs.b	1
p2CtrlData	rs.b	0
p2CtrlHold	rs.b	1
p2CtrlTap	rs.b	1

	rsset	WORKRAM+$FF00FDB6
vdpReg1	rs.w	1

; ------------------------------------------------------------------------------
; MMD header
; ------------------------------------------------------------------------------

	MMD	MMDSUBM, &
		WORKRAMFILE, $3000, &
		JmpTo_Start, 0, JmpTo_VInt

; ------------------------------------------------------------------------------
; Program start
; ------------------------------------------------------------------------------

JmpTo_Start:
	jmp	Start

JmpTo_VInt:
	jmp	VInterrupt

	dc.l	$C040
	dc.b	'PENCILE TEST anm'

Start:
	clr.w	vintRoutine.w

	bclr	#1,GAMAINFLAG
	move.l	#VInterrupt,(_LEVEL6+2)&$FFFFFF
	move.b	#0,GAMAINFLAG

	bsr.w	Wait1MMode
	bsr.w	InitMD

	lea	VDPDATA,a5
	lea	4(a5),a4

	lea	frameDMA.w,a0
	move.w	#$FFF,d7

.ClearRAM:
	clr.l	(a0)+
	dbra	d7,.ClearRAM

	bsr.w	ClearPalette
	bsr.w	DrawFMVTilemaps
	bsr.w	DrawBorder

	bset	#6,vdpReg1+1.w
	move.w	vdpReg1.w,VDPCTRL

	bsr.w	LoadPaletteTables

	move.w	#0,GACOMCMD2
	bset	#1,GAMAINFLAG

.WaitSubCPU:
	btst	#7,GASUBFLAG
	bne.s	.WaitSubCPU

	bclr	#1,GAMAINFLAG
	bclr	#4,GAMAINFLAG
	bsr.w	WaitWordRAMSwap

	clr.w	vintRoutine.w
	move.w	#4,readRoutine.w

; ------------------------------------------------------------------------------
; Main loop
; ------------------------------------------------------------------------------

MainLoop:
	moveq	#0,d0
	move.w	readRoutine.w,d0
	lea	FrameReadIndex(pc),a1
	adda.w	(a1,d0.w),a1
	jsr	(a1)

	bsr.s	VSync

	btst	#1,GASUBFLAG
	beq.s	MainLoop
	btst	#1,GASUBFLAG
	beq.s	MainLoop
	btst	#1,GASUBFLAG
	beq.s	MainLoop

	bsr.s	Exit
	clr.b	GAMAINFLAG
	bsr.w	FadeToBlack
	rts

VSync:
	move.b	#1,vsyncFlag.w

.Wait:
	tst.b	vsyncFlag.w
	bne.s	.Wait
	rts

Exit:
	clr.w	vintRoutine.w
	move.w	#$3C,d1

.Delay:
	bsr.w	VSync
	dbra	d1,.Delay

	bset	#4,GAMAINFLAG

.WaitSubCPU:
	btst	#1,GASUBFLAG
	bne.s	.WaitSubCPU
	btst	#1,GASUBFLAG
	bne.s	.WaitSubCPU
	btst	#1,GASUBFLAG
	bne.s	.WaitSubCPU
FrameRead_Null:
	rts

; ------------------------------------------------------------------------------
; Frame read dispatch
; ------------------------------------------------------------------------------

FrameReadIndex:
	dc.w	FrameRead_Null-FrameReadIndex
	dc.w	FrameRead_Null-FrameReadIndex
	dc.w	FrameRead_Start-FrameReadIndex
	dc.w	FrameRead_Sect1-FrameReadIndex
	dc.w	FrameRead_Sect2-FrameReadIndex
	dc.w	FrameRead_Sect3_1-FrameReadIndex
	dc.w	FrameRead_Sect3_2-FrameReadIndex
	dc.w	FrameRead_NextFrame-FrameReadIndex

FrameRead_Start:
	lea	WORDRAM2M,a0
	cmpi.w	#$3135,(a0)
	beq.s	.SkipHeader
	nop
.SkipHeader:
	lea	$10(a0),a0

	lea	palette.w,a1
	movea.l	a1,a3
	lea	$20(a1),a2
	moveq	#7,d7

.CopyPalette:
	move.l	(a1)+,(a2)+
	dbra	d7,.CopyPalette

	movea.l	a3,a1
	moveq	#7,d7

.LoadPalette:
	move.l	(a0)+,(a1)+
	dbra	d7,.LoadPalette

	lea	frameDMA.w,a2
	move.w	#1,(a2)+
	move.l	#$42000000,d0
	move.l	d0,(a2)+
	move.l	a0,(a2)+
	move.w	#$960,(a2)+
	lea	$12C0(a0),a0
	move.l	a0,curDataAddr.w
	move.w	#6,readRoutine.w
	rts

FrameRead_Sect1:
	lea	frameDMA.w,a2
	move.w	#1,(a2)+
	move.l	#$54C00000,d0
	move.l	d0,(a2)+
	move.l	a0,(a2)+
	move.w	#$900,(a2)+
	addq.w	#1,frameCount.w
	move.w	#8,readRoutine.w
	rts

FrameRead_Sect2:
	move.w	#$A,readRoutine.w
	bra.w	WaitWordRAMSwap

FrameRead_Sect3_1:
	lea	WORDRAM2M,a0
	cmpi.w	#$3135,(a0)
	beq.s	.SkipHeader
	nop
.SkipHeader:
	lea	$10(a0),a0

	lea	palette.w,a1
	movea.l	a1,a3
	lea	$20(a1),a2
	moveq	#7,d7

.CopyPalette:
	move.l	(a1)+,(a2)+
	dbra	d7,.CopyPalette

	movea.l	a3,a1
	moveq	#7,d7

.LoadPalette:
	move.l	(a0)+,(a1)+
	dbra d7,.LoadPalette

	lea	frameDMA.w,a2
	move.w	#1,(a2)+
	move.l	#$66C00000,d0
	move.l	d0,(a2)+
	move.l	a0,(a2)+
	move.w	#$960,(a2)+
	lea	$12C0(a0),a0
	move.l	a0,curDataAddr.w
	move.w	#$C,readRoutine.w
	rts

FrameRead_Sect3_2:
	lea	frameDMA.w,a2
	move.w	#1,(a2)+
	move.l	#$79800000,d0
	move.l	d0,(a2)+
	move.l	a0,(a2)+
	move.w	#$900,(a2)+
	move.w	#$E,readRoutine.w
	rts

FrameRead_NextFrame:
	move.w	#4,readRoutine.w
	bra.w	WaitWordRAMSwap

; ------------------------------------------------------------------------------
; Fade palette
; ------------------------------------------------------------------------------

LoadPaletteTables:
	move.w	#0,paletteLine.w

.LoadLine:
	move.w	#8,paletteDelay.w
	move.w	paletteLine.w,d0
	lsl.w	#5,d0
	lea	paletteFade.w,a2
	moveq	#15,d7
	lea	FramePaletteTable(pc,d0.w),a1

.CopyLine:
	move.w	(a1)+,(a2)+
	dbra	d7,.CopyLine

	st.b	unkC088.w

.Wait:
	bsr.w	VSync
	subq.w	#1,paletteDelay.w
	bne.s	.Wait
	addq.w	#1,paletteLine.w
	cmpi.w	#8,paletteLine.w
	bne.s	.LoadLine
	rts

FadeToBlack:
	move.w	#7,paletteLine.w

.FadeLine:
	move.w	#8,paletteDelay.w
	move.w	paletteLine.w,d0
	lsl.w	#5,d0
	lea	FramePaletteTable(pc,d0.w),a1
	lea	paletteFade.w,a2
	lea	paletteCopy.w,a3
	moveq	#15,d7

.CopyLine:
	move.w	(a1),(a2)+
	move.w	(a1)+,(a3)+
	dbra	d7,.CopyLine

	st.b	unkC088.w

.Wait:
	bsr.w	VSync
	subq.w	#1,paletteDelay.w
	bne.s	.Wait
	subq.w	#1,paletteLine.w
	bpl.s	.FadeLine
	rts

; ------------------------------------------------------------------------------
; Frame palette tables
; ------------------------------------------------------------------------------

FramePaletteTable:
	dc.l	$00000000, $00000000, $00000000, $00000000, $00000000, $00000000, $00000000, $00000000
	dc.l	$02000000, $00000000, $00000200, $02220000, $02000000, $00000002, $00020000, $00000000
	dc.l	$04220200, $00000000, $00000422, $04440002, $04200000, $00000004, $00040000, $00000000
	dc.l	$06440422, $02000000, $00000644, $06660004, $06420000, $00000006, $00060000, $00000000
	dc.l	$08660644, $04220200, $00000866, $08880006, $08640002, $00000008, $02280002, $00000000
	dc.l	$0A880866, $06440422, $02000A88, $0AAA0008, $0A860004, $0000022A, $044A0004, $00000000
	dc.l	$0CAA0A88, $08660644, $04220CAA, $0CCC022A, $0CA80006, $0002044C, $066C0226, $00000000
	dc.l	$0ECC0CAA, $0A880866, $06440ECC, $0EEE044C, $0ECA0228, $0224066E, $088E0448, $00000000

; ------------------------------------------------------------------------------
; Draw FMV tilemaps
; ------------------------------------------------------------------------------

DrawFMVTilemaps:
	moveq	#$10,d4
	move.l	#$47120003,d0
	move.w	#$14,d1
	move.w	#$D,d2
	bsr.s	.DrawRows

	move.w	#$136,d4
	move.l	#$47920003,d0
	move.w	#$14,d1
	move.w	#$D,d2

.DrawRows:
	move.l	d0,(a4)
	move.l	d1,d3

.DrawTiles:
	move.w	d4,(a5)
	addq.w	#1,d4
	dbra	d3,.DrawTiles
	addi.l	#$1000000,d0
	dbra	d2,.DrawRows
	rts

ClearPalette:
	moveq	#$1F,d7
	lea	palette.w,a1

.ClearLoop:
	clr.l	(a1)+
	dbra	d7,.ClearLoop
	rts

Wait1MMode:
	btst	#2,GAMEMMODE
	beq.s	Wait1MMode
	rts

CheckFMVStop:
	btst	#7,p1CtrlHold.w
	beq.s	.End
	bset	#2,GAMAINFLAG
.End:
	rts

InitMD:
	lea	VDPRegs(pc),a1
	jsr	BIOS_SetVDPRegs.w

	move.w	#$100,Z80BUS.l
.WaitZ80:
	btst	#0,Z80BUS.l
	bne.s	.WaitZ80

	lea	VDPCTRL.l,a6
	move.w	#$8F01,(a6)
	move.l	#$93FF94FF,(a6)
	move.w	#$9780,(a6)
	move.l	#$40000080,(a6)
	move.w	#0,VDPDATA.l

.WaitVDP:
	btst	#1,1(a6)
	bne.s	.WaitVDP

	move.l	#$40000000,(a6)
	move.w	#0,VDPDATA.l
	move.w	#$8F02,(a6)
	move.l	#$40000003,VDPCTRL.l

	move.w	#$FFF,d7
.FillPlane:
	move.w	#$E7E1,VDPDATA.l
	dbra	d7,.FillPlane
	move.l	#$C0000000,VDPCTRL.l

	moveq	#$1F,d7
	moveq	#0,d0
.ClearVSRAM:
	move.l	d0,VDPDATA.l
	dbra	d7,.ClearVSRAM

	move.l	#$40000010,VDPCTRL.l
	move.l	#0,VDPDATA.l
	move.w	#0,Z80BUS.l
	move.w	#$8134,vdpReg1.w
	rts

VDPRegs:
	dc.w	$8004, $8134, $8230, $8300, $8405, $8570, $8600, $8710
	dc.w	$8A00, $8B00, $8C81, $8D39, $8F02, $9003, $9100, $9200
	dc.w	$0000

ReadControllers:
	lea	p1CtrlData.w,a0
	lea	IODATA1,a1
	bsr.s	ReadController

	lea	p2CtrlData.w,a0
	lea	IODATA2,a1

ReadController:
	move.b	#0,(a1)
	tst.w	(a0)
	move.b	(a1),d0
	lsl.b	#2,d0
	andi.b	#$C0,d0

	move.b	#$40,(a1)
	tst.w	(a0)
	move.b	(a1),d1
	andi.b	#$3F,d1

	or.b	d1,d0
	not.b	d0
	move.b	d0,d1

	move.b	(a0),d2
	eor.b	d2,d0
	move.b	d1,(a0)+
	and.b	d1,d0
	move.b	d0,(a0)+
	rts

WaitWordRAMSwap:
	btst	#1,GASUBFLAG
	beq.s	.Ready
	btst	#1,GASUBFLAG
	beq.s	.Ready
	btst	#1,GASUBFLAG
	bne.s	.End

.Ready:
	btst	#0,GASUBFLAG
	beq.s	WaitWordRAMSwap
	btst	#0,GASUBFLAG
	beq.s	WaitWordRAMSwap
	btst	#0,GASUBFLAG
	beq.s	WaitWordRAMSwap
	btst	#2,GAMAINFLAG
	bne.s	WaitWordRAMSwap
	bset	#0,GAMAINFLAG

.WaitSubCPU:
	btst	#1,GAMEMMODE
	bne.s	.WaitSubCPU
	btst	#1,GAMEMMODE
	bne.s	.WaitSubCPU
	btst	#1,GAMEMMODE
	bne.s	.WaitSubCPU
	bclr	#0,GAMAINFLAG
.End:
	rts

DrawBorder:
	DMA68K	Map_Border,$7D00,$1900,VRAM

	VDPCMD	move.l,$A000,VRAM,WRITE,d0
	move.w	#$27,d1
	move.w	#$1B,d2
	lea	Art_Border(pc),a1
.DrawRow:
	move.l	d0,(a4)
	move.l	d1,d3

.DrawTile:
	move.w	(a1)+,(a5)
	dbra	d3,.DrawTile
	addi.l	#$1000000,d0
	dbra	d2,.DrawRow
	rts

VInterrupt:
	movem.l	d0-a6,-(sp)
	move.b	#1,GAIRQ2
	tst.b	vsyncFlag.w
	beq.w	VInterrupt_End
	clr.b	vsyncFlag.w

	lea	VDPDATA,a5
	lea	4(a5),a4
	move.w	(a4),d0

	move.l	#$C0000000,VDPCTRL.l
	moveq	#$F,d7
	lea	paletteCopy.w,a1

.CopyPalette:
	move.w	(a1)+,(a5)
	dbra	d7,.CopyPalette

	tst.b	unkC088.w
	beq.s	.SkipPaletteCopy
	clr.b	unkC088.w

	move.l	#$C0200000,VDPCTRL.l
	moveq	#$F,d7
	lea	paletteFade.w,a1

.CopyPalette2:
	move.w	(a1)+,(a5)
	dbra d7,.CopyPalette2

.SkipPaletteCopy:
	cmpi.w	#6,readRoutine.w
	bne.s	.CheckSecondDMA
	move.l	#$64000003,VDPCTRL.l
	move.l	#$02000000,(a5)
	bra.s	.AfterDMA

.CheckSecondDMA:
	cmpi.w	#$C,readRoutine.w
	bne.s	.AfterDMA
	move.l	#$64000003,VDPCTRL.l
	move.l	#0,(a5)
	move.l	#$C02A0000,VDPCTRL.l
	move.w	#$644,(a5)

.AfterDMA:
	lea	frameDMA.w,a0
	move.w	(a0),d7
	clr.w	(a0)+
	tst.w	d7
	beq.s	.NoDMA

	move.l	(a0)+,d0
	move.l	(a0)+,d1
	move.w	(a0)+,d2
	movem.l	d7/a0,-(sp)
	jsr	BIOS_DMA68k.w
	movem.l	(sp)+,d7/a0

.NoDMA:
	bset	#6,vdpReg1+1.w
	move.w	vdpReg1.w,VDPCTRL.l

VInterrupt_End:
	jsr	ReadControllers(pc)

VInterrupt_Return:
	movem.l	(sp)+,d0-a6
	rte

	include	"FMV/Data/Pencil Test.asm"
