; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; "Comin' Soon" screen main CPU program
; ------------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/MMD.inc"

	rsset	WORKRAM+$FF00C000
ComeSoonVDPData	rs.b	0

	rsset	WORKRAM+$FF008000
ComeSoonClearRAM	rs.b	0
		rs.b	$7900
ComeSoonPalette	rs.b	0
		rs.b	$80
ComeSoonPaletteCopy	rs.b	0
		rs.b	$80
ComeSoonVIntFlag	rs.b	0
		rs.b	$42
ComeSoonFrameTimer	rs.b	0
		rs.b	2
ComeSoonFrameCounter	rs.b	0
			rs.b	2
ComeSoonSavedSR	rs.b	0

; The data block follows the fixed MMD layout below. These addresses are kept
; explicit so the forward PC-relative references remain non-redefinable.
ComeSoonGfxList	EQU	$FF21D8
ComeSoonTilemap1	EQU	$FF26DC
ComeSoonTilemap2	EQU	$FF2DDC
ComeSoonTilemap3	EQU	$FF34DC

; ------------------------------------------------------------------------------
; MMD header
; ------------------------------------------------------------------------------

	MMD	0, &
		WORKRAMFILE, $3000, &
		Start, 0, 0

; ------------------------------------------------------------------------------
; Program start
; ------------------------------------------------------------------------------

Start:
	move.l	#VInterrupt,_LEVEL6+2.w
	bsr.w	WaitSubCPUStart

	lea	ComeSoonClearRAM.w,a0
	move.w	#$1EFF,d7

.ClearRAM:
	move.l	#0,(a0)+
	dbra	d7,.ClearRAM

	lea	ComeSoonVDPRegs(pc),a0
	bsr.w	InitMD

	move.l	#$40000010,$C00004.l
	move.l	#0,$C00000.l
	move.l	#$40000000,$C00004.l

	lea	ComeSoonGfxList(pc),a0
	bsr.w	LoadGraphics

	lea	ComeSoonTilemap1(pc),a1
	move.l	#$40000003,d0
	move.w	#$1F,d1
	move.w	#$1B,d2
	bsr.w	WriteTilemap

	lea	ComeSoonTilemap2(pc),a1
	move.l	#$40400003,d0
	move.w	#$1F,d1
	move.w	#$1B,d2
	bsr.w	WriteTilemap

	lea	ComeSoonTilemap3(pc),a1
	move.l	#$40800003,d0
	move.w	#$1F,d1
	move.w	#$1B,d2
	bsr.w	WriteTilemap

	move.w	#$3FF,ComeSoonFrameTimer.w
	lea	ComeSoonVDPRegs+$14(pc),a0
	lea	ComeSoonPalette.w,a1
	moveq	#7,d7

.CopyVDPRegs:
	move.l	(a0)+,(a1)+
	dbra	d7,.CopyVDPRegs

	bset	#1,$FF0F00.l

.WaitForStart:
	bsr.w	WaitVSync
	.WaitForStart2:
	bsr.w	WaitVSync
	move.b	$A1201F.l,d0
	andi.w	#$F0,d0
	bne.s	.GotStart
	tst.w	ComeSoonFrameTimer.w
	bne.w	.WaitForStart2

.GotStart:
	moveq	#$E,d0
	bsr.w	WaitDMA
	bsr.w	UpdatePalette
	rts

; ------------------------------------------------------------------------------
; V-BLANK interrupt
; ------------------------------------------------------------------------------

VInterrupt:
	movem.l	d0-d7/a0-a6,-(a7)
	move.b	#1,$A12000.l
	bclr	#0,$FF0F00.l
	beq.w	.VIntExit
	bset	#6,$FF0F17.l
	move.w	$FF0F16.l,$C00004.l
	bsr.w	WaitZ80
	move.w	$C00004.l,d0
	bclr	#1,$FF0F00.l
	beq.s	.NoDMA

	lea	$C00004.l,a6
	move.l	#$93409400,(a6)
	move.l	#$958096FC,(a6)
	move.w	#$977F,(a6)
	move.w	#$C000,(a6)
	move.w	#$80,-(a7)
	move.w	(a7)+,(a6)
	move.l	#$C0000000,(a6)
	move.w	ComeSoonPalette.w,$C00000.l

