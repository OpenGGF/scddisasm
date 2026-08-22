; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Backup RAM manager main CPU program (USA)
; -------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/Backup RAM.inc"
	include	"_Include/MMD.inc"

; The original manager uses a fixed work-RAM load area. The source below
; keeps the MMD header, all reachable routines, and the complete data image
; at their historical addresses.
	MMD	0, &
		WORKRAMFILE, $7A00, &
		Start, 0, VInterrupt

Start:
	move.l	#$ff20a8, $FFFFfd08.w
L_FF2008:
	moveq	#$0, d0
L_FF200A:
	move.l	d0, $a12010.l
L_FF2010:
	move.l	d0, $a12014.l
L_FF2016:
	move.l	d0, $a12018.l
L_FF201C:
	move.l	d0, $a1201c.l
L_FF2022:
	bsr.w	L_FF2388
L_FF2026:
	bsr.w	L_FF2368
L_FF202A:
	bsr.w	L_FF2394
L_FF202E:
	lea.l	$FFFFa000.w, a0
L_FF2032:
	move.w	#$16ff, d7
L_FF2036:
	move.l	#$0, (a0)+
L_FF203C:
	dbra	d7, L_FF2036
L_FF2040:
	bsr.w	L_FF2260
L_FF2044:
	move.w	#$0, $FFFFcd02.w
L_FF204A:
	bsr.w	L_FF3CC8
L_FF204E:
	bsr.w	L_FF5346
L_FF2052:
	bsr.w	L_FF3F48
L_FF2056:
	bsr.w	L_FF67BA
L_FF205A:
	bsr.w	L_FF270C
L_FF205E:
	bsr.w	L_FF3C00
L_FF2062:
	beq.b	L_FF206E
L_FF2064:
	moveq	#$1, d0
L_FF2066:
	bsr.w	L_FF3BE8
L_FF206A:
	bsr.w	L_FF530C
L_FF206E:
	moveq	#$0, d0
L_FF2070:
	bsr.w	L_FF3BE8
L_FF2074:
	bsr.w	L_FF530C
L_FF2078:
	bsr.w	L_FF3FE2
L_FF207C:
	bsr.w	L_FF224A
L_FF2080:
	cmpi.l	#$8ca0, $FFFFcd58.w
L_FF2088:
	bge.b	L_FF208E
L_FF208A:
	bra.w	L_FF2078
L_FF208E:
	move.w	#$3f, d1
L_FF2092:
	lea.l	$FFFFc420.w, a0
L_FF2096:
	moveq	#$0, d0
L_FF2098:
	move.w	d0, (a0)+
L_FF209A:
	dbra	d1, L_FF2098
L_FF209E:
	bsr.w	L_FF270C
L_FF20A2:
	bsr.w	L_FF220E
L_FF20A6:
	rts
VInterrupt:
	movem.l	d0-d7/a0-a6, -(a7)
L_FF20AC:
	move.b	#$1, $a12000.l
L_FF20B4:
	tst.b	$FFFFcd00.w
L_FF20B8:
	beq.w	L_FF21F6
L_FF20BC:
	move.b	#$0, $FFFFcd00.w
L_FF20C2:
	lea.l	$c00004.l, a1
L_FF20C8:
	lea.l	$c00000.l, a2
L_FF20CE:
	move.w	(a1), d0
L_FF20D0:
	jsr	L_FF2526(pc)
L_FF20D4:
	move.w	$FFFFcd02.w, d0
L_FF20D8:
	add.w	d0, d0
L_FF20DA:
	move.w	$ff20e2(pc, d0.w), d0
L_FF20DE:
	jmp	VInterruptStateTable(pc, d0.w)
VInterruptStateTable:
	dc.b	$00,$02
L_FF20E4:
	move.l	#$40040010, $c00004.l
L_FF20EE:
	moveq	#$5, d0
L_FF20F0:
	move.w	$FFFFdfdc.w, d1
L_FF20F4:
	move.w	#$0, $c00000.l
L_FF20FC:
	move.w	d1, $c00000.l
L_FF2102:
	dbra	d0, L_FF20F4
L_FF2106:
	move.l	#$40340010, $c00004.l
L_FF2110:
	moveq	#$5, d0
L_FF2112:
	move.w	$FFFFcfac.w, d1
L_FF2116:
	move.w	#$0, $c00000.l
L_FF211E:
	move.w	d1, $c00000.l
L_FF2124:
	dbra	d0, L_FF2116
L_FF2128:
	lea.l	$c00004.l, a6
L_FF212E:
	move.w	#$8f20, (a6)
L_FF2132:
	move.l	#$52000003, $c00004.l
L_FF213C:
	lea.l	$c00000.l, a6
L_FF2142:
	moveq	#$9, d1
L_FF2144:
	move.w	#$d0, d0
L_FF2148:
	tst.b	$FFFFcd29.w
L_FF214C:
	beq.b	L_FF2160
L_FF214E:
	cmpi.b	#$1, $FFFFcd29.w
L_FF2154:
	beq.b	L_FF215C
L_FF2156:
	move.w	#$ffa0, d0
L_FF215A:
	bra.b	L_FF2160
L_FF215C:
	move.w	#$0, d0
L_FF2160:
	move.w	d0, (a6)
L_FF2162:
	dbra	d1, L_FF2160
L_FF2166:
	lea.l	$c00004.l, a6
L_FF216C:
	move.w	#$8f02, (a6)
L_FF2170:
	lea.l	$c00004.l, a6
L_FF2176:
	move.l	#$93409400, (a6)
L_FF217C:
	move.l	#$951096e2, (a6)
L_FF2182:
	move.w	#$977f, (a6)
L_FF2186:
	move.w	#$c000, (a6)
L_FF218A:
	move.w	#$80, -(a7)
L_FF218E:
	move.w	(a7)+, (a6)
L_FF2190:
	move.l	#$c0000000, (a6)
L_FF2196:
	move.w	$FFFFc420.w, $c00000.l
L_FF219E:
	nop
L_FF21A0:
	lea.l	$c00004.l, a6
L_FF21A6:
	move.l	#$93409401, (a6)
L_FF21AC:
	move.l	#$950096d8, (a6)
L_FF21B2:
	move.w	#$977f, (a6)
L_FF21B6:
	move.w	#$7c00, (a6)
L_FF21BA:
	move.w	#$82, -(a7)
L_FF21BE:
	move.w	(a7)+, (a6)
L_FF21C0:
	move.l	#$7c000002, (a6)
L_FF21C6:
	move.w	$FFFFb000.w, $c00000.l
L_FF21CE:
	nop
L_FF21D0:
	bra.w	L_FF21D4
L_FF21D4:
	jsr	L_FF25CE.l
L_FF21DA:
	bsr.w	L_FF253E
L_FF21DE:
	tst.w	$FFFFcd04.w
L_FF21E2:
	beq.b	L_FF21E8
L_FF21E4:
	subq.w	#$1, $FFFFcd04.w
L_FF21E8:
	addq.w	#$1, $FFFFcd06.w
L_FF21EC:
	jsr	$ff22f2(pc)
L_FF21F0:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF21F4:
	rte
L_FF21F6:
	addq.l	#$1, $FFFFcd0a.w
L_FF21FA:
	move.b	$FFFFcd03.w, $FFFFcd0a.w
L_FF2200:
	jsr	$ff22f2(pc)
L_FF2204:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF2208:
	rte
	dc.l	$4E714E71
L_FF220E:
	nop
L_FF2210:
	nop
L_FF2212:
	bset.b	#$7, $a1200e.l
L_FF221A:
	bsr.w	L_FF2368
L_FF221E:
	btst.b	#$7, $a1200f.l
L_FF2226:
	beq.b	L_FF221A
L_FF2228:
	moveq	#$0, d0
L_FF222A:
	move.l	d0, $a12010.l
L_FF2230:
	move.l	d0, $a12014.l
L_FF2236:
	move.l	d0, $a12018.l
L_FF223C:
	move.l	d0, $a1201c.l
L_FF2242:
	move.b	d0, $a1200e.l
L_FF2248:
	rts
L_FF224A:
	bsr.w	L_FF6850
L_FF224E:
	jsr	L_FF281A.l
L_FF2254:
	jsr	L_FF28DE.l
L_FF225A:
	jmp	L_FF270C.l
L_FF2260:
	move.b	#$1, $FFFFb280.w
L_FF2266:
	move.b	#$2, $FFFFb2c0.w
L_FF226C:
	move.b	#$0, $FFFFb2e8.w
L_FF2272:
	move.b	#$2, $FFFFb300.w
L_FF2278:
	move.b	#$1, $FFFFb328.w
L_FF227E:
	move.b	#$3, $FFFFb340.w
L_FF2284:
	move.b	#$6, $FFFFb380.w
L_FF228A:
	moveq	#$0, d1
L_FF228C:
	lea.l	$FFFFb3c0.w, a0
L_FF2290:
	move.b	#$5, $0(a0)
L_FF2296:
	move.b	d1, $1a(a0)
L_FF229A:
	adda.w	#$40, a0
L_FF229E:
	addq.w	#$1, d1
L_FF22A0:
	cmpi.w	#$4, d1
L_FF22A4:
	bne.b	L_FF2290
L_FF22A6:
	lea.l	$FFFFb500.w, a0
L_FF22AA:
	moveq	#$0, d1
L_FF22AC:
	move.b	#$4, $0(a0)
L_FF22B2:
	move.b	d1, $28(a0)
L_FF22B6:
	adda.w	#$40, a0
L_FF22BA:
	addq.w	#$1, d1
L_FF22BC:
	cmpi.w	#$b, d1
L_FF22C0:
	bne.b	L_FF22AC
L_FF22C2:
	move.b	#$7, $FFFFb4c0.w
L_FF22C8:
	move.w	#$0, $FFFFcd14.w
L_FF22CE:
	move.b	#$1, $FFFFcd1e.w
L_FF22D4:
	lea.l	$ff3c7a.l, a0
L_FF22DA:
	lea.l	$FFFFcd30.w, a1
L_FF22DE:
	move.l	(a0)+, (a1)+
L_FF22E0:
	move.l	(a0)+, (a1)+
L_FF22E2:
	move.l	(a0), (a1)
L_FF22E4:
	move.b	#$30, $1(a1)
L_FF22EA:
	move.b	#$30, $2(a1)
L_FF22F0:
	rts
	dc.l	$4EBA0258
	dc.l	$0C380006
	dc.l	$CD156710
	dc.l	$52B8CD58
	dc.l	$4A3900A1
	dc.l	$201E6704
	dc.l	$42B8CD58
	dc.l	$41F8CD53
	dc.l	$103900A1
	dc.l	$201E7200
	dc.l	$74030500
	dc.l	$67140C10
	dc.l	$00286C0A
	dc.l	$52100C10
	dc.l	$00016702
	dc.l	$600605C1
	dc.l	$60044210
	dc.l	$0581D0FC
	dc.l	$000151CA
	dc.l	$FFDE11C1
	dc.l	$CD524E75
	dc.l	$33FC0001
	dc.l	$00A12012
	dc.l	$4A7900A1
	dc.l	$202267F8
	dc.l	$33FC0000
	dc.l	$00A12012
	dc.l	$4A7900A1
	dc.l	$202266F8
	dc.b	$4E,$75
L_FF2368:
	bset.b	#$1, $a12003.l
L_FF2370:
	btst.b	#$1, $a12003.l
L_FF2378:
	beq.b	L_FF2368
L_FF237A:
	rts
L_FF237C:
	btst.b	#$0, $a12003.l
L_FF2384:
	beq.b	L_FF237C
L_FF2386:
	rts
L_FF2388:
	btst.b	#$7, $a1200f.l
L_FF2390:
	beq.b	L_FF2388
L_FF2392:
	rts
L_FF2394:
	btst.b	#$7, $a1200f.l
L_FF239C:
	bne.b	L_FF2394
L_FF239E:
	rts
L_FF23A0:
	lea.l	$ff2512(pc), a0
L_FF23A4:
	move.w	#$8000, d0
L_FF23A8:
	moveq	#$12, d7
L_FF23AA:
	move.b	(a0)+, d0
L_FF23AC:
	move.w	d0, $c00004.l
L_FF23B2:
	addi.w	#$100, d0
L_FF23B6:
	dbra	d7, L_FF23AA
L_FF23BA:
	moveq	#$40, d0
L_FF23BC:
	move.b	d0, $a10009.l
L_FF23C2:
	move.b	d0, $a1000b.l
L_FF23C8:
	move.b	d0, $a1000d.l
L_FF23CE:
	move.b	#$c0, $a10003.l
L_FF23D6:
	bsr.w	L_FF2526
L_FF23DA:
	lea.l	$c00004.l, a6
L_FF23E0:
	move.w	#$8f01, (a6)
L_FF23E4:
	move.l	#$93ff94ff, (a6)
L_FF23EA:
	move.w	#$9780, (a6)
L_FF23EE:
	move.l	#$40000080, (a6)
L_FF23F4:
	move.w	#$0, $c00000.l
L_FF23FC:
	btst.b	#$1, $1(a6)
L_FF2402:
	bne.b	L_FF23FC
L_FF2404:
	move.l	#$40000000, (a6)
L_FF240A:
	move.w	#$0, $c00000.l
L_FF2412:
	move.w	#$8f02, (a6)
L_FF2416:
	move.l	#$40000003, $c00004.l
L_FF2420:
	move.w	#$7ff, d7
L_FF2424:
	move.w	#$0, $c00000.l
L_FF242C:
	dbra	d7, L_FF2424
L_FF2430:
	move.l	#$60000003, $c00004.l
L_FF243A:
	move.w	#$7ff, d7
L_FF243E:
	move.w	#$0, $c00000.l
L_FF2446:
	dbra	d7, L_FF243E
L_FF244A:
	move.l	#$c0000000, $c00004.l
L_FF2454:
	lea.l	$ff2492(pc), a0
L_FF2458:
	moveq	#$1f, d7
L_FF245A:
	move.l	(a0)+, $c00000.l
L_FF2460:
	dbra	d7, L_FF245A
L_FF2464:
	move.l	#$40000010, $c00004.l
L_FF246E:
	moveq	#$13, d0
L_FF2470:
	move.w	#$0, $c00000.l
L_FF2478:
	move.w	#$0, $c00000.l
L_FF2480:
	dbra	d0, L_FF2470
L_FF2484:
	bsr.w	L_FF253E
L_FF2488:
	move.w	#$8134, $ff0f16.l
L_FF2490:
	rts
	dc.l	$00000200
	dc.l	$06000E00
	dc.l	$0E440E88
	dc.l	$0EEE0AAA
	dc.l	$08880444
	dc.l	$08AE046A
	dc.l	$000E0008
	dc.l	$000400EE
	dc.l	$00000A88
	dc.l	$02000E00
	dc.l	$06000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$0EEE0EEE
	dc.l	$04343000
	dc.l	$075E0000
	dc.l	$00000006
	dc.l	$81340002
	dc.l	$01000000
L_FF2526:
	move.w	sr, $FFFFcd08.w
L_FF252A:
	move.w	#$100, $a11100.l
L_FF2532:
	btst.b	#$0, $a11100.l
L_FF253A:
	bne.b	L_FF2532
L_FF253C:
	rts
L_FF253E:
	move.w	#$0, $a11100.l
L_FF2546:
	move.w	$FFFFcd08.w, sr
L_FF254A:
	rts
	dc.l	$41F900A1
	dc.l	$201E43F9
	dc.l	$00A10003
	dc.l	$12BC0000
	dc.l	$4A501011
	dc.l	$E5080200
	dc.l	$00C012BC
	dc.l	$00404A50
	dc.l	$12110201
	dc.l	$003F8001
	dc.l	$46001200
	dc.l	$1410B500
	dc.l	$10C1C001
	dc.l	$10C04E75
	dc.l	$33FC0100
	dc.l	$00A11200
	dc.l	$4EBAFF98
	dc.l	$43F900A0
	dc.l	$000012FC
	dc.l	$00F312FC
	dc.l	$00F312FC
	dc.l	$00C312FC
	dc.l	$000012FC
	dc.l	$000033FC
	dc.l	$000000A1
	dc.l	$1200E018
	dc.l	$33FC0100
	dc.l	$00A11200
	dc.l	$4EFAFF80
	dc.b	$4E,$75
L_FF25C2:
	move.b	d0, $FFFFf00b.w
L_FF25C6:
	rts
	dc.l	$11C0F00C
	dc.b	$4E,$75
L_FF25CE:
	jsr	L_FF2526.l
L_FF25D4:
	tst.b	$FFFFf00b.w
L_FF25D8:
	beq.b	L_FF25EA
L_FF25DA:
	move.b	$FFFFf00b.w, $a01c09.l
L_FF25E2:
	move.b	#$0, $FFFFf00b.w
L_FF25E8:
	bra.b	L_FF25FE
L_FF25EA:
	tst.b	$FFFFf00c.w
L_FF25EE:
	beq.b	L_FF25FE
L_FF25F0:
	move.b	$FFFFf00c.w, $a01c09.l
L_FF25F8:
	move.b	#$0, $FFFFf00c.w
L_FF25FE:
	jmp	L_FF253E.l
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$22C122C1
	dc.l	$4E752281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22812281
	dc.l	$22814E75
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$24D924D9
	dc.l	$4E752499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24992499
	dc.l	$24994E75
L_FF270C:
	move.b	#$1, $FFFFcd00.w
L_FF2712:
	move.w	#$2500, sr
L_FF2716:
	tst.b	$FFFFcd00.w
L_FF271A:
	bne.b	L_FF2716
L_FF271C:
	rts
	dc.l	$33FCFF00
	dc.l	$00A1201E
	dc.l	$4E752F01
	dc.l	$2238CD0E
	dc.l	$6606223C
	dc.l	$2A6D365A
	dc.l	$2001E581
	dc.l	$D280E781
	dc.l	$D2803001
	dc.l	$4841D041
	dc.l	$32004841
	dc.l	$21C1CD0E
	dc.l	$221F4E75
ObjectRoutineTable:
	dc.l	$00FF57E6
	dc.l	$00FF5B96
	dc.l	$00FF5C32
	dc.l	$00FF5F60
	dc.l	$00FF6176
	dc.l	$00FF5CEC
	dc.l	$00FF578C
L_FF276E:
	moveq	#$0, d0
L_FF2770:
	move.b	$1c(a0), d0
L_FF2774:
	cmp.b	$1d(a0), d0
L_FF2778:
	beq.b	L_FF278A
L_FF277A:
	move.b	d0, $1d(a0)
L_FF277E:
	move.b	#$0, $1b(a0)
L_FF2784:
	move.b	#$0, $1e(a0)
L_FF278A:
	subq.b	#$1, $1e(a0)
L_FF278E:
	bpl.b	L_FF27CA
L_FF2790:
	add.w	d0, d0
L_FF2792:
	adda.w	(a1, d0.w), a1
L_FF2796:
	move.b	(a1), $1e(a0)
L_FF279A:
	moveq	#$0, d1
L_FF279C:
	move.b	$1b(a0), d1
L_FF27A0:
	move.b	$1(a1, d1.w), d0
L_FF27A4:
	bmi.b	L_FF27CC
L_FF27A6:
	move.b	d0, d1
L_FF27A8:
	andi.b	#$1f, d0
L_FF27AC:
	move.b	d0, $1a(a0)
L_FF27B0:
	move.b	$22(a0), d0
L_FF27B4:
	rol.b	#$3, d1
L_FF27B6:
	eor.b	d0, d1
L_FF27B8:
	andi.b	#$3, d1
L_FF27BC:
	andi.b	#$fc, $1(a0)
L_FF27C2:
	or.b	d1, $1(a0)
L_FF27C6:
	addq.b	#$1, $1b(a0)
L_FF27CA:
	rts
L_FF27CC:
	addq.b	#$1, d0
L_FF27CE:
	bne.b	L_FF27DC
L_FF27D0:
	move.b	#$0, $1b(a0)
L_FF27D6:
	move.b	$1(a1), d0
L_FF27DA:
	bra.b	L_FF27A6
L_FF27DC:
	addq.b	#$1, d0
L_FF27DE:
	bne.b	L_FF27F0
L_FF27E0:
	move.b	$2(a1, d1.w), d0
L_FF27E4:
	sub.b	d0, $1b(a0)
L_FF27E8:
	sub.b	d0, d1
L_FF27EA:
	move.b	$1(a1, d1.w), d0
L_FF27EE:
	bra.b	L_FF27A6
L_FF27F0:
	addq.b	#$1, d0
L_FF27F2:
	bne.b	L_FF27FA
L_FF27F4:
	move.b	$2(a1, d1.w), $1c(a0)
L_FF27FA:
	addq.b	#$1, d0
L_FF27FC:
	bne.b	L_FF2802
L_FF27FE:
	addq.b	#$2, $24(a0)
L_FF2802:
	addq.b	#$1, d0
L_FF2804:
	bne.b	L_FF2810
L_FF2806:
	move.b	#$0, $1b(a0)
L_FF280C:
	clr.b	$25(a0)
L_FF2810:
	addq.b	#$1, d0
L_FF2812:
	bne.b	L_FF2818
L_FF2814:
	addq.b	#$2, $25(a0)
L_FF2818:
	rts
L_FF281A:
	lea.l	$FFFFb280.w, a0
L_FF281E:
	moveq	#$35, d7
L_FF2820:
	moveq	#$0, d0
L_FF2822:
	move.b	(a0), d0
L_FF2824:
	beq.b	L_FF2838
L_FF2826:
	add.w	d0, d0
L_FF2828:
	add.w	d0, d0
L_FF282A:
	lea.l	$ff2752.l, a1
L_FF2830:
	movea.l	-$4(a1, d0.w), a1
L_FF2834:
	jsr	(a1)
L_FF2836:
	moveq	#$0, d0
L_FF2838:
	lea.l	$40(a0), a0
L_FF283C:
	dbra	d7, L_FF2822
L_FF2840:
	rts
L_FF2842:
	moveq	#$0, d0
L_FF2844:
	move.b	$19(a0), d0
L_FF2848:
	move.w	$8(a0), d3
L_FF284C:
	sub.w	$FFFFc400.w, d3
L_FF2850:
	move.w	d3, d1
L_FF2852:
	add.w	d0, d1
L_FF2854:
	bmi.b	L_FF28BE
L_FF2856:
	move.w	d3, d1
L_FF2858:
	sub.w	d0, d1
L_FF285A:
	cmpi.w	#$140, d1
L_FF285E:
	bge.b	L_FF28BE
L_FF2860:
	move.b	$16(a0), d0
L_FF2864:
	move.w	$c(a0), d3
L_FF2868:
	cmpi.w	#$100, $FFFFc404.w
L_FF286E:
	bcc.b	L_FF287C
L_FF2870:
	cmpi.w	#$800, d3
L_FF2874:
	bcs.b	L_FF288E
L_FF2876:
	subi.w	#$800, d3
L_FF287A:
	bra.b	L_FF288E
L_FF287C:
	cmpi.w	#$700, $FFFFc404.w
L_FF2882:
	bcs.b	L_FF288E
L_FF2884:
	cmpi.w	#$100, d3
L_FF2888:
	bcc.b	L_FF288E
L_FF288A:
	addi.w	#$800, d3
L_FF288E:
	sub.w	$FFFFc404.w, d3
L_FF2892:
	move.w	d3, d1
L_FF2894:
	add.w	d0, d1
L_FF2896:
	bmi.b	L_FF28BE
L_FF2898:
	move.w	d3, d1
L_FF289A:
	sub.w	d0, d1
L_FF289C:
	cmpi.w	#$e0, d1
L_FF28A0:
	bge.b	L_FF28BE
L_FF28A2:
	lea.l	$FFFFc000.w, a1
L_FF28A6:
	move.w	$18(a0), d0
L_FF28AA:
	lsr.w	#$1, d0
L_FF28AC:
	andi.w	#$380, d0
L_FF28B0:
	adda.w	d0, a1
L_FF28B2:
	cmpi.w	#$7e, (a1)
L_FF28B6:
	bcc.b	L_FF28BE
L_FF28B8:
	addq.w	#$2, (a1)
L_FF28BA:
	adda.w	(a1), a1
L_FF28BC:
	move.w	a0, (a1)
L_FF28BE:
	rts
	dc.l	$22487200
	dc.l	$700F22C1
	dc.l	$51C8FFFC
	dc.l	$4E750000
	dc.l	$0000FFFF
	dc.l	$C400FFFF
	dc.l	$C408FFFF
	dc.b	$C4,$18
L_FF28DE:
	lea.l	$FFFFb000.w, a2
L_FF28E2:
	moveq	#$0, d5
L_FF28E4:
	lea.l	$FFFFc000.w, a4
L_FF28E8:
	moveq	#$7, d7
L_FF28EA:
	tst.w	(a4)
L_FF28EC:
	beq.w	L_FF29AA
L_FF28F0:
	moveq	#$2, d6
L_FF28F2:
	movea.w	(a4, d6.w), a0
L_FF28F6:
	tst.b	(a0)
L_FF28F8:
	beq.w	L_FF29A2
L_FF28FC:
	move.b	$1(a0), d0
L_FF2900:
	move.b	d0, d4
L_FF2902:
	andi.w	#$c, d0
L_FF2906:
	beq.w	L_FF2958
L_FF290A:
	movea.l	$ff28ce(pc, d0.w), a1
L_FF290E:
	moveq	#$0, d0
L_FF2910:
	move.b	$19(a0), d0
L_FF2914:
	move.w	$8(a0), d3
L_FF2918:
	sub.w	(a1), d3
L_FF291A:
	addi.w	#$80, d3
L_FF291E:
	moveq	#$0, d0
L_FF2920:
	move.b	$16(a0), d0
L_FF2924:
	move.w	$c(a0), d2
L_FF2928:
	cmpi.w	#$100, $4(a1)
L_FF292E:
	bcc.b	L_FF293C
L_FF2930:
	cmpi.w	#$800, d2
L_FF2934:
	bcs.b	L_FF294E
L_FF2936:
	subi.w	#$800, d2
L_FF293A:
	bra.b	L_FF294E
L_FF293C:
	cmpi.w	#$700, $4(a1)
L_FF2942:
	bcs.b	L_FF294E
L_FF2944:
	cmpi.w	#$100, d2
L_FF2948:
	bcc.b	L_FF294E
L_FF294A:
	addi.w	#$800, d2
L_FF294E:
	sub.w	$4(a1), d2
L_FF2952:
	addi.w	#$80, d2
L_FF2956:
	bra.b	L_FF297A
L_FF2958:
	move.w	$a(a0), d2
L_FF295C:
	move.w	$8(a0), d3
L_FF2960:
	bra.b	L_FF297A
	dc.l	$3428000C
	dc.l	$94690004
	dc.l	$06420080
	dc.l	$0C420060
	dc.l	$652E0C42
	dc.l	$01806428
L_FF297A:
	movea.l	$4(a0), a1
L_FF297E:
	moveq	#$0, d1
L_FF2980:
	btst	#$5, d4
L_FF2984:
	bne.b	L_FF2998
L_FF2986:
	move.b	$1a(a0), d1
L_FF298A:
	add.w	d1, d1
L_FF298C:
	adda.w	(a1, d1.w), a1
L_FF2990:
	moveq	#$0, d1
L_FF2992:
	move.b	(a1)+, d1
L_FF2994:
	subq.b	#$1, d1
L_FF2996:
	bmi.b	L_FF299C
L_FF2998:
	bsr.w	L_FF29CC
L_FF299C:
	bset.b	#$7, $1(a0)
L_FF29A2:
	addq.w	#$2, d6
L_FF29A4:
	subq.w	#$2, (a4)
L_FF29A6:
	bne.w	L_FF28F2
L_FF29AA:
	lea.l	$80(a4), a4
L_FF29AE:
	dbra	d7, L_FF28EA
L_FF29B2:
	move.b	d5, $FFFFcd01.w
L_FF29B6:
	cmpi.b	#$50, d5
L_FF29BA:
	beq.b	L_FF29C4
L_FF29BC:
	move.l	#$0, (a2)
L_FF29C2:
	rts
L_FF29C4:
	move.b	#$0, -$5(a2)
L_FF29CA:
	rts
L_FF29CC:
	movea.w	$2(a0), a3
L_FF29D0:
	btst	#$0, d4
L_FF29D4:
	bne.b	L_FF2A12
L_FF29D6:
	btst	#$1, d4
L_FF29DA:
	bne.w	L_FF2A60
L_FF29DE:
	cmpi.b	#$50, d5
L_FF29E2:
	beq.b	L_FF2A10
L_FF29E4:
	move.b	(a1)+, d0
L_FF29E6:
	ext.w	d0
L_FF29E8:
	add.w	d2, d0
L_FF29EA:
	move.w	d0, (a2)+
L_FF29EC:
	move.b	(a1)+, (a2)+
L_FF29EE:
	addq.b	#$1, d5
L_FF29F0:
	move.b	d5, (a2)+
L_FF29F2:
	move.b	(a1)+, d0
L_FF29F4:
	lsl.w	#$8, d0
L_FF29F6:
	move.b	(a1)+, d0
L_FF29F8:
	add.w	a3, d0
L_FF29FA:
	move.w	d0, (a2)+
L_FF29FC:
	move.b	(a1)+, d0
L_FF29FE:
	ext.w	d0
L_FF2A00:
	add.w	d3, d0
L_FF2A02:
	andi.w	#$1ff, d0
L_FF2A06:
	bne.b	L_FF2A0A
L_FF2A08:
	addq.w	#$1, d0
L_FF2A0A:
	move.w	d0, (a2)+
L_FF2A0C:
	dbra	d1, L_FF29DE
L_FF2A10:
	rts
L_FF2A12:
	btst	#$1, d4
L_FF2A16:
	bne.w	L_FF2AA6
L_FF2A1A:
	cmpi.b	#$50, d5
L_FF2A1E:
	beq.b	L_FF2A5E
L_FF2A20:
	move.b	(a1)+, d0
L_FF2A22:
	ext.w	d0
L_FF2A24:
	add.w	d2, d0
L_FF2A26:
	move.w	d0, (a2)+
L_FF2A28:
	move.b	(a1)+, d4
L_FF2A2A:
	move.b	d4, (a2)+
L_FF2A2C:
	addq.b	#$1, d5
L_FF2A2E:
	move.b	d5, (a2)+
L_FF2A30:
	move.b	(a1)+, d0
L_FF2A32:
	lsl.w	#$8, d0
L_FF2A34:
	move.b	(a1)+, d0
L_FF2A36:
	add.w	a3, d0
L_FF2A38:
	eori.w	#$800, d0
L_FF2A3C:
	move.w	d0, (a2)+
L_FF2A3E:
	move.b	(a1)+, d0
L_FF2A40:
	ext.w	d0
L_FF2A42:
	neg.w	d0
L_FF2A44:
	add.b	d4, d4
L_FF2A46:
	andi.w	#$18, d4
L_FF2A4A:
	addq.w	#$8, d4
L_FF2A4C:
	sub.w	d4, d0
L_FF2A4E:
	add.w	d3, d0
L_FF2A50:
	andi.w	#$1ff, d0
L_FF2A54:
	bne.b	L_FF2A58
L_FF2A56:
	addq.w	#$1, d0
L_FF2A58:
	move.w	d0, (a2)+
L_FF2A5A:
	dbra	d1, L_FF2A1A
L_FF2A5E:
	rts
L_FF2A60:
	cmpi.b	#$50, d5
L_FF2A64:
	beq.b	L_FF2AA4
L_FF2A66:
	move.b	(a1)+, d0
L_FF2A68:
	move.b	(a1), d4
L_FF2A6A:
	ext.w	d0
L_FF2A6C:
	neg.w	d0
L_FF2A6E:
	lsl.b	#$3, d4
L_FF2A70:
	andi.w	#$18, d4
L_FF2A74:
	addq.w	#$8, d4
L_FF2A76:
	sub.w	d4, d0
L_FF2A78:
	add.w	d2, d0
L_FF2A7A:
	move.w	d0, (a2)+
L_FF2A7C:
	move.b	(a1)+, (a2)+
L_FF2A7E:
	addq.b	#$1, d5
L_FF2A80:
	move.b	d5, (a2)+
L_FF2A82:
	move.b	(a1)+, d0
L_FF2A84:
	lsl.w	#$8, d0
L_FF2A86:
	move.b	(a1)+, d0
L_FF2A88:
	add.w	a3, d0
L_FF2A8A:
	eori.w	#$1000, d0
L_FF2A8E:
	move.w	d0, (a2)+
L_FF2A90:
	move.b	(a1)+, d0
L_FF2A92:
	ext.w	d0
L_FF2A94:
	add.w	d3, d0
L_FF2A96:
	andi.w	#$1ff, d0
L_FF2A9A:
	bne.b	L_FF2A9E
L_FF2A9C:
	addq.w	#$1, d0
