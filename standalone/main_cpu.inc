; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Memory map
; ------------------------------------------------------------------------------

CARTRIDGE		equ 0					; Cartridge start
CARTRIDGE_END		equ $3FFFFF				; Cartridge end
CARTRIDGE_SIZE		equ $400000				; Cartridge size

EXPANSION		equ $400000				; Expansion start
EXPANSION_END		equ $7FFFFF				; Expansion end
EXPANSION_SIZE		equ $400000				; Expansion size

Z80_RAM			equ $A00000				; Z80 RAM start
Z80_RAM_END		equ $A01FFF				; Z80 RAM end
Z80_RAM_SIZE		equ $2000				; Z80 RAM size

YM_REGS			equ $A04000				; YM2612 registers
YM_ADDR_0		equ $A04000				; YM2612 address port 0
YM_DATA_0		equ $A04001				; YM2612 data port 0
YM_ADDR_1		equ $A04002				; YM2612 address port 1
YM_DATA_1		equ $A04003				; YM2612 data port 1

IO_REGS			equ $A10000				; I/O registers
IO_VERSION		equ $A10001				; I/O version
IO_DATA_1		equ $A10003				; I/O data port 1
IO_DATA_2		equ $A10005				; I/O data port 2
IO_DATA_3		equ $A10007				; I/O data port 3
IO_CTRL_1		equ $A10009				; I/O control port 1
IO_CTRL_2		equ $A1000B				; I/O control port 2
IO_CTRL_3		equ $A1000D				; I/O control port 3

Z80_REGS		equ $A11100				; Z80 registers
Z80_BUS			equ $A11100				; Z80 bus request
Z80_RESET		equ $A11200				; Z80 reset

TMSS_SEGA		equ $A14000				; TMSS write register

VDP_DATA		equ $C00000				; VDP data port
VDP_CTRL		equ $C00004				; VDP control port
VDP_HV			equ $C00008				; VDP H/V counter
PSG_CTRL		equ $C00011				; PSG control port

WORK_RAM		equ $FF0000				; Work RAM start
WORK_RAM_END		equ $FFFFFF				; Work RAM end
WORK_RAM_SIZE		equ $10000				; Work RAM size

VECTOR_STACK		equ $FFFFFD00				; Stack base
VECTOR_VBLANK		equ $FFFFFD06				; V-BLANK interrupt
VECTOR_HBLANK		equ $FFFFFD0C				; H-BLANK interrupt
VECTOR_EXTERNAL		equ $FFFFFD12				; External interrupt
VECTOR_TRAP_0		equ $FFFFFD18				; TRAP #0 exception
VECTOR_TRAP_1		equ $FFFFFD1E				; TRAP #1 exception
VECTOR_TRAP_2		equ $FFFFFD24				; TRAP #2 exception
VECTOR_TRAP_3		equ $FFFFFD2A				; TRAP #3 exception
VECTOR_TRAP_4		equ $FFFFFD30				; TRAP #4 exception
VECTOR_TRAP_5		equ $FFFFFD36				; TRAP #5 exception
VECTOR_TRAP_6		equ $FFFFFD3C				; TRAP #6 exception
VECTOR_TRAP_7		equ $FFFFFD42				; TRAP #7 exception
VECTOR_TRAP_8		equ $FFFFFD48				; TRAP #8 exception
VECTOR_TRAP_9		equ $FFFFFD4E				; TRAP #9 exception
VECTOR_TRAP_10		equ $FFFFFD54				; TRAP #10 exception
VECTOR_TRAP_11		equ $FFFFFD5A				; TRAP #11 exception
VECTOR_TRAP_12		equ $FFFFFD60				; TRAP #12 exception
VECTOR_TRAP_13		equ $FFFFFD66				; TRAP #13 exception
VECTOR_TRAP_14		equ $FFFFFD6C				; TRAP #14 exception
VECTOR_TRAP_15		equ $FFFFFD72				; TRAP #15 exception
VECTOR_CHK		equ $FFFFFD78				; CHK exception
VECTOR_ADDRESS		equ $FFFFFD7E				; Address error
VECTOR_ILLEGAL		equ $FFFFFD7E				; Illegal instruction
VECTOR_DIVIDE		equ $FFFFFD84				; Division by zero
VECTOR_TRAPV		equ $FFFFFD8A				; TRAPV exception
VECTOR_LINE_A		equ $FFFFFD90				; Line A emulator
VECTOR_LINE_F		equ $FFFFFD96				; Line F emulator
VECTOR_PRIVILEGE	equ $FFFFFD9C				; Privilege violation
VECTOR_TRACE		equ $FFFFFDA2				; TRACE exception