.NoDMA:
	move.l	#$64000002,$C00004.l
	move.w	$FF2176.l,$C00000.l
	jsr	InitControllers(pc)
	bsr.w	StopZ80
	tst.w	ComeSoonFrameTimer.w
	beq.s	.NoFrameTimer
	subq.w	#1,$FF2176.l
	subq.w	#1,ComeSoonFrameTimer.w

.NoFrameTimer:
	addq.w	#1,ComeSoonFrameCounter.w

.VIntExit:
	movem.l	(a7)+,d0-d7/a0-a6
	rte

	; The original has four unused bytes between the interrupt and the
	; Word-RAM handshake routines.
	dc.b	$01,$40,$00,$00

; ------------------------------------------------------------------------------
; Word-RAM handshakes
; ------------------------------------------------------------------------------

WaitSubCPUStart:
	btst	#1,$A12003.l
	bne.s	.Ready
	bset	#1,$A12003.l

.Wait:
	btst	#1,$A12003.l
	beq.s	.Wait

.Ready:
	rts

WaitSubCPUReady:
	btst	#0,$A12003.l
	beq.s	WaitSubCPUReady
	rts

; ------------------------------------------------------------------------------
; Screen data
; ------------------------------------------------------------------------------

	include	"Comin Soon/Data.asm"

; ------------------------------------------------------------------------------
; VDP tilemap writer
; ------------------------------------------------------------------------------

WriteTilemap:
	lea	$C00004.l,a2
	lea	$C00000.l,a3
	move.l	#$01000000,d4

.WriteRow:
	move.l	d0,(a2)
	move.w	d1,d3

.WriteColumn:
	move.w	(a1)+,(a3)
	dbra	d3,.WriteColumn
	add.l	d4,d0
	dbra	d2,.WriteRow
	rts

; ------------------------------------------------------------------------------
; Palette update routines
; ------------------------------------------------------------------------------

UpdatePalette:
	move.b	#1,ComeSoonVIntFlag.w
	moveq	#7,d6
	moveq	#0,d0
	moveq	#1,d1

.PaletteGroup1:
	bsr.s	UpdatePaletteLine
	addq.w	#2,d0
	dbra	d6,.PaletteGroup1

	moveq	#7,d6
	moveq	#0,d0
	moveq	#5,d1

.PaletteGroup2:
	bsr.s	UpdatePaletteLine
	addq.w	#2,d0
	dbra	d6,.PaletteGroup2

	moveq	#7,d6
	moveq	#0,d0
	moveq	#9,d1

.PaletteGroup3:
	bsr.s	UpdatePaletteLine
	addq.w	#2,d0
	dbra	d6,.PaletteGroup3
	rts

UpdatePaletteLine:
	lea	ComeSoonPalette.w,a1
	moveq	#$3F,d7

.Update:
	move.w	(a1),d2
	rol.w	#1,d2
	ror.w	d1,d2
	move.w	d2,d3
	andi.w	#$000E,d2
	andi.w	#$EEE0,d3
	sub.w	d0,d2
	bcc.s	.NoClamp
	moveq	#0,d2

.NoClamp:
	or.w	d3,d2
	ror.w	#1,d2
	rol.w	d1,d2
	move.w	d2,(a1)+
	dbra	d7,.Update
	bset	#1,$FF0F00.l
	bra.w	WaitVSync

CopyPalette:
	lea	ComeSoonPalette.w,a1
	lea	ComeSoonPaletteCopy.w,a2
	moveq	#0,d1
	moveq	#$1F,d7

.Copy:
	move.l	(a1),(a2)+
	move.l	d1,(a1)+
	dbra	d7,.Copy
	bset	#1,$FF0F00.l
	rts

UpdatePaletteDown:
	move.w	#7,d6
	moveq	#0,d0
	moveq	#9,d1

.Group1:
	bsr.w	UpdatePaletteLineDown
	addq.w	#2,d0
	dbra	d6,.Group1

	move.w	#7,d6
	moveq	#0,d0
	moveq	#5,d1

.Group2:
	bsr.w	UpdatePaletteLineDown
	addq.w	#2,d0
	dbra	d6,.Group2

	move.w	#7,d6
	moveq	#0,d0
	moveq	#1,d1