L_FF2A9E:
	move.w	d0, (a2)+
L_FF2AA0:
	dbra	d1, L_FF2A60
L_FF2AA4:
	rts
L_FF2AA6:
	cmpi.b	#$50, d5
L_FF2AAA:
	beq.b	L_FF2AF8
L_FF2AAC:
	move.b	(a1)+, d0
L_FF2AAE:
	move.b	(a1), d4
L_FF2AB0:
	ext.w	d0
L_FF2AB2:
	neg.w	d0
L_FF2AB4:
	lsl.b	#$3, d4
L_FF2AB6:
	andi.w	#$18, d4
L_FF2ABA:
	addq.w	#$8, d4
L_FF2ABC:
	sub.w	d4, d0
L_FF2ABE:
	add.w	d2, d0
L_FF2AC0:
	move.w	d0, (a2)+
L_FF2AC2:
	move.b	(a1)+, d4
L_FF2AC4:
	move.b	d4, (a2)+
L_FF2AC6:
	addq.b	#$1, d5
L_FF2AC8:
	move.b	d5, (a2)+
L_FF2ACA:
	move.b	(a1)+, d0
L_FF2ACC:
	lsl.w	#$8, d0
L_FF2ACE:
	move.b	(a1)+, d0
L_FF2AD0:
	add.w	a3, d0
L_FF2AD2:
	eori.w	#$1800, d0
L_FF2AD6:
	move.w	d0, (a2)+
L_FF2AD8:
	move.b	(a1)+, d0
L_FF2ADA:
	ext.w	d0
L_FF2ADC:
	neg.w	d0
L_FF2ADE:
	add.b	d4, d4
L_FF2AE0:
	andi.w	#$18, d4
L_FF2AE4:
	addq.w	#$8, d4
L_FF2AE6:
	sub.w	d4, d0
L_FF2AE8:
	add.w	d3, d0
L_FF2AEA:
	andi.w	#$1ff, d0
L_FF2AEE:
	bne.b	L_FF2AF2
L_FF2AF0:
	addq.w	#$1, d0
L_FF2AF2:
	move.w	d0, (a2)+
L_FF2AF4:
	dbra	d1, L_FF2AA6
L_FF2AF8:
	rts
	dc.l	$30280008
	dc.l	$9078C400
	dc.l	$6B1A0C40
	dc.l	$01406C14
	dc.l	$3228000C
	dc.l	$9278C404
	dc.l	$6B0A0C41
	dc.l	$00E06C04
	dc.l	$70004E75
	dc.l	$70014E75
	dc.l	$72001228
	dc.l	$00193028
	dc.l	$00089078
	dc.l	$C400D041
	dc.l	$6B1ED241
	dc.l	$90410C40
	dc.l	$01406C14
	dc.l	$3228000C
	dc.l	$9278C404
	dc.l	$6B0A0C41
	dc.l	$00E06C04
	dc.l	$70004E75
	dc.l	$70014E75
L_FF2B56:
	moveq	#$0, d0
L_FF2B58:
	move.b	$200020.l, d0
L_FF2B5E:
	beq.b	L_FF2BA0
L_FF2B60:
	subq.w	#$1, d0
L_FF2B62:
	cmpi.w	#$9, d0
L_FF2B66:
	bcc.b	L_FF2B86
L_FF2B68:
	add.w	d0, d0
L_FF2B6A:
	lea.l	$ff2ba2.l, a0
L_FF2B70:
	move.w	(a0, d0.w), d0
L_FF2B74:
	moveq	#$0, d1
L_FF2B76:
	jsr	(a0, d0.w)
L_FF2B7A:
	bcs.b	L_FF2B86
L_FF2B7C:
	move.b	#$0, $200021.l
L_FF2B84:
	bra.b	L_FF2B8E
L_FF2B86:
	move.b	#$ff, $200021.l
L_FF2B8E:
	move.w	d0, $200022.l
L_FF2B94:
	move.w	d1, $200024.l
L_FF2B9A:
	clr.b	$200020.l
L_FF2BA0:
	rts
CommandRoutineTable:
	dc.l	$00120024
	dc.l	$0030004A
	dc.l	$006C0090
	dc.l	$00AA00B0
	dc.b	$00,$D6
L_FF2BB4:
	lea.l	$ff2c9a.l, a0
L_FF2BBA:
	lea.l	$ff391a.l, a1
L_FF2BC0:
	moveq	#$0, d0
L_FF2BC2:
	jmp	$FFFFfdae.w
L_FF2BC6:
	moveq	#$1, d0
L_FF2BC8:
	movea.l	#$ff391a, a1
L_FF2BCE:
	jmp	$FFFFfdae.w
L_FF2BD2:
	movea.l	#$200030, a0
L_FF2BD8:
	move.b	#$0, $b(a0)
L_FF2BDE:
	move.l	#$0, $c(a0)
L_FF2BE6:
	moveq	#$2, d0
L_FF2BE8:
	jmp	$FFFFfdae.w
L_FF2BEC:
	movea.l	#$200030, a0
L_FF2BF2:
	move.b	#$0, $b(a0)
L_FF2BF8:
	move.l	#$0, $c(a0)
L_FF2C00:
	movea.l	#$200040, a1
L_FF2C06:
	moveq	#$3, d0
L_FF2C08:
	jsr	$FFFFfdae.w
L_FF2C0C:
	rts
L_FF2C0E:
	movea.l	#$200030, a0
L_FF2C14:
	move.b	$200029.l, $b(a0)
L_FF2C1C:
	move.w	$20002a.l, $c(a0)
L_FF2C24:
	movea.l	#$200040, a1
L_FF2C2A:
	moveq	#$4, d0
L_FF2C2C:
	jsr	$FFFFfdae.w
L_FF2C30:
	rts
L_FF2C32:
	movea.l	#$200030, a0
L_FF2C38:
	move.b	#$0, $b(a0)
L_FF2C3E:
	move.l	#$0, $c(a0)
L_FF2C46:
	moveq	#$5, d0
L_FF2C48:
	jmp	$FFFFfdae.w
L_FF2C4C:
	moveq	#$6, d0
L_FF2C4E:
	jmp	$FFFFfdae.w
L_FF2C52:
	movea.l	#$200030, a0
L_FF2C58:
	move.b	#$0, $b(a0)
L_FF2C5E:
	move.l	#$0, $c(a0)
L_FF2C66:
	movea.l	#$200044, a1
L_FF2C6C:
	move.l	$200040.l, d1
L_FF2C72:
	moveq	#$7, d0
L_FF2C74:
	jmp	$FFFFfdae.w
L_FF2C78:
	movea.l	#$200030, a0
L_FF2C7E:
	move.b	$200029.l, $b(a0)
L_FF2C86:
	move.w	$20002a.l, $c(a0)
L_FF2C8E:
	movea.l	#$200040, a1
L_FF2C94:
	moveq	#$8, d0
L_FF2C96:
	jmp	$FFFFfdae.w
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$00050000
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$0B0B0B00
	dc.l	$23191F00
	dc.l	$00000000
	dc.l	$10000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.b	$00,$00
L_FF3BE8:
	bsr.w	L_FF3C00
L_FF3BEC:
	bne.b	L_FF3BF0
L_FF3BEE:
	clr.b	d0
L_FF3BF0:
	move.b	d0, $200026.l
L_FF3BF6:
	rts
L_FF3BF8:
	tst.b	$200026.l
L_FF3BFE:
	rts
L_FF3C00:
	tst.b	$200027.l
L_FF3C06:
	rts
	dc.l	$610000BE
	dc.l	$61000054
	dc.l	$61000008
	dc.l	$4E756000
	dc.l	$02E66000
	dc.l	$02B64EB9
	dc.l	$00FF237C
	dc.l	$41F900FF
	dc.l	$392643F9
	dc.l	$00200040
	dc.l	$303C00A8
	dc.l	$22D851C8
	dc.l	$FFFC41F9
	dc.l	$00FF3BCA
	dc.l	$43F90020
	dc.l	$02E4303C
	dc.l	$000622D8
	dc.l	$51C8FFFC
	dc.l	$13FC0000
	dc.l	$00200029
	dc.l	$33FC000B
	dc.l	$0020002A
	dc.l	$4E7513FC
	dc.l	$00000020
	dc.l	$002933FC
	dc.l	$000B0020
	dc.l	$002A41F9
	dc.l	$00FF3C7A
	dc.l	$600C534F
	dc.l	$4E494343
	dc.l	$445F5F5F
	dc.b	$5F,$00
L_FF3C86:
	movem.l	a0-a1, -(a7)
L_FF3C8A:
	movea.l	#$200030, a1
L_FF3C90:
	move.l	(a0)+, (a1)+
L_FF3C92:
	move.l	(a0)+, (a1)+
L_FF3C94:
	move.w	(a0)+, (a1)+
L_FF3C96:
	move.b	(a0)+, (a1)+
L_FF3C98:
	movem.l	(a7)+, a0-a1
L_FF3C9C:
	rts
L_FF3C9E:
	bsr.w	L_FF3BF8
L_FF3CA2:
	bne.b	L_FF3CBC
L_FF3CA4:
	move.b	$ff0f1f.l, $200028.l
L_FF3CAE:
	jsr	L_FF2368.l
L_FF3CB4:
	jsr	L_FF237C.l
L_FF3CBA:
	bra.b	L_FF3CC0
L_FF3CBC:
	bsr.w	L_FF2B56
L_FF3CC0:
	tst.b	$200021.l
L_FF3CC6:
	rts
L_FF3CC8:
	jsr	L_FF237C.l
L_FF3CCE:
	bsr.w	L_FF3D52
L_FF3CD2:
	bne.w	L_FF3CF8
L_FF3CD6:
	move.b	#$1, $200026.l
L_FF3CDE:
	move.b	#$1, $200020.l
L_FF3CE6:
	bsr.b	L_FF3C9E
L_FF3CE8:
	tst.b	$200021.l
L_FF3CEE:
	beq.b	L_FF3D02
L_FF3CF0:
	tst.w	$200024.l
L_FF3CF6:
	bne.b	L_FF3D4C
L_FF3CF8:
	move.b	#$0, $200027.l
L_FF3D00:
	bra.b	L_FF3D0E
L_FF3D02:
	bsr.w	L_FF3E9C
L_FF3D06:
	move.b	#$1, $200027.l
L_FF3D0E:
	move.b	#$0, $200026.l
L_FF3D16:
	move.b	#$1, $200020.l
L_FF3D1E:
	bsr.w	L_FF3C9E
L_FF3D22:
	tst.b	$200021.l
L_FF3D28:
	bne.b	L_FF3D46
L_FF3D2A:
	bsr.w	L_FF3E9C
L_FF3D2E:
	tst.b	$200027.l
L_FF3D34:
	beq.b	L_FF3D3C
L_FF3D36:
	move.w	#$0, d0
L_FF3D3A:
	rts
L_FF3D3C:
	move.w	#$1, d0
L_FF3D40:
	move.w	#$0, d1
L_FF3D44:
	rts
L_FF3D46:
	move.w	#$ffff, d0
L_FF3D4A:
	rts
L_FF3D4C:
	move.w	#$fffe, d0
L_FF3D50:
	rts
L_FF3D52:
	btst.b	#$7, $400001.l
L_FF3D5A:
	beq.b	L_FF3D82
L_FF3D5C:
	lea.l	$400010.l, a0
L_FF3D62:
	lea.l	$ff3e52.l, a1
L_FF3D68:
	moveq	#$2, d0
L_FF3D6A:
	cmpm.l	(a0)+, (a1)+
L_FF3D6C:
	bne.b	L_FF3D82
L_FF3D6E:
	dbra	d0, L_FF3D6A
L_FF3D72:
	movea.l	#$fffffdae, a0
L_FF3D78:
	jsr	$400020.l
L_FF3D7E:
	bra.w	L_FF3E46
L_FF3D82:
	btst.b	#$7, $400001.l
L_FF3D8A:
	bne.w	L_FF3E4E
L_FF3D8E:
	move.b	$400001.l, d0
L_FF3D94:
	andi.l	#$7, d0
L_FF3D9A:
	move.l	#$2000, d1
L_FF3DA0:
	lsl.l	d0, d1
L_FF3DA2:
	lsl.l	#$1, d1
L_FF3DA4:
	lea.l	$5fff80.l, a2
L_FF3DAA:
	adda.l	d1, a2
L_FF3DAC:
	movea.l	a2, a0
L_FF3DAE:
	adda.w	#$60, a0
L_FF3DB2:
	lea.l	$ff3e52.l, a1
L_FF3DB8:
	movep.l	$1(a0), d1
L_FF3DBC:
	cmp.l	(a1), d1
L_FF3DBE:
	bne.w	L_FF3E0C
L_FF3DC2:
	movep.l	$9(a0), d1
L_FF3DC6:
	cmp.l	$4(a1), d1
L_FF3DCA:
	bne.w	L_FF3E0C
L_FF3DCE:
	movep.l	$11(a0), d1
L_FF3DD2:
	cmp.l	$8(a1), d1
L_FF3DD6:
	bne.w	L_FF3E0C
L_FF3DDA:
	movea.l	a2, a0
L_FF3DDC:
	adda.w	#$40, a0
L_FF3DE0:
	lea.l	$ff3e5e.l, a1
L_FF3DE6:
	movep.l	$1(a0), d1
L_FF3DEA:
	cmp.l	(a1), d1
L_FF3DEC:
	bne.w	L_FF3E0C
L_FF3DF0:
	movep.l	$9(a0), d1
L_FF3DF4:
	cmp.l	$4(a1), d1
L_FF3DF8:
	bne.w	L_FF3E0C
L_FF3DFC:
	movep.l	$11(a0), d1
L_FF3E00:
	cmp.l	$8(a1), d1
L_FF3E04:
	bne.w	L_FF3E0C
L_FF3E08:
	bra.w	L_FF3E46
L_FF3E0C:
	bset.b	#$0, $7fffff.l
L_FF3E14:
	lea.l	$600001.l, a0
L_FF3E1A:
	move.b	(a0), d0
L_FF3E1C:
	move.b	#$5a, (a0)
L_FF3E20:
	cmpi.b	#$5a, (a0)
L_FF3E24:
	bne.b	L_FF3E3C
L_FF3E26:
	move.b	#$a5, (a0)
L_FF3E2A:
	cmpi.b	#$a5, (a0)
L_FF3E2E:
	bne.b	L_FF3E3C
L_FF3E30:
	move.b	d0, (a0)
L_FF3E32:
	bclr.b	#$0, $7fffff.l
L_FF3E3A:
	bra.b	L_FF3E4A
L_FF3E3C:
	bclr.b	#$0, $7fffff.l
L_FF3E44:
	bra.b	L_FF3E4E
L_FF3E46:
	moveq	#$0, d0
L_FF3E48:
	rts
L_FF3E4A:
	moveq	#$0, d0
L_FF3E4C:
	rts
L_FF3E4E:
	moveq	#$ff, d0
L_FF3E50:
	rts
	dc.l	$52414D5F
	dc.l	$43415254
	dc.l	$52494447
	dc.l	$53454741
	dc.l	$5F43445F
	dc.l	$524F4D00
L_FF3E6A:
	move.l	d0, -(a7)
L_FF3E6C:
	jsr	L_FF237C.l
L_FF3E72:
	move.l	(a7)+, d0
L_FF3E74:
	move.l	d0, $200040.l
L_FF3E7A:
	lea.l	$ff3e90.l, a0
L_FF3E80:
	bsr.w	L_FF3C86
L_FF3E84:
	move.b	#$8, $200020.l
L_FF3E8C:
	bra.w	L_FF3C9E
	dc.l	$2A2A2A2A
	dc.l	$2A2A2A2A
	dc.l	$2A2A2A00
L_FF3E9C:
	jsr	L_FF237C.l
L_FF3EA2:
	move.b	#$2, $200020.l
L_FF3EAA:
	bra.w	L_FF3C9E
L_FF3EAE:
	jsr	L_FF237C.l
L_FF3EB4:
	move.b	#$3, $200020.l
L_FF3EBC:
	bra.w	L_FF3C9E
L_FF3EC0:
	jsr	L_FF237C.l
L_FF3EC6:
	move.b	#$4, $200020.l
L_FF3ECE:
	bra.w	L_FF3C9E
	dc.l	$4EB900FF
	dc.l	$237C13FC
	dc.l	$000A0020
	dc.l	$00206000
	dc.b	$FD,$BC
L_FF3EE4:
	jsr	L_FF237C.l
L_FF3EEA:
	move.b	#$5, $200020.l
L_FF3EF2:
	bsr.w	L_FF3C9E
L_FF3EF6:
	bne.b	L_FF3EFC
L_FF3EF8:
	bsr.w	L_FF3F36
L_FF3EFC:
	rts
	dc.l	$4EB900FF
	dc.l	$237C13FC
	dc.l	$000B0020
	dc.l	$00206100
	dc.l	$FD904E75
	dc.l	$4EB900FF
	dc.l	$237C13FC
	dc.l	$00060020
	dc.l	$00206000
	dc.l	$FD7C4EB9
	dc.l	$00FF237C
	dc.l	$13FC0007
	dc.l	$00200020
	dc.l	$6000FD6A
L_FF3F36:
	jsr	L_FF237C.l
L_FF3F3C:
	move.b	#$9, $200020.l
L_FF3F44:
	bra.w	L_FF3C9E
L_FF3F48:
	bclr.b	#$6, $ff0f17.l
L_FF3F50:
	move.w	$ff0f16.l, $c00004.l
L_FF3F5A:
	bsr.w	L_FF23A0
L_FF3F5E:
	move.l	#$60000003, $c00004.l
L_FF3F68:
	move.w	#$7ff, d7
L_FF3F6C:
	move.w	#$4026, $c00000.l
L_FF3F74:
	dbra	d7, L_FF3F6C
L_FF3F78:
	move.l	#$1020304, d0
L_FF3F7E:
	jsr	L_FF631C.l
L_FF3F84:
	move.l	#$5060708, d0
L_FF3F8A:
	jsr	L_FF631C.l
L_FF3F90:
	move.l	#$90a, d0
L_FF3F96:
	jsr	L_FF631C.l
L_FF3F9C:
	move.w	#$0, d0
L_FF3FA0:
	jsr	L_FF6556.l
L_FF3FA6:
	move.w	#$1, d0
L_FF3FAA:
	jsr	L_FF6556.l
L_FF3FB0:
	move.w	#$2, d0
L_FF3FB4:
	jsr	L_FF6556.l
L_FF3FBA:
	lea.l	$FFFFb000.w, a0
L_FF3FBE:
	moveq	#$0, d0
L_FF3FC0:
	move.l	d0, (a0)+
L_FF3FC2:
	move.l	d0, (a0)+
L_FF3FC4:
	jsr	L_FF67BA.l
L_FF3FCA:
	bsr.w	L_FF270C
L_FF3FCE:
	bset.b	#$6, $ff0f17.l
L_FF3FD6:
	move.w	$ff0f16.l, $c00004.l
L_FF3FE0:
	rts
L_FF3FE2:
	moveq	#$0, d0
L_FF3FE4:
	move.b	$FFFFcd15.w, d0
L_FF3FE8:
	add.w	d0, d0
L_FF3FEA:
	move.w	$ff3ff4(pc, d0.w), d0
L_FF3FEE:
	jsr	IndexedRoutineTable(pc, d0.w)
L_FF3FF2:
	rts
IndexedRoutineTable:
	dc.l	$003801A6
	dc.l	$00EA0336
	dc.l	$07620BD4
	dc.l	$0C7A0AD4
	dc.l	$00320AB8
L_FF4008:
	moveq	#$1e, d0
L_FF400A:
	movem.l	d0, -(a7)
L_FF400E:
	move.b	#$ff, $FFFFcd20.w
L_FF4014:
	bsr.w	L_FF224A
L_FF4018:
	movem.l	(a7)+, d0
L_FF401C:
	dbra	d0, L_FF400A
L_FF4020:
	addq.l	#$8, a7
L_FF4022:
	bra.w	L_FF208E
L_FF4026:
	addq.l	#$8, a7
L_FF4028:
	bra.w	L_FF202E
L_FF402C:
	lea.l	$ff4d98.l, a0
L_FF4032:
	tst.b	$ff0f1f.l
L_FF4038:
	beq.b	L_FF4040
L_FF403A:
	lea.l	$ff4d92.l, a0
L_FF4040:
	bsr.w	L_FF4CD2
L_FF4044:
	bsr.w	L_FF4298
L_FF4048:
	cmpi.b	#$5, $FFFFcd1e.w
L_FF404E:
	beq.b	L_FF4086
L_FF4050:
	cmpi.b	#$6, $FFFFcd1e.w
L_FF4056:
	beq.b	L_FF4062
L_FF4058:
	bsr.w	L_FF4F8C
L_FF405C:
	bgt.w	L_FF40AA
L_FF4060:
	rts
L_FF4062:
	move.b	#$6, $FFFFcd16.w
L_FF4068:
	move.w	#$1, $FFFFcd14.w
L_FF406E:
	move.b	#$1, $FFFFcd25.w
L_FF4074:
	move.b	#$0, $FFFFcd21.w
L_FF407A:
	move.b	#$0, $FFFFcd24.w
L_FF4080:
	bsr.w	L_FF54C2
L_FF4084:
	rts
L_FF4086:
	move.b	#$5, $FFFFcd16.w
L_FF408C:
	move.w	#$1, $FFFFcd14.w
L_FF4092:
	move.b	#$1, $FFFFcd24.w
L_FF4098:
	move.b	#$0, $FFFFcd21.w
L_FF409E:
	move.b	#$0, $FFFFcd25.w
L_FF40A4:
	bsr.w	L_FF54C2
L_FF40A8:
	rts
L_FF40AA:
	move.b	$FFFFcd1e.w, d0
L_FF40AE:
	cmpi.b	#$1, d0
L_FF40B2:
	beq.b	L_FF40BC
L_FF40B4:
	cmpi.b	#$2, d0
L_FF40B8:
	beq.b	L_FF40C0
L_FF40BA:
	rts
L_FF40BC:
	bra.w	L_FF4008
L_FF40C0:
	move.b	#$2, $FFFFcd16.w
L_FF40C6:
	move.b	#$ff, $FFFFcd21.w
L_FF40CC:
	move.w	#$2, $FFFFcd14.w
L_FF40D2:
	move.b	#$3, $FFFFcd1e.w
L_FF40D8:
	bsr.w	L_FF5056
L_FF40DC:
	rts
L_FF40DE:
	cmpi.b	#$6, $FFFFcd16.w
L_FF40E4:
	bne.b	L_FF410C
L_FF40E6:
	bsr.w	L_FF3C00
L_FF40EA:
	bne.b	L_FF410C
L_FF40EC:
	bsr.w	L_FF4F6C
L_FF40F0:
	move.w	$6(a1), d0
L_FF40F4:
	bsr.w	L_FF5692
L_FF40F8:
	bsr.w	L_FF5176
L_FF40FC:
	beq.b	L_FF410C
L_FF40FE:
	move.b	#$4, $FFFFcd1e.w
L_FF4104:
	lea.l	$ff4da2.l, a0
L_FF410A:
	bra.b	L_FF4112
L_FF410C:
	lea.l	$ff4da8.l, a0
L_FF4112:
	bsr.w	L_FF4CD2
L_FF4116:
	bsr.w	L_FF42BE
L_FF411A:
	bsr.w	L_FF4F8C
L_FF411E:
	bgt.b	L_FF4124
L_FF4120:
	bmi.b	L_FF4160
L_FF4122:
	rts
L_FF4124:
	cmpi.b	#$3, $FFFFcd1e.w
L_FF412A:
	beq.b	L_FF4142
L_FF412C:
	cmpi.b	#$1, $FFFFcd1e.w
L_FF4132:
	beq.b	L_FF4150
L_FF4134:
	move.b	#$28, $FFFFcd23.w
L_FF413A:
	move.w	#$4, $FFFFcd14.w
L_FF4140:
	rts
L_FF4142:
	move.b	#$28, $FFFFcd22.w
L_FF4148:
	move.w	#$3, $FFFFcd14.w
L_FF414E:
	rts
L_FF4150:
	bra.w	L_FF4008
	dc.l	$303C009E
	dc.l	$4EB900FF
	dc.l	$25C24E75
L_FF4160:
	bsr.w	L_FF5758
L_FF4164:
	cmpi.b	#$2, $FFFFcd16.w
L_FF416A:
	beq.b	L_FF417A
L_FF416C:
	move.w	#$1, $FFFFcd14.w
L_FF4172:
	move.b	$FFFFcd16.w, $FFFFcd1e.w
L_FF4178:
	bra.b	L_FF4186
L_FF417A:
	move.w	#$0, $FFFFcd14.w
L_FF4180:
	move.b	$FFFFcd16.w, $FFFFcd1e.w
L_FF4186:
	move.b	#$0, $FFFFcd23.w
L_FF418C:
	move.b	#$0, $FFFFcd22.w
L_FF4192:
	move.b	#$0, $FFFFcd21.w
L_FF4198:
	rts
L_FF419A:
	bsr.w	L_FF4F7C
L_FF419E:
	btst	#$0, d0
L_FF41A2:
	beq.b	L_FF41B4
L_FF41A4:
	move.w	#$9b, d0
L_FF41A8:
	jsr	L_FF25C2.l
L_FF41AE:
	bsr.w	L_FF4E28
L_FF41B2:
	bra.b	L_FF422C
L_FF41B4:
	btst	#$1, d0
L_FF41B8:
	beq.b	L_FF41CA
L_FF41BA:
	move.w	#$9b, d0
L_FF41BE:
	jsr	L_FF25C2.l
L_FF41C4:
	bsr.w	L_FF4EB8
L_FF41C8:
	bra.b	L_FF422C
L_FF41CA:
	btst	#$2, d0
L_FF41CE:
	beq.b	L_FF41D8
L_FF41D0:
	tst.b	$FFFFcd25.w
L_FF41D4:
	bne.b	L_FF422E
L_FF41D6:
	bra.b	L_FF422C
L_FF41D8:
	btst	#$3, d0
L_FF41DC:
	beq.b	L_FF41E6
L_FF41DE:
	tst.b	$FFFFcd24.w
L_FF41E2:
	bne.b	L_FF422E
L_FF41E4:
	bra.b	L_FF422C
L_FF41E6:
	bsr.w	L_FF4F8C
L_FF41EA:
	beq.b	L_FF422C
L_FF41EC:
	bmi.b	L_FF422C
L_FF41EE:
	bsr.w	L_FF4F6C
L_FF41F2:
	move.w	$10(a1), d0
L_FF41F6:
	cmp.w	$6(a1), d0
L_FF41FA:
	beq.b	L_FF422C
L_FF41FC:
	move.w	$6(a1), d0
L_FF4200:
	cmp.w	$8(a1), d0
L_FF4204:
	bge.b	L_FF422C
L_FF4206:
	tst.b	$FFFFcd24.w
L_FF420A:
	beq.b	L_FF4214
L_FF420C:
	move.b	#$ff, $FFFFcd24.w
L_FF4212:
	bra.b	L_FF421A
L_FF4214:
	move.b	#$ff, $FFFFcd25.w
L_FF421A:
	bsr.w	L_FF5056
L_FF421E:
	move.w	#$2, $FFFFcd14.w
L_FF4224:
	move.b	#$3, $FFFFcd1e.w
L_FF422A:
	rts
L_FF422C:
	rts
L_FF422E:
	bsr.w	L_FF54B0
L_FF4232:
	move.b	#$0, $FFFFcd21.w
L_FF4238:
	move.b	#$0, $FFFFcd25.w
L_FF423E:
	move.b	#$0, $FFFFcd24.w
L_FF4244:
	move.w	#$0, $FFFFcd14.w
L_FF424A:
	move.b	#$1, $FFFFcd1e.w
L_FF4250:
	rts
	dc.l	$103C0000
	dc.l	$0C380006
	dc.l	$CD166712
	dc.l	$0C380005
	dc.l	$CD166714
	dc.l	$11C0CD25
	dc.l	$11C0CD24
	dc.l	$606011C0
	dc.l	$CD2111C0
	dc.l	$CD246056
	dc.l	$11C0CD25
	dc.l	$11C0CD21
	dc.l	$604C11FC
	dc.l	$0000CD25
	dc.l	$11FC0000
	dc.l	$CD2011FC
	dc.l	$0000CD24
	dc.b	$60,$38
L_FF4298:
	move.b	#$0, $FFFFcd21.w
L_FF429E:
	move.b	#$0, $FFFFcd25.w
L_FF42A4:
	move.b	#$0, $FFFFcd20.w
L_FF42AA:
	move.b	#$0, $FFFFcd24.w
L_FF42B0:
	move.b	#$0, $FFFFcd22.w
L_FF42B6:
	move.b	#$0, $FFFFcd23.w
L_FF42BC:
	bra.b	L_FF42D0
L_FF42BE:
	move.b	#$0, $FFFFcd22.w
L_FF42C4:
	move.b	#$0, $FFFFcd23.w
L_FF42CA:
	move.b	#$0, $FFFFcd20.w
L_FF42D0:
	move.b	$FFFFcd1e.w, d0
L_FF42D4:
	cmpi.b	#$1, d0
L_FF42D8:
	beq.b	L_FF42FA
L_FF42DA:
	cmpi.b	#$2, d0
L_FF42DE:
	beq.b	L_FF4302
L_FF42E0:
	cmpi.b	#$3, d0
L_FF42E4:
	beq.b	L_FF430A
L_FF42E6:
	cmpi.b	#$4, d0
L_FF42EA:
	beq.b	L_FF4312
L_FF42EC:
	cmpi.b	#$5, d0
L_FF42F0:
	beq.b	L_FF431A
L_FF42F2:
	cmpi.b	#$6, d0
L_FF42F6:
	beq.b	L_FF4322
L_FF42F8:
	rts
L_FF42FA:
	move.b	#$1, $FFFFcd20.w
L_FF4300:
	rts
L_FF4302:
	move.b	#$1, $FFFFcd21.w
L_FF4308:
	rts
L_FF430A:
	move.b	#$1, $FFFFcd22.w
L_FF4310:
	rts
L_FF4312:
	move.b	#$1, $FFFFcd23.w
L_FF4318:
	rts
L_FF431A:
	move.b	#$1, $FFFFcd24.w
L_FF4320:
	rts
L_FF4322:
	move.b	#$1, $FFFFcd25.w
L_FF4328:
	rts
L_FF432A:
	moveq	#$0, d0
L_FF432C:
	move.b	$FFFFcd14.w, d0
L_FF4330:
	add.w	d0, d0
L_FF4332:
	move.w	$ff433a(pc, d0.w), d0
L_FF4336:
	jmp	$ff433a(pc, d0.w)
	dc.l	$001800CC
	dc.l	$013E0152
	dc.l	$017E0218
	dc.l	$02D802F8
	dc.l	$034C0370
	dc.l	$039203B4
	dc.l	$61001404
	dc.l	$0C380002
	dc.l	$CD166700
	dc.l	$007C6100
	dc.l	$0C0A3029
	dc.l	$00066100
	dc.l	$13286100
	dc.l	$0E08674C
	dc.l	$0C380005
	dc.l	$CD16670E
	dc.l	$11FC0005
	dc.l	$CD1E11FC
	dc.l	$0005CD17
	dc.l	$600C11FC
	dc.l	$0006CD1E
	dc.l	$11FC0006
	dc.l	$CD176100
	dc.l	$0C886100
	dc.l	$13A26718
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$610013AC
	dc.l	$303C000D
	dc.l	$600008A8
	dc.l	$11FC0009
	dc.l	$CD144E75
	dc.l	$11FC0002
	dc.l	$CD1E6100
	dc.l	$F83A6708
	dc.l	$303C0002
	dc.l	$610008BE
	dc.l	$11FC0005
	dc.l	$CD144E75
	dc.l	$41F8CD30
	dc.l	$103C0030
	dc.l	$11400009
	dc.l	$1140000A
	dc.l	$6100F814
	dc.l	$6708303C
	dc.l	$00026100
	dc.l	$089811FC
	dc.l	$0001CD14
	dc.l	$11FC0006
	dc.l	$CD1E4E75
	dc.l	$6100F7F8
	dc.l	$672C41F9
	dc.l	$00FF4DB2
	dc.l	$610008BE
	dc.l	$6100FE6C
	dc.l	$11FC00FF
	dc.l	$CD216100
	dc.l	$0B6A6E06
	dc.l	$6B00003A
	dc.l	$4E756100
	dc.l	$08940C38
	dc.l	$0005CD1E
	dc.l	$670811FC
	dc.l	$0028CD25
	dc.l	$600611FC
	dc.l	$0028CD24
	dc.l	$11F8CD1E
	dc.l	$CD176100
	dc.l	$099A11FC
	dc.l	$0004B3A4
	dc.l	$4238B3A8
	dc.l	$11FC0002
	dc.l	$CD144E75
	dc.l	$6100085E
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$610012E4
	dc.l	$4E750C38
	dc.l	$0002B3A4
	dc.l	$67024E75
	dc.l	$11FC0003
	dc.l	$CD146000
	dc.l	$06144A38
	dc.l	$CD2B6612
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$610012B8
	dc.l	$4E7511FC
	dc.l	$0004CD14
	dc.l	$610012C6
	dc.l	$303C0006
	dc.l	$600006EA
	dc.l	$4E754A38
	dc.l	$CD2B6610
	dc.l	$610012B2
	dc.l	$11FC0003
	dc.l	$CD146000
	dc.l	$05D44E75
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$61000B42
L_FF44DE:
	bsr.w	L_FF56BA
