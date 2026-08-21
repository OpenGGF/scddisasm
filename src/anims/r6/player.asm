; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	PlayerWalkAnim-.Anims
	dc.w	PlayerRunAnim-.Anims
	dc.w	PlayerRollAnim-.Anims
	dc.w	PlayerRollFastAnim-.Anims
	dc.w	PlayerPushAnim-.Anims
	dc.w	PlayerIdleAnim-.Anims
	dc.w	PlayerBalanceAnim-.Anims
	dc.w	PlayerLookUpAnim-.Anims
	dc.w	PlayerDuckAnim-.Anims
	dc.w	PlayerS1Warp1Anim-.Anims
	dc.w	PlayerS1Warp2Anim-.Anims
	dc.w	PlayerS1Warp3Anim-.Anims
	dc.w	PlayerS1Warp4Anim-.Anims
	dc.w	PlayerSkidAnim-.Anims
	dc.w	PlayerS1Float1Anim-.Anims
	dc.w	PlayerFloatAnim-.Anims
	dc.w	PlayerSpringAnim-.Anims
	dc.w	PlayerHangAnim-.Anims
	dc.w	PlayerS1Leap1Anim-.Anims
	dc.w	PlayerS1Leap2Anim-.Anims
	dc.w	PlayerS1SurfAnim-.Anims
	dc.w	PlayerBubbleAnim-.Anims
	dc.w	PlayerGreyDeathAnim-.Anims
	dc.w	PlayerDrownAnim-.Anims
	dc.w	PlayerDeathAnim-.Anims
	dc.w	PlayerS1ShrinkAnim-.Anims
	dc.w	PlayerHurtAnim-.Anims
	dc.w	PlayerSlideAnim-.Anims
	dc.w	PlayerBlankAnim-.Anims
	dc.w	PlayerS1Float3Anim-.Anims
	dc.w	PlayerS1Float4Anim-.Anims
	dc.w	PlayerIdleShrunkAnim-.Anims
	dc.w	PlayerDuckShrunkAnim-.Anims
	dc.w	PlayerWalkShrunkAnim-.Anims
	dc.w	PlayerRunShrunkAnim-.Anims
	dc.w	PlayerRollShrunkAnim-.Anims
	dc.w	PlayerSkidShrunkAnim-.Anims
	dc.w	PlayerHurtShrunkAnim-.Anims
	dc.w	PlayerBalanceShrunkAnim-.Anims
	dc.w	PlayerPushShrunkAnim-.Anims
	dc.w	PlayerStandShrunkAnim-.Anims
	dc.w	PlayerLookBackAnim-.Anims
	dc.w	PlayerSneezeAnim-.Anims
	dc.w	PlayerGiveUpAnim-.Anims
	dc.w	PlayerHang2Anim-.Anims
	dc.w	PlayerStandRotateAnim-.Anims
	dc.w	PlayerWadeAnim-.Anims
	dc.w	PlayerFloat2Anim-.Anims
	dc.w	PlayerGiveUpShrunkAnim-.Anims
	dc.w	PlayerPeeloutAnim-.Anims
	dc.w	PlayerBalance2Anim-.Anims
	dc.w	PlayerRotateBackAnim-.Anims
	dc.w	PlayerRotateFrontAnim-.Anims
	dc.w	PlayerRun3dAnim-.Anims
	dc.w	PlayerRoll3dAnim-.Anims
	dc.w	PlayerFallAwayAnim-.Anims
	dc.w	PlayerGrowAnim-.Anims
	dc.w	PlayerShrinkAnim-.Anims
	dc.w	PlayerBoosterAnim-.Anims
	dc.w	PlayerFallAwayAnim-.Anims

PlayerWalkAnim:
	dc.b	$FF
	dc.b	$35, $36, $37, $38, $33, $34
	dc.b	$FF
	even

PlayerRunAnim:
	dc.b	$FF
	dc.b	$4B, $4C, $4D, $4E
	dc.b	$FF, $FF, $FF
	even

PlayerRollAnim:
	dc.b	$FE
	dc.b	$2D, $2E, $2F, $30, $31
	dc.b	$FF, $FF
	even

PlayerRollFastAnim:
	dc.b	$FE
	dc.b	$2D, $2E, $31, $2F, $30, $31
	dc.b	$FF
	even

