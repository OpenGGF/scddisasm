; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Initialize block write
; ------------------------------------------------------------------------------

InitBlockWrite:
	lea	block_write_buffer,a0				; Block write buffer
	move.w	#(block_write_buffer+$102)&$FFFF,(a0)+		; Set first chunk slot

	moveq	#0,d0						; Zero
	move.w	#$80-1,d1					; Number of chunk slots

.ClearSlots:
	move.w	d0,(a0)+					; Clear chunk slot
	dbf	d1,.ClearSlots					; Loop until finished
	rts

; ------------------------------------------------------------------------------
; Get written block (drawing)
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d3.w - Block data offset
; RETURNS:
;	d3.l - Block data address
; ------------------------------------------------------------------------------

GetWrittenBlock:
	lea	block_write_buffer,a0				; Get written chunk
	move.w	d3,-(sp)
	move.b	(sp)+,d0
	andi.w	#$FE,d0
	move.w	2(a0,d0.w),d0
	beq.s	.RomChunk					; If there's not one defined, use ROM instead

	andi.w	#$1FE,d3					; Get written block data address
	add.w	d3,d0
	move.w	d0,d3
	ext.l	d3
	rts

.RomChunk:
	addi.l	#StageChunks,d3					; Get ROM block data address
	rts

; ------------------------------------------------------------------------------
; Get written block (collision)
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d1.w - Block data offset
; RETURNS:
;	d1.l - Block data address
; ------------------------------------------------------------------------------

GetWrittenBlock2:
	lea	block_write_buffer,a1				; Get written chunk
	move.w	d1,-(sp)
	move.b	(sp)+,d0
	andi.w	#$FE,d0
	move.w	2(a1,d0.w),d0
	beq.s	.RomChunk					; If there's not one defined, use ROM instead

	andi.w	#$1FE,d1					; Get written block data address
	add.w	d1,d0
	move.w	d0,d1
	ext.l	d1
	rts

.RomChunk:
	addi.l	#StageChunks,d1					; Get ROM block data address
	rts

; ------------------------------------------------------------------------------
; Write block
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d3.w - Block data
;	a0.l - Block data address
; ------------------------------------------------------------------------------

WriteBlock:
	cmpi.l	#WORK_RAM,a0					; Is this block in a written chunk?
	bcc.w	.DoWrite					; If so, branch

	movem.l	d2/a2,-(sp)					; Save registers

	move.l	a0,d0						; Get chunk ID and block offset
	subi.l	#StageChunks,d0
	move.w	d0,d1
	andi.w	#$1FE,d1
	move.w	d0,-(sp)
	move.b	(sp)+,d0
	andi.w	#$FE,d0

	lea	block_write_buffer,a1				; Define new written chunk slot
	move.w	(a1),d2
	addi.w	#$200,(a1)
	move.w	d2,2(a1,d0.w)
	
	movea.l	a0,a1						; Get start of chunk
	suba.w	d1,a1
	movea.w	d2,a2						; Get write address
	rept $200/4						; Copy chunk data
		move.l	(a1)+,(a2)+
	endr

	movea.w	d2,a2						; Write block data
	move.w	d3,(a2,d1.w)
	
	movem.l	(sp)+,d2/a2					; Restore registers
	rts

.DoWrite:
	move.w	d3,(a0)						; Write block data
	rts

; ------------------------------------------------------------------------------