.Group3:
	bsr.w	UpdatePaletteLineDown
	addq.w	#2,d0
	dbra	d6,.Group3
	move.b	#0,ComeSoonVIntFlag.w
	rts

UpdatePaletteLineDown:
	lea	ComeSoonPalette.w,a1
	lea	ComeSoonPaletteCopy.w,a2
	moveq	#$3F,d7

.Update:
	move.w	(a2)+,d2
	move.w	(a1),d3
	rol.w	#1,d2
	rol.w	#1,d3
	ror.w	d1,d2
	ror.w	d1,d3
	andi.w	#$000E,d2
	andi.w	#$EEE0,d3
	cmp.w	d0,d2
	bls.s	.KeepCurrent
	move.w	d0,d2

.KeepCurrent:
	or.w	d3,d2
	rol.w	d1,d2
	ror.w	#1,d2
	move.w	d2,(a1)+
	dbra	d7,.Update
	bset	#1,$FF0F00.l
	bra.w	WaitVSync

UpdatePaletteUp:
	move.b	#1,ComeSoonVIntFlag.w
	moveq	#7,d6
	moveq	#1,d1

.Group1:
	bsr.s	UpdatePaletteLineUp
	dbra	d6,.Group1

	moveq	#7,d6
	moveq	#5,d1

.Group2:
	bsr.s	UpdatePaletteLineUp
	dbra	d6,.Group2

	moveq	#7,d6
	moveq	#9,d1

.Group3:
	bsr.s	UpdatePaletteLineUp
	dbra	d6,.Group3
	rts

UpdatePaletteLineUp:
	lea	ComeSoonPalette.w,a1
	moveq	#$3F,d7

.Update:
	move.w	(a1),d2
	rol.w	#1,d2
	ror.w	d1,d2
	move.w	d2,d3
	andi.w	#$000E,d2
	andi.w	#$EEE0,d3
	addq.w	#2,d2
	cmpi.w	#$000E,d2
	bls.s	.NoClamp
	moveq	#$000E,d2

.NoClamp:
	or.w	d3,d2
	ror.w	#1,d2
	rol.w	d1,d2
	move.w	d2,(a1)+
	dbra	d7,.Update
	bset	#1,$FF0F00.l
	bra.w	WaitVSync

CopyPaletteWhite:
	lea	ComeSoonPalette.w,a1
	lea	ComeSoonPaletteCopy.w,a2
	move.l	#$0EEE0EEE,d1
	moveq	#$1F,d7

.Copy:
	move.l	(a1),(a2)+
	move.l	d1,(a1)+
	dbra	d7,.Copy
	bset	#1,$FF0F00.l
	rts

UpdatePaletteDown2:
	moveq	#7,d6
	moveq	#$0E,d0
	moveq	#1,d1

.Group1:
	bsr.w	UpdatePaletteLineDown2
	subq.w	#2,d0
	dbra	d6,.Group1

	moveq	#7,d6
	moveq	#$0E,d0
	moveq	#5,d1

.Group2:
	bsr.w	UpdatePaletteLineDown2
	subq.w	#2,d0
	dbra	d6,.Group2

	moveq	#7,d6
	moveq	#$0E,d0
	moveq	#9,d1

.Group3:
	bsr.w	UpdatePaletteLineDown2
	subq.w	#2,d0
	dbra	d6,.Group3
	move.b	#0,ComeSoonVIntFlag.w
	rts

UpdatePaletteLineDown2:
	lea	ComeSoonPalette.w,a1
	lea	ComeSoonPaletteCopy.w,a2
	moveq	#$3F,d7

.Update:
	move.w	(a2)+,d2
	move.w	(a1),d3
	rol.w	#1,d2
	rol.w	#1,d3
	ror.w	d1,d2
	ror.w	d1,d3
	andi.w	#$000E,d2
	andi.w	#$EEE0,d3
	cmp.w	d0,d2
	bcc.s	.KeepCurrent
	move.w	d0,d2

.KeepCurrent:
	or.w	d3,d2
	rol.w	d1,d2
	ror.w	#1,d2
	move.w	d2,(a1)+
	dbra	d7,.Update
	bset	#1,$FF0F00.l
	bra.w	WaitVSync

