; ------------------------------------------------------------------------------
; Japan/Europe R43 retained helper links
;
; The discarded Act 2 switch and door code remains in the R43C/R43D retail
; layout.  Those regional binaries link this historical body to the older
; helper addresses, while the reconstructed source normally resolves the
; symbolic calls to the newer R4 helpers.  Patch the instruction operands in
; source form and leave the rest of the retained body untouched.
; ------------------------------------------------------------------------------

; SwitchObject: SolidObject, PlayFmSound, DrawObject, and despawn helpers.
	org	Padding1+$016E+R43_NON_USA_ADJUST
	jsr	$2087D8.L
	org	Padding1+$01A8+R43_NON_USA_ADJUST
	jsr	$202598.L
	org	Padding1+$01F4+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0200+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0226+R43_NON_USA_ADJUST
	jmp	$2078C6.L

; DoorObject and its collision helper.
	org	Padding1+$0270+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0276+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0288+R43_NON_USA_ADJUST
	jmp	$2087D8.L

; TwinMoveBlockObject and its child-spawn path.
	org	Padding1+$04F6+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0510+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0516+R43_NON_USA_ADJUST
	jmp	$203B52.L
	org	Padding1+$0524+R43_NON_USA_ADJUST
	jsr	$2087D8.L
	org	Padding1+$055C+R43_NON_USA_ADJUST
	jsr	$20786E.L

; R43RetainedTonboObject and its animation path.
	org	Padding1+$0618+R43_NON_USA_ADJUST
	jsr	$20FD2C.L
	org	Padding1+$062C+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0636+R43_NON_USA_ADJUST
	jmp	$2078A8.L
	org	Padding1+$0704+R43_NON_USA_ADJUST
	jmp	$205D00.L

; R43RetainedAmenbo_AmenboObject and its child/subtype paths.
	org	Padding1+$088A+R43_NON_USA_ADJUST
	jsr	$20FD2C.L
	org	Padding1+$089E+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$08A4+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0972+R43_NON_USA_ADJUST
	jsr	$205D00.L
	org	Padding1+$0A2E+R43_NON_USA_ADJUST
	jsr	$20786E.L
	org	Padding1+$0AB2+R43_NON_USA_ADJUST
	jsr	$202598.L
	org	Padding1+$0AFE+R43_NON_USA_ADJUST
	jsr	$205D00.L
	org	Padding1+$0B04+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0B0A+R43_NON_USA_ADJUST
	jmp	$2078A4.L

; R43RetainedTaga_TagaTagaObject and its missile body.
	org	Padding1+$0BC0+R43_NON_USA_ADJUST
	jsr	$20FD2C.L
	org	Padding1+$0BD4+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$0BDA+R43_NON_USA_ADJUST
	jmp	$2078A4.L
	org	Padding1+$0C1E+R43_NON_USA_ADJUST
	move.l	#$20E1F4,$4(A0)
	org	Padding1+$0C3A+R43_NON_USA_ADJUST
	move.l	#$20E20E,$4(A0)
	org	Padding1+$0C52+R43_NON_USA_ADJUST
	jsr	$20786E.L
	org	Padding1+$0C76+R43_NON_USA_ADJUST
	jsr	$20786E.L
	org	Padding1+$0C9A+R43_NON_USA_ADJUST
	jsr	$20786E.L
	org	Padding1+$0DD8+R43_NON_USA_ADJUST
	jmp	$205D00.L
	org	Padding1+$0E2C+R43_NON_USA_ADJUST
	jsr	$202598.L
	org	Padding1+$0F80+R43_NON_USA_ADJUST
	move.l	#$20E2A6,$4(A0)
	org	Padding1+$0F88+R43_NON_USA_ADJUST
	jmp	$203AA6.L
	org	Padding1+$0FC0+R43_NON_USA_ADJUST
	jmp	$203AA6.L
	org	Padding1+$0FC6+R43_NON_USA_ADJUST
	jmp	$203B52.L

; R43RetainedYago_YagoObject and both subtype implementations.
	org	Padding1+$0FDE+R43_NON_USA_ADJUST
	jsr	$20FD2C.L
	org	Padding1+$1032+R43_NON_USA_ADJUST
	move.l	#$20E4F8,$4(A0)
	org	Padding1+$1042+R43_NON_USA_ADJUST
	jsr	$206DBC.L
	org	Padding1+$104E+R43_NON_USA_ADJUST
	lea.l	$20E4F2.L,A1
	org	Padding1+$1054+R43_NON_USA_ADJUST
	jsr	$205D00.L
	org	Padding1+$105A+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$1064+R43_NON_USA_ADJUST
	jmp	$2078A8.L
	org	Padding1+$1092+R43_NON_USA_ADJUST
	jsr	$206DBC.L
	org	Padding1+$10A4+R43_NON_USA_ADJUST
	lea.l	$206E86.L,A1
	org	Padding1+$10B2+R43_NON_USA_ADJUST
	lea.l	$207028.L,A1
	org	Padding1+$11A4+R43_NON_USA_ADJUST
	lea.l	$206E86.L,A1
	org	Padding1+$11B2+R43_NON_USA_ADJUST
	lea.l	$207028.L,A1
	org	Padding1+$11D6+R43_NON_USA_ADJUST
	jsr	$2078A4.L
	org	Padding1+$11F2+R43_NON_USA_ADJUST
	jsr	$206DBC.L
	org	Padding1+$1248+R43_NON_USA_ADJUST
	jsr	$20FD2C.L
	org	Padding1+$129C+R43_NON_USA_ADJUST
	move.l	#$20E772,$4(A0)
	org	Padding1+$12AC+R43_NON_USA_ADJUST
	jsr	$206DBC.L
	org	Padding1+$12B8+R43_NON_USA_ADJUST
	lea.l	$20E76C.L,A1
	org	Padding1+$12BE+R43_NON_USA_ADJUST
	jsr	$205D00.L
	org	Padding1+$12C4+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$12CE+R43_NON_USA_ADJUST
	jmp	$2078A8.L
	org	Padding1+$1302+R43_NON_USA_ADJUST
	jsr	$206DBC.L
	org	Padding1+$1314+R43_NON_USA_ADJUST
	lea.l	$206E86.L,A1
	org	Padding1+$1322+R43_NON_USA_ADJUST
	lea.l	$207028.L,A1
	org	Padding1+$1414+R43_NON_USA_ADJUST
	lea.l	$206E86.L,A1
	org	Padding1+$1422+R43_NON_USA_ADJUST
	lea.l	$207028.L,A1
	org	Padding1+$1442+R43_NON_USA_ADJUST
	jsr	$206DBC.L
	org	Padding1+$146C+R43_NON_USA_ADJUST
	jsr	$206DBC.L

; R43RetainedAnimal_AnimalObject and its movement paths.
	org	Padding1+$14C2+R43_NON_USA_ADJUST
	jsr	$20FD74.L
	org	Padding1+$15A8+R43_NON_USA_ADJUST
	jmp	$203B52.L
	org	Padding1+$161A+R43_NON_USA_ADJUST
	jsr	$205D00.L
	org	Padding1+$1620+R43_NON_USA_ADJUST
	jmp	$203AA6.L
	org	Padding1+$1678+R43_NON_USA_ADJUST
	jsr	$205D00.L
	org	Padding1+$167E+R43_NON_USA_ADJUST
	jsr	$203AA6.L
	org	Padding1+$1684+R43_NON_USA_ADJUST
	jmp	$2078A4.L