; ------------------------------------------------------------------------------
; Reqeust Z80 bus access
; ------------------------------------------------------------------------------

z80RequestBus macro
	move.w	#$100,Z80_BUS
	endm

; ------------------------------------------------------------------------------
; Wait for Z80 bus access
; ------------------------------------------------------------------------------

z80WaitBus macro
.Wait\@:
	btst	#0,Z80_BUS
	bne.s	.Wait\@
	endm

; ------------------------------------------------------------------------------
; Get Z80 bus access
; ------------------------------------------------------------------------------

z80GetBus macro
	z80RequestBus
	z80WaitBus
	endm

; ------------------------------------------------------------------------------
; Release Z80 bus
; ------------------------------------------------------------------------------

z80ReleaseBus macro
	move.w	#0,Z80_BUS
	endm

; ------------------------------------------------------------------------------
; Start Z80 reset
; ------------------------------------------------------------------------------

z80ResetOn macro
	move.w	#0,Z80_RESET
	ror.b	#8,d0
	endm

; ------------------------------------------------------------------------------
; Stop Z80 reset
; ------------------------------------------------------------------------------

z80ResetOff macro
	move.w	#$100,Z80_RESET
	endm

; ------------------------------------------------------------------------------
; VDP command instruction
; ------------------------------------------------------------------------------
; PARAMETERS:
;	ins  - Instruction
;	addr - Address
;	type - Memory type
;	cmd  - Command type
;	dest - Destination (optional)
; ------------------------------------------------------------------------------

VDP_VRAM_WRITE		equ $40000000				; VRAM write
VDP_CRAM_WRITE		equ $C0000000				; CRAM write
VDP_VSRAM_WRITE		equ $40000010				; VSRAM write
VDP_VRAM_READ		equ $00000000				; VRAM read
VDP_CRAM_READ		equ $00000020				; CRAM read
VDP_VSRAM_READ		equ $00000010				; VSRAM read
VDP_VRAM_DMA		equ $40000080				; VRAM DMA
VDP_CRAM_DMA		equ $C0000080				; CRAM DMA
VDP_VSRAM_DMA		equ $40000090				; VSRAM DMA
VDP_VRAM_COPY		equ $000000C0				; VRAM DMA copy

; ------------------------------------------------------------------------------

vdpCmd macro ins, addr, type, cmd, dest
	if narg=5
		\ins #(VDP_\type\_\cmd\)|(((\addr)&$3FFF)<<16)|((\addr)/$4000),\dest
	else
		\ins (VDP_\type\_\cmd\)|(((\addr)&$3FFF)<<16)|((\addr)/$4000)
	endif
	endm

; ------------------------------------------------------------------------------
; VDP command instruction (low word)
; ------------------------------------------------------------------------------
; PARAMETERS:
;	ins  - Instruction
;	addr - Address
;	type - Memory type
;	cmd  - Command type
;	dest - Destination (optional)
; ------------------------------------------------------------------------------

vdpCmdLo macro ins, addr, type, cmd, dest
	if narg=5
		\ins #((VDP_\type\_\cmd\)&$FFFF)|((\addr)/$4000),\dest
	else
		\ins ((VDP_\type\_\cmd\)&$FFFF)|((\addr)/$4000)
	endif
	endm

; ------------------------------------------------------------------------------
; VDP command instruction (high word)
; ------------------------------------------------------------------------------
; PARAMETERS:
;	ins  - Instruction
;	addr - Address
;	type - Memory type
;	cmd  - Command type
;	dest - Destination (optional)
; ------------------------------------------------------------------------------

