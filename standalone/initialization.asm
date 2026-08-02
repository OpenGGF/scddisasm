; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Standalone ROM header and initialization
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Vector table
; ------------------------------------------------------------------------------

	org 0
	dc.l	VECTOR_STACK					; Stack pointer
	dc.l	HardReset					; Reset
	dc.l	Exception					; Bus error
	dc.l	VECTOR_ADDRESS					; Address error
	dc.l	VECTOR_ILLEGAL					; Illegal instruction
	dc.l	VECTOR_DIVIDE					; Division by zero
	dc.l	VECTOR_CHK					; CHK exception
	dc.l	VECTOR_TRAPV					; TRAPV exception
	dc.l	VECTOR_PRIVILEGE				; Privilege violation
	dc.l	VECTOR_TRACE					; TRACE exception
	dc.l	VECTOR_LINE_A					; Line A exception
	dc.l	VECTOR_LINE_F					; Line F exception

	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved

	dc.l	Exception					; Spurious exception
	dc.l	Exception					; Interrupt level 1
	dc.l	VECTOR_EXTERNAL					; External interrupt
	dc.l	Exception					; Interrupt level 3
	dc.l	VECTOR_HBLANK					; H-BLANK interrupt
	dc.l	Exception					; Interrupt level 5
	dc.l	VECTOR_VBLANK					; V-BLANK interrupt
	dc.l	Exception					; Interrupt level 7

	dc.l	VECTOR_TRAP_0					; TRAP #0 exception
	dc.l	VECTOR_TRAP_1					; TRAP #1 exception
	dc.l	VECTOR_TRAP_2					; TRAP #2 exception
	dc.l	VECTOR_TRAP_3					; TRAP #3 exception
	dc.l	VECTOR_TRAP_4					; TRAP #4 exception
	dc.l	VECTOR_TRAP_5					; TRAP #5 exception
	dc.l	VECTOR_TRAP_6					; TRAP #6 exception
	dc.l	VECTOR_TRAP_7					; TRAP #7 exception
	dc.l	VECTOR_TRAP_8					; TRAP #8 exception
	dc.l	VECTOR_TRAP_9					; TRAP #9 exception
	dc.l	VECTOR_TRAP_10					; TRAP #10 exception
	dc.l	VECTOR_TRAP_11					; TRAP #11 exception
	dc.l	VECTOR_TRAP_12					; TRAP #12 exception
	dc.l	VECTOR_TRAP_13					; TRAP #13 exception
	dc.l	VECTOR_TRAP_14					; TRAP #14 exception
	dc.l	VECTOR_TRAP_15					; TRAP #15 exception

	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved
	dc.l	Exception					; Reserved

; ------------------------------------------------------------------------------
; ROM header
; ------------------------------------------------------------------------------

	dc.b	"SEGA MEGA DRIVE "
	dc.b	"(C)SEGA 1993.AUG"
	dc.b	"SONIC THE HEDGEHOG-CD                           "
	dc.b	"SONIC THE HEDGEHOG-CD                           "
	dc.b	"GM MK-4407 -00"
	dc.w	0
	dc.b	"J               "
	dc.l	CARTRIDGE, CARTRIDGE_END
	dc.l	WORK_RAM, WORK_RAM_END
	dc.l	$20202020
	dc.l	$20202020, $20202020
	dc.b	"            "
	dc.b	"                                        "
	dc.b	"JUE             "

; ------------------------------------------------------------------------------
; Hooks
; ------------------------------------------------------------------------------

	dc.l	VBlank						; VBlank

; ------------------------------------------------------------------------------
; Exception
; ------------------------------------------------------------------------------

Exception:
	bra.w	*						; Loop forever

; ------------------------------------------------------------------------------
; Hard reset
; ------------------------------------------------------------------------------

HardReset:
	lea	InitAddresses(pc),a0				; Get addresses
	movem.l	(a0)+,a1-a6

	moveq	#$F,d0						; Get hardware version
	move.b	IO_VERSION,d3
	and.b	d3,d0						; Is this a TMSS system?
	beq.s	.NoTmss						; If not, branch
	move.l	CARTRIDGE+$100,TMSS_SEGA			; If so, satisfy it