; ------------------------------------------------------------------------------
; Mega Drive and graphics initialization
; ------------------------------------------------------------------------------

InitMD:
	move.w	#$8000,d0
	moveq	#$12,d7

.SetVDPRegs:
	move.b	(a0)+,d0
	move.w	d0,$C00004.l
	addi.w	#$100,d0
	dbra	d7,.SetVDPRegs

	moveq	#$40,d0
	move.b	d0,$A10009.l
	move.b	d0,$A1000B.l
	move.b	d0,$A1000D.l
	move.b	#$C0,$A10003.l
	bsr.w	WaitZ80

	move.l	#$40000000,$C00004.l
	lea	$C00000.l,a0
	moveq	#0,d0
	move.w	#$0FFF,d7

.ClearVRAM:
	move.l	d0,(a0)
	move.l	d0,(a0)
	move.l	d0,(a0)
	move.l	d0,(a0)
	dbra	d7,.ClearVRAM

	move.l	#$40000010,$C00004.l
	move.l	#0,$C00000.l
	bsr.w	StopZ80
	move.w	#$8134,$FF0F16.l
	rts

LoadGraphics:
	movem.l	d0-d7/a0-a1/a3-a5,-(a7)
	lea	$FF3F52.l,a3
	lea	$C00000.l,a4
	bra.s	LoadGraphicsCommon

LoadGraphicsAlt:
	movem.l	d0-d7/a0-a1/a3-a5,-(a7)
	lea	$FF3F68.l,a3

LoadGraphicsCommon:
	lea	ComeSoonVDPData.w,a1

.NextEntry:
	move.w	(a0)+,d2
	lsl.w	#1,d2
	bcc.s	.NoOffset
	adda.w	#$A,a3

.NoOffset:
	lsl.w	#2,d2
	movea.w	d2,a5
	moveq	#8,d3
	moveq	#0,d2
	moveq	#0,d4
	jsr	DecodeGraphics(pc)
	move.b	(a0)+,d5
	asl.w	#$8,d5
	move.b	(a0)+,d5
	move.w	#$10,d6
	bsr.s	DecodeGraphicsLine
	movem.l	(a7)+,d0-d7/a0-a1/a3-a5
	rts

DecodeGraphicsLine:
	move.w	d6,d7
	subq.w	#8,d7
	move.w	d5,d1
	lsr.w	d7,d1
	cmpi.b	#$FC,d1
	bcc.s	.LongCode
	andi.w	#$FF,d1
	add.w	d1,d1
	move.b	(a1,d1.w),d0
	ext.w	d0
	sub.w	d0,d6
	cmpi.w	#9,d6
	bcc.s	.ReadNext
	addq.w	#8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5

.ReadNext:
	move.b	$1(a1,d1.w),d1
	move.w	d1,d0
	andi.w	#$0F,d1
	andi.w	#$F0,d0

.WriteCode:
	lsr.w	#4,d0

.WriteByte:
	lsl.l	#4,d4
	or.b	d1,d4
	subq.w	#1,d3
	bne.s	.WriteLoop
	jmp	(a3)

.WritePixelsLoop:
	moveq	#0,d4
	moveq	#8,d3

.WriteLoop:
	dbra	d0,.WriteByte
	bra.s	DecodeGraphicsLine

.LongCode:
	subq.w	#6,d6
	cmpi.w	#9,d6
	bcc.s	.ReadLong
	addq.w	#8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5

.ReadLong:
	subq.w	#7,d6
	move.w	d5,d1
	lsr.w	d6,d1
	move.w	d1,d0
	andi.w	#$0F,d1
	andi.w	#$70,d0
	cmpi.w	#9,d6
	bcc.s	.WriteCode
	addq.w	#8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5
	bra.s	.WriteCode

.WritePixels:
	move.l	d4,(a4)
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	.WritePixelsLoop
	rts

.WritePixelsXor:
	eor.l	d4,d2
	move.l	d2,(a4)
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	.WritePixelsLoop
	rts

.WritePixelsInc:
	move.l	d4,(a4)+
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	.WritePixelsLoop
	rts

.WritePixelsXorInc:
	eor.l	d4,d2
	move.l	d2,(a4)+
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	.WritePixelsLoop
	rts

DecodeGraphics:
	move.b	(a0)+,d0