L_FF44E2:
	tst.b	d0
L_FF44E4:
	bne.w	L_FF44F2
L_FF44E8:
	bsr.w	L_FF561E
L_FF44EC:
	bsr.w	L_FF5758
L_FF44F0:
	rts
L_FF44F2:
	movem.l	d0, -(a7)
L_FF44F6:
	bsr.w	L_FF5772
L_FF44FA:
	bsr.w	L_FF50AC
L_FF44FE:
	movem.l	(a7)+, d0
L_FF4502:
	bra.w	L_FF4506
L_FF4506:
	movem.l	d0, -(a7)
L_FF450A:
	move.w	#$9e, d0
L_FF450E:
	jsr	L_FF25C2.l
L_FF4514:
	movem.l	(a7)+, d0
L_FF4518:
	cmpi.b	#$1, d0
L_FF451C:
	beq.b	L_FF4532
L_FF451E:
	move.w	#$8, $FFFFcd14.w
L_FF4524:
	move.b	#$1, $FFFFcd1e.w
L_FF452A:
	moveq	#$8, d0
L_FF452C:
	moveq	#$9, d0
L_FF452E:
	moveq	#$a, d0
L_FF4530:
	bra.b	L_FF454E
L_FF4532:
	move.w	#$0, $FFFFcd14.w
L_FF4538:
	move.b	$FFFFcd16.w, $FFFFcd1e.w
L_FF453E:
	bsr.w	L_FF5758
L_FF4542:
	moveq	#$3, d0
L_FF4544:
	cmpi.b	#$5, $FFFFcd17.w
L_FF454A:
	beq.b	L_FF454E
L_FF454C:
	moveq	#$4, d0
L_FF454E:
	bra.w	L_FF4C5C
	dc.l	$6100F6AC
	dc.l	$673C41F9
	dc.l	$00FF4DC6
	dc.l	$0C380006
	dc.l	$CD166706
	dc.l	$41F900FF
	dc.l	$4DBC6100
	dc.l	$07646100
	dc.l	$FCE06100
	dc.l	$0A166E24
	dc.l	$6B024E75
	dc.l	$61000742
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$610011C8
	dc.l	$4E7511FC
	dc.l	$0002CD17
	dc.l	$6000005E
	dc.l	$61000722
	dc.l	$11F8CD1E
	dc.l	$CD170C38
	dc.l	$0002CD17
	dc.l	$674A6100
	dc.l	$11A66100
	dc.l	$09B63029
	dc.l	$00066100
	dc.l	$10D41028
	dc.l	$00091228
	dc.l	$000A0C00
	dc.l	$005F6606
	dc.l	$103C0030
	dc.l	$120041F8
	dc.l	$CD301140
	dc.l	$00091141
	dc.l	$000A6100
	dc.l	$11906100
	dc.l	$080211FC
	dc.l	$0004B3A4
	dc.l	$4238B3A8
	dc.l	$11FC0002
	dc.l	$CD144E75
	dc.l	$61000A22
	dc.l	$11FC0004
	dc.l	$B3A411FC
	dc.l	$0001B3A8
	dc.l	$11FC0006
	dc.l	$CD144E75
	dc.l	$0C380010
	dc.l	$B3A46702
	dc.l	$4E7511FC
	dc.l	$0007CD14
	dc.l	$4EB900FF
	dc.l	$5772303C
	dc.l	$00006000
	dc.l	$05704E75
	dc.l	$4A38CD2B
	dc.l	$661411FC
	dc.l	$0002B3A4
	dc.l	$11FC0008
	dc.l	$CD1411FC
	dc.l	$0002CD50
	dc.l	$4E754238
	dc.l	$CD5111FC
	dc.l	$0003CD50
	dc.l	$11FC0002
	dc.l	$B3A431FC
	dc.l	$0000CD14
	dc.l	$11F8CD16
	dc.l	$CD1E6100
	dc.l	$09B46100
	dc.l	$104C4A00
	dc.l	$6600FE92
	dc.l	$4EB900FF
	dc.l	$57726100
	dc.l	$0C8E6100
	dc.l	$10D64E75
	dc.l	$4238CD50
	dc.l	$0C380004
	dc.l	$CD516702
	dc.l	$4E754238
	dc.l	$CD5131FC
	dc.l	$0000CD14
	dc.l	$11F8CD16
	dc.l	$CD1E6100
	dc.l	$10B24E75
	dc.l	$610010C6
	dc.l	$61000738
	dc.l	$610010A4
	dc.l	$610002C6
	dc.l	$4238CD2E
	dc.l	$11FC0003
	dc.l	$CD2D11FC
	dc.l	$000ACD14
	dc.l	$4E754238
	dc.l	$CD2D0C38
	dc.l	$000BCD2E
	dc.l	$67024E75
	dc.l	$11FC000B
	dc.l	$CD146100
	dc.l	$1090303C
	dc.l	$00006000
	dc.l	$04B44E75
	dc.l	$4238CD2E
	dc.l	$610005CE
	dc.l	$4A38CD2B
	dc.l	$661231FC
	dc.l	$0000CD14
	dc.l	$11F8CD16
	dc.l	$CD1E6100
	dc.l	$104E4E75
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$61000902
	dc.l	$610009F6
	dc.l	$48E78000
	dc.l	$61000F92
	dc.l	$4CDF0002
	dc.l	$4A006600
	dc.l	$FDD448E7
	dc.l	$40006100
	dc.l	$0EE46100
	dc.l	$10344CDF
	dc.l	$0001323C
	dc.l	$400041F8
	dc.l	$CD706100
	dc.l	$0A4C6100
	dc.l	$10064E75
L_FF4756:
	moveq	#$0, d0
L_FF4758:
	move.b	$FFFFcd14.w, d0
L_FF475C:
	add.w	d0, d0
L_FF475E:
	move.w	$ff4766(pc, d0.w), d0
L_FF4762:
	jmp	$ff4766(pc, d0.w)
	dc.l	$001A0048
	dc.l	$00600072
	dc.l	$00EE0000
	dc.l	$00000000
	dc.l	$0116012E
	dc.l	$0140016E
	dc.l	$01964A38
	dc.l	$CD21661A
	dc.l	$11FC0001
	dc.l	$CD146100
	dc.l	$01F06100
	dc.l	$0D024238
	dc.l	$CD2E11FC
	dc.l	$0001CD2D
	dc.l	$4E7511FC
	dc.l	$0001CD50
	dc.l	$11FC0008
	dc.l	$CD144E75
	dc.l	$4238CD2D
	dc.l	$0C38000B
	dc.l	$CD2E660A
	dc.l	$4238CD2E
	dc.l	$11FC0002
	dc.l	$CD144E75
	dc.l	$11FC0003
	dc.l	$CD146100
	dc.l	$0F8A303C
	dc.l	$00016000
	dc.l	$03C84A38
	dc.l	$CD2B6764
	dc.l	$6100016E
	dc.l	$4A3900FF
	dc.l	$0F1F6700
	dc.l	$00466100
	dc.l	$F4746100
	dc.l	$077A0C69
	dc.l	$000C0000
	dc.l	$6D346100
	dc.l	$F41C6100
	dc.l	$F4606100
	dc.l	$F6DE6622
	dc.l	$61000B00
	dc.l	$61000B36
	dc.l	$423900FF
	dc.l	$0F1F31FC
	dc.l	$0000CD14
	dc.l	$11F8CD16
	dc.l	$CD1E700B
	dc.l	$60000434
	dc.l	$4E756100
	dc.l	$F6E46100
	dc.l	$0F2631FC
	dc.l	$0000CD14
	dc.l	$11F8CD16
	dc.l	$CD1E4E75
	dc.l	$61000F14
	dc.l	$11FC0002
	dc.l	$CD2D11FC
	dc.l	$0004CD14
	dc.l	$4E754238
	dc.l	$CD2D0C38
	dc.l	$000BCD2E
	dc.l	$67024E75
	dc.l	$61000EF4
	dc.l	$4238CD2E
	dc.l	$61000C44
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$4E754238
	dc.l	$CD500C38
	dc.l	$0004CD51
	dc.l	$660A4238
	dc.l	$CD5111FC
	dc.l	$0009CD14
	dc.l	$4E7511FC
	dc.l	$000ACD14
	dc.l	$61000EBC
	dc.l	$303C0001
	dc.l	$600002FA
	dc.l	$4A38CD2B
	dc.l	$660E11FC
	dc.l	$0002CD50
	dc.l	$11FC000B
	dc.l	$CD144E75
	dc.l	$61000092
	dc.l	$11FC000C
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$61000E8C
	dc.l	$700C6000
	dc.l	$038A4238
	dc.l	$CD500C38
	dc.l	$0004CD51
	dc.l	$67024E75
	dc.l	$61000E74
	dc.l	$4238CD51
	dc.l	$61000BC4
	dc.l	$31FC0000
	dc.l	$CD1411F8
	dc.l	$CD16CD1E
	dc.l	$4E756100
	dc.l	$F3206100
	dc.l	$F3606100
	dc.l	$F5DE6714
	dc.l	$13FC0001
	dc.l	$00FF0F1F
	dc.l	$6100F302
	dc.l	$6100F5FA
	dc.l	$60000018
	dc.l	$6100F342
	dc.l	$13FC0000
	dc.l	$00FF0F1F
	dc.l	$6100F2EA
	dc.l	$11FC0003
	dc.l	$CD506100
	dc.l	$09D66100
	dc.l	$0A0C31FC
	dc.l	$0000CD14
	dc.l	$11FC0001
	dc.l	$CD1E6100
	dc.l	$0E0E4E75
	dc.l	$6100061C
	dc.l	$0C380002
	dc.l	$CD16670E
	dc.l	$30290006
	dc.l	$61000D32
	dc.l	$6100F322
	dc.l	$60046100
	dc.l	$F2F86100
	dc.l	$F5A46602
	dc.l	$4E716100
	dc.l	$09966100
	dc.l	$09CC4E75
	dc.l	$610005EC
	dc.l	$30290006
	dc.l	$61000D0A
	dc.l	$610007EA
	dc.l	$6700004A
	dc.l	$45F8B500
	dc.l	$363C0014
	dc.l	$6100F25C
	dc.l	$6604363C
	dc.l	$00DC7800
	dc.l	$38290004
	dc.l	$C8FC0010
	dc.l	$0644002C
	dc.l	$323C000A
	dc.l	$70001018
	dc.l	$61000916
	dc.l	$0640C000
	dc.l	$35400002
	dc.l	$35430008
	dc.l	$3544000C
	dc.l	$D4FC0040
	dc.l	$504351C9
	dc.l	$FFE04E75
	dc.l	$363C0014
	dc.l	$6100F218
	dc.l	$6604363C
	dc.l	$00DC7800
	dc.l	$38290004
	dc.l	$C8FC0010
	dc.l	$0644002C
	dc.l	$45F8B500
	dc.l	$35430008
	dc.l	$3544000C
	dc.l	$516A000C
	dc.l	$357CE027
	dc.l	$0002D4FC
	dc.l	$00403543
	dc.l	$0008506A
	dc.l	$00083544
	dc.l	$000C516A
	dc.l	$000C357C
	dc.l	$E0290002
	dc.l	$D4FC0040
	dc.l	$35430008
	dc.l	$3544000C
	dc.l	$357CE028
	dc.l	$0002D4FC
	dc.l	$00403543
	dc.l	$0008506A
	dc.l	$00083544
	dc.l	$000C357C
	dc.l	$E02A0002
	dc.l	$D4FC0040
	dc.l	$D0FC0009
	dc.l	$06430018
	dc.l	$323C0001
	dc.l	$70001018
	dc.l	$6100086E
	dc.l	$0640C000
	dc.l	$35400002
	dc.l	$35430008
	dc.l	$3544000C
	dc.l	$D4FC0040
	dc.l	$504351C9
	dc.l	$FFE0323C
	dc.l	$0004357C
	dc.l	$00000002
	dc.l	$35430008
	dc.l	$3544000C
	dc.l	$D4FC0040
	dc.l	$504351C9
	dc.l	$FFEA4E75
	dc.l	$61000CD2
	dc.l	$610005E8
	dc.l	$31F8CD14
	dc.b	$CD,$1C
L_FF4AAC:
	move.w	#$5, d0
L_FF4AB0:
	bsr.w	L_FF4C8E
L_FF4AB4:
	move.b	#$1, $FFFFcd2c.w
L_FF4ABA:
	move.w	#$7, $FFFFcd14.w
L_FF4AC0:
	move.b	#$1, $FFFFcd40.w
L_FF4AC6:
	rts
L_FF4AC8:
	bsr.w	L_FF4F8C
L_FF4ACC:
	bgt.w	L_FF4B4E
L_FF4AD0:
	bmi.w	L_FF4B82
L_FF4AD4:
	bsr.w	L_FF4F7C
L_FF4AD8:
	andi.b	#$f, d0
L_FF4ADC:
	beq.b	L_FF4AF0
L_FF4ADE:
	movem.w	d0, -(a7)
L_FF4AE2:
	move.w	#$99, d0
L_FF4AE6:
	jsr	L_FF25C2.l
L_FF4AEC:
	movem.w	(a7)+, d0
L_FF4AF0:
	move.b	$FFFFcd40.w, d1
L_FF4AF4:
	btst	#$2, d0
L_FF4AF8:
	beq.b	L_FF4B00
L_FF4AFA:
	subq.b	#$1, d1
L_FF4AFC:
	bge.b	L_FF4B00
L_FF4AFE:
	clr.b	d1
L_FF4B00:
	btst	#$3, d0
L_FF4B04:
	beq.b	L_FF4B12
L_FF4B06:
	addq.b	#$1, d1
L_FF4B08:
	cmpi.b	#$1, d1
L_FF4B0C:
	ble.b	L_FF4B12
L_FF4B0E:
	move.b	#$1, d1
L_FF4B12:
	move.b	d1, $FFFFcd40.w
L_FF4B16:
	andi.w	#$ff, d1
L_FF4B1A:
	lea.l	$FFFFcd39.w, a0
L_FF4B1E:
	adda.w	d1, a0
L_FF4B20:
	move.b	(a0), d1
L_FF4B22:
	btst	#$1, d0
L_FF4B26:
	beq.b	L_FF4B34
L_FF4B28:
	subq.b	#$1, d1
L_FF4B2A:
	cmpi.b	#$30, d1
L_FF4B2E:
	bge.b	L_FF4B34
L_FF4B30:
	move.b	#$39, d1
L_FF4B34:
	btst	#$0, d0
L_FF4B38:
	beq.b	L_FF4B46
L_FF4B3A:
	addq.b	#$1, d1
L_FF4B3C:
	cmpi.b	#$39, d1
L_FF4B40:
	ble.b	L_FF4B46
L_FF4B42:
	move.b	#$30, d1
L_FF4B46:
	move.b	d1, (a0)
L_FF4B48:
	bsr.w	L_FF50D2
L_FF4B4C:
	rts
L_FF4B4E:
	bsr.w	L_FF50C0
L_FF4B52:
	bsr.w	L_FF501E
L_FF4B56:
	bsr.w	L_FF573C
L_FF4B5A:
	beq.b	L_FF4B74
L_FF4B5C:
	move.w	#$9e, d0
L_FF4B60:
	jsr	L_FF25C2.l
L_FF4B66:
	move.w	#$9, $FFFFcd14.w
L_FF4B6C:
	move.w	#$d, d0
L_FF4B70:
	bra.w	L_FF4C5C
L_FF4B74:
	move.b	#$1, $FFFFcd2a.w
L_FF4B7A:
	move.b	#$1, $FFFFcd2b.w
L_FF4B80:
	bra.b	L_FF4B92
L_FF4B82:
	bsr.w	L_FF50AC
L_FF4B86:
	move.b	#$0, $FFFFcd2a.w
L_FF4B8C:
	move.b	#$0, $FFFFcd2b.w
L_FF4B92:
	bsr.w	L_FF4CC2
L_FF4B96:
	move.w	$FFFFcd1c.w, $FFFFcd14.w
L_FF4B9C:
	rts
	dc.l	$610000E2
	dc.l	$11FC0001
	dc.l	$CD2C11FC
	dc.l	$0000CD2A
	dc.l	$11FC0000
	dc.l	$CD2B11FC
	dc.l	$0001CD27
	dc.l	$31F8CD14
	dc.l	$CD1A31FC
	dc.l	$0005CD14
	dc.b	$4E,$75
L_FF4BC8:
	bsr.w	L_FF4F8C
L_FF4BCC:
	bgt.b	L_FF4C38
L_FF4BCE:
	bmi.b	L_FF4C46
L_FF4BD0:
	bsr.w	L_FF4F7C
L_FF4BD4:
	btst	#$2, d0
L_FF4BD8:
	beq.b	L_FF4C00
L_FF4BDA:
	cmpi.b	#$1, $FFFFcd2a.w
L_FF4BE0:
	beq.b	L_FF4BF2
L_FF4BE2:
	move.w	#$9b, d0
L_FF4BE6:
	jsr	L_FF25C2.l
L_FF4BEC:
	move.b	#$1, $FFFFcd2a.w
L_FF4BF2:
	move.b	#$1, $FFFFcd26.w
L_FF4BF8:
	move.b	#$0, $FFFFcd27.w
L_FF4BFE:
	rts
L_FF4C00:
	btst	#$3, d0
L_FF4C04:
	beq.b	L_FF4C36
L_FF4C06:
	cmpi.b	#$0, $FFFFcd2a.w
L_FF4C0C:
	beq.b	L_FF4C1E
L_FF4C0E:
	move.w	#$9b, d0
L_FF4C12:
	jsr	L_FF25C2.l
L_FF4C18:
	move.b	#$0, $FFFFcd2a.w
L_FF4C1E:
	move.b	#$0, $FFFFcd26.w
L_FF4C24:
	move.b	#$1, $FFFFcd27.w
L_FF4C2A:
	move.w	#$9b, d0
L_FF4C2E:
	jsr	L_FF25C2.l
L_FF4C34:
	rts
L_FF4C36:
	rts
L_FF4C38:
	tst.b	$FFFFcd2a.w
L_FF4C3C:
	beq.b	L_FF4C46
L_FF4C3E:
	move.b	#$1, $FFFFcd2b.w
L_FF4C44:
	bra.b	L_FF4C50
L_FF4C46:
	move.b	#$0, $FFFFcd2b.w
L_FF4C4C:
	bra.b	L_FF4C50
	dc.b	$4E,$71
L_FF4C50:
	bsr.w	L_FF4CC2
L_FF4C54:
	move.w	$FFFFcd1a.w, $FFFFcd14.w
L_FF4C5A:
	rts
L_FF4C5C:
	bsr.w	L_FF4C8E
L_FF4C60:
	move.w	$FFFFcd14.w, $FFFFcd18.w
L_FF4C66:
	move.w	#$6, $FFFFcd14.w
L_FF4C6C:
	rts
L_FF4C6E:
	bsr.w	L_FF4F8C
L_FF4C72:
	bne.b	L_FF4C76
L_FF4C74:
	rts
L_FF4C76:
	bsr.w	L_FF4CC2
L_FF4C7A:
	move.w	$FFFFcd18.w, $FFFFcd14.w
L_FF4C80:
	rts
	dc.l	$6100000A
	dc.l	$31FC0200
	dc.l	$B4C84E75
L_FF4C8E:
	jsr	L_FF64DC.l
L_FF4C94:
	move.b	#$0, $FFFFcd26.w
L_FF4C9A:
	move.b	#$0, $FFFFcd27.w
L_FF4CA0:
	bsr.w	L_FF3BF8
L_FF4CA4:
	bne.b	L_FF4CB4
L_FF4CA6:
	move.w	#$70, $FFFFb4c8.w
L_FF4CAC:
	move.b	#$2, $FFFFcd29.w
L_FF4CB2:
	rts
L_FF4CB4:
	move.w	#$d0, $FFFFb4c8.w
L_FF4CBA:
	move.b	#$1, $FFFFcd29.w
L_FF4CC0:
	rts
L_FF4CC2:
	clr.b	$FFFFcd2c.w
L_FF4CC6:
	clr.b	$FFFFcd29.w
L_FF4CCA:
	move.w	#$200, $FFFFb4c8.w
L_FF4CD0:
	rts
L_FF4CD2:
	bsr.w	L_FF4F7C
L_FF4CD6:
	move.b	d0, d1
L_FF4CD8:
	andi.b	#$f, d1
L_FF4CDC:
	beq.w	L_FF4D14
L_FF4CE0:
	bsr.w	L_FF4D82
L_FF4CE4:
	btst	#$0, d1
L_FF4CE8:
	beq.b	L_FF4CF0
L_FF4CEA:
	move.b	$1(a0), d0
L_FF4CEE:
	bne.b	L_FF4D16
L_FF4CF0:
	btst	#$1, d1
L_FF4CF4:
	beq.b	L_FF4CFC
L_FF4CF6:
	move.b	$2(a0), d0
L_FF4CFA:
	bne.b	L_FF4D16
L_FF4CFC:
	btst	#$2, d1
L_FF4D00:
	beq.b	L_FF4D08
L_FF4D02:
	move.b	$3(a0), d0
L_FF4D06:
	bne.b	L_FF4D16
L_FF4D08:
	btst	#$3, d1
L_FF4D0C:
	beq.b	L_FF4D14
L_FF4D0E:
	move.b	$4(a0), d0
L_FF4D12:
	bne.b	L_FF4D16
L_FF4D14:
	rts
L_FF4D16:
	cmpi.b	#$5, d0
L_FF4D1A:
	bne.b	L_FF4D36
L_FF4D1C:
	bsr.w	L_FF3C00
L_FF4D20:
	beq.w	L_FF4D14
L_FF4D24:
	movem.w	d0, -(a7)
L_FF4D28:
	moveq	#$1, d0
L_FF4D2A:
	bsr.w	L_FF3BE8
L_FF4D2E:
	movem.w	(a7)+, d0
L_FF4D32:
	bra.w	L_FF4D6C
L_FF4D36:
	cmpi.b	#$6, d0
L_FF4D3A:
	bne.b	L_FF4D4E
L_FF4D3C:
	movem.w	d0, -(a7)
L_FF4D40:
	moveq	#$0, d0
L_FF4D42:
	bsr.w	L_FF3BE8
L_FF4D46:
	movem.w	(a7)+, d0
L_FF4D4A:
	bra.w	L_FF4D6C
L_FF4D4E:
	cmpi.b	#$2, d0
L_FF4D52:
	bne.b	L_FF4D6C
L_FF4D54:
	tst.b	$ff0f1f.l
L_FF4D5A:
	bne.w	L_FF4D14
L_FF4D5E:
	movem.w	d0, -(a7)
L_FF4D62:
	moveq	#$0, d0
L_FF4D64:
	bsr.w	L_FF3BE8
L_FF4D68:
	movem.w	(a7)+, d0
L_FF4D6C:
	cmp.b	$FFFFcd1e.w, d0
L_FF4D70:
	beq.b	L_FF4D80
L_FF4D72:
	move.b	d0, $FFFFcd1e.w
L_FF4D76:
	move.w	#$9b, d0
L_FF4D7A:
	jsr	L_FF25C2.l
L_FF4D80:
	rts
L_FF4D82:
	move.b	$FFFFcd1e.w, d0
L_FF4D86:
	cmp.b	(a0), d0
L_FF4D88:
	beq.b	L_FF4D90
L_FF4D8A:
	adda.w	#$5, a0
L_FF4D8E:
	bra.b	L_FF4D86
L_FF4D90:
	rts
	dc.l	$01000005
	dc.l	$06000100
	dc.l	$02050602
	dc.l	$01000506
	dc.l	$04000000
	dc.l	$00000300
	dc.l	$04000004
	dc.l	$03000000
	dc.l	$05000000
	dc.l	$06060000
	dc.l	$05000200
	dc.l	$00000606
	dc.l	$00000200
	dc.l	$05000000
	dc.l	$02020000
	dc.l	$05000500
	dc.l	$00000106
	dc.l	$00000100
	dc.l	$610006E6
	dc.l	$70004E75
	dc.l	$700170FF
	dc.l	$4E756100
	dc.l	$00CE6B16
	dc.l	$6EF84EB9
	dc.l	$00FF224A
	dc.l	$4EB900FF
	dc.l	$224A4EB9
	dc.l	$00FF224A
	dc.l	$60E46000
	dc.l	$06AA6100
	dc.l	$001E6B16
	dc.l	$6ED84EB9
	dc.l	$00FF224A
	dc.l	$4EB900FF
	dc.l	$224A4EB9
	dc.l	$00FF224A
	dc.l	$60C46000
	dc.b	$06,$8A
L_FF4E28:
	bsr.w	L_FF54B0
L_FF4E2C:
	bsr.w	L_FF4F6C
L_FF4E30:
	tst.w	$2(a1)
L_FF4E34:
	beq.w	L_FF4EB0
L_FF4E38:
	cmpi.w	#$1, $2(a1)
L_FF4E3E:
	bne.w	L_FF4E4A
L_FF4E42:
	tst.w	$10(a1)
L_FF4E46:
	beq.w	L_FF4EB0
L_FF4E4A:
	move.w	$6(a1), d0
L_FF4E4E:
	subq.w	#$1, d0
L_FF4E50:
	cmp.w	$10(a1), d0
L_FF4E54:
	bne.b	L_FF4E58
L_FF4E56:
	subq.w	#$1, d0
L_FF4E58:
	tst.w	d0
L_FF4E5A:
	bge.w	L_FF4E8C
L_FF4E5E:
	tst.w	$12(a1)
L_FF4E62:
	beq.w	L_FF4EB0
L_FF4E66:
	subq.w	#$1, $12(a1)
L_FF4E6A:
	movem.l	a1, -(a7)
L_FF4E6E:
	bsr.w	L_FF536E
L_FF4E72:
	movem.l	(a7)+, a1
L_FF4E76:
	move.w	#$fd, $6(a1)
L_FF4E7C:
	cmpi.w	#$fd, $10(a1)
L_FF4E82:
	bne.b	L_FF4E88
L_FF4E84:
	subq.w	#$1, $6(a1)
L_FF4E88:
	move.w	$6(a1), d0
L_FF4E8C:
	move.w	d0, $6(a1)
L_FF4E90:
	subq.w	#$1, $4(a1)
L_FF4E94:
	bge.b	L_FF4EA4
L_FF4E96:
	bsr.w	L_FF54C2
L_FF4E9A:
	clr.w	$4(a1)
L_FF4E9E:
	bsr.w	L_FF5558
L_FF4EA2:
	bra.b	L_FF4EAC
L_FF4EA4:
	bsr.w	L_FF54C2
L_FF4EA8:
	moveq	#$0, d0
L_FF4EAA:
	rts
L_FF4EAC:
	moveq	#$1, d0
L_FF4EAE:
	rts
L_FF4EB0:
	bsr.w	L_FF54C2
L_FF4EB4:
	moveq	#$ff, d0
L_FF4EB6:
	rts
L_FF4EB8:
	bsr.w	L_FF54B0
L_FF4EBC:
	bsr.w	L_FF4F6C
L_FF4EC0:
	tst.w	$2(a1)
L_FF4EC4:
	beq.w	L_FF4F64
L_FF4EC8:
	cmpi.w	#$1, $2(a1)
L_FF4ECE:
	bne.w	L_FF4EDA
L_FF4ED2:
	tst.w	$10(a1)
L_FF4ED6:
	beq.w	L_FF4F64
L_FF4EDA:
	move.w	$6(a1), d0
L_FF4EDE:
	addq.w	#$1, d0
L_FF4EE0:
	cmp.w	$10(a1), d0
L_FF4EE4:
	bne.b	L_FF4EE8
L_FF4EE6:
	addq.w	#$1, d0
L_FF4EE8:
	cmp.w	$8(a1), d0
L_FF4EEC:
	bge.w	L_FF4F64
L_FF4EF0:
	cmpi.w	#$fe, d0
L_FF4EF4:
	blt.w	L_FF4F38
L_FF4EF8:
	move.w	$12(a1), d1
L_FF4EFC:
	addq.w	#$1, d1
L_FF4EFE:
	cmp.w	$14(a1), d1
L_FF4F02:
	bgt.w	L_FF4F30
L_FF4F06:
	addq.w	#$1, $12(a1)
L_FF4F0A:
	movem.l	a1, -(a7)
L_FF4F0E:
	bsr.w	L_FF536E
L_FF4F12:
	movem.l	(a7)+, a1
L_FF4F16:
	move.w	#$0, $6(a1)
L_FF4F1C:
	cmpi.w	#$0, $10(a1)
L_FF4F22:
	bne.b	L_FF4F28
L_FF4F24:
	addq.w	#$1, $6(a1)
L_FF4F28:
	move.w	$6(a1), d0
L_FF4F2C:
	bra.w	L_FF4F38
L_FF4F30:
	cmp.w	$8(a1), d0
L_FF4F34:
	bge.w	L_FF4F64
L_FF4F38:
	move.w	d0, $6(a1)
L_FF4F3C:
	addq.w	#$1, $4(a1)
L_FF4F40:
	cmpi.w	#$a, $4(a1)
L_FF4F46:
	blt.b	L_FF4F58
L_FF4F48:
	bsr.w	L_FF54C2
L_FF4F4C:
	move.w	#$9, $4(a1)
L_FF4F52:
	bsr.w	L_FF54F8
L_FF4F56:
	bra.b	L_FF4F60
L_FF4F58:
	bsr.w	L_FF54C2
L_FF4F5C:
	moveq	#$0, d0
L_FF4F5E:
	rts
L_FF4F60:
	moveq	#$1, d0
L_FF4F62:
	rts
L_FF4F64:
	bsr.w	L_FF54C2
L_FF4F68:
	moveq	#$ff, d0
L_FF4F6A:
	rts
L_FF4F6C:
	lea.l	$FFFFcfa0.w, a1
L_FF4F70:
	bsr.w	L_FF3BF8
L_FF4F74:
	beq.b	L_FF4F7A
L_FF4F76:
	lea.l	$FFFFdfd0.w, a1
L_FF4F7A:
	rts
L_FF4F7C:
	tst.b	$FFFFcd1f.w
L_FF4F80:
	bne.b	L_FF4F88
L_FF4F82:
	move.b	$FFFFcd52.w, d0
L_FF4F86:
	rts
L_FF4F88:
	moveq	#$0, d0
L_FF4F8A:
	rts
L_FF4F8C:
	movem.l	d0, -(a7)
L_FF4F90:
	cmpi.b	#$3, $FFFFcd1f.w
L_FF4F96:
	beq.b	L_FF4FBA
L_FF4F98:
	tst.b	$FFFFcd1f.w
L_FF4F9C:
	bne.b	L_FF4FB6
L_FF4F9E:
	move.b	$a1201f.l, d0
L_FF4FA4:
	andi.b	#$60, d0
L_FF4FA8:
	bne.b	L_FF4FC2
L_FF4FAA:
	move.b	$a1201f.l, d0
L_FF4FB0:
	andi.b	#$10, d0
L_FF4FB4:
	bne.b	L_FF4FE8
L_FF4FB6:
	moveq	#$0, d0
L_FF4FB8:
	bra.b	L_FF4FF4
L_FF4FBA:
	clr.b	$FFFFcd1f.w
L_FF4FBE:
	moveq	#$1, d0
L_FF4FC0:
	bra.b	L_FF4FF4
L_FF4FC2:
	bsr.w	L_FF4FFA
L_FF4FC6:
	bne.b	L_FF4FDA
L_FF4FC8:
	move.w	#$92, d0
L_FF4FCC:
	jsr	L_FF25C2.l
L_FF4FD2:
	move.b	#$2, $FFFFcd1f.w
L_FF4FD8:
	bra.b	L_FF4FB6
L_FF4FDA:
	move.w	#$ae, d0
L_FF4FDE:
	jsr	L_FF25C2.l
L_FF4FE4:
	moveq	#$1, d0
L_FF4FE6:
	bra.b	L_FF4FF4
L_FF4FE8:
	move.w	#$ad, d0
L_FF4FEC:
	jsr	L_FF25C2.l
L_FF4FF2:
	moveq	#$ff, d0