.NoTmss:
	vramWait 1(a6)						; Wait for leftover VRAM copy/fill to finish

	moveq	#(VdpSetupEnd-VdpSetup)/2-1,d1			; Length of VDP setup data

.SetupVdp:
	move.w	(a0)+,(a6)					; Set VDP register
	dbf	d1,.SetupVdp					; Loop until all of them are set
	
	moveq	#0,d0						; Perform VRAM clear
	move.w	d0,(a5)
	vramWait 1(a6)
	move.w	#$8F02,(a6)
	
	vdpCmd move.l,0,CRAM,WRITE,(a6)				; Set CRAM write command
	moveq	#$80/4-1,d1					; Length of CRAM
	
.ClearCram:
	move.l	d0,(a5)						; Clear CRAM
	dbf	d1,.ClearCram					; Loop until CRAM is cleared
	
	vdpCmd move.l,0,VSRAM,WRITE,(a6)			; Set VSRAM write command
	moveq	#$50/4-1,d1					; Length of VSRAM
	
.ClearVsram:
	move.l	d0,(a5)						; Clear VSRAM
	dbf	d1,.ClearVsram					; Loop until VSRAM is cleared
	
	moveq	#$FFFFFF9F,d2					; PSG1 silence
	moveq	#4-1,d1						; Number of PSG channels
	
.SilencePsg:
	move.b	d2,PSG_CTRL-VDP_CTRL(a6)			; Silence PSG channel
	addi.b	#$20,d2						; Next PSG channel
	dbf	d1,.SilencePsg					; Loop until all PSG channels are silenced
	
	move.w	#$100,d2					; Stop the Z80
	move.w	d2,(a3)
	move.w	d2,(a4)						; Stop Z80 reset

.WaitZ80Stop:
	btst	d0,(a3)						; Has the Z80 stopped?
	bne.s	.WaitZ80Stop					; If not, wait

	move.w	#Z80ProgramEnd-Z80Program-1,d1			; Length of Z80 program

.LoadZ80Program:
	move.b	(a0)+,(a2)+					; Load Z80 program
	dbf	d1,.LoadZ80Program				; Loop until Z80 program is loaded

	move.w	#(Z80_RAM_SIZE-(Z80ProgramEnd-Z80Program))-1,d1	; Remaining length of Z80 RAM

.ClearZ80Ram:
	move.b	d0,(a2)+					; Clear the rest of Z80 RAM
	dbf	d1,.ClearZ80Ram					; Loop until finished
	
	move.w	d0,(a4)						; Reset the Z80
	rol.b	#8,d0
	move.w	d0,(a3)						; Start the Z80
	move.w	d2,(a4)						; Stop Z80 reset
	
	movea.l	d0,a6						; Set base of work RAM
	move.l	a6,usp						; Set user stack pointer

	move.w	#WORK_RAM_SIZE/4-1,d1				; Length of work RAM
	
.ClearWorkRam:
	move.l	d0,-(a6)					; Clear work RAM
	dbf	d1,.ClearWorkRam				; Loop until work RAM is cleared
	
	moveq	#(VectorAddressesEnd-VectorAddresses)/4-1,d1	; Jump table entry count
	move.w	#$4EF9,d2					; Jump opcode

.SetupVectors:
	move.w	d2,(a1)+					; Set opcode
	move.l	(a0)+,(a1)+					; Set address
	dbf	d1,.SetupVectors				; Loop until finished
	
	move.b	d3,system_version				; Set system version
	move.l	#"init",initialized				; Mark as initialized

	movem.l	(a6),d0-a6					; Clear registers
	
; ------------------------------------------------------------------------------
; Soft reset
; ------------------------------------------------------------------------------

SoftReset:
	bsr.w	InitVdp						; Initialize the VDP
	bsr.w	InitJoypads					; Initialize joypads
	bsr.w	InitBlockWrite					; Initialize block write

	move.w	#(STAGE_ZONE<<8)|STAGE_ACT,zone			; Set stage ID
	move.b	#STAGE_TIME,time_zone				; Set time zone
	move.b	#STAGE_GOOD_FUTURE,good_future			; Set good future
	move.w	#DEBUG,debug_cheat				; Set debug cheat flag
	
	move.b	#0,game_mode					; Start stage
	bsr.w	InitStage

	lea	WORK_RAM,a0					; Clear work RAM
	moveq	#0,d0
	move.w	#((VECTOR_STACK&$FFFFFF)-WORK_RAM)/4-1,d1

