; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; "Thank You" screen Sub CPU program
; -------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Sub CPU.inc"

; -------------------------------------------------------------------------
; Program start
; -------------------------------------------------------------------------

	org	$10000

Start:
	move.l	#IRQ1,_LEVEL1+2.w		; Set the level 1 interrupt handler
	move.b	#0,GAMEMMODE.w			; Set to 2M mode

	moveq	#0,d0				; Clear communication statuses
	move.l	d0,GACOMSTAT0.w
	move.l	d0,GACOMSTAT4.w
	move.l	d0,GACOMSTAT8.w
	move.l	d0,GACOMSTATC.w
	move.b	d0,GASUBFLAG.w

	bset	#7,GASUBFLAG.w			; Mark as started
	bclr	#1,GAIRQMASK.w			; Disable graphics interrupt
	bclr	#3,GAIRQMASK.w			; Disable timer interrupt
	move.b	#3,GACDCDEVICE.w			; Set CDC device to "Sub CPU"

	lea	PRGRAM+$1C000,a0			; Clear the program RAM work area
	move.w	#$7FF,d7

.ClearProgramRAM:
	move.l	#0,(a0)+
	dbra	d7,.ClearProgramRAM

	bsr.w	WaitWordRAMAccess
	bra.s	EnableInterrupts

; -------------------------------------------------------------------------
; Clear Word RAM
; -------------------------------------------------------------------------

ClearWordRAM:
	lea	WORDRAM2M,a0
	move.w	#$7FFF,d7

.ClearWordRAM:
	move.l	#0,(a0)+
	move.l	#0,(a0)+
	dbra	d7,.ClearWordRAM

EnableInterrupts:
	bset	#1,GAIRQMASK.w			; Enable graphics interrupt
	bclr	#7,GASUBFLAG.w			; Clear started flag

MainLoop:
	bsr.w	WaitWordRAMAccess
	bsr.w	ProcessCommand
	bsr.w	GiveWordRAMAccess

	btst	#6,GAMAINFLAG.w			; Is the Main CPU exiting?
	bne.s	ThankYouExit
	bra.w	MainLoop

ThankYouExit:
	bsr.w	SetExitFlag
	nop
	nop
	nop
	rts

; -------------------------------------------------------------------------
; Set the exit flag and wait for the Main CPU
; -------------------------------------------------------------------------

SetExitFlag:
	bset	#6,GASUBFLAG.w

.Wait:
	btst	#6,GAMAINFLAG.w
	bne.s	.Wait

	bclr	#6,GASUBFLAG.w
	rts

; -------------------------------------------------------------------------
; Wait for a command from the Main CPU
; -------------------------------------------------------------------------

WaitMainCPU:
	move.w	GACOMCMD2.w,d0
	beq.w	WaitMainCPU
	move.w	GACOMCMD2.w,GACOMSTAT2.w

.Wait:
	tst.w	GACOMCMD2.w
	bne.s	.Wait

	move.w	#0,GACOMSTAT2.w
	rts

; -------------------------------------------------------------------------
; Give Word RAM access to the Main CPU
; -------------------------------------------------------------------------

GiveWordRAMAccess:
	btst	#0,GAMEMMODE.w
	bne.s	.End
	bset	#0,GAMEMMODE.w

.Wait:
	btst	#0,GAMEMMODE.w
	beq.s	GiveWordRAMAccess

.End:
	rts

; -------------------------------------------------------------------------
; Wait for Word RAM access
; -------------------------------------------------------------------------

WaitWordRAMAccess:
	btst	#1,GAMEMMODE.w
	beq.s	WaitWordRAMAccess
	rts

; -------------------------------------------------------------------------
; Level 1 interrupt handler
; -------------------------------------------------------------------------

IRQ1:
	move.b	#0,$1C800.l
	rte

; -------------------------------------------------------------------------
; Process a "Thank You" screen command
; -------------------------------------------------------------------------

ProcessCommand:
	moveq	#0,d0
	move.b	WORDRAM2M+$20,d0			; Is a command pending?
	beq.s	.End

	subq.w	#1,d0
	cmpi.w	#$B,d0				; Is the command ID valid?
	bcc.s	.Error

	add.w	d0,d0
	lea	CommandTable.l,a0
	move.w	(a0,d0.w),d0
	moveq	#0,d1
	jsr	(a0,d0.w)
	bcs.s	.Error

	move.b	#0,WORDRAM2M+$21
	bra.s	.GetReturnValues

.Error:
	move.b	#$FF,WORDRAM2M+$21

.GetReturnValues:
	move.w	d0,WORDRAM2M+$22
	move.w	d1,WORDRAM2M+$24
	clr.b	WORDRAM2M+$20

.End:
	rts

; -------------------------------------------------------------------------
; Backup RAM command table
; -------------------------------------------------------------------------

CommandTable:
	dc.w	Cmd_InitBuRAM-CommandTable
	dc.w	Cmd_BuRAMStatus-CommandTable
	dc.w	Cmd_SearchBuRAM-CommandTable
	dc.w	Cmd_ReadBuRAM-CommandTable
	dc.w	Cmd_WriteBuRAM-CommandTable
	dc.w	Cmd_DeleteBuRAM-CommandTable
	dc.w	Cmd_FormatBuRAM-CommandTable
	dc.w	Cmd_GetBuRAMDir-CommandTable
	dc.w	Cmd_VerifyBuRAM-CommandTable
	dc.w	Cmd_ReadSaveData-CommandTable
	dc.w	Cmd_WriteSaveData-CommandTable

