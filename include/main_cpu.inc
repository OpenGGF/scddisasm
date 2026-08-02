; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Memory map
; ------------------------------------------------------------------------------

EXPANSION		equ 0					; Expansion start
EXPANSION_END		equ $3FFFFF				; Expansion end
EXPANSION_SIZE		equ $400000				; Expansion size

BIOS			equ 0					; BIOS start
BIOS_END		equ $1FFFF				; BIOS end
BIOS_SIZE		equ $20000				; BIOS size

PRG_BANK		equ $20000				; Program RAM bank start
PRG_BANK_END		equ $3FFFF				; Program RAM bank end
PRG_BANK_SIZE		equ $20000				; Program RAM bank size

WORD_RAM_1M		equ $200000				; Word RAM start (1M/1M)
WORD_RAM_1M_END		equ $21FFFF				; Word RAM end (1M/1M)
WORD_RAM_1M_SIZE	equ $20000				; Word RAM size (1M/1M)

WORD_RAM_IMAGE		equ $220000				; Word RAM image start (1M/1M)
WORD_RAM_IMAGE_END	equ $23FFFF				; Word RAM image end (1M/1M)
WORD_RAM_IMAGE_SIZE	equ $20000				; Word RAM image size (1M/1M)

WORD_RAM_2M		equ $200000				; Word RAM start (2M)
WORD_RAM_2M_END		equ $23FFFF				; Word RAM end (2M)
WORD_RAM_2M_SIZE	equ $40000				; Word RAM size (2M)

CARTRIDGE		equ $400000				; Cartridge start
CARTRIDGE_END		equ $7FFFFF				; Cartridge end
CARTRIDGE_SIZE		equ $400000				; Cartridge size

RAM_CART_ID		equ $400001				; RAM cartridge ID
RAM_CART_DATA		equ $600001				; RAM cartridge data start
RAM_CART_DATA_END	equ $6FFFFF				; RAM cartridge data end
RAM_CART_DATA_SIZE	equ $80000				; RAM cartridge data size
RAM_CART_WRITE		equ $7FFFFF				; RAM cartridge write enable

SPECIAL_CART_ID		equ $400010				; Special cartridge ID
SPECIAL_CART_CALL	equ $400020				; Special cartridge call

Z80_RAM			equ $A00000				; Z80 RAM start
Z80_END			equ $A01FFF				; Z80 RAM end
Z80_SIZE		equ $2000				; Z80 RAM size

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