.DecodeGraphicsLoop:
	cmpi.b	#$FF,d0
	bne.s	.GetLength
	rts

.GetLength:
	move.w	d0,d7

.GetRunLength:
	move.b	(a0)+,d0
	cmpi.b	#$80,d0
	bcc.s	.DecodeGraphicsLoop
	move.b	d0,d1
	andi.w	#$0F,d7
	andi.w	#$70,d1
	or.w	d1,d7
	andi.w	#$0F,d0
	move.b	d0,d1
	lsl.w	#$8,d1
	or.w	d1,d7
	moveq	#8,d1
	sub.w	d0,d1
	bne.s	.LongRun
	move.b	(a0)+,d0
	add.w	d0,d0
	move.w	d7,(a1,d0.w)
	bra.s	.GetRunLength

.LongRun:
	move.b	(a0)+,d0
	lsl.w	d1,d0
	add.w	d0,d0
	moveq	#1,d5
	lsl.w	d1,d5
	subq.w	#1,d5

.FillRun:
	move.w	d7,(a1,d0.w)
	addq.w	#2,d0
	dbra	d5,.FillRun
	bra.s	.GetRunLength

GenerateTilemap:
	movem.l	d0-d7/a1-a5,-(a7)
	movea.w	d0,a3
	move.b	(a0)+,d0
	ext.w	d0
	movea.w	d0,a5
	move.b	(a0)+,d4
	lsl.b	#3,d4
	movea.w	(a0)+,a2
	adda.w	a3,a2
	movea.w	(a0)+,a4
	adda.w	a3,a4
	move.b	(a0)+,d5
	asl.w	#$8,d5
	move.b	(a0)+,d5
	moveq	#$10,d6

.NextTile:
	moveq	#7,d0
	move.w	d6,d7
	sub.w	d0,d7
	move.w	d5,d1
	lsr.w	d7,d1
	andi.w	#$7F,d1
	move.w	d1,d2
	cmpi.w	#$40,d1
	bcc.s	.NoHalf
	moveq	#6,d0
	lsr.w	#1,d2

.NoHalf:
	bsr.w	ReadTileBits
	andi.w	#$0F,d2
	lsr.w	#4,d1
	add.w	d1,d1
	jmp	.TileJumpTable(pc,d1.w)

.TileCopyA:
	move.w	a2,(a1)+
	addq.w	#1,a2
	dbra	d2,.TileCopyA
	bra.s	.NextTile

.TileCopyB:
	move.w	a4,(a1)+
	dbra	d2,.TileCopyB
	bra.s	.NextTile

.TileCopyC:
	bsr.w	ReadTileWord

.TileCopyCWrite:
	move.w	d1,(a1)+
	dbra	d2,.TileCopyCWrite
	bra.s	.NextTile

.TileCopyD:
	bsr.w	ReadTileWord

.TileCopyDWrite:
	move.w	d1,(a1)+
	addq.w	#1,d1
	dbra	d2,.TileCopyDWrite
	bra.s	.NextTile

.TileCopyE:
	bsr.w	ReadTileWord

.TileCopyEWrite:
	move.w	d1,(a1)+
	subq.w	#1,d1
	dbra	d2,.TileCopyEWrite
	bra.s	.NextTile

.TileCopyF:
	cmpi.w	#$0F,d2
	beq.s	.TileEnd

.TileCopyFRead:
	bsr.w	ReadTileWord
	move.w	d1,(a1)+
	dbra	d2,.TileCopyFRead
	bra.s	.NextTile

.TileJumpTable:
	bra.s	.TileCopyA
	bra.s	.TileCopyA
	bra.s	.TileCopyB
	bra.s	.TileCopyB
	bra.s	.TileCopyC
	bra.s	.TileCopyD
	bra.s	.TileCopyE
	bra.s	.TileCopyF

.TileEnd:
	subq.w	#1,a0
	cmpi.w	#$10,d6
	bne.s	.AlignTileData
	subq.w	#1,a0

.AlignTileData:
	move.w	a0,d0
	lsr.w	#1,d0
	bcc.s	.NoAlign
	addq.w	#1,a0

.NoAlign:
	movem.l	(a7)+,d0-d7/a1-a5
	rts