PlayerPushAnim:
	dc.b	$FD
	dc.b	$64, $65, $66, $67
	dc.b	$FF, $FF, $FF
	even

PlayerIdleAnim:
	dc.b	$17
	dc.b	1, 1, 1, 1, 1, 1, 1, 1
	dc.b	1, 1, 1, 1, 3, 2, 2, 2
	dc.b	3, 4
	dc.b	$FE, 2
	even

PlayerBalanceAnim:
	dc.b	$F
	dc.b	$6D, $6E, $83, $84
	dc.b	$FF
	even

PlayerLookUpAnim:
	dc.b	$3F
	dc.b	5
	dc.b	$FF
	even

PlayerDuckAnim:
	dc.b	$3F
	dc.b	$60
	dc.b	$FF
	even

PlayerS1Warp1Anim:
	dc.b	$3F
	dc.b	$33
	dc.b	$FF
	even

PlayerS1Warp2Anim:
	dc.b	$3F
	dc.b	$34
	dc.b	$FF
	even

PlayerS1Warp3Anim:
	dc.b	$3F
	dc.b	$35
	dc.b	$FF
	even

PlayerS1Warp4Anim:
	dc.b	$3F
	dc.b	$36
	dc.b	$FF
	even

PlayerSkidAnim:
	dc.b	7
	dc.b	$5B, $5C, $7F
	dc.b	$FF
	even

PlayerS1Float1Anim:
	dc.b	7
	dc.b	$3C, $3F
	dc.b	$FF
	even

PlayerFloatAnim:
	dc.b	7
	dc.b	$61, $62, $B9, $63, $BA
	dc.b	$FF
	even

PlayerSpringAnim:
	dc.b	3
	dc.b	$32, $90, $91, $92, $93
	dc.b	$FF
	even

PlayerHangAnim:
	dc.b	4
	dc.b	$6B, $6C
	dc.b	$FF
	even

PlayerS1Leap1Anim:
	dc.b	$F
	dc.b	$43, $43, $43
	dc.b	$FE, 1
	even

PlayerS1Leap2Anim:
	dc.b	$F
	dc.b	$43, $44
	dc.b	$FE, 1
	even

PlayerS1SurfAnim:
	dc.b	$3F
	dc.b	$49
	dc.b	$FF
	even

PlayerBubbleAnim:
	dc.b	$B
	dc.b	$5F, $5F, $37, $38
	dc.b	$FD, 0
	even

PlayerGreyDeathAnim:
	dc.b	$20
	dc.b	$68
	dc.b	$FF
	even

PlayerDrownAnim:
	dc.b	$2F
	dc.b	$69
	dc.b	$FF
	even

PlayerDeathAnim:
	dc.b	3
	dc.b	$6A
	dc.b	$FF
	even

PlayerS1ShrinkAnim:
	dc.b	3
	dc.b	$4E, $4F, $50, $51, $52, 0
	dc.b	$FE, 1
	even

PlayerHurtAnim:
	dc.b	3
	dc.b	$5D
	dc.b	$FF
	even

PlayerSlideAnim:
	dc.b	7
	dc.b	$5D, $5E
	dc.b	$FF
	even

PlayerBlankAnim:
	dc.b	$77
	dc.b	0
	dc.b	$FD, 0
	even

PlayerS1Float3Anim:
	dc.b	3
	dc.b	$3C, $3D, $53, $3E, $54
	dc.b	$FF
	even

PlayerS1Float4Anim:
	dc.b	3
	dc.b	$3C
	dc.b	$FD, 0
	even

PlayerIdleShrunkAnim:
	dc.b	$17
	dc.b	$6F, $6F, $6F, $6F, $6F, $6F, $6F, $6F
	dc.b	$6F, $6F, $6F, $6F, $70, $70, $70, $71
	dc.b	$70, $71
	dc.b	$FE, 2
	even

PlayerDuckShrunkAnim:
	dc.b	$3F
	dc.b	$72
	dc.b	$FF
	even

PlayerWalkShrunkAnim:
	dc.b	$FF
	dc.b	$73, $74, $75, $74
	dc.b	$FF
	even

PlayerRunShrunkAnim:
	dc.b	$FF
	dc.b	$76, $77
	dc.b	$FF, $FF, $FF
	even