MCD_REGS		equ $A12000				; Mega CD registers
MCD_INTERRUPT		equ $A12000				; Interrupt request
MCD_RESET		equ $A12001				; Reset
MCD_PROTECT		equ $A12002				; Program RAM write protection
MCD_MEMORY_MODE		equ $A12003				; Memory mode
MCD_CDC_DEVICE		equ $A12004				; CDC device destination
MCD_HBLANK		equ $A12006				; H-BLANK interrupt address
MCD_CDC_HOST		equ $A12008				; CDC host data
MCD_STOPWATCH		equ $A1200C				; Stopwatch
MCD_COMM_FLAGS		equ $A1200E				; Communication flags
MCD_MAIN_FLAG		equ $A1200E				; Main CPU flag
MCD_SUB_FLAG		equ $A1200F				; Sub CPU flag
MCD_COMM_DATA		equ $A12010				; Communication data
MCD_MAIN_DATA		equ $A12010				; Main CPU data
MCD_MAIN_DATA_0		equ $A12010				; Main CPU data 0
MCD_MAIN_DATA_1		equ $A12011				; Main CPU data 1
MCD_MAIN_DATA_2		equ $A12012				; Main CPU data 2
MCD_MAIN_DATA_3		equ $A12013				; Main CPU data 3
MCD_MAIN_DATA_4		equ $A12014				; Main CPU data 4
MCD_MAIN_DATA_5		equ $A12015				; Main CPU data 5
MCD_MAIN_DATA_6		equ $A12016				; Main CPU data 6
MCD_MAIN_DATA_7		equ $A12017				; Main CPU data 7
MCD_MAIN_DATA_8		equ $A12018				; Main CPU data 8
MCD_MAIN_DATA_9		equ $A12019				; Main CPU data 9
MCD_MAIN_DATA_10	equ $A1201A				; Main CPU data 10
MCD_MAIN_DATA_11	equ $A1201B				; Main CPU data 11
MCD_MAIN_DATA_12	equ $A1201C				; Main CPU data 12
MCD_MAIN_DATA_13	equ $A1201D				; Main CPU data 13
MCD_MAIN_DATA_14	equ $A1201E				; Main CPU data 14
MCD_MAIN_DATA_15	equ $A1201F				; Main CPU data 15
MCD_SUB_DATA		equ $A12020				; Sub CPU data
MCD_SUB_DATA_0		equ $A12020				; Sub CPU data 0
MCD_SUB_DATA_1		equ $A12021				; Sub CPU data 1
MCD_SUB_DATA_2		equ $A12022				; Sub CPU data 2
MCD_SUB_DATA_3		equ $A12023				; Sub CPU data 3
MCD_SUB_DATA_4		equ $A12024				; Sub CPU data 4
MCD_SUB_DATA_5		equ $A12025				; Sub CPU data 5
MCD_SUB_DATA_6		equ $A12026				; Sub CPU data 6
MCD_SUB_DATA_7		equ $A12027				; Sub CPU data 7
MCD_SUB_DATA_8		equ $A12028				; Sub CPU data 8
MCD_SUB_DATA_9		equ $A12029				; Sub CPU data 9
MCD_SUB_DATA_10		equ $A1202A				; Sub CPU data 10
MCD_SUB_DATA_11		equ $A1202B				; Sub CPU data 11
MCD_SUB_DATA_12		equ $A1202C				; Sub CPU data 12
MCD_SUB_DATA_13		equ $A1202D				; Sub CPU data 13
MCD_SUB_DATA_14		equ $A1202E				; Sub CPU data 14
MCD_SUB_DATA_15		equ $A1202F				; Sub CPU data 15

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
VECTOR_TRAP_0		equ $FFFFFD18				; TRAP #0
VECTOR_TRAP_1		equ $FFFFFD1E				; TRAP #1
VECTOR_TRAP_2		equ $FFFFFD24				; TRAP #2
VECTOR_TRAP_3		equ $FFFFFD2A				; TRAP #3
VECTOR_TRAP_4		equ $FFFFFD30				; TRAP #4
VECTOR_TRAP_5		equ $FFFFFD36				; TRAP #5
VECTOR_TRAP_6		equ $FFFFFD3C				; TRAP #6
VECTOR_TRAP_7		equ $FFFFFD42				; TRAP #7
VECTOR_TRAP_8		equ $FFFFFD48				; TRAP #8
VECTOR_TRAP_9		equ $FFFFFD4E				; TRAP #9
VECTOR_TRAP_10		equ $FFFFFD54				; TRAP #10
VECTOR_TRAP_11		equ $FFFFFD5A				; TRAP #11
VECTOR_TRAP_12		equ $FFFFFD60				; TRAP #12
VECTOR_TRAP_13		equ $FFFFFD66				; TRAP #13
VECTOR_TRAP_14		equ $FFFFFD6C				; TRAP #14
VECTOR_TRAP_15		equ $FFFFFD72				; TRAP #15
VECTOR_CHK		equ $FFFFFD78				; CHK exception
VECTOR_ADDRESS		equ $FFFFFD7E				; Address error
VECTOR_ILLEGAL		equ $FFFFFD7E				; Illegal instruction
VECTOR_DIVIDE		equ $FFFFFD84				; Division by zero
VECTOR_TRAPV		equ $FFFFFD8A				; TRAPV exception
VECTOR_LINE_A		equ $FFFFFD90				; Line A emulator
VECTOR_LINE_F		equ $FFFFFD96				; Line F emulator
VECTOR_PRIVILEGE	equ $FFFFFD9C				; Privilege violation
VECTOR_TRACE		equ $FFFFFDA2				; TRACE exception
BURAM_FUNCTION		equ $FFFFFDAE				; Backup RAM function

; ------------------------------------------------------------------------------
; Backup RAM function codes
; ------------------------------------------------------------------------------

BRMINIT			equ 0					; Initialize Backup RAM
BRMSTAT			equ 1					; Get Backup RAM status
BRMSERCH		equ 2					; Search Backup RAM
BRMREAD			equ 3					; Read Backup RAM data
BRMWRITE		equ 4					; Write Backup RAM data
BRMDEL			equ 5					; Delete Backup RAM data
BRMFORMAT		equ 6					; Format Backup RAM
BRMDIR			equ 7					; Get Backup RAM directory
BRMVERIFY		equ 8					; Verify Backup RAM data

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