L_FF4FF4:
	movem.l	(a7)+, d0
L_FF4FF8:
	rts
L_FF4FFA:
	move.b	$FFFFcd1e.w, d0
L_FF4FFE:
	cmpi.b	#$1, d0
L_FF5002:
	beq.b	L_FF501C
L_FF5004:
	cmpi.b	#$3, d0
L_FF5008:
	beq.b	L_FF501C
L_FF500A:
	cmpi.b	#$4, d0
L_FF500E:
	beq.b	L_FF501C
L_FF5010:
	move.w	$FFFFcd14.w, d0
L_FF5014:
	cmpi.b	#$5, d0
L_FF5018:
	beq.b	L_FF501C
L_FF501A:
	rts
L_FF501C:
	rts
L_FF501E:
	cmpi.b	#$2, $FFFFcd17.w
L_FF5024:
	beq.b	L_FF5048
L_FF5026:
	lea.l	$FFFFcd60.w, a0
L_FF502A:
	bsr.w	L_FF5176
L_FF502E:
	beq.b	L_FF503C
L_FF5030:
	lea.l	$FFFFcd60.w, a0
L_FF5034:
	lea.l	$FFFFcd70.w, a1
L_FF5038:
	bra.w	L_FF507E
L_FF503C:
	lea.l	$FFFFcd30.w, a0
L_FF5040:
	lea.l	$FFFFcd70.w, a1
L_FF5044:
	bra.w	L_FF507E
L_FF5048:
	lea.l	$ff3c7a.l, a0
L_FF504E:
	lea.l	$FFFFcd70.w, a1
L_FF5052:
	bra.w	L_FF507E
L_FF5056:
	bsr.w	L_FF5758
L_FF505A:
	cmpi.b	#$2, $FFFFcd16.w
L_FF5060:
	beq.b	L_FF5074
L_FF5062:
	bsr.w	L_FF4F6C
L_FF5066:
	move.w	$6(a1), d0
L_FF506A:
	bsr.w	L_FF5692
L_FF506E:
	lea.l	$FFFFcd60.w, a1
L_FF5072:
	bra.b	L_FF507E
L_FF5074:
	lea.l	$ff3c7a.l, a0
L_FF507A:
	lea.l	$FFFFcd60.w, a1
L_FF507E:
	move.l	(a0)+, (a1)+
L_FF5080:
	move.l	(a0)+, (a1)+
L_FF5082:
	move.l	(a0)+, (a1)+
L_FF5084:
	move.b	#$0, -$1(a1)
L_FF508A:
	rts
	dc.l	$61000088
	dc.l	$323C4000
	dc.l	$41F900FF
	dc.l	$50A06100
	dc.l	$00FE4E75
	dc.l	$534F4E49
	dc.l	$4343445F
	dc.l	$5F303000
L_FF50AC:
	bsr.w	L_FF5116
L_FF50B0:
	move.w	#$4000, d1
L_FF50B4:
	lea.l	$ff51d2.l, a0
L_FF50BA:
	bsr.w	L_FF519A
L_FF50BE:
	rts
L_FF50C0:
	bsr.w	L_FF5116
L_FF50C4:
	move.w	#$4000, d1
L_FF50C8:
	lea.l	$FFFFcd30.w, a0
L_FF50CC:
	bsr.w	L_FF519A
L_FF50D0:
	rts
L_FF50D2:
	bsr.w	L_FF5116
L_FF50D6:
	bsr.w	L_FF527C
L_FF50DA:
	addi.l	#$860000, d0
L_FF50E0:
	move.l	d0, $c00004.l
L_FF50E6:
	lea.l	$c00000.l, a1
L_FF50EC:
	lea.l	$FFFFcd39.w, a0
L_FF50F0:
	moveq	#$0, d2
L_FF50F2:
	moveq	#$0, d0
L_FF50F4:
	move.b	(a0)+, d0
L_FF50F6:
	bsr.w	L_FF52D2
L_FF50FA:
	cmp.b	$FFFFcd40.w, d2
L_FF50FE:
	beq.b	L_FF5106
L_FF5100:
	addi.w	#$4000, d0
L_FF5104:
	bra.b	L_FF510A
L_FF5106:
	addi.w	#$0, d0
L_FF510A:
	move.w	d0, (a1)
L_FF510C:
	addq.w	#$1, d2
L_FF510E:
	cmpi.w	#$3, d2
L_FF5112:
	bne.b	L_FF50F2
L_FF5114:
	rts
L_FF5116:
	bsr.w	L_FF4F6C
L_FF511A:
	bsr.w	L_FF5128
L_FF511E:
	add.w	d0, d0
L_FF5120:
	addq.w	#$4, d0
L_FF5122:
	add.b	$a(a1), d0
L_FF5126:
	rts
L_FF5128:
	moveq	#$0, d0
L_FF512A:
	move.w	$4(a1), d0
L_FF512E:
	bne.b	L_FF5146
L_FF5130:
	cmpi.w	#$ffff, $10(a1)
L_FF5136:
	beq.b	L_FF5140
L_FF5138:
	cmpi.w	#$2, $2(a1)
L_FF513E:
	blt.b	L_FF5148
L_FF5140:
	tst.w	$2(a1)
L_FF5144:
	beq.b	L_FF5148
L_FF5146:
	addq.w	#$1, d0
L_FF5148:
	rts
L_FF514A:
	movem.l	d0/a1, -(a7)
L_FF514E:
	lea.l	$ff3c7a.l, a1
L_FF5154:
	move.l	(a1)+, d0
L_FF5156:
	cmp.l	(a0), d0
L_FF5158:
	bne.b	L_FF5170
L_FF515A:
	move.l	(a1)+, d0
L_FF515C:
	cmp.l	$4(a0), d0
L_FF5160:
	bne.b	L_FF5170
L_FF5162:
	move.w	(a1)+, d0
L_FF5164:
	cmp.w	$8(a0), d0
L_FF5168:
	bne.b	L_FF5170
L_FF516A:
	move.b	(a1)+, d0
L_FF516C:
	cmp.b	$a(a0), d0
L_FF5170:
	movem.l	(a7)+, d0/a1
L_FF5174:
	rts
L_FF5176:
	movem.l	d0/a1, -(a7)
L_FF517A:
	lea.l	$ff3c7a.l, a1
L_FF5180:
	move.l	(a1)+, d0
L_FF5182:
	cmp.l	(a0), d0
L_FF5184:
	bne.b	L_FF5194
L_FF5186:
	move.l	(a1)+, d0
L_FF5188:
	cmp.l	$4(a0), d0
L_FF518C:
	bne.b	L_FF5194
L_FF518E:
	move.b	(a1)+, d0
L_FF5190:
	cmp.b	$8(a0), d0
L_FF5194:
	movem.l	(a7)+, d0/a1
L_FF5198:
	rts
L_FF519A:
	movem.l	d0-d2, -(a7)
L_FF519E:
	bsr.b	L_FF5176
L_FF51A0:
	bne.b	L_FF51AA
L_FF51A2:
	bsr.w	L_FF51DE
L_FF51A6:
	bra.w	L_FF51CC
L_FF51AA:
	movem.l	d0-d1/a0, -(a7)
L_FF51AE:
	move.w	#$4000, d1
L_FF51B2:
	lea.l	$ff51d2(pc), a0
L_FF51B6:
	bsr.w	L_FF527C
L_FF51BA:
	bsr.w	L_FF52A8
L_FF51BE:
	movem.l	(a7)+, d0-d1/a0
L_FF51C2:
	addq.b	#$1, d0
L_FF51C4:
	bsr.w	L_FF527C
L_FF51C8:
	bsr.w	L_FF52A8
L_FF51CC:
	movem.l	(a7)+, d0-d2
L_FF51D0:
	rts
	dc.l	$20202020
	dc.l	$20202020
	dc.l	$20202000
L_FF51DE:
	movem.l	d0-d1/a0-a1, -(a7)
L_FF51E2:
	moveq	#$1, d1
L_FF51E4:
	lea.l	$ff5273.l, a1
L_FF51EA:
	adda.w	#$9, a0
L_FF51EE:
	move.b	(a0)+, d0
L_FF51F0:
	bsr.w	L_FF52D2
L_FF51F4:
	move.b	d0, (a1)+
L_FF51F6:
	dbra	d1, L_FF51EE
L_FF51FA:
	movem.l	(a7)+, d0-d1/a0-a1
L_FF51FE:
	movem.l	d0-d1, -(a7)
L_FF5202:
	lea.l	$ff5264.l, a0
L_FF5208:
	bsr.w	L_FF527C
L_FF520C:
	bsr.w	L_FF5226
L_FF5210:
	movem.l	(a7)+, d0-d1
L_FF5214:
	addq.b	#$1, d0
L_FF5216:
	lea.l	$ff5270.l, a0
L_FF521C:
	bsr.w	L_FF527C
L_FF5220:
	bsr.w	L_FF5226
L_FF5224:
	rts
L_FF5226:
	movem.l	d0-d1/a0-a1, -(a7)
L_FF522A:
	move.l	d0, $c00004.l
L_FF5230:
	lea.l	$c00000.l, a1
L_FF5236:
	move.w	#$a, d2
L_FF523A:
	moveq	#$0, d0
L_FF523C:
	move.b	(a0)+, d0
L_FF523E:
	cmpi.w	#$9, d2
L_FF5242:
	blt.b	L_FF524A
L_FF5244:
	addi.w	#$6000, d0
L_FF5248:
	bra.b	L_FF5258
L_FF524A:
	cmpi.b	#$26, d0
L_FF524E:
	beq.b	L_FF5254
L_FF5250:
	add.w	d1, d0
L_FF5252:
	bra.b	L_FF5258
L_FF5254:
	addi.w	#$4000, d0
L_FF5258:
	move.w	d0, (a1)
L_FF525A:
	dbra	d2, L_FF523A
L_FF525E:
	movem.l	(a7)+, d0-d1/a0-a1
L_FF5262:
	rts
	dc.l	$27292626
	dc.l	$26262626
	dc.l	$26262600
	dc.l	$282A2626
	dc.l	$26262626
	dc.l	$26262600
L_FF527C:
	andi.l	#$ff, d0
L_FF5282:
	cmpi.b	#$20, d0
L_FF5286:
	blt.b	L_FF528C
L_FF5288:
	subi.b	#$20, d0
L_FF528C:
	mulu.w	#$80, d0
L_FF5290:
	swap	d0
L_FF5292:
	bsr.w	L_FF3BF8
L_FF5296:
	beq.b	L_FF52A0
L_FF5298:
	addi.l	#$60040003, d0
L_FF529E:
	rts
L_FF52A0:
	addi.l	#$60360003, d0
L_FF52A6:
	rts
L_FF52A8:
	movem.l	d0-d1/a0-a1, -(a7)
L_FF52AC:
	move.l	d0, $c00004.l
L_FF52B2:
	lea.l	$c00000.l, a1
L_FF52B8:
	moveq	#$0, d0
L_FF52BA:
	move.b	(a0)+, d0
L_FF52BC:
	beq.w	L_FF52CC
L_FF52C0:
	bsr.w	L_FF52D2
L_FF52C4:
	add.w	d1, d0
L_FF52C6:
	move.w	d0, (a1)
L_FF52C8:
	bra.w	L_FF52B8
L_FF52CC:
	movem.l	(a7)+, d0-d1/a0-a1
L_FF52D0:
	rts
L_FF52D2:
	cmpi.b	#$41, d0
L_FF52D6:
	blt.b	L_FF52E4
L_FF52D8:
	cmpi.b	#$5a, d0
L_FF52DC:
	bgt.b	L_FF52E4
L_FF52DE:
	subi.b	#$40, d0
L_FF52E2:
	rts
L_FF52E4:
	cmpi.b	#$30, d0
L_FF52E8:
	blt.b	L_FF52F6
L_FF52EA:
	cmpi.b	#$39, d0
L_FF52EE:
	bgt.b	L_FF52F6
L_FF52F0:
	subi.b	#$15, d0
L_FF52F4:
	rts
L_FF52F6:
	cmpi.b	#$5f, d0
L_FF52FA:
	bne.b	L_FF5302
L_FF52FC:
	subi.b	#$3a, d0
L_FF5300:
	rts
L_FF5302:
	cmpi.b	#$20, d0
L_FF5306:
	move.b	#$26, d0
L_FF530A:
	rts
L_FF530C:
	bsr.w	L_FF3BF8
L_FF5310:
	beq.b	L_FF5318
L_FF5312:
	bsr.w	L_FF3C00
L_FF5316:
	beq.b	L_FF5344
L_FF5318:
	bsr.w	L_FF4F6C
L_FF531C:
	clr.w	$2(a1)
L_FF5320:
	clr.w	$4(a1)
L_FF5324:
	clr.w	$6(a1)
L_FF5328:
	clr.w	$8(a1)
L_FF532C:
	clr.b	$a(a1)
L_FF5330:
	clr.b	$c(a1)
L_FF5334:
	clr.w	$12(a1)
L_FF5338:
	bsr.w	L_FF5652
L_FF533C:
	bsr.w	L_FF536E
L_FF5340:
	bsr.w	L_FF5426
L_FF5344:
	rts
L_FF5346:
	moveq	#$0, d0
L_FF5348:
	bsr.w	L_FF3BE8
L_FF534C:
	lea.l	$ff3c7a.l, a0
L_FF5352:
	bsr.w	L_FF3C86
L_FF5356:
	bsr.w	L_FF3EAE
L_FF535A:
	bne.b	L_FF5364
L_FF535C:
	clr.b	$ff0f1f.l
L_FF5362:
	rts
L_FF5364:
	move.b	#$1, $ff0f1f.l
L_FF536C:
	rts
L_FF536E:
	bsr.w	L_FF4F6C
L_FF5372:
	moveq	#$0, d0
L_FF5374:
	move.w	$12(a1), d0
L_FF5378:
	mulu.w	#$fe, d0
L_FF537C:
	move.w	$2(a1), d1
L_FF5380:
	sub.w	d0, d1
L_FF5382:
	cmpi.w	#$100, d1
L_FF5386:
	ble.b	L_FF538C
L_FF5388:
	move.w	#$100, d1
L_FF538C:
	move.w	d1, $8(a1)
L_FF5390:
	swap	d0
L_FF5392:
	move.w	d1, d0
L_FF5394:
	movem.l	a1, -(a7)
L_FF5398:
	bsr.w	L_FF3E6A
L_FF539C:
	movem.l	(a7)+, a1
L_FF53A0:
	movea.l	#$200044, a0
L_FF53A6:
	movea.l	a1, a2
L_FF53A8:
	adda.w	#$30, a2
L_FF53AC:
	move.w	$8(a1), d0
L_FF53B0:
	subq.w	#$1, d0
L_FF53B2:
	bmi.b	L_FF53BE
L_FF53B4:
	move.l	(a0)+, (a2)+
L_FF53B6:
	move.l	(a0)+, (a2)+
L_FF53B8:
	move.l	(a0)+, (a2)+
L_FF53BA:
	move.l	(a0)+, (a2)+
L_FF53BC:
	bra.b	L_FF53B0
L_FF53BE:
	move.w	#$100, d0
L_FF53C2:
	sub.w	$8(a1), d0
L_FF53C6:
	moveq	#$0, d1
L_FF53C8:
	subq.w	#$1, d0
L_FF53CA:
	bmi.b	L_FF53D6
L_FF53CC:
	move.l	d1, (a2)+
L_FF53CE:
	move.l	d1, (a2)+
L_FF53D0:
	move.l	d1, (a2)+
L_FF53D2:
	move.l	d1, (a2)+
L_FF53D4:
	bra.b	L_FF53C8
L_FF53D6:
	bsr.w	L_FF53E8
L_FF53DA:
	tst.w	$10(a1)
L_FF53DE:
	bne.b	L_FF53E6
L_FF53E0:
	move.w	#$1, $6(a1)
L_FF53E6:
	rts
L_FF53E8:
	bsr.w	L_FF3BF8
L_FF53EC:
	bne.w	L_FF5418
L_FF53F0:
	bsr.w	L_FF4F6C
L_FF53F4:
	tst.w	$8(a1)
L_FF53F8:
	beq.b	L_FF5418
L_FF53FA:
	movea.l	a1, a0
L_FF53FC:
	adda.w	#$30, a0
L_FF5400:
	moveq	#$0, d0
L_FF5402:
	bsr.w	L_FF514A
L_FF5406:
	beq.b	L_FF5420
L_FF5408:
	adda.w	#$10, a0
L_FF540C:
	addq.w	#$1, d0
L_FF540E:
	cmp.w	$8(a1), d0
L_FF5412:
	bge.w	L_FF5418
L_FF5416:
	bra.b	L_FF5402
L_FF5418:
	move.w	#$ffff, $10(a1)
L_FF541E:
	rts
L_FF5420:
	move.w	d0, $10(a1)
L_FF5424:
	rts
L_FF5426:
	bsr.w	L_FF4F6C
L_FF542A:
	clr.w	$c(a1)
L_FF542E:
	clr.b	$a(a1)
L_FF5432:
	moveq	#$0, d0
L_FF5434:
	bsr.w	L_FF5692
L_FF5438:
	movea.l	a0, a2
L_FF543A:
	move.w	#$4000, d1
L_FF543E:
	moveq	#$0, d3
L_FF5440:
	move.w	#$4, d0
L_FF5444:
	move.w	$8(a1), d4
L_FF5448:
	moveq	#$0, d5
L_FF544A:
	cmp.w	$10(a1), d5
L_FF544E:
	bne.b	L_FF5458
L_FF5450:
	addq.w	#$1, d5
L_FF5452:
	adda.w	#$10, a2
L_FF5456:
	bra.b	L_FF544A
L_FF5458:
	cmp.w	d5, d4
L_FF545A:
	ble.b	L_FF5466
L_FF545C:
	move.b	#$0, $b(a2)
L_FF5462:
	movea.l	a2, a0
L_FF5464:
	bra.b	L_FF546A
L_FF5466:
	lea.l	$ff5488(pc), a0
L_FF546A:
	movem.l	d0-d5/a0, -(a7)
L_FF546E:
	bsr.w	L_FF519A
L_FF5472:
	movem.l	(a7)+, d0-d5/a0
L_FF5476:
	addq.w	#$2, d0
L_FF5478:
	adda.w	#$10, a2
L_FF547C:
	addq.w	#$1, d5
L_FF547E:
	addq.w	#$1, d3
L_FF5480:
	cmpi.b	#$c, d3
L_FF5484:
	bne.b	L_FF544A
L_FF5486:
	rts
	dc.l	$20202020
	dc.l	$20202020
	dc.l	$20202000
	dc.l	$48E70040
	dc.l	$323C4000
	dc.l	$6100FACE
	dc.l	$41F900FF
	dc.l	$54886100
	dc.l	$003E4CDF
	dc.l	$02004E75
L_FF54B0:
	movem.l	a1, -(a7)
L_FF54B4:
	move.w	#$4000, d1
L_FF54B8:
	bsr.w	L_FF54D4
L_FF54BC:
	movem.l	(a7)+, a1
L_FF54C0:
	rts
L_FF54C2:
	movem.l	a1, -(a7)
L_FF54C6:
	move.w	#$0, d1
L_FF54CA:
	bsr.w	L_FF54D4
L_FF54CE:
	movem.l	(a7)+, a1
L_FF54D2:
	rts
L_FF54D4:
	bsr.w	L_FF4F6C
L_FF54D8:
	move.w	$6(a1), d0
L_FF54DC:
	bsr.w	L_FF5692
L_FF54E0:
	move.b	#$0, $b(a0)
L_FF54E6:
	moveq	#$0, d0
L_FF54E8:
	move.w	$4(a1), d0
L_FF54EC:
	add.w	d0, d0
L_FF54EE:
	addq.w	#$4, d0
L_FF54F0:
	add.b	$a(a1), d0
L_FF54F4:
	bra.w	L_FF519A
L_FF54F8:
	bsr.w	L_FF4F6C
L_FF54FC:
	addq.b	#$2, $a(a1)
L_FF5500:
	cmpi.b	#$20, $a(a1)
L_FF5506:
	blt.b	L_FF550C
L_FF5508:
	clr.b	$a(a1)
L_FF550C:
	move.l	$c(a1), d0
L_FF5510:
	addi.l	#$100000, d0
L_FF5516:
	move.l	#$20000, d1
L_FF551C:
	add.l	d1, $c(a1)
L_FF5520:
	cmp.l	$c(a1), d0
L_FF5524:
	ble.b	L_FF5534
L_FF5526:
	movem.l	d0-d7/a0-a6, -(a7)
L_FF552A:
	bsr.w	L_FF224A
L_FF552E:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF5532:
	bra.b	L_FF551C
L_FF5534:
	move.l	d0, $c(a1)
L_FF5538:
	cmpi.w	#$100, $c(a1)
L_FF553E:
	blt.b	L_FF5546
L_FF5540:
	subi.w	#$100, $c(a1)
L_FF5546:
	bsr.w	L_FF55AE
L_FF554A:
	movem.l	d0-d7/a0-a6, -(a7)
L_FF554E:
	bsr.w	L_FF224A
L_FF5552:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF5556:
	rts
L_FF5558:
	bsr.w	L_FF4F6C
L_FF555C:
	subq.b	#$2, $a(a1)
L_FF5560:
	bge.b	L_FF5568
L_FF5562:
	addi.b	#$20, $a(a1)
L_FF5568:
	move.l	$c(a1), d0
L_FF556C:
	subi.l	#$100000, d0
L_FF5572:
	move.l	#$20000, d1
L_FF5578:
	sub.l	d1, $c(a1)
L_FF557C:
	cmp.l	$c(a1), d0
L_FF5580:
	bge.b	L_FF5590
L_FF5582:
	movem.l	d0-d7/a0-a6, -(a7)
L_FF5586:
	bsr.w	L_FF224A
L_FF558A:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF558E:
	bra.b	L_FF5578
L_FF5590:
	move.l	d0, $c(a1)
L_FF5594:
	bpl.b	L_FF559C
L_FF5596:
	addi.w	#$100, $c(a1)
L_FF559C:
	bsr.w	L_FF55F8
L_FF55A0:
	movem.l	d0-d7/a0-a6, -(a7)
L_FF55A4:
	bsr.w	L_FF224A
L_FF55A8:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF55AC:
	rts
L_FF55AE:
	move.w	$6(a1), d1
L_FF55B2:
	addq.w	#$2, d1
L_FF55B4:
	cmpi.w	#$100, d1
L_FF55B8:
	bge.b	L_FF55F6
L_FF55BA:
	move.w	$6(a1), d1
L_FF55BE:
	addq.w	#$2, d1
L_FF55C0:
	tst.w	$10(a1)
L_FF55C4:
	bmi.b	L_FF55CE
L_FF55C6:
	cmp.w	$10(a1), d1
L_FF55CA:
	blt.b	L_FF55CE
L_FF55CC:
	addq.w	#$1, d1
L_FF55CE:
	cmp.w	$8(a1), d1
L_FF55D2:
	bge.b	L_FF55E2
L_FF55D4:
	move.w	d1, d0
L_FF55D6:
	bsr.w	L_FF5692
L_FF55DA:
	move.b	#$0, $b(a0)
L_FF55E0:
	bra.b	L_FF55E6
L_FF55E2:
	lea.l	$ff5488(pc), a0
L_FF55E6:
	move.b	#$1a, d0
L_FF55EA:
	add.b	$a(a1), d0
L_FF55EE:
	move.w	#$4000, d1
L_FF55F2:
	bsr.w	L_FF519A
L_FF55F6:
	rts
L_FF55F8:
	move.w	$6(a1), d0
L_FF55FC:
	subq.w	#$1, d0
L_FF55FE:
	bmi.w	L_FF561C
L_FF5602:
	bsr.w	L_FF5692
L_FF5606:
	move.b	#$0, $b(a0)
L_FF560C:
	move.b	#$2, d0
L_FF5610:
	add.b	$a(a1), d0
L_FF5614:
	move.w	#$4000, d1
L_FF5618:
	bsr.w	L_FF519A
L_FF561C:
	rts
L_FF561E:
	bsr.w	L_FF5772
L_FF5622:
	bsr.w	L_FF5652
L_FF5626:
	bsr.w	L_FF4F6C
L_FF562A:
	move.w	$14(a1), $12(a1)
L_FF5630:
	bsr.w	L_FF536E
L_FF5634:
	move.w	$8(a1), d0
L_FF5638:
	subq.w	#$2, d0
L_FF563A:
	bge.b	L_FF563E
L_FF563C:
	moveq	#$0, d0
L_FF563E:
	cmp.w	$10(a1), d0
L_FF5642:
	bne.b	L_FF564C
L_FF5644:
	subq.w	#$1, d0
L_FF5646:
	bge.b	L_FF564C
L_FF5648:
	move.w	#$1, d0
L_FF564C:
	move.w	d0, $6(a1)
L_FF5650:
	rts
L_FF5652:
	bsr.w	L_FF4F6C
L_FF5656:
	movem.l	a1, -(a7)
L_FF565A:
	bsr.w	L_FF3E9C
L_FF565E:
	movem.l	(a7)+, a1
L_FF5662:
	move.w	$200022.l, $0(a1)
L_FF566A:
	move.w	$200024.l, $2(a1)
L_FF5672:
	moveq	#$0, d0
L_FF5674:
	move.w	$2(a1), d0
L_FF5678:
	divu.w	#$100, d0
L_FF567C:
	move.w	d0, $14(a1)
L_FF5680:
	swap	d0
L_FF5682:
	tst.w	d0
L_FF5684:
	bne.b	L_FF5690
L_FF5686:
	tst.w	$14(a1)
L_FF568A:
	bne.b	L_FF5690
L_FF568C:
	subq.w	#$1, $14(a1)
L_FF5690:
	rts
L_FF5692:
	movem.l	d0, -(a7)
L_FF5696:
	andi.l	#$ffff, d0
L_FF569C:
	mulu.w	#$10, d0
L_FF56A0:
	movem.l	a1, -(a7)
L_FF56A4:
	bsr.w	L_FF4F6C
L_FF56A8:
	movea.l	a1, a0
L_FF56AA:
	adda.w	#$30, a0
L_FF56AE:
	movem.l	(a7)+, a1
L_FF56B2:
	adda.w	d0, a0
L_FF56B4:
	movem.l	(a7)+, d0
L_FF56B8:
	rts
L_FF56BA:
	bsr.w	L_FF56F8
L_FF56BE:
	bne.b	L_FF56D2
L_FF56C0:
	bsr.w	L_FF56D4
L_FF56C4:
	bne.b	L_FF56D0
L_FF56C6:
	bsr.w	L_FF56E6
L_FF56CA:
	bne.b	L_FF56D0
L_FF56CC:
	moveq	#$0, d0
L_FF56CE:
	rts
L_FF56D0:
	moveq	#$ff, d0
L_FF56D2:
	rts
L_FF56D4:
	bsr.w	L_FF5758
L_FF56D8:
	lea.l	$FFFFcd60.w, a0
L_FF56DC:
	bsr.w	L_FF3C86
L_FF56E0:
	bsr.w	L_FF3EC0
L_FF56E4:
	rts
L_FF56E6:
	bsr.w	L_FF5772
L_FF56EA:
	lea.l	$FFFFcd70.w, a0
L_FF56EE:
	bsr.w	L_FF3C86
L_FF56F2:
	bsr.w	L_FF3EE4
L_FF56F6:
	rts
L_FF56F8:
	bsr.w	L_FF5758
L_FF56FC:
	lea.l	$FFFFcd60.w, a0
L_FF5700:
	bsr.w	L_FF3C86
L_FF5704:
	bsr.w	L_FF3EAE
L_FF5708:
	bne.w	L_FF5738
L_FF570C:
	move.w	$200022.l, d0
L_FF5712:
	move.w	d0, $20002a.l
L_FF5718:
	move.b	$200025.l, $200029.l
L_FF5722:
	bsr.w	L_FF5772
L_FF5726:
	bsr.w	L_FF4F6C
L_FF572A:
	cmp.w	$0(a1), d0
L_FF572E:
	bgt.b	L_FF5734
L_FF5730:
	moveq	#$0, d0
L_FF5732:
	rts
L_FF5734:
	moveq	#$1, d0
L_FF5736:
	rts
L_FF5738:
	moveq	#$ff, d0
L_FF573A:
	rts
L_FF573C:
	bsr.w	L_FF5772
L_FF5740:
	lea.l	$FFFFcd70.w, a0
L_FF5744:
	bsr.w	L_FF3C86
L_FF5748:
	bsr.w	L_FF3EAE
L_FF574C:
	beq.w	L_FF5754
L_FF5750:
	moveq	#$0, d0
L_FF5752:
	rts
L_FF5754:
	moveq	#$ff, d0
L_FF5756:
	rts
L_FF5758:
	movem.l	d0, -(a7)
L_FF575C:
	moveq	#$1, d0
L_FF575E:
	cmpi.b	#$5, $FFFFcd16.w
L_FF5764:
	beq.b	L_FF5768
L_FF5766:
	moveq	#$0, d0
L_FF5768:
	bsr.w	L_FF3BE8
L_FF576C:
	movem.l	(a7)+, d0
L_FF5770:
	rts
L_FF5772:
	movem.l	d0, -(a7)
L_FF5776:
	moveq	#$1, d0
L_FF5778:
	cmpi.b	#$5, $FFFFcd17.w
L_FF577E:
	beq.b	L_FF5782
L_FF5780:
	moveq	#$0, d0
L_FF5782:
	bsr.w	L_FF3BE8
L_FF5786:
	movem.l	(a7)+, d0
L_FF578A:
	rts
L_FF578C:
	moveq	#$0, d0
L_FF578E:
	tst.b	$24(a0)
L_FF5792:
	bne.w	L_FF57CE
L_FF5796:
	move.b	#$4, $1(a0)
L_FF579C:
	move.b	#$2, $24(a0)
L_FF57A2:
	move.b	#$3, $18(a0)
L_FF57A8:
	move.b	#$28, $19(a0)
L_FF57AE:
	move.b	#$8, $16(a0)
L_FF57B4:
	move.w	#$8200, $2(a0)
L_FF57BA:
	move.l	#$ff57d4, $4(a0)
L_FF57C2:
	move.w	#$200, $8(a0)
L_FF57C8:
	move.w	#$b0, $c(a0)
L_FF57CE:
	jmp	L_FF2842.l
	dc.l	$00020300
	dc.l	$0D000000
	dc.l	$000D0000
	dc.l	$20000500
	dc.b	$00,$40
L_FF57E6:
	moveq	#$0, d0
L_FF57E8:
	move.b	$24(a0), d0
L_FF57EC:
	move.w	$ff5806(pc, d0.w), d0
L_FF57F0:
	jsr	$ff5806(pc, d0.w)
L_FF57F4:
	lea.l	$ff5ae4.l, a1
L_FF57FA:
	jsr	L_FF276E.l