PlayerRollShrunkAnim:
	dc.b	$FE
	dc.b	$7C, $7D, $7E
	dc.b	$FF, $FF
	even

PlayerSkidShrunkAnim:
	dc.b	7
	dc.b	$78, $78
	dc.b	$FF
	even

PlayerHurtShrunkAnim:
	dc.b	3
	dc.b	$79
	dc.b	$FF
	even

PlayerBalanceShrunkAnim:
	dc.b	$1F
	dc.b	$7A, $7B
	dc.b	$FF
	even

PlayerPushShrunkAnim:
	dc.b	$FD
	dc.b	$73, $74, $75
	dc.b	$FF, $FF, $FF
	even

PlayerStandShrunkAnim:
	dc.b	$3F
	dc.b	$6F
	dc.b	$FF
	even

PlayerLookBackAnim:
	dc.b	$3F
	dc.b	6
	dc.b	$FF
	even

PlayerSneezeAnim:
	dc.b	3
	dc.b	7, 7, 7, 7, 7, 9, 9, 8
	dc.b	8, 8, 1, $A, $A
	dc.b	$FD, 5
	even

PlayerGiveUpAnim:
	dc.b	4
	dc.b	$11, $12, $12, $13, $13, $12, $12, $13
	dc.b	$13, $12, $12, $13, $13, $11, $11, $11
	dc.b	$11, $14, $14, $14, $14, $15, $15, $16
	dc.b	$16, $16, $16, $16, $16, $17, $17, $17
	dc.b	$17, $17, $17, $A4, $A5
	dc.b	$FE, 2
	even

PlayerHang2Anim:
	dc.b	$FC
	dc.b	$18, $19, $A6, $19
	dc.b	$FF
	even

PlayerStandRotateAnim:
	dc.b	$FC
	dc.b	$1A, $1B, $1C, $1F, $1D, $1E
	dc.b	$FF
	even

PlayerWadeAnim:
	dc.b	$FF
	dc.b	$D, $E, $F, $10, $B, $C
	dc.b	$FF
	even

PlayerFloat2Anim:
	dc.b	$FF
	dc.b	$61, $62, $63
	dc.b	$FF
	even

PlayerGiveUpShrunkAnim:
	dc.b	$13
	dc.b	$70, $6F, $70, $79
	dc.b	$FE, 1
	even

PlayerPeeloutAnim:
	dc.b	$FF
	dc.b	$94, $95, $96, $97
	dc.b	$FF, $FF, $FF
	even

PlayerBalance2Anim:
	dc.b	$F
	dc.b	$85, $86, $87, $88
	dc.b	$FF
	even

PlayerRotateBackAnim:
	dc.b	3
	dc.b	1, $B5, $B5, $B6, $B6, $B7, $B7, $BB
	dc.b	$FD, 5
	even

PlayerRotateFrontAnim:
	dc.b	3
	dc.b	1, $B5, $B5, 1, 1, $B8, $B8, $BB
	dc.b	$FD, 5
	even

PlayerRun3dAnim:
	dc.b	$FF
	dc.b	$A6, $A7, $A8, $A9
	dc.b	$FF, $FF, $FF
	even

PlayerRoll3dAnim:
	dc.b	$FE
	dc.b	$20, $21, $23, $24, $25, $31
	dc.b	$FF
	even

PlayerFallAwayAnim:
	dc.b	1
	dc.b	$A4, $A5
	dc.b	$FF
	even

PlayerGrowAnim:
	dc.b	1
	dc.b	$79, $AB, $AC, $AB, $AC, $AB, $AC, $A9
	dc.b	$AA, $A9, $AA, $A9, $AA, $A7, $A8, $A7
	dc.b	$A8, $A7, $A8
	dc.b	$FD, $1A
	even

PlayerShrinkAnim:
	dc.b	1
	dc.b	$5D, $A7, $A8, $A7, $A8, $A7, $A8, $A9
	dc.b	$AA, $A9, $AA, $A9, $AA, $AB, $AC, $AB
	dc.b	$AC, $AB, $AC
	dc.b	$FD, $1A
	even

PlayerBoosterAnim:
	dc.b	1
	dc.b	$89, $8A
	dc.b	$FF
	even

; ------------------------------------------------------------------------------