.ClearWorkRam:
	move.l	d0,(a0)+
	dbf	d1,.ClearWorkRam

	bra.s	SoftReset					; Loop

; ------------------------------------------------------------------------------
; Addresses
; ------------------------------------------------------------------------------

InitAddresses:
	dc.l	VECTOR_VBLANK					; a1: Vector jump table
	dc.l	Z80_RAM						; a2: Z80 RAM
	dc.l	Z80_BUS						; a3: Z80 bus port
	dc.l	Z80_RESET					; a4: Z80 reset port
	dc.l	VDP_DATA					; a5: VDP data port
	dc.l	VDP_CTRL					; a6: VDP control port
	
; ------------------------------------------------------------------------------
; VDP setup data
; ------------------------------------------------------------------------------

VdpSetup:
	dc.w	$8000|%00000100					; Disable H-BLANK interrupt
	dc.w	$8100|%00110100					; Enable DMA and V-BLANK interrupt, disable display
	dc.w	$8200|($C000>>10)				; Plane A VRAM address
	dc.w	$8300|($D000>>10)				; Window plane VRAM address
	dc.w	$8400|($E000>>13)				; Plane B VRAM address
	dc.w	$8500|($F800>>9)				; Sprite table VRAM address
	dc.w	$8700						; Background color
	dc.w	$8ADF						; H-BLANK interrupt counter
	dc.w	$8B00|%00000000					; Full screen scroll, disable external interrupt
	dc.w	$8C00|%10000001					; H40 mode, disable shadow/highlight and interlacing
	dc.w	$8D00|($FC00>>10)				; Hortizontal scroll table VRAM address
	dc.w	$8F01						; Auto-increment (for VRAM clear)
	dc.w	$9100						; Window horizontal position
	dc.w	$9200						; Window vertical position
	dc.w	$93FF						; VRAM clear length
	dc.w	$94FF
	dc.w	$9780						; VRAM clear mode
	vdpCmd dc.l,0,VRAM,DMA					; VRAM clear command
VdpSetupEnd:

; ------------------------------------------------------------------------------
; Z80 program
; ------------------------------------------------------------------------------

Z80Program:
	incbin	"standalone/z80.bin"
	even
Z80ProgramEnd:

; ------------------------------------------------------------------------------
; Vector jump table addresses
; ------------------------------------------------------------------------------

VectorAddresses:
	dc.l	VBlank						; V-BLANK interrupt
	dc.l	HBlank						; H-BLANK interrupt
	dc.l	Exception					; External interrupt
	dc.l	Exception					; TRAP #0 exception
	dc.l	Exception					; TRAP #1 exception
	dc.l	Exception					; TRAP #2 exception
	dc.l	Exception					; TRAP #3 exception
	dc.l	Exception					; TRAP #4 exception
	dc.l	Exception					; TRAP #5 exception
	dc.l	Exception					; TRAP #6 exception
	dc.l	Exception					; TRAP #7 exception
	dc.l	Exception					; TRAP #8 exception
	dc.l	Exception					; TRAP #9 exception
	dc.l	Exception					; TRAP #10 exception
	dc.l	Exception					; TRAP #11 exception
	dc.l	Exception					; TRAP #12 exception
	dc.l	Exception					; TRAP #13 exception
	dc.l	Exception					; TRAP #14 exception
	dc.l	Exception					; TRAP #15 exception
	dc.l	Exception					; CHK exception
	dc.l	Exception					; Address error/Illegal instruction
	dc.l	Exception					; Division by zero
	dc.l	Exception					; TRAPV exception
	dc.l	Exception					; Line A exception
	dc.l	Exception					; Line F exception
	dc.l	Exception					; Privilege violation
	dc.l	Exception					; TRACE exception
VectorAddressesEnd:

; ------------------------------------------------------------------------------