; -------------------------------------------------------------------------
; Initialize Backup RAM interaction
; -------------------------------------------------------------------------

Cmd_InitBuRAM:
	lea	BuRAMScratch.l,a0
	lea	BuRAMStrings.l,a1
	moveq	#BRMINIT,d0
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Get Backup RAM status
; -------------------------------------------------------------------------

Cmd_BuRAMStatus:
	moveq	#BRMSTAT,d0
	movea.l	#BuRAMStrings,a1
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Search Backup RAM
; -------------------------------------------------------------------------

Cmd_SearchBuRAM:
	movea.l	#WORDRAM2M+$30,a0
	move.b	#0,$B(a0)
	move.l	#0,$C(a0)
	moveq	#BRMSERCH,d0
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Read from Backup RAM
; -------------------------------------------------------------------------

Cmd_ReadBuRAM:
	movea.l	#WORDRAM2M+$30,a0
	move.b	#0,$B(a0)
	move.l	#0,$C(a0)
	movea.l	#WORDRAM2M+$40,a1
	moveq	#BRMREAD,d0
	jsr	_BURAM.w
	rts

; -------------------------------------------------------------------------
; Read save data
; -------------------------------------------------------------------------

Cmd_ReadSaveData:
	tst.b	WORDRAM2M+$28
	bne.s	.LoadSaveData
	bsr.s	Cmd_ReadBuRAM
	bsr.w	CopySaveDataToWordRAM
	move.w	#0,WORDRAM2M+$22
	move.w	#0,WORDRAM2M+$24
	rts

.LoadSaveData:
	bsr.w	CopySaveDataFromWordRAM
	move.w	#0,WORDRAM2M+$22
	move.w	#0,WORDRAM2M+$24
	rts

; -------------------------------------------------------------------------
; Write to Backup RAM
; -------------------------------------------------------------------------

Cmd_WriteBuRAM:
	movea.l	#WORDRAM2M+$30,a0
	move.b	WORDRAM2M+$29,$B(a0)
	move.w	WORDRAM2M+$2A,$C(a0)
	movea.l	#WORDRAM2M+$40,a1
	moveq	#BRMWRITE,d0
	jsr	_BURAM.w
	rts

; -------------------------------------------------------------------------
; Write save data
; -------------------------------------------------------------------------

Cmd_WriteSaveData:
	tst.b	WORDRAM2M+$28
	bne.s	.WriteSaveData
	bsr.s	Cmd_WriteBuRAM
	bsr.w	CopySaveDataToWordRAM
	move.w	#0,WORDRAM2M+$22
	move.w	#0,WORDRAM2M+$24
	rts

.WriteSaveData:
	bsr.w	CopySaveDataToWordRAM
	move.w	#0,WORDRAM2M+$22
	move.w	#0,WORDRAM2M+$24
	rts

; -------------------------------------------------------------------------
; Delete Backup RAM data
; -------------------------------------------------------------------------

Cmd_DeleteBuRAM:
	movea.l	#WORDRAM2M+$30,a0
	move.b	#0,$B(a0)
	move.l	#0,$C(a0)
	moveq	#BRMDEL,d0
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Format Backup RAM
; -------------------------------------------------------------------------

Cmd_FormatBuRAM:
	moveq	#BRMFORMAT,d0
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Get Backup RAM directory
; -------------------------------------------------------------------------

Cmd_GetBuRAMDir:
	movea.l	#WORDRAM2M+$30,a0
	move.b	#0,$B(a0)
	move.l	#0,$C(a0)
	movea.l	#WORDRAM2M+$44,a1
	move.l	WORDRAM2M+$40,d1
	moveq	#BRMDIR,d0
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Verify Backup RAM
; -------------------------------------------------------------------------

Cmd_VerifyBuRAM:
	movea.l	#WORDRAM2M+$30,a0
	move.b	WORDRAM2M+$29,$B(a0)
	move.w	WORDRAM2M+$2A,$C(a0)
	movea.l	#WORDRAM2M+$40,a1
	moveq	#BRMVERIFY,d0
	jmp	_BURAM.w

; -------------------------------------------------------------------------
; Copy the temporary save data to Word RAM
; -------------------------------------------------------------------------

CopySaveDataToWordRAM:
	movem.l	d0/a0-a1,-(sp)
	movea.l	#WORDRAM2M+$40,a0
	movea.l	#$7400,a1
	move.w	#$AF,d0

.CopyToWordRAM:
	move.l	(a0)+,(a1)+
	dbra	d0,.CopyToWordRAM

	movem.l	(sp)+,d0/a0-a1
	rts

; -------------------------------------------------------------------------
; Copy the temporary save data from Word RAM
; -------------------------------------------------------------------------

CopySaveDataFromWordRAM:
	movem.l	d0/a0-a1,-(sp)
	movea.l	#$7400,a0
	movea.l	#WORDRAM2M+$40,a1
	move.w	#$AF,d0

.CopyFromWordRAM:
	move.l	(a0)+,(a1)+
	dbra	d0,.CopyFromWordRAM

	movem.l	(sp)+,d0/a0-a1
	rts

; -------------------------------------------------------------------------
; Runtime scratch areas
; -------------------------------------------------------------------------

BuRAMScratch:
	dcb.b	$640,0

BuRAMStrings:
	dcb.b	$C,0