vdpCmdHi macro ins, addr, type, cmd, dest
	if narg=5
		\ins #((VDP_\type\_\cmd\)>>16)|((\addr)&$3FFF),\dest
	else
		\ins ((VDP_\type\_\cmd\)>>16)|((\addr)&$3FFF)
	endif
	endm

; ------------------------------------------------------------------------------
; VDP DMA
; ------------------------------------------------------------------------------
; PARAMETERS:
;	src  - Source 68000 address
;	dest - Destination VDP address
;	len  - Length
;	type - VDP memory type
;	a6.l - VDP control port
; ------------------------------------------------------------------------------

vdpDma2 macro src, dest, len, type
	move.l	#$93009400|((((\len)/2)&$FF00)>>8)|((((\len)/2)&$FF)<<16),(a6)
	move.l	#$95009600|((((\src)/2)&$FF00)>>8)|((((\src)/2)&$FF)<<16),(a6)
	move.w	#$9700|(((\src)>>17)&$7F),(a6)
	vdpCmdHi move.w,\dest,\type,DMA,(a6)
	vdpCmdLo move.w,\dest,\type,DMA,-(sp)
	move.w	(sp)+,(a6)
	vdpCmd move.l,\dest,\type,WRITE,(a6)
	move.w	\src,VDP_DATA
	endm

; ------------------------------------------------------------------------------
; VDP DMA (sets VDP control port in a6)
; ------------------------------------------------------------------------------
; PARAMETERS:
;	src  - Source 68000 address
;	dest - Destination VDP address
;	len  - Length
;	type - VDP memory type
; ------------------------------------------------------------------------------

vdpDma macro src, dest, len, type
	lea	VDP_CTRL,a6
	vdpDma2 \src,\dest,\len,\type
	endm

; ------------------------------------------------------------------------------
; Wait for a VRAM fill/copy to finish
; ------------------------------------------------------------------------------
; PARAMETERS:
;	status - VDP status (optional)
; ------------------------------------------------------------------------------

vramWait macro status
.Wait\@:
	if narg>0
		btst	#1,\status
	else
		move.w	VDP_CTRL,d0
		btst	#1,d0
	endif
	bne.s	.Wait\@
	endm

; ------------------------------------------------------------------------------
; VRAM fill
; ------------------------------------------------------------------------------
; PARAMETERS:
;	addr  - Address
;	len   - Length
;	value - Value
; ------------------------------------------------------------------------------

vramFill macro addr, len, value
	lea	VDP_CTRL,a6
	move.w	#$8F01,(a6)
	move.l	#$93009400|((((\len)-1)&$FF00)>>8)|((((\len)-1)&$FF)<<16),(a6)
	move.w	#$9780,(a6)
	vdpCmd move.l,\addr,VRAM,DMA,(a6)
	move.w	#(\value)<<8,VDP_DATA
	vramWait 1(a6)
	vdpCmd move.l,\addr,VRAM,WRITE,(a6)
	move.w	#((\value)<<8)|(\value),VDP_DATA
	move.w	#$8F02,(a6)
	endm

; ------------------------------------------------------------------------------
; VRAM copy
; ------------------------------------------------------------------------------
; PARAMETERS:
;	src  - Source address
;	dest - Destination address
;	len  - Length
; ------------------------------------------------------------------------------

vramCopy macro src, dest, len
	lea	VDP_CTRL,a6
	move.w	#$8F01,(a6)
	move.l	#$93009400|((((\len)-1)&$FF00)>>8)|((((\len)-1)&$FF)<<16),(a6)
	move.l	#$95009600|(((\src)&$FF00)>>8)|(((\src)&$FF)<<16),(a6)
	move.w	#$97C0,(a6)
	vdpCmd move.l,\dest,VRAM,COPY,(a6)
	vramWait 1(a6)
	move.w	#$8F02,(a6)
	endm

; ------------------------------------------------------------------------------