ReadTileWord:
	move.w	a3,d3
	move.b	d4,d1
	add.b	d1,d1
	bcc.s	.NoBit1
	subq.w	#1,d6
	btst.l	d6,d5
	beq.s	.NoBit1
	ori.w	#$8000,d3

.NoBit1:
	add.b	d1,d1
	bcc.s	.NoBit2
	subq.w	#1,d6
	btst.l	d6,d5
	beq.s	.NoBit2
	addi.w	#$4000,d3

.NoBit2:
	add.b	d1,d1
	bcc.s	.NoBit3
	subq.w	#1,d6
	btst.l	d6,d5
	beq.s	.NoBit3
	addi.w	#$2000,d3

.NoBit3:
	add.b	d1,d1
	bcc.s	.NoBit4
	subq.w	#1,d6
	btst.l	d6,d5
	beq.s	.NoBit4
	ori.w	#$1000,d3

.NoBit4:
	add.b	d1,d1
	bcc.s	.NoBit5
	subq.w	#1,d6
	btst.l	d6,d5
	beq.s	.NoBit5
	ori.w	#$0800,d3

.NoBit5:
	move.w	d5,d1
	move.w	d6,d7
	sub.w	a5,d7
	bcc.s	.ReadTileWordShort
	move.w	d7,d6
	addi.w	#$10,d6
	neg.w	d7
	lsl.w	d7,d1
	move.b	(a0),d5
	rol.b	d7,d5
	add.w	d7,d7
	and.w	TileBitMasks-2(pc,d7.w),d5
	add.w	d5,d1
.CombineTileWord:
	move.w	a5,d0
	add.w	d0,d0
	and.w	TileBitMasks-2(pc,d0.w),d1
	add.w	d3,d1
	move.b	(a0)+,d5
	lsl.w	#$8,d5
	move.b	(a0)+,d5
	rts

.ReadTileWordShort:
	beq.s	.ResetTileBits
	lsr.w	d7,d1
	move.w	a5,d0
	add.w	d0,d0
	and.w	TileBitMasks-2(pc,d0.w),d1
	add.w	d3,d1
	move.w	a5,d0
	bra.s	ReadTileBits

.ResetTileBits:
	moveq	#$10,d6
	bra.s	.CombineTileWord

TileBitMasks:
	dc.w	$0001,$0003,$0007,$000F,$001F,$003F,$007F,$00FF
	dc.w	$01FF,$03FF,$07FF,$0FFF,$1FFF,$3FFF,$7FFF,$FFFF

ReadTileBits:
	sub.w	d0,d6
	cmpi.w	#9,d6
	bcc.s	.ReadTileBitsDone
	addq.w	#8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5

.ReadTileBitsDone:
	rts

WaitZ80:
	move.w	sr,ComeSoonSavedSR.w
	move.w	#$2700,sr
	move.w	#$0100,$A11100.l

.Wait:
	btst	#0,$A11100.l
	bne.s	.Wait
	rts

StopZ80:
	move.w	#0,$A11100.l
	move.w	ComeSoonSavedSR.w,sr
	rts

InitControllers:
	lea	$A1201E.l,a5
	lea	$A10003.l,a6
	move.b	#0,(a6)
	tst.w	(a5)
	move.b	(a6),d0
	lsl.b	#2,d0
	andi.b	#$C0,d0
	move.b	#$40,(a6)
	tst.w	(a5)
	move.b	(a6),d1
	andi.b	#$3F,d1
	or.b	d1,d0
	not.b	d0
	move.b	d0,d1
	move.b	(a5),d2
	eor.b	d2,d0
	move.b	d1,(a5)+
	and.b	d1,d0
	move.b	d0,(a5)+
	rts

WaitVSync:
	bset	#0,$FF0F00.l
	move.w	#$2500,sr

.Wait:
	btst	#0,$FF0F00.l
	bne.s	.Wait
	rts

WaitDMA:
	move.w	d0,$A12010.l

.Wait:
	move.w	$A12020.l,d0
	beq.s	.Wait
	cmp.w	$A12020.l,d0
	bne.s	.Wait
	move.w	#0,$A12010.l

.WaitClear:
	move.w	$A12020.l,d0
	bne.s	.WaitClear

.WaitClear2:
	move.w	$A12020.l,d0
	bne.s	.WaitClear
	rts