L_FF5800:
	jmp	L_FF2842.l
	dc.l	$00080052
	dc.l	$00F00184
	dc.l	$117C0004
	dc.l	$0001117C
	dc.l	$00020024
	dc.l	$117C0002
	dc.l	$0018117C
	dc.l	$00080019
	dc.l	$117C000C
	dc.l	$0016317C
	dc.l	$E05B0002
	dc.l	$217C00FF
	dc.l	$5B260004
	dc.l	$61000196
	dc.l	$31410008
	dc.l	$3142000C
	dc.l	$31410032
	dc.l	$31420034
	dc.l	$31410036
	dc.l	$31420038
	dc.l	$4E750C38
	dc.l	$0002CD1F
	dc.l	$67340C38
	dc.l	$0001CD15
	dc.l	$66140839
	dc.l	$000000A1
	dc.l	$201E6612
	dc.l	$08390001
	dc.l	$00A1201E
	dc.l	$6608117C
	dc.l	$0000001C
	dc.l	$6006117C
	dc.l	$0006001C
	dc.l	$4238CD1F
	dc.l	$61000034
	dc.l	$4E75117C
	dc.l	$0003001C
	dc.l	$117C0006
	dc.l	$00244228
	dc.l	$002D4268
	dc.l	$00323168
	dc.l	$000C0034
	dc.l	$42680010
	dc.l	$317CFB00
	dc.l	$00124268
	dc.l	$002E317C
	dc.l	$00400030
	dc.l	$4E756100
	dc.l	$010CB268
	dc.l	$00326608
	dc.l	$B4680034
	dc.l	$66024E75
	dc.l	$11FC0001
	dc.l	$CD1F117C
	dc.l	$0006001C
	dc.l	$117C0004
	dc.l	$00244228
	dc.l	$002D3141
	dc.l	$00323142
	dc.l	$00344E75
	dc.l	$61CC0C28
	dc.l	$0001002D
	dc.l	$6742117C
	dc.l	$0002002D
	dc.l	$676A317C
	dc.l	$04000010
	dc.l	$42680012
	dc.l	$30280008
	dc.l	$B0680032
	dc.l	$67366D12
	dc.l	$08E80000
	dc.l	$002208E8
	dc.l	$00000001
	dc.l	$44680010
	dc.l	$600C08A8
	dc.l	$00000022
	dc.l	$08A80000
	dc.l	$0001117C
	dc.l	$0001002D
	dc.l	$610009BE
	dc.l	$30280008
	dc.l	$B0680032
	dc.l	$67024E75
	dc.l	$42680010
	dc.l	$317C0400
	dc.l	$00123028
	dc.l	$000CB068
	dc.l	$0034671C
	dc.l	$6D044468
	dc.l	$0012117C
	dc.l	$0002002D
	dc.l	$6100098E
	dc.l	$3028000C
	dc.l	$B0680034
	dc.l	$67024E75
	dc.l	$117C0002
	dc.l	$00244E75
	dc.l	$61000966
	dc.l	$30280034
	dc.l	$B068000C
	dc.l	$6F1243F9
	dc.l	$00FF5AE4
	dc.l	$4EB900FF
	dc.l	$276E4EF9
	dc.l	$00FF2842
	dc.l	$3140000C
	dc.l	$117C0002
	dc.l	$0024117C
	dc.l	$0000001C
	dc.l	$11FC0003
	dc.l	$CD1F43F9
	dc.l	$00FF5AE4
	dc.l	$4EB900FF
	dc.l	$276E4EF9
	dc.l	$00FF2842
	dc.l	$0C780603
	dc.l	$CD146730
	dc.l	$0C780803
	dc.l	$CD146728
	dc.l	$0C380001
	dc.l	$CD156700
	dc.l	$002A0C38
	dc.l	$0005CD15
	dc.l	$6700004C
	dc.l	$70001038
	dc.l	$CD1ED000
	dc.l	$D000323B
	dc.l	$0066343B
	dc.l	$00644E75
	dc.l	$323C00B4
	dc.l	$343C0040
	dc.l	$4E756100
	dc.l	$F55645F9
	dc.l	$00FF5AAC
	dc.l	$20090C40
	dc.l	$CFA06706
	dc.l	$45F900FF
	dc.l	$5A847000
	dc.l	$30290004
	dc.l	$D040D040
	dc.l	$32320000
	dc.l	$34320002
	dc.l	$4E7545F9
	dc.l	$00FF5ADC
	dc.l	$0C380001
	dc.l	$CD296706
	dc.l	$45F900FF
	dc.l	$5AD47000
	dc.l	$1038CD2A
	dc.l	$D040D040
	dc.l	$32320000
	dc.l	$34320002
	dc.l	$4E750190
	dc.l	$000000A4
	dc.l	$001800A4
	dc.l	$003800A4
	dc.l	$005C00A4
	dc.l	$0074004C
	dc.l	$001400E4
	dc.l	$0014006C
	dc.l	$0024006C
	dc.l	$0034006C
	dc.l	$0044006C
	dc.l	$0054006C
	dc.l	$0064006C
	dc.l	$0074006C
	dc.l	$0084006C
	dc.l	$0094006C
	dc.l	$00A4006C
	dc.l	$00B400CC
	dc.l	$002400CC
	dc.l	$003400CC
	dc.l	$004400CC
	dc.l	$005400CC
	dc.l	$006400CC
	dc.l	$007400CC
	dc.l	$008400CC
	dc.l	$009400CC
	dc.l	$00A400CC
	dc.l	$00B400B0
	dc.l	$00BC007C
	dc.l	$00BC0110
	dc.l	$00BC00DC
	dc.l	$00BC000E
	dc.l	$0019001F
	dc.l	$00230029
	dc.l	$002D0031
	dc.l	$17000000
	dc.l	$00000001
	dc.l	$02FE0207
	dc.l	$03040504
	dc.l	$FF010607
	dc.l	$FF010809
	dc.l	$080AFF13
	dc.l	$0102FF05
	dc.l	$0B0DFF01
	dc.l	$03030304
	dc.l	$04040505
	dc.l	$05040404
	dc.l	$0607FE02
	dc.l	$001C0022
	dc.l	$0028002E
	dc.l	$0034003A
	dc.l	$00400046
	dc.l	$004C0052
	dc.l	$0058005E
	dc.l	$0064006A
	dc.l	$01F40600
	dc.l	$20F801F4
	dc.l	$060026F8
	dc.l	$01F40600
	dc.l	$2CF801F4
	dc.l	$060038F8
	dc.l	$01F40600
	dc.l	$3EF801F4
	dc.l	$060044F8
	dc.l	$01F40600
	dc.l	$4AF801F4
	dc.l	$060050F8
	dc.l	$01F80500
	dc.l	$68F801F8
	dc.l	$05006CF8
	dc.l	$01F80500
	dc.l	$70F801F4
	dc.l	$060056F8
	dc.l	$01F80500
	dc.l	$00F801F4
	dc.l	$060056FB
L_FF5B96:
	moveq	#$0, d0
L_FF5B98:
	move.b	$24(a0), d0
L_FF5B9C:
	move.w	$ff5ba4(pc, d0.w), d0
L_FF5BA0:
	jmp	$ff5ba4(pc, d0.w)
	dc.l	$0006006C
	dc.l	$006C117C
	dc.l	$00040001
	dc.l	$117C0003
	dc.l	$0018117C
	dc.l	$00200019
	dc.l	$117C000C
	dc.l	$0016217C
	dc.l	$00FF5C16
	dc.l	$00044A28
	dc.l	$00286620
	dc.l	$117C0002
	dc.l	$0024317C
	dc.l	$00500008
	dc.l	$317C0014
	dc.l	$000C117C
	dc.l	$0000001A
	dc.l	$317C002B
	dc.l	$00024E75
	dc.l	$117C0004
	dc.l	$0024317C
	dc.l	$00F00008
	dc.l	$317C0014
	dc.l	$000C117C
	dc.l	$0001001A
	dc.l	$317C202B
	dc.l	$00024E75
	dc.l	$4EF900FF
	dc.l	$28420004
	dc.l	$001002F4
	dc.l	$0E0000E0
	dc.l	$F40E000C
	dc.l	$000002F4
	dc.l	$0E0018E0
	dc.l	$F40E0024
	dc.b	$00,$00
L_FF5C32:
	moveq	#$0, d0
L_FF5C34:
	move.b	$24(a0), d0
L_FF5C38:
	move.w	$ff5c40(pc, d0.w), d0
L_FF5C3C:
	jmp	$ff5c40(pc, d0.w)
	dc.l	$00060034
	dc.l	$0064117C
	dc.l	$00040001
	dc.l	$117C0002
	dc.l	$0024117C
	dc.l	$00020018
	dc.l	$117C0010
	dc.l	$0019117C
	dc.l	$00100016
	dc.l	$317CE05B
	dc.l	$0002217C
	dc.l	$00FF5CCC
	dc.l	$00044E75
	dc.l	$4A38CD2C
	dc.l	$66024E75
	dc.l	$0C380001
	dc.l	$CD29670E
	dc.l	$317C0018
	dc.l	$0008317C
	dc.l	$00A8000C
	dc.l	$600C317C
	dc.l	$00780008
	dc.l	$317C00A8
	dc.l	$000C117C
	dc.l	$00040024
	dc.l	$4A38CD29
	dc.l	$671243F9
	dc.l	$00FF5CC4
	dc.l	$4EB900FF
	dc.l	$276E4EF9
	dc.l	$00FF2842
	dc.l	$117C0002
	dc.l	$00244E75
	dc.l	$00021300
	dc.l	$0001FF00
	dc.l	$00040014
	dc.l	$03000F00
	dc.l	$00000003
	dc.l	$00102000
	dc.l	$0E001428
	dc.l	$02000F00
	dc.l	$00000003
	dc.l	$00102000
L_FF5CEC:
	moveq	#$0, d0
L_FF5CEE:
	move.b	$24(a0), d0
L_FF5CF2:
	move.w	$ff5cfa(pc, d0.w), d0
L_FF5CF6:
	jmp	$ff5cfa(pc, d0.w)
	dc.l	$0012003E
	dc.l	$0040012C
	dc.l	$016E019A
	dc.l	$01D60212
	dc.l	$0260117C
	dc.l	$00040001
	dc.l	$117C0002
	dc.l	$0024117C
	dc.l	$00020018
	dc.l	$117C0008
	dc.l	$0019117C
	dc.l	$00080016
	dc.l	$317CE05B
	dc.l	$0002217C
	dc.l	$00FF5B26
	dc.l	$00044E75
	dc.l	$317CE05B
	dc.l	$00026100
	dc.l	$006A3140
	dc.l	$00083141
	dc.l	$000C3142
	dc.l	$00323143
	dc.l	$00340C38
	dc.l	$0002CD16
	dc.l	$67100C38
	dc.l	$0006CD16
	dc.l	$67024E71
	dc.l	$04680010
	dc.l	$000C317C
	dc.l	$04000010
	dc.l	$42680012
	dc.l	$30280032
	dc.l	$B0680008
	dc.l	$6E1208E8
	dc.l	$00000022
	dc.l	$08E80000
	dc.l	$00014468
	dc.l	$0010600C
	dc.l	$08A80000
	dc.l	$002208A8
	dc.l	$00000001
	dc.l	$117C0006
	dc.l	$001C117C
	dc.l	$00060024
	dc.l	$4E757800
	dc.l	$6100DE48
	dc.l	$67027801
	dc.l	$1038CD17
	dc.l	$6100001E
	dc.l	$48E7C000
	dc.l	$1038CD16
	dc.l	$61000012
	dc.l	$48E7C000
	dc.l	$20046100
	dc.l	$DE164CDF
	dc.l	$000F4E75
	dc.l	$0C000006
	dc.l	$67220C00
	dc.l	$0005670A
	dc.l	$303C00B8
	dc.l	$323C0030
	dc.l	$60227001
	dc.l	$6100DDF4
	dc.l	$6100001C
	dc.l	$3200303C
	dc.l	$00186010
	dc.l	$70006100
	dc.l	$DDE26100
	dc.l	$000A3200
	dc.l	$303C00E0
	dc.l	$4E756100
	dc.l	$F1566100
	dc.l	$F30EC0FC
	dc.l	$00100640
	dc.l	$002C4E75
	dc.l	$610004DA
	dc.l	$43F900FF
	dc.l	$5AE44EB9
	dc.l	$00FF276E
	dc.l	$4EB900FF
	dc.l	$28423028
	dc.l	$0032B068
	dc.l	$00086702
	dc.l	$4E75117C
	dc.l	$00080024
	dc.l	$42680010
	dc.l	$317C0400
	dc.l	$00123028
	dc.l	$0034B068
	dc.l	$000C6E04
	dc.l	$44680012
	dc.l	$4E753028
	dc.l	$0034B068
	dc.l	$000C6716
	dc.l	$6100048E
	dc.l	$43F900FF
	dc.l	$5AE44EB9
	dc.l	$00FF276E
	dc.l	$4EF900FF
	dc.l	$2842117C
	dc.l	$000A0024
	dc.l	$4EF900FF
	dc.l	$28420C28
	dc.l	$00010028
	dc.l	$670C117C
	dc.l	$00020024
	dc.l	$4EF900FF
	dc.l	$2842117C
	dc.l	$000C0024
	dc.l	$3168000C
	dc.l	$00344268
	dc.l	$0010317C
	dc.l	$FB000012
	dc.l	$4268002E
	dc.l	$317C0040
	dc.l	$0030117C
	dc.l	$0003001C
	dc.l	$4E756100
	dc.l	$04203028
	dc.l	$0034B068
	dc.l	$000C6F12
	dc.l	$43F900FF
	dc.l	$5AE44EB9
	dc.l	$00FF276E
	dc.l	$4EF900FF
	dc.l	$28423140
	dc.l	$000C117C
	dc.l	$000E0024
	dc.l	$117C0000
	dc.l	$001C4238
	dc.l	$CD5111FC
	dc.l	$0001CD50
	dc.l	$4E754238
	dc.l	$CD500C38
	dc.l	$0004CD51
	dc.l	$671243F9
	dc.l	$00FF5AE4
	dc.l	$4EB900FF
	dc.l	$276E4EF9
	dc.l	$00FF2842
	dc.l	$08A80000
	dc.l	$002208A8
	dc.l	$00000001
	dc.l	$117C0000
	dc.l	$001C117C
	dc.l	$0001001D
	dc.l	$117C000C
	dc.l	$001A317C
	dc.l	$E0270002
	dc.l	$4238CD51
	dc.l	$117C0010
	dc.l	$00244E75
	dc.l	$4EF900FF
	dc.b	$28,$42
L_FF5F60:
	moveq	#$0, d0
L_FF5F62:
	move.b	$24(a0), d0
L_FF5F66:
	move.w	$ff5f6e(pc, d0.w), d0
L_FF5F6A:
	jmp	$ff5f6e(pc, d0.w)
	dc.l	$0010003C
	dc.l	$01260160
	dc.l	$017E0192
	dc.l	$01C801EC
	dc.l	$117C0004
	dc.l	$0001117C
	dc.l	$00020024
	dc.l	$117C0001
	dc.l	$0018117C
	dc.l	$00040019
	dc.l	$117C0004
	dc.l	$0016317C
	dc.l	$80260002
	dc.l	$217C00FF
	dc.l	$616E0004
	dc.l	$0C380001
	dc.l	$CD2D6714
	dc.l	$0C380002
	dc.l	$CD2D676C
	dc.l	$0C380003
	dc.l	$CD2D6700
	dc.l	$00744E75
	dc.l	$117C0004
	dc.l	$00244228
	dc.l	$002A6100
	dc.l	$00084EF9
	dc.l	$00FF2842
	dc.l	$4EB900FF
	dc.l	$2728323C
	dc.l	$0280343C
	dc.l	$01806100
	dc.l	$001E3140
	dc.l	$00104EB9
	dc.l	$00FF2728
	dc.l	$323C0280
	dc.l	$343C0180
	dc.l	$61000008
	dc.l	$31400012
	dc.l	$4E750280
	dc.l	$0000FFFF
	dc.l	$02820000
	dc.l	$FFFF48C0
	dc.l	$81C24840
	dc.l	$4A406B04
	dc.l	$D0416002
	dc.l	$90414E75
	dc.l	$117C0006
	dc.l	$00244468
	dc.l	$00104468
	dc.l	$00124E75
	dc.l	$117C000A
	dc.l	$00240C38
	dc.l	$0006CD17
	dc.l	$670E3028
	dc.l	$00080440
	dc.l	$00C83140
	dc.l	$0032600C
	dc.l	$30280008
	dc.l	$064000C8
	dc.l	$31400032
	dc.l	$6100F712
	dc.l	$6100EF08
	dc.l	$6100F0C0
	dc.l	$C0FC0010
	dc.l	$0640002C
	dc.l	$31400034
	dc.l	$317C0400
	dc.l	$00104268
	dc.l	$00123028
	dc.l	$0032B068
	dc.l	$00086E04
	dc.l	$44680010
	dc.l	$4EF900FF
	dc.l	$28425228
	dc.l	$002A6100
	dc.l	$02680C68
	dc.l	$FFFC0008
	dc.l	$6D1E0C68
	dc.l	$01440008
	dc.l	$6E160C68
	dc.l	$FFFC000C
	dc.l	$6D0E0C68
	dc.l	$00E4000C
	dc.l	$6E064EF9
	dc.l	$00FF2842
	dc.l	$5238CD2E
	dc.l	$117C0002
	dc.l	$00244E75
	dc.l	$61000232
	dc.l	$4EB900FF
	dc.l	$28425328
	dc.l	$002A6702
	dc.l	$4E755238
	dc.l	$CD2E117C
	dc.l	$00080024
	dc.l	$4E754A38
	dc.l	$CD2E6706
	dc.l	$4EF900FF
	dc.l	$2842117C
	dc.l	$00020024
	dc.l	$4E756100
	dc.l	$02004EB9
	dc.l	$00FF2842
	dc.l	$30280032
	dc.l	$B0680008
	dc.l	$67024E75
	dc.l	$117C000C
	dc.l	$00244268
	dc.l	$0010317C
	dc.l	$04000012
	dc.l	$30280034
	dc.l	$B068000C
	dc.l	$6E044468
	dc.l	$00124E75
	dc.l	$30280034
	dc.l	$B068000C
	dc.l	$670A6100
	dc.l	$01C04EF9
	dc.l	$00FF2842
	dc.l	$5238CD2E
	dc.l	$117C000E
	dc.l	$00244EF9
	dc.l	$00FF2842
	dc.l	$4A38CD2E
	dc.l	$67064EF9
	dc.l	$00FF2842
	dc.l	$117C0002
	dc.l	$00244E75
	dc.l	$000201FC
	dc.l	$000000FC
L_FF6176:
	moveq	#$0, d0
L_FF6178:
	move.b	$24(a0), d0
L_FF617C:
	move.w	$ff6184(pc, d0.w), d0
L_FF6180:
	jmp	$ff6184(pc, d0.w)
	dc.l	$00080040
	dc.l	$00B000D0
	dc.l	$117C0004
	dc.l	$0001117C
	dc.l	$00020024
	dc.l	$117C0002
	dc.l	$0018117C
	dc.l	$00080019
	dc.l	$117C0008
	dc.l	$0016317C
	dc.l	$E0270002
	dc.l	$217C00FF
	dc.l	$62BC0004
	dc.l	$317C00B8
	dc.l	$0008317C
	dc.l	$0030000C
	dc.l	$6100005E
	dc.l	$0C380001
	dc.l	$CD506734
	dc.l	$0C380002
	dc.l	$CD50673C
	dc.l	$0C380003
	dc.l	$CD506702
	dc.l	$4E75317C
	dc.l	$00B80008
	dc.l	$317C0030
	dc.l	$000C5238
	dc.l	$CD510C38
	dc.l	$0004CD51
	dc.l	$6D084238
	dc.l	$CD504238
	dc.l	$CD514E75
	dc.l	$4228002A
	dc.l	$61000064
	dc.l	$117C0004
	dc.l	$00244E75
	dc.l	$117C0006
	dc.l	$00244468
	dc.l	$00104468
	dc.l	$00124E75
	dc.l	$4A3900FF
	dc.l	$0F1F6606
	dc.l	$4EB900FF
	dc.l	$28424E75
	dc.l	$5228002A
	dc.l	$610000B8
	dc.l	$0C6800EC
	dc.l	$000C6E04
	dc.l	$61DE4E75
	dc.l	$5238CD51
	dc.l	$117C0002
	dc.l	$00244E75
	dc.l	$61000086
	dc.l	$61CA5328
	dc.l	$002A6702
	dc.l	$4E755238
	dc.l	$CD51117C
	dc.l	$00020024
	dc.l	$4E754EB9
	dc.l	$00FF2728
	dc.l	$00408000
	dc.l	$08280000
	dc.l	$001A6704
	dc.l	$02407FFF
	dc.l	$323C0040
	dc.l	$343C0100
	dc.l	$6100FD7A
	dc.l	$31400010
	dc.l	$317C0000
	dc.l	$002E4EB9
	dc.l	$00FF2728
	dc.l	$02407FFF
	dc.l	$323C0020
	dc.l	$343C0020
	dc.l	$6100FD5A
	dc.l	$31400030
	dc.l	$317CFE00
	dc.l	$00124E75
	dc.l	$0008000E
	dc.l	$0014001A
	dc.l	$01F80008
	dc.l	$02F801F8
	dc.l	$00080000
	dc.l	$01000008
	dc.l	$03F80100
	dc.l	$00080100
	dc.l	$61000024
	dc.l	$3028002E
	dc.l	$D1680010
	dc.l	$30280030
	dc.l	$D1680012
	dc.l	$4E753028
	dc.l	$002ED168
	dc.l	$00103028
	dc.l	$0030D168
	dc.l	$00123028
	dc.l	$001048C0
	dc.l	$E188D1A8
	dc.l	$00083028
	dc.l	$001248C0
	dc.l	$E188D1A8
	dc.l	$000C4E75
L_FF631C:
	lea.l	$c00004.l, a5
L_FF6322:
	moveq	#$3, d2
L_FF6324:
	moveq	#$0, d1
L_FF6326:
	move.b	d0, d1
L_FF6328:
	beq.b	L_FF633C
L_FF632A:
	lsl.w	#$3, d1
L_FF632C:
	lea.l	$ff6344(pc), a0
L_FF6330:
	move.l	-$8(a0, d1.w), (a5)
L_FF6334:
	movea.l	-$4(a0, d1.w), a0
L_FF6338:
	jsr	$ff6394(pc)
L_FF633C:
	ror.l	#$8, d0
L_FF633E:
	dbra	d2, L_FF6324
L_FF6342:
	rts
	dc.l	$40200000
	dc.l	$00FF6980
	dc.l	$44C00000
	dc.l	$00FF6978
	dc.l	$44E00000
	dc.l	$00FF8782
	dc.l	$45600000
	dc.l	$00FF8136
	dc.l	$4B600000
	dc.l	$00FF78C2
	dc.l	$5B600000
	dc.l	$00FF8812
	dc.l	$40000001
	dc.l	$00FF971C
	dc.l	$41000001
	dc.l	$00FF972C
	dc.l	$40000002
	dc.l	$00FF6AD2
	dc.l	$60000002
	dc.l	$00FF739E
	dc.l	$48E7FFDC
	dc.l	$47F900FF
	dc.l	$645E49F9
	dc.l	$00C00000
	dc.l	$600A48E7
	dc.l	$FFDC47F9
	dc.l	$00FF6474
	dc.l	$43F8A000
	dc.l	$3418E34A
	dc.l	$6404D6FC
	dc.l	$000AE54A
	dc.l	$3A427608
	dc.l	$74007800
	dc.l	$4EBA00C0
	dc.l	$1A18E145
	dc.l	$1A183C3C
	dc.l	$0010610E
	dc.l	$4E714E71
	dc.l	$4E714E71
	dc.l	$4CDF3BFF
	dc.b	$4E,$75
L_FF63E6:
	move.w	d6, d7
L_FF63E8:
	subq.w	#$8, d7
L_FF63EA:
	move.w	d5, d1
L_FF63EC:
	lsr.w	d7, d1
L_FF63EE:
	cmpi.b	#$fc, d1
L_FF63F2:
	bcc.b	L_FF6432
L_FF63F4:
	andi.w	#$ff, d1
L_FF63F8:
	add.w	d1, d1
L_FF63FA:
	move.b	(a1, d1.w), d0
L_FF63FE:
	ext.w	d0
L_FF6400:
	sub.w	d0, d6
L_FF6402:
	cmpi.w	#$9, d6
L_FF6406:
	bcc.b	L_FF640E
L_FF6408:
	addq.w	#$8, d6
L_FF640A:
	asl.w	#$8, d5
L_FF640C:
	move.b	(a0)+, d5
L_FF640E:
	move.b	$1(a1, d1.w), d1
L_FF6412:
	move.w	d1, d0
L_FF6414:
	andi.w	#$f, d1
L_FF6418:
	andi.w	#$f0, d0
L_FF641C:
	lsr.w	#$4, d0
L_FF641E:
	lsl.l	#$4, d4
L_FF6420:
	or.b	d1, d4
L_FF6422:
	subq.w	#$1, d3
L_FF6424:
	bne.b	L_FF642C
L_FF6426:
	jmp	(a3)
L_FF6428:
	moveq	#$0, d4
L_FF642A:
	moveq	#$8, d3
L_FF642C:
	dbra	d0, L_FF641E
L_FF6430:
	bra.b	L_FF63E6
L_FF6432:
	subq.w	#$6, d6
L_FF6434:
	cmpi.w	#$9, d6
L_FF6438:
	bcc.b	L_FF6440
L_FF643A:
	addq.w	#$8, d6
L_FF643C:
	asl.w	#$8, d5
L_FF643E:
	move.b	(a0)+, d5
L_FF6440:
	subq.w	#$7, d6
L_FF6442:
	move.w	d5, d1
L_FF6444:
	lsr.w	d6, d1
L_FF6446:
	move.w	d1, d0
L_FF6448:
	andi.w	#$f, d1
L_FF644C:
	andi.w	#$70, d0
L_FF6450:
	cmpi.w	#$9, d6
L_FF6454:
	bcc.b	L_FF641C
L_FF6456:
	addq.w	#$8, d6
L_FF6458:
	asl.w	#$8, d5
L_FF645A:
	move.b	(a0)+, d5
L_FF645C:
	bra.b	L_FF641C
L_FF645E:
	move.l	d4, (a4)
L_FF6460:
	subq.w	#$1, a5
L_FF6462:
	move.w	a5, d4
L_FF6464:
	bne.b	L_FF6428
L_FF6466:
	rts
L_FF6468:
	eor.l	d4, d2
L_FF646A:
	move.l	d2, (a4)
L_FF646C:
	subq.w	#$1, a5
L_FF646E:
	move.w	a5, d4
L_FF6470:
	bne.b	L_FF6428
L_FF6472:
	rts
L_FF6474:
	move.l	d4, (a4)+
L_FF6476:
	subq.w	#$1, a5
L_FF6478:
	move.w	a5, d4
L_FF647A:
	bne.b	L_FF6428
L_FF647C:
	rts
L_FF647E:
	eor.l	d4, d2
L_FF6480:
	move.l	d2, (a4)+
L_FF6482:
	subq.w	#$1, a5
L_FF6484:
	move.w	a5, d4
L_FF6486:
	bne.b	L_FF6428
L_FF6488:
	rts
	dc.l	$10180C00
	dc.l	$00FF6602
	dc.l	$4E753E00
	dc.l	$10180C00
	dc.l	$008064EE
	dc.l	$12000247
	dc.l	$000F0241
	dc.l	$00708E41
	dc.l	$0240000F
	dc.l	$1200E149
	dc.l	$8E417208
	dc.l	$9240660A
	dc.l	$1018D040
	dc.l	$33870000
	dc.l	$60D21018
	dc.l	$E368D040
	dc.l	$7A01E36D
	dc.l	$53453387
	dc.l	$00005440
	dc.l	$51CDFFF8
	dc.b	$60,$BA
L_FF64DC:
	add.w	d0, d0
L_FF64DE:
	add.w	d0, d0
L_FF64E0:
	lea.l	$ff651e.l, a0
L_FF64E6:
	adda.w	d0, a0
L_FF64E8:
	movea.l	(a0), a0
L_FF64EA:
	movea.l	#$c00000, a1
L_FF64F0:
	move.w	#$c0db, d3
L_FF64F4:
	move.l	#$48a00003, d0
L_FF64FA:
	move.w	#$3, d2
L_FF64FE:
	move.l	d0, $c00004.l
L_FF6504:
	move.w	#$13, d1
L_FF6508:
	move.w	(a0)+, d4
L_FF650A:
	add.w	d3, d4
L_FF650C:
	move.w	d4, (a1)
L_FF650E:
	dbra	d1, L_FF6508
L_FF6512:
	addi.l	#$800000, d0
L_FF6518:
	dbra	d2, L_FF64FE
L_FF651C:
	rts
ObjectDataPointers:
	dc.l	$00FF8E5C
	dc.l	$00FF8EFC
	dc.l	$00FF8F9C
	dc.l	$00FF903C
	dc.l	$00FF90DC
	dc.l	$00FF917C
	dc.l	$00FF921C
	dc.l	$00FF92BC
	dc.l	$00FF935C
	dc.l	$00FF93FC
	dc.l	$00FF949C
	dc.l	$00FF953C
	dc.l	$00FF95DC
	dc.l	$00FF967C
L_FF6556:
	move.w	d0, -(a7)
L_FF6558:
	andi.l	#$ffff, d0
L_FF655E:
	mulu.w	#$e, d0
L_FF6562:
	lea.l	$ff65b0.l, a1
L_FF6568:
	adda.w	d0, a1
L_FF656A:
	movea.l	(a1)+, a0
L_FF656C:
	move.w	(a1)+, d0
L_FF656E:
	move.l	a1, -(a7)
L_FF6570:
	lea.l	$FFFFa000.w, a1
L_FF6574:
	bsr.w	L_FF663C
L_FF6578:
	movea.l	(a7)+, a1
L_FF657A:
	move.w	(a7)+, d0
L_FF657C:
	cmpi.w	#$1, d0
L_FF6580:
	bne.b	L_FF6586
L_FF6582:
	bsr.w	L_FF65DA
L_FF6586:
	move.w	(a1)+, d3
L_FF6588:
	move.w	(a1)+, d2
L_FF658A:
	move.l	(a1), d0
L_FF658C:
	lea.l	$FFFFa000.w, a0
L_FF6590:
	movea.l	#$c00000, a1
L_FF6596:
	move.l	d0, $c00004.l
L_FF659C:
	move.w	d3, d1
L_FF659E:
	move.w	(a0)+, (a1)
L_FF65A0:
	dbra	d1, L_FF659E
L_FF65A4:
	addi.l	#$800000, d0
L_FF65AA:
	dbra	d2, L_FF6596
L_FF65AE:
	rts
	dc.l	$00FF842A
	dc.l	$84000027
	dc.l	$001B4000
	dc.l	$000300FF
	dc.l	$85FA2500
	dc.l	$0027001B
	dc.l	$60000003
	dc.l	$00FF994C
	dc.l	$82080008
	dc.l	$000442A0
	dc.b	$00,$03
L_FF65DA:
	movem.l	d0-d3/a0-a2, -(a7)
L_FF65DE:
	lea.l	$ff6626.l, a2
L_FF65E4:
	move.w	(a2)+, d3
L_FF65E6:
	lea.l	$FFFFa000.w, a0
L_FF65EA:
	clr.l	d0
L_FF65EC:
	move.b	(a2)+, d0
L_FF65EE:
	add.w	d0, d0
L_FF65F0:
	adda.w	d0, a0
L_FF65F2:
	clr.l	d0
L_FF65F4:
	move.b	(a2)+, d0
L_FF65F6:
	mulu.w	#$50, d0
L_FF65FA:
	adda.w	d0, a0
L_FF65FC:
	clr.l	d1
L_FF65FE:
	clr.l	d2
L_FF6600:
	move.b	(a2)+, d1
L_FF6602:
	move.b	(a2)+, d2
L_FF6604:
	movea.l	a0, a1
L_FF6606:
	move.w	d1, d0
L_FF6608:
	andi.w	#$9fff, (a1)
L_FF660C:
	adda.w	#$2, a1
L_FF6610:
	dbra	d0, L_FF6608
L_FF6614:
	adda.w	#$50, a0
L_FF6618:
	dbra	d2, L_FF6604
L_FF661C:
	dbra	d3, L_FF65E6
L_FF6620:
	movem.l	(a7)+, d0-d3/a0-a2
L_FF6624:
	rts
	dc.l	$00041001
	dc.l	$07020110
	dc.l	$00090E10
	dc.l	$00091A10
	dc.l	$00092710
	dc.b	$00,$09
L_FF663C:
	movem.l	d0-d7/a1-a5, -(a7)
L_FF6640:
	movea.w	d0, a3
L_FF6642:
	move.b	(a0)+, d0
L_FF6644:
	ext.w	d0
L_FF6646:
	movea.w	d0, a5
L_FF6648:
	move.b	(a0)+, d4
L_FF664A:
	lsl.b	#$3, d4
L_FF664C:
	movea.w	(a0)+, a2
L_FF664E:
	adda.w	a3, a2
L_FF6650:
	movea.w	(a0)+, a4
L_FF6652:
	adda.w	a3, a4
L_FF6654:
	move.b	(a0)+, d5
L_FF6656:
	asl.w	#$8, d5
L_FF6658:
	move.b	(a0)+, d5
L_FF665A:
	moveq	#$10, d6
L_FF665C:
	moveq	#$7, d0
L_FF665E:
	move.w	d6, d7
L_FF6660:
	sub.w	d0, d7
L_FF6662:
	move.w	d5, d1
L_FF6664:
	lsr.w	d7, d1
L_FF6666:
	andi.w	#$7f, d1
L_FF666A:
	move.w	d1, d2
L_FF666C:
	cmpi.w	#$40, d1
L_FF6670:
	bcc.b	L_FF6676
L_FF6672:
	moveq	#$6, d0
L_FF6674:
	lsr.w	#$1, d2
L_FF6676:
	bsr.w	L_FF67AA
L_FF667A:
	andi.w	#$f, d2
L_FF667E:
	lsr.w	#$4, d1
L_FF6680:
	add.w	d1, d1
L_FF6682:
	jmp	EnigmaJumpTable(pc, d1.w)
L_FF6686:
	move.w	a2, (a1)+
L_FF6688:
	addq.w	#$1, a2
L_FF668A:
	dbra	d2, L_FF6686
L_FF668E:
	bra.b	L_FF665C
L_FF6690:
	move.w	a4, (a1)+
L_FF6692:
	dbra	d2, L_FF6690
