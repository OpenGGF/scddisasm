; -------------------------------------------------------------------------
; USA legacy animation tail shared by R13C/R13D/R31B/R31C/R31D/R33C/R33D
; -------------------------------------------------------------------------
; This block occupies $20FDDC-$20FFFF in the USA images.

USA_R6_LegacyAnimationTail:
	dc.w	$FE60
L_USA_R6_20FDDE:
	move.w #$1f, d6
L_USA_R6_20FDE2:
	bsr.w USA_R6_AnimateTilesSimple
L_USA_R6_20FDE6:
	bne.b L_USA_R6_20FE0C
L_USA_R6_20FDE8:
	lea.l $c00004.l, a5
L_USA_R6_20FDEE:
	move.l #$94009340, (a5)
L_USA_R6_20FDF4:
	move.l #$968c95c0, (a5)
L_USA_R6_20FDFA:
	move.w #$977f, (a5)
L_USA_R6_20FDFE:
	move.w #$5540, (a5)
L_USA_R6_20FE02:
	move.w #$81, $FFFFF640.w
L_USA_R6_20FE08:
	move.w $FFFFF640.w, (a5)
L_USA_R6_20FE0C:
	rts
USA_R6_AnimateTilesSimple:
	subq.b #$1, (a2)
L_USA_R6_20FE10:
	bpl.b L_USA_R6_20FE54
L_USA_R6_20FE12:
	moveq #$0, d0
L_USA_R6_20FE14:
	move.b (a4), d0
L_USA_R6_20FE16:
	addq.b #$1, d0
L_USA_R6_20FE18:
	cmp.b (a1), d0
L_USA_R6_20FE1A:
	bcs.b L_USA_R6_20FE1E
L_USA_R6_20FE1C:
	moveq #$0, d0
L_USA_R6_20FE1E:
	move.b d0, (a4)
L_USA_R6_20FE20:
	add.w d0, d0
L_USA_R6_20FE22:
	move.b $2(a1, d0.w), (a2)
L_USA_R6_20FE26:
	move.b $3(a1, d0.w), d0
L_USA_R6_20FE2A:
	ext.w d0
L_USA_R6_20FE2C:
	add.w d0, d0
L_USA_R6_20FE2E:
	add.w d0, d0
L_USA_R6_20FE30:
	moveq #$0, d1
L_USA_R6_20FE32:
	move.b (a1), d1
L_USA_R6_20FE34:
	add.w d1, d1
L_USA_R6_20FE36:
	add.w d1, d0
L_USA_R6_20FE38:
	movea.l $2(a1, d0.w), a1
L_USA_R6_20FE3C:
	lea.l $ff1980.l, a3
L_USA_R6_20FE42:
	move.l (a1)+, (a3)+
L_USA_R6_20FE44:
	dbra d6, L_USA_R6_20FE42
L_USA_R6_20FE48:
	adda.w #$1, a2
L_USA_R6_20FE4C:
	adda.w #$1, a4
L_USA_R6_20FE50:
	moveq #$0, d0
L_USA_R6_20FE52:
	rts
L_USA_R6_20FE54:
	adda.w #$1, a2
L_USA_R6_20FE58:
	adda.w #$1, a4
L_USA_R6_20FE5C:
	moveq #$1, d0
L_USA_R6_20FE5E:
	rts
USA_R6_AnimationTableA:
	dc.w	$0400,$0400,$0901,$0402,$0F03,$0023,$3F0C,$0023,$3F8C,$0023,$400C,$0023,$408C
USA_R6_AnimateTilesSimpleAlt:
	subq.b #$1, (a2)
L_USA_R6_20FE7C:
	bpl.w L_USA_R6_20FEB2
L_USA_R6_20FE80:
	move.b (a1), (a2)
L_USA_R6_20FE82:
	moveq #$0, d0
L_USA_R6_20FE84:
	move.b (a4), d0
L_USA_R6_20FE86:
	addq.b #$1, d0
L_USA_R6_20FE88:
	cmp.b $1(a1), d0
L_USA_R6_20FE8C:
	bcs.b L_USA_R6_20FE90
L_USA_R6_20FE8E:
	moveq #$0, d0
L_USA_R6_20FE90:
	move.b d0, (a4)
L_USA_R6_20FE92:
	add.w d0, d0
L_USA_R6_20FE94:
	add.w d0, d0
L_USA_R6_20FE96:
	movea.l $2(a1, d0.w), a1
L_USA_R6_20FE9A:
	lea.l $ff1980.l, a3
L_USA_R6_20FEA0:
	move.l (a1)+, (a3)+
L_USA_R6_20FEA2:
	dbra d6, L_USA_R6_20FEA0
L_USA_R6_20FEA6:
	adda.w #$1, a2
L_USA_R6_20FEAA:
	adda.w #$1, a4
L_USA_R6_20FEAE:
	moveq #$0, d0
L_USA_R6_20FEB0:
	rts
L_USA_R6_20FEB2:
	adda.w #$1, a2
L_USA_R6_20FEB6:
	adda.w #$1, a4
L_USA_R6_20FEBA:
	moveq #$1, d0
L_USA_R6_20FEBC:
	rts
USA_R6_AnimationTableB:
	dc.w	$0403,$0023,$3C0C,$0023,$3D0C,$0023,$3E0C,$0302,$0023,$3B0C,$0023,$3B8C,$0323,$81DC,$0223,$6F30
	dc.w	$0021,$0000,$0081,$0404,$0026,$002E,$008A,$0026,$008A,$008A,$008A,$008A,$008A,$008A,$008A,$008A
	dc.w	$008A,$008A,$008A,$008A,$00E6,$008A,$00EE,$0000,$0023,$81DC,$0000,$000E,$0023,$0DA2,$6C00,$0023
	dc.w	$39BC,$7A00,$0023,$CA20,$8700,$0023,$CC94,$8AE0,$0023,$CFF4,$9100,$0023,$D458,$9500,$0023,$D2B6
	dc.w	$9900,$0023,$DC52,$9A00,$0023,$213A,$A400,$0023,$34BC,$AD00,$0023,$235C,$B500,$0023,$2960,$D000
	dc.w	$0022,$EDE6,$D8C0,$0023,$3732,$DAE0,$0023,$2E48,$F5C0,$000E,$0022,$F8FC,$5780,$0023,$4378,$5C20
	dc.w	$0023,$4220,$6200,$0023,$B174,$6800,$0023,$C8EE,$6B00,$0023,$B2B2,$6D40,$0023,$BE78,$7340,$0023
	dc.w	$BECA,$7400,$0023,$D378,$7500,$0023,$D6B0,$7700,$0023,$BD98,$7D00,$0023,$DB7A,$7F00,$0023,$410C
	dc.w	$8000,$0023,$C34E,$8200,$0023,$C066,$9D00,$0000,$0023,$0098,$7880,$0002,$0022,$FABC,$8780,$0022
	dc.w	$F4F2,$9100,$0020,$BBBC,$7DE0,$7DE0,$0023,$D59E,$78C0,$0023,$C440,$7D20,$0023,$D0C4,$8BA0,$0000
	dc.w	$0023