L_FF6696:
	bra.b	L_FF665C
L_FF6698:
	bsr.w	L_FF66FA
L_FF669C:
	move.w	d1, (a1)+
L_FF669E:
	dbra	d2, L_FF669C
L_FF66A2:
	bra.b	L_FF665C
L_FF66A4:
	bsr.w	L_FF66FA
L_FF66A8:
	move.w	d1, (a1)+
L_FF66AA:
	addq.w	#$1, d1
L_FF66AC:
	dbra	d2, L_FF66A8
L_FF66B0:
	bra.b	L_FF665C
L_FF66B2:
	bsr.w	L_FF66FA
L_FF66B6:
	move.w	d1, (a1)+
L_FF66B8:
	subq.w	#$1, d1
L_FF66BA:
	dbra	d2, L_FF66B6
L_FF66BE:
	bra.b	L_FF665C
L_FF66C0:
	cmpi.w	#$f, d2
L_FF66C4:
	beq.b	L_FF66E2
L_FF66C6:
	bsr.w	L_FF66FA
L_FF66CA:
	move.w	d1, (a1)+
L_FF66CC:
	dbra	d2, L_FF66C6
L_FF66D0:
	bra.b	L_FF665C
EnigmaJumpTable:
	dc.l	$60B260B0
	dc.l	$60B860B6
	dc.l	$60BC60C6
	dc.l	$60D260DE
L_FF66E2:
	subq.w	#$1, a0
L_FF66E4:
	cmpi.w	#$10, d6
L_FF66E8:
	bne.b	L_FF66EC
L_FF66EA:
	subq.w	#$1, a0
L_FF66EC:
	move.w	a0, d0
L_FF66EE:
	lsr.w	#$1, d0
L_FF66F0:
	bcc.b	L_FF66F4
L_FF66F2:
	addq.w	#$1, a0
L_FF66F4:
	movem.l	(a7)+, d0-d7/a1-a5
L_FF66F8:
	rts
L_FF66FA:
	move.w	a3, d3
L_FF66FC:
	move.b	d4, d1
L_FF66FE:
	add.b	d1, d1
L_FF6700:
	bcc.b	L_FF670C
L_FF6702:
	subq.w	#$1, d6
L_FF6704:
	btst.l	d6, d5
L_FF6706:
	beq.b	L_FF670C
L_FF6708:
	ori.w	#$8000, d3
L_FF670C:
	add.b	d1, d1
L_FF670E:
	bcc.b	L_FF671A
L_FF6710:
	subq.w	#$1, d6
L_FF6712:
	btst.l	d6, d5
L_FF6714:
	beq.b	L_FF671A
L_FF6716:
	addi.w	#$4000, d3
L_FF671A:
	add.b	d1, d1
L_FF671C:
	bcc.b	L_FF6728
L_FF671E:
	subq.w	#$1, d6
L_FF6720:
	btst.l	d6, d5
L_FF6722:
	beq.b	L_FF6728
L_FF6724:
	addi.w	#$2000, d3
L_FF6728:
	add.b	d1, d1
L_FF672A:
	bcc.b	L_FF6736
L_FF672C:
	subq.w	#$1, d6
L_FF672E:
	btst.l	d6, d5
L_FF6730:
	beq.b	L_FF6736
L_FF6732:
	ori.w	#$1000, d3
L_FF6736:
	add.b	d1, d1
L_FF6738:
	bcc.b	L_FF6744
L_FF673A:
	subq.w	#$1, d6
L_FF673C:
	btst.l	d6, d5
L_FF673E:
	beq.b	L_FF6744
L_FF6740:
	ori.w	#$800, d3
L_FF6744:
	move.w	d5, d1
L_FF6746:
	move.w	d6, d7
L_FF6748:
	sub.w	a5, d7
L_FF674A:
	bcc.b	L_FF6774
L_FF674C:
	move.w	d7, d6
L_FF674E:
	addi.w	#$10, d6
L_FF6752:
	neg.w	d7
L_FF6754:
	lsl.w	d7, d1
L_FF6756:
	move.b	(a0), d5
L_FF6758:
	rol.b	d7, d5
L_FF675A:
	add.w	d7, d7
L_FF675C:
	and.w	$ff6788(pc, d7.w), d5
L_FF6760:
	add.w	d5, d1
L_FF6762:
	move.w	a5, d0
L_FF6764:
	add.w	d0, d0
L_FF6766:
	and.w	$ff6788(pc, d0.w), d1
L_FF676A:
	add.w	d3, d1
L_FF676C:
	move.b	(a0)+, d5
L_FF676E:
	lsl.w	#$8, d5
L_FF6770:
	move.b	(a0)+, d5
L_FF6772:
	rts
L_FF6774:
	beq.b	L_FF6786
L_FF6776:
	lsr.w	d7, d1
L_FF6778:
	move.w	a5, d0
L_FF677A:
	add.w	d0, d0
L_FF677C:
	and.w	$ff6788(pc, d0.w), d1
L_FF6780:
	add.w	d3, d1
L_FF6782:
	move.w	a5, d0
L_FF6784:
	bra.b	L_FF67AA
L_FF6786:
	moveq	#$10, d6
L_FF6788:
	bra.b	L_FF6762
	dc.l	$00010003
	dc.l	$0007000F
	dc.l	$001F003F
	dc.l	$007F00FF
	dc.l	$01FF03FF
	dc.l	$07FF0FFF
	dc.l	$1FFF3FFF
	dc.l	$7FFFFFFF
L_FF67AA:
	sub.w	d0, d6
L_FF67AC:
	cmpi.w	#$9, d6
L_FF67B0:
	bcc.b	L_FF67B8
L_FF67B2:
	addq.w	#$8, d6
L_FF67B4:
	asl.w	#$8, d5
L_FF67B6:
	move.b	(a0)+, d5
L_FF67B8:
	rts
L_FF67BA:
	lea.l	$ff67d0.l, a0
L_FF67C0:
	lea.l	$FFFFc420.w, a1
L_FF67C4:
	move.w	#$1f, d0
L_FF67C8:
	move.l	(a0)+, (a1)+
L_FF67CA:
	dbra	d0, L_FF67C8
L_FF67CE:
	rts
VDPRegisterData:
	dc.l	$0A660EAA
	dc.l	$08440800
	dc.l	$0A660C88
	dc.l	$0EAA00E0
	dc.l	$0A660EEE
	dc.l	$0C880A66
	dc.l	$0C880ECA
	dc.l	$0EAA0C68
	dc.l	$0A660EAA
	dc.l	$08440C88
	dc.l	$0A660C88
	dc.l	$0EAA0EAA
	dc.l	$0A660C88
	dc.l	$0C880A66
	dc.l	$0C880ECA
	dc.l	$0EAA0EAA
	dc.l	$00000EAA
	dc.l	$00000000
	dc.l	$0E620000
	dc.l	$00000000
	dc.l	$00000622
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$06660000
	dc.l	$0C220E44
	dc.l	$0E660E88
	dc.l	$0EEE0AAA
	dc.l	$08880444
	dc.l	$08AE046A
	dc.l	$00000008
	dc.l	$00000000
L_FF6850:
	addq.b	#$1, $FFFFcd28.w
L_FF6854:
	lea.l	$FFFFc420.w, a0
L_FF6858:
	lea.l	$FFFFcd20.w, a1
L_FF685C:
	lea.l	$ff68b8.l, a2
L_FF6862:
	moveq	#$7, d5
L_FF6864:
	tst.b	(a1)
L_FF6866:
	beq.b	L_FF6894
L_FF6868:
	cmpi.b	#$ff, (a1)
L_FF686C:
	bne.b	L_FF6878
L_FF686E:
	btst.b	#$2, $FFFFcd28.w
L_FF6874:
	beq.b	L_FF688E
L_FF6876:
	bra.b	L_FF6888
L_FF6878:
	cmpi.b	#$1, (a1)
L_FF687C:
	beq.b	L_FF6888
L_FF687E:
	subq.b	#$1, (a1)
L_FF6880:
	btst.b	#$2, $FFFFcd28.w
L_FF6886:
	beq.b	L_FF688E
L_FF6888:
	move.w	#$4, d0
L_FF688C:
	bra.b	L_FF6898
L_FF688E:
	move.w	#$6, d0
L_FF6892:
	bra.b	L_FF6898
L_FF6894:
	move.w	#$2, d0
L_FF6898:
	moveq	#$2, d4
L_FF689A:
	move.w	(a2, d0.w), d3
L_FF689E:
	move.w	$0(a2), d2
L_FF68A2:
	move.w	d3, (a0, d2.w)
L_FF68A6:
	adda.w	#$8, a2
L_FF68AA:
	dbra	d4, L_FF689A
L_FF68AE:
	adda.w	#$1, a1
L_FF68B2:
	dbra	d5, L_FF6864
L_FF68B6:
	rts
	dc.l	$00100A66
	dc.l	$00E00C88
	dc.l	$00140C88
	dc.l	$00E00C88
	dc.l	$001C0EAA
	dc.l	$00E00C88
	dc.l	$002A0A66
	dc.l	$00E00C88
	dc.l	$002C0C88
	dc.l	$00E00C88
	dc.l	$002E0EAA
	dc.l	$00E00C88
	dc.l	$00300A66
	dc.l	$00E00C88
	dc.l	$00320C88
	dc.l	$00E00C88
	dc.l	$00340EAA
	dc.l	$00E00C88
	dc.l	$003A0A66
	dc.l	$00E00C88
	dc.l	$003C0C88
	dc.l	$00E00C88
	dc.l	$003E0EAA
	dc.l	$00E00C88
	dc.l	$00080A66
	dc.l	$00E00C88
	dc.l	$000A0C88
	dc.l	$00E00C88
	dc.l	$000C0EAA
	dc.l	$00E00C88
	dc.l	$00240A66
	dc.l	$00E00C88
	dc.l	$00260C88
	dc.l	$00E00C88
	dc.l	$00280EAA
	dc.l	$00E00C88
	dc.l	$000E0C88
	dc.l	$00E00C88
	dc.l	$000E0C88
	dc.l	$00E00C88
	dc.l	$000E0C88
	dc.l	$00E00C88
	dc.l	$001E0C88
	dc.l	$00E00C88
	dc.l	$001E0C88
	dc.l	$00E00C88
	dc.l	$001E0C88
	dc.l	$00E00C88
	dc.l	$00018071
	dc.l	$00FF0000
	dc.l	$00258004
	dc.l	$0A120123
	dc.l	$04351B45
	dc.l	$1E540B68
	dc.l	$FA740C89
	dc.l	$1200251C
	dc.l	$351A451D
	dc.l	$577CFF75
	dc.l	$0444447E
	dc.l	$222263D8
	dc.l	$2223D822
	dc.l	$23DCDEA0
	dc.l	$94596411
	dc.l	$26B27608
	dc.l	$88888888
	dc.l	$F727C4B2
	dc.l	$FB0B2FE6
	dc.l	$3F12CBEC
	dc.l	$2CB33EB5
	dc.l	$04A2C794
	dc.l	$41126B20
	dc.l	$88888FC4
	dc.l	$44444C9A
	dc.l	$F1659659
	dc.l	$ED66FBE2
	dc.l	$CB111126
	dc.l	$B3622513
	dc.l	$5BE7B5B2
	dc.l	$88262596
	dc.l	$596597F3
	dc.l	$288572B9
	dc.l	$5FE9AFF4
	dc.l	$D15F89A2
	dc.l	$88510CA2
	dc.l	$15C4AD51
	dc.l	$5FE9A2B5
	dc.l	$43CA2193
	dc.l	$504A37AD
	dc.l	$EB650935
	dc.l	$93B04444
	dc.l	$47B0B33E
	dc.l	$B504A37A
	dc.l	$DE9D5093
	dc.l	$E6576088
	dc.l	$888F6144
	dc.l	$1326A089
	dc.l	$F5AFA112
	dc.l	$6B27CD96
	dc.l	$59659666
	dc.l	$C4444444
	dc.l	$44449AC8
	dc.l	$22222222
	dc.l	$24D78C84
	dc.l	$288515F8
	dc.l	$9A28AFC4
	dc.l	$D15FE94A
	dc.l	$2146242B
	dc.l	$95C7BBE6
	dc.l	$FAF2B944
	dc.l	$3288572B
	dc.l	$8F77CF73
	dc.l	$DCF7327F
	dc.l	$A7DCDF37
	dc.l	$CDF37CF7
	dc.l	$FA726A08
	dc.l	$88888889
	dc.l	$359E37AB
	dc.l	$2CB2CB33
	dc.l	$DA822259
	dc.l	$E367BE64
	dc.l	$D412CDF3
	dc.l	$E8449ACB
	dc.l	$3DCDEA14
	dc.l	$4F9E2CC9
	dc.l	$D8597DFA
	dc.l	$2C7B9BD4
	dc.l	$112FB044
	dc.l	$49AC9F2C
	dc.l	$B3C59E2C
	dc.l	$CF6A0889
	dc.l	$3504449A
	dc.l	$CDEA0889
	dc.l	$3B6224D6
	dc.l	$6666664F
	dc.l	$9940809C
	dc.l	$80030114
	dc.l	$04240735
	dc.l	$14462E56
	dc.l	$31663073
	dc.l	$00810515
	dc.l	$177238ED
	dc.l	$82051618
	dc.l	$E378EA83
	dc.l	$0408176B
	dc.l	$38F448F3
	dc.l	$78F28407
	dc.l	$6E18E885
	dc.l	$08EE8608
	dc.l	$EB870405
	dc.l	$163328E2
	dc.l	$8808EC89
	dc.l	$05121634
	dc.l	$28F08A05
	dc.l	$13176F8B
	dc.l	$08EF18E6
	dc.l	$8C076A17
	dc.l	$6C8D0406
	dc.l	$162F28E9
	dc.l	$776D8E06
	dc.l	$32177028
	dc.l	$F18F08E7
	dc.l	$FFD9CDB3
	dc.l	$9914A953
	dc.l	$79E22A8C
	dc.l	$8B730645
	dc.l	$C15A9D37
	dc.l	$33DE9795
	dc.l	$BAF2A59D
	dc.l	$917052CE
	dc.l	$A732CF99
	dc.l	$52D459DF
	dc.l	$456A322C
	dc.l	$D18B4D4B
	dc.l	$5CC571CD
	dc.l	$8DE97964
	dc.l	$6764BE8A
	dc.l	$7A4DF731
	dc.l	$5B95D5D4
	dc.l	$E697D15D
	dc.l	$82325F34
	dc.l	$6757CD14
	dc.l	$ABAA66F9
	dc.l	$A31539A5
	dc.l	$EEB452A5
	dc.l	$5D4F15E8
	dc.l	$A30E2A2A
	dc.l	$2964CD33
	dc.l	$62CFC497
	dc.l	$BA9FD676
	dc.l	$EA3FED00
	dc.l	$000EDFF6
	dc.l	$818463AC
	dc.l	$0FEEE5B5
	dc.l	$8F957FA4
	dc.l	$9FD1B04F
	dc.l	$E4D706E7
	dc.l	$6FE26DF2
	dc.l	$EAFF88A7
	dc.l	$F25254DD
	dc.l	$7FF136F9
	dc.l	$757FC43E
	dc.l	$8F2A426E
	dc.l	$BFA32DB7
	dc.l	$FF4D3F85
	dc.l	$583FC148
	dc.l	$C6D07410
	dc.l	$952DD193
	dc.l	$73EDBC01
	dc.l	$006196DF
	dc.l	$F680001A
	dc.l	$B9B67E87
	dc.l	$25187160
	dc.l	$A59D5336
	dc.l	$BB892F75
	dc.l	$3CFB3B75
	dc.l	$6D0003FD
	dc.l	$910DFD4C
	dc.l	$B68001D1
	dc.l	$F478A374
	dc.l	$657F46D0
	dc.l	$004FDCA4
	dc.l	$5D0726FD
	dc.l	$A65B5800
	dc.l	$3FB220EE
	dc.l	$EEFDC5AB
	dc.l	$CE7A4DF7
	dc.l	$315B95D5
	dc.l	$D4ABDF45
	dc.l	$7609CFCB
	dc.l	$F59CB6D3
	dc.l	$D0FE8FB6
	dc.l	$3F45E9FF
	dc.l	$1175939F
	dc.l	$F7BCFB5B
	dc.l	$2FF1FFC4
	dc.l	$F97FC53F
	dc.l	$72F2A48B
	dc.l	$7F51BFFD
	dc.l	$168FE947
	dc.l	$1C7E8BF4
	dc.l	$768FD17F
	dc.l	$C4FF26D8
	dc.l	$7796FEA3
	dc.l	$7F7AFE38
	dc.l	$B4560C71
	dc.l	$C58D75DB
	dc.l	$CFFE27F6
	dc.l	$429FBFE9
	dc.l	$E7DA2046
	dc.l	$158C62B1
	dc.l	$7562EB6A
	dc.l	$6E7D5DFB
	dc.l	$21D68A8A
	dc.l	$55D5337C
	dc.l	$D19F34BD
	dc.l	$D7152AF9
	dc.l	$4DB7B1BE
	dc.l	$EFE69BCB
	dc.l	$66592F54
	dc.l	$52B4CDEF
	dc.l	$53995752
	dc.l	$A8ACA8A7
	dc.l	$32A5516E
	dc.l	$57FDE82A
	dc.l	$568C73B9
	dc.l	$91AEBDFF
	dc.l	$7B72E0B4
	dc.l	$63D28A59
	dc.l	$D917154B
	dc.l	$E9C4592B
	dc.l	$AB9B6720
	dc.l	$000035D1
	dc.l	$6C2D85B0
	dc.l	$B616C2D8
	dc.l	$5B0B1B1D
	dc.l	$20CB1836
	dc.l	$C2D85A93
	dc.l	$91B616A6
	dc.l	$FC20F7D6
	dc.l	$9184018C
	dc.l	$E46784E1
	dc.l	$F7A45231
	dc.l	$9C486339
	dc.l	$0BA604A7
	dc.l	$8419CA72
	dc.l	$A9B616C7
	dc.l	$8F1E39DD
	dc.l	$C78F1E3C
	dc.l	$718DA348
	dc.l	$3C600000
	dc.l	$3000000C
	dc.l	$2DCBF795
	dc.l	$A2E0B463
	dc.l	$D3467645
	dc.l	$06FA7116
	dc.l	$4B775BB3
	dc.l	$F3FC74F4
	dc.l	$01E7E021
	dc.l	$FF7577A3
	dc.l	$CE3C0CAE
	dc.l	$98491999
	dc.l	$C0012466
	dc.l	$67ACC8FE
	dc.l	$AB5DD000
	dc.l	$002448CC
	dc.l	$C243EB00
	dc.l	$000DABF9
	dc.l	$8B576637
	dc.l	$9BCDE58A
	dc.l	$964BDD4A
	dc.l	$D33762A7
	dc.l	$32AEA551
	dc.l	$6DB3BF57
	dc.l	$3760C200
	dc.l	$C200B52A
	dc.l	$60D9EA9C
	dc.l	$AD7427F0
	dc.l	$A0FF47AA
	dc.l	$3FC2FFD2
	dc.l	$D3973569
	dc.l	$0253367E
	dc.l	$3FD0BF6D
	dc.l	$9FF6557A
	dc.l	$FE622CF6
	dc.l	$4AD9EB84
	dc.l	$07B3D9EA
	dc.l	$F57B3D9E
	dc.l	$AF57B3DA
	dc.l	$9CD5B695
	dc.l	$F44B1ED3
	dc.l	$6E5FC24F
	dc.l	$F09AFF8B
	dc.l	$FE27F84F
	dc.l	$5E3AD92C
	dc.l	$00000AF7
	dc.l	$EAECE6D8
	dc.l	$54AA2DCB
	dc.l	$4E9054AD
	dc.l	$18E7730B
	dc.l	$EDFC1B40
	dc.l	$0318AE10
	dc.l	$0719D20C
	dc.l	$80A8494D
	dc.l	$254D6F5F
	dc.l	$2FE9CA0E
	dc.l	$9064009A
	dc.l	$4A692D69
	dc.l	$AD3CBCA5
	dc.l	$07480024
	dc.l	$D2537D69
	dc.l	$AD3CBC8E
	dc.l	$907F4406
	dc.l	$35494E95
	dc.l	$4D6FFD3A
	dc.l	$A7F8CC00
	dc.l	$30800616
	dc.l	$FD676BAB
	dc.l	$51916746
	dc.l	$9A96B98A
	dc.l	$E39B1BD2
	dc.l	$FA33B5BF
	dc.l	$2BCFDA1E
	dc.l	$7E020CBF
	dc.l	$94FFD301
	dc.l	$348D20CA
	dc.l	$E9BCE241
	dc.l	$E53794D3
	dc.l	$5BC00FA4
	dc.l	$24032498
	dc.l	$8797EA92
	dc.l	$13D007D2
	dc.l	$00174A78
	dc.l	$6B01EDAB
	dc.l	$9B673229
	dc.l	$52A8C788
	dc.l	$AA322DCC
	dc.l	$191705BB
	dc.l	$A6DFD1B0
	dc.l	$00610058
	dc.l	$D8F6BFF0
	dc.l	$5EB8F1F6
	dc.l	$9B1B7F47
	dc.l	$FA5AFFA2
	dc.l	$9FD3AE91
	dc.l	$5D22AF18
	dc.l	$CFBDEB2A
	dc.l	$4CD4CBF5
	dc.l	$475DA2A6
	dc.l	$A6C6A6A6
	dc.l	$A6BE55D2
	dc.l	$2BA455EB
	dc.l	$8CE4F5BA
	dc.l	$66B2FDD1
	dc.l	$D7635353
	dc.l	$63535353
	dc.l	$5F2ED363
	dc.l	$6FE0E157
	dc.l	$EDE34EDB
	dc.l	$1B18FE17
	dc.l	$23FC1F24
	dc.l	$8368BAC2
	dc.l	$B1756318
	dc.l	$C600C2DD
	dc.l	$BAB91BD2
	dc.l	$FC2F2A59
	dc.l	$D917052D
	dc.l	$76659F32
	dc.l	$A593869C
	dc.l	$20FF8800
	dc.l	$003D5FE2
	dc.l	$00003673
	dc.l	$6CE6A952
	dc.l	$A5518F11
	dc.l	$54645B98
	dc.l	$322E0B77
	dc.l	$4D7FC678
	dc.l	$4B2FD196
	dc.l	$459A3169
	dc.l	$A96B98AE
	dc.l	$39B1BD2F
	dc.l	$2C8CEDFB
	dc.l	$EF4F1D38
	dc.l	$4AF3C455
	dc.l	$1916E60C
	dc.l	$8B82B53A
	dc.l	$72FF1F8F
	dc.l	$E8F285BA
	dc.l	$F2A59D91
	dc.l	$7052CEA7
	dc.l	$32CF9952
	dc.l	$C7C74E11
	dc.l	$E32CBF46
	dc.l	$591668C5
	dc.l	$A6A5AE62
	dc.l	$B8E6C6F4
	dc.l	$BCB233B6
	dc.l	$5D25932B
	dc.l	$D2F2B75E
	dc.l	$54B3B22E
	dc.l	$0A59D4E6
	dc.l	$59F32A58
	dc.l	$E5B39B65
	dc.l	$400001CF
	dc.l	$ABFA29D2
	dc.l	$6FB98ADC
	dc.l	$AEAEA55E
	dc.l	$FA2BB07E
	dc.l	$5FACE5B4
	dc.l	$003F9224
	dc.l	$9FD4DB78
	dc.l	$001FDCBC
	dc.l	$A924DDFC
	dc.l	$8D98DE6F
	dc.l	$37962A59
	dc.l	$2F752B4C
	dc.l	$DD8A9CCA
	dc.l	$BA9545DD
	dc.l	$DDCFD9DD
	dc.l	$6ECEF780
	dc.l	$000308C2
	dc.l	$00C67218
	dc.l	$EFC229BB
	dc.l	$BBB3BFF2
	dc.l	$BD9DE8A5
	dc.l	$4AA31E22
	dc.l	$A8C8B730
	dc.l	$645C16EF
	dc.l	$DEFF8400
	dc.l	$01FDCBCA
	dc.l	$90649391
	dc.l	$9C4824E4
	dc.l	$0CD25FBA
	dc.l	$309E69E0
	dc.l	$FA3CB19F
	dc.l	$84E40094
	dc.l	$D2537D69
	dc.l	$ADF44D21
	dc.l	$E1E2ED00
	dc.l	$0929E1AF
	dc.l	$1F048327
	dc.l	$919CA724
	dc.l	$9800CA69
	dc.l	$29BEB4D7
	dc.l	$4F0A49E4
	dc.l	$FFC90000
	dc.l	$9FB91249
	dc.l	$1FDD1926
	dc.l	$FD692795
	dc.l	$25348A45
	dc.l	$DE00CD34
	dc.l	$FD518491
	dc.l	$DE9A0001
	dc.l	$9833A4B7
	dc.l	$98329C8E
	dc.l	$F8329833
	dc.l	$C6604809
	dc.l	$4D253494
	dc.l	$CE98CA78
	dc.l	$6B176974
	dc.l	$D2124F3A
	dc.l	$4B79D674
	dc.l	$3BE2E94F
	dc.l	$0D62ED2E
	dc.l	$9A4249E7
	dc.l	$496F3074
	dc.l	$8DE00174
	dc.l	$C19BCBF5
	dc.l	$460DB57E
	dc.l	$BFB36516
	dc.l	$8A8A55D5
	dc.l	$337CD19F
	dc.l	$34BDD715
	dc.l	$2AFCFDFA
	dc.l	$B9B65401
	dc.l	$D7FE232C
	dc.l	$BCD52FA7
	dc.l	$1164D9CD
	dc.l	$B39003AB
	dc.l	$2D384B83
	dc.l	$29CCABA9
	dc.l	$545AECEF
	dc.l	$D5FAB007
	dc.l	$579F8DCC
	dc.l	$8D75FABF
	dc.l	$C200EAD3
	dc.l	$2F354BE9
	dc.l	$C45932CC
	dc.l	$E77952A8
	dc.l	$B72D3A41
	dc.l	$52B0EC73
	dc.l	$B991AEBE
	dc.l	$BFECDA0F
	dc.l	$EE5E5495
	dc.l	$37A45204
	dc.l	$A69D195F
	dc.l	$C36B03FB
	dc.l	$9795254D
	dc.l	$E914814E
	dc.l	$8C9BA32D
	dc.l	$AC3F9292
	dc.l	$BA54DE91
	dc.l	$48790E8C
	dc.l	$9BA32DAC
	dc.l	$254D122E
	dc.l	$80670646
	dc.l	$703BBB2D
	dc.l	$5ECEEB57
	dc.l	$2BD2FC2F
	dc.l	$2A59D917
	dc.l	$052D7665
	dc.l	$9F32A58F
	dc.l	$7F773F36
	dc.l	$CA814D04
	dc.l	$00F39633
	dc.l	$9000018C
	dc.l	$E58CE58C
	dc.l	$E40CE1FF
	dc.l	$55176B00
	dc.l	$61A41919
	dc.l	$C8CE0249
	dc.l	$270000F2
	dc.l	$49EB497E
	dc.l	$A8C3FA04
	dc.l	$EAF3F1B9
	dc.l	$91AEBF57
	dc.l	$EE38EA65
	dc.l	$FAA30FE8
	dc.l	$13AB4CBC
	dc.l	$D52FA711
	dc.l	$64FCAF67
	dc.l	$7ECE529E
	dc.l	$1AC5DD59
	dc.l	$69C25C19
	dc.l	$4E655D4A
	dc.l	$A2D75775
	dc.l	$B9FF5692
	dc.l	$9E1AC3F5
	dc.l	$79F8DCC8
	dc.l	$D75F5FF6
	dc.l	$6D07F922
	dc.l	$54DE9148
	dc.l	$0EDD1937
	dc.l	$465B41FE
	dc.l	$C887FDD5
	dc.l	$DE81BA32
	dc.l	$DBFBD074
	dc.l	$1000A374
	dc.l	$65B7F7A0
	dc.l	$FF644194
	dc.l	$D37BC3EB
	dc.l	$0749CA72
	dc.l	$800001E7
	dc.l	$2C67E10F
	dc.l	$3F010FFB
	dc.l	$ABBD0079
	dc.l	$F8527E00
	dc.l	$000527E0
	dc.l	$9A24E400
	dc.l	$0004D127
	dc.l	$ACCBF746
	dc.l	$13CC1EAC
	dc.l	$B4E12E0C
	dc.l	$A732AEA5
	dc.l	$516BF95B
	dc.l	$7771F619
	dc.l	$7F29FFA6
	dc.l	$3ABCFC6E
	dc.l	$646BAFD5
	dc.l	$FD8B197F
	dc.l	$29FFA63A
	dc.l	$B4CBCD52
	dc.l	$FA71164D
	dc.l	$5DDC7F95
	dc.l	$ECB197F2
	dc.l	$9FFA63AB
	dc.l	$2D384B83
	dc.l	$29CCABA9
	dc.l	$545AECB7
	dc.l	$776733CA
	dc.l	$786B09D5
	dc.l	$E7E37323
	dc.l	$5D7D7FD8
	dc.l	$7FD80000
	dc.l	$1FFE7FB0
	dc.l	$0000FFE7
	dc.l	$FB39C000
	dc.l	$0D58C000
	dc.l	$00350000
	dc.l	$00630000
	dc.l	$00FF3770
	dc.l	$C780000C
	dc.l	$7803C2ED
	dc.l	$C9B81F1A
	dc.l	$640CCCEE
	dc.l	$99F1DDFB
	dc.l	$E003FEF8
	dc.l	$E472A6E3
	dc.l	$B93F5576
	dc.l	$FE8CB77E
	dc.l	$F8000009
	dc.l	$FB6FDC00
	dc.l	$0003F7C0
	dc.l	$009F9600
	dc.l	$63F96007
	dc.l	$E59FF4C9
	dc.l	$D67ADE69
	dc.l	$A9260EAF
	dc.l	$CB6AFCB6
	dc.l	$AEB000EB
	dc.l	$1A86396E
	dc.l	$FE475E19
	dc.l	$63C06390
	dc.l	$C80F1DDF
	dc.l	$BE9DDBF7
	dc.l	$633CAE9B
	dc.l	$CCE4FBCE
	dc.l	$E396FFD2
	dc.l	$3F40CB71
	dc.l	$FDF19A65
	dc.l	$34DD3DC9
	dc.l	$BA9BBC5E
	dc.l	$774D3765
	dc.l	$FAA3D09F
	dc.l	$B407FB1C
	dc.l	$00031EB9
	dc.l	$E1A86AFC
	dc.l	$B6AFCB6A
	dc.l	$EB0319DD
	dc.l	$D74EB9A7
	dc.l	$5EFD4762
	dc.l	$6C1D7A80
	dc.l	$18CC6AC7
	dc.l	$50C2DFEE
	dc.l	$00000FF8
	dc.l	$F57F8C00
	dc.l	$00F2FF18
	dc.l	$00007FC6
	dc.l	$7FFFDBFA
	dc.l	$6AD15FF7
	dc.l	$A0A95A31
	dc.l	$CEE646BA
	dc.l	$FAFFB2BB
	dc.l	$2BD7CB55
	dc.l	$168C7A51
	dc.l	$4B3B22E2
	dc.l	$A97D388B
	dc.l	$272FCB72
	dc.l	$FFE6CE93
	dc.l	$796CCB25
	dc.l	$EA8A5699
	dc.l	$BDEA732A
	dc.l	$EA5515B9
	dc.l	$75D7F4C7
	dc.l	$657AF96A
	dc.l	$A2D18F4A
	dc.l	$2967645C
	dc.l	$552FA711
	dc.l	$64008047
	dc.l	$80030013
	dc.l	$02240834
	dc.l	$0A451758
	dc.l	$F4663A76
	dc.l	$36810301
	dc.l	$15162777
	dc.l	$82051817
	dc.l	$76830303
	dc.l	$151A2779
	dc.l	$84063817
	dc.l	$788608F6
	dc.l	$87040916
	dc.l	$3728F58C
	dc.l	$18F78D05
	dc.l	$191639FF
	dc.l	$F7FCDFBF
	dc.l	$E6D48912
	dc.l	$391EA256
	dc.l	$54DF3B65
	dc.l	$4F539AFD
	dc.l	$6DF31CAE
	dc.l	$44DF9123
	dc.l	$31953D48
	dc.l	$CC48DC66
	dc.l	$37123353
	dc.l	$F8AE6A73
	dc.l	$5953F8A5
	dc.l	$919FC548
	dc.l	$CDF227D3
	dc.l	$7C8E5723
	dc.l	$2B319FDE
	dc.l	$7EC76DB6
	dc.l	$DB6DB6F7
	dc.l	$FE8C8FD6
	dc.l	$8E6F9137
	dc.l	$989891BA
	dc.l	$E6A633B2
	dc.l	$CAE7F14B
	dc.l	$3131BA91
	dc.l	$312B78DD
	dc.l	$6448DD73
	dc.l	$1352244C
	dc.l	$48F5E54E
	dc.l	$DD7AD4A9
	dc.l	$195BADF2
	dc.l	$331EAB98
	dc.l	$91E27F75
	dc.l	$24791ABB
	dc.l	$06E60C11
	dc.l	$65AA30F6
	dc.l	$4D6B09C1
	dc.l	$8B220C15
	dc.l	$68B2608B
	dc.l	$2D41A208
	dc.l	$30477D23
	dc.l	$B75DE8A2
	dc.l	$1AB2B30E
	dc.l	$3BAD411F
	dc.l	$88F7FCFE
	dc.l	$7F1FF8CE
	dc.l	$2311D960
	dc.l	$6230BB47
	dc.l	$65C0C0EC
	dc.l	$BC462B03
	dc.l	$031181FA
	dc.l	$2F0B1B75
	dc.l	$FA2AC2C0
	dc.l	$E1765DB8
	dc.l	$1C47E897
	dc.l	$88C0F03F
	dc.l	$68303F48
	dc.l	$3C5F818B
	dc.l	$E231181D
	dc.l	$978AC471
	dc.l	$B2FCCFE3
	dc.l	$BF55F9E2
	dc.l	$3D46F790
	dc.l	$6E60C116
	dc.l	$5BD189D9
	dc.l	$4ADFD94C
	dc.l	$18B220C1
	dc.l	$568B2904
	dc.l	$596F0688
	dc.l	$20C11DF7
	dc.l	$476EBBD1
	dc.l	$444AB2B4
	dc.l	$898EEB78
	dc.l	$23F11F95
	dc.l	$FD17E3FF
	dc.l	$119BFF34
	dc.l	$7233B8CA
	dc.l	$E65489AD
	dc.l	$E3991B89
	dc.l	$8912A732
	dc.l	$A46E244A
	dc.l	$9BCC7EF7
	dc.l	$61226B23
	dc.l	$7BE566FC
	dc.l	$C7EF6F3D
	dc.l	$4D647EB5
	dc.l	$48CC654F
	dc.l	$A4AE6BD4
	dc.l	$657E27F1
	dc.l	$5CFE6BC3
	dc.l	$BFF0C683
	dc.l	$B06B4510
	dc.l	$6AD1A22C
	dc.l	$0C105165
	dc.l	$11604146
	dc.l	$E63F67B0
	dc.l	$20D316BB
	dc.l	$4EFA8FD9
	dc.l	$DCF4698F
	dc.l	$28870D1F
	dc.l	$42B55DC3
	dc.l	$5F8FCFE3
	dc.l	$BF19CFB8
	dc.l	$C0C2C5F1
	dc.l	$1FB4D860
	dc.l	$62B81DAF
	dc.l	$C2E2FE23
	dc.l	$F697C758
	dc.l	$AE07E916
	dc.l	$0711C2C7
	dc.l	$A6178AFD
	dc.l	$10E238FC
	dc.l	$B7F12FFC
	dc.l	$41E071D8
	dc.l	$70BC6160
	dc.l	$62BB478C
	dc.l	$0EC31181
	dc.l	$858CFE7B
	dc.l	$F19F8EFC
	dc.l	$67E6E6FF
	dc.l	$C71B89B0
	dc.l	$95B9441A
	dc.l	$B46E4581
	dc.l	$820A3251
	dc.l	$1604146E
	dc.l	$63F6FB02
	dc.l	$0D48B5E5
	dc.l	$4DF78FDB
	dc.l	$DCF46A47
	dc.l	$AA226251
	dc.l	$F42B7AEE
	dc.l	$257F5A88
	dc.l	$208D0EE0
	dc.l	$A68DDECD
	dc.l	$1E8BAF37
	dc.l	$71A5A06F
	dc.l	$A043868F
	dc.l	$443822C1
	dc.l	$C5810E8E
	dc.l	$3545D347
	dc.l	$0987821D
	dc.l	$D83E9663
	dc.l	$4B41A70F
	dc.l	$F1FFABFC
	dc.l	$47E33F30
	dc.l	$3C2F0317
	dc.l	$F030388E
	dc.l	$163AC0E2
	dc.l	$303B0E23
	dc.l	$B0C0E2B1
	dc.l	$EDE2B1C5
	dc.l	$70B1ECB8
	dc.l	$1C7B6071
	dc.l	$7E063D3B
	dc.l	$703C2F03
	dc.l	$85C470BB
	dc.l	$78FCB2C0
	dc.l	$C0C0F03F
	dc.l	$4430B858
	dc.l	$BF1B70B1
	dc.l	$D638AFD2
	dc.l	$7E273EFC
	dc.l	$FBA20823
	dc.l	$71DC1528
	dc.l	$DE76947A
	dc.l	$335EB798
	dc.l	$DD6E0DF7
	dc.l	$044C4A3D
	dc.l	$11304584
	dc.l	$C5811347
	dc.l	$DB7A3352
	dc.l	$8FB2913E
	dc.l	$C44DE41F
	dc.l	$4B48DD6E
	dc.l	$254C4FE1
	dc.l	$7DBF0BED
	dc.l	$6EC1869D
	dc.l	$DC7EC760
	dc.l	$C3A23572
	dc.l	$8DED1FB1
	dc.l	$BBE9D11D
	dc.l	$D3060A7E
	dc.l	$8D5ABC83
	dc.l	$07B7F06F
	dc.l	$FC116074
	dc.l	$0AB34C3A
	dc.l	$D4598D07
	dc.l	$0C34FBE0
	dc.l	$BEC2CAC1
	dc.l	$DEC18305
	dc.l	$3E9830C6
	dc.l	$818D060D
	dc.l	$3C5A99A2
	dc.l	$9E11070C
	dc.l	$1B90FD34
	dc.l	$45958146
	dc.l	$0AD5BB26
	dc.l	$1862C3C8
	dc.l	$68A773B1
	dc.l	$4FA66BFE
	dc.l	$38EF0E34
	dc.l	$9870D6A3
	dc.l	$488634AD
	dc.l	$0E9861C3
	dc.l	$1E6C9EDD
	dc.l	$79A6982B
	dc.l	$4B4418F2
	dc.l	$AD0C587E
	dc.l	$C431DC5A
	dc.l	$E43BB870
	dc.l	$C695A9C1
	dc.l	$D97E33F3
	dc.l	$FF9EFD7B
	dc.l	$83164418
	dc.l	$2AD164C1
	dc.l	$165A8344
	dc.l	$10608EFA
	dc.l	$476EBBD1
	dc.l	$44356566
	dc.l	$1C775A82
	dc.l	$343F6608
	dc.l	$F235760D
	dc.l	$CC1822CB
	dc.l	$5461ED04
	dc.l	$7E8A0828
	dc.l	$DCC7ECF6
	dc.l	$041A62D7
	dc.l	$69DF51FB
	dc.l	$3B9E8D31
	dc.l	$E510E1A3
	dc.l	$E856ABB8
	dc.l	$70FB7F0E
	dc.l	$FFC31A0E
	dc.l	$C1AD1441
	dc.l	$AB4688B0
	dc.l	$304147CE
	dc.l	$19EC34B4
	dc.l	$0DF40870
	dc.l	$D1E88704
	dc.l	$5838B021
	dc.l	$D1C6A8BA
	dc.l	$68E130F0
	dc.l	$43BB07D2
	dc.l	$CC696834
	dc.l	$E1AB6BB2
	dc.l	$2082343B
	dc.l	$829A377B
	dc.l	$347A2EBC
	dc.l	$FB7ED27C
	dc.l	$1871A4C3
	dc.l	$86B51A44
	dc.l	$31A56874
	dc.l	$C30E18F3
	dc.l	$64F6EBCD
	dc.l	$34C15A5A
	dc.l	$20C79568
	dc.l	$62C3F621
	dc.l	$8EE2D721
	dc.l	$DDC38634
	dc.l	$AD4E0ED0
	dc.l	$C7E8A186
	dc.l	$9DDC7EC7
	dc.l	$60C3A235
	dc.l	$728DED1F
	dc.l	$B1BBE9D1
	dc.l	$1DD3060A
	dc.l	$7E8D5ABC
	dc.l	$8307B7F0
	dc.l	$6FFC1160
	dc.l	$740AB34C
	dc.l	$3AD4598D
	dc.l	$070C34FB
	dc.l	$E0BEC2CA
	dc.l	$C1DEC183
	dc.l	$053E9830
	dc.l	$C6818D06
	dc.l	$0D3C5A99
	dc.l	$A29E1107
	dc.l	$0C1B90FD
	dc.l	$34459581
	dc.l	$460AD5BB
	dc.l	$261862C3
	dc.l	$C868A773
	dc.l	$B14FA66B
	dc.l	$BFE33FDF
	dc.l	$B6DB6DB6
	dc.l	$DB7E3FF3
	dc.l	$7EFDC4ED
	dc.l	$D7AF5233
	dc.l	$12B7CDFD
	dc.l	$57312B23
	dc.l	$F7B1FAD1
	dc.l	$CDF226F3
	dc.l	$13122639
	dc.l	$A98CED1F
	dc.l	$CD19A9EA
	dc.l	$6B23F5B5
	dc.l	$98CA9D87
	dc.l	$35EA3319
	dc.l	$FCD7EF7D
	dc.l	$391C8E46
	dc.l	$448CAE62
	dc.l	$44D6F191
	dc.l	$23713122
	dc.l	$54C4E7F5
	dc.l	$5139ACA9
	dc.l	$FC5567F1
	dc.l	$52337C89
	dc.l	$F4DF2395
	dc.l	$CD6632B7
	dc.l	$E7F34A44
	dc.l	$89591EA2
	dc.l	$5654DF3B
	dc.l	$654F537F
	dc.l	$D6808080
	dc.l	$80040214
	dc.l	$03240635
	dc.l	$12451355
	dc.l	$18663373
	dc.l	$00810405
	dc.l	$16368204
	dc.l	$04163828
	dc.l	$F4830407
	dc.l	$16372779
	dc.l	$84063585
	dc.l	$063418F7
	dc.l	$86051117
	dc.l	$76870510
	dc.l	$17748805
	dc.l	$1518F689
	dc.l	$05141778
	dc.l	$8A07728B
	dc.l	$07738C05
	dc.l	$1618F58D
	dc.l	$06328E07
	dc.l	$758F0517
	dc.l	$1777FF00
	dc.l	$00000000
	dc.l	$338E2388
	dc.l	$82494492
	dc.l	$188A8C7E
	dc.l	$52511FA6
	dc.l	$00671006
	dc.l	$71031DA5
	dc.l	$DA713F73
	dc.l	$897BB44B
	dc.l	$4944B42F
	dc.l	$D89ED289
	dc.l	$6B159449
	dc.l	$345944F4
	dc.l	$568B2976
	dc.l	$34D3634D
	dc.l	$212D21FC
	dc.l	$1D369A80
	dc.l	$33D7B2CF
	dc.l	$8D35FD0F
	dc.l	$63486C51
	dc.l	$24289C49
	dc.l	$0A388CD2
	dc.l	$38883ED0
	dc.l	$D4BF49C3
	dc.l	$8FFB1FFD
	dc.l	$B34FF2C0
	dc.l	$17F5CFF4
	dc.l	$CDB52A51
	dc.l	$9AD4A38A
	dc.l	$1466A299
	dc.l	$A92B2F88
	dc.l	$B7B74525
	dc.l	$AFE9D62A
	dc.l	$7D3B6928
	dc.l	$47435688
	dc.l	$92941738
	dc.l	$4D4F49FB
	dc.l	$5346A129
	dc.l	$50EF284D
	dc.l	$4A07789A
	dc.l	$9F6A7625
	dc.l	$D7D39C33
	dc.l	$B7E77F8C
	dc.l	$3F6C3F4D
	dc.l	$2E0FB1F4
	dc.l	$F73EDFA7
	dc.l	$2F79F42D
	dc.l	$0B668169
	dc.l	$8817EC5A
	dc.l	$022A7B03
	dc.l	$82F6D8D4
	dc.l	$A0506E91
	dc.l	$817E9FDF
	dc.l	$A2B5E168
	dc.l	$EC75855E
	dc.l	$24A7D4DC
	dc.l	$D4A8CB9C
	dc.l	$230A954F
	dc.l	$87BC2E7E
	dc.l	$B0B359A1
	dc.l	$FAC6FCDC
	dc.l	$31684F62
	dc.l	$52FD09A9
	dc.l	$29AFFB6D
	dc.l	$9FFD8013
	dc.l	$FD31FE99
	dc.l	$A32F7969
	dc.l	$AACB45CD
	dc.l	$4E21BA05
	dc.l	$27940F47
	dc.l	$28C0F68C
	dc.l	$BB0289EC
	dc.l	$E0DCF706
	dc.l	$A1BC7528
	dc.l	$9C69D69D
	dc.l	$5E50944B
	dc.l	$F37CB29A
	dc.l	$E14B2389
	dc.l	$AE4716B1
	dc.l	$C67DA710
	dc.l	$000311C4
	dc.l	$46220000
	dc.l	$67102206
	dc.l	$71C44A33
	dc.l	$EC00C7E9
	dc.l	$8FF4CDD8
	dc.l	$018B83B8
	dc.l	$35BE3ADC
	dc.l	$BB929A97
	dc.l	$7FCF1F56
	dc.l	$53EB9AF7
	dc.l	$6B8025DA
	dc.l	$713FD30E
	dc.l	$C00FEB0E
	dc.l	$C0001AF2
	dc.l	$BACAE57E
	dc.l	$A7D5AE77
	dc.l	$5BA9773B
	dc.l	$9752EF8E
	dc.l	$E77EB9AC
	dc.l	$EFD735C5
	dc.l	$C3467D8B
	dc.l	$F8C000D1
	dc.l	$11110233
	dc.l	$B800677C
	dc.l	$EF9DCA23
	dc.l	$11188E22
	dc.l	$00025E5B
	dc.l	$73537DA6
	dc.l	$E813F42D
	dc.l	$C1C0D1A2
	dc.l	$84984CFD
	dc.l	$02038A32
	dc.l	$35CD2543
	dc.l	$F4FD4CBF
	dc.l	$37E25FAB
	dc.l	$D269D714
	dc.l	$EF8AF2CF
	dc.l	$962DACED
	dc.l	$9FEB1C79
	dc.l	$342AB6ED
	dc.l	$59297784
	dc.l	$9FD207D1
	dc.l	$93A229DE
	dc.l	$09680017
	dc.l	$D5F9DA85
	dc.l	$A4FF35FD
	dc.l	$12E65E3D
	dc.l	$FF36D4D7
	dc.l	$440DCA8B
	dc.l	$4E553E49
	dc.l	$449237B4
	dc.l	$B94ED969
	dc.l	$94FF43FA
	dc.l	$D2FDE7EB
	dc.l	$71E5B735
	dc.l	$37DA6E81
	dc.l	$3F42DC1C
	dc.l	$0D1A2849
	dc.l	$84CFD020
	dc.l	$38A3235C
	dc.l	$D2543E3C
	dc.l	$4F9A3951
	dc.l	$93A97295
	dc.l	$2E74954B
	dc.l	$924EA396
	dc.l	$2DADA56C
	dc.l	$FF78E3C9
	dc.l	$A155B76A
	dc.l	$C94BBC24
	dc.l	$FE903E8C
	dc.l	$9D114A17
	dc.l	$24D3A801
	dc.l	$6DCDFD4A
	dc.l	$9A4FF35F
	dc.l	$D12E65EF
	dc.l	$FBB3D744
	dc.l	$135A24E8
	dc.l	$98E334AE
	dc.l	$32D3295B
	dc.l	$62FD697E
	dc.l	$B3F7B8F2
	dc.l	$DB9A9BED
	dc.l	$37409FA1
	dc.l	$6E0E068D
	dc.l	$1424C267
	dc.l	$E8101C51
	dc.l	$91AE692A
	dc.l	$1F1E27CD
	dc.l	$1CA8C9D4
	dc.l	$B94A973A
	dc.l	$4AA5C927
	dc.l	$51CB16D6
	dc.l	$D2B67FBC
	dc.l	$71E4D0AA
	dc.l	$DBB564A5
	dc.l	$DE127F48
	dc.l	$1F464E88
	dc.l	$A50B9269
	dc.l	$D400B6E6
	dc.l	$FEA54D27
	dc.l	$F9AFE897
	dc.l	$32F7FDD9
	dc.l	$EBA209AD
	dc.l	$12744C70
	dc.l	$DF9D34AF
	dc.l	$E74B26D0
	dc.l	$F23F55FC
	dc.l	$EB7EB000
	dc.l	$00049BCD
	dc.l	$367CD416
	dc.l	$F87572D0
	dc.l	$B46572D1
	dc.l	$519494B8
	dc.l	$D8D4FF42
	dc.l	$5625252A
	dc.l	$1E9AB7EA
	dc.l	$49493B50
	dc.l	$BDCF5ED8
	dc.l	$424FCF35
	dc.l	$AB6A359A
	dc.l	$DA1FF700
	dc.l	$00320767
	dc.l	$93B38768
	dc.l	$C1495917
	dc.l	$45253822
	dc.l	$E99AE985
	dc.l	$D66BA92C
	dc.l	$B565286A
	dc.l	$A7E25B7B
	dc.l	$4225EE5B
	dc.l	$1A376D78
	dc.l	$DE3F946F
	dc.l	$D47EB4FF
	dc.l	$59FAD1BC
	dc.l	$B725675C
	dc.l	$392E10D6
	dc.l	$484B0643
	dc.l	$8A1A0CD0
	dc.l	$20428A49
	dc.l	$0EEC8D46
	dc.l	$4FD49F4F
	dc.l	$D5D0ABB3
	dc.l	$CF6343AF
	dc.l	$7AE5C1FB
	dc.l	$645546C9
	dc.l	$B896556C
	dc.l	$8B29FE76
	dc.l	$6E3C9A15
	dc.l	$5B70A57E
	dc.l	$8D07F481
	dc.l	$4120C903
	dc.l	$53BC12D0
	dc.l	$033AA9DE
	dc.l	$16A54BF7
	dc.l	$85CF96BF
	dc.l	$D142FD49
	dc.l	$6EBFC95C
	dc.l	$E9B782A1
	dc.l	$F8B2DC90
	dc.l	$EC4FAC6B
	dc.l	$EA563B6A
	dc.l	$766A9DA7
	dc.l	$EA0796DC
	dc.l	$D4DF69BA
	dc.l	$04356DE6
	dc.l	$9B1C0919
	dc.l	$4370101A
	dc.l	$C19194D3
	dc.l	$3F4F13E7
	dc.l	$4CB5973A
	dc.l	$6D3A779A
	dc.l	$5794F2B7
	dc.l	$2CF59E5B
	dc.l	$6321938F
	dc.l	$268556DD
	dc.l	$AB252ADE
	dc.l	$12D61C40
	dc.l	$E0A869D2
	dc.l	$77D12DA8
	dc.l	$19D50EF0
	dc.l	$B52B7FDE
	dc.l	$1725A7F0
	dc.l	$799F82FC
	dc.l	$D9F2FD48
	dc.l	$12E5E130
	dc.l	$93FCF636
	dc.l	$FCECD7F3
	dc.l	$B2CAC0FF
	dc.l	$667BCDF6
	dc.l	$9BF0B9AC
	dc.l	$F79BED27
	dc.l	$53565929
	dc.l	$F01032B2
	dc.l	$494933FE
	dc.l	$1151BC73
	dc.l	$2A1D364C
	dc.l	$F9CA8BA7
	dc.l	$12D56A91
	dc.l	$3C94D352
	dc.l	$C94AD53C
	dc.l	$97D6595B
	dc.l	$0F9AF924
	dc.l	$C3AB2C9C
	dc.l	$B6E8DA94
	dc.l	$38814160
	dc.l	$8690C5F4
	dc.l	$4001410E
	dc.l	$F0B6A57F
	dc.l	$DE7E869B
	dc.l	$71CDA8FD
	dc.l	$EA5FA99F
	dc.l	$82E5DEB3
	dc.l	$F62CA254
	dc.l	$3FCE96BC
	dc.l	$154F26E5
	dc.l	$A1652D33
	dc.l	$C8B2C643
	dc.l	$CB6E6A6F
	dc.l	$B4DD021A
	dc.l	$B6F34D8E
	dc.l	$048CA1B8
	dc.l	$080D60C8
	dc.l	$CA699FA5
	dc.l	$3F3CDEB0
	dc.l	$95A5A958
	dc.l	$EDF9EE47
	dc.l	$EA48382B
	dc.l	$4D3195E7
	dc.l	$967FAD71
	dc.l	$E4D0AADB
	dc.l	$B564A55B
	dc.l	$C25AC388
	dc.l	$1C150D3A
	dc.l	$4EFA25B5
	dc.l	$033AA1DE
	dc.l	$16A56FFB
	dc.l	$C2E4B6CB
	dc.l	$F63CCB99
	dc.l	$EE8D7A4F
	dc.l	$572D1686
	dc.l	$F42CB56A
	dc.l	$12610B29
	dc.l	$27E74B26
	dc.l	$C8F2C653
	dc.l	$FCE82FE1
	dc.l	$96F8DD4D
	dc.l	$6AC8A4B4
	dc.l	$921AC9E6
	dc.l	$E8A70245
	dc.l	$3534CFD0
	dc.l	$203581F0
	dc.l	$CA499FEC
	dc.l	$A9CB4973
	dc.l	$A15CF23A
	dc.l	$723C8FC1
	dc.l	$3B644857
	dc.l	$2C8D0935
	dc.l	$9653C864
	dc.l	$5FAD97EF
	dc.l	$5C79243A
	dc.l	$B3AA1D64
	dc.l	$A55BC25A
	dc.l	$C3881C15
	dc.l	$0D3A4EFA
	dc.l	$25B5033A
	dc.l	$A1DE16A5
	dc.l	$6FFBC2E4
	dc.l	$B6CBF63C
	dc.l	$CBF370DD
	dc.l	$0FF285AC
	dc.l	$DFA96B43
	dc.l	$7CFBC67F
	dc.l	$94AE762B
	dc.l	$62C002F2
	dc.l	$DB9A9BED
	dc.l	$374086AD
	dc.l	$C6D03468
	dc.l	$A126133F
	dc.l	$4080E28C
	dc.l	$8D734CF8
	dc.l	$FDC974FD
	dc.l	$5D0ABB3C
	dc.l	$F6343AF7
	dc.l	$A9707ED2
	dc.l	$400071E4
	dc.l	$D0AADBB5
	dc.l	$64A5DE6F
	dc.l	$C40E1A40
	dc.l	$D3A21294
	dc.l	$2FC43A80
	dc.l	$14A172B1
	dc.l	$50BF785C
	dc.l	$F96BFD1E
	dc.l	$65FA92DE
	dc.l	$BFC95CE9
	dc.l	$B782A1F8
	dc.l	$B2DE5657
	dc.l	$D63C5A5A
	dc.l	$D7A92E4D
	dc.l	$AE762B62
	dc.l	$C5963CB6
	dc.l	$E6A6FB4D
	dc.l	$D021AB71
	dc.l	$B40D1A28
	dc.l	$4984CFD0
	dc.l	$2038A323
	dc.l	$5CD33F4F
	dc.l	$D4CBF374
	dc.l	$C5794DFF
	dc.l	$3DCA7B4A
	dc.l	$DAF7E4D6
	dc.l	$2D637958
	dc.l	$91E7EA99
	dc.l	$D9C79342
	dc.l	$AB6ED592
	dc.l	$9779BF10
	dc.l	$3869034E
	dc.l	$86ADE92B
	dc.l	$C0A1D405
	dc.l	$958A85EA
	dc.l	$FCCB9F2D
	dc.l	$7FA3CCBF
	dc.l	$525F9B3F
	dc.l	$ECE36A15
	dc.l	$0A98A126
	dc.l	$D42F42F0
	dc.l	$01E59E42
	dc.l	$5E5B7353
	dc.l	$7DA6E810
	dc.l	$D5B8DA06
	dc.l	$8D1424C2
	dc.l	$67E8101C
	dc.l	$5191AE5D
	dc.l	$0BC1D76A
	dc.l	$7E6FC16C
	dc.l	$E742AF7A
	dc.l	$CFD8D233
	dc.l	$B475958A
	dc.l	$BD6566BC
	dc.l	$AC48F3F5
	dc.l	$4CECE3C9
	dc.l	$A155B76A
	dc.l	$C94BBCDF
	dc.l	$881C3481
	dc.l	$A74356F4
	dc.l	$95E050EA
	dc.l	$02CAC542
	dc.l	$F57E65CF
	dc.l	$96BFD142
	dc.l	$FD4923AF
	dc.l	$F24536F0
	dc.l	$543F0742
	dc.l	$497A013C
	dc.l	$B3C84BCB
	dc.l	$6F371870
	dc.l	$0019B80E
	dc.l	$371E4791
	dc.l	$B8768E91
	dc.l	$9B939B9B
	dc.l	$93CE3A44
	dc.l	$000DC61E
	dc.l	$7BB7900F
	dc.l	$7C3ABB6F
	dc.l	$34372565
	dc.l	$E9152B14
	dc.l	$5A04B1D8
	dc.l	$E06AD006
	dc.l	$B4C58949
	dc.l	$612AA92C
	dc.l	$4EC55A6C
	dc.l	$DFACF6C7
	dc.l	$A8379B92
	dc.l	$BCDF38EA
	dc.l	$AF272D4D
	dc.l	$CDC9C91A
	dc.l	$3A441280
	dc.l	$E0BB1DDC
	dc.l	$D6257B35
	dc.l	$7BDA5FAC
	dc.l	$00FF592B
	dc.l	$77AB5AE5
	dc.l	$1537B9F6
	dc.l	$04E028CD
	dc.l	$0964ECB3
	dc.l	$7504F375
	dc.l	$279B83F5
	dc.l	$C7B7EB1B
	dc.l	$6A54AC71
	dc.l	$275AC9C9
	dc.l	$D4AC6E4E
	dc.l	$54538A62
	dc.l	$0CA703DA
	dc.l	$2A506895
	dc.l	$8963D159
	dc.l	$49CD27BB
	dc.l	$3ABE3700
	dc.l	$00049E69
	dc.l	$CEB34A4E
	dc.l	$27468AD4
	dc.l	$B538ADCB
	dc.l	$F2871B95
	dc.l	$D655EFD7
	dc.l	$494392DB
	dc.l	$15E73400
	dc.l	$00000102
	dc.l	$1FECF6DF
	dc.l	$FAE502F4
	dc.l	$923204C4
	dc.l	$33ADCD1A
	dc.l	$F5646E4B
	dc.l	$0372C96A
	dc.l	$B025C949
	dc.l	$6AB0BA9D
	dc.l	$16AB3A57
	dc.l	$C7E84B8A
	dc.l	$17EA5249
	dc.l	$84346434
	dc.l	$000009F3
	dc.l	$D1F3D1CB
	dc.l	$DA5A3F7A
	dc.l	$95FAB5CD
	dc.l	$685A6A55
	dc.l	$2EB5862B
	dc.l	$CEDEC797
	dc.l	$39589719
	dc.l	$7425E735
	dc.l	$E72ED449
	dc.l	$50AB4E0E
	dc.l	$8AC874DA
	dc.l	$91D494BC
	dc.l	$47F2963E
	dc.l	$356B2000
	dc.l	$00000064
	dc.l	$32190193
	dc.l	$7E7734CD
	dc.l	$322CA591
	dc.l	$64279632
	dc.l	$03308030
	dc.l	$80030213
	dc.l	$03240834
	dc.l	$0C451A57
	dc.l	$7A663C76
	dc.l	$3A810200
	dc.l	$140B263B
	dc.l	$83040A15
	dc.l	$1C86077B
	dc.l	$87040915
	dc.l	$1B28F8FF
	dc.l	$FCAFF585
	dc.l	$FA35CD52
	dc.l	$344102B7
	dc.l	$CC22BA8E
	dc.l	$6AB5FC35
	dc.l	$C556A9F0
	dc.l	$6232E382
	dc.l	$B4408652
	dc.l	$198210B8
	dc.l	$BB43A66A
	dc.l	$BAA67856
	dc.l	$7FCFF05F
	dc.l	$A3822D88
	dc.l	$81DC5BA4
	dc.l	$2B7C8304
	dc.l	$220C1521
	dc.l	$0CD11FB3
	dc.l	$E908CA57
	dc.l	$AA75AE6A
	dc.l	$A38F88D7
	dc.l	$10AA299E
	dc.l	$0AA056AA
	dc.l	$2D0A9FEC
	dc.l	$78CEBCEF
	dc.l	$062A76EE
	dc.l	$95476F90
	dc.l	$2AEA0F0C
	dc.l	$A5FA362A
	dc.l	$8A67A1F3
	dc.l	$3B5597CD
	dc.l	$1594CFC1
	dc.l	$3A55F821
	dc.l	$56A91EAE
	dc.l	$971F153A
	dc.l	$8A7CC17E
	dc.l	$8D73548D
	dc.l	$1040ADF3
	dc.l	$08AEA39A
	dc.l	$AD7F0D71
	dc.l	$55AA7C18
	dc.l	$8CB8E0AD
	dc.l	$10219486
	dc.l	$60842E2E
	dc.l	$D0E99AAE
	dc.l	$A99E159F
	dc.l	$F3FC17E8
	dc.l	$E08B6220
	dc.l	$7716E90A
	dc.l	$DF20C108
	dc.l	$83054843
	dc.l	$3447ECFA
	dc.l	$423295EA
	dc.l	$9D6B9AA8
	dc.l	$E3E235C4
	dc.l	$2A8A6782
	dc.l	$A815AA8B
	dc.l	$42A7FB1E
	dc.l	$33AF3BC1
	dc.l	$8A9DBBA5
	dc.l	$51DBE40A
	dc.l	$BA83C329
	dc.l	$7E8D8AA2
	dc.l	$99E87CCE
	dc.l	$D565F345
	dc.l	$6533F04E
	dc.l	$957E0855
	dc.l	$AA47ABA5
	dc.l	$C7C54EA2
	dc.l	$9F305FA3
	dc.l	$5CD52344
	dc.l	$102B7CC2
	dc.l	$2BA8E6AB
	dc.l	$5FC35C55
	dc.l	$6A9F0623
	dc.l	$2E382B44
	dc.l	$08652198
	dc.l	$210B8BB4
	dc.l	$3A66ABAA
	dc.l	$678567FC
	dc.l	$FF05FA38
	dc.l	$22D8881D
	dc.l	$C5BA42B7
	dc.l	$C8304220
	dc.l	$C15210CD
	dc.l	$11FB3E90
	dc.l	$8CA57AA7
	dc.l	$5AE6AA38
	dc.l	$F88D710A
	dc.l	$A299E0AA
	dc.l	$056AA2D0
	dc.l	$A97BFDBD
	dc.l	$FE091D79
	dc.l	$DE0C52ED
	dc.l	$DCA98EDE
	dc.l	$E053D41E
	dc.l	$192BE18A
	dc.l	$6259E87B
	dc.l	$CED4E5EF
	dc.l	$44E4B3DB
	dc.l	$953EC53A
	dc.l	$947AB95B
	dc.l	$7B52E625
	dc.l	$EF05F0B7
	dc.l	$A9468820
	dc.l	$56F7844F
	dc.l	$51BD4EBF
	dc.l	$8EB6A6D4
	dc.l	$BD8C465C
	dc.l	$6C568810
	dc.l	$C9433042
	dc.l	$16D76872
	dc.l	$CD4F52CF
	dc.l	$09CFFBFB
	dc.l	$F8822D88
	dc.l	$81DC5B94
	dc.l	$2B7B8304
	dc.l	$220C14A1
	dc.l	$0CD11FB7
	dc.l	$E908C957
	dc.l	$A973ADEA
	dc.l	$636F68D6
	dc.l	$D0A6259E
	dc.l	$0A6056A6
	dc.l	$2D0A5FEC
	dc.l	$76CEBCEF
	dc.l	$062976EE
	dc.l	$54C76F70
	dc.l	$29EA0F0C
	dc.l	$95F0C531
	dc.l	$2CF43DE7
	dc.l	$6A72F7A2
	dc.l	$7259EDCA
	dc.l	$9F629D4A
	dc.l	$3D5CADBD
	dc.l	$A97312F7
	dc.l	$82F85BD4
	dc.l	$A344102B
	dc.l	$7BC227A8
	dc.l	$DEA75FC7
	dc.l	$5B536A5E
	dc.l	$C6232E36
	dc.l	$2B440864
	dc.l	$A198210B
	dc.l	$6BB43966
	dc.l	$A7A96784
	dc.l	$E7FDFDFC
	dc.l	$4116C440
	dc.l	$EE2DCA15
	dc.l	$BDC18211
	dc.l	$060A5086
	dc.l	$688FDBF4
	dc.l	$8464ABD4
	dc.l	$B9D6F531
	dc.l	$B7B46B68
	dc.l	$5312CF05
	dc.l	$302B5316
	dc.l	$852FF63B
	dc.l	$675E7783
	dc.l	$14BB772A
	dc.l	$63B7B814
	dc.l	$F507864A
	dc.l	$F8629896
	dc.l	$7A1EF3B5
	dc.l	$397BD139
	dc.l	$2CF6E54F
	dc.l	$B14EA51E
	dc.l	$AE56DED4
	dc.l	$B9897BC1
	dc.l	$7C2DEA51
	dc.l	$A20815BD
	dc.l	$E113D46F
	dc.l	$53AFE3AD
	dc.l	$A9B52F63
	dc.l	$11971B15
	dc.l	$A2043250
	dc.l	$CC1085B5
	dc.l	$DA1CB353
	dc.l	$D4B3C273
	dc.l	$E0000801
	dc.l	$00000024
	dc.l	$0A900290
	dc.l	$02900290
	dc.l	$02900290
	dc.l	$02900290
	dc.l	$02900290
	dc.l	$02900290
	dc.l	$0200002A
	dc.l	$40323900
	dc.l	$C0C0D0E0
	dc.l	$8340E404
	dc.l	$03430480
	dc.l	$0D038016
	dc.l	$900E000C
	dc.l	$2A41A239
	dc.l	$0683A240
	dc.l	$D103886C
	dc.l	$3A2A0070
	dc.l	$0E520D70
	dc.l	$0D520052
	dc.l	$00400E8A
	dc.l	$801C8001
	dc.l	$D1206881
	dc.l	$C4021D15
	dc.l	$003800A9
	dc.l	$00388000
	dc.l	$60CA2301
	dc.l	$00021D22
	dc.l	$4C02481C
	dc.l	$40445964
	dc.l	$6E2470D0
	dc.l	$0D81C808
	dc.l	$060683D8
	dc.l	$24500683
	dc.l	$4320526B
	dc.l	$7C89C002
	dc.l	$6B60720D
	dc.l	$874480F1
	dc.l	$1494D1E4
	dc.l	$310E135B
	dc.l	$E4510193
	dc.l	$5B038804
	dc.l	$3A2A1C88
	dc.l	$80226B7C
	dc.l	$8A81A26B
	dc.l	$7C89C040
	dc.l	$E8A801C4
	dc.l	$0A4D6F91
	dc.l	$38004D6F
	dc.l	$8944361D
	dc.l	$231C0318
	dc.l	$1C4384D6
	dc.l	$F9144064
	dc.l	$D6F99500
	dc.l	$20606870
	dc.l	$41A07101
	dc.l	$135BE454
	dc.l	$0D135BE6
	dc.l	$4E020744
	dc.l	$81A3C8C2
	dc.l	$0526B7C8
	dc.l	$9C0026B7
	dc.l	$CCA21B31
	dc.l	$18C3E865
	dc.l	$31998384
	dc.l	$D6F91440
	dc.l	$64D6F915
	dc.l	$002060A0
	dc.l	$1D40E875
	dc.l	$069AC044
	dc.l	$D6F91503
	dc.l	$44D6F913
	dc.l	$8081D0A0
	dc.l	$1E40E879
	dc.l	$121840A4
	dc.l	$D6F91380
	dc.l	$04D6F914
	dc.l	$4366213A
	dc.l	$1F8C6660
	dc.l	$E135BE05
	dc.l	$17DF7D60
	dc.l	$67A0A120
	dc.l	$807D1067
	dc.l	$A1612140
	dc.l	$7D1A2849
	dc.l	$E858485E
	dc.l	$0867D1A2
	dc.l	$849E8584
	dc.l	$85E0867D
	dc.l	$1A2849E8
	dc.l	$58485E08
	dc.l	$67D1A284
	dc.l	$90850E02
	dc.l	$143E38B4
	dc.l	$33E8D142
	dc.l	$484285C9
	dc.l	$14854585
	dc.l	$C716867D
	dc.l	$1067A5A1
	dc.l	$25807DF6
	dc.l	$A00682A4
	dc.l	$98A498A4
	dc.l	$98E2980E
	dc.l	$520D520D
	dc.l	$520D510D
	dc.l	$01C13549
	dc.l	$31493149
	dc.l	$314531C0
	dc.l	$35480148
	dc.l	$01480148
	dc.l	$01480148
	dc.l	$01480148
	dc.l	$01480148
	dc.l	$01480148
	dc.l	$01480100
	dc.l	$01FC0700
	dc.l	$00000003
	dc.l	$0A900A40
	dc.l	$29008000
	dc.l	$0E00A900
	dc.l	$A402900A
	dc.l	$2010A402
	dc.l	$900A4029
	dc.l	$0080002A
	dc.l	$4102A41F
	dc.l	$98706182
	dc.l	$05485511
	dc.l	$54422015
	dc.l	$21BC8685
	dc.l	$0D482400
	dc.l	$81522015
	dc.l	$227CC983
	dc.l	$24402A45
	dc.l	$A896A241
	dc.l	$00A919E4
	dc.l	$64892A44
	dc.l	$3810A402
	dc.l	$9000A91C
	dc.l	$E6701820
	dc.l	$01523F44
	dc.l	$FD100805
	dc.l	$49172440
	dc.l	$415201C0
	dc.l	$03BC0352
	dc.l	$09482520
	dc.l	$94423EDF
	dc.l	$124402A4
	dc.l	$968A5A24
	dc.l	$1F6F8820
	dc.l	$01525145
	dc.l	$45100FB7
	dc.l	$C43040A9
	dc.l	$2BA2AE88
	dc.l	$47DBE248
	dc.l	$8524B492
	dc.l	$D14B4483
	dc.l	$EDF10402
	dc.l	$928A4A28
	dc.l	$A8A201F6
	dc.l	$F8860815
	dc.l	$25D45751
	dc.l	$08FB7C49
	dc.l	$100A931A
	dc.l	$2C68907D
	dc.l	$BE208005
	dc.l	$49A51694
	dc.l	$403EDF10
	dc.l	$C102A4DE
	dc.l	$8B7A211F
	dc.l	$6F892201
	dc.l	$527545D5
	dc.l	$120FB7C4
	dc.l	$1000A93D
	dc.l	$A2F68807
	dc.l	$600401B0
	dc.l	$2904A412
	dc.l	$904A2138
	dc.l	$406C0E24
	dc.l	$20360522
	dc.l	$14885221
	dc.l	$4487080D
	dc.l	$81C40406
	dc.l	$C0A40290
	dc.l	$0A402880
	dc.l	$E101B038
	dc.l	$8480DF08
	dc.l	$34825209
	dc.l	$4825109C
	dc.l	$2037CA11
	dc.l	$080DF087
	dc.l	$48852214
	dc.l	$885121C2
	dc.l	$037CA200
	dc.l	$80DF08B4
	dc.l	$80520148
	dc.l	$05101C20
	dc.l	$37CA3048
	dc.l	$0DF08348
	dc.l	$25209482
	dc.l	$5109C203
	dc.l	$7CA11080
	dc.l	$DF087488
	dc.l	$52214885
	dc.l	$121C2037
	dc.l	$CA20080D
	dc.l	$F08B4805
	dc.l	$20148051
	dc.l	$01C2037C
	dc.l	$A30480DF
	dc.l	$08348252
	dc.l	$09482510
	dc.l	$9C2037C2
	dc.l	$13EFBEFB
	dc.l	$FFC00004
	dc.l	$80040715
	dc.l	$1981040B
	dc.l	$151E8203
	dc.l	$02177C25
	dc.l	$1D830406
	dc.l	$151C8404
	dc.l	$0A151A85
	dc.l	$051B8602
	dc.l	$00140827
	dc.l	$7D8A0518
	dc.l	$8B0409FF
	dc.l	$FD87EDB3
	dc.l	$1CF8E265
	dc.l	$FA43F652
	dc.l	$A9E194E1
	dc.l	$661A70B2
	dc.l	$7E8F4E7C
	dc.l	$6D4375AA
	dc.l	$3F65C1E1
	dc.l	$BE30E576
	dc.l	$70576E70
	dc.l	$7F0AE5FE
	dc.l	$EFBFB0FE
	dc.l	$37F81A3F
	dc.l	$815CFB9D
	dc.l	$E9843D6F
	dc.l	$4C87FD2E
	dc.l	$90FFB4E6
	dc.l	$E2BF4623
	dc.l	$C5588FC4
	dc.l	$D8D623C2
	dc.l	$FC40BEE3
	dc.l	$D31FCA91
	dc.l	$E7F5530F
	dc.l	$FBD8CFF1
	dc.l	$BF4080F4
	dc.l	$80040B14
	dc.l	$0A240C35
	dc.l	$1C440D55
	dc.l	$1E68FA72
	dc.l	$00850201
	dc.l	$1304251D
	dc.l	$377CFFFF
	dc.l	$880015F3
	dc.l	$1E3C8100
	dc.l	$A801F5DE
	dc.l	$38EBB2E0
	dc.l	$057CC78E
	dc.l	$BB2E5200
	dc.l	$DC0E373D
	dc.l	$2A5A5B50
	dc.l	$69A834EC
	dc.l	$C950031F
	dc.l	$264A9F48
	dc.l	$10793E9A
	dc.l	$47900D6D
	dc.l	$B4E36DC0
	dc.l	$3938F1CF
	dc.l	$864B806B
	dc.l	$AE3CE992
	dc.l	$E52053C7
	dc.l	$8ECC4BEE
	dc.l	$2169E9E8
	dc.l	$5BC76001
	dc.l	$732152A0
	dc.l	$079C989D
	dc.l	$37BE9A96
	dc.l	$EC3EA07A
	dc.l	$7A1E87BF
	dc.l	$8A3C8007
	dc.l	$254B8019
	dc.l	$DE25B72A
	dc.l	$5BC806B4
	dc.l	$DA534DB9
	dc.l	$3D352D38
	dc.l	$D271A766
	dc.l	$4A8543D0
	dc.l	$3D2A0067
	dc.l	$78E3AEF6
	dc.l	$9C78F201
	dc.l	$C96DA54B
	dc.l	$6D0390B6
	dc.l	$BF8A67F1
	dc.l	$4DEFA6BA
	dc.l	$E3CE992B
	dc.l	$E1E9F4F9
	dc.l	$D7267472
	dc.l	$14FD26B6
	dc.l	$E2439000
	dc.l	$F4325400
	dc.l	$2A542BF8
	dc.l	$A6F7D35D
	dc.l	$71E74FA8
	dc.l	$1E9E87A1
	dc.l	$BF31E3C8
	dc.l	$10E771E3
	dc.l	$9FC500DE
	dc.l	$DB4E3AD3
	dc.l	$52E64035
	dc.l	$A4E34EC2
	dc.l	$E01C9A96
	dc.l	$ECB8015F
	dc.l	$312FB93D
	dc.l	$321E834D
	dc.l	$41A76640
	dc.l	$0AF83AEC
	dc.l	$B8015F07
	dc.l	$3A400CF8
	dc.l	$3AECB801
	dc.l	$9DC98EBB
	dc.l	$2E5200DB
	dc.l	$E6DFA79D
	dc.l	$00D83A92
	dc.l	$A150271E
	dc.l	$39F0A6A1
	dc.l	$8FD3B35A
	dc.l	$69C79D39
	dc.l	$001D486C
	dc.l	$B806BA9F
	dc.l	$0AFE29BD
	dc.l	$F4D75C79
	dc.l	$D33E71C7
	dc.l	$90DE96E7
	dc.l	$C3932018
	dc.l	$EA4A854B
	dc.l	$80064B86
	dc.l	$7CC4B4FA
	dc.l	$753E152E
	dc.l	$52053AE3
	dc.l	$CEE24FA4
	dc.l	$03C9F5D3
	dc.l	$7BE9AF26
	dc.l	$3B3215FC
	dc.l	$51E403D0
	dc.l	$B69FA78F
	dc.l	$201E87BF
	dc.l	$8A6349B0
	dc.l	$D692FB72
	dc.l	$D00F4D4B
	dc.l	$9C8016E7
	dc.l	$CB4AEDCD
	dc.l	$40325B6F
	dc.l	$1B7EA57C
	dc.l	$C806B4D2
	dc.l	$5B4ECC76
	dc.l	$1E85B6D4
	dc.l	$A6DFA79D
	dc.l	$A9B00E4D
	dc.l	$4B765C00
	dc.l	$CF98F9A7
	dc.l	$65CA403A
	dc.l	$3AF9B9C8
	dc.l	$7A1E99DE
	dc.l	$25FCA85B
	dc.l	$E42DE253
	dc.l	$C4E9F49F
	dc.l	$4D4B8254
	dc.l	$B952A000
	dc.l	$5B6DB680
	dc.l	$172A1538
	dc.l	$8017388F
	dc.l	$2003AD3B
	dc.l	$0DEF12DB
	dc.l	$871A69C7
	dc.l	$9D1AEFD2
	dc.l	$014D4366
	dc.l	$2071D494
	dc.l	$9325201E
	dc.l	$790A9700
	dc.l	$D753E152
	dc.l	$E5253A93
	dc.l	$66B4EB8E
	dc.l	$21DF4D4B
	dc.l	$79D3657C
	dc.l	$E2437A5C
	dc.l	$AF87BA07
	dc.l	$D26C002A
	dc.l	$1E86FC38
	dc.l	$D2052153
	dc.l	$1F403B4E
	dc.l	$BAE34DCA
	dc.l	$800E778E
	dc.l	$4E3B2E00
	dc.l	$54B7CDBF
	dc.l	$4E7C00AF
	dc.l	$98F1D79D
	dc.l	$B85C03A3
	dc.l	$C87C0807
	dc.l	$A0E3C692
	dc.l	$E01E969C
	dc.l	$969C413C
	dc.l	$97FD5B4B
	dc.l	$4F209E7C
	dc.l	$816D273E
	dc.l	$52372A00
	dc.l	$79B6E626
	dc.l	$7F14DEFB
	dc.l	$BC75C99D
	dc.l	$33BF4806
	dc.l	$C392E148
	dc.l	$1F5DB867
	dc.l	$CA85A7D2
	dc.l	$7BE54390
	dc.l	$00F40B40
	dc.l	$00F98F1A
	dc.l	$6E01E85B
	dc.l	$9F320067
	dc.l	$78E3AD35
	dc.l	$2FE004C7
	dc.l	$8EBCEDC0
	dc.l	$0CEE4C79
	dc.l	$09500272
	dc.l	$534D3E6E
	dc.l	$5400B99D
	dc.l	$E25B72A5
	dc.l	$A01BF0F4
	dc.l	$E400B725
	dc.l	$B69E952D
	dc.l	$006BF8A6
	dc.l	$B4D4B9B0
	dc.l	$0B9AD3AF
	dc.l	$9B95002D
	dc.l	$E76DA4B6
	dc.l	$E54000B4
	dc.l	$7C800F91
	dc.l	$AFE29BDF
	dc.l	$4D75C99D
	dc.l	$39F312D3
	dc.l	$E9D4F854
	dc.l	$02E6BAE3
	dc.l	$CE9C9501
	dc.l	$D49B2A71
	dc.l	$D6A5409F
	dc.l	$4F9D4EDA
	dc.l	$642DFA4F
	dc.l	$A4E42E54
	dc.l	$B40F3AE4
	dc.l	$CE8D4B80
	dc.l	$0352E172
	dc.l	$A0025CAE
	dc.l	$92BE1E9F
	dc.l	$4F9A69C7
	dc.l	$9D1AEFD3
	dc.l	$4FD27D25
	dc.l	$400321E8
	dc.l	$1F0E3480
	dc.l	$1B0039F3
	dc.l	$12FB9098
	dc.l	$816D271A
	dc.l	$7664D87A
	dc.l	$173263AF
	dc.l	$9B95002E
	dc.l	$5B4E36FD
	dc.l	$39F29006
	dc.l	$DC96DB6E
	dc.l	$B9F2DA71
	dc.l	$2E01C969
	dc.l	$F5D00FA4
	dc.l	$2A01AD27
	dc.l	$3E15F38E
	dc.l	$3C86F4B7
	dc.l	$3E1C6E54
	dc.l	$001B950A
	dc.l	$F9C71E43
	dc.l	$7A5B9F0D
	dc.l	$805CD75C
	dc.l	$79D2BB8E
	dc.l	$201B3893
	dc.l	$3B69A9F4
	dc.l	$EB4EC254
	dc.l	$2A7A6BE6
	dc.l	$9A71E74E
	dc.l	$40A4D6DC
	dc.l	$4857F54E
	dc.l	$7C039F0A
	dc.l	$FEAD4A85
	dc.l	$43D03D2A
	dc.l	$5400A825
	dc.l	$CAE8039D
	dc.l	$A6DC6DC6
	dc.l	$9A970025
	dc.l	$C0C970A4
	dc.l	$FA497292
	dc.l	$9DFE2D43
	dc.l	$E93E9CF9
	dc.l	$897FF500
	dc.l	$390F4AEF
	dc.l	$D20172A1
	dc.l	$CFE29BDF
	dc.l	$4D75C79D
	dc.l	$2E5C35D4
	dc.l	$9B075C4A
	dc.l	$41C75365
	dc.l	$CA46BE71
	dc.l	$C790DE97
	dc.l	$2BE17F38
	dc.l	$E3C86F78
	dc.l	$F1CF9880
	dc.l	$09F49F53
	dc.l	$21882099
	dc.l	$FE5A806B
	dc.l	$49C69D87
	dc.l	$103E0E74
	dc.l	$95360170
	dc.l	$75F372A7
	dc.l	$201AD271
	dc.l	$A6E5B49C
	dc.l	$4132642A
	dc.l	$003A90DF
	dc.l	$950B4FA7
	dc.l	$53E52720
	dc.l	$03A90C80
	dc.l	$5CD75C79
	dc.l	$D2A5CA43
	dc.l	$E9A4B69A
	dc.l	$8637D353
	dc.l	$D39D1E4C
	dc.l	$79D00D6D
	dc.l	$A94DB8E3
	dc.l	$F5F0CEFA
	dc.l	$6BAE3CEE
	dc.l	$24CEDBA8
	dc.l	$03C8725C
	dc.l	$035D71E7
	dc.l	$4CEFD205
	dc.l	$254C4325
	dc.l	$3496D25B
	dc.l	$4D25B4EC
	dc.l	$C950C4FA
	dc.l	$4F236DA0
	dc.l	$06CC46A5
	dc.l	$201F52A1
	dc.l	$BF31E3C8
	dc.l	$10DE952F
	dc.l	$A017FE51
	dc.l	$A69A972F
	dc.l	$E643D0C6
	dc.l	$A18ECC80
	dc.l	$172E1492
	dc.l	$E53700D4
	dc.l	$FA7E9BED
	dc.l	$C0025CB8
	dc.l	$4B80064B
	dc.l	$864C8063
	dc.l	$A92A172E
	dc.l	$52053AF9
	dc.l	$BF867CA8
	dc.l	$5F7D352D
	dc.l	$A6FBC4B8
	dc.l	$06A7D743
	dc.l	$EA54B4B4
	dc.l	$E34DA534
	dc.l	$DB932006
	dc.l	$4B7CDBF4
	dc.l	$E7C00AF9
	dc.l	$8F9AEE4D
	dc.l	$7E903B8F
	dc.l	$1D78DB73
	dc.l	$20027D3E
	dc.l	$EE400F35
	dc.l	$3899DFA4
	dc.l	$03619F32
	dc.l	$63C86F4B
	dc.l	$6BF8A73E
	dc.l	$625F7D35
	dc.l	$2DCF86A0
	dc.l	$0D42A542
	dc.l	$90033BC7
	dc.l	$1D69A970
	dc.l	$02BFAA71
	dc.l	$A6A5C00C
	dc.l	$970325CE
	dc.l	$40083AEC
	dc.l	$B800DB5D
	dc.l	$B6DFA6FF
	dc.l	$AA01AF3B
	dc.l	$6D25FCA9
	dc.l	$F500E4D4
	dc.l	$B71B6DB7
	dc.l	$C814950D
	dc.l	$970D7526
	dc.l	$C1D71B6D
	dc.l	$B8005370
	dc.l	$E4E4B712
	dc.l	$D3E9D69D
	dc.l	$867F54E7
	dc.l	$7D35A69C
	dc.l	$79D325C0
	dc.l	$35D4F800
	dc.l	$543D0F7F
	dc.l	$54A95000
	dc.l	$E4C6A523
	dc.l	$50C6A189
	dc.l	$52900E7C
	dc.l	$3CECB790
	dc.l	$0A765A71
	dc.l	$B96DA006
	dc.l	$CA46A5C0
	dc.l	$35D78E7C
	dc.l	$254B40F2
	dc.l	$5CAF835F
	dc.l	$C537BE9A
	dc.l	$D34E3CE8
	dc.l	$007D43D0
	dc.l	$D805C1D4
	dc.l	$95002A5B
	dc.l	$E6DB75CF
	dc.l	$94807726
	dc.l	$3AF3B739
	dc.l	$002A5A12
	dc.l	$A5A00ECD
	dc.l	$4B9C8016
	dc.l	$E4C4A6FE
	dc.l	$67790F42
	dc.l	$A5431F39
	dc.l	$0033E542
	dc.l	$FB5DF400
	dc.l	$726BC79D
	dc.l	$CEF903E9
	dc.l	$13B50B4F
	dc.l	$A4FAED42
	dc.l	$BB8E2018
	dc.l	$DC37E63E
	dc.l	$6BBE9A96
	dc.l	$D37DE276
	dc.l	$A169F4F9
	dc.l	$D6BB9095
	dc.l	$2D3CEA4D
	dc.l	$9538EB88
	dc.l	$793E9D4E
	dc.l	$FD4CEEB5
	dc.l	$31A85372
	dc.l	$DF390A72
	dc.l	$53F4827A
	dc.l	$542A6775
	dc.l	$214D7C25
	dc.l	$74440A98
	dc.l	$F9C85000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00010002
	dc.l	$00030004
	dc.l	$00050006
	dc.l	$00070008
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0009000A
	dc.l	$000B000C
	dc.l	$000D000E
	dc.l	$000F0010
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000011
	dc.l	$00020012
	dc.l	$00130002
	dc.l	$00140015
	dc.l	$00160017
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000018
	dc.l	$0019001A
	dc.l	$001B0019
	dc.l	$001C001D
	dc.l	$001E001F
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00200002
	dc.l	$00120021
	dc.l	$00220023
	dc.l	$08020024
	dc.l	$00250026
	dc.l	$00270025
	dc.l	$08020028
	dc.l	$00140029
	dc.l	$002A0005
	dc.l	$0006002B
	dc.l	$002C0019
	dc.l	$001A002D
	dc.l	$002E002F
	dc.l	$00300031
	dc.l	$00320033
	dc.l	$00340032
	dc.l	$080A0833
	dc.l	$001C0035
	dc.l	$0036000D
	dc.l	$000E0037
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00380039
	dc.l	$003A003B
	dc.l	$003C003D
	dc.l	$003E003F
	dc.l	$00400041
	dc.l	$00420043
	dc.l	$00440045
	dc.l	$00460000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00470047
	dc.l	$00480049
	dc.l	$004A004B
	dc.l	$004C004D
	dc.l	$004E004F
	dc.l	$00500051
	dc.l	$0052002F
	dc.l	$081D0053
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000054
	dc.l	$00550056
	dc.l	$00570058
	dc.l	$0059005A
	dc.l	$005B005C
	dc.l	$005D0043
	dc.l	$00440045
	dc.l	$00460000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0000005E
	dc.l	$005F0060
	dc.l	$00610062
	dc.l	$00630064
	dc.l	$001D001D
	dc.l	$08640051
	dc.l	$0052002F
	dc.l	$081D0053
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000065
	dc.l	$00660067
	dc.l	$08240024
	dc.l	$00160002
	dc.l	$00680069
	dc.l	$006A006B
	dc.l	$006C006D
	dc.l	$006E006F
	dc.l	$0070003D
	dc.l	$00000000
	dc.l	$00000071
	dc.l	$00720073
	dc.l	$00740031
	dc.l	$001E0075
	dc.l	$00620063
	dc.l	$00760077
	dc.l	$00780079
	dc.l	$007A007B
	dc.l	$007C007D
	dc.l	$007E0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$007F0080
	dc.l	$00810082
	dc.l	$08270816
	dc.l	$08020083
	dc.l	$00840070
	dc.l	$00130085
	dc.l	$00860000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00870088
	dc.l	$004C0089
	dc.l	$008A008B
	dc.l	$080A008C
	dc.l	$008D008E
	dc.l	$008F0810
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$009F0002
	dc.l	$00A000A1
	dc.l	$00A20802
	dc.l	$00A30002
	dc.l	$08020002
	dc.l	$00030004
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00A4000A
	dc.l	$00A500A6
	dc.l	$08790030
	dc.l	$00A7000A
	dc.l	$00A8000A
	dc.l	$00A900AA
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00380039
	dc.l	$003A003B
	dc.l	$003C003D
	dc.l	$003E003F
	dc.l	$00400041
	dc.l	$00420029
	dc.l	$00AB0093
	dc.l	$00570000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00470047
	dc.l	$00480049
	dc.l	$004A004B
	dc.l	$004C004D
	dc.l	$004E004F
	dc.l	$005000AC
	dc.l	$00AD00AE
	dc.l	$00AF009E
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000054
	dc.l	$00550056
	dc.l	$00570058
	dc.l	$0059005A
	dc.l	$005B005C
	dc.l	$005D0029
	dc.l	$00AB0093
	dc.l	$00570000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0000005E
	dc.l	$005F0060
	dc.l	$00610062
	dc.l	$00630064
	dc.l	$001D001D
	dc.l	$086400AC
	dc.l	$00AD00AE
	dc.l	$00AF009E
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00B000B1
	dc.l	$00420029
	dc.l	$00AB0093
	dc.l	$00570000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00B200B3
	dc.l	$005000AC
	dc.l	$00AD00AE
	dc.l	$00AF009E
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00B40027
	dc.l	$00B50802
	dc.l	$08160824
	dc.l	$00280840
	dc.l	$00020802
	dc.l	$00020058
	dc.l	$00B60028
	dc.l	$00B70870
	dc.l	$00B80000
	dc.l	$00000000
	dc.l	$00090034
	dc.l	$00B90030
	dc.l	$008B0074
	dc.l	$0833084E
	dc.l	$001900A8
	dc.l	$000A00BA
	dc.l	$00BB0833
	dc.l	$00BC00BD
	dc.l	$00BE0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000027
	dc.l	$00BF0056
	dc.l	$005700C0
	dc.l	$000200C1
	dc.l	$00C200C3
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000034
	dc.l	$00C40060
	dc.l	$006100C5
	dc.l	$001900C6
	dc.l	$00C700C8
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0000003A
	dc.l	$00C900CA
	dc.l	$0070003D
	dc.l	$00CB00CC
	dc.l	$08240024
	dc.l	$08400002
	dc.l	$00290042
	dc.l	$002900CD
	dc.l	$00CE0056
	dc.l	$00CF0000
	dc.l	$00000048
	dc.l	$00730033
	dc.l	$007900D0
	dc.l	$00D108BA
	dc.l	$00740031
	dc.l	$084E0019
	dc.l	$00AC00D2
	dc.l	$00AC00D3
	dc.l	$005100D4
	dc.l	$00D500D6
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000090
	dc.l	$00910002
	dc.l	$08240092
	dc.l	$00930824
	dc.l	$00400094
	dc.l	$00020095
	dc.l	$00960022
	dc.l	$00800000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000097
	dc.l	$00470019
	dc.l	$00740098
	dc.l	$00990074
	dc.l	$004E009A
	dc.l	$0019009B
	dc.l	$009C002E
	dc.l	$009D009E
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00088171
	dc.l	$00FF0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$80258003
	dc.l	$02130124
	dc.l	$09351845
	dc.l	$17563466
	dc.l	$38730081
	dc.l	$08F88304
	dc.l	$06151687
	dc.l	$05141635
	dc.l	$89040715
	dc.l	$1527768A
	dc.l	$04081637
	dc.l	$8B06398C
	dc.l	$0778163A
	dc.l	$8D051916
	dc.l	$36277B77
	dc.l	$778E0779
	dc.l	$8F077AFF
	dc.l	$EEBFDA00
	dc.l	$02FD97EF
	dc.l	$7F49DC00
	dc.l	$04F63EFF
	dc.l	$49DF6000
	dc.l	$159AAFCA
	dc.l	$7BFCA77C
	dc.l	$8000FDCC
	dc.l	$BFED3DFE
	dc.l	$13B8000F
	dc.l	$E497FE26
	dc.l	$DF84EE00
	dc.l	$02BA7E53
	dc.l	$BFF74000
	dc.l	$0F8FDE73
	dc.l	$D34D3143
	dc.l	$4549A1D6
	dc.l	$75399D4E
	dc.l	$D34D28A9
	dc.l	$3EB9F1CF
	dc.l	$E0BF2BF8
	dc.l	$8D203E90
	dc.l	$E348E22E
	dc.l	$E63F08BB
	dc.l	$164C60B4
	dc.l	$710C6061
	dc.l	$8C018DDD
	dc.l	$8B184E5A
	dc.l	$5B881A42
	dc.l	$81A3E90E
	dc.l	$AB077973
	dc.l	$BB70D7DF
	dc.l	$8B5E1C37
	dc.l	$10D583BC
	dc.l	$B4D80003
	dc.l	$A72D2F05
	dc.l	$80031014
	dc.l	$362AC000
	dc.l	$00BFE0B9
	dc.l	$F1FABE95
	dc.l	$150D2F4C
	dc.l	$7B0A8A98
	dc.l	$CAD6F91B
	dc.l	$7AFE0FE4
	dc.l	$B4B002FD
	dc.l	$B0E142F2
	dc.l	$C9A1D459
	dc.l	$5958013D
	dc.l	$8BA7972C
	dc.l	$60B3A876
	dc.l	$78369B00
	dc.l	$2A6A9CB4
	dc.l	$B4C34D77
	dc.l	$50EC7F66
	dc.l	$009FE497
	dc.l	$BB183BCB
	dc.l	$3C2B2736
	dc.l	$0061CD4B
	dc.l	$A696E219
	dc.l	$41ECCF60
	dc.l	$068EAAAA
	dc.l	$58B160ED
	dc.l	$56AB0007
	dc.l	$EE435F7C
	dc.l	$73F88FD1
	dc.l	$78FC8AD8
	dc.l	$EDC6CA8B
	dc.l	$33934E28
	dc.l	$B37D5667
	dc.l	$554595EB
	dc.l	$AE7F05F8
	dc.l	$5F5F0070
	dc.l	$FA45DC3E
	dc.l	$FA5BCB55
	dc.l	$ABFA31A3
	dc.l	$8631309E
	dc.l	$60B27DD5
	dc.l	$A7F46BB3
	dc.l	$55B11A40
	dc.l	$0E30F05E
	dc.l	$26C6C6AD
	dc.l	$2E00013C
	dc.l	$61CDB0EC
	dc.l	$BB33E91A
	dc.l	$400E1417
	dc.l	$82F6362E
	dc.l	$D56AB003
	dc.l	$11779868
	dc.l	$2FBB2B1B
	dc.l	$1FDC86BE
	dc.l	$FC5AF0E1
	dc.l	$A5FF557F
	dc.l	$D9CFE0BF
	dc.l	$79CF58A6
	dc.l	$2868A934
	dc.l	$3ACEA733
	dc.l	$A9DA69A5
	dc.l	$1527D73E
	dc.l	$3F37D7C0
	dc.l	$03F0DFE2
	dc.l	$4FE7F874
	dc.l	$3B63F4EB
	dc.l	$27AFCDF5
	dc.l	$F91007FC
	dc.l	$BCD7F3CF
	dc.l	$F9ECD16A
	dc.l	$A9345434
	dc.l	$F8EB9F1F
	dc.l	$AB007FCB
	dc.l	$F87FAEBE
	dc.l	$4E6FB78F
	dc.l	$F0803FE5
	dc.l	$5F3FC3A1
	dc.l	$DB1FA759
	dc.l	$3E755AEC
	dc.l	$A8A8697A
	dc.l	$63D85454
	dc.l	$69CAD6F9
	dc.l	$39BEC000
	dc.l	$06000000
	dc.l	$000E1A00
	dc.l	$C3A03A03
	dc.l	$A0252860
	dc.l	$4207F000
; generated instructions=2242 code_bytes=8042 image_bytes=31072
