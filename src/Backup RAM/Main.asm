; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Backup RAM manager main CPU program (all retail regions)
; -------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/Backup RAM.inc"
	include	"_Include/MMD.inc"

	if REGION=USA
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
	else
; Japan and Europe use the same regional manager layout with a short
; localized code/data variant. The remaining dc.b spans are source-emitted
; reconstruction data and are scheduled for semantic decomposition.
	MMD	0, &
		WORKRAMFILE, $7800, &
		Start, 0, VInterrupt

Start:
	move.l	#$ff2186, $FFFFfd08.w
L_NonUSA_FF2008:
	moveq	#$0, d0
L_NonUSA_FF200A:
	move.l	d0, $a12010.l
L_NonUSA_FF2010:
	move.l	d0, $a12014.l
L_NonUSA_FF2016:
	move.l	d0, $a12018.l
L_NonUSA_FF201C:
	move.l	d0, $a1201c.l
L_NonUSA_FF2022:
	bsr.w	$FF237E
L_NonUSA_FF2026:
	bsr.w	$FF235E
L_NonUSA_FF202A:
	bsr.w	$FF238A
L_NonUSA_FF202E:
	lea.l	$FFFFa000.w, a0
L_NonUSA_FF2032:
	move.w	#$16ff, d7
L_NonUSA_FF2036:
	move.l	#$0, (a0)+
L_NonUSA_FF203C:
	dbra	d7, L_NonUSA_FF2036
L_NonUSA_FF2040:
	bsr.w	L_NonUSA_FF20FA
L_NonUSA_FF2044:
	move.w	#$0, $FFFFcd02.w
L_NonUSA_FF204A:
	bsr.w	$FF3CBA
L_NonUSA_FF204E:
	bsr.w	$FF5304
L_NonUSA_FF2052:
	bsr.w	$FF3F3A
L_NonUSA_FF2056:
	bsr.w	$FF6700
L_NonUSA_FF205A:
	bsr.w	$FF2702
L_NonUSA_FF205E:
	bsr.w	$FF3BF2
L_NonUSA_FF2062:
	beq.b	L_NonUSA_FF206E
L_NonUSA_FF2064:
	moveq	#$1, d0
L_NonUSA_FF2066:
	bsr.w	$FF3BDA
L_NonUSA_FF206A:
	bsr.w	$FF52CA
L_NonUSA_FF206E:
	moveq	#$0, d0
L_NonUSA_FF2070:
	bsr.w	$FF3BDA
L_NonUSA_FF2074:
	bsr.w	$FF52CA
L_NonUSA_FF2078:
	bsr.w	$FF3FBE
L_NonUSA_FF207C:
	bsr.w	L_NonUSA_FF20E4
L_NonUSA_FF2080:
	cmpi.l	#$8ca0, $FFFFcd58.w
L_NonUSA_FF2088:
	bge.b	L_NonUSA_FF208E
L_NonUSA_FF208A:
	bra.w	L_NonUSA_FF2078
L_NonUSA_FF208E:
	move.w	#$3f, d1
L_NonUSA_FF2092:
	lea.l	$FFFFc420.w, a0
L_NonUSA_FF2096:
	moveq	#$0, d0
L_NonUSA_FF2098:
	move.w	d0, (a0)+
L_NonUSA_FF209A:
	dbra	d1, L_NonUSA_FF2098
L_NonUSA_FF209E:
	bsr.w	$FF2702
L_NonUSA_FF20A2:
	bsr.w	L_NonUSA_FF20A8
L_NonUSA_FF20A6:
	rts
L_NonUSA_FF20A8:
	nop
L_NonUSA_FF20AA:
	nop
L_NonUSA_FF20AC:
	bset.b	#$7, $a1200e.l
L_NonUSA_FF20B4:
	bsr.w	$FF235E
L_NonUSA_FF20B8:
	btst.b	#$7, $a1200f.l
L_NonUSA_FF20C0:
	beq.b	L_NonUSA_FF20B4
L_NonUSA_FF20C2:
	moveq	#$0, d0
L_NonUSA_FF20C4:
	move.l	d0, $a12010.l
L_NonUSA_FF20CA:
	move.l	d0, $a12014.l
L_NonUSA_FF20D0:
	move.l	d0, $a12018.l
L_NonUSA_FF20D6:
	move.l	d0, $a1201c.l
L_NonUSA_FF20DC:
	move.b	d0, $a1200e.l
L_NonUSA_FF20E2:
	rts
L_NonUSA_FF20E4:
	bsr.w	$FF6796
L_NonUSA_FF20E8:
	jsr	$FF280C.l
L_NonUSA_FF20EE:
	jsr	$FF28D0.l
L_NonUSA_FF20F4:
	jmp	$FF2702.l
L_NonUSA_FF20FA:
	move.b	#$1, $FFFFb280.w
L_NonUSA_FF2100:
	move.b	#$2, $FFFFb2c0.w
L_NonUSA_FF2106:
	move.b	#$0, $FFFFb2e8.w
L_NonUSA_FF210C:
	move.b	#$2, $FFFFb300.w
L_NonUSA_FF2112:
	move.b	#$1, $FFFFb328.w
L_NonUSA_FF2118:
	move.b	#$3, $FFFFb340.w
L_NonUSA_FF211E:
	move.b	#$6, $FFFFb380.w
L_NonUSA_FF2124:
	moveq	#$0, d1
L_NonUSA_FF2126:
	lea.l	$FFFFb3c0.w, a0
L_NonUSA_FF212A:
	move.b	#$5, $0(a0)
L_NonUSA_FF2130:
	move.b	d1, $1a(a0)
L_NonUSA_FF2134:
	adda.w	#$40, a0
L_NonUSA_FF2138:
	addq.w	#$1, d1
L_NonUSA_FF213A:
	cmpi.w	#$4, d1
L_NonUSA_FF213E:
	bne.b	L_NonUSA_FF212A
L_NonUSA_FF2140:
	lea.l	$FFFFb4c0.w, a0
L_NonUSA_FF2144:
	moveq	#$0, d1
L_NonUSA_FF2146:
	move.b	#$4, $0(a0)
L_NonUSA_FF214C:
	move.b	d1, $28(a0)
L_NonUSA_FF2150:
	adda.w	#$40, a0
L_NonUSA_FF2154:
	addq.w	#$1, d1
L_NonUSA_FF2156:
	cmpi.w	#$b, d1
L_NonUSA_FF215A:
	bne.b	L_NonUSA_FF2146
L_NonUSA_FF215C:
	move.w	#$0, $FFFFcd14.w
L_NonUSA_FF2162:
	move.b	#$1, $FFFFcd1e.w
L_NonUSA_FF2168:
	lea.l	$ff3c6c.l, a0
L_NonUSA_FF216E:
	lea.l	$FFFFcd30.w, a1
L_NonUSA_FF2172:
	move.l	(a0)+, (a1)+
L_NonUSA_FF2174:
	move.l	(a0)+, (a1)+
L_NonUSA_FF2176:
	move.l	(a0), (a1)
L_NonUSA_FF2178:
	move.b	#$30, $1(a1)
L_NonUSA_FF217E:
	move.b	#$30, $2(a1)
L_NonUSA_FF2184:
	rts
VInterrupt:
	movem.l	d0-d7/a0-a6, -(a7)
L_NonUSA_FF218A:
	move.b	#$1, $a12000.l
L_NonUSA_FF2192:
	tst.b	$FFFFcd00.w
L_NonUSA_FF2196:
	beq.w	L_NonUSA_FF22D4
L_NonUSA_FF219A:
	move.b	#$0, $FFFFcd00.w
L_NonUSA_FF21A0:
	lea.l	$c00004.l, a1
L_NonUSA_FF21A6:
	lea.l	$c00000.l, a2
L_NonUSA_FF21AC:
	move.w	(a1), d0
L_NonUSA_FF21AE:
	jsr	$FF251C(pc)
L_NonUSA_FF21B2:
	move.w	$FFFFcd02.w, d0
L_NonUSA_FF21B6:
	add.w	d0, d0
L_NonUSA_FF21B8:
	move.w	L_NonUSA_FF21C0(pc, d0.w), d0
L_NonUSA_FF21BC:
	jmp	L_NonUSA_FF21C0(pc, d0.w)
L_NonUSA_FF21C0:
	dc.w	$0002
L_NonUSA_FF21C2:
	move.l	#$40040010, $c00004.l
L_NonUSA_FF21CC:
	moveq	#$5, d0
L_NonUSA_FF21CE:
	move.w	$FFFFdfdc.w, d1
L_NonUSA_FF21D2:
	move.w	#$0, $c00000.l
L_NonUSA_FF21DA:
	move.w	d1, $c00000.l
L_NonUSA_FF21E0:
	dbra	d0, L_NonUSA_FF21D2
L_NonUSA_FF21E4:
	move.l	#$40340010, $c00004.l
L_NonUSA_FF21EE:
	moveq	#$5, d0
L_NonUSA_FF21F0:
	move.w	$FFFFcfac.w, d1
L_NonUSA_FF21F4:
	move.w	#$0, $c00000.l
L_NonUSA_FF21FC:
	move.w	d1, $c00000.l
L_NonUSA_FF2202:
	dbra	d0, L_NonUSA_FF21F4
L_NonUSA_FF2206:
	lea.l	$c00004.l, a6
L_NonUSA_FF220C:
	move.w	#$8f20, (a6)
L_NonUSA_FF2210:
	move.l	#$52000003, $c00004.l
L_NonUSA_FF221A:
	lea.l	$c00000.l, a6
L_NonUSA_FF2220:
	moveq	#$9, d1
L_NonUSA_FF2222:
	move.w	#$d0, d0
L_NonUSA_FF2226:
	tst.b	$FFFFcd29.w
L_NonUSA_FF222A:
	beq.b	L_NonUSA_FF223E
L_NonUSA_FF222C:
	cmpi.b	#$1, $FFFFcd29.w
L_NonUSA_FF2232:
	beq.b	L_NonUSA_FF223A
L_NonUSA_FF2234:
	move.w	#$ffa0, d0
L_NonUSA_FF2238:
	bra.b	L_NonUSA_FF223E
L_NonUSA_FF223A:
	move.w	#$0, d0
L_NonUSA_FF223E:
	move.w	d0, (a6)
L_NonUSA_FF2240:
	dbra	d1, L_NonUSA_FF223E
L_NonUSA_FF2244:
	lea.l	$c00004.l, a6
L_NonUSA_FF224A:
	move.w	#$8f02, (a6)
L_NonUSA_FF224E:
	lea.l	$c00004.l, a6
L_NonUSA_FF2254:
	move.l	#$93409400, (a6)
L_NonUSA_FF225A:
	move.l	#$951096e2, (a6)
L_NonUSA_FF2260:
	move.w	#$977f, (a6)
L_NonUSA_FF2264:
	move.w	#$c000, (a6)
L_NonUSA_FF2268:
	move.w	#$80, -(a7)
L_NonUSA_FF226C:
	move.w	(a7)+, (a6)
L_NonUSA_FF226E:
	move.l	#$c0000000, (a6)
L_NonUSA_FF2274:
	move.w	$FFFFc420.w, $c00000.l
L_NonUSA_FF227C:
	nop
L_NonUSA_FF227E:
	lea.l	$c00004.l, a6
L_NonUSA_FF2284:
	move.l	#$93409401, (a6)
L_NonUSA_FF228A:
	move.l	#$950096d8, (a6)
L_NonUSA_FF2290:
	move.w	#$977f, (a6)
L_NonUSA_FF2294:
	move.w	#$7c00, (a6)
L_NonUSA_FF2298:
	move.w	#$82, -(a7)
L_NonUSA_FF229C:
	move.w	(a7)+, (a6)
L_NonUSA_FF229E:
	move.l	#$7c000002, (a6)
L_NonUSA_FF22A4:
	move.w	$FFFFb000.w, $c00000.l
L_NonUSA_FF22AC:
	nop
L_NonUSA_FF22AE:
	bra.w	L_NonUSA_FF22B2
L_NonUSA_FF22B2:
	jsr	$FF25C4.l
L_NonUSA_FF22B8:
	bsr.w	$FF2534
L_NonUSA_FF22BC:
	tst.w	$FFFFcd04.w
L_NonUSA_FF22C0:
	beq.b	L_NonUSA_FF22C6
L_NonUSA_FF22C2:
	subq.w	#$1, $FFFFcd04.w
L_NonUSA_FF22C6:
	addq.w	#$1, $FFFFcd06.w
L_NonUSA_FF22CA:
	jsr	L_NonUSA_FF22E8(pc)
L_NonUSA_FF22CE:
	movem.l	(a7)+, d0-d7/a0-a6
L_NonUSA_FF22D2:
	rte
L_NonUSA_FF22D4:
	addq.l	#$1, $FFFFcd0a.w
L_NonUSA_FF22D8:
	move.b	$FFFFcd03.w, $FFFFcd0a.w
L_NonUSA_FF22DE:
	jsr	L_NonUSA_FF22E8(pc)
L_NonUSA_FF22E2:
	movem.l	(a7)+, d0-d7/a0-a6
L_NonUSA_FF22E6:
	rte
L_NonUSA_FF22E8:
	jsr	$FF2542(pc)
L_NonUSA_FF22EC:
	cmpi.b	#$6, $FFFFcd15.w
L_NonUSA_FF22F2:
	beq.b	L_NonUSA_FF2304
L_NonUSA_FF22F4:
	addq.l	#$1, $FFFFcd58.w
L_NonUSA_FF22F8:
	tst.b	$a1201e.l
L_NonUSA_FF22FE:
	beq.b	L_NonUSA_FF2304
L_NonUSA_FF2300:
	clr.l	$FFFFcd58.w
L_NonUSA_FF2304:
	lea.l	$FFFFcd53.w, a0
L_NonUSA_FF2308:
	move.b	$a1201e.l, d0
L_NonUSA_FF230E:
	moveq	#$0, d1
L_NonUSA_FF2310:
	moveq	#$3, d2
L_NonUSA_FF2312:
	dc.w	$0500
L_NonUSA_FF2314:
	beq.b	L_NonUSA_FF232A
L_NonUSA_FF2316:
	cmpi.b	#$28, (a0)
L_NonUSA_FF231A:
	bge.b	L_NonUSA_FF2326
L_NonUSA_FF231C:
	addq.b	#$1, (a0)
L_NonUSA_FF231E:
	cmpi.b	#$1, (a0)
L_NonUSA_FF2322:
	beq.b	L_NonUSA_FF2326
L_NonUSA_FF2324:
	bra.b	L_NonUSA_FF232C
L_NonUSA_FF2326:
	dc.w	$05C1
L_NonUSA_FF2328:
	bra.b	L_NonUSA_FF232E
L_NonUSA_FF232A:
	clr.b	(a0)
L_NonUSA_FF232C:
	dc.w	$0581
L_NonUSA_FF232E:
	adda.w	#$1, a0
L_NonUSA_FF2332:
	dbra	d2, L_NonUSA_FF2312
L_NonUSA_FF2336:
	move.b	d1, $FFFFcd52.w
L_NonUSA_FF233A:
	rts
L_NonUSA_FF233C:
	move.w	#$1, $a12012.l
L_NonUSA_FF2344:
	tst.w	$a12022.l
L_NonUSA_FF234A:
	beq.b	L_NonUSA_FF2344
L_NonUSA_FF234C:
	move.w	#$0, $a12012.l
L_NonUSA_FF2354:
	tst.w	$a12022.l
L_NonUSA_FF235A:
	bne.b	L_NonUSA_FF2354
L_NonUSA_FF235C:
	rts
L_NonUSA_FF235E:
	bset.b	#$1, $a12003.l
L_NonUSA_FF2366:
	btst.b	#$1, $a12003.l
L_NonUSA_FF236E:
	beq.b	L_NonUSA_FF235E
L_NonUSA_FF2370:
	rts
L_NonUSA_FF2372:
	btst.b	#$0, $a12003.l
L_NonUSA_FF237A:
	beq.b	L_NonUSA_FF2372
L_NonUSA_FF237C:
	rts
L_NonUSA_FF237E:
	btst.b	#$7, $a1200f.l
L_NonUSA_FF2386:
	beq.b	L_NonUSA_FF237E
L_NonUSA_FF2388:
	rts
L_NonUSA_FF238A:
	btst.b	#$7, $a1200f.l
L_NonUSA_FF2392:
	bne.b	L_NonUSA_FF238A
L_NonUSA_FF2394:
	rts
L_NonUSA_FF2396:
	lea.l	$ff2508(pc), a0
L_NonUSA_FF239A:
	move.w	#$8000, d0
L_NonUSA_FF239E:
	moveq	#$12, d7
L_NonUSA_FF23A0:
	move.b	(a0)+, d0
L_NonUSA_FF23A2:
	move.w	d0, $c00004.l
L_NonUSA_FF23A8:
	addi.w	#$100, d0
L_NonUSA_FF23AC:
	dbra	d7, L_NonUSA_FF23A0
L_NonUSA_FF23B0:
	moveq	#$40, d0
L_NonUSA_FF23B2:
	move.b	d0, $a10009.l
L_NonUSA_FF23B8:
	move.b	d0, $a1000b.l
L_NonUSA_FF23BE:
	move.b	d0, $a1000d.l
L_NonUSA_FF23C4:
	move.b	#$c0, $a10003.l
L_NonUSA_FF23CC:
	bsr.w	$FF251C
L_NonUSA_FF23D0:
	lea.l	$c00004.l, a6
L_NonUSA_FF23D6:
	move.w	#$8f01, (a6)
L_NonUSA_FF23DA:
	move.l	#$93ff94ff, (a6)
L_NonUSA_FF23E0:
	move.w	#$9780, (a6)
L_NonUSA_FF23E4:
	move.l	#$40000080, (a6)
L_NonUSA_FF23EA:
	move.w	#$0, $c00000.l
L_NonUSA_FF23F2:
	btst.b	#$1, $1(a6)
L_NonUSA_FF23F8:
	bne.b	L_NonUSA_FF23F2
L_NonUSA_FF23FA:
	move.l	#$40000000, (a6)
L_NonUSA_FF2400:
	move.w	#$0, $c00000.l
L_NonUSA_FF2408:
	move.w	#$8f02, (a6)
L_NonUSA_FF240C:
	move.l	#$40000003, $c00004.l
L_NonUSA_FF2416:
	move.w	#$7ff, d7
L_NonUSA_FF241A:
	move.w	#$0, $c00000.l
L_NonUSA_FF2422:
	dbra	d7, L_NonUSA_FF241A
L_NonUSA_FF2426:
	move.l	#$60000003, $c00004.l
L_NonUSA_FF2430:
	move.w	#$7ff, d7
L_NonUSA_FF2434:
	move.w	#$0, $c00000.l
L_NonUSA_FF243C:
	dbra	d7, L_NonUSA_FF2434
L_NonUSA_FF2440:
	move.l	#$c0000000, $c00004.l
L_NonUSA_FF244A:
	lea.l	$ff2488(pc), a0
L_NonUSA_FF244E:
	moveq	#$1f, d7
L_NonUSA_FF2450:
	move.l	(a0)+, $c00000.l
L_NonUSA_FF2456:
	dbra	d7, L_NonUSA_FF2450
L_NonUSA_FF245A:
	move.l	#$40000010, $c00004.l
L_NonUSA_FF2464:
	moveq	#$13, d0
L_NonUSA_FF2466:
	move.w	#$0, $c00000.l
L_NonUSA_FF2470:
	move.w	#$0, $c00000.l
L_NonUSA_FF2476:
	dbra	d0, L_NonUSA_FF2466
L_NonUSA_FF247A:
	bsr.w	$FF2534
L_NonUSA_FF247E:
	move.w	#$8134, $ff0f16.l
L_NonUSA_FF2486:
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
L_NonUSA_FF251C:
	move.w	sr, $FFFFcd08.w
L_NonUSA_FF2520:
	move.w	#$100, $a11100.l
L_NonUSA_FF2528:
	btst.b	#$0, $a11100.l
L_NonUSA_FF2530:
	bne.b	L_NonUSA_FF2528
L_NonUSA_FF2532:
	rts
L_NonUSA_FF2534:
	move.w	#$0, $a11100.l
L_NonUSA_FF253C:
	move.w	$FFFFcd08.w, sr
L_NonUSA_FF2540:
	rts
	dc.b	$41,$F9,$00,$A1
	dc.b	$20,$1E,$43,$F9,$00,$A1,$00,$03,$12,$BC,$00,$00,$4A,$50,$10,$11
	dc.b	$E5,$08,$02,$00,$00,$C0,$12,$BC,$00,$40,$4A,$50,$12,$11,$02,$01
	dc.b	$00,$3F,$80,$01,$46,$00,$12,$00,$14,$10,$B5,$00,$10,$C1,$C0,$01
	dc.b	$10,$C0,$4E,$75,$33,$FC,$01,$00,$00,$A1,$12,$00,$4E,$BA,$FF,$98
	dc.b	$43,$F9,$00,$A0,$00,$00,$12,$FC,$00,$F3,$12,$FC,$00,$F3,$12,$FC
	dc.b	$00,$C3,$12,$FC,$00,$00,$12,$FC,$00,$00,$33,$FC,$00,$00,$00,$A1
	dc.b	$12,$00,$E0,$18,$33,$FC,$01,$00,$00,$A1,$12,$00,$4E,$FA,$FF,$80
	dc.b	$4E,$75
L_NonUSA_FF25B8:
	move.b	d0, $FFFFf00b.w
L_NonUSA_FF25BC:
	rts
L_NonUSA_FF25BE:
	move.b	d0, $FFFFf00c.w
L_NonUSA_FF25C2:
	rts
L_NonUSA_FF25C4:
	jsr	$FF251C.l
L_NonUSA_FF25CA:
	tst.b	$FFFFf00b.w
L_NonUSA_FF25CE:
	beq.b	L_NonUSA_FF25E0
L_NonUSA_FF25D0:
	move.b	$FFFFf00b.w, $a01c09.l
L_NonUSA_FF25D8:
	move.b	#$0, $FFFFf00b.w
L_NonUSA_FF25DE:
	bra.b	L_NonUSA_FF25F4
L_NonUSA_FF25E0:
	tst.b	$FFFFf00c.w
L_NonUSA_FF25E4:
	beq.b	L_NonUSA_FF25F4
L_NonUSA_FF25E6:
	move.b	$FFFFf00c.w, $a01c09.l
L_NonUSA_FF25EE:
	move.b	#$0, $FFFFf00c.w
L_NonUSA_FF25F4:
	jmp	$FF2534.l
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
L_NonUSA_FF2702:
	move.b	#$1, $FFFFcd00.w
L_NonUSA_FF2708:
	move.w	#$2500, sr
L_NonUSA_FF270C:
	tst.b	$FFFFcd00.w
L_NonUSA_FF2710:
	bne.b	L_NonUSA_FF270C
L_NonUSA_FF2712:
	rts
L_NonUSA_FF2714:
	move.w	#$FF00, $a1201e.l
L_NonUSA_FF271C:
	rts
L_NonUSA_FF271E:
	move.l	d1, -(a7)
L_NonUSA_FF2720:
	move.l	$FFFFcd0e.w, d1
L_NonUSA_FF2724:
	bne.b	L_NonUSA_FF272C
L_NonUSA_FF2726:
	move.l	#$2A6D365A, d1
L_NonUSA_FF272C:
	move.l	d1, d0
L_NonUSA_FF272E:
	asl.l	#$2, d1
L_NonUSA_FF2730:
	add.l	d0, d1
L_NonUSA_FF2732:
	asl.l	#$3, d1
L_NonUSA_FF2734:
	add.l	d0, d1
L_NonUSA_FF2736:
	move.w	d1, d0
L_NonUSA_FF2738:
	swap	d1
L_NonUSA_FF273A:
	add.w	d1, d0
L_NonUSA_FF273C:
	move.w	d0, d1
L_NonUSA_FF273E:
	swap	d1
L_NonUSA_FF2740:
	move.l	d1, $FFFFcd0e.w
L_NonUSA_FF2744:
	move.l	(a7)+, d1
L_NonUSA_FF2746:
	rts
L_NonUSA_FF2748:
	dc.l	$00FF574A
	dc.l	$00FF5AFA
	dc.l	$00FF5B96
	dc.l	$00FF5EC4
	dc.l	$00FF60DA
	dc.l	$00FF5C50
L_NonUSA_FF2760:
	moveq	#$0, d0
L_NonUSA_FF2762:
	move.b	$1c(a0), d0
L_NonUSA_FF2766:
	cmp.b	$1d(a0), d0
L_NonUSA_FF276A:
	beq.b	L_NonUSA_FF277C
L_NonUSA_FF276C:
	move.b	d0, $1d(a0)
L_NonUSA_FF2770:
	move.b	#$0, $1b(a0)
L_NonUSA_FF2776:
	move.b	#$0, $1e(a0)
L_NonUSA_FF277C:
	subq.b	#$1, $1e(a0)
L_NonUSA_FF2780:
	bpl.b	L_NonUSA_FF27BC
L_NonUSA_FF2782:
	add.w	d0, d0
L_NonUSA_FF2784:
	adda.w	(a1, d0.w), a1
L_NonUSA_FF2788:
	move.b	(a1), $1e(a0)
L_NonUSA_FF278C:
	moveq	#$0, d1
L_NonUSA_FF278E:
	move.b	$1b(a0), d1
L_NonUSA_FF2792:
	move.b	$1(a1, d1.w), d0
L_NonUSA_FF2796:
	bmi.b	L_NonUSA_FF27BE
L_NonUSA_FF2798:
	move.b	d0, d1
L_NonUSA_FF279A:
	andi.b	#$1f, d0
L_NonUSA_FF279E:
	move.b	d0, $1a(a0)
L_NonUSA_FF27A2:
	move.b	$22(a0), d0
L_NonUSA_FF27A6:
	rol.b	#$3, d1
L_NonUSA_FF27A8:
	eor.b	d0, d1
L_NonUSA_FF27AA:
	andi.b	#$3, d1
L_NonUSA_FF27AE:
	andi.b	#$fc, $1(a0)
L_NonUSA_FF27B4:
	or.b	d1, $1(a0)
L_NonUSA_FF27B8:
	addq.b	#$1, $1b(a0)
L_NonUSA_FF27BC:
	rts
L_NonUSA_FF27BE:
	addq.b	#$1, d0
L_NonUSA_FF27C0:
	bne.b	L_NonUSA_FF27CE
L_NonUSA_FF27C2:
	move.b	#$0, $1b(a0)
L_NonUSA_FF27C8:
	move.b	$1(a1), d0
L_NonUSA_FF27CC:
	bra.b	L_NonUSA_FF2798
L_NonUSA_FF27CE:
	addq.b	#$1, d0
L_NonUSA_FF27D0:
	bne.b	L_NonUSA_FF27E2
L_NonUSA_FF27D2:
	move.b	$2(a1, d1.w), d0
L_NonUSA_FF27D6:
	sub.b	d0, $1b(a0)
L_NonUSA_FF27DA:
	sub.b	d0, d1
L_NonUSA_FF27DC:
	move.b	$1(a1, d1.w), d0
L_NonUSA_FF27E0:
	bra.b	L_NonUSA_FF2798
L_NonUSA_FF27E2:
	addq.b	#$1, d0
L_NonUSA_FF27E4:
	bne.b	L_NonUSA_FF27EC
L_NonUSA_FF27E6:
	move.b	$2(a1, d1.w), $1c(a0)
L_NonUSA_FF27EC:
	addq.b	#$1, d0
L_NonUSA_FF27EE:
	bne.b	L_NonUSA_FF27F4
L_NonUSA_FF27F0:
	addq.b	#$2, $24(a0)
L_NonUSA_FF27F4:
	addq.b	#$1, d0
L_NonUSA_FF27F6:
	bne.b	L_NonUSA_FF2802
L_NonUSA_FF27F8:
	move.b	#$0, $1b(a0)
L_NonUSA_FF27FE:
	clr.b	$25(a0)
L_NonUSA_FF2802:
	addq.b	#$1, d0
L_NonUSA_FF2804:
	bne.b	L_NonUSA_FF280A
L_NonUSA_FF2806:
	addq.b	#$2, $25(a0)
L_NonUSA_FF280A:
	rts
L_NonUSA_FF280C:
	lea.l	$FFFFb280.w, a0
L_NonUSA_FF2810:
	moveq	#$35, d7
L_NonUSA_FF2812:
	moveq	#$0, d0
L_NonUSA_FF2814:
	move.b	(a0), d0
L_NonUSA_FF2816:
	beq.b	L_NonUSA_FF282A
L_NonUSA_FF2818:
	add.w	d0, d0
L_NonUSA_FF281A:
	add.w	d0, d0
L_NonUSA_FF281C:
	lea.l	$FF2748.l, a1
L_NonUSA_FF2822:
	movea.l	-$4(a1, d0.w), a1
L_NonUSA_FF2826:
	jsr	(a1)
L_NonUSA_FF2828:
	moveq	#$0, d0
L_NonUSA_FF282A:
	lea.l	$40(a0), a0
L_NonUSA_FF282E:
	dbra	d7, L_NonUSA_FF2814
L_NonUSA_FF2832:
	rts
L_NonUSA_FF2834:
	moveq	#$0, d0
L_NonUSA_FF2836:
	move.b	$19(a0), d0
L_NonUSA_FF283A:
	move.w	$8(a0), d3
L_NonUSA_FF283E:
	sub.w	$FFFFc400.w, d3
L_NonUSA_FF2842:
	move.w	d3, d1
L_NonUSA_FF2844:
	add.w	d0, d1
L_NonUSA_FF2846:
	bmi.b	L_NonUSA_FF28B0
L_NonUSA_FF2848:
	move.w	d3, d1
L_NonUSA_FF284A:
	sub.w	d0, d1
L_NonUSA_FF284C:
	cmpi.w	#$140, d1
L_NonUSA_FF2850:
	bge.b	L_NonUSA_FF28B0
L_NonUSA_FF2852:
	move.b	$16(a0), d0
L_NonUSA_FF2856:
	move.w	$c(a0), d3
L_NonUSA_FF285A:
	cmpi.w	#$100, $FFFFc404.w
L_NonUSA_FF2860:
	bcc.b	L_NonUSA_FF286E
L_NonUSA_FF2862:
	cmpi.w	#$800, d3
L_NonUSA_FF2866:
	bcs.b	L_NonUSA_FF2880
L_NonUSA_FF2868:
	subi.w	#$800, d3
L_NonUSA_FF286C:
	bra.b	L_NonUSA_FF2880
L_NonUSA_FF286E:
	cmpi.w	#$700, $FFFFc404.w
L_NonUSA_FF2874:
	bcs.b	L_NonUSA_FF2880
L_NonUSA_FF2876:
	cmpi.w	#$100, d3
L_NonUSA_FF287A:
	bcc.b	L_NonUSA_FF2880
L_NonUSA_FF287C:
	addi.w	#$800, d3
L_NonUSA_FF2880:
	sub.w	$FFFFc404.w, d3
L_NonUSA_FF2884:
	move.w	d3, d1
L_NonUSA_FF2886:
	add.w	d0, d1
L_NonUSA_FF2888:
	bmi.b	L_NonUSA_FF28B0
L_NonUSA_FF288A:
	move.w	d3, d1
L_NonUSA_FF288C:
	sub.w	d0, d1
L_NonUSA_FF288E:
	cmpi.w	#$E0, d1
L_NonUSA_FF2892:
	bge.b	L_NonUSA_FF28B0
L_NonUSA_FF2894:
	lea.l	$FFFFc000.w, a1
L_NonUSA_FF2898:
	move.w	$18(a0), d0
L_NonUSA_FF289C:
	lsr.w	#$1, d0
L_NonUSA_FF289E:
	andi.w	#$380, d0
L_NonUSA_FF28A2:
	adda.w	d0, a1
L_NonUSA_FF28A4:
	cmpi.w	#$7E, (a1)
L_NonUSA_FF28A8:
	bcc.b	L_NonUSA_FF28B0
L_NonUSA_FF28AA:
	addq.w	#$2, (a1)
L_NonUSA_FF28AC:
	adda.w	(a1), a1
L_NonUSA_FF28AE:
	move.w	a0, (a1)
L_NonUSA_FF28B0:
	rts
	dc.l	$22487200
	dc.l	$700F22C1
	dc.l	$51C8FFFC
	dc.l	$4E750000
	dc.l	$0000FFFF
	dc.l	$C400FFFF
	dc.l	$C408FFFF
	dc.b	$C4,$18
L_NonUSA_FF28D0:
	lea.l	$FFFFb000.w, a2
L_NonUSA_FF28D4:
	moveq	#$0, d5
L_NonUSA_FF28D6:
	lea.l	$FFFFc000.w, a4
L_NonUSA_FF28DA:
	moveq	#$7, d7
L_NonUSA_FF28DC:
	tst.w	(a4)
L_NonUSA_FF28DE:
	beq.w	L_NonUSA_FF299C
L_NonUSA_FF28E2:
	moveq	#$2, d6
L_NonUSA_FF28E4:
	movea.w	(a4, d6.w), a0
L_NonUSA_FF28E8:
	tst.b	(a0)
L_NonUSA_FF28EA:
	beq.w	L_NonUSA_FF2994
L_NonUSA_FF28EE:
	move.b	$1(a0), d0
L_NonUSA_FF28F2:
	move.b	d0, d4
L_NonUSA_FF28F4:
	andi.w	#$C, d0
L_NonUSA_FF28F8:
	beq.w	L_NonUSA_FF294A
L_NonUSA_FF28FC:
	movea.l	$FF28C0(pc, d0.w), a1
L_NonUSA_FF2900:
	moveq	#$0, d0
L_NonUSA_FF2902:
	move.b	$19(a0), d0
L_NonUSA_FF2906:
	move.w	$8(a0), d3
L_NonUSA_FF290A:
	sub.w	(a1), d3
L_NonUSA_FF290C:
	addi.w	#$80, d3
L_NonUSA_FF2910:
	moveq	#$0, d0
L_NonUSA_FF2912:
	move.b	$16(a0), d0
L_NonUSA_FF2916:
	move.w	$c(a0), d2
L_NonUSA_FF291A:
	cmpi.w	#$100, $4(a1)
L_NonUSA_FF2920:
	bcc.b	L_NonUSA_FF292E
L_NonUSA_FF2922:
	cmpi.w	#$800, d2
L_NonUSA_FF2926:
	bcs.b	L_NonUSA_FF2940
L_NonUSA_FF2928:
	subi.w	#$800, d2
L_NonUSA_FF292C:
	bra.b	L_NonUSA_FF2940
L_NonUSA_FF292E:
	cmpi.w	#$700, $4(a1)
L_NonUSA_FF2934:
	bcs.b	L_NonUSA_FF2940
L_NonUSA_FF2936:
	cmpi.w	#$100, d2
L_NonUSA_FF293A:
	bcc.b	L_NonUSA_FF2940
L_NonUSA_FF293C:
	addi.w	#$800, d2
L_NonUSA_FF2940:
	sub.w	$4(a1), d2
L_NonUSA_FF2944:
	addi.w	#$80, d2
L_NonUSA_FF2948:
	bra.b	L_NonUSA_FF296C
L_NonUSA_FF294A:
	move.w	$a(a0), d2
L_NonUSA_FF294E:
	move.w	$8(a0), d3
L_NonUSA_FF2952:
	bra.b	L_NonUSA_FF296C
	dc.l	$3428000C
	dc.l	$94690004
	dc.l	$06420080
	dc.l	$0C420060
	dc.l	$652E0C42
	dc.l	$01806428
L_NonUSA_FF296C:
	movea.l	$4(a0), a1
L_NonUSA_FF2970:
	moveq	#$0, d1
L_NonUSA_FF2972:
	btst	#$5, d4
L_NonUSA_FF2976:
	bne.b	L_NonUSA_FF298A
L_NonUSA_FF2978:
	move.b	$1a(a0), d1
L_NonUSA_FF297C:
	add.w	d1, d1
L_NonUSA_FF297E:
	adda.w	(a1, d1.w), a1
L_NonUSA_FF2982:
	moveq	#$0, d1
L_NonUSA_FF2984:
	move.b	(a1)+, d1
L_NonUSA_FF2986:
	subq.b	#$1, d1
L_NonUSA_FF2988:
	bmi.b	L_NonUSA_FF298E
L_NonUSA_FF298A:
	bsr.w	$FF29BE
L_NonUSA_FF298E:
	bset.b	#$7, $1(a0)
L_NonUSA_FF2994:
	addq.w	#$2, d6
L_NonUSA_FF2996:
	subq.w	#$2, (a4)
L_NonUSA_FF2998:
	bne.w	L_NonUSA_FF28E4
L_NonUSA_FF299C:
	lea.l	$80(a4), a4
L_NonUSA_FF29A0:
	dbra	d7, L_NonUSA_FF28DC
L_NonUSA_FF29A4:
	move.b	d5, $FFFFcd01.w
L_NonUSA_FF29A8:
	cmpi.b	#$50, d5
L_NonUSA_FF29AC:
	beq.b	L_NonUSA_FF29B6
L_NonUSA_FF29AE:
	move.l	#$0, (a2)
L_NonUSA_FF29B4:
	rts
L_NonUSA_FF29B6:
	move.b	#$0, -$5(a2)
L_NonUSA_FF29BC:
	rts
L_NonUSA_FF29BE:
	movea.w	$2(a0), a3
L_NonUSA_FF29C2:
	btst	#$0, d4
L_NonUSA_FF29C6:
	bne.b	$FF2A04
L_NonUSA_FF29C8:
	btst	#$1, d4
L_NonUSA_FF29CC:
	bne.w	$FF2A52
L_NonUSA_FF29D0:
	cmpi.b	#$50, d5
L_NonUSA_FF29D4:
	beq.b	L_NonUSA_FF2A02
L_NonUSA_FF29D6:
	move.b	(a1)+, d0
L_NonUSA_FF29D8:
	ext.w	d0
L_NonUSA_FF29DA:
	add.w	d2, d0
L_NonUSA_FF29DC:
	move.w	d0, (a2)+
L_NonUSA_FF29DE:
	move.b	(a1)+, (a2)+
L_NonUSA_FF29E0:
	addq.b	#$1, d5
L_NonUSA_FF29E2:
	move.b	d5, (a2)+
L_NonUSA_FF29E4:
	move.b	(a1)+, d0
L_NonUSA_FF29E6:
	lsl.w	#$8, d0
L_NonUSA_FF29E8:
	move.b	(a1)+, d0
L_NonUSA_FF29EA:
	add.w	a3, d0
L_NonUSA_FF29EC:
	move.w	d0, (a2)+
L_NonUSA_FF29EE:
	move.b	(a1)+, d0
L_NonUSA_FF29F0:
	ext.w	d0
L_NonUSA_FF29F2:
	add.w	d3, d0
L_NonUSA_FF29F4:
	andi.w	#$1FF, d0
L_NonUSA_FF29F8:
	bne.b	L_NonUSA_FF29FC
L_NonUSA_FF29FA:
	addq.w	#$1, d0
L_NonUSA_FF29FC:
	move.w	d0, (a2)+
L_NonUSA_FF29FE:
	dbra	d1, L_NonUSA_FF29D0
L_NonUSA_FF2A02:
	rts
L_NonUSA_FF2A04:
	btst	#$1, d4
L_NonUSA_FF2A08:
	bne.w	$FF2A98
L_NonUSA_FF2A0C:
	cmpi.b	#$50, d5
L_NonUSA_FF2A10:
	beq.b	L_NonUSA_FF2A50
L_NonUSA_FF2A12:
	move.b	(a1)+, d0
L_NonUSA_FF2A14:
	ext.w	d0
L_NonUSA_FF2A16:
	add.w	d2, d0
L_NonUSA_FF2A18:
	move.w	d0, (a2)+
L_NonUSA_FF2A1A:
	move.b	(a1)+, d4
L_NonUSA_FF2A1C:
	move.b	d4, (a2)+
L_NonUSA_FF2A1E:
	addq.b	#$1, d5
L_NonUSA_FF2A20:
	move.b	d5, (a2)+
L_NonUSA_FF2A22:
	move.b	(a1)+, d0
L_NonUSA_FF2A24:
	lsl.w	#$8, d0
L_NonUSA_FF2A26:
	move.b	(a1)+, d0
L_NonUSA_FF2A28:
	add.w	a3, d0
L_NonUSA_FF2A2A:
	eori.w	#$800, d0
L_NonUSA_FF2A2E:
	move.w	d0, (a2)+
L_NonUSA_FF2A30:
	move.b	(a1)+, d0
L_NonUSA_FF2A32:
	ext.w	d0
L_NonUSA_FF2A34:
	neg.w	d0
L_NonUSA_FF2A36:
	add.b	d4, d4
L_NonUSA_FF2A38:
	andi.w	#$18, d4
L_NonUSA_FF2A3C:
	addq.w	#$8, d4
L_NonUSA_FF2A3E:
	sub.w	d4, d0
L_NonUSA_FF2A40:
	add.w	d3, d0
L_NonUSA_FF2A42:
	andi.w	#$1FF, d0
L_NonUSA_FF2A46:
	bne.b	L_NonUSA_FF2A4A
L_NonUSA_FF2A48:
	addq.w	#$1, d0
L_NonUSA_FF2A4A:
	move.w	d0, (a2)+
L_NonUSA_FF2A4C:
	dbra	d1, L_NonUSA_FF2A0C
L_NonUSA_FF2A50:
	rts
L_NonUSA_FF2A52:
	cmpi.b	#$50, d5
L_NonUSA_FF2A56:
	beq.b	L_NonUSA_FF2A96
L_NonUSA_FF2A58:
	move.b	(a1)+, d0
L_NonUSA_FF2A5A:
	move.b	(a1), d4
L_NonUSA_FF2A5C:
	ext.w	d0
L_NonUSA_FF2A5E:
	neg.w	d0
L_NonUSA_FF2A60:
	lsl.b	#$3, d4
L_NonUSA_FF2A62:
	andi.w	#$18, d4
L_NonUSA_FF2A66:
	addq.w	#$8, d4
L_NonUSA_FF2A68:
	sub.w	d4, d0
L_NonUSA_FF2A6A:
	add.w	d2, d0
L_NonUSA_FF2A6C:
	move.w	d0, (a2)+
L_NonUSA_FF2A6E:
	move.b	(a1)+, (a2)+
L_NonUSA_FF2A70:
	addq.b	#$1, d5
L_NonUSA_FF2A72:
	move.b	d5, (a2)+
L_NonUSA_FF2A74:
	move.b	(a1)+, d0
L_NonUSA_FF2A76:
	lsl.w	#$8, d0
L_NonUSA_FF2A78:
	move.b	(a1)+, d0
L_NonUSA_FF2A7A:
	add.w	a3, d0
L_NonUSA_FF2A7C:
	eori.w	#$1000, d0
L_NonUSA_FF2A80:
	move.w	d0, (a2)+
L_NonUSA_FF2A82:
	move.b	(a1)+, d0
L_NonUSA_FF2A84:
	ext.w	d0
L_NonUSA_FF2A86:
	add.w	d3, d0
L_NonUSA_FF2A88:
	andi.w	#$1FF, d0
L_NonUSA_FF2A8C:
	bne.b	L_NonUSA_FF2A90
L_NonUSA_FF2A8E:
	addq.w	#$1, d0
L_NonUSA_FF2A90:
	move.w	d0, (a2)+
L_NonUSA_FF2A92:
	dbra	d1, L_NonUSA_FF2A52
L_NonUSA_FF2A96:
	rts
	dc.b	$0C,$05,$00,$50
	dc.b	$67,$4C,$10,$19,$18,$11,$48,$80,$44,$40
	dc.b	$E7,$0C,$02,$44,$00,$18,$50,$44,$90,$44,$D0,$42,$34,$C0,$18,$19
	dc.b	$14,$C4,$52,$05,$14,$C5,$10,$19,$E1,$48,$10,$19,$D0,$4B,$0A,$40
	dc.b	$18,$00,$34,$C0,$10,$19,$48,$80,$44,$40,$D8,$04,$02,$44,$00,$18
	dc.b	$50,$44,$90,$44,$D0,$43,$02,$40,$01,$FF,$66,$02,$52,$40,$34,$C0
	dc.b	$51,$C9,$FF,$B0,$4E,$75,$30,$28,$00,$08,$90,$78,$C4,$00,$6B,$1A
	dc.b	$0C,$40,$01,$40,$6C,$14,$32,$28,$00,$0C,$92,$78,$C4,$04,$6B,$0A
	dc.b	$0C,$41,$00,$E0,$6C,$04,$70,$00,$4E,$75,$70,$01,$4E,$75,$72,$00
	dc.b	$12,$28,$00,$19,$30,$28,$00,$08,$90,$78,$C4,$00,$D0,$41,$6B,$1E
	dc.b	$D2,$41,$90,$41,$0C,$40,$01,$40,$6C,$14,$32,$28,$00,$0C,$92,$78
	dc.b	$C4,$04,$6B,$0A,$0C,$41,$00,$E0,$6C,$04,$70,$00,$4E,$75,$70,$01
	dc.b	$4E,$75,$70,$00,$10,$39,$00,$20,$00,$20,$67,$40,$53,$40,$0C,$40
	dc.b	$00,$09,$64,$1E,$D0,$40,$41,$F9,$00,$FF,$2B,$94,$30,$30,$00,$00
	dc.b	$72,$00,$4E,$B0,$00,$00,$65,$0A,$13,$FC,$00,$00,$00,$20,$00,$21
	dc.b	$60,$08,$13,$FC,$00,$FF,$00,$20,$00,$21,$33,$C0,$00,$20,$00,$22
	dc.b	$33,$C1,$00,$20,$00,$24,$42,$39,$00,$20,$00,$20,$4E,$75,$00,$12
	dc.b	$00,$24,$00,$30,$00,$4A,$00,$6C,$00,$90,$00,$AA,$00,$B0,$00,$D6
	dc.b	$41,$F9,$00,$FF,$2C,$8C,$43,$F9,$00,$FF,$39,$0C,$70,$00,$4E,$F8
	dc.b	$FD,$AE,$70,$01,$22,$7C,$00,$FF,$39,$0C,$4E,$F8,$FD,$AE,$20,$7C
	dc.b	$00,$20,$00,$30,$11,$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00,$00
	dc.b	$00,$0C,$70,$02,$4E,$F8,$FD,$AE,$20,$7C,$00,$20,$00,$30,$11,$7C
	dc.b	$00,$00,$00,$0B,$21,$7C,$00,$00,$00,$00,$00,$0C,$22,$7C,$00,$20
	dc.b	$00,$40,$70,$03,$4E,$B8,$FD,$AE,$4E,$75,$20,$7C,$00,$20,$00,$30
	dc.b	$11,$79,$00,$20,$00,$29,$00,$0B,$31,$79,$00,$20,$00,$2A,$00,$0C
	dc.b	$22,$7C,$00,$20,$00,$40,$70,$04,$4E,$B8,$FD,$AE,$4E,$75,$20,$7C
	dc.b	$00,$20,$00,$30,$11,$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00,$00
	dc.b	$00,$0C,$70,$05,$4E,$F8,$FD,$AE,$70,$06,$4E,$F8,$FD,$AE,$20,$7C
	dc.b	$00,$20,$00,$30,$11,$7C,$00,$00,$00,$0B,$21,$7C,$00,$00,$00,$00
	dc.b	$00,$0C,$22,$7C,$00,$20,$00,$44,$22,$39,$00,$20,$00,$40,$70,$07
	dc.b	$4E,$F8,$FD,$AE,$20,$7C,$00,$20,$00,$30,$11,$79,$00,$20,$00,$29
	dc.b	$00,$0B,$31,$79,$00,$20,$00,$2A,$00,$0C,$22,$7C,$00,$20,$00,$40
	dc.b	$70,$08,$4E,$F8,$FD,$AE,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05,$00,$00,$00,$05
	dc.b	$00,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B,$0B,$00,$0B,$0B
	dc.b	$0B,$00,$23,$19,$1F,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$61,$00,$00,$16,$66,$02,$42,$00,$13,$C0,$00,$20
	dc.b	$00,$26,$4E,$75,$4A,$39,$00,$20,$00,$26,$4E,$75,$4A,$39,$00,$20
	dc.b	$00,$27,$4E,$75,$61,$00,$00,$BE,$61,$00,$00,$54,$61,$00,$00,$08
	dc.b	$4E,$75,$60,$00,$02,$E6,$60,$00,$02,$B6,$4E,$B9,$00,$FF,$23,$72
	dc.b	$41,$F9,$00,$FF,$39,$18,$43,$F9,$00,$20,$00,$40,$30,$3C,$00,$A8
	dc.b	$22,$D8,$51,$C8,$FF,$FC,$41,$F9,$00,$FF,$3B,$BC,$43,$F9,$00,$20
	dc.b	$02,$E4,$30,$3C,$00,$06,$22,$D8,$51,$C8,$FF,$FC,$13,$FC,$00,$00
	dc.b	$00,$20,$00,$29,$33,$FC,$00,$0B,$00,$20,$00,$2A,$4E,$75,$13,$FC
	dc.b	$00,$00,$00,$20,$00,$29,$33,$FC,$00,$0B,$00,$20,$00,$2A,$41,$F9
	dc.b	$00,$FF,$3C,$6C,$60,$0C,$53,$4F,$4E,$49,$43,$43,$44,$5F,$5F,$5F
	dc.b	$5F,$00,$48,$E7,$00,$C0,$22,$7C,$00,$20,$00,$30,$22,$D8,$22,$D8
	dc.b	$32,$D8,$12,$D8,$4C,$DF,$03,$00,$4E,$75,$61,$00,$FF,$58,$66,$18
	dc.b	$13,$F9,$00,$FF,$0F,$1F,$00,$20,$00,$28,$4E,$B9,$00,$FF,$23,$5E
	dc.b	$4E,$B9,$00,$FF,$23,$72,$60,$04,$61,$00,$EE,$98,$4A,$39,$00,$20
	dc.b	$00,$21,$4E,$75,$4E,$B9,$00,$FF,$23,$72,$61,$00,$00,$82,$66,$00
	dc.b	$00,$24,$13,$FC,$00,$01,$00,$20,$00,$26,$13,$FC,$00,$01,$00,$20
	dc.b	$00,$20,$61,$B6,$4A,$39,$00,$20,$00,$21,$67,$12,$4A,$79,$00,$20
	dc.b	$00,$24,$66,$54,$13,$FC,$00,$00,$00,$20,$00,$27,$60,$0C,$61,$00
	dc.b	$01,$98,$13,$FC,$00,$01,$00,$20,$00,$27,$13,$FC,$00,$00,$00,$20
	dc.b	$00,$26,$13,$FC,$00,$01,$00,$20,$00,$20,$61,$00,$FF,$7E,$4A,$39
	dc.b	$00,$20,$00,$21,$66,$1C,$61,$00,$01,$70,$4A,$39,$00,$20,$00,$27
	dc.b	$67,$06,$30,$3C,$00,$00,$4E,$75,$30,$3C,$00,$01,$32,$3C,$00,$00
	dc.b	$4E,$75,$30,$3C,$FF,$FF,$4E,$75,$30,$3C,$FF,$FE,$4E,$75,$08,$39
	dc.b	$00,$07,$00,$40,$00,$01,$67,$26,$41,$F9,$00,$40,$00,$10,$43,$F9
	dc.b	$00,$FF,$3E,$44,$70,$02,$B3,$88,$66,$14,$51,$C8,$FF,$FA,$20,$7C
	dc.b	$FF,$FF,$FD,$AE,$4E,$B9,$00,$40,$00,$20,$60,$00,$00,$C6,$08,$39
	dc.b	$00,$07,$00,$40,$00,$01,$66,$00,$00,$C2,$10,$39,$00,$40,$00,$01
	dc.b	$02,$80,$00,$00,$00,$07,$22,$3C,$00,$00,$20,$00,$E1,$A9,$E3,$89
	dc.b	$45,$F9,$00,$5F,$FF,$80,$D5,$C1,$20,$4A,$D0,$FC,$00,$60,$43,$F9
	dc.b	$00,$FF,$3E,$44,$03,$48,$00,$01,$B2,$91,$66,$00,$00,$4C,$03,$48
	dc.b	$00,$09,$B2,$A9,$00,$04,$66,$00,$00,$40,$03,$48,$00,$11,$B2,$A9
	dc.b	$00,$08,$66,$00,$00,$34,$20,$4A,$D0,$FC,$00,$40,$43,$F9,$00,$FF
	dc.b	$3E,$50,$03,$48,$00,$01,$B2,$91,$66,$00,$00,$1E,$03,$48,$00,$09
	dc.b	$B2,$A9,$00,$04,$66,$00,$00,$12,$03,$48,$00,$11,$B2,$A9,$00,$08
	dc.b	$66,$00,$00,$06,$60,$00,$00,$3C,$08,$F9,$00,$00,$00,$7F,$FF,$FF
	dc.b	$41,$F9,$00,$60,$00,$01,$10,$10,$10,$BC,$00,$5A,$0C,$10,$00,$5A
	dc.b	$66,$16,$10,$BC,$00,$A5,$0C,$10,$00,$A5,$66,$0C,$10,$80,$08,$B9
	dc.b	$00,$00,$00,$7F,$FF,$FF,$60,$0E,$08,$B9,$00,$00,$00,$7F,$FF,$FF
	dc.b	$60,$08,$70,$00,$4E,$75,$70,$00,$4E,$75,$70,$FF,$4E,$75,$52,$41
	dc.b	$4D,$5F,$43,$41,$52,$54,$52,$49,$44,$47,$53,$45,$47,$41,$5F,$43
	dc.b	$44,$5F,$52,$4F,$4D,$00,$2F,$00,$4E,$B9,$00,$FF,$23,$72,$20,$1F
	dc.b	$23,$C0,$00,$20,$00,$40,$41,$F9,$00,$FF,$3E,$82,$61,$00,$FE,$04
	dc.b	$13,$FC,$00,$08,$00,$20,$00,$20,$60,$00,$FE,$10,$2A,$2A,$2A,$2A
	dc.b	$2A,$2A,$2A,$2A,$2A,$2A,$2A,$00,$4E,$B9,$00,$FF,$23,$72,$13,$FC
	dc.b	$00,$02,$00,$20,$00,$20,$60,$00,$FD,$F2,$4E,$B9,$00,$FF,$23,$72
	dc.b	$13,$FC,$00,$03,$00,$20,$00,$20,$60,$00,$FD,$E0,$4E,$B9,$00,$FF
	dc.b	$23,$72,$13,$FC,$00,$04,$00,$20,$00,$20,$60,$00,$FD,$CE,$4E,$B9
	dc.b	$00,$FF,$23,$72,$13,$FC,$00,$0A,$00,$20,$00,$20,$60,$00,$FD,$BC
	dc.b	$4E,$B9,$00,$FF,$23,$72,$13,$FC,$00,$05,$00,$20,$00,$20,$61,$00
	dc.b	$FD,$AA,$66,$04,$61,$00,$00,$3C,$4E,$75,$4E,$B9,$00,$FF,$23,$72
	dc.b	$13,$FC,$00,$0B,$00,$20,$00,$20,$61,$00,$FD,$90,$4E,$75,$4E,$B9
	dc.b	$00,$FF,$23,$72,$13,$FC,$00,$06,$00,$20,$00,$20,$60,$00,$FD,$7C
	dc.b	$4E,$B9,$00,$FF,$23,$72,$13,$FC,$00,$07,$00,$20,$00,$20,$60,$00
	dc.b	$FD,$6A,$4E,$B9,$00,$FF,$23,$72,$13,$FC,$00,$09,$00,$20,$00,$20
	dc.b	$60,$00,$FD,$58,$08,$B9,$00,$06,$00,$FF,$0F,$17,$33,$F9,$00,$FF
	dc.b	$0F,$16,$00,$C0,$00,$04,$61,$00,$E4,$48,$23,$FC,$60,$00,$00,$03
	dc.b	$00,$C0,$00,$04,$3E,$3C,$07,$FF,$33,$FC,$40,$26,$00,$C0,$00,$00
	dc.b	$51,$CF,$FF,$F6,$20,$3C,$01,$02,$03,$04,$4E,$B9,$00,$FF,$62,$80
	dc.b	$20,$3C,$05,$06,$07,$08,$4E,$B9,$00,$FF,$62,$80,$30,$3C,$00,$00
	dc.b	$4E,$B9,$00,$FF,$64,$AA,$30,$3C,$00,$01,$4E,$B9,$00,$FF,$64,$AA
	dc.b	$41,$F8,$B0,$00,$70,$00,$20,$C0,$20,$C0,$4E,$B9,$00,$FF,$67,$00
	dc.b	$61,$00,$E7,$5A,$08,$F9,$00,$06,$00,$FF,$0F,$17,$33,$F9,$00,$FF
	dc.b	$0F,$16,$00,$C0,$00,$04,$4E,$75,$70,$00,$10,$38,$CD,$15,$D0,$40
	dc.b	$30,$3B,$00,$08,$4E,$BB,$00,$04,$4E,$75,$00,$38,$01,$A6,$00,$EA
	dc.b	$03,$36,$07,$62,$0B,$D4,$0C,$7A,$0A,$D4,$00,$32,$0A,$B8,$70,$1E
	dc.b	$48,$E7,$80,$00,$11,$FC,$00,$FF,$CD,$20,$61,$00,$E0,$F2,$4C,$DF
	dc.b	$00,$01,$51,$C8,$FF,$EC,$50,$8F,$60,$00,$E0,$8E,$50,$8F,$60,$00
	dc.b	$E0,$28,$41,$F9,$00,$FF,$4D,$56,$4A,$39,$00,$FF,$0F,$1F,$67,$06
	dc.b	$41,$F9,$00,$FF,$4D,$50,$61,$00,$0C,$72,$61,$00,$02,$52,$0C,$38
	dc.b	$00,$05,$CD,$1E,$67,$36,$0C,$38,$00,$06,$CD,$1E,$67,$0A,$61,$00
	dc.b	$0F,$14,$6E,$00,$00,$4C,$4E,$75,$11,$FC,$00,$06,$CD,$16,$31,$FC
	dc.b	$00,$01,$CD,$14,$11,$FC,$00,$01,$CD,$25,$11,$FC,$00,$00,$CD,$21
	dc.b	$11,$FC,$00,$00,$CD,$24,$61,$00,$14,$22,$4E,$75,$11,$FC,$00,$05
	dc.b	$CD,$16,$31,$FC,$00,$01,$CD,$14,$11,$FC,$00,$01,$CD,$24,$11,$FC
	dc.b	$00,$00,$CD,$21,$11,$FC,$00,$00,$CD,$25,$61,$00,$13,$FE,$4E,$75
	dc.b	$10,$38,$CD,$1E,$0C,$00,$00,$01,$67,$08,$0C,$00,$00,$02,$67,$06
	dc.b	$4E,$75,$60,$00,$FF,$4A,$11,$FC,$00,$02,$CD,$16,$11,$FC,$00,$FF
	dc.b	$CD,$21,$31,$FC,$00,$02,$CD,$14,$11,$FC,$00,$03,$CD,$1E,$61,$00
	dc.b	$0F,$5E,$4E,$75,$0C,$38,$00,$06,$CD,$16,$66,$26,$61,$00,$FB,$2E
	dc.b	$66,$20,$61,$00,$0E,$60,$30,$29,$00,$06,$61,$00,$15,$7E,$61,$00
	dc.b	$10,$5E,$67,$0E,$11,$FC,$00,$04,$CD,$1E,$41,$F9,$00,$FF,$4D,$60
	dc.b	$60,$06,$41,$F9,$00,$FF,$4D,$66,$61,$00,$0B,$A0,$61,$00,$01,$A6
	dc.b	$61,$00,$0E,$52,$6E,$04,$6B,$3E,$4E,$75,$0C,$38,$00,$03,$CD,$1E
	dc.b	$67,$16,$0C,$38,$00,$01,$CD,$1E,$67,$1C,$11,$FC,$00,$28,$CD,$23
	dc.b	$31,$FC,$00,$04,$CD,$14,$4E,$75,$11,$FC,$00,$28,$CD,$22,$31,$FC
	dc.b	$00,$03,$CD,$14,$4E,$75,$60,$00,$FE,$B6,$30,$3C,$00,$9E,$4E,$B9
	dc.b	$00,$FF,$25,$B8,$4E,$75,$61,$00,$15,$D8,$0C,$38,$00,$02,$CD,$16
	dc.b	$67,$0E,$31,$FC,$00,$01,$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$60,$0C
	dc.b	$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$11,$FC,$00,$00
	dc.b	$CD,$23,$11,$FC,$00,$00,$CD,$22,$11,$FC,$00,$00,$CD,$21,$4E,$75
	dc.b	$61,$00,$0D,$C2,$08,$00,$00,$00,$67,$10,$30,$3C,$00,$9B,$4E,$B9
	dc.b	$00,$FF,$25,$B8,$61,$00,$0C,$5A,$60,$78,$08,$00,$00,$01,$67,$10
	dc.b	$30,$3C,$00,$9B,$4E,$B9,$00,$FF,$25,$B8,$61,$00,$0C,$D4,$60,$62
	dc.b	$08,$00,$00,$02,$67,$08,$4A,$38,$CD,$25,$66,$58,$60,$54,$08,$00
	dc.b	$00,$03,$67,$08,$4A,$38,$CD,$24,$66,$4A,$60,$46,$61,$00,$0D,$86
	dc.b	$67,$40,$6B,$3E,$61,$00,$0D,$5E,$30,$29,$00,$10,$B0,$69,$00,$06
	dc.b	$67,$30,$30,$29,$00,$06,$B0,$69,$00,$08,$6C,$26,$4A,$38,$CD,$24
	dc.b	$67,$08,$11,$FC,$00,$FF,$CD,$24,$60,$06,$11,$FC,$00,$FF,$CD,$25
	dc.b	$61,$00,$0E,$1C,$31,$FC,$00,$02,$CD,$14,$11,$FC,$00,$03,$CD,$1E
	dc.b	$4E,$75,$4E,$75,$61,$00,$12,$62,$11,$FC,$00,$00,$CD,$21,$11,$FC
	dc.b	$00,$00,$CD,$25,$11,$FC,$00,$00,$CD,$24,$31,$FC,$00,$00,$CD,$14
	dc.b	$11,$FC,$00,$01,$CD,$1E,$4E,$75,$10,$3C,$00,$00,$0C,$38,$00,$06
	dc.b	$CD,$16,$67,$12,$0C,$38,$00,$05,$CD,$16,$67,$14,$11,$C0,$CD,$25
	dc.b	$11,$C0,$CD,$24,$60,$60,$11,$C0,$CD,$21,$11,$C0,$CD,$24,$60,$56
	dc.b	$11,$C0,$CD,$25,$11,$C0,$CD,$21,$60,$4C,$11,$FC,$00,$00,$CD,$25
	dc.b	$11,$FC,$00,$00,$CD,$20,$11,$FC,$00,$00,$CD,$24,$60,$38,$11,$FC
	dc.b	$00,$00,$CD,$21,$11,$FC,$00,$00,$CD,$25,$11,$FC,$00,$00,$CD,$20
	dc.b	$11,$FC,$00,$00,$CD,$24,$11,$FC,$00,$00,$CD,$22,$11,$FC,$00,$00
	dc.b	$CD,$23,$60,$12,$11,$FC,$00,$00,$CD,$22,$11,$FC,$00,$00,$CD,$23
	dc.b	$11,$FC,$00,$00,$CD,$20,$10,$38,$CD,$1E,$0C,$00,$00,$01,$67,$20
	dc.b	$0C,$00,$00,$02,$67,$22,$0C,$00,$00,$03,$67,$24,$0C,$00,$00,$04
	dc.b	$67,$26,$0C,$00,$00,$05,$67,$28,$0C,$00,$00,$06,$67,$2A,$4E,$75
	dc.b	$11,$FC,$00,$01,$CD,$20,$4E,$75,$11,$FC,$00,$01,$CD,$21,$4E,$75
	dc.b	$11,$FC,$00,$01,$CD,$22,$4E,$75,$11,$FC,$00,$01,$CD,$23,$4E,$75
	dc.b	$11,$FC,$00,$01,$CD,$24,$4E,$75,$11,$FC,$00,$01,$CD,$25,$4E,$75
	dc.b	$70,$00,$10,$38,$CD,$14,$D0,$40,$30,$3B,$00,$06,$4E,$FB,$00,$02
	dc.b	$00,$18,$00,$CC,$01,$3E,$01,$52,$01,$7E,$02,$18,$02,$D8,$02,$F8
	dc.b	$03,$4C,$03,$70,$03,$92,$03,$B4,$61,$00,$13,$E6,$0C,$38,$00,$02
	dc.b	$CD,$16,$67,$00,$00,$7C,$61,$00,$0B,$EC,$30,$29,$00,$06,$61,$00
	dc.b	$13,$0A,$61,$00,$0D,$EA,$67,$4C,$0C,$38,$00,$05,$CD,$16,$67,$0E
	dc.b	$11,$FC,$00,$05,$CD,$1E,$11,$FC,$00,$05,$CD,$17,$60,$0C,$11,$FC
	dc.b	$00,$06,$CD,$1E,$11,$FC,$00,$06,$CD,$17,$61,$00,$0C,$6A,$61,$00
	dc.b	$13,$84,$67,$18,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E
	dc.b	$61,$00,$13,$8E,$30,$3C,$00,$0D,$60,$00,$08,$A8,$11,$FC,$00,$09
	dc.b	$CD,$14,$4E,$75,$11,$FC,$00,$02,$CD,$1E,$61,$00,$F8,$50,$67,$08
	dc.b	$30,$3C,$00,$02,$61,$00,$08,$B2,$11,$FC,$00,$05,$CD,$14,$4E,$75
	dc.b	$41,$F8,$CD,$30,$10,$3C,$00,$30,$11,$40,$00,$09,$11,$40,$00,$0A
	dc.b	$61,$00,$F8,$2A,$67,$08,$30,$3C,$00,$02,$61,$00,$08,$8C,$11,$FC
	dc.b	$00,$01,$CD,$14,$11,$FC,$00,$06,$CD,$1E,$4E,$75,$61,$00,$F8,$0E
	dc.b	$67,$2C,$41,$F9,$00,$FF,$4D,$70,$61,$00,$08,$A0,$61,$00,$FE,$6C
	dc.b	$11,$FC,$00,$FF,$CD,$21,$61,$00,$0B,$4C,$6E,$06,$6B,$00,$00,$3A
	dc.b	$4E,$75,$61,$00,$08,$7C,$0C,$38,$00,$05,$CD,$1E,$67,$08,$11,$FC
	dc.b	$00,$28,$CD,$25,$60,$06,$11,$FC,$00,$28,$CD,$24,$11,$F8,$CD,$1E
	dc.b	$CD,$17,$61,$00,$09,$7C,$11,$FC,$00,$04,$B3,$A4,$42,$38,$B3,$A8
	dc.b	$11,$FC,$00,$02,$CD,$14,$4E,$75,$61,$00,$08,$46,$31,$FC,$00,$00
	dc.b	$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$61,$00,$12,$C6,$4E,$75,$0C,$38
	dc.b	$00,$02,$B3,$A4,$67,$02,$4E,$75,$11,$FC,$00,$03,$CD,$14,$60,$00
	dc.b	$06,$14,$4A,$38,$CD,$2B,$66,$12,$31,$FC,$00,$00,$CD,$14,$11,$F8
	dc.b	$CD,$16,$CD,$1E,$61,$00,$12,$9A,$4E,$75,$11,$FC,$00,$04,$CD,$14
	dc.b	$61,$00,$12,$A8,$30,$3C,$00,$06,$60,$00,$06,$EA,$4E,$75,$4A,$38
	dc.b	$CD,$2B,$66,$10,$61,$00,$12,$94,$11,$FC,$00,$03,$CD,$14,$60,$00
	dc.b	$05,$D4,$4E,$75,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E
	dc.b	$61,$00,$0B,$24,$61,$00,$11,$BC,$4A,$00,$66,$00,$00,$0C,$61,$00
	dc.b	$11,$16,$61,$00,$12,$4C,$4E,$75,$48,$E7,$80,$00,$61,$00,$12,$5C
	dc.b	$61,$00,$0B,$92,$4C,$DF,$00,$01,$60,$00,$00,$02,$48,$E7,$80,$00
	dc.b	$30,$3C,$00,$9E,$4E,$B9,$00,$FF,$25,$B8,$4C,$DF,$00,$01,$0C,$00
	dc.b	$00,$01,$67,$14,$31,$FC,$00,$08,$CD,$14,$11,$FC,$00,$01,$CD,$1E
	dc.b	$70,$08,$70,$09,$70,$0A,$60,$1C,$31,$FC,$00,$00,$CD,$14,$11,$F8
	dc.b	$CD,$16,$CD,$1E,$61,$00,$11,$FA,$70,$03,$0C,$38,$00,$05,$CD,$17
	dc.b	$67,$02,$70,$04,$60,$00,$07,$0C,$61,$00,$F6,$C2,$67,$3C,$41,$F9
	dc.b	$00,$FF,$4D,$84,$0C,$38,$00,$06,$CD,$16,$67,$06,$41,$F9,$00,$FF
	dc.b	$4D,$7A,$61,$00,$07,$46,$61,$00,$FC,$E0,$61,$00,$09,$F8,$6E,$24
	dc.b	$6B,$02,$4E,$75,$61,$00,$07,$2A,$31,$FC,$00,$00,$CD,$14,$11,$F8
	dc.b	$CD,$16,$CD,$1E,$61,$00,$11,$AA,$4E,$75,$11,$FC,$00,$02,$CD,$17
	dc.b	$60,$00,$00,$5E,$61,$00,$07,$0A,$11,$F8,$CD,$1E,$CD,$17,$0C,$38
	dc.b	$00,$02,$CD,$17,$67,$4A,$61,$00,$11,$88,$61,$00,$09,$98,$30,$29
	dc.b	$00,$06,$61,$00,$10,$B6,$10,$28,$00,$09,$12,$28,$00,$0A,$0C,$00
	dc.b	$00,$5F,$66,$06,$10,$3C,$00,$30,$12,$00,$41,$F8,$CD,$30,$11,$40
	dc.b	$00,$09,$11,$41,$00,$0A,$61,$00,$11,$72,$61,$00,$07,$E4,$11,$FC
	dc.b	$00,$04,$B3,$A4,$42,$38,$B3,$A8,$11,$FC,$00,$02,$CD,$14,$4E,$75
	dc.b	$61,$00,$0A,$04,$11,$FC,$00,$04,$B3,$A4,$11,$FC,$00,$01,$B3,$A8
	dc.b	$11,$FC,$00,$06,$CD,$14,$4E,$75,$0C,$38,$00,$10,$B3,$A4,$67,$02
	dc.b	$4E,$75,$11,$FC,$00,$07,$CD,$14,$4E,$B9,$00,$FF,$57,$30,$30,$3C
	dc.b	$00,$00,$60,$00,$05,$70,$4E,$75,$4A,$38,$CD,$2B,$66,$14,$11,$FC
	dc.b	$00,$02,$B3,$A4,$11,$FC,$00,$08,$CD,$14,$11,$FC,$00,$02,$CD,$50
	dc.b	$4E,$75,$42,$38,$CD,$51,$11,$FC,$00,$03,$CD,$50,$11,$FC,$00,$02
	dc.b	$B3,$A4,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$61,$00
	dc.b	$09,$96,$61,$00,$10,$2E,$4A,$00,$66,$00,$FE,$92,$4E,$B9,$00,$FF
	dc.b	$57,$30,$61,$00,$0C,$70,$61,$00,$10,$B8,$4E,$75,$42,$38,$CD,$50
	dc.b	$0C,$38,$00,$04,$CD,$51,$67,$02,$4E,$75,$42,$38,$CD,$51,$31,$FC
	dc.b	$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$61,$00,$10,$94,$4E,$75
	dc.b	$61,$00,$10,$A8,$61,$00,$07,$1A,$61,$00,$10,$86,$61,$00,$02,$C6
	dc.b	$42,$38,$CD,$2E,$11,$FC,$00,$03,$CD,$2D,$11,$FC,$00,$0A,$CD,$14
	dc.b	$4E,$75,$42,$38,$CD,$2D,$0C,$38,$00,$0B,$CD,$2E,$67,$02,$4E,$75
	dc.b	$11,$FC,$00,$0B,$CD,$14,$61,$00,$10,$72,$30,$3C,$00,$00,$60,$00
	dc.b	$04,$B4,$4E,$75,$42,$38,$CD,$2E,$61,$00,$05,$B6,$4A,$38,$CD,$2B
	dc.b	$66,$12,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$61,$00
	dc.b	$10,$30,$4E,$75,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E
	dc.b	$61,$00,$08,$E4,$61,$00,$09,$D8,$48,$E7,$80,$00,$61,$00,$0F,$74
	dc.b	$4C,$DF,$00,$02,$4A,$00,$66,$00,$FD,$D4,$48,$E7,$40,$00,$61,$00
	dc.b	$0E,$C6,$61,$00,$10,$16,$4C,$DF,$00,$01,$32,$3C,$40,$00,$41,$F8
	dc.b	$CD,$70,$61,$00,$0A,$2E,$61,$00,$0F,$E8,$4E,$75,$70,$00,$10,$38
	dc.b	$CD,$14,$D0,$40,$30,$3B,$00,$06,$4E,$FB,$00,$02,$00,$1A,$00,$48
	dc.b	$00,$60,$00,$72,$00,$EE,$00,$00,$00,$00,$00,$00,$01,$16,$01,$2E
	dc.b	$01,$40,$01,$6E,$01,$96,$4A,$38,$CD,$21,$66,$1A,$11,$FC,$00,$01
	dc.b	$CD,$14,$61,$00,$01,$F0,$61,$00,$0C,$E4,$42,$38,$CD,$2E,$11,$FC
	dc.b	$00,$01,$CD,$2D,$4E,$75,$11,$FC,$00,$01,$CD,$50,$11,$FC,$00,$08
	dc.b	$CD,$14,$4E,$75,$42,$38,$CD,$2D,$0C,$38,$00,$0B,$CD,$2E,$66,$0A
	dc.b	$42,$38,$CD,$2E,$11,$FC,$00,$02,$CD,$14,$4E,$75,$11,$FC,$00,$03
	dc.b	$CD,$14,$61,$00,$0F,$6C,$30,$3C,$00,$01,$60,$00,$03,$C8,$4A,$38
	dc.b	$CD,$2B,$67,$64,$61,$00,$01,$6E,$4A,$39,$00,$FF,$0F,$1F,$67,$00
	dc.b	$00,$46,$61,$00,$F4,$8A,$61,$00,$07,$5C,$0C,$69,$00,$0C,$00,$00
	dc.b	$6D,$34,$61,$00,$F4,$32,$61,$00,$F4,$76,$61,$00,$F6,$F4,$66,$22
	dc.b	$61,$00,$0A,$E2,$61,$00,$0B,$18,$42,$39,$00,$FF,$0F,$1F,$31,$FC
	dc.b	$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E,$70,$0B,$60,$00,$04,$34
	dc.b	$4E,$75,$61,$00,$F6,$FA,$61,$00,$0F,$08,$31,$FC,$00,$00,$CD,$14
	dc.b	$11,$F8,$CD,$16,$CD,$1E,$4E,$75,$61,$00,$0E,$F6,$11,$FC,$00,$02
	dc.b	$CD,$2D,$11,$FC,$00,$04,$CD,$14,$4E,$75,$42,$38,$CD,$2D,$0C,$38
	dc.b	$00,$0B,$CD,$2E,$67,$02,$4E,$75,$61,$00,$0E,$D6,$42,$38,$CD,$2E
	dc.b	$61,$00,$0C,$26,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E
	dc.b	$4E,$75,$42,$38,$CD,$50,$0C,$38,$00,$04,$CD,$51,$66,$0A,$42,$38
	dc.b	$CD,$51,$11,$FC,$00,$09,$CD,$14,$4E,$75,$11,$FC,$00,$0A,$CD,$14
	dc.b	$61,$00,$0E,$9E,$30,$3C,$00,$01,$60,$00,$02,$FA,$4A,$38,$CD,$2B
	dc.b	$66,$0E,$11,$FC,$00,$02,$CD,$50,$11,$FC,$00,$0B,$CD,$14,$4E,$75
	dc.b	$61,$00,$00,$92,$11,$FC,$00,$0C,$CD,$14,$11,$F8,$CD,$16,$CD,$1E
	dc.b	$61,$00,$0E,$6E,$70,$0C,$60,$00,$03,$8A,$42,$38,$CD,$50,$0C,$38
	dc.b	$00,$04,$CD,$51,$67,$02,$4E,$75,$61,$00,$0E,$56,$42,$38,$CD,$51
	dc.b	$61,$00,$0B,$A6,$31,$FC,$00,$00,$CD,$14,$11,$F8,$CD,$16,$CD,$1E
	dc.b	$4E,$75,$61,$00,$F3,$36,$61,$00,$F3,$76,$61,$00,$F5,$F4,$67,$14
	dc.b	$13,$FC,$00,$01,$00,$FF,$0F,$1F,$61,$00,$F3,$18,$61,$00,$F6,$10
	dc.b	$60,$00,$00,$18,$61,$00,$F3,$58,$13,$FC,$00,$00,$00,$FF,$0F,$1F
	dc.b	$61,$00,$F3,$00,$11,$FC,$00,$03,$CD,$50,$61,$00,$09,$B8,$61,$00
	dc.b	$09,$EE,$31,$FC,$00,$00,$CD,$14,$11,$FC,$00,$01,$CD,$1E,$61,$00
	dc.b	$0D,$F0,$4E,$75,$61,$00,$05,$FE,$0C,$38,$00,$02,$CD,$16,$67,$0E
	dc.b	$30,$29,$00,$06,$61,$00,$0D,$14,$61,$00,$F3,$38,$60,$04,$61,$00
	dc.b	$F3,$0E,$61,$00,$F5,$BA,$66,$02,$4E,$71,$61,$00,$09,$78,$61,$00
	dc.b	$09,$AE,$4E,$75,$61,$00,$05,$CE,$30,$29,$00,$06,$61,$00,$0C,$EC
	dc.b	$61,$00,$07,$CC,$67,$00,$00,$4A,$45,$F8,$B4,$C0,$36,$3C,$00,$14
	dc.b	$61,$00,$F2,$72,$66,$04,$36,$3C,$00,$DC,$78,$00,$38,$29,$00,$04
	dc.b	$C8,$FC,$00,$10,$06,$44,$00,$2C,$32,$3C,$00,$0A,$70,$00,$10,$18
	dc.b	$61,$00,$08,$F8,$06,$40,$C0,$00,$35,$40,$00,$02,$35,$43,$00,$08
	dc.b	$35,$44,$00,$0C,$D4,$FC,$00,$40,$50,$43,$51,$C9,$FF,$E0,$4E,$75
	dc.b	$36,$3C,$00,$14,$61,$00,$F2,$2E,$66,$04,$36,$3C,$00,$DC,$78,$00
	dc.b	$38,$29,$00,$04,$C8,$FC,$00,$10,$06,$44,$00,$2C,$45,$F8,$B4,$C0
	dc.b	$35,$43,$00,$08,$35,$44,$00,$0C,$51,$6A,$00,$0C,$35,$7C,$E0,$27
	dc.b	$00,$02,$D4,$FC,$00,$40,$35,$43,$00,$08,$50,$6A,$00,$08,$35,$44
	dc.b	$00,$0C,$51,$6A,$00,$0C,$35,$7C,$E0,$29,$00,$02,$D4,$FC,$00,$40
	dc.b	$35,$43,$00,$08,$35,$44,$00,$0C,$35,$7C,$E0,$28,$00,$02,$D4,$FC
	dc.b	$00,$40,$35,$43,$00,$08,$50,$6A,$00,$08,$35,$44,$00,$0C,$35,$7C
	dc.b	$E0,$2A,$00,$02,$D4,$FC,$00,$40,$D0,$FC,$00,$09,$06,$43,$00,$18
	dc.b	$32,$3C,$00,$01,$70,$00,$10,$18,$61,$00,$08,$50,$06,$40,$C0,$00
	dc.b	$35,$40,$00,$02,$35,$43,$00,$08,$35,$44,$00,$0C,$D4,$FC,$00,$40
	dc.b	$50,$43,$51,$C9,$FF,$E0,$32,$3C,$00,$04,$35,$7C,$00,$00,$00,$02
	dc.b	$35,$43,$00,$08,$35,$44,$00,$0C,$D4,$FC,$00,$40,$50,$43,$51,$C9
	dc.b	$FF,$EA,$4E,$75,$61,$00,$0C,$B4,$61,$00,$05,$CA,$31,$F8,$CD,$14
	dc.b	$CD,$1C,$30,$3C,$00,$05,$61,$00,$01,$D0,$11,$FC,$00,$01,$CD,$2C
	dc.b	$31,$FC,$00,$07,$CD,$14,$11,$FC,$00,$01,$CD,$40,$4E,$75,$61,$00
	dc.b	$04,$A4,$6E,$00,$00,$80,$6B,$00,$00,$B0,$61,$00,$04,$88,$02,$00
	dc.b	$00,$0F,$67,$12,$48,$A7,$80,$00,$30,$3C,$00,$99,$4E,$B9,$00,$FF
	dc.b	$25,$B8,$4C,$9F,$00,$01,$12,$38,$CD,$40,$08,$00,$00,$02,$67,$06
	dc.b	$53,$01,$6C,$02,$42,$01,$08,$00,$00,$03,$67,$0C,$52,$01,$0C,$01
	dc.b	$00,$01,$6F,$04,$12,$3C,$00,$01,$11,$C1,$CD,$40,$02,$41,$00,$FF
	dc.b	$41,$F8,$CD,$39,$D0,$C1,$12,$10,$08,$00,$00,$01,$67,$0C,$53,$01
	dc.b	$0C,$01,$00,$30,$6C,$04,$12,$3C,$00,$39,$08,$00,$00,$00,$67,$0C
	dc.b	$52,$01,$0C,$01,$00,$39,$6F,$04,$12,$3C,$00,$30,$10,$81,$61,$00
	dc.b	$05,$6A,$4E,$75,$61,$00,$05,$52,$61,$00,$04,$AC,$61,$00,$0B,$C6
	dc.b	$67,$18,$30,$3C,$00,$9E,$4E,$B9,$00,$FF,$25,$B8,$31,$FC,$00,$09
	dc.b	$CD,$14,$30,$3C,$00,$0D,$60,$00,$00,$EA,$11,$FC,$00,$01,$CD,$2A
	dc.b	$11,$FC,$00,$01,$CD,$2B,$60,$10,$61,$00,$05,$0A,$11,$FC,$00,$00
	dc.b	$CD,$2A,$11,$FC,$00,$00,$CD,$2B,$61,$00,$01,$16,$31,$F8,$CD,$1C
	dc.b	$CD,$14,$4E,$75,$61,$00,$00,$E2,$11,$FC,$00,$01,$CD,$2C,$11,$FC
	dc.b	$00,$00,$CD,$2A,$11,$FC,$00,$00,$CD,$2B,$11,$FC,$00,$01,$CD,$27
	dc.b	$31,$F8,$CD,$14,$CD,$1A,$31,$FC,$00,$05,$CD,$14,$4E,$75,$61,$00
	dc.b	$03,$A4,$6E,$6A,$6B,$76,$61,$00,$03,$8C,$08,$00,$00,$02,$67,$26
	dc.b	$0C,$38,$00,$01,$CD,$2A,$67,$10,$30,$3C,$00,$9B,$4E,$B9,$00,$FF
	dc.b	$25,$B8,$11,$FC,$00,$01,$CD,$2A,$11,$FC,$00,$01,$CD,$26,$11,$FC
	dc.b	$00,$00,$CD,$27,$4E,$75,$08,$00,$00,$03,$67,$30,$0C,$38,$00,$00
	dc.b	$CD,$2A,$67,$10,$30,$3C,$00,$9B,$4E,$B9,$00,$FF,$25,$B8,$11,$FC
	dc.b	$00,$00,$CD,$2A,$11,$FC,$00,$00,$CD,$26,$11,$FC,$00,$01,$CD,$27
	dc.b	$30,$3C,$00,$9B,$4E,$B9,$00,$FF,$25,$B8,$4E,$75,$4E,$75,$4A,$38
	dc.b	$CD,$2A,$67,$08,$11,$FC,$00,$01,$CD,$2B,$60,$0A,$11,$FC,$00,$00
	dc.b	$CD,$2B,$60,$02,$4E,$71,$61,$00,$00,$58,$31,$F8,$CD,$1A,$CD,$14
	dc.b	$4E,$75,$61,$00,$00,$24,$31,$F8,$CD,$14,$CD,$18,$31,$FC,$00,$06
	dc.b	$CD,$14,$4E,$75,$61,$00,$02,$FE,$66,$02,$4E,$75,$61,$00,$00,$32
	dc.b	$31,$F8,$CD,$18,$CD,$14,$4E,$75,$4E,$B9,$00,$FF,$64,$30,$11,$FC
	dc.b	$00,$00,$CD,$26,$11,$FC,$00,$00,$CD,$27,$61,$00,$EF,$78,$66,$08
	dc.b	$11,$FC,$00,$02,$CD,$29,$4E,$75,$11,$FC,$00,$01,$CD,$29,$4E,$75
	dc.b	$42,$38,$CD,$2C,$42,$38,$CD,$29,$4E,$75,$61,$00,$02,$A8,$12,$00
	dc.b	$02,$01,$00,$0F,$67,$00,$00,$36,$61,$00,$00,$A0,$08,$01,$00,$00
	dc.b	$67,$06,$10,$28,$00,$01,$66,$26,$08,$01,$00,$01,$67,$06,$10,$28
	dc.b	$00,$02,$66,$1A,$08,$01,$00,$02,$67,$06,$10,$28,$00,$03,$66,$0E
	dc.b	$08,$01,$00,$03,$67,$06,$10,$28,$00,$04,$66,$02,$4E,$75,$0C,$00
	dc.b	$00,$05,$66,$1A,$61,$00,$EF,$16,$67,$00,$FF,$F2,$48,$A7,$80,$00
	dc.b	$70,$01,$61,$00,$EE,$F0,$4C,$9F,$00,$01,$60,$00,$00,$38,$0C,$00
	dc.b	$00,$06,$66,$12,$48,$A7,$80,$00,$70,$00,$61,$00,$EE,$D8,$4C,$9F
	dc.b	$00,$01,$60,$00,$00,$20,$0C,$00,$00,$02,$66,$18,$4A,$39,$00,$FF
	dc.b	$0F,$1F,$66,$00,$FF,$B8,$48,$A7,$80,$00,$70,$00,$61,$00,$EE,$B6
	dc.b	$4C,$9F,$00,$01,$B0,$38,$CD,$1E,$67,$0E,$11,$C0,$CD,$1E,$30,$3C
	dc.b	$00,$9B,$4E,$B9,$00,$FF,$25,$B8,$4E,$75,$10,$38,$CD,$1E,$B0,$10
	dc.b	$67,$06,$D0,$FC,$00,$05,$60,$F6,$4E,$75,$01,$00,$00,$05,$06,$00
	dc.b	$01,$00,$02,$05,$06,$02,$01,$00,$05,$06,$04,$00,$00,$00,$00,$00
	dc.b	$03,$00,$04,$00,$00,$04,$03,$00,$00,$00,$05,$00,$00,$00,$06,$06
	dc.b	$00,$00,$05,$00,$02,$00,$00,$00,$06,$06,$00,$00,$02,$00,$05,$00
	dc.b	$00,$00,$02,$02,$00,$00,$05,$00,$05,$00,$00,$00,$01,$06,$00,$00
	dc.b	$01,$00,$61,$00,$06,$E6,$70,$00,$4E,$75,$70,$01,$70,$FF,$4E,$75
	dc.b	$61,$00,$00,$CE,$6B,$16,$6E,$F8,$4E,$B9,$00,$FF,$20,$E4,$4E,$B9
	dc.b	$00,$FF,$20,$E4,$4E,$B9,$00,$FF,$20,$E4,$60,$E4,$60,$00,$06,$AA
	dc.b	$61,$00,$00,$1E,$6B,$16,$6E,$D8,$4E,$B9,$00,$FF,$20,$E4,$4E,$B9
	dc.b	$00,$FF,$20,$E4,$4E,$B9,$00,$FF,$20,$E4,$60,$C4,$60,$00,$06,$8A
	dc.b	$61,$00,$06,$86,$61,$00,$01,$3E,$4A,$69,$00,$02,$67,$00,$00,$7A
	dc.b	$0C,$69,$00,$01,$00,$02,$66,$00,$00,$0A,$4A,$69,$00,$10,$67,$00
	dc.b	$00,$68,$30,$29,$00,$06,$53,$40,$B0,$69,$00,$10,$66,$02,$53,$40
	dc.b	$4A,$40,$6C,$00,$00,$30,$4A,$69,$00,$12,$67,$00,$00,$4C,$53,$69
	dc.b	$00,$12,$48,$E7,$00,$40,$61,$00,$04,$FE,$4C,$DF,$02,$00,$33,$7C
	dc.b	$00,$FD,$00,$06,$0C,$69,$00,$FD,$00,$10,$66,$04,$53,$69,$00,$06
	dc.b	$30,$29,$00,$06,$33,$40,$00,$06,$53,$69,$00,$04,$6C,$0E,$61,$00
	dc.b	$06,$2A,$42,$69,$00,$04,$61,$00,$06,$B8,$60,$08,$61,$00,$06,$1C
	dc.b	$70,$00,$4E,$75,$70,$01,$4E,$75,$61,$00,$06,$10,$70,$FF,$4E,$75
	dc.b	$61,$00,$05,$F6,$61,$00,$00,$AE,$4A,$69,$00,$02,$67,$00,$00,$9E
	dc.b	$0C,$69,$00,$01,$00,$02,$66,$00,$00,$0A,$4A,$69,$00,$10,$67,$00
	dc.b	$00,$8C,$30,$29,$00,$06,$52,$40,$B0,$69,$00,$10,$66,$02,$52,$40
	dc.b	$B0,$69,$00,$08,$6C,$00,$00,$76,$0C,$40,$00,$FE,$6D,$00,$00,$42
	dc.b	$32,$29,$00,$12,$52,$41,$B2,$69,$00,$14,$6E,$00,$00,$2C,$52,$69
	dc.b	$00,$12,$48,$E7,$00,$40,$61,$00,$04,$5E,$4C,$DF,$02,$00,$33,$7C
	dc.b	$00,$00,$00,$06,$0C,$69,$00,$00,$00,$10,$66,$04,$52,$69,$00,$06
	dc.b	$30,$29,$00,$06,$60,$00,$00,$0A,$B0,$69,$00,$08,$6C,$00,$00,$2E
	dc.b	$33,$40,$00,$06,$52,$69,$00,$04,$0C,$69,$00,$0A,$00,$04,$6D,$10
	dc.b	$61,$00,$05,$78,$33,$7C,$00,$09,$00,$04,$61,$00,$05,$A4,$60,$08
	dc.b	$61,$00,$05,$68,$70,$00,$4E,$75,$70,$01,$4E,$75,$61,$00,$05,$5C
	dc.b	$70,$FF,$4E,$75,$43,$F8,$CF,$A0,$61,$00,$EC,$BA,$67,$04,$43,$F8
	dc.b	$DF,$D0,$4E,$75,$4A,$38,$CD,$1F,$66,$06,$10,$38,$CD,$52,$4E,$75
	dc.b	$70,$00,$4E,$75,$48,$E7,$80,$00,$0C,$38,$00,$03,$CD,$1F,$67,$22
	dc.b	$4A,$38,$CD,$1F,$66,$18,$10,$39,$00,$A1,$20,$1F,$02,$00,$00,$60
	dc.b	$66,$18,$10,$39,$00,$A1,$20,$1F,$02,$00,$00,$10,$66,$32,$70,$00
	dc.b	$60,$3A,$42,$38,$CD,$1F,$70,$01,$60,$32,$61,$00,$00,$36,$66,$12
	dc.b	$30,$3C,$00,$92,$4E,$B9,$00,$FF,$25,$B8,$11,$FC,$00,$02,$CD,$1F
	dc.b	$60,$DC,$30,$3C,$00,$AE,$4E,$B9,$00,$FF,$25,$B8,$70,$01,$60,$0C
	dc.b	$30,$3C,$00,$AD,$4E,$B9,$00,$FF,$25,$B8,$70,$FF,$4C,$DF,$00,$01
	dc.b	$4E,$75,$10,$38,$CD,$1E,$0C,$00,$00,$01,$67,$18,$0C,$00,$00,$03
	dc.b	$67,$12,$0C,$00,$00,$04,$67,$0C,$30,$38,$CD,$14,$0C,$00,$00,$05
	dc.b	$67,$02,$4E,$75,$4E,$75,$0C,$38,$00,$02,$CD,$17,$67,$22,$41,$F8
	dc.b	$CD,$60,$61,$00,$01,$4A,$67,$0C,$41,$F8,$CD,$60,$43,$F8,$CD,$70
	dc.b	$60,$00,$00,$44,$41,$F8,$CD,$30,$43,$F8,$CD,$70,$60,$00,$00,$38
	dc.b	$41,$F9,$00,$FF,$3C,$6C,$43,$F8,$CD,$70,$60,$00,$00,$2A,$61,$00
	dc.b	$07,$00,$0C,$38,$00,$02,$CD,$16,$67,$12,$61,$00,$FF,$08,$30,$29
	dc.b	$00,$06,$61,$00,$06,$26,$43,$F8,$CD,$60,$60,$0A,$41,$F9,$00,$FF
	dc.b	$3C,$6C,$43,$F8,$CD,$60,$22,$D8,$22,$D8,$22,$D8,$13,$7C,$00,$00
	dc.b	$FF,$FF,$4E,$75,$61,$00,$00,$88,$32,$3C,$40,$00,$41,$F9,$00,$FF
	dc.b	$50,$5E,$61,$00,$00,$FE,$4E,$75,$53,$4F,$4E,$49,$43,$43,$44,$5F
	dc.b	$5F,$30,$30,$00,$61,$00,$00,$68,$32,$3C,$40,$00,$41,$F9,$00,$FF
	dc.b	$51,$90,$61,$00,$00,$DE,$4E,$75,$61,$00,$00,$54,$32,$3C,$40,$00
	dc.b	$41,$F8,$CD,$30,$61,$00,$00,$CC,$4E,$75,$61,$00,$00,$42,$61,$00
	dc.b	$01,$A4,$06,$80,$00,$86,$00,$00,$23,$C0,$00,$C0,$00,$04,$43,$F9
	dc.b	$00,$C0,$00,$00,$41,$F8,$CD,$39,$74,$00,$70,$00,$10,$18,$61,$00
	dc.b	$01,$DA,$B4,$38,$CD,$40,$67,$06,$06,$40,$40,$00,$60,$04,$06,$40
	dc.b	$00,$00,$32,$80,$52,$42,$0C,$42,$00,$03,$66,$DE,$4E,$75,$61,$00
	dc.b	$FE,$54,$61,$00,$00,$0C,$D0,$40,$58,$40,$D0,$29,$00,$0A,$4E,$75
	dc.b	$70,$00,$30,$29,$00,$04,$66,$16,$0C,$69,$FF,$FF,$00,$10,$67,$08
	dc.b	$0C,$69,$00,$02,$00,$02,$6D,$08,$4A,$69,$00,$02,$67,$02,$52,$40
	dc.b	$4E,$75,$48,$E7,$80,$40,$43,$F9,$00,$FF,$3C,$6C,$20,$19,$B0,$90
	dc.b	$66,$16,$20,$19,$B0,$A8,$00,$04,$66,$0E,$30,$19,$B0,$68,$00,$08
	dc.b	$66,$06,$10,$19,$B0,$28,$00,$0A,$4C,$DF,$02,$01,$4E,$75,$48,$E7
	dc.b	$80,$40,$43,$F9,$00,$FF,$3C,$6C,$20,$19,$B0,$90,$66,$0E,$20,$19
	dc.b	$B0,$A8,$00,$04,$66,$06,$10,$19,$B0,$28,$00,$08,$4C,$DF,$02,$01
	dc.b	$4E,$75,$48,$E7,$E0,$00,$61,$D6,$66,$08,$61,$00,$00,$3A,$60,$00
	dc.b	$00,$24,$48,$E7,$C0,$80,$32,$3C,$40,$00,$41,$FA,$00,$1E,$61,$00
	dc.b	$00,$C4,$61,$00,$00,$EC,$4C,$DF,$01,$03,$52,$00,$61,$00,$00,$B6
	dc.b	$61,$00,$00,$DE,$4C,$DF,$00,$07,$4E,$75,$20,$20,$20,$20,$20,$20
	dc.b	$20,$20,$20,$20,$20,$00,$48,$E7,$C0,$C0,$72,$01,$43,$F9,$00,$FF
	dc.b	$52,$31,$D0,$FC,$00,$09,$10,$18,$61,$00,$00,$E0,$12,$C0,$51,$C9
	dc.b	$FF,$F6,$4C,$DF,$03,$03,$48,$E7,$C0,$00,$41,$F9,$00,$FF,$52,$22
	dc.b	$61,$00,$00,$72,$61,$00,$00,$18,$4C,$DF,$00,$03,$52,$00,$41,$F9
	dc.b	$00,$FF,$52,$2E,$61,$00,$00,$5E,$61,$00,$00,$04,$4E,$75,$48,$E7
	dc.b	$C0,$C0,$23,$C0,$00,$C0,$00,$04,$43,$F9,$00,$C0,$00,$00,$34,$3C
	dc.b	$00,$0A,$70,$00,$10,$18,$0C,$42,$00,$09,$6D,$06,$06,$40,$60,$00
	dc.b	$60,$0E,$0C,$00,$00,$26,$67,$04,$D0,$41,$60,$04,$06,$40,$40,$00
	dc.b	$32,$80,$51,$CA,$FF,$DE,$4C,$DF,$03,$03,$4E,$75,$27,$29,$26,$26
	dc.b	$26,$26,$26,$26,$26,$26,$26,$00,$28,$2A,$26,$26,$26,$26,$26,$26
	dc.b	$26,$26,$26,$00,$02,$80,$00,$00,$00,$FF,$0C,$00,$00,$20,$6D,$04
	dc.b	$04,$00,$00,$20,$C0,$FC,$00,$80,$48,$40,$61,$00,$E9,$98,$67,$08
	dc.b	$06,$80,$60,$04,$00,$03,$4E,$75,$06,$80,$60,$36,$00,$03,$4E,$75
	dc.b	$48,$E7,$C0,$C0,$23,$C0,$00,$C0,$00,$04,$43,$F9,$00,$C0,$00,$00
	dc.b	$70,$00,$10,$18,$67,$00,$00,$0E,$61,$00,$00,$10,$D0,$41,$32,$80
	dc.b	$60,$00,$FF,$EE,$4C,$DF,$03,$03,$4E,$75,$0C,$00,$00,$41,$6D,$0C
	dc.b	$0C,$00,$00,$5A,$6E,$06,$04,$00,$00,$40,$4E,$75,$0C,$00,$00,$30
	dc.b	$6D,$0C,$0C,$00,$00,$39,$6E,$06,$04,$00,$00,$15,$4E,$75,$0C,$00
	dc.b	$00,$5F,$66,$06,$04,$00,$00,$3A,$4E,$75,$0C,$00,$00,$20,$10,$3C
	dc.b	$00,$26,$4E,$75,$61,$00,$E9,$1E,$67,$06,$61,$00,$E9,$20,$67,$2C
	dc.b	$61,$00,$FC,$52,$42,$69,$00,$02,$42,$69,$00,$04,$42,$69,$00,$06
	dc.b	$42,$69,$00,$08,$42,$29,$00,$0A,$42,$29,$00,$0C,$42,$69,$00,$12
	dc.b	$61,$00,$03,$18,$61,$00,$00,$30,$61,$00,$00,$E4,$4E,$75,$70,$00
	dc.b	$61,$00,$E8,$D2,$41,$F9,$00,$FF,$3C,$6C,$61,$00,$E9,$66,$61,$00
	dc.b	$EB,$8A,$66,$08,$42,$39,$00,$FF,$0F,$1F,$4E,$75,$13,$FC,$00,$01
	dc.b	$00,$FF,$0F,$1F,$4E,$75,$61,$00,$FB,$FC,$70,$00,$30,$29,$00,$12
	dc.b	$C0,$FC,$00,$FE,$32,$29,$00,$02,$92,$40,$0C,$41,$01,$00,$6F,$04
	dc.b	$32,$3C,$01,$00,$33,$41,$00,$08,$48,$40,$30,$01,$48,$E7,$00,$40
	dc.b	$61,$00,$EB,$04,$4C,$DF,$02,$00,$20,$7C,$00,$20,$00,$44,$24,$49
	dc.b	$D4,$FC,$00,$30,$30,$29,$00,$08,$53,$40,$6B,$0A,$24,$D8,$24,$D8
	dc.b	$24,$D8,$24,$D8,$60,$F2,$30,$3C,$01,$00,$90,$69,$00,$08,$72,$00
	dc.b	$53,$40,$6B,$0A,$24,$C1,$24,$C1,$24,$C1,$24,$C1,$60,$F2,$61,$00
	dc.b	$00,$10,$4A,$69,$00,$10,$66,$06,$33,$7C,$00,$01,$00,$06,$4E,$75
	dc.b	$61,$00,$E8,$42,$66,$00,$00,$2A,$61,$00,$FB,$7A,$4A,$69,$00,$08
	dc.b	$67,$1E,$20,$49,$D0,$FC,$00,$30,$70,$00,$61,$00,$FD,$46,$67,$18
	dc.b	$D0,$FC,$00,$10,$52,$40,$B0,$69,$00,$08,$6C,$00,$00,$04,$60,$EA
	dc.b	$33,$7C,$FF,$FF,$00,$10,$4E,$75,$33,$40,$00,$10,$4E,$75,$61,$00
	dc.b	$FB,$44,$42,$69,$00,$0C,$42,$29,$00,$0A,$70,$00,$61,$00,$02,$5C
	dc.b	$24,$48,$32,$3C,$40,$00,$76,$00,$30,$3C,$00,$04,$38,$29,$00,$08
	dc.b	$7A,$00,$BA,$69,$00,$10,$66,$08,$52,$45,$D4,$FC,$00,$10,$60,$F2
	dc.b	$B8,$45,$6F,$0A,$15,$7C,$00,$00,$00,$0B,$20,$4A,$60,$04,$41,$FA
	dc.b	$00,$20,$48,$E7,$FC,$80,$61,$00,$FD,$2A,$4C,$DF,$01,$3F,$54,$40
	dc.b	$D4,$FC,$00,$10,$52,$45,$52,$43,$0C,$03,$00,$0C,$66,$C4,$4E,$75
	dc.b	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$00,$48,$E7,$00,$40
	dc.b	$32,$3C,$40,$00,$61,$00,$FA,$CE,$41,$F9,$00,$FF,$54,$46,$61,$00
	dc.b	$00,$3E,$4C,$DF,$02,$00,$4E,$75,$48,$E7,$00,$40,$32,$3C,$40,$00
	dc.b	$61,$00,$00,$1A,$4C,$DF,$02,$00,$4E,$75,$48,$E7,$00,$40,$32,$3C
	dc.b	$00,$00,$61,$00,$00,$08,$4C,$DF,$02,$00,$4E,$75,$61,$00,$FA,$96
	dc.b	$30,$29,$00,$06,$61,$00,$01,$B4,$11,$7C,$00,$00,$00,$0B,$70,$00
	dc.b	$30,$29,$00,$04,$D0,$40,$58,$40,$D0,$29,$00,$0A,$60,$00,$FC,$A4
	dc.b	$61,$00,$FA,$72,$54,$29,$00,$0A,$0C,$29,$00,$20,$00,$0A,$6D,$04
	dc.b	$42,$29,$00,$0A,$20,$29,$00,$0C,$06,$80,$00,$10,$00,$00,$22,$3C
	dc.b	$00,$02,$00,$00,$D3,$A9,$00,$0C,$B0,$A9,$00,$0C,$6F,$0E,$48,$E7
	dc.b	$FF,$FE,$61,$00,$CB,$FA,$4C,$DF,$7F,$FF,$60,$E8,$23,$40,$00,$0C
	dc.b	$0C,$69,$01,$00,$00,$0C,$6D,$06,$04,$69,$01,$00,$00,$0C,$61,$00
	dc.b	$00,$66,$48,$E7,$FF,$FE,$61,$00,$CB,$D6,$4C,$DF,$7F,$FF,$4E,$75
	dc.b	$61,$00,$FA,$12,$55,$29,$00,$0A,$6C,$06,$06,$29,$00,$20,$00,$0A
	dc.b	$20,$29,$00,$0C,$04,$80,$00,$10,$00,$00,$22,$3C,$00,$02,$00,$00
	dc.b	$93,$A9,$00,$0C,$B0,$A9,$00,$0C,$6C,$0E,$48,$E7,$FF,$FE,$61,$00
	dc.b	$CB,$9E,$4C,$DF,$7F,$FF,$60,$E8,$23,$40,$00,$0C,$6A,$06,$06,$69
	dc.b	$01,$00,$00,$0C,$61,$00,$00,$5A,$48,$E7,$FF,$FE,$61,$00,$CB,$80
	dc.b	$4C,$DF,$7F,$FF,$4E,$75,$32,$29,$00,$06,$54,$41,$0C,$41,$01,$00
	dc.b	$6C,$3C,$32,$29,$00,$06,$54,$41,$4A,$69,$00,$10,$6B,$08,$B2,$69
	dc.b	$00,$10,$6D,$02,$52,$41,$B2,$69,$00,$08,$6C,$0E,$30,$01,$61,$00
	dc.b	$00,$BA,$11,$7C,$00,$00,$00,$0B,$60,$04,$41,$FA,$FE,$A4,$10,$3C
	dc.b	$00,$1A,$D0,$29,$00,$0A,$32,$3C,$40,$00,$61,$00,$FB,$A6,$4E,$75
	dc.b	$30,$29,$00,$06,$53,$40,$6B,$00,$00,$1C,$61,$00,$00,$8E,$11,$7C
	dc.b	$00,$00,$00,$0B,$10,$3C,$00,$02,$D0,$29,$00,$0A,$32,$3C,$40,$00
	dc.b	$61,$00,$FB,$80,$4E,$75,$61,$00,$01,$52,$61,$00,$00,$2E,$61,$00
	dc.b	$F9,$44,$33,$69,$00,$14,$00,$12,$61,$00,$FD,$3C,$30,$29,$00,$08
	dc.b	$55,$40,$6C,$02,$70,$00,$B0,$69,$00,$10,$66,$08,$53,$40,$6C,$04
	dc.b	$30,$3C,$00,$01,$33,$40,$00,$06,$4E,$75,$61,$00,$F9,$18,$48,$E7
	dc.b	$00,$40,$61,$00,$E8,$74,$4C,$DF,$02,$00,$33,$79,$00,$20,$00,$22
	dc.b	$00,$00,$33,$79,$00,$20,$00,$24,$00,$02,$70,$00,$30,$29,$00,$02
	dc.b	$80,$FC,$01,$00,$33,$40,$00,$14,$48,$40,$4A,$40,$66,$0A,$4A,$69
	dc.b	$00,$14,$66,$04,$53,$69,$00,$14,$4E,$75,$48,$E7,$80,$00,$02,$80
	dc.b	$00,$00,$FF,$FF,$C0,$FC,$00,$10,$48,$E7,$00,$40,$61,$00,$F8,$C6
	dc.b	$20,$49,$D0,$FC,$00,$30,$4C,$DF,$02,$00,$D0,$C0,$4C,$DF,$00,$01
	dc.b	$4E,$75,$61,$00,$00,$3C,$66,$12,$61,$00,$00,$12,$66,$0A,$61,$00
	dc.b	$00,$1E,$66,$04,$70,$00,$4E,$75,$70,$FF,$4E,$75,$61,$00,$00,$82
	dc.b	$41,$F8,$CD,$60,$61,$00,$E5,$DC,$61,$00,$E8,$12,$4E,$75,$61,$00
	dc.b	$00,$8A,$41,$F8,$CD,$70,$61,$00,$E5,$CA,$61,$00,$E8,$24,$4E,$75
	dc.b	$61,$00,$00,$5E,$41,$F8,$CD,$60,$61,$00,$E5,$B8,$61,$00,$E7,$DC
	dc.b	$66,$00,$00,$2E,$30,$39,$00,$20,$00,$22,$33,$C0,$00,$20,$00,$2A
	dc.b	$13,$F9,$00,$20,$00,$25,$00,$20,$00,$29,$61,$00,$00,$4E,$61,$00
	dc.b	$F8,$44,$B0,$69,$00,$00,$6E,$04,$70,$00,$4E,$75,$70,$01,$4E,$75
	dc.b	$70,$FF,$4E,$75,$61,$00,$00,$34,$41,$F8,$CD,$70,$61,$00,$E5,$74
	dc.b	$61,$00,$E7,$98,$67,$00,$00,$06,$70,$00,$4E,$75,$70,$FF,$4E,$75
	dc.b	$48,$E7,$80,$00,$70,$01,$0C,$38,$00,$05,$CD,$16,$67,$02,$70,$00
	dc.b	$61,$00,$E4,$B2,$4C,$DF,$00,$01,$4E,$75,$48,$E7,$80,$00,$70,$01
	dc.b	$0C,$38,$00,$05,$CD,$17,$67,$02,$70,$00,$61,$00,$E4,$98,$4C,$DF
	dc.b	$00,$01,$4E,$75,$70,$00,$10,$28,$00,$24,$30,$3B,$00,$18,$4E,$BB
	dc.b	$00,$14,$43,$F9,$00,$FF,$5A,$48,$4E,$B9,$00,$FF,$27,$60,$4E,$F9
	dc.b	$00,$FF,$28,$34,$00,$08,$00,$52,$00,$F0,$01,$84,$11,$7C,$00,$04
	dc.b	$00,$01,$11,$7C,$00,$02,$00,$24,$11,$7C,$00,$02,$00,$18,$11,$7C
	dc.b	$00,$08,$00,$19,$11,$7C,$00,$0C,$00,$16,$31,$7C,$E0,$5B,$00,$02
	dc.b	$21,$7C,$00,$FF,$5A,$8A,$00,$04,$61,$00,$01,$96,$31,$41,$00,$08
	dc.b	$31,$42,$00,$0C,$31,$41,$00,$32,$31,$42,$00,$34,$31,$41,$00,$36
	dc.b	$31,$42,$00,$38,$4E,$75,$0C,$38,$00,$02,$CD,$1F,$67,$34,$0C,$38
	dc.b	$00,$01,$CD,$15,$66,$14,$08,$39,$00,$00,$00,$A1,$20,$1E,$66,$12
	dc.b	$08,$39,$00,$01,$00,$A1,$20,$1E,$66,$08,$11,$7C,$00,$00,$00,$1C
	dc.b	$60,$06,$11,$7C,$00,$06,$00,$1C,$42,$38,$CD,$1F,$61,$00,$00,$34
	dc.b	$4E,$75,$11,$7C,$00,$03,$00,$1C,$11,$7C,$00,$06,$00,$24,$42,$28
	dc.b	$00,$2D,$42,$68,$00,$32,$31,$68,$00,$0C,$00,$34,$42,$68,$00,$10
	dc.b	$31,$7C,$FB,$00,$00,$12,$42,$68,$00,$2E,$31,$7C,$00,$40,$00,$30
	dc.b	$4E,$75,$61,$00,$01,$0C,$B2,$68,$00,$32,$66,$08,$B4,$68,$00,$34
	dc.b	$66,$02,$4E,$75,$11,$FC,$00,$01,$CD,$1F,$11,$7C,$00,$06,$00,$1C
	dc.b	$11,$7C,$00,$04,$00,$24,$42,$28,$00,$2D,$31,$41,$00,$32,$31,$42
	dc.b	$00,$34,$4E,$75,$61,$CC,$0C,$28,$00,$01,$00,$2D,$67,$42,$11,$7C
	dc.b	$00,$02,$00,$2D,$67,$6A,$31,$7C,$04,$00,$00,$10,$42,$68,$00,$12
	dc.b	$30,$28,$00,$08,$B0,$68,$00,$32,$67,$36,$6D,$12,$08,$E8,$00,$00
	dc.b	$00,$22,$08,$E8,$00,$00,$00,$01,$44,$68,$00,$10,$60,$0C,$08,$A8
	dc.b	$00,$00,$00,$22,$08,$A8,$00,$00,$00,$01,$11,$7C,$00,$01,$00,$2D
	dc.b	$61,$00,$09,$BE,$30,$28,$00,$08,$B0,$68,$00,$32,$67,$02,$4E,$75
	dc.b	$42,$68,$00,$10,$31,$7C,$04,$00,$00,$12,$30,$28,$00,$0C,$B0,$68
	dc.b	$00,$34,$67,$1C,$6D,$04,$44,$68,$00,$12,$11,$7C,$00,$02,$00,$2D
	dc.b	$61,$00,$09,$8E,$30,$28,$00,$0C,$B0,$68,$00,$34,$67,$02,$4E,$75
	dc.b	$11,$7C,$00,$02,$00,$24,$4E,$75,$61,$00,$09,$66,$30,$28,$00,$34
	dc.b	$B0,$68,$00,$0C,$6F,$12,$43,$F9,$00,$FF,$5A,$48,$4E,$B9,$00,$FF
	dc.b	$27,$60,$4E,$F9,$00,$FF,$28,$34,$31,$40,$00,$0C,$11,$7C,$00,$02
	dc.b	$00,$24,$11,$7C,$00,$00,$00,$1C,$11,$FC,$00,$03,$CD,$1F,$43,$F9
	dc.b	$00,$FF,$5A,$48,$4E,$B9,$00,$FF,$27,$60,$4E,$F9,$00,$FF,$28,$34
	dc.b	$0C,$78,$06,$03,$CD,$14,$67,$30,$0C,$78,$08,$03,$CD,$14,$67,$28
	dc.b	$0C,$38,$00,$01,$CD,$15,$67,$00,$00,$2A,$0C,$38,$00,$05,$CD,$15
	dc.b	$67,$00,$00,$4C,$70,$00,$10,$38,$CD,$1E,$D0,$00,$D0,$00,$32,$3B
	dc.b	$00,$66,$34,$3B,$00,$64,$4E,$75,$32,$3C,$00,$B4,$34,$3C,$00,$40
	dc.b	$4E,$75,$61,$00,$F5,$B0,$45,$F9,$00,$FF,$5A,$10,$20,$09,$0C,$40
	dc.b	$CF,$A0,$67,$06,$45,$F9,$00,$FF,$59,$E8,$70,$00,$30,$29,$00,$04
	dc.b	$D0,$40,$D0,$40,$32,$32,$00,$00,$34,$32,$00,$02,$4E,$75,$45,$F9
	dc.b	$00,$FF,$5A,$40,$0C,$38,$00,$01,$CD,$29,$67,$06,$45,$F9,$00,$FF
	dc.b	$5A,$38,$70,$00,$10,$38,$CD,$2A,$D0,$40,$D0,$40,$32,$32,$00,$00
	dc.b	$34,$32,$00,$02,$4E,$75,$01,$90,$00,$00,$00,$A4,$00,$18,$00,$A4
	dc.b	$00,$38,$00,$A4,$00,$5C,$00,$A4,$00,$74,$00,$4C,$00,$14,$00,$E4
	dc.b	$00,$14,$00,$6C,$00,$24,$00,$6C,$00,$34,$00,$6C,$00,$44,$00,$6C
	dc.b	$00,$54,$00,$6C,$00,$64,$00,$6C,$00,$74,$00,$6C,$00,$84,$00,$6C
	dc.b	$00,$94,$00,$6C,$00,$A4,$00,$6C,$00,$B4,$00,$CC,$00,$24,$00,$CC
	dc.b	$00,$34,$00,$CC,$00,$44,$00,$CC,$00,$54,$00,$CC,$00,$64,$00,$CC
	dc.b	$00,$74,$00,$CC,$00,$84,$00,$CC,$00,$94,$00,$CC,$00,$A4,$00,$CC
	dc.b	$00,$B4,$00,$B0,$00,$BC,$00,$7C,$00,$BC,$01,$10,$00,$BC,$00,$DC
	dc.b	$00,$BC,$00,$0E,$00,$19,$00,$1F,$00,$23,$00,$29,$00,$2D,$00,$31
	dc.b	$17,$00,$00,$00,$00,$00,$00,$01,$02,$FE,$02,$07,$03,$04,$05,$04
	dc.b	$FF,$01,$06,$07,$FF,$01,$08,$09,$08,$0A,$FF,$13,$01,$02,$FF,$05
	dc.b	$0B,$0D,$FF,$01,$03,$03,$03,$04,$04,$04,$05,$05,$05,$04,$04,$04
	dc.b	$06,$07,$FE,$02,$00,$1C,$00,$22,$00,$28,$00,$2E,$00,$34,$00,$3A
	dc.b	$00,$40,$00,$46,$00,$4C,$00,$52,$00,$58,$00,$5E,$00,$64,$00,$6A
	dc.b	$01,$F4,$06,$00,$20,$F8,$01,$F4,$06,$00,$26,$F8,$01,$F4,$06,$00
	dc.b	$2C,$F8,$01,$F4,$06,$00,$38,$F8,$01,$F4,$06,$00,$3E,$F8,$01,$F4
	dc.b	$06,$00,$44,$F8,$01,$F4,$06,$00,$4A,$F8,$01,$F4,$06,$00,$50,$F8
	dc.b	$01,$F8,$05,$00,$68,$F8,$01,$F8,$05,$00,$6C,$F8,$01,$F8,$05,$00
	dc.b	$70,$F8,$01,$F4,$06,$00,$56,$F8,$01,$F8,$05,$00,$00,$F8,$01,$F4
	dc.b	$06,$00,$56,$FB,$70,$00,$10,$28,$00,$24,$30,$3B,$00,$06,$4E,$FB
	dc.b	$00,$02,$00,$06,$00,$6C,$00,$6C,$11,$7C,$00,$04,$00,$01,$11,$7C
	dc.b	$00,$03,$00,$18,$11,$7C,$00,$20,$00,$19,$11,$7C,$00,$0C,$00,$16
	dc.b	$21,$7C,$00,$FF,$5B,$7A,$00,$04,$4A,$28,$00,$28,$66,$20,$11,$7C
	dc.b	$00,$02,$00,$24,$31,$7C,$00,$50,$00,$08,$31,$7C,$00,$14,$00,$0C
	dc.b	$11,$7C,$00,$00,$00,$1A,$31,$7C,$00,$2B,$00,$02,$4E,$75,$11,$7C
	dc.b	$00,$04,$00,$24,$31,$7C,$00,$F0,$00,$08,$31,$7C,$00,$14,$00,$0C
	dc.b	$11,$7C,$00,$01,$00,$1A,$31,$7C,$20,$2B,$00,$02,$4E,$75,$4E,$F9
	dc.b	$00,$FF,$28,$34,$00,$04,$00,$10,$02,$F4,$0E,$00,$00,$E0,$F4,$0E
	dc.b	$00,$0C,$00,$00,$02,$F4,$0E,$00,$18,$E0,$F4,$0E,$00,$24,$00,$00
	dc.b	$70,$00,$10,$28,$00,$24,$30,$3B,$00,$06,$4E,$FB,$00,$02,$00,$06
	dc.b	$00,$34,$00,$64,$11,$7C,$00,$04,$00,$01,$11,$7C,$00,$02,$00,$24
	dc.b	$11,$7C,$00,$02,$00,$18,$11,$7C,$00,$10,$00,$19,$11,$7C,$00,$10
	dc.b	$00,$16,$31,$7C,$E0,$5B,$00,$02,$21,$7C,$00,$FF,$5C,$30,$00,$04
	dc.b	$4E,$75,$4A,$38,$CD,$2C,$66,$02,$4E,$75,$0C,$38,$00,$01,$CD,$29
	dc.b	$67,$0E,$31,$7C,$00,$18,$00,$08,$31,$7C,$00,$A8,$00,$0C,$60,$0C
	dc.b	$31,$7C,$00,$78,$00,$08,$31,$7C,$00,$A8,$00,$0C,$11,$7C,$00,$04
	dc.b	$00,$24,$4A,$38,$CD,$29,$67,$12,$43,$F9,$00,$FF,$5C,$28,$4E,$B9
	dc.b	$00,$FF,$27,$60,$4E,$F9,$00,$FF,$28,$34,$11,$7C,$00,$02,$00,$24
	dc.b	$4E,$75,$00,$02,$13,$00,$00,$01,$FF,$00,$00,$04,$00,$14,$03,$00
	dc.b	$0F,$00,$00,$00,$00,$03,$00,$10,$20,$00,$0E,$00,$14,$28,$02,$00
	dc.b	$0F,$00,$00,$00,$00,$03,$00,$10,$20,$00,$70,$00,$10,$28,$00,$24
	dc.b	$30,$3B,$00,$06,$4E,$FB,$00,$02,$00,$12,$00,$3E,$00,$40,$01,$2C
	dc.b	$01,$6E,$01,$9A,$01,$D6,$02,$12,$02,$60,$11,$7C,$00,$04,$00,$01
	dc.b	$11,$7C,$00,$02,$00,$24,$11,$7C,$00,$02,$00,$18,$11,$7C,$00,$08
	dc.b	$00,$19,$11,$7C,$00,$08,$00,$16,$31,$7C,$E0,$5B,$00,$02,$21,$7C
	dc.b	$00,$FF,$5A,$8A,$00,$04,$4E,$75,$31,$7C,$E0,$5B,$00,$02,$61,$00
	dc.b	$00,$6A,$31,$40,$00,$08,$31,$41,$00,$0C,$31,$42,$00,$32,$31,$43
	dc.b	$00,$34,$0C,$38,$00,$02,$CD,$16,$67,$10,$0C,$38,$00,$06,$CD,$16
	dc.b	$67,$02,$4E,$71,$04,$68,$00,$10,$00,$0C,$31,$7C,$04,$00,$00,$10
	dc.b	$42,$68,$00,$12,$30,$28,$00,$32,$B0,$68,$00,$08,$6E,$12,$08,$E8
	dc.b	$00,$00,$00,$22,$08,$E8,$00,$00,$00,$01,$44,$68,$00,$10,$60,$0C
	dc.b	$08,$A8,$00,$00,$00,$22,$08,$A8,$00,$00,$00,$01,$11,$7C,$00,$06
	dc.b	$00,$1C,$11,$7C,$00,$06,$00,$24,$4E,$75,$78,$00,$61,$00,$DE,$D6
	dc.b	$67,$02,$78,$01,$10,$38,$CD,$17,$61,$00,$00,$1E,$48,$E7,$C0,$00
	dc.b	$10,$38,$CD,$16,$61,$00,$00,$12,$48,$E7,$C0,$00,$20,$04,$61,$00
	dc.b	$DE,$A4,$4C,$DF,$00,$0F,$4E,$75,$0C,$00,$00,$06,$67,$22,$0C,$00
	dc.b	$00,$05,$67,$0A,$30,$3C,$00,$A0,$32,$3C,$00,$38,$60,$22,$70,$01
	dc.b	$61,$00,$DE,$82,$61,$00,$00,$1C,$32,$00,$30,$3C,$00,$18,$60,$10
	dc.b	$70,$00,$61,$00,$DE,$70,$61,$00,$00,$0A,$32,$00,$30,$3C,$00,$E0
	dc.b	$4E,$75,$61,$00,$F1,$B0,$61,$00,$F3,$68,$C0,$FC,$00,$10,$06,$40
	dc.b	$00,$2C,$4E,$75,$61,$00,$04,$DA,$43,$F9,$00,$FF,$5A,$48,$4E,$B9
	dc.b	$00,$FF,$27,$60,$4E,$B9,$00,$FF,$28,$34,$30,$28,$00,$32,$B0,$68
	dc.b	$00,$08,$67,$02,$4E,$75,$11,$7C,$00,$08,$00,$24,$42,$68,$00,$10
	dc.b	$31,$7C,$04,$00,$00,$12,$30,$28,$00,$34,$B0,$68,$00,$0C,$6E,$04
	dc.b	$44,$68,$00,$12,$4E,$75,$30,$28,$00,$34,$B0,$68,$00,$0C,$67,$16
	dc.b	$61,$00,$04,$8E,$43,$F9,$00,$FF,$5A,$48,$4E,$B9,$00,$FF,$27,$60
	dc.b	$4E,$F9,$00,$FF,$28,$34,$11,$7C,$00,$0A,$00,$24,$4E,$F9,$00,$FF
	dc.b	$28,$34,$0C,$28,$00,$01,$00,$28,$67,$0C,$11,$7C,$00,$02,$00,$24
	dc.b	$4E,$F9,$00,$FF,$28,$34,$11,$7C,$00,$0C,$00,$24,$31,$68,$00,$0C
	dc.b	$00,$34,$42,$68,$00,$10,$31,$7C,$FB,$00,$00,$12,$42,$68,$00,$2E
	dc.b	$31,$7C,$00,$40,$00,$30,$11,$7C,$00,$03,$00,$1C,$4E,$75,$61,$00
	dc.b	$04,$20,$30,$28,$00,$34,$B0,$68,$00,$0C,$6F,$12,$43,$F9,$00,$FF
	dc.b	$5A,$48,$4E,$B9,$00,$FF,$27,$60,$4E,$F9,$00,$FF,$28,$34,$31,$40
	dc.b	$00,$0C,$11,$7C,$00,$0E,$00,$24,$11,$7C,$00,$00,$00,$1C,$42,$38
	dc.b	$CD,$51,$11,$FC,$00,$01,$CD,$50,$4E,$75,$42,$38,$CD,$50,$0C,$38
	dc.b	$00,$04,$CD,$51,$67,$12,$43,$F9,$00,$FF,$5A,$48,$4E,$B9,$00,$FF
	dc.b	$27,$60,$4E,$F9,$00,$FF,$28,$34,$08,$A8,$00,$00,$00,$22,$08,$A8
	dc.b	$00,$00,$00,$01,$11,$7C,$00,$00,$00,$1C,$11,$7C,$00,$01,$00,$1D
	dc.b	$11,$7C,$00,$0C,$00,$1A,$31,$7C,$E0,$27,$00,$02,$42,$38,$CD,$51
	dc.b	$11,$7C,$00,$10,$00,$24,$4E,$75,$4E,$F9,$00,$FF,$28,$34,$70,$00
	dc.b	$10,$28,$00,$24,$30,$3B,$00,$06,$4E,$FB,$00,$02,$00,$10,$00,$3C
	dc.b	$01,$26,$01,$60,$01,$7E,$01,$92,$01,$C8,$01,$EC,$11,$7C,$00,$04
	dc.b	$00,$01,$11,$7C,$00,$02,$00,$24,$11,$7C,$00,$01,$00,$18,$11,$7C
	dc.b	$00,$04,$00,$19,$11,$7C,$00,$04,$00,$16,$31,$7C,$80,$26,$00,$02
	dc.b	$21,$7C,$00,$FF,$60,$D2,$00,$04,$0C,$38,$00,$01,$CD,$2D,$67,$14
	dc.b	$0C,$38,$00,$02,$CD,$2D,$67,$6C,$0C,$38,$00,$03,$CD,$2D,$67,$00
	dc.b	$00,$74,$4E,$75,$11,$7C,$00,$04,$00,$24,$42,$28,$00,$2A,$61,$00
	dc.b	$00,$08,$4E,$F9,$00,$FF,$28,$34,$4E,$B9,$00,$FF,$27,$1E,$32,$3C
	dc.b	$02,$80,$34,$3C,$01,$80,$61,$00,$00,$1E,$31,$40,$00,$10,$4E,$B9
	dc.b	$00,$FF,$27,$1E,$32,$3C,$02,$80,$34,$3C,$01,$80,$61,$00,$00,$08
	dc.b	$31,$40,$00,$12,$4E,$75,$02,$80,$00,$00,$FF,$FF,$02,$82,$00,$00
	dc.b	$FF,$FF,$48,$C0,$81,$C2,$48,$40,$4A,$40,$6B,$04,$D0,$41,$60,$02
	dc.b	$90,$41,$4E,$75,$11,$7C,$00,$06,$00,$24,$44,$68,$00,$10,$44,$68
	dc.b	$00,$12,$4E,$75,$11,$7C,$00,$0A,$00,$24,$0C,$38,$00,$06,$CD,$17
	dc.b	$67,$0E,$30,$28,$00,$08,$04,$40,$00,$C8,$31,$40,$00,$32,$60,$0C
	dc.b	$30,$28,$00,$08,$06,$40,$00,$C8,$31,$40,$00,$32,$61,$00,$F7,$6C
	dc.b	$61,$00,$EF,$62,$61,$00,$F1,$1A,$C0,$FC,$00,$10,$06,$40,$00,$2C
	dc.b	$31,$40,$00,$34,$31,$7C,$04,$00,$00,$10,$42,$68,$00,$12,$30,$28
	dc.b	$00,$32,$B0,$68,$00,$08,$6E,$04,$44,$68,$00,$10,$4E,$F9,$00,$FF
	dc.b	$28,$34,$52,$28,$00,$2A,$61,$00,$02,$68,$0C,$68,$FF,$FC,$00,$08
	dc.b	$6D,$1E,$0C,$68,$01,$44,$00,$08,$6E,$16,$0C,$68,$FF,$FC,$00,$0C
	dc.b	$6D,$0E,$0C,$68,$00,$E4,$00,$0C,$6E,$06,$4E,$F9,$00,$FF,$28,$34
	dc.b	$52,$38,$CD,$2E,$11,$7C,$00,$02,$00,$24,$4E,$75,$61,$00,$02,$32
	dc.b	$4E,$B9,$00,$FF,$28,$34,$53,$28,$00,$2A,$67,$02,$4E,$75,$52,$38
	dc.b	$CD,$2E,$11,$7C,$00,$08,$00,$24,$4E,$75,$4A,$38,$CD,$2E,$67,$06
	dc.b	$4E,$F9,$00,$FF,$28,$34,$11,$7C,$00,$02,$00,$24,$4E,$75,$61,$00
	dc.b	$02,$00,$4E,$B9,$00,$FF,$28,$34,$30,$28,$00,$32,$B0,$68,$00,$08
	dc.b	$67,$02,$4E,$75,$11,$7C,$00,$0C,$00,$24,$42,$68,$00,$10,$31,$7C
	dc.b	$04,$00,$00,$12,$30,$28,$00,$34,$B0,$68,$00,$0C,$6E,$04,$44,$68
	dc.b	$00,$12,$4E,$75,$30,$28,$00,$34,$B0,$68,$00,$0C,$67,$0A,$61,$00
	dc.b	$01,$C0,$4E,$F9,$00,$FF,$28,$34,$52,$38,$CD,$2E,$11,$7C,$00,$0E
	dc.b	$00,$24,$4E,$F9,$00,$FF,$28,$34,$4A,$38,$CD,$2E,$67,$06,$4E,$F9
	dc.b	$00,$FF,$28,$34,$11,$7C,$00,$02,$00,$24,$4E,$75,$00,$02,$01,$FC
	dc.b	$00,$00,$00,$FC,$70,$00,$10,$28,$00,$24,$30,$3B,$00,$06,$4E,$FB
	dc.b	$00,$02,$00,$08,$00,$40,$00,$B0,$00,$D0,$11,$7C,$00,$04,$00,$01
	dc.b	$11,$7C,$00,$02,$00,$24,$11,$7C,$00,$02,$00,$18,$11,$7C,$00,$08
	dc.b	$00,$19,$11,$7C,$00,$08,$00,$16,$31,$7C,$E0,$27,$00,$02,$21,$7C
	dc.b	$00,$FF,$62,$20,$00,$04,$31,$7C,$00,$A0,$00,$08,$31,$7C,$00,$38
	dc.b	$00,$0C,$61,$00,$00,$5E,$0C,$38,$00,$01,$CD,$50,$67,$34,$0C,$38
	dc.b	$00,$02,$CD,$50,$67,$3C,$0C,$38,$00,$03,$CD,$50,$67,$02,$4E,$75
	dc.b	$31,$7C,$00,$A0,$00,$08,$31,$7C,$00,$38,$00,$0C,$52,$38,$CD,$51
	dc.b	$0C,$38,$00,$04,$CD,$51,$6D,$08,$42,$38,$CD,$50,$42,$38,$CD,$51
	dc.b	$4E,$75,$42,$28,$00,$2A,$61,$00,$00,$64,$11,$7C,$00,$04,$00,$24
	dc.b	$4E,$75,$11,$7C,$00,$06,$00,$24,$44,$68,$00,$10,$44,$68,$00,$12
	dc.b	$4E,$75,$4A,$39,$00,$FF,$0F,$1F,$66,$06,$4E,$B9,$00,$FF,$28,$34
	dc.b	$4E,$75,$52,$28,$00,$2A,$61,$00,$00,$B8,$0C,$68,$00,$EC,$00,$0C
	dc.b	$6E,$04,$61,$DE,$4E,$75,$52,$38,$CD,$51,$11,$7C,$00,$02,$00,$24
	dc.b	$4E,$75,$61,$00,$00,$86,$61,$CA,$53,$28,$00,$2A,$67,$02,$4E,$75
	dc.b	$52,$38,$CD,$51,$11,$7C,$00,$02,$00,$24,$4E,$75,$4E,$B9,$00,$FF
	dc.b	$27,$1E,$00,$40,$80,$00,$08,$28,$00,$00,$00,$1A,$67,$04,$02,$40
	dc.b	$7F,$FF,$32,$3C,$00,$40,$34,$3C,$01,$00,$61,$00,$FD,$7A,$31,$40
	dc.b	$00,$10,$31,$7C,$00,$00,$00,$2E,$4E,$B9,$00,$FF,$27,$1E,$02,$40
	dc.b	$7F,$FF,$32,$3C,$00,$20,$34,$3C,$00,$20,$61,$00,$FD,$5A,$31,$40
	dc.b	$00,$30,$31,$7C,$FE,$00,$00,$12,$4E,$75,$00,$08,$00,$0E,$00,$14
	dc.b	$00,$1A,$01,$F8,$00,$08,$02,$F8,$01,$F8,$00,$08,$00,$00,$01,$00
	dc.b	$00,$08,$03,$F8,$01,$00,$00,$08,$01,$00,$61,$00,$00,$24,$30,$28
	dc.b	$00,$2E,$D1,$68,$00,$10,$30,$28,$00,$30,$D1,$68,$00,$12,$4E,$75
	dc.b	$30,$28,$00,$2E,$D1,$68,$00,$10,$30,$28,$00,$30,$D1,$68,$00,$12
	dc.b	$30,$28,$00,$10,$48,$C0,$E1,$88,$D1,$A8,$00,$08,$30,$28,$00,$12
	dc.b	$48,$C0,$E1,$88,$D1,$A8,$00,$0C,$4E,$75,$4B,$F9,$00,$C0,$00,$04
	dc.b	$74,$03,$72,$00,$12,$00,$67,$12,$E7,$49,$41,$FA,$00,$16,$2A,$B0
	dc.b	$10,$F8,$20,$70,$10,$FC,$4E,$BA,$00,$4A,$E0,$98,$51,$CA,$FF,$E4
	dc.b	$4E,$75,$40,$20,$00,$00,$00,$FF,$68,$C6,$44,$C0,$00,$00,$00,$FF
	dc.b	$68,$BE,$44,$E0,$00,$00,$00,$FF,$86,$C8,$45,$60,$00,$00,$00,$FF
	dc.b	$80,$7C,$4B,$60,$00,$00,$00,$FF,$78,$08,$5B,$60,$00,$00,$00,$FF
	dc.b	$87,$58,$78,$00,$00,$00,$00,$FF,$6A,$18,$4B,$80,$00,$01,$00,$FF
	dc.b	$72,$E4,$48,$E7,$FF,$DC,$47,$F9,$00,$FF,$63,$B2,$49,$F9,$00,$C0
	dc.b	$00,$00,$60,$0A,$48,$E7,$FF,$DC,$47,$F9,$00,$FF,$63,$C8,$43,$F8
	dc.b	$A0,$00,$34,$18,$E3,$4A,$64,$04,$D6,$FC,$00,$0A,$E5,$4A,$3A,$42
	dc.b	$76,$08,$74,$00,$78,$00,$4E,$BA,$00,$C0,$1A,$18,$E1,$45,$1A,$18
	dc.b	$3C,$3C,$00,$10,$61,$0E,$4E,$71,$4E,$71,$4E,$71,$4E,$71,$4C,$DF
	dc.b	$3B,$FF,$4E,$75,$3E,$06,$51,$47,$32,$05,$EE,$69,$0C,$01,$00,$FC
	dc.b	$64,$3E,$02,$41,$00,$FF,$D2,$41,$10,$31,$10,$00,$48,$80,$9C,$40
	dc.b	$0C,$46,$00,$09,$64,$06,$50,$46,$E1,$45,$1A,$18,$12,$31,$10,$01
	dc.b	$30,$01,$02,$41,$00,$0F,$02,$40,$00,$F0,$E8,$48,$E9,$8C,$88,$01
	dc.b	$53,$43,$66,$06,$4E,$D3,$78,$00,$76,$08,$51,$C8,$FF,$F0,$60,$B4
	dc.b	$5D,$46,$0C,$46,$00,$09,$64,$06,$50,$46,$E1,$45,$1A,$18,$5F,$46
	dc.b	$32,$05,$EC,$69,$30,$01,$02,$41,$00,$0F,$02,$40,$00,$70,$0C,$46
	dc.b	$00,$09,$64,$C6,$50,$46,$E1,$45,$1A,$18,$60,$BE,$28,$84,$53,$4D
	dc.b	$38,$0D,$66,$C2,$4E,$75,$B9,$82,$28,$82,$53,$4D,$38,$0D,$66,$B6
	dc.b	$4E,$75,$28,$C4,$53,$4D,$38,$0D,$66,$AC,$4E,$75,$B9,$82,$28,$C2
	dc.b	$53,$4D,$38,$0D,$66,$A0,$4E,$75,$10,$18,$0C,$00,$00,$FF,$66,$02
	dc.b	$4E,$75,$3E,$00,$10,$18,$0C,$00,$00,$80,$64,$EE,$12,$00,$02,$47
	dc.b	$00,$0F,$02,$41,$00,$70,$8E,$41,$02,$40,$00,$0F,$12,$00,$E1,$49
	dc.b	$8E,$41,$72,$08,$92,$40,$66,$0A,$10,$18,$D0,$40,$33,$87,$00,$00
	dc.b	$60,$D2,$10,$18,$E3,$68,$D0,$40,$7A,$01,$E3,$6D,$53,$45,$33,$87
	dc.b	$00,$00,$54,$40,$51,$CD,$FF,$F8,$60,$BA,$D0,$40,$D0,$40,$41,$F9
	dc.b	$00,$FF,$64,$72,$D0,$C0,$20,$50,$22,$7C,$00,$C0,$00,$00,$36,$3C
	dc.b	$C0,$DB,$20,$3C,$48,$A0,$00,$03,$34,$3C,$00,$03,$23,$C0,$00,$C0
	dc.b	$00,$04,$32,$3C,$00,$13,$38,$18,$D8,$43,$32,$84,$51,$C9,$FF,$F8
	dc.b	$06,$80,$00,$80,$00,$00,$51,$CA,$FF,$E4,$4E,$75,$00,$FF,$8C
	if REGION=JAPAN
	dc.b	$B0,$00,$FF,$8D,$50,$00,$FF,$8D,$F0,$00,$FF,$8E,$90,$00,$FF,$8F
	dc.b	$30,$00,$FF,$8F,$D0,$00,$FF,$90,$70,$00,$FF,$91,$10,$00,$FF,$91
	dc.b	$B0,$00,$FF,$92,$50,$00,$FF,$92,$F0,$00,$FF,$93,$90,$00,$FF,$94
	dc.b	$30,$00,$FF,$94,$D0
	else
	dc.b	$E2,$00,$FF,$8D,$82,$00,$FF,$8E,$22,$00,$FF,$8E,$C2,$00,$FF,$8F
	dc.b	$62,$00,$FF,$90,$02,$00,$FF,$90,$A2,$00,$FF,$91,$42,$00,$FF,$91
	dc.b	$E2,$00,$FF,$92,$82,$00,$FF,$93,$22,$00,$FF,$93,$C2,$00,$FF,$94
	dc.b	$62,$00,$FF,$95,$02
	endif
	dc.b	$3F,$00,$02,$80,$00,$00,$FF,$FF,$C0,$FC,$00,$0E,$43,$F9,$00,$FF
	dc.b	$65,$04,$D2,$C0,$20,$59,$30,$19,$2F,$09,$43,$F8,$A0,$00,$61,$00
	dc.b	$00,$B8,$22,$5F,$30,$1F,$0C,$40,$00,$01,$66,$04,$61,$00,$00,$48
	dc.b	$36,$19,$34,$19,$20,$11,$41,$F8,$A0,$00,$22,$7C,$00,$C0,$00,$00
	dc.b	$23,$C0,$00,$C0,$00,$04,$32,$03,$32,$98,$51,$C9,$FF,$FC,$06,$80
	dc.b	$00,$80,$00,$00,$51,$CA,$FF,$EA,$4E,$75,$00,$FF,$83,$70,$81,$C0
	dc.b	$00,$27,$00,$1B,$40,$00,$00,$03,$00,$FF,$85,$40,$22,$5C,$00,$27
	dc.b	$00,$1B,$60,$00,$00,$03,$48,$E7,$F0,$E0,$45,$F9,$00,$FF,$65,$6C
	dc.b	$36,$1A,$41,$F8,$A0,$00,$42,$80,$10,$1A,$D0,$40,$D0,$C0,$42,$80
	dc.b	$10,$1A,$C0,$FC,$00,$50,$D0,$C0,$42,$81,$42,$82,$12,$1A,$14,$1A
	dc.b	$22,$48,$30,$01,$02,$51,$9F,$FF,$D2,$FC,$00,$02,$51,$C8,$FF,$F6
	dc.b	$D0,$FC,$00,$50,$51,$CA,$FF,$EA,$51,$CB,$FF,$C8,$4C,$DF,$07,$0F
	dc.b	$4E,$75,$00,$04,$10,$01,$07,$02,$01,$10,$00,$09,$0E,$10,$00,$09
	dc.b	$1A,$10,$00,$09,$27,$10,$00,$09,$48,$E7,$FF,$7C,$36,$40,$10,$18
	dc.b	$48,$80,$3A,$40,$18,$18,$E7,$0C,$34,$58,$D4,$CB,$38,$58,$D8,$CB
	dc.b	$1A,$18,$E1,$45,$1A,$18,$7C,$10,$70,$07,$3E,$06,$9E,$40,$32,$05
	dc.b	$EE,$69,$02,$41,$00,$7F,$34,$01,$0C,$41,$00,$40,$64,$04,$70,$06
	dc.b	$E2,$4A,$61,$00,$01,$32,$02,$42,$00,$0F,$E8,$49,$D2,$41,$4E,$FB
	dc.b	$10,$4E,$32,$CA,$52,$4A,$51,$CA,$FF,$FA,$60,$CC,$32,$CC,$51,$CA
	dc.b	$FF,$FC,$60,$C4,$61,$00,$00,$60,$32,$C1,$51,$CA,$FF,$FC,$60,$B8
	dc.b	$61,$00,$00,$54,$32,$C1,$52,$41,$51,$CA,$FF,$FA,$60,$AA,$61,$00
	dc.b	$00,$46,$32,$C1,$53,$41,$51,$CA,$FF,$FA,$60,$9C,$0C,$42,$00,$0F
	dc.b	$67,$1C,$61,$00,$00,$32,$32,$C1,$51,$CA,$FF,$F8,$60,$8A,$60,$B2
	dc.b	$60,$B0,$60,$B8,$60,$B6,$60,$BC,$60,$C6,$60,$D2,$60,$DE,$53,$48
	dc.b	$0C,$46,$00,$10,$66,$02,$53,$48,$30,$08,$E2,$48,$64,$02,$52,$48
	dc.b	$4C,$DF,$3E,$FF,$4E,$75,$36,$0B,$12,$04,$D2,$01,$64,$0A,$53,$46
	dc.b	$0D,$05,$67,$04,$00,$43,$80,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05
	dc.b	$67,$04,$06,$43,$40,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05,$67,$04
	dc.b	$06,$43,$20,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05,$67,$04,$00,$43
	dc.b	$10,$00,$D2,$01,$64,$0A,$53,$46,$0D,$05,$67,$04,$00,$43,$08,$00
	dc.b	$32,$05,$3E,$06,$9E,$4D,$64,$28,$3C,$07,$06,$46,$00,$10,$44,$47
	dc.b	$EF,$69,$1A,$10,$EF,$3D,$DE,$47,$CA,$7B,$70,$2A,$D2,$45,$30,$0D
	dc.b	$D0,$40,$C2,$7B,$00,$20,$D2,$43,$1A,$18,$E1,$4D,$1A,$18,$4E,$75
	dc.b	$67,$10,$EE,$69,$30,$0D,$D0,$40,$C2,$7B,$00,$0A,$D2,$43,$30,$0D
	dc.b	$60,$24,$7C,$10,$60,$D8,$00,$01,$00,$03,$00,$07,$00,$0F,$00,$1F
	dc.b	$00,$3F,$00,$7F,$00,$FF,$01,$FF,$03,$FF,$07,$FF,$0F,$FF,$1F,$FF
	dc.b	$3F,$FF,$7F,$FF,$FF,$FF,$9C,$40,$0C,$46,$00,$09,$64,$06,$50,$46
	dc.b	$E1,$45,$1A,$18,$4E,$75,$41,$F9,$00,$FF,$67,$16,$43,$F8,$C4,$20
	dc.b	$30,$3C,$00,$1F,$22,$D8,$51,$C8,$FF,$FC,$4E,$75,$0A,$66,$0E,$AA
	dc.b	$08,$44,$08,$00,$0A,$66,$0C,$88,$0E,$AA,$00,$E0,$0A,$66,$0E,$EE
	dc.b	$0C,$88,$0A,$66,$0C,$88,$0E,$CA,$0E,$AA,$0C,$68,$0A,$66,$0E,$AA
	dc.b	$08,$44,$0C,$88,$0A,$66,$0C,$88,$0E,$AA,$0E,$AA,$0A,$66,$0C,$88
	dc.b	$0C,$88,$0A,$66,$0C,$88,$0E,$CA,$0E,$AA,$0E,$AA,$00,$00,$0E,$AA
	dc.b	$00,$00,$00,$00,$0E,$62,$00,$00,$00,$00,$00,$00,$00,$00,$06,$22
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$06,$66,$00,$00
	dc.b	$0C,$22,$0E,$44,$0E,$66,$0E,$88,$0E,$EE,$0A,$AA,$08,$88,$04,$44
	dc.b	$08,$AE,$04,$6A,$00,$00,$00,$08,$00,$00,$00,$00,$52,$38,$CD,$28
	dc.b	$41,$F8,$C4,$20,$43,$F8,$CD,$20,$45,$F9,$00,$FF,$67,$FE,$7A,$07
	dc.b	$4A,$11,$67,$2C,$0C,$11,$00,$FF,$66,$0A,$08,$38,$00,$02,$CD,$28
	dc.b	$67,$18,$60,$10,$0C,$11,$00,$01,$67,$0A,$53,$11,$08,$38,$00,$02
	dc.b	$CD,$28,$67,$06,$30,$3C,$00,$04,$60,$0A,$30,$3C,$00,$06,$60,$04
	dc.b	$30,$3C,$00,$02,$78,$02,$36,$32,$00,$00,$34,$2A,$00,$00,$31,$83
	dc.b	$20,$00,$D4,$FC,$00,$08,$51,$CC,$FF,$EE,$D2,$FC,$00,$01,$51,$CD
	dc.b	$FF,$B0,$4E,$75,$00,$10,$0A,$66,$00,$E0,$0C,$88,$00,$14,$0C,$88
	dc.b	$00,$E0,$0C,$88,$00,$1C,$0E,$AA,$00,$E0,$0C,$88,$00,$2A,$0A,$66
	dc.b	$00,$E0,$0C,$88,$00,$2C,$0C,$88,$00,$E0,$0C,$88,$00,$2E,$0E,$AA
	dc.b	$00,$E0,$0C,$88,$00,$30,$0A,$66,$00,$E0,$0C,$88,$00,$32,$0C,$88
	dc.b	$00,$E0,$0C,$88,$00,$34,$0E,$AA,$00,$E0,$0C,$88,$00,$3A,$0A,$66
	dc.b	$00,$E0,$0C,$88,$00,$3C,$0C,$88,$00,$E0,$0C,$88,$00,$3E,$0E,$AA
	dc.b	$00,$E0,$0C,$88,$00,$08,$0A,$66,$00,$E0,$0C,$88,$00,$0A,$0C,$88
	dc.b	$00,$E0,$0C,$88,$00,$0C,$0E,$AA,$00,$E0,$0C,$88,$00,$24,$0A,$66
	dc.b	$00,$E0,$0C,$88,$00,$26,$0C,$88,$00,$E0,$0C,$88,$00,$28,$0E,$AA
	dc.b	$00,$E0,$0C,$88,$00,$0E,$0C,$88,$00,$E0,$0C,$88,$00,$0E,$0C,$88
	dc.b	$00,$E0,$0C,$88,$00,$0E,$0C,$88,$00,$E0,$0C,$88,$00,$1E,$0C,$88
	dc.b	$00,$E0,$0C,$88,$00,$1E,$0C,$88,$00,$E0,$0C,$88,$00,$1E,$0C,$88
	dc.b	$00,$E0,$0C,$88,$00,$01,$80,$71,$00,$FF,$00,$00,$00,$25,$80,$04
	dc.b	$0A,$12,$01,$23,$04,$35,$1B,$45,$1E,$54,$0B,$68,$FA,$74,$0C,$89
	dc.b	$12,$00,$25,$1C,$35,$1A,$45,$1D,$57,$7C,$FF,$75,$04,$44,$44,$7E
	dc.b	$22,$22,$63,$D8,$22,$23,$D8,$22,$23,$DC,$DE,$A0,$94,$59,$64,$11
	dc.b	$26,$B2,$76,$08,$88,$88,$88,$88,$F7,$27,$C4,$B2,$FB,$0B,$2F,$E6
	dc.b	$3F,$12,$CB,$EC,$2C,$B3,$3E,$B5,$04,$A2,$C7,$94,$41,$12,$6B,$20
	dc.b	$88,$88,$8F,$C4,$44,$44,$4C,$9A,$F1,$65,$96,$59,$ED,$66,$FB,$E2
	dc.b	$CB,$11,$11,$26,$B3,$62,$25,$13,$5B,$E7,$B5,$B2,$88,$26,$25,$96
	dc.b	$59,$65,$97,$F3,$28,$85,$72,$B9,$5F,$E9,$AF,$F4,$D1,$5F,$89,$A2
	dc.b	$88,$51,$0C,$A2,$15,$C4,$AD,$51,$5F,$E9,$A2,$B5,$43,$CA,$21,$93
	dc.b	$50,$4A,$37,$AD,$EB,$65,$09,$35,$93,$B0,$44,$44,$47,$B0,$B3,$3E
	dc.b	$B5,$04,$A3,$7A,$DE,$9D,$50,$93,$E6,$57,$60,$88,$88,$8F,$61,$44
	dc.b	$13,$26,$A0,$89,$F5,$AF,$A1,$12,$6B,$27,$CD,$96,$59,$65,$96,$66
	dc.b	$C4,$44,$44,$44,$44,$44,$9A,$C8,$22,$22,$22,$22,$24,$D7,$8C,$84
	dc.b	$28,$85,$15,$F8,$9A,$28,$AF,$C4,$D1,$5F,$E9,$4A,$21,$46,$24,$2B
	dc.b	$95,$C7,$BB,$E6,$FA,$F2,$B9,$44,$32,$88,$57,$2B,$8F,$77,$CF,$73
	dc.b	$DC,$F7,$32,$7F,$A7,$DC,$DF,$37,$CD,$F3,$7C,$F7,$FA,$72,$6A,$08
	dc.b	$88,$88,$88,$89,$35,$9E,$37,$AB,$2C,$B2,$CB,$33,$DA,$82,$22,$59
	dc.b	$E3,$67,$BE,$64,$D4,$12,$CD,$F3,$E8,$44,$9A,$CB,$3D,$CD,$EA,$14
	dc.b	$4F,$9E,$2C,$C9,$D8,$59,$7D,$FA,$2C,$7B,$9B,$D4,$11,$2F,$B0,$44
	dc.b	$49,$AC,$9F,$2C,$B3,$C5,$9E,$2C,$CF,$6A,$08,$89,$35,$04,$44,$9A
	dc.b	$CD,$EA,$08,$89,$3B,$62,$24,$D6,$66,$66,$66,$4F,$99,$40,$80,$9C
	dc.b	$80,$03,$01,$14,$04,$24,$07,$35,$14,$46,$2E,$56,$31,$66,$30,$73
	dc.b	$00,$81,$05,$15,$17,$72,$38,$ED,$82,$05,$16,$18,$E3,$78,$EA,$83
	dc.b	$04,$08,$17,$6B,$38,$F4,$48,$F3,$78,$F2,$84,$07,$6E,$18,$E8,$85
	dc.b	$08,$EE,$86,$08,$EB,$87,$04,$05,$16,$33,$28,$E2,$88,$08,$EC,$89
	dc.b	$05,$12,$16,$34,$28,$F0,$8A,$05,$13,$17,$6F,$8B,$08,$EF,$18,$E6
	dc.b	$8C,$07,$6A,$17,$6C,$8D,$04,$06,$16,$2F,$28,$E9,$77,$6D,$8E,$06
	dc.b	$32,$17,$70,$28,$F1,$8F,$08,$E7,$FF,$D9,$CD,$B3,$99,$14,$A9,$53
	dc.b	$79,$E2,$2A,$8C,$8B,$73,$06,$45,$C1,$5A,$9D,$37,$33,$DE,$97,$95
	dc.b	$BA,$F2,$A5,$9D,$91,$70,$52,$CE,$A7,$32,$CF,$99,$52,$D4,$59,$DF
	dc.b	$45,$6A,$32,$2C,$D1,$8B,$4D,$4B,$5C,$C5,$71,$CD,$8D,$E9,$79,$64
	dc.b	$67,$64,$BE,$8A,$7A,$4D,$F7,$31,$5B,$95,$D5,$D4,$E6,$97,$D1,$5D
	dc.b	$82,$32,$5F,$34,$67,$57,$CD,$14,$AB,$AA,$66,$F9,$A3,$15,$39,$A5
	dc.b	$EE,$B4,$52,$A5,$5D,$4F,$15,$E8,$A3,$0E,$2A,$2A,$29,$64,$CD,$33
	dc.b	$62,$CF,$C4,$97,$BA,$9F,$D6,$76,$EA,$3F,$ED,$00,$00,$0E,$DF,$F6
	dc.b	$81,$84,$63,$AC,$0F,$EE,$E5,$B5,$8F,$95,$7F,$A4,$9F,$D1,$B0,$4F
	dc.b	$E4,$D7,$06,$E7,$6F,$E2,$6D,$F2,$EA,$FF,$88,$A7,$F2,$52,$54,$DD
	dc.b	$7F,$F1,$36,$F9,$75,$7F,$C4,$3E,$8F,$2A,$42,$6E,$BF,$A3,$2D,$B7
	dc.b	$FF,$4D,$3F,$85,$58,$3F,$C1,$48,$C6,$D0,$74,$10,$95,$2D,$D1,$93
	dc.b	$73,$ED,$BC,$01,$00,$61,$96,$DF,$F6,$80,$00,$1A,$B9,$B6,$7E,$87
	dc.b	$25,$18,$71,$60,$A5,$9D,$53,$36,$BB,$89,$2F,$75,$3C,$FB,$3B,$75
	dc.b	$6D,$00,$03,$FD,$91,$0D,$FD,$4C,$B6,$80,$01,$D1,$F4,$78,$A3,$74
	dc.b	$65,$7F,$46,$D0,$00,$4F,$DC,$A4,$5D,$07,$26,$FD,$A6,$5B,$58,$00
	dc.b	$3F,$B2,$20,$EE,$EE,$FD,$C5,$AB,$CE,$7A,$4D,$F7,$31,$5B,$95,$D5
	dc.b	$D4,$AB,$DF,$45,$76,$09,$CF,$CB,$F5,$9C,$B6,$D3,$D0,$FE,$8F,$B6
	dc.b	$3F,$45,$E9,$FF,$11,$75,$93,$9F,$F7,$BC,$FB,$5B,$2F,$F1,$FF,$C4
	dc.b	$F9,$7F,$C5,$3F,$72,$F2,$A4,$8B,$7F,$51,$BF,$FD,$16,$8F,$E9,$47
	dc.b	$1C,$7E,$8B,$F4,$76,$8F,$D1,$7F,$C4,$FF,$26,$D8,$77,$96,$FE,$A3
	dc.b	$7F,$7A,$FE,$38,$B4,$56,$0C,$71,$C5,$8D,$75,$DB,$CF,$FE,$27,$F6
	dc.b	$42,$9F,$BF,$E9,$E7,$DA,$20,$46,$15,$8C,$62,$B1,$75,$62,$EB,$6A
	dc.b	$6E,$7D,$5D,$FB,$21,$D6,$8A,$8A,$55,$D5,$33,$7C,$D1,$9F,$34,$BD
	dc.b	$D7,$15,$2A,$F9,$4D,$B7,$B1,$BE,$EF,$E6,$9B,$CB,$66,$59,$2F,$54
	dc.b	$52,$B4,$CD,$EF,$53,$99,$57,$52,$A8,$AC,$A8,$A7,$32,$A5,$51,$6E
	dc.b	$57,$FD,$E8,$2A,$56,$8C,$73,$B9,$91,$AE,$BD,$FF,$7B,$72,$E0,$B4
	dc.b	$63,$D2,$8A,$59,$D9,$17,$15,$4B,$E9,$C4,$59,$2B,$AB,$9B,$67,$20
	dc.b	$00,$00,$35,$D1,$6C,$2D,$85,$B0,$B6,$16,$C2,$D8,$5B,$0B,$1B,$1D
	dc.b	$20,$CB,$18,$36,$C2,$D8,$5A,$93,$91,$B6,$16,$A6,$FC,$20,$F7,$D6
	dc.b	$91,$84,$01,$8C,$E4,$67,$84,$E1,$F7,$A4,$52,$31,$9C,$48,$63,$39
	dc.b	$0B,$A6,$04,$A7,$84,$19,$CA,$72,$A9,$B6,$16,$C7,$8F,$1E,$39,$DD
	dc.b	$C7,$8F,$1E,$3C,$71,$8D,$A3,$48,$3C,$60,$00,$00,$30,$00,$00,$0C
	dc.b	$2D,$CB,$F7,$95,$A2,$E0,$B4,$63,$D3,$46,$76,$45,$06,$FA,$71,$16
	dc.b	$4B,$77,$5B,$B3,$F3,$FC,$74,$F4,$01,$E7,$E0,$21,$FF,$75,$77,$A3
	dc.b	$CE,$3C,$0C,$AE,$98,$49,$19,$99,$C0,$01,$24,$66,$67,$AC,$C8,$FE
	dc.b	$AB,$5D,$D0,$00,$00,$24,$48,$CC,$C2,$43,$EB,$00,$00,$0D,$AB,$F9
	dc.b	$8B,$57,$66,$37,$9B,$CD,$E5,$8A,$96,$4B,$DD,$4A,$D3,$37,$62,$A7
	dc.b	$32,$AE,$A5,$51,$6D,$B3,$BF,$57,$37,$60,$C2,$00,$C2,$00,$B5,$2A
	dc.b	$60,$D9,$EA,$9C,$AD,$74,$27,$F0,$A0,$FF,$47,$AA,$3F,$C2,$FF,$D2
	dc.b	$D3,$97,$35,$69,$02,$53,$36,$7E,$3F,$D0,$BF,$6D,$9F,$F6,$55,$7A
	dc.b	$FE,$62,$2C,$F6,$4A,$D9,$EB,$84,$07,$B3,$D9,$EA,$F5,$7B,$3D,$9E
	dc.b	$AF,$57,$B3,$DA,$9C,$D5,$B6,$95,$F4,$4B,$1E,$D3,$6E,$5F,$C2,$4F
	dc.b	$F0,$9A,$FF,$8B,$FE,$27,$F8,$4F,$5E,$3A,$D9,$2C,$00,$00,$0A,$F7
	dc.b	$EA,$EC,$E6,$D8,$54,$AA,$2D,$CB,$4E,$90,$54,$AD,$18,$E7,$73,$0B
	dc.b	$ED,$FC,$1B,$40,$03,$18,$AE,$10,$07,$19,$D2,$0C,$80,$A8,$49,$4D
	dc.b	$25,$4D,$6F,$5F,$2F,$E9,$CA,$0E,$90,$64,$00,$9A,$4A,$69,$2D,$69
	dc.b	$AD,$3C,$BC,$A5,$07,$48,$00,$24,$D2,$53,$7D,$69,$AD,$3C,$BC,$8E
	dc.b	$90,$7F,$44,$06,$35,$49,$4E,$95,$4D,$6F,$FD,$3A,$A7,$F8,$CC,$00
	dc.b	$30,$80,$06,$16,$FD,$67,$6B,$AB,$51,$91,$67,$46,$9A,$96,$B9,$8A
	dc.b	$E3,$9B,$1B,$D2,$FA,$33,$B5,$BF,$2B,$CF,$DA,$1E,$7E,$02,$0C,$BF
	dc.b	$94,$FF,$D3,$01,$34,$8D,$20,$CA,$E9,$BC,$E2,$41,$E5,$37,$94,$D3
	dc.b	$5B,$C0,$0F,$A4,$24,$03,$24,$98,$87,$97,$EA,$92,$13,$D0,$07,$D2
	dc.b	$00,$17,$4A,$78,$6B,$01,$ED,$AB,$9B,$67,$32,$29,$52,$A8,$C7,$88
	dc.b	$AA,$32,$2D,$CC,$19,$17,$05,$BB,$A6,$DF,$D1,$B0,$00,$61,$00,$58
	dc.b	$D8,$F6,$BF,$F0,$5E,$B8,$F1,$F6,$9B,$1B,$7F,$47,$FA,$5A,$FF,$A2
	dc.b	$9F,$D3,$AE,$91,$5D,$22,$AF,$18,$CF,$BD,$EB,$2A,$4C,$D4,$CB,$F5
	dc.b	$47,$5D,$A2,$A6,$A6,$C6,$A6,$A6,$A6,$BE,$55,$D2,$2B,$A4,$55,$EB
	dc.b	$8C,$E4,$F5,$BA,$66,$B2,$FD,$D1,$D7,$63,$53,$53,$63,$53,$53,$53
	dc.b	$5F,$2E,$D3,$63,$6F,$E0,$E1,$57,$ED,$E3,$4E,$DB,$1B,$18,$FE,$17
	dc.b	$23,$FC,$1F,$24,$83,$68,$BA,$C2,$B1,$75,$63,$18,$C6,$00,$C2,$DD
	dc.b	$BA,$B9,$1B,$D2,$FC,$2F,$2A,$59,$D9,$17,$05,$2D,$76,$65,$9F,$32
	dc.b	$A5,$93,$86,$9C,$20,$FF,$88,$00,$00,$3D,$5F,$E2,$00,$00,$36,$73
	dc.b	$6C,$E6,$A9,$52,$A5,$51,$8F,$11,$54,$64,$5B,$98,$32,$2E,$0B,$77
	dc.b	$4D,$7F,$C6,$78,$4B,$2F,$D1,$96,$45,$9A,$31,$69,$A9,$6B,$98,$AE
	dc.b	$39,$B1,$BD,$2F,$2C,$8C,$ED,$FB,$EF,$4F,$1D,$38,$4A,$F3,$C4,$55
	dc.b	$19,$16,$E6,$0C,$8B,$82,$B5,$3A,$72,$FF,$1F,$8F,$E8,$F2,$85,$BA
	dc.b	$F2,$A5,$9D,$91,$70,$52,$CE,$A7,$32,$CF,$99,$52,$C7,$C7,$4E,$11
	dc.b	$E3,$2C,$BF,$46,$59,$16,$68,$C5,$A6,$A5,$AE,$62,$B8,$E6,$C6,$F4
	dc.b	$BC,$B2,$33,$B6,$5D,$25,$93,$2B,$D2,$F2,$B7,$5E,$54,$B3,$B2,$2E
	dc.b	$0A,$59,$D4,$E6,$59,$F3,$2A,$58,$E5,$B3,$9B,$65,$40,$00,$01,$CF
	dc.b	$AB,$FA,$29,$D2,$6F,$B9,$8A,$DC,$AE,$AE,$A5,$5E,$FA,$2B,$B0,$7E
	dc.b	$5F,$AC,$E5,$B4,$00,$3F,$92,$24,$9F,$D4,$DB,$78,$00,$1F,$DC,$BC
	dc.b	$A9,$24,$DD,$FC,$8D,$98,$DE,$6F,$37,$96,$2A,$59,$2F,$75,$2B,$4C
	dc.b	$DD,$8A,$9C,$CA,$BA,$95,$45,$DD,$DD,$CF,$D9,$DD,$6E,$CE,$F7,$80
	dc.b	$00,$03,$08,$C2,$00,$C6,$72,$18,$EF,$C2,$29,$BB,$BB,$B3,$BF,$F2
	dc.b	$BD,$9D,$E8,$A5,$4A,$A3,$1E,$22,$A8,$C8,$B7,$30,$64,$5C,$16,$EF
	dc.b	$DE,$FF,$84,$00,$01,$FD,$CB,$CA,$90,$64,$93,$91,$9C,$48,$24,$E4
	dc.b	$0C,$D2,$5F,$BA,$30,$9E,$69,$E0,$FA,$3C,$B1,$9F,$84,$E4,$00,$94
	dc.b	$D2,$53,$7D,$69,$AD,$F4,$4D,$21,$E1,$E2,$ED,$00,$09,$29,$E1,$AF
	dc.b	$1F,$04,$83,$27,$91,$9C,$A7,$24,$98,$00,$CA,$69,$29,$BE,$B4,$D7
	dc.b	$4F,$0A,$49,$E4,$FF,$C9,$00,$00,$9F,$B9,$12,$49,$1F,$DD,$19,$26
	dc.b	$FD,$69,$27,$95,$25,$34,$8A,$45,$DE,$00,$CD,$34,$FD,$51,$84,$91
	dc.b	$DE,$9A,$00,$01,$98,$33,$A4,$B7,$98,$32,$9C,$8E,$F8,$32,$98,$33
	dc.b	$C6,$60,$48,$09,$4D,$25,$34,$94,$CE,$98,$CA,$78,$6B,$17,$69,$74
	dc.b	$D2,$12,$4F,$3A,$4B,$79,$D6,$74,$3B,$E2,$E9,$4F,$0D,$62,$ED,$2E
	dc.b	$9A,$42,$49,$E7,$49,$6F,$30,$74,$8D,$E0,$01,$74,$C1,$9B,$CB,$F5
	dc.b	$46,$0D,$B5,$7E,$BF,$B3,$65,$16,$8A,$8A,$55,$D5,$33,$7C,$D1,$9F
	dc.b	$34,$BD,$D7,$15,$2A,$FC,$FD,$FA,$B9,$B6,$54,$01,$D7,$FE,$23,$2C
	dc.b	$BC,$D5,$2F,$A7,$11,$64,$D9,$CD,$B3,$90,$03,$AB,$2D,$38,$4B,$83
	dc.b	$29,$CC,$AB,$A9,$54,$5A,$EC,$EF,$D5,$FA,$B0,$07,$57,$9F,$8D,$CC
	dc.b	$8D,$75,$FA,$BF,$C2,$00,$EA,$D3,$2F,$35,$4B,$E9,$C4,$59,$32,$CC
	dc.b	$E7,$79,$52,$A8,$B7,$2D,$3A,$41,$52,$B0,$EC,$73,$B9,$91,$AE,$BE
	dc.b	$BF,$EC,$DA,$0F,$EE,$5E,$54,$95,$37,$A4,$52,$04,$A6,$9D,$19,$5F
	dc.b	$C3,$6B,$03,$FB,$97,$95,$25,$4D,$E9,$14,$81,$4E,$8C,$9B,$A3,$2D
	dc.b	$AC,$3F,$92,$92,$BA,$54,$DE,$91,$48,$79,$0E,$8C,$9B,$A3,$2D,$AC
	dc.b	$25,$4D,$12,$2E,$80,$67,$06,$46,$70,$3B,$BB,$2D,$5E,$CE,$EB,$57
	dc.b	$2B,$D2,$FC,$2F,$2A,$59,$D9,$17,$05,$2D,$76,$65,$9F,$32,$A5,$8F
	dc.b	$7F,$77,$3F,$36,$CA,$81,$4D,$04,$00,$F3,$96,$33,$90,$00,$01,$8C
	dc.b	$E5,$8C,$E5,$8C,$E4,$0C,$E1,$FF,$55,$17,$6B,$00,$61,$A4,$19,$19
	dc.b	$C8,$CE,$02,$49,$27,$00,$00,$F2,$49,$EB,$49,$7E,$A8,$C3,$FA,$04
	dc.b	$EA,$F3,$F1,$B9,$91,$AE,$BF,$57,$EE,$38,$EA,$65,$FA,$A3,$0F,$E8
	dc.b	$13,$AB,$4C,$BC,$D5,$2F,$A7,$11,$64,$FC,$AF,$67,$7E,$CE,$52,$9E
	dc.b	$1A,$C5,$DD,$59,$69,$C2,$5C,$19,$4E,$65,$5D,$4A,$A2,$D7,$57,$75
	dc.b	$B9,$FF,$56,$92,$9E,$1A,$C3,$F5,$79,$F8,$DC,$C8,$D7,$5F,$5F,$F6
	dc.b	$6D,$07,$F9,$22,$54,$DE,$91,$48,$0E,$DD,$19,$37,$46,$5B,$41,$FE
	dc.b	$C8,$87,$FD,$D5,$DE,$81,$BA,$32,$DB,$FB,$D0,$74,$10,$00,$A3,$74
	dc.b	$65,$B7,$F7,$A0,$FF,$64,$41,$94,$D3,$7B,$C3,$EB,$07,$49,$CA,$72
	dc.b	$80,$00,$01,$E7,$2C,$67,$E1,$0F,$3F,$01,$0F,$FB,$AB,$BD,$00,$79
	dc.b	$F8,$52,$7E,$00,$00,$05,$27,$E0,$9A,$24,$E4,$00,$00,$04,$D1,$27
	dc.b	$AC,$CB,$F7,$46,$13,$CC,$1E,$AC,$B4,$E1,$2E,$0C,$A7,$32,$AE,$A5
	dc.b	$51,$6B,$F9,$5B,$77,$71,$F6,$19,$7F,$29,$FF,$A6,$3A,$BC,$FC,$6E
	dc.b	$64,$6B,$AF,$D5,$FD,$8B,$19,$7F,$29,$FF,$A6,$3A,$B4,$CB,$CD,$52
	dc.b	$FA,$71,$16,$4D,$5D,$DC,$7F,$95,$EC,$B1,$97,$F2,$9F,$FA,$63,$AB
	dc.b	$2D,$38,$4B,$83,$29,$CC,$AB,$A9,$54,$5A,$EC,$B7,$77,$67,$33,$CA
	dc.b	$78,$6B,$09,$D5,$E7,$E3,$73,$23,$5D,$7D,$7F,$D8,$7F,$D8,$00,$00
	dc.b	$1F,$FE,$7F,$B0,$00,$00,$FF,$E7,$FB,$39,$C0,$00,$0D,$58,$C0,$00
	dc.b	$00,$35,$00,$00,$00,$63,$00,$00,$00,$FF,$37,$70,$C7,$80,$00,$0C
	dc.b	$78,$03,$C2,$ED,$C9,$B8,$1F,$1A,$64,$0C,$CC,$EE,$99,$F1,$DD,$FB
	dc.b	$E0,$03,$FE,$F8,$E4,$72,$A6,$E3,$B9,$3F,$55,$76,$FE,$8C,$B7,$7E
	dc.b	$F8,$00,$00,$09,$FB,$6F,$DC,$00,$00,$03,$F7,$C0,$00,$9F,$96,$00
	dc.b	$63,$F9,$60,$07,$E5,$9F,$F4,$C9,$D6,$7A,$DE,$69,$A9,$26,$0E,$AF
	dc.b	$CB,$6A,$FC,$B6,$AE,$B0,$00,$EB,$1A,$86,$39,$6E,$FE,$47,$5E,$19
	dc.b	$63,$C0,$63,$90,$C8,$0F,$1D,$DF,$BE,$9D,$DB,$F7,$63,$3C,$AE,$9B
	dc.b	$CC,$E4,$FB,$CE,$E3,$96,$FF,$D2,$3F,$40,$CB,$71,$FD,$F1,$9A,$65
	dc.b	$34,$DD,$3D,$C9,$BA,$9B,$BC,$5E,$77,$4D,$37,$65,$FA,$A3,$D0,$9F
	dc.b	$B4,$07,$FB,$1C,$00,$03,$1E,$B9,$E1,$A8,$6A,$FC,$B6,$AF,$CB,$6A
	dc.b	$EB,$03,$19,$DD,$D7,$4E,$B9,$A7,$5E,$FD,$47,$62,$6C,$1D,$7A,$80
	dc.b	$18,$CC,$6A,$C7,$50,$C2,$DF,$EE,$00,$00,$0F,$F8,$F5,$7F,$8C,$00
	dc.b	$00,$F2,$FF,$18,$00,$00,$7F,$C6,$7F,$FF,$DB,$FA,$6A,$D1,$5F,$F7
	dc.b	$A0,$A9,$5A,$31,$CE,$E6,$46,$BA,$FA,$FF,$B2,$BB,$2B,$D7,$CB,$55
	dc.b	$16,$8C,$7A,$51,$4B,$3B,$22,$E2,$A9,$7D,$38,$8B,$27,$2F,$CB,$72
	dc.b	$FF,$E6,$CE,$93,$79,$6C,$CB,$25,$EA,$8A,$56,$99,$BD,$EA,$73,$2A
	dc.b	$EA,$55,$15,$B9,$75,$D7,$F4,$C7,$65,$7A,$F9,$6A,$A2,$D1,$8F,$4A
	dc.b	$29,$67,$64,$5C,$55,$2F,$A7,$11,$64,$00,$80,$47,$80,$03,$00,$13
	dc.b	$02,$24,$08,$34,$0A,$45,$17,$58,$F4,$66,$3A,$76,$36,$81,$03,$01
	dc.b	$15,$16,$27,$77,$82,$05,$18,$17,$76,$83,$03,$03,$15,$1A,$27,$79
	dc.b	$84,$06,$38,$17,$78,$86,$08,$F6,$87,$04,$09,$16,$37,$28,$F5,$8C
	dc.b	$18,$F7,$8D,$05,$19,$16,$39,$FF,$F7,$FC,$DF,$BF,$E6,$D4,$89,$12
	dc.b	$39,$1E,$A2,$56,$54,$DF,$3B,$65,$4F,$53,$9A,$FD,$6D,$F3,$1C,$AE
	dc.b	$44,$DF,$91,$23,$31,$95,$3D,$48,$CC,$48,$DC,$66,$37,$12,$33,$53
	dc.b	$F8,$AE,$6A,$73,$59,$53,$F8,$A5,$91,$9F,$C5,$48,$CD,$F2,$27,$D3
	dc.b	$7C,$8E,$57,$23,$2B,$31,$9F,$DE,$7E,$C7,$6D,$B6,$DB,$6D,$B6,$F7
	dc.b	$FE,$8C,$8F,$D6,$8E,$6F,$91,$37,$98,$98,$91,$BA,$E6,$A6,$33,$B2
	dc.b	$CA,$E7,$F1,$4B,$31,$31,$BA,$91,$31,$2B,$78,$DD,$64,$48,$DD,$73
	dc.b	$13,$52,$24,$4C,$48,$F5,$E5,$4E,$DD,$7A,$D4,$A9,$19,$5B,$AD,$F2
	dc.b	$33,$1E,$AB,$98,$91,$E2,$7F,$75,$24,$79,$1A,$BB,$06,$E6,$0C,$11
	dc.b	$65,$AA,$30,$F6,$4D,$6B,$09,$C1,$8B,$22,$0C,$15,$68,$B2,$60,$8B
	dc.b	$2D,$41,$A2,$08,$30,$47,$7D,$23,$B7,$5D,$E8,$A2,$1A,$B2,$B3,$0E
	dc.b	$3B,$AD,$41,$1F,$88,$F7,$FC,$FE,$7F,$1F,$F8,$CE,$23,$11,$D9,$60
	dc.b	$62,$30,$BB,$47,$65,$C0,$C0,$EC,$BC,$46,$2B,$03,$03,$11,$81,$FA
	dc.b	$2F,$0B,$1B,$75,$FA,$2A,$C2,$C0,$E1,$76,$5D,$B8,$1C,$47,$E8,$97
	dc.b	$88,$C0,$F0,$3F,$68,$30,$3F,$48,$3C,$5F,$81,$8B,$E2,$31,$18,$1D
	dc.b	$97,$8A,$C4,$71,$B2,$FC,$CF,$E3,$BF,$55,$F9,$E2,$3D,$46,$F7,$90
	dc.b	$6E,$60,$C1,$16,$5B,$D1,$89,$D9,$4A,$DF,$D9,$4C,$18,$B2,$20,$C1
	dc.b	$56,$8B,$29,$04,$59,$6F,$06,$88,$20,$C1,$1D,$F7,$47,$6E,$BB,$D1
	dc.b	$44,$4A,$B2,$B4,$89,$8E,$EB,$78,$23,$F1,$1F,$95,$FD,$17,$E3,$FF
	dc.b	$11,$9B,$FF,$34,$72,$33,$B8,$CA,$E6,$54,$89,$AD,$E3,$99,$1B,$89
	dc.b	$89,$12,$A7,$32,$A4,$6E,$24,$4A,$9B,$CC,$7E,$F7,$61,$22,$6B,$23
	dc.b	$7B,$E5,$66,$FC,$C7,$EF,$6F,$3D,$4D,$64,$7E,$B5,$48,$CC,$65,$4F
	dc.b	$A4,$AE,$6B,$D4,$65,$7E,$27,$F1,$5C,$FE,$6B,$C3,$BF,$F0,$C6,$83
	dc.b	$B0,$6B,$45,$10,$6A,$D1,$A2,$2C,$0C,$10,$51,$65,$11,$60,$41,$46
	dc.b	$E6,$3F,$67,$B0,$20,$D3,$16,$BB,$4E,$FA,$8F,$D9,$DC,$F4,$69,$8F
	dc.b	$28,$87,$0D,$1F,$42,$B5,$5D,$C3,$5F,$8F,$CF,$E3,$BF,$19,$CF,$B8
	dc.b	$C0,$C2,$C5,$F1,$1F,$B4,$D8,$60,$62,$B8,$1D,$AF,$C2,$E2,$FE,$23
	dc.b	$F6,$97,$C7,$58,$AE,$07,$E9,$16,$07,$11,$C2,$C7,$A6,$17,$8A,$FD
	dc.b	$10,$E2,$38,$FC,$B7,$F1,$2F,$FC,$41,$E0,$71,$D8,$70,$BC,$61,$60
	dc.b	$62,$BB,$47,$8C,$0E,$C3,$11,$81,$85,$8C,$FE,$7B,$F1,$9F,$8E,$FC
	dc.b	$67,$E6,$E6,$FF,$C7,$1B,$89,$B0,$95,$B9,$44,$1A,$B4,$6E,$45,$81
	dc.b	$82,$0A,$32,$51,$16,$04,$14,$6E,$63,$F6,$FB,$02,$0D,$48,$B5,$E5
	dc.b	$4D,$F7,$8F,$DB,$DC,$F4,$6A,$47,$AA,$22,$62,$51,$F4,$2B,$7A,$EE
	dc.b	$25,$7F,$5A,$88,$20,$8D,$0E,$E0,$A6,$8D,$DE,$CD,$1E,$8B,$AF,$37
	dc.b	$71,$A5,$A0,$6F,$A0,$43,$86,$8F,$44,$38,$22,$C1,$C5,$81,$0E,$8E
	dc.b	$35,$45,$D3,$47,$09,$87,$82,$1D,$D8,$3E,$96,$63,$4B,$41,$A7,$0F
	dc.b	$F1,$FF,$AB,$FC,$47,$E3,$3F,$30,$3C,$2F,$03,$17,$F0,$30,$38,$8E
	dc.b	$16,$3A,$C0,$E2,$30,$3B,$0E,$23,$B0,$C0,$E2,$B1,$ED,$E2,$B1,$C5
	dc.b	$70,$B1,$EC,$B8,$1C,$7B,$60,$71,$7E,$06,$3D,$3B,$70,$3C,$2F,$03
	dc.b	$85,$C4,$70,$BB,$78,$FC,$B2,$C0,$C0,$C0,$F0,$3F,$44,$30,$B8,$58
	dc.b	$BF,$1B,$70,$B1,$D6,$38,$AF,$D2,$7E,$27,$3E,$FC,$FB,$A2,$08,$23
	dc.b	$71,$DC,$15,$28,$DE,$76,$94,$7A,$33,$5E,$B7,$98,$DD,$6E,$0D,$F7
	dc.b	$04,$4C,$4A,$3D,$11,$30,$45,$84,$C5,$81,$13,$47,$DB,$7A,$33,$52
	dc.b	$8F,$B2,$91,$3E,$C4,$4D,$E4,$1F,$4B,$48,$DD,$6E,$25,$4C,$4F,$E1
	dc.b	$7D,$BF,$0B,$ED,$6E,$C1,$86,$9D,$DC,$7E,$C7,$60,$C3,$A2,$35,$72
	dc.b	$8D,$ED,$1F,$B1,$BB,$E9,$D1,$1D,$D3,$06,$0A,$7E,$8D,$5A,$BC,$83
	dc.b	$07,$B7,$F0,$6F,$FC,$11,$60,$74,$0A,$B3,$4C,$3A,$D4,$59,$8D,$07
	dc.b	$0C,$34,$FB,$E0,$BE,$C2,$CA,$C1,$DE,$C1,$83,$05,$3E,$98,$30,$C6
	dc.b	$81,$8D,$06,$0D,$3C,$5A,$99,$A2,$9E,$11,$07,$0C,$1B,$90,$FD,$34
	dc.b	$45,$95,$81,$46,$0A,$D5,$BB,$26,$18,$62,$C3,$C8,$68,$A7,$73,$B1
	dc.b	$4F,$A6,$6B,$FE,$38,$EF,$0E,$34,$98,$70,$D6,$A3,$48,$86,$34,$AD
	dc.b	$0E,$98,$61,$C3,$1E,$6C,$9E,$DD,$79,$A6,$98,$2B,$4B,$44,$18,$F2
	dc.b	$AD,$0C,$58,$7E,$C4,$31,$DC,$5A,$E4,$3B,$B8,$70,$C6,$95,$A9,$C1
	dc.b	$D9,$7E,$33,$F3,$FF,$9E,$FD,$7B,$83,$16,$44,$18,$2A,$D1,$64,$C1
	dc.b	$16,$5A,$83,$44,$10,$60,$8E,$FA,$47,$6E,$BB,$D1,$44,$35,$65,$66
	dc.b	$1C,$77,$5A,$82,$34,$3F,$66,$08,$F2,$35,$76,$0D,$CC,$18,$22,$CB
	dc.b	$54,$61,$ED,$04,$7E,$8A,$08,$28,$DC,$C7,$EC,$F6,$04,$1A,$62,$D7
	dc.b	$69,$DF,$51,$FB,$3B,$9E,$8D,$31,$E5,$10,$E1,$A3,$E8,$56,$AB,$B8
	dc.b	$70,$FB,$7F,$0E,$FF,$C3,$1A,$0E,$C1,$AD,$14,$41,$AB,$46,$88,$B0
	dc.b	$30,$41,$47,$CE,$19,$EC,$34,$B4,$0D,$F4,$08,$70,$D1,$E8,$87,$04
	dc.b	$58,$38,$B0,$21,$D1,$C6,$A8,$BA,$68,$E1,$30,$F0,$43,$BB,$07,$D2
	dc.b	$CC,$69,$68,$34,$E1,$AB,$6B,$B2,$20,$82,$34,$3B,$82,$9A,$37,$7B
	dc.b	$34,$7A,$2E,$BC,$FB,$7E,$D2,$7C,$18,$71,$A4,$C3,$86,$B5,$1A,$44
	dc.b	$31,$A5,$68,$74,$C3,$0E,$18,$F3,$64,$F6,$EB,$CD,$34,$C1,$5A,$5A
	dc.b	$20,$C7,$95,$68,$62,$C3,$F6,$21,$8E,$E2,$D7,$21,$DD,$C3,$86,$34
	dc.b	$AD,$4E,$0E,$D0,$C7,$E8,$A1,$86,$9D,$DC,$7E,$C7,$60,$C3,$A2,$35
	dc.b	$72,$8D,$ED,$1F,$B1,$BB,$E9,$D1,$1D,$D3,$06,$0A,$7E,$8D,$5A,$BC
	dc.b	$83,$07,$B7,$F0,$6F,$FC,$11,$60,$74,$0A,$B3,$4C,$3A,$D4,$59,$8D
	dc.b	$07,$0C,$34,$FB,$E0,$BE,$C2,$CA,$C1,$DE,$C1,$83,$05,$3E,$98,$30
	dc.b	$C6,$81,$8D,$06,$0D,$3C,$5A,$99,$A2,$9E,$11,$07,$0C,$1B,$90,$FD
	dc.b	$34,$45,$95,$81,$46,$0A,$D5,$BB,$26,$18,$62,$C3,$C8,$68,$A7,$73
	dc.b	$B1,$4F,$A6,$6B,$BF,$E3,$3F,$DF,$B6,$DB,$6D,$B6,$DB,$7E,$3F,$F3
	dc.b	$7E,$FD,$C4,$ED,$D7,$AF,$52,$33,$12,$B7,$CD,$FD,$57,$31,$2B,$23
	dc.b	$F7,$B1,$FA,$D1,$CD,$F2,$26,$F3,$13,$12,$26,$39,$A9,$8C,$ED,$1F
	dc.b	$CD,$19,$A9,$EA,$6B,$23,$F5,$B5,$98,$CA,$9D,$87,$35,$EA,$33,$19
	dc.b	$FC,$D7,$EF,$7D,$39,$1C,$8E,$46,$44,$8C,$AE,$62,$44,$D6,$F1,$91
	dc.b	$23,$71,$31,$22,$54,$C4,$E7,$F5,$51,$39,$AC,$A9,$FC,$55,$67,$F1
	dc.b	$52,$33,$7C,$89,$F4,$DF,$23,$95,$CD,$66,$32,$B7,$E7,$F3,$4A,$44
	dc.b	$89,$59,$1E,$A2,$56,$54,$DF,$3B,$65,$4F,$53,$7F,$D6,$80,$80,$80
	dc.b	$80,$04,$02,$14,$03,$24,$06,$35,$12,$45,$13,$55,$18,$66,$33,$73
	dc.b	$00,$81,$04,$05,$16,$36,$82,$04,$04,$16,$38,$28,$F4,$83,$04,$07
	dc.b	$16,$37,$27,$79,$84,$06,$35,$85,$06,$34,$18,$F7,$86,$05,$11,$17
	dc.b	$76,$87,$05,$10,$17,$74,$88,$05,$15,$18,$F6,$89,$05,$14,$17,$78
	dc.b	$8A,$07,$72,$8B,$07,$73,$8C,$05,$16,$18,$F5,$8D,$06,$32,$8E,$07
	dc.b	$75,$8F,$05,$17,$17,$77,$FF,$00,$00,$00,$00,$00,$33,$8E,$23,$88
	dc.b	$82,$49,$44,$92,$18,$8A,$8C,$7E,$52,$51,$1F,$A6,$00,$67,$10,$06
	dc.b	$71,$03,$1D,$A5,$DA,$71,$3F,$73,$89,$7B,$B4,$4B,$49,$44,$B4,$2F
	dc.b	$D8,$9E,$D2,$89,$6B,$15,$94,$49,$34,$59,$44,$F4,$56,$8B,$29,$76
	dc.b	$34,$D3,$63,$4D,$21,$2D,$21,$FC,$1D,$36,$9A,$80,$33,$D7,$B2,$CF
	dc.b	$8D,$35,$FD,$0F,$63,$48,$6C,$51,$24,$28,$9C,$49,$0A,$38,$8C,$D2
	dc.b	$38,$88,$3E,$D0,$D4,$BF,$49,$C3,$8F,$FB,$1F,$FD,$B3,$4F,$F2,$C0
	dc.b	$17,$F5,$CF,$F4,$CD,$B5,$2A,$51,$9A,$D4,$A3,$8A,$14,$66,$A2,$99
	dc.b	$A9,$2B,$2F,$88,$B7,$B7,$45,$25,$AF,$E9,$D6,$2A,$7D,$3B,$69,$28
	dc.b	$47,$43,$56,$88,$92,$94,$17,$38,$4D,$4F,$49,$FB,$53,$46,$A1,$29
	dc.b	$50,$EF,$28,$4D,$4A,$07,$78,$9A,$9F,$6A,$76,$25,$D7,$D3,$9C,$33
	dc.b	$B7,$E7,$7F,$8C,$3F,$6C,$3F,$4D,$2E,$0F,$B1,$F4,$F7,$3E,$DF,$A7
	dc.b	$2F,$79,$F4,$2D,$0B,$66,$81,$69,$88,$17,$EC,$5A,$02,$2A,$7B,$03
	dc.b	$82,$F6,$D8,$D4,$A0,$50,$6E,$91,$81,$7E,$9F,$DF,$A2,$B5,$E1,$68
	dc.b	$EC,$75,$85,$5E,$24,$A7,$D4,$DC,$D4,$A8,$CB,$9C,$23,$0A,$95,$4F
	dc.b	$87,$BC,$2E,$7E,$B0,$B3,$59,$A1,$FA,$C6,$FC,$DC,$31,$68,$4F,$62
	dc.b	$52,$FD,$09,$A9,$29,$AF,$FB,$6D,$9F,$FD,$80,$13,$FD,$31,$FE,$99
	dc.b	$A3,$2F,$79,$69,$AA,$CB,$45,$CD,$4E,$21,$BA,$05,$27,$94,$0F,$47
	dc.b	$28,$C0,$F6,$8C,$BB,$02,$89,$EC,$E0,$DC,$F7,$06,$A1,$BC,$75,$28
	dc.b	$9C,$69,$D6,$9D,$5E,$50,$94,$4B,$F3,$7C,$B2,$9A,$E1,$4B,$23,$89
	dc.b	$AE,$47,$16,$B1,$C6,$7D,$A7,$10,$00,$03,$11,$C4,$46,$22,$00,$00
	dc.b	$67,$10,$22,$06,$71,$C4,$4A,$33,$EC,$00,$C7,$E9,$8F,$F4,$CD,$D8
	dc.b	$01,$8B,$83,$B8,$35,$BE,$3A,$DC,$BB,$92,$9A,$97,$7F,$CF,$1F,$56
	dc.b	$53,$EB,$9A,$F7,$6B,$80,$25,$DA,$71,$3F,$D3,$0E,$C0,$0F,$EB,$0E
	dc.b	$C0,$00,$1A,$F2,$BA,$CA,$E5,$7E,$A7,$D5,$AE,$77,$5B,$A9,$77,$3B
	dc.b	$97,$52,$EF,$8E,$E7,$7E,$B9,$AC,$EF,$D7,$35,$C5,$C3,$46,$7D,$8B
	dc.b	$F8,$C0,$00,$D1,$11,$11,$02,$33,$B8,$00,$67,$7C,$EF,$9D,$CA,$23
	dc.b	$11,$18,$8E,$22,$00,$02,$5E,$5B,$73,$53,$7D,$A6,$E8,$13,$F4,$2D
	dc.b	$C1,$C0,$D1,$A2,$84,$98,$4C,$FD,$02,$03,$8A,$32,$35,$CD,$25,$43
	dc.b	$F4,$FD,$4C,$BF,$37,$E2,$5F,$AB,$D2,$69,$D7,$14,$EF,$8A,$F2,$CF
	dc.b	$96,$2D,$AC,$ED,$9F,$EB,$1C,$79,$34,$2A,$B6,$ED,$59,$29,$77,$84
	dc.b	$9F,$D2,$07,$D1,$93,$A2,$29,$DE,$09,$68,$00,$17,$D5,$F9,$DA,$85
	dc.b	$A4,$FF,$35,$FD,$12,$E6,$5E,$3D,$FF,$36,$D4,$D7,$44,$0D,$CA,$8B
	dc.b	$4E,$55,$3E,$49,$44,$92,$37,$B4,$B9,$4E,$D9,$69,$94,$FF,$43,$FA
	dc.b	$D2,$FD,$E7,$EB,$71,$E5,$B7,$35,$37,$DA,$6E,$81,$3F,$42,$DC,$1C
	dc.b	$0D,$1A,$28,$49,$84,$CF,$D0,$20,$38,$A3,$23,$5C,$D2,$54,$3E,$3C
	dc.b	$4F,$9A,$39,$51,$93,$A9,$72,$95,$2E,$74,$95,$4B,$92,$4E,$A3,$96
	dc.b	$2D,$AD,$A5,$6C,$FF,$78,$E3,$C9,$A1,$55,$B7,$6A,$C9,$4B,$BC,$24
	dc.b	$FE,$90,$3E,$8C,$9D,$11,$4A,$17,$24,$D3,$A8,$01,$6D,$CD,$FD,$4A
	dc.b	$9A,$4F,$F3,$5F,$D1,$2E,$65,$EF,$FB,$B3,$D7,$44,$13,$5A,$24,$E8
	dc.b	$98,$E3,$34,$AE,$32,$D3,$29,$5B,$62,$FD,$69,$7E,$B3,$F7,$B8,$F2
	dc.b	$DB,$9A,$9B,$ED,$37,$40,$9F,$A1,$6E,$0E,$06,$8D,$14,$24,$C2,$67
	dc.b	$E8,$10,$1C,$51,$91,$AE,$69,$2A,$1F,$1E,$27,$CD,$1C,$A8,$C9,$D4
	dc.b	$B9,$4A,$97,$3A,$4A,$A5,$C9,$27,$51,$CB,$16,$D6,$D2,$B6,$7F,$BC
	dc.b	$71,$E4,$D0,$AA,$DB,$B5,$64,$A5,$DE,$12,$7F,$48,$1F,$46,$4E,$88
	dc.b	$A5,$0B,$92,$69,$D4,$00,$B6,$E6,$FE,$A5,$4D,$27,$F9,$AF,$E8,$97
	dc.b	$32,$F7,$FD,$D9,$EB,$A2,$09,$AD,$12,$74,$4C,$70,$DF,$9D,$34,$AF
	dc.b	$E7,$4B,$26,$D0,$F2,$3F,$55,$FC,$EB,$7E,$B0,$00,$00,$04,$9B,$CD
	dc.b	$36,$7C,$D4,$16,$F8,$75,$72,$D0,$B4,$65,$72,$D1,$51,$94,$94,$B8
	dc.b	$D8,$D4,$FF,$42,$56,$25,$25,$2A,$1E,$9A,$B7,$EA,$49,$49,$3B,$50
	dc.b	$BD,$CF,$5E,$D8,$42,$4F,$CF,$35,$AB,$6A,$35,$9A,$DA,$1F,$F7,$00
	dc.b	$00,$32,$07,$67,$93,$B3,$87,$68,$C1,$49,$59,$17,$45,$25,$38,$22
	dc.b	$E9,$9A,$E9,$85,$D6,$6B,$A9,$2C,$B5,$65,$28,$6A,$A7,$E2,$5B,$7B
	dc.b	$42,$25,$EE,$5B,$1A,$37,$6D,$78,$DE,$3F,$94,$6F,$D4,$7E,$B4,$FF
	dc.b	$59,$FA,$D1,$BC,$B7,$25,$67,$5C,$39,$2E,$10,$D6,$48,$4B,$06,$43
	dc.b	$8A,$1A,$0C,$D0,$20,$42,$8A,$49,$0E,$EC,$8D,$46,$4F,$D4,$9F,$4F
	dc.b	$D5,$D0,$AB,$B3,$CF,$63,$43,$AF,$7A,$E5,$C1,$FB,$64,$55,$46,$C9
	dc.b	$B8,$96,$55,$6C,$8B,$29,$FE,$76,$6E,$3C,$9A,$15,$5B,$70,$A5,$7E
	dc.b	$8D,$07,$F4,$81,$41,$20,$C9,$03,$53,$BC,$12,$D0,$03,$3A,$A9,$DE
	dc.b	$16,$A5,$4B,$F7,$85,$CF,$96,$BF,$D1,$42,$FD,$49,$6E,$BF,$C9,$5C
	dc.b	$E9,$B7,$82,$A1,$F8,$B2,$DC,$90,$EC,$4F,$AC,$6B,$EA,$56,$3B,$6A
	dc.b	$76,$6A,$9D,$A7,$EA,$07,$96,$DC,$D4,$DF,$69,$BA,$04,$35,$6D,$E6
	dc.b	$9B,$1C,$09,$19,$43,$70,$10,$1A,$C1,$91,$94,$D3,$3F,$4F,$13,$E7
	dc.b	$4C,$B5,$97,$3A,$6D,$3A,$77,$9A,$57,$94,$F2,$B7,$2C,$F5,$9E,$5B
	dc.b	$63,$21,$93,$8F,$26,$85,$56,$DD,$AB,$25,$2A,$DE,$12,$D6,$1C,$40
	dc.b	$E0,$A8,$69,$D2,$77,$D1,$2D,$A8,$19,$D5,$0E,$F0,$B5,$2B,$7F,$DE
	dc.b	$17,$25,$A7,$F0,$79,$9F,$82,$FC,$D9,$F2,$FD,$48,$12,$E5,$E1,$30
	dc.b	$93,$FC,$F6,$36,$FC,$EC,$D7,$F3,$B2,$CA,$C0,$FF,$66,$7B,$CD,$F6
	dc.b	$9B,$F0,$B9,$AC,$F7,$9B,$ED,$27,$53,$56,$59,$29,$F0,$10,$32,$B2
	dc.b	$49,$49,$33,$FE,$11,$51,$BC,$73,$2A,$1D,$36,$4C,$F9,$CA,$8B,$A7
	dc.b	$12,$D5,$6A,$91,$3C,$94,$D3,$52,$C9,$4A,$D5,$3C,$97,$D6,$59,$5B
	dc.b	$0F,$9A,$F9,$24,$C3,$AB,$2C,$9C,$B6,$E8,$DA,$94,$38,$81,$41,$60
	dc.b	$86,$90,$C5,$F4,$40,$01,$41,$0E,$F0,$B6,$A5,$7F,$DE,$7E,$86,$9B
	dc.b	$71,$CD,$A8,$FD,$EA,$5F,$A9,$9F,$82,$E5,$DE,$B3,$F6,$2C,$A2,$54
	dc.b	$3F,$CE,$96,$BC,$15,$4F,$26,$E5,$A1,$65,$2D,$33,$C8,$B2,$C6,$43
	dc.b	$CB,$6E,$6A,$6F,$B4,$DD,$02,$1A,$B6,$F3,$4D,$8E,$04,$8C,$A1,$B8
	dc.b	$08,$0D,$60,$C8,$CA,$69,$9F,$A5,$3F,$3C,$DE,$B0,$95,$A5,$A9,$58
	dc.b	$ED,$F9,$EE,$47,$EA,$48,$38,$2B,$4D,$31,$95,$E7,$96,$7F,$AD,$71
	dc.b	$E4,$D0,$AA,$DB,$B5,$64,$A5,$5B,$C2,$5A,$C3,$88,$1C,$15,$0D,$3A
	dc.b	$4E,$FA,$25,$B5,$03,$3A,$A1,$DE,$16,$A5,$6F,$FB,$C2,$E4,$B6,$CB
	dc.b	$F6,$3C,$CB,$99,$EE,$8D,$7A,$4F,$57,$2D,$16,$86,$F4,$2C,$B5,$6A
	dc.b	$12,$61,$0B,$29,$27,$E7,$4B,$26,$C8,$F2,$C6,$53,$FC,$E8,$2F,$E1
	dc.b	$96,$F8,$DD,$4D,$6A,$C8,$A4,$B4,$92,$1A,$C9,$E6,$E8,$A7,$02,$45
	dc.b	$35,$34,$CF,$D0,$20,$35,$81,$F0,$CA,$49,$9F,$EC,$A9,$CB,$49,$73
	dc.b	$A1,$5C,$F2,$3A,$72,$3C,$8F,$C1,$3B,$64,$48,$57,$2C,$8D,$09,$35
	dc.b	$96,$53,$C8,$64,$5F,$AD,$97,$EF,$5C,$79,$24,$3A,$B3,$AA,$1D,$64
	dc.b	$A5,$5B,$C2,$5A,$C3,$88,$1C,$15,$0D,$3A,$4E,$FA,$25,$B5,$03,$3A
	dc.b	$A1,$DE,$16,$A5,$6F,$FB,$C2,$E4,$B6,$CB,$F6,$3C,$CB,$F3,$70,$DD
	dc.b	$0F,$F2,$85,$AC,$DF,$A9,$6B,$43,$7C,$FB,$C6,$7F,$94,$AE,$76,$2B
	dc.b	$62,$C0,$02,$F2,$DB,$9A,$9B,$ED,$37,$40,$86,$AD,$C6,$D0,$34,$68
	dc.b	$A1,$26,$13,$3F,$40,$80,$E2,$8C,$8D,$73,$4C,$F8,$FD,$C9,$74,$FD
	dc.b	$5D,$0A,$BB,$3C,$F6,$34,$3A,$F7,$A9,$70,$7E,$D2,$40,$00,$71,$E4
	dc.b	$D0,$AA,$DB,$B5,$64,$A5,$DE,$6F,$C4,$0E,$1A,$40,$D3,$A2,$12,$94
	dc.b	$2F,$C4,$3A,$80,$14,$A1,$72,$B1,$50,$BF,$78,$5C,$F9,$6B,$FD,$1E
	dc.b	$65,$FA,$92,$DE,$BF,$C9,$5C,$E9,$B7,$82,$A1,$F8,$B2,$DE,$56,$57
	dc.b	$D6,$3C,$5A,$5A,$D7,$A9,$2E,$4D,$AE,$76,$2B,$62,$C5,$96,$3C,$B6
	dc.b	$E6,$A6,$FB,$4D,$D0,$21,$AB,$71,$B4,$0D,$1A,$28,$49,$84,$CF,$D0
	dc.b	$20,$38,$A3,$23,$5C,$D3,$3F,$4F,$D4,$CB,$F3,$74,$C5,$79,$4D,$FF
	dc.b	$3D,$CA,$7B,$4A,$DA,$F7,$E4,$D6,$2D,$63,$79,$58,$91,$E7,$EA,$99
	dc.b	$D9,$C7,$93,$42,$AB,$6E,$D5,$92,$97,$79,$BF,$10,$38,$69,$03,$4E
	dc.b	$86,$AD,$E9,$2B,$C0,$A1,$D4,$05,$95,$8A,$85,$EA,$FC,$CB,$9F,$2D
	dc.b	$7F,$A3,$CC,$BF,$52,$5F,$9B,$3F,$EC,$E3,$6A,$15,$0A,$98,$A1,$26
	dc.b	$D4,$2F,$42,$F0,$01,$E5,$9E,$42,$5E,$5B,$73,$53,$7D,$A6,$E8,$10
	dc.b	$D5,$B8,$DA,$06,$8D,$14,$24,$C2,$67,$E8,$10,$1C,$51,$91,$AE,$5D
	dc.b	$0B,$C1,$D7,$6A,$7E,$6F,$C1,$6C,$E7,$42,$AF,$7A,$CF,$D8,$D2,$33
	dc.b	$B4,$75,$95,$8A,$BD,$65,$66,$BC,$AC,$48,$F3,$F5,$4C,$EC,$E3,$C9
	dc.b	$A1,$55,$B7,$6A,$C9,$4B,$BC,$DF,$88,$1C,$34,$81,$A7,$43,$56,$F4
	dc.b	$95,$E0,$50,$EA,$02,$CA,$C5,$42,$F5,$7E,$65,$CF,$96,$BF,$D1,$42
	dc.b	$FD,$49,$23,$AF,$F2,$45,$36,$F0,$54,$3F,$07,$42,$49,$7A,$01,$3C
	dc.b	$B3,$C8,$4B,$CB,$6F,$37,$18,$70,$00,$19,$B8,$0E,$37,$1E,$47,$91
	dc.b	$B8,$76,$8E,$91,$9B,$93,$9B,$9B,$93,$CE,$3A,$44,$00,$0D,$C6,$1E
	dc.b	$7B,$B7,$90,$0F,$7C,$3A,$BB,$6F,$34,$37,$25,$65,$E9,$15,$2B,$14
	dc.b	$5A,$04,$B1,$D8,$E0,$6A,$D0,$06,$B4,$C5,$89,$49,$61,$2A,$A9,$2C
	dc.b	$4E,$C5,$5A,$6C,$DF,$AC,$F6,$C7,$A8,$37,$9B,$92,$BC,$DF,$38,$EA
	dc.b	$AF,$27,$2D,$4D,$CD,$C9,$C9,$1A,$3A,$44,$12,$80,$E0,$BB,$1D,$DC
	dc.b	$D6,$25,$7B,$35,$7B,$DA,$5F,$AC,$00,$FF,$59,$2B,$77,$AB,$5A,$E5
	dc.b	$15,$37,$B9,$F6,$04,$E0,$28,$CD,$09,$64,$EC,$B3,$75,$04,$F3,$75
	dc.b	$27,$9B,$83,$F5,$C7,$B7,$EB,$1B,$6A,$54,$AC,$71,$27,$5A,$C9,$C9
	dc.b	$D4,$AC,$6E,$4E,$54,$53,$8A,$62,$0C,$A7,$03,$DA,$2A,$50,$68,$95
	dc.b	$89,$63,$D1,$59,$49,$CD,$27,$BB,$3A,$BE,$37,$00,$00,$04,$9E,$69
	dc.b	$CE,$B3,$4A,$4E,$27,$46,$8A,$D4,$B5,$38,$AD,$CB,$F2,$87,$1B,$95
	dc.b	$D6,$55,$EF,$D7,$49,$43,$92,$DB,$15,$E7,$34,$00,$00,$00,$01,$02
	dc.b	$1F,$EC,$F6,$DF,$FA,$E5,$02,$F4,$92,$32,$04,$C4,$33,$AD,$CD,$1A
	dc.b	$F5,$64,$6E,$4B,$03,$72,$C9,$6A,$B0,$25,$C9,$49,$6A,$B0,$BA,$9D
	dc.b	$16,$AB,$3A,$57,$C7,$E8,$4B,$8A,$17,$EA,$52,$49,$84,$34,$64,$34
	dc.b	$00,$00,$09,$F3,$D1,$F3,$D1,$CB,$DA,$5A,$3F,$7A,$95,$FA,$B5,$CD
	dc.b	$68,$5A,$6A,$55,$2E,$B5,$86,$2B,$CE,$DE,$C7,$97,$39,$58,$97,$19
	dc.b	$74,$25,$E7,$35,$E7,$2E,$D4,$49,$50,$AB,$4E,$0E,$8A,$C8,$74,$DA
	dc.b	$91,$D4,$94,$BC,$47,$F2,$96,$3E,$35,$6B,$20,$00,$00,$00,$00,$64
	dc.b	$32,$19,$01,$93,$7E,$77,$34,$CD,$32,$2C,$A5,$91,$64,$27,$96,$32
	dc.b	$03,$30,$80,$30,$80,$03,$02,$13,$03,$24,$08,$34,$0C,$45,$1A,$57
	dc.b	$7A,$66,$3C,$76,$3A,$81,$02,$00,$14,$0B,$26,$3B,$83,$04,$0A,$15
	dc.b	$1C,$86,$07,$7B,$87,$04,$09,$15,$1B,$28,$F8,$FF,$FC,$AF,$F5,$85
	dc.b	$FA,$35,$CD,$52,$34,$41,$02,$B7,$CC,$22,$BA,$8E,$6A,$B5,$FC,$35
	dc.b	$C5,$56,$A9,$F0,$62,$32,$E3,$82,$B4,$40,$86,$52,$19,$82,$10,$B8
	dc.b	$BB,$43,$A6,$6A,$BA,$A6,$78,$56,$7F,$CF,$F0,$5F,$A3,$82,$2D,$88
	dc.b	$81,$DC,$5B,$A4,$2B,$7C,$83,$04,$22,$0C,$15,$21,$0C,$D1,$1F,$B3
	dc.b	$E9,$08,$CA,$57,$AA,$75,$AE,$6A,$A3,$8F,$88,$D7,$10,$AA,$29,$9E
	dc.b	$0A,$A0,$56,$AA,$2D,$0A,$9F,$EC,$78,$CE,$BC,$EF,$06,$2A,$76,$EE
	dc.b	$95,$47,$6F,$90,$2A,$EA,$0F,$0C,$A5,$FA,$36,$2A,$8A,$67,$A1,$F3
	dc.b	$3B,$55,$97,$CD,$15,$94,$CF,$C1,$3A,$55,$F8,$21,$56,$A9,$1E,$AE
	dc.b	$97,$1F,$15,$3A,$8A,$7C,$C1,$7E,$8D,$73,$54,$8D,$10,$40,$AD,$F3
	dc.b	$08,$AE,$A3,$9A,$AD,$7F,$0D,$71,$55,$AA,$7C,$18,$8C,$B8,$E0,$AD
	dc.b	$10,$21,$94,$86,$60,$84,$2E,$2E,$D0,$E9,$9A,$AE,$A9,$9E,$15,$9F
	dc.b	$F3,$FC,$17,$E8,$E0,$8B,$62,$20,$77,$16,$E9,$0A,$DF,$20,$C1,$08
	dc.b	$83,$05,$48,$43,$34,$47,$EC,$FA,$42,$32,$95,$EA,$9D,$6B,$9A,$A8
	dc.b	$E3,$E2,$35,$C4,$2A,$8A,$67,$82,$A8,$15,$AA,$8B,$42,$A7,$FB,$1E
	dc.b	$33,$AF,$3B,$C1,$8A,$9D,$BB,$A5,$51,$DB,$E4,$0A,$BA,$83,$C3,$29
	dc.b	$7E,$8D,$8A,$A2,$99,$E8,$7C,$CE,$D5,$65,$F3,$45,$65,$33,$F0,$4E
	dc.b	$95,$7E,$08,$55,$AA,$47,$AB,$A5,$C7,$C5,$4E,$A2,$9F,$30,$5F,$A3
	dc.b	$5C,$D5,$23,$44,$10,$2B,$7C,$C2,$2B,$A8,$E6,$AB,$5F,$C3,$5C,$55
	dc.b	$6A,$9F,$06,$23,$2E,$38,$2B,$44,$08,$65,$21,$98,$21,$0B,$8B,$B4
	dc.b	$3A,$66,$AB,$AA,$67,$85,$67,$FC,$FF,$05,$FA,$38,$22,$D8,$88,$1D
	dc.b	$C5,$BA,$42,$B7,$C8,$30,$42,$20,$C1,$52,$10,$CD,$11,$FB,$3E,$90
	dc.b	$8C,$A5,$7A,$A7,$5A,$E6,$AA,$38,$F8,$8D,$71,$0A,$A2,$99,$E0,$AA
	dc.b	$05,$6A,$A2,$D0,$A9,$7B,$FD,$BD,$FE,$09,$1D,$79,$DE,$0C,$52,$ED
	dc.b	$DC,$A9,$8E,$DE,$E0,$53,$D4,$1E,$19,$2B,$E1,$8A,$62,$59,$E8,$7B
	dc.b	$CE,$D4,$E5,$EF,$44,$E4,$B3,$DB,$95,$3E,$C5,$3A,$94,$7A,$B9,$5B
	dc.b	$7B,$52,$E6,$25,$EF,$05,$F0,$B7,$A9,$46,$88,$20,$56,$F7,$84,$4F
	dc.b	$51,$BD,$4E,$BF,$8E,$B6,$A6,$D4,$BD,$8C,$46,$5C,$6C,$56,$88,$10
	dc.b	$C9,$43,$30,$42,$16,$D7,$68,$72,$CD,$4F,$52,$CF,$09,$CF,$FB,$FB
	dc.b	$F8,$82,$2D,$88,$81,$DC,$5B,$94,$2B,$7B,$83,$04,$22,$0C,$14,$A1
	dc.b	$0C,$D1,$1F,$B7,$E9,$08,$C9,$57,$A9,$73,$AD,$EA,$63,$6F,$68,$D6
	dc.b	$D0,$A6,$25,$9E,$0A,$60,$56,$A6,$2D,$0A,$5F,$EC,$76,$CE,$BC,$EF
	dc.b	$06,$29,$76,$EE,$54,$C7,$6F,$70,$29,$EA,$0F,$0C,$95,$F0,$C5,$31
	dc.b	$2C,$F4,$3D,$E7,$6A,$72,$F7,$A2,$72,$59,$ED,$CA,$9F,$62,$9D,$4A
	dc.b	$3D,$5C,$AD,$BD,$A9,$73,$12,$F7,$82,$F8,$5B,$D4,$A3,$44,$10,$2B
	dc.b	$7B,$C2,$27,$A8,$DE,$A7,$5F,$C7,$5B,$53,$6A,$5E,$C6,$23,$2E,$36
	dc.b	$2B,$44,$08,$64,$A1,$98,$21,$0B,$6B,$B4,$39,$66,$A7,$A9,$67,$84
	dc.b	$E7,$FD,$FD,$FC,$41,$16,$C4,$40,$EE,$2D,$CA,$15,$BD,$C1,$82,$11
	dc.b	$06,$0A,$50,$86,$68,$8F,$DB,$F4,$84,$64,$AB,$D4,$B9,$D6,$F5,$31
	dc.b	$B7,$B4,$6B,$68,$53,$12,$CF,$05,$30,$2B,$53,$16,$85,$2F,$F6,$3B
	dc.b	$67,$5E,$77,$83,$14,$BB,$77,$2A,$63,$B7,$B8,$14,$F5,$07,$86,$4A
	dc.b	$F8,$62,$98,$96,$7A,$1E,$F3,$B5,$39,$7B,$D1,$39,$2C,$F6,$E5,$4F
	dc.b	$B1,$4E,$A5,$1E,$AE,$56,$DE,$D4,$B9,$89,$7B,$C1,$7C,$2D,$EA,$51
	dc.b	$A2,$08,$15,$BD,$E1,$13,$D4,$6F,$53,$AF,$E3,$AD,$A9,$B5,$2F,$63
	dc.b	$11,$97,$1B,$15,$A2,$04,$32,$50,$CC,$10,$85,$B5,$DA,$1C,$B3,$53
	dc.b	$D4,$B3,$C2,$73,$E0,$00,$08,$01,$00,$00,$00,$24,$0A,$90,$02,$90
	dc.b	$02,$90,$02,$90,$02,$90,$02,$90,$02,$90,$02,$90,$02,$90,$02,$90
	dc.b	$02,$90,$02,$90,$02,$00,$00,$2A,$40,$32,$39,$00,$C0,$C0,$D0,$E0
	dc.b	$83,$40,$E4,$04,$03,$43,$04,$80,$0D,$03,$80,$16,$90,$0E,$00,$0C
	dc.b	$2A,$41,$A2,$39,$06,$83,$A2,$40,$D1,$03,$88,$6C,$3A,$2A,$00,$70
	dc.b	$0E,$52,$0D,$70,$0D,$52,$00,$52,$00,$40,$0E,$8A,$80,$1C,$80,$01
	dc.b	$D1,$20,$68,$81,$C4,$02,$1D,$15,$00,$38,$00,$A9,$00,$38,$80,$00
	dc.b	$60,$CA,$23,$01,$00,$02,$1D,$22,$4C,$02,$48,$1C,$40,$44,$59,$64
	dc.b	$6E,$24,$70,$D0,$0D,$81,$C8,$08,$06,$06,$83,$D8,$24,$50,$06,$83
	dc.b	$43,$20,$52,$6B,$7C,$89,$C0,$02,$6B,$60,$72,$0D,$87,$44,$80,$F1
	dc.b	$14,$94,$D1,$E4,$31,$0E,$13,$5B,$E4,$51,$01,$93,$5B,$03,$88,$04
	dc.b	$3A,$2A,$1C,$88,$80,$22,$6B,$7C,$8A,$81,$A2,$6B,$7C,$89,$C0,$40
	dc.b	$E8,$A8,$01,$C4,$0A,$4D,$6F,$91,$38,$00,$4D,$6F,$89,$44,$36,$1D
	dc.b	$23,$1C,$03,$18,$1C,$43,$84,$D6,$F9,$14,$40,$64,$D6,$F9,$95,$00
	dc.b	$20,$60,$68,$70,$41,$A0,$71,$01,$13,$5B,$E4,$54,$0D,$13,$5B,$E6
	dc.b	$4E,$02,$07,$44,$81,$A3,$C8,$C2,$05,$26,$B7,$C8,$9C,$00,$26,$B7
	dc.b	$CC,$A2,$1B,$31,$18,$C3,$E8,$65,$31,$99,$83,$84,$D6,$F9,$14,$40
	dc.b	$64,$D6,$F9,$15,$00,$20,$60,$A0,$1D,$40,$E8,$75,$06,$9A,$C0,$44
	dc.b	$D6,$F9,$15,$03,$44,$D6,$F9,$13,$80,$81,$D0,$A0,$1E,$40,$E8,$79
	dc.b	$12,$18,$40,$A4,$D6,$F9,$13,$80,$04,$D6,$F9,$14,$43,$66,$21,$3A
	dc.b	$1F,$8C,$66,$60,$E1,$35,$BE,$05,$17,$DF,$7D,$60,$67,$A0,$A1,$20
	dc.b	$80,$7D,$10,$67,$A1,$61,$21,$40,$7D,$1A,$28,$49,$E8,$58,$48,$5E
	dc.b	$08,$67,$D1,$A2,$84,$9E,$85,$84,$85,$E0,$86,$7D,$1A,$28,$49,$E8
	dc.b	$58,$48,$5E,$08,$67,$D1,$A2,$84,$90,$85,$0E,$02,$14,$3E,$38,$B4
	dc.b	$33,$E8,$D1,$42,$48,$42,$85,$C9,$14,$85,$45,$85,$C7,$16,$86,$7D
	dc.b	$10,$67,$A5,$A1,$25,$80,$7D,$F6,$A0,$06,$82,$A4,$98,$A4,$98,$A4
	dc.b	$98,$E2,$98,$0E,$52,$0D,$52,$0D,$52,$0D,$51,$0D,$01,$C1,$35,$49
	dc.b	$31,$49,$31,$49,$31,$45,$31,$C0,$35,$48,$01,$48,$01,$48,$01,$48
	dc.b	$01,$48,$01,$48,$01,$48,$01,$48,$01,$48,$01,$48,$01,$48,$01,$48
	dc.b	$01,$48,$01,$00,$01,$FC,$07,$00,$00,$00,$00,$03,$0A,$90,$0A,$40
	dc.b	$29,$00,$80,$00,$0E,$00,$A9,$00,$A4,$02,$90,$0A,$20,$10,$A4,$02
	dc.b	$90,$0A,$40,$29,$00,$80,$00,$2A,$41,$02,$A4,$1F,$98,$70,$61,$82
	dc.b	$05,$48,$55,$11,$54,$42,$20,$15,$21,$BC,$86,$85,$0D,$48,$24,$00
	dc.b	$81,$52,$20,$15,$22,$7C,$C9,$83,$24,$40,$2A,$45,$A8,$96,$A2,$41
	dc.b	$00,$A9,$19,$E4,$64,$89,$2A,$44,$38,$10,$A4,$02,$90,$00,$A9,$1C
	dc.b	$E6,$70,$18,$20,$01,$52,$3F,$44,$FD,$10,$08,$05,$49,$17,$24,$40
	dc.b	$41,$52,$01,$C0,$03,$BC,$03,$52,$09,$48,$25,$20,$94,$42,$3E,$DF
	dc.b	$12,$44,$02,$A4,$96,$8A,$5A,$24,$1F,$6F,$88,$20,$01,$52,$51,$45
	dc.b	$45,$10,$0F,$B7,$C4,$30,$40,$A9,$2B,$A2,$AE,$88,$47,$DB,$E2,$48
	dc.b	$85,$24,$B4,$92,$D1,$4B,$44,$83,$ED,$F1,$04,$02,$92,$8A,$4A,$28
	dc.b	$A8,$A2,$01,$F6,$F8,$86,$08,$15,$25,$D4,$57,$51,$08,$FB,$7C,$49
	dc.b	$10,$0A,$93,$1A,$2C,$68,$90,$7D,$BE,$20,$80,$05,$49,$A5,$16,$94
	dc.b	$40,$3E,$DF,$10,$C1,$02,$A4,$DE,$8B,$7A,$21,$1F,$6F,$89,$22,$01
	dc.b	$52,$75,$45,$D5,$12,$0F,$B7,$C4,$10,$00,$A9,$3D,$A2,$F6,$88,$07
	dc.b	$60,$04,$01,$B0,$29,$04,$A4,$12,$90,$4A,$21,$38,$40,$6C,$0E,$24
	dc.b	$20,$36,$05,$22,$14,$88,$52,$21,$44,$87,$08,$0D,$81,$C4,$04,$06
	dc.b	$C0,$A4,$02,$90,$0A,$40,$28,$80,$E1,$01,$B0,$38,$84,$80,$DF,$08
	dc.b	$34,$82,$52,$09,$48,$25,$10,$9C,$20,$37,$CA,$11,$08,$0D,$F0,$87
	dc.b	$48,$85,$22,$14,$88,$51,$21,$C2,$03,$7C,$A2,$00,$80,$DF,$08,$B4
	dc.b	$80,$52,$01,$48,$05,$10,$1C,$20,$37,$CA,$30,$48,$0D,$F0,$83,$48
	dc.b	$25,$20,$94,$82,$51,$09,$C2,$03,$7C,$A1,$10,$80,$DF,$08,$74,$88
	dc.b	$52,$21,$48,$85,$12,$1C,$20,$37,$CA,$20,$08,$0D,$F0,$8B,$48,$05
	dc.b	$20,$14,$80,$51,$01,$C2,$03,$7C,$A3,$04,$80,$DF,$08,$34,$82,$52
	dc.b	$09,$48,$25,$10,$9C,$20,$37,$C2,$13,$EF,$BE,$FB,$FF,$C0,$00,$04
	dc.b	$80,$04,$07,$15,$19,$81,$04,$0B,$15,$1E,$82,$03,$02,$17,$7C,$25
	dc.b	$1D,$83,$04,$06,$15,$1C,$84,$04,$0A,$15,$1A,$85,$05,$1B,$86,$02
	dc.b	$00,$14,$08,$27,$7D,$8A,$05,$18,$8B,$04,$09,$FF,$FD,$87,$ED,$B3
	dc.b	$1C,$F8,$E2,$65,$FA,$43,$F6,$52,$A9,$E1,$94,$E1,$66,$1A,$70,$B2
	dc.b	$7E,$8F,$4E,$7C,$6D,$43,$75,$AA,$3F,$65,$C1,$E1,$BE,$30,$E5,$76
	dc.b	$70,$57,$6E,$70,$7F,$0A,$E5,$FE,$EF,$BF,$B0,$FE,$37,$F8,$1A,$3F
	dc.b	$81,$5C,$FB,$9D,$E9,$84,$3D,$6F,$4C,$87,$FD,$2E,$90,$FF,$B4,$E6
	dc.b	$E2,$BF,$46,$23,$C5,$58,$8F,$C4,$D8,$D6,$23,$C2,$FC,$40,$BE,$E3
	dc.b	$D3,$1F,$CA,$91,$E7,$F5,$53,$0F,$FB,$D8,$CF,$F1,$BF,$40
	if REGION=JAPAN
	dc.b	$00,$D3,$81,$05,$1C,$14,$0C,$25,$1A,$35,$1D,$44,$0B,$54,$08,$64
	dc.b	$0A,$72,$01,$84,$04,$09,$12,$00,$25,$1B,$35,$1E,$47,$7C,$58,$FA
	dc.b	$FF,$57,$5F,$15,$55,$FF,$24,$10,$41,$03,$D2,$08,$20,$83,$27,$5F
	dc.b	$34,$3B,$E9,$C9,$E9,$C9,$BD,$E6,$F5,$B5,$55,$5A,$97,$E2,$AA,$F3
	dc.b	$FE,$92,$BC,$28,$82,$08,$20,$81,$55,$55,$5E,$98,$6B,$CA,$AE,$7F
	dc.b	$D2,$79,$BE,$96,$59,$02,$F4,$A9,$A9,$D1,$93,$DF,$41,$A3,$82,$CD
	dc.b	$4D,$4D,$6D,$E4,$A2,$AB,$DF,$8B,$64,$10,$41,$07,$3F,$C8,$BD,$20
	dc.b	$82,$08,$2B,$CA,$AA,$FD,$2C,$10,$41,$04,$14,$50,$B6,$41,$65,$9D
	dc.b	$DF,$45,$B9,$A9,$A9,$A9,$55,$9A,$9A,$9A,$9A,$2B,$E2,$F4,$C3,$5F
	dc.b	$2C,$82,$0A,$2A,$5E,$1A,$F7,$48,$2C,$82,$CC,$F8,$AD,$94,$41,$64
	dc.b	$10,$2B,$45,$14,$41,$42,$F3,$FE,$93,$CD,$F4,$C3,$87,$77,$86,$1A
	dc.b	$16,$5E,$15,$FE,$45,$EE,$D2,$88,$FF,$A1,$04,$17,$B5,$C2,$8B,$23
	dc.b	$7C,$39,$EC,$F9,$02,$AF,$0E,$1D,$38,$68,$C3,$0C,$1A,$2C,$B2,$08
	dc.b	$15,$CF,$51,$44,$10,$77,$7D,$28,$83,$0C,$38,$77,$DD,$DC,$0A,$9D
	dc.b	$F5,$EE,$05,$5C,$20,$C3,$0E,$1D,$F7,$77,$12,$B4,$41,$5B,$5A,$9B
	dc.b	$1C,$20,$BD,$C1,$64,$4A,$BD,$2C,$82,$C8,$39,$3A,$35,$3C,$3B,$2F
	dc.b	$0D,$1C,$39,$EE,$1A,$38,$59,$04,$4A,$AA,$B1,$2A,$41,$03,$04,$6E
	dc.b	$C5,$59,$48,$20,$E1,$86,$A7,$06,$0A,$20,$83,$86,$BD,$CF,$90,$59
	dc.b	$04,$1C,$9B,$DD,$95,$2E,$4B,$A2,$08,$20,$B2,$CB,$95,$7A,$51,$04
	dc.b	$10,$41,$53,$66,$8C,$34,$2D,$1A,$F6,$85,$74,$50,$AA,$BA,$DE,$7A
	dc.b	$CB,$15,$59,$4C,$9D,$10,$41,$62,$BD,$9E,$7C,$E6,$F8,$58,$AE,$FA
	dc.b	$59,$04,$15,$BA,$15,$56,$27,$9F,$4B,$05,$90,$56,$E8,$55,$58,$9E
	dc.b	$7D,$2F,$48,$35,$38,$6A,$70,$E4,$F2,$75,$BB,$2A,$57,$53,$53,$53
	dc.b	$45,$7D,$2A,$BD,$2B,$CD,$96,$39,$B8,$20,$E6,$F9,$F3,$A4,$18,$67
	dc.b	$C5,$E4,$BC,$2B,$E9,$6F,$77,$B5,$BD,$F4,$82,$B6,$FA,$CA,$3B,$E8
	dc.b	$DD,$9C,$9C,$DA,$AF,$C5,$73,$E9,$5F,$F2,$2B,$CF,$FA,$40,$AB,$53
	dc.b	$53,$53,$02,$41,$04,$4D,$4D,$4B,$92,$BA,$9A,$9A,$9C,$FA,$A9,$A9
	dc.b	$A9,$66,$A6,$A6,$BF,$C9,$C9,$E9,$C9,$E9,$C9,$E8,$C1,$04,$10,$46
	dc.b	$EF,$76,$2A,$AF,$0A,$DA,$A4,$10,$41,$04,$0C,$10,$41,$04,$10,$40
	dc.b	$AA,$B3,$D9,$E1,$A3,$05,$57,$44,$10,$2D,$6E,$85,$EE,$E8,$82,$A7
	dc.b	$A6,$4F,$46,$88,$DD,$8C,$F4,$A2,$C8,$DF,$0E,$7B,$3E,$41,$46,$8C
	dc.b	$9E,$8E,$1C,$3A,$70,$D1,$86,$18,$2A,$AC,$6D,$82,$C8,$2C,$EE,$F5
	dc.b	$BB,$95,$B2,$C8,$2C,$83,$BF,$4B,$A2,$88,$23,$79,$F5,$C3,$A4,$0C
	dc.b	$10,$41,$64,$16,$77,$6A,$41,$04,$10,$41,$DD,$B4,$41,$04,$10,$41
	dc.b	$03,$D2,$85,$55,$82,$05,$54,$7A,$41,$64,$16,$77,$77,$2B,$87,$0D
	dc.b	$0A,$B9,$37,$B7,$44,$16,$41,$65,$8A,$AA,$B7,$3D,$F3,$64,$16,$59
	dc.b	$DD,$F4,$55,$55,$8D,$D0,$B7,$29,$07,$0D,$18,$61,$63,$9B,$E1,$C3
	dc.b	$93,$9E,$E4,$E1,$CD,$E7,$B3,$D0,$41,$42,$AB,$C1,$74,$41,$05,$9D
	dc.b	$DD,$CA,$A4,$10,$41,$C9,$C9,$CD,$F0,$C3,$0D,$4E,$A5,$C2,$88,$35
	dc.b	$F2,$37,$67,$27,$9E,$57,$70,$61,$9B,$CF,$96,$41,$62,$E8,$89,$79
	dc.b	$F2,$37,$D3,$A2,$9C,$9B,$DB,$53,$07,$77,$D3,$26,$3F,$C9,$93,$85
	dc.b	$98,$70,$E8,$E7,$FD,$25,$D1,$52,$B5,$3A,$F9,$D1,$73,$D6,$37,$EA
	dc.b	$28,$82,$CB,$20,$B3,$B3,$04,$15,$2E,$7D,$35,$35,$35,$2A,$90,$44
	dc.b	$D4,$D4,$D1,$5E,$55,$55,$C9,$7A,$41,$64,$16,$59,$72,$B8,$70,$E1
	dc.b	$C3,$93,$84,$1C,$35,$EC,$F4,$10,$2E,$A5,$A9,$A9,$82,$0B,$1E,$4D
	dc.b	$11,$35,$2A,$AB,$9B,$CF,$59,$87,$0E,$9A,$28,$52,$A7,$0D,$4E,$BE
	dc.b	$59,$67,$27,$BE,$59,$E1,$DD,$DC,$BA,$30,$D1,$9F,$2B,$7D,$F7,$4B
	dc.b	$20,$B2,$07,$A5,$10,$76,$78,$76,$78,$6A,$70,$C3,$5E,$6C,$B3,$53
	dc.b	$05,$90,$41,$43,$CD,$F7,$70,$40,$BC,$33,$E2,$F0,$A9,$5D,$19,$3D
	dc.b	$F2,$BE,$B1,$BF,$96,$59,$62,$AA,$DC,$DE,$FA,$3D,$28,$B2,$CB,$15
	dc.b	$73,$70,$41,$86,$6F,$3E,$59,$02,$54,$F4,$C3,$47,$25,$7E,$61,$9B
	dc.b	$79,$36,$2E,$8A,$F2,$B3,$44,$1A,$33,$E6,$6E,$0A,$1D,$4D,$4C,$16
	dc.b	$59,$65,$8F,$66,$B7,$44,$10,$41,$5E,$57,$85,$14,$51,$45,$4C,$16
	dc.b	$41,$06,$4E,$1A,$9C,$2C,$51,$75,$35,$34,$57,$C5,$8F,$68,$82,$0A
	dc.b	$DD,$0E,$1D,$F9,$02,$BA,$DA,$A5,$10,$46,$F3,$E7,$27,$3E,$BB,$B5
	dc.b	$75,$BD,$6F,$86,$4E,$88,$20,$5E,$94,$41,$A9,$E1,$04,$15,$BB,$DF
	dc.b	$7D,$A3,$84,$17,$B8,$1B,$20,$82,$08,$32,$7B,$B5,$68,$7A,$57,$9C
	dc.b	$2B,$CC,$D1,$86,$7C,$D1,$46,$1A,$F6,$79,$52,$88,$20,$D1,$CD,$EB
	dc.b	$CE,$8A,$20,$82,$3F,$E8,$40,$C1,$44,$10,$64,$E8,$82,$05,$70,$89
	dc.b	$5F,$98,$66,$D6,$37,$D2,$0A,$28,$74,$41,$AF,$A8,$17,$36,$B8,$41
	dc.b	$04,$10,$41,$43,$A2,$0E,$FA,$C5,$EF,$C5,$D4,$BC,$94,$C9,$D1,$04
	dc.b	$16,$3D,$9A,$9A,$9A,$2B,$E2,$AD,$94,$68,$A1,$55,$5C,$2A,$6A,$6A
	dc.b	$55,$59,$A9,$AF,$2E,$15,$3A,$32,$7B,$E8,$20,$BD,$AC,$E8,$CF,$9A
	dc.b	$18,$F9,$AD,$F3,$6D,$94,$41,$67,$27,$A7,$27,$BE,$EF,$97,$9B,$E9
	dc.b	$C3,$53,$A3,$27,$44,$10,$38,$51,$1F,$5C,$DC,$10,$5E,$DE,$CD,$4D
	dc.b	$4E,$BE,$61,$A9,$C3,$53,$AF,$8C,$D4,$D4,$D4,$D6,$EE,$72,$55,$E1
	dc.b	$64,$16,$47,$B4,$61,$C3,$43,$DF,$68,$E1,$A3,$27,$0D,$4E,$1C,$DE
	dc.b	$B6,$BA,$34,$70,$D7,$BB,$EE,$96,$77,$7A,$DA,$FB,$BB,$81,$56,$55
	dc.b	$73,$E9,$55,$5F,$F2,$41,$04,$16,$2A,$B9,$F5,$05,$8A,$41,$64,$16
	dc.b	$59,$DD,$AA,$E1,$04,$10,$40,$BA,$20,$82,$08,$35,$38,$6A,$55,$58
	dc.b	$3B,$B6,$CB,$20,$B3,$BB,$B9,$56,$26,$A6,$A6,$A6,$A6,$0B,$1E,$7B
	dc.b	$A4,$4D,$4D,$4A,$AF,$77,$AD,$AA,$AE,$6E,$08,$20,$82,$08,$17,$08
	dc.b	$2C,$82,$CB,$2E,$54,$D4,$E1,$86,$18,$61,$C3,$5E,$B1,$57,$25,$A9
	dc.b	$A2,$C8,$2C,$5C,$94,$82,$0E,$18,$68,$E0,$E8,$E1,$D9,$CF,$74,$E1
	dc.b	$A2,$3E,$73,$D0,$2E,$0F,$4A,$DB,$A2,$BD,$C2,$08,$39,$37,$BB,$2A
	dc.b	$5C,$1C,$20,$82,$0B,$2C,$55,$5B,$9B,$DF,$3E,$74,$55,$EF,$AB,$74
	dc.b	$51,$04,$1A,$32,$7A,$67,$AB,$74,$51,$03,$F2,$CB,$2C,$5F,$FA,$4A
	dc.b	$AB,$A2,$CB,$3B,$B5,$28,$D1,$A9,$D1,$85,$10,$3A,$20,$B3,$BB,$D6
	dc.b	$FA,$2B,$C9,$55,$56,$0A,$20,$A2,$B6,$AA,$D4,$DE,$FA,$59,$05,$9A
	dc.b	$95,$F7,$4E,$6F,$0D,$1C,$3B,$EE,$EE,$C5,$E9,$5B,$5A,$98,$17,$E6
	dc.b	$A7,$85,$96,$44,$D7,$CB,$35,$38,$6A,$70,$C3,$47,$0E,$ED,$5E,$4D
	dc.b	$EE,$CB,$20,$B3,$5B,$57,$9B,$E9,$62,$AE,$4B,$D2,$88,$20,$B3,$BB
	dc.b	$D6,$D5,$E1,$44,$10,$68,$E6,$F5,$E8,$15,$EE,$F0,$D1,$C9,$B1,$E7
	dc.b	$9D,$DE,$FB,$BE,$FB,$47,$0B,$DC,$0F,$0C,$28,$82,$0E,$4E,$6F,$5B
	dc.b	$55,$56,$FF,$C8,$AA,$AF,$C8,$2C,$70,$82,$08,$20,$B2,$C7,$37,$72
	dc.b	$AA,$AF,$48,$2C,$82,$CB,$2C,$6C,$00,$00,$00,$01,$00,$02,$00,$03
	dc.b	$00,$04,$00,$05,$00,$06,$00,$07,$00,$08,$00,$09,$00,$0A,$00,$0B
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$0C,$00,$0D,$00,$0E,$00,$0F,$00,$07,$00,$07,$00,$10,$00,$11
	dc.b	$00,$12,$00,$13,$00,$14,$00,$15,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$16,$00,$17,$00,$16,$00,$17
	dc.b	$00,$08,$00,$18,$00,$19,$00,$1A,$00,$1B,$00,$1C,$00,$1D,$00,$1E
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$1F,$00,$20,$00,$21,$00,$20,$00,$12,$00,$13,$00,$22,$00,$23
	dc.b	$00,$24,$00,$25,$00,$26,$00,$27,$00,$28,$00,$29,$00,$06,$00,$07
	dc.b	$00,$08,$00,$09,$00,$0A,$00,$0B,$00,$16,$00,$17,$00,$16,$00,$17
	dc.b	$00,$08,$00,$18,$00,$19,$00,$1A,$00,$1B,$00,$1C,$00,$1D,$00,$1E
	dc.b	$00,$2A,$00,$2B,$00,$10,$00,$11,$00,$12,$00,$13,$00,$14,$00,$15
	dc.b	$00,$1F,$00,$20,$00,$1F,$00,$20,$00,$12,$00,$13,$00,$22,$00,$23
	dc.b	$00,$24,$00,$25,$00,$26,$00,$27,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$2C,$00,$2D,$00,$2E,$00,$2F
	dc.b	$00,$30,$00,$31,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$32,$00,$33,$00,$34,$00,$35,$00,$36,$00,$37,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$00,$00,$01,$00,$02,$00,$03,$00,$04,$00,$05,$00,$06,$00,$07
	dc.b	$00,$38,$00,$39,$00,$3A,$00,$1A,$00,$1B,$00,$1C,$00,$1D,$00,$1E
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$0C,$00,$0D,$00,$0E,$00,$0F
	dc.b	$00,$07,$00,$07,$00,$10,$00,$11,$00,$3B,$00,$3C,$00,$22,$00,$23
	dc.b	$00,$24,$00,$25,$00,$26,$00,$27,$00,$3D,$00,$3E,$00,$3F,$00,$40
	dc.b	$00,$41,$00,$42,$00,$04,$00,$05,$00,$43,$00,$44,$00,$45,$00,$46
	dc.b	$00,$47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$07,$00,$07
	dc.b	$00,$4D,$00,$4E,$00,$4F,$00,$50,$00,$51,$00,$52,$00,$07,$00,$07
	dc.b	$00,$53,$00,$54,$00,$55,$00,$56,$00,$57,$00,$58,$00,$59,$00,$5A
	dc.b	$00,$24,$00,$25,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$16,$00,$17,$08,$44,$00,$5B
	dc.b	$00,$5C,$00,$5D,$00,$16,$00,$17,$00,$08,$00,$18,$00,$3A,$00,$1A
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$1F,$00,$20,$00,$5E,$00,$5F,$00,$60,$00,$61,$00,$1F,$00,$20
	dc.b	$00,$12,$00,$13,$00,$22,$00,$23,$00,$62,$00,$63,$00,$16,$00,$17
	dc.b	$00,$64,$00,$65,$00,$66,$00,$67,$00,$3D,$00,$3E,$00,$3F,$00,$40
	dc.b	$00,$1B,$00,$4C,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$68,$00,$61,$00,$1F,$00,$20,$00,$69,$00,$6A,$00,$6B,$00,$6C
	dc.b	$00,$4D,$00,$4E,$00,$4F,$00,$50,$00,$24,$00,$25,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$16,$00,$17,$08,$44,$00,$5B
	dc.b	$00,$5C,$00,$5D,$00,$16,$00,$17,$00,$08,$00,$18,$00,$3A,$00,$1A
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$1F,$00,$20,$00,$5E,$00,$5F,$00,$60,$00,$61,$00,$1F,$00,$20
	dc.b	$00,$12,$00,$13,$00,$22,$00,$23,$00,$5C,$00,$6D,$00,$6E,$00,$6F
	dc.b	$00,$2E,$00,$70,$00,$66,$00,$67,$00,$71,$00,$72,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$60,$00,$61,$00,$73,$00,$74,$00,$34,$00,$35,$00,$6B,$00,$6C
	dc.b	$00,$75,$00,$76,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$1B,$00,$1C,$00,$77,$00,$78,$00,$08,$00,$09
	dc.b	$00,$79,$00,$7A,$00,$7B,$00,$7C,$00,$7D,$00,$7E,$00,$16,$00,$17
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$24,$00,$25
	dc.b	$00,$7F,$00,$80,$00,$12,$00,$13,$10,$79,$00,$81,$00,$82,$00,$83
	dc.b	$00,$84,$00,$85,$00,$1F,$00,$20,$00,$2E,$00,$2F,$00,$86,$00,$87
	dc.b	$00,$08,$00,$18,$00,$88,$00,$17,$00,$16,$00,$17,$00,$08,$00,$18
	dc.b	$00,$19,$00,$1A,$00,$1B,$00,$1C,$00,$1D,$00,$1E,$00,$07,$00,$07
	dc.b	$00,$34,$00,$35,$00,$89,$00,$8A,$00,$12,$00,$13,$00,$1F,$00,$20
	dc.b	$00,$1F,$00,$20,$00,$12,$00,$13,$00,$22,$00,$23,$00,$24,$00,$25
	dc.b	$00,$26,$00,$27,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$00,$00,$01,$00,$02,$00,$03
	dc.b	$00,$04,$00,$05,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$0C,$00,$0D,$00,$0E,$00,$0F,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$08,$00,$18,$00,$8B,$00,$8C,$00,$38,$00,$39,$00,$8D,$00,$8E
	dc.b	$00,$6E,$00,$6F,$00,$08,$00,$18,$00,$8F,$00,$07,$00,$7B,$00,$90
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$12,$00,$13,$00,$91,$00,$92
	dc.b	$00,$3B,$00,$3C,$00,$93,$00,$94,$00,$73,$00,$74,$00,$12,$00,$13
	dc.b	$00,$10,$00,$11,$00,$82,$00,$83,$00,$3D,$00,$3E,$00,$3F,$00,$40
	dc.b	$00,$41,$00,$42,$00,$04,$00,$05,$00,$43,$00,$44,$00,$45,$00,$46
	dc.b	$00,$47,$00,$48,$00,$49,$00,$4A,$00,$95,$00,$31,$00,$07,$00,$07
	dc.b	$00,$4D,$00,$4E,$00,$4F,$00,$50,$00,$51,$00,$52,$00,$07,$00,$07
	dc.b	$00,$53,$00,$54,$00,$55,$00,$56,$00,$57,$00,$58,$00,$59,$00,$5A
	dc.b	$00,$36,$00,$96,$00,$07,$00,$07,$00,$07,$00,$07,$00,$16,$00,$17
	dc.b	$00,$06,$00,$97,$00,$98,$00,$99,$00,$66,$00,$67,$00,$1B,$00,$4C
	dc.b	$00,$9A,$00,$9B,$00,$9C,$00,$9D,$00,$38,$00,$39,$00,$3A,$00,$9E
	dc.b	$00,$07,$00,$07,$00,$1F,$00,$20,$00,$10,$00,$11,$00,$9F,$00,$A0
	dc.b	$00,$6B,$00,$6C,$00,$A1,$00,$25,$00,$A2,$00,$A3,$00,$A4,$00,$6C
	dc.b	$00,$3B,$00,$3C,$00,$22,$00,$23,$00,$62,$00,$63,$00,$16,$00,$17
	dc.b	$00,$64,$00,$65,$00,$66,$00,$67,$00,$3D,$00,$3E,$00,$3F,$00,$40
	dc.b	$00,$30,$00,$31,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$68,$00,$61,$00,$1F,$00,$20,$00,$69,$00,$6A,$00,$6B,$00,$6C
	dc.b	$00,$4D,$00,$4E,$00,$4F,$00,$50,$00,$36,$00,$96,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$16,$00,$17
	dc.b	$00,$06,$00,$97,$00,$98,$00,$99,$00,$66,$00,$67,$00,$1B,$00,$4C
	dc.b	$00,$9A,$00,$9B,$00,$9C,$00,$9D,$00,$38,$00,$39,$00,$3A,$00,$1A
	dc.b	$00,$07,$00,$07,$00,$1F,$00,$20,$00,$10,$00,$11,$00,$9F,$00,$A0
	dc.b	$00,$6B,$00,$6C,$00,$A1,$00,$25,$00,$A2,$00,$A3,$00,$A4,$00,$6C
	dc.b	$00,$3B,$00,$3C,$00,$22,$00,$23,$00,$A5,$00,$A6,$08,$0F,$00,$A7
	dc.b	$00,$07,$00,$A8,$00,$A9,$00,$AA,$00,$30,$00,$31,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$AB,$00,$AC,$00,$AD,$00,$AE,$00,$AF,$00,$B0,$00,$B1,$00,$B2
	dc.b	$00,$36,$00,$96,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$16,$00,$17
	dc.b	$00,$06,$00,$97,$00,$98,$00,$99,$00,$66,$00,$67,$00,$1B,$00,$4C
	dc.b	$00,$9A,$00,$9B,$00,$9C,$00,$9D,$00,$38,$00,$39,$00,$3A,$00,$1A
	dc.b	$00,$07,$00,$07,$00,$1F,$00,$20,$00,$10,$00,$11,$00,$9F,$00,$A0
	dc.b	$00,$6B,$00,$6C,$00,$24,$00,$25,$00,$A2,$00,$A3,$00,$A4,$00,$56
	dc.b	$00,$3B,$00,$3C,$00,$22,$00,$23,$00,$08,$00,$18,$00,$B3,$00,$6F
	dc.b	$00,$B4,$00,$B5,$00,$6E,$00,$6F,$00,$71,$00,$72,$00,$B6,$00,$8C
	dc.b	$08,$44,$00,$5B,$00,$08,$00,$09,$00,$0A,$00,$0B,$00,$07,$00,$07
	dc.b	$00,$12,$00,$13,$00,$73,$00,$74,$00,$B7,$00,$B8,$00,$73,$00,$74
	dc.b	$00,$75,$00,$76,$00,$91,$00,$92,$00,$5E,$00,$5F,$00,$12,$00,$13
	dc.b	$00,$14,$00,$15,$00,$07,$00,$07,$00,$07,$00,$07,$00,$B9,$00,$BA
	dc.b	$00,$B9,$00,$BB,$00,$B6,$00,$8C,$00,$1B,$00,$4C,$00,$9A,$00,$9B
	dc.b	$00,$64,$00,$BC,$00,$BD,$00,$BE,$00,$38,$00,$39,$00,$3A,$00,$1A
	dc.b	$00,$07,$00,$07,$00,$26,$00,$BF,$00,$26,$00,$BF,$00,$91,$00,$92
	dc.b	$00,$24,$00,$25,$00,$A2,$00,$A3,$00,$69,$00,$6A,$00,$C0,$00,$C1
	dc.b	$00,$3B,$00,$3C,$00,$22,$00,$23,$00,$16,$00,$17,$00,$38,$00,$39
	dc.b	$00,$38,$00,$39,$00,$08,$00,$18,$00,$C2,$00,$C3,$00,$B6,$00,$8C
	dc.b	$00,$C4,$00,$C5,$00,$79,$00,$7A,$00,$1B,$00,$4C,$00,$07,$00,$07
	dc.b	$00,$1F,$00,$20,$00,$3B,$00,$3C,$00,$3B,$00,$3C,$00,$12,$00,$13
	dc.b	$00,$C6,$00,$C7,$00,$91,$00,$92,$00,$C8,$00,$C9,$10,$79,$00,$81
	dc.b	$00,$24,$00,$25,$00,$07,$00,$07,$00,$3A,$00,$1A,$00,$BD,$00,$BE
	dc.b	$00,$08,$00,$09,$00,$62,$00,$63,$00,$79,$00,$7A,$00,$62,$00,$63
	dc.b	$00,$9C,$00,$9D,$00,$38,$00,$39,$00,$06,$00,$07,$00,$7B,$00,$90
	dc.b	$00,$22,$00,$23,$00,$C0,$00,$C1,$00,$12,$00,$13,$00,$68,$00,$61
	dc.b	$10,$79,$00,$81,$00,$68,$00,$61,$00,$A4,$00,$6C,$00,$3B,$00,$3C
	dc.b	$00,$10,$00,$11,$00,$82,$00,$83,$00,$CA,$00,$CB,$00,$62,$00,$63
	dc.b	$00,$06,$00,$97,$00,$62,$00,$63,$00,$38,$00,$39,$00,$77,$00,$78
	dc.b	$00,$C2,$00,$C3,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07
	dc.b	$00,$CC,$00,$CD,$00,$68,$00,$61,$00,$10,$00,$11,$00,$68,$00,$61
	dc.b	$00,$3B,$00,$3C,$00,$7F,$00,$80,$00,$C6,$00,$C7,$00,$07,$00,$07
	dc.b	$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$A5,$00,$A6
	dc.b	$00,$CE,$00,$CF,$00,$07,$00,$A8,$00,$A9,$00,$AA,$00,$1B,$00,$4C
	dc.b	$00,$9A,$00,$9B,$00,$9C,$00,$9D,$00,$38,$00,$39,$00,$3A,$00,$1A
	dc.b	$00,$07,$00,$07,$00,$AB,$00,$AC,$00,$D0,$00,$D1,$00,$AF,$00,$B0
	dc.b	$00,$D2,$00,$B2,$00,$24,$00,$25,$00,$A2,$00,$A3,$00,$A4,$00,$6C
	dc.b	$00,$3B,$00,$3C,$00,$22,$00,$23
	else
	dc.b	$80,$D7,$80,$04,$0B,$14,$0A,$24,$0C,$35,$1C,$44,$0D,$55,$1E,$68
	dc.b	$FA,$72,$00,$85,$02,$01,$13,$04,$25,$1D,$37,$7C,$FF,$FF,$88,$00
	dc.b	$15,$F3,$1E,$3C,$81,$00,$A8,$01,$F5,$DE,$38,$EB,$B2,$E0,$05,$7C
	dc.b	$C7,$8E,$BB,$2E,$52,$00,$DC,$0E,$37,$3D,$2A,$5A,$5B,$50,$69,$A8
	dc.b	$34,$EC,$C9,$50,$03,$1F,$26,$4A,$9F,$48,$10,$79,$3E,$9A,$47,$90
	dc.b	$0D,$6D,$B4,$E3,$6D,$C0,$39,$38,$F1,$CF,$86,$4B,$80,$6B,$AE,$3C
	dc.b	$E9,$92,$E5,$20,$53,$C7,$8E,$CC,$4B,$EE,$21,$69,$E9,$E8,$5B,$C7
	dc.b	$60,$01,$73,$21,$52,$A0,$07,$9C,$98,$9D,$37,$BE,$9A,$96,$EC,$3E
	dc.b	$A0,$7A,$7A,$1E,$87,$BF,$8A,$3C,$80,$07,$25,$4B,$80,$19,$DE,$25
	dc.b	$B7,$2A,$5B,$C8,$06,$B4,$DA,$53,$4D,$B9,$3D,$35,$2D,$38,$D2,$71
	dc.b	$A7,$66,$4A,$85,$43,$D0,$3D,$2A,$00,$67,$78,$E3,$AE,$F6,$9C,$78
	dc.b	$F2,$01,$C9,$6D,$A5,$4B,$6D,$03,$90,$B6,$BF,$8A,$67,$F1,$4D,$EF
	dc.b	$A6,$BA,$E3,$CE,$99,$2B,$E1,$E9,$F4,$F9,$D7,$26,$74,$72,$14,$FD
	dc.b	$26,$B6,$E2,$43,$90,$00,$F4,$32,$54,$00,$2A,$54,$2B,$F8,$A6,$F7
	dc.b	$D3,$5D,$71,$E7,$4F,$A8,$1E,$9E,$87,$A1,$BF,$31,$E3,$C8,$10,$E7
	dc.b	$71,$E3,$9F,$C5,$00,$DE,$DB,$4E,$3A,$D3,$52,$E6,$40,$35,$A4,$E3
	dc.b	$4E,$C2,$E0,$1C,$9A,$96,$EC,$B8,$01,$5F,$31,$2F,$B9,$3D,$32,$1E
	dc.b	$83,$4D,$41,$A7,$66,$40,$0A,$F8,$3A,$EC,$B8,$01,$5F,$07,$3A,$40
	dc.b	$0C,$F8,$3A,$EC,$B8,$01,$9D,$C9,$8E,$BB,$2E,$52,$00,$DB,$E6,$DF
	dc.b	$A7,$9D,$00,$D8,$3A,$92,$A1,$50,$27,$1E,$39,$F0,$A6,$A1,$8F,$D3
	dc.b	$B3,$5A,$69,$C7,$9D,$39,$00,$1D,$48,$6C,$B8,$06,$BA,$9F,$0A,$FE
	dc.b	$29,$BD,$F4,$D7,$5C,$79,$D3,$3E,$71,$C7,$90,$DE,$96,$E7,$C3,$93
	dc.b	$20,$18,$EA,$4A,$85,$4B,$80,$06,$4B,$86,$7C,$C4,$B4,$FA,$75,$3E
	dc.b	$15,$2E,$52,$05,$3A,$E3,$CE,$E2,$4F,$A4,$03,$C9,$F5,$D3,$7B,$E9
	dc.b	$AF,$26,$3B,$32,$15,$FC,$51,$E4,$03,$D0,$B6,$9F,$A7,$8F,$20,$1E
	dc.b	$87,$BF,$8A,$63,$49,$B0,$D6,$92,$FB,$72,$D0,$0F,$4D,$4B,$9C,$80
	dc.b	$16,$E7,$CB,$4A,$ED,$CD,$40,$32,$5B,$6F,$1B,$7E,$A5,$7C,$C8,$06
	dc.b	$B4,$D2,$5B,$4E,$CC,$76,$1E,$85,$B6,$D4,$A6,$DF,$A7,$9D,$A9,$B0
	dc.b	$0E,$4D,$4B,$76,$5C,$00,$CF,$98,$F9,$A7,$65,$CA,$40,$3A,$3A,$F9
	dc.b	$B9,$C8,$7A,$1E,$99,$DE,$25,$FC,$A8,$5B,$E4,$2D,$E2,$53,$C4,$E9
	dc.b	$F4,$9F,$4D,$4B,$82,$54,$B9,$52,$A0,$00,$5B,$6D,$B6,$80,$17,$2A
	dc.b	$15,$38,$80,$17,$38,$8F,$20,$03,$AD,$3B,$0D,$EF,$12,$DB,$87,$1A
	dc.b	$69,$C7,$9D,$1A,$EF,$D2,$01,$4D,$43,$66,$20,$71,$D4,$94,$93,$25
	dc.b	$20,$1E,$79,$0A,$97,$00,$D7,$53,$E1,$52,$E5,$25,$3A,$93,$66,$B4
	dc.b	$EB,$8E,$21,$DF,$4D,$4B,$79,$D3,$65,$7C,$E2,$43,$7A,$5C,$AF,$87
	dc.b	$BA,$07,$D2,$6C,$00,$2A,$1E,$86,$FC,$38,$D2,$05,$21,$53,$1F,$40
	dc.b	$3B,$4E,$BA,$E3,$4D,$CA,$80,$0E,$77,$8E,$4E,$3B,$2E,$00,$54,$B7
	dc.b	$CD,$BF,$4E,$7C,$00,$AF,$98,$F1,$D7,$9D,$B8,$5C,$03,$A3,$C8,$7C
	dc.b	$08,$07,$A0,$E3,$C6,$92,$E0,$1E,$96,$9C,$96,$9C,$41,$3C,$97,$FD
	dc.b	$5B,$4B,$4F,$20,$9E,$7C,$81,$6D,$27,$3E,$52,$37,$2A,$00,$79,$B6
	dc.b	$E6,$26,$7F,$14,$DE,$FB,$BC,$75,$C9,$9D,$33,$BF,$48,$06,$C3,$92
	dc.b	$E1,$48,$1F,$5D,$B8,$67,$CA,$85,$A7,$D2,$7B,$E5,$43,$90,$00,$F4
	dc.b	$0B,$40,$00,$F9,$8F,$1A,$6E,$01,$E8,$5B,$9F,$32,$00,$67,$78,$E3
	dc.b	$AD,$35,$2F,$E0,$04,$C7,$8E,$BC,$ED,$C0,$0C,$EE,$4C,$79,$09,$50
	dc.b	$02,$72,$53,$4D,$3E,$6E,$54,$00,$B9,$9D,$E2,$5B,$72,$A5,$A0,$1B
	dc.b	$F0,$F4,$E4,$00,$B7,$25,$B6,$9E,$95,$2D,$00,$6B,$F8,$A6,$B4,$D4
	dc.b	$B9,$B0,$0B,$9A,$D3,$AF,$9B,$95,$00,$2D,$E7,$6D,$A4,$B6,$E5,$40
	dc.b	$00,$B4,$7C,$80,$0F,$91,$AF,$E2,$9B,$DF,$4D,$75,$C9,$9D,$39,$F3
	dc.b	$12,$D3,$E9,$D4,$F8,$54,$02,$E6,$BA,$E3,$CE,$9C,$95,$01,$D4,$9B
	dc.b	$2A,$71,$D6,$A5,$40,$9F,$4F,$9D,$4E,$DA,$64,$2D,$FA,$4F,$A4,$E4
	dc.b	$2E,$54,$B4,$0F,$3A,$E4,$CE,$8D,$4B,$80,$03,$52,$E1,$72,$A0,$02
	dc.b	$5C,$AE,$92,$BE,$1E,$9F,$4F,$9A,$69,$C7,$9D,$1A,$EF,$D3,$4F,$D2
	dc.b	$7D,$25,$40,$03,$21,$E8,$1F,$0E,$34,$80,$1B,$00,$39,$F3,$12,$FB
	dc.b	$90,$98,$81,$6D,$27,$1A,$76,$64,$D8,$7A,$17,$32,$63,$AF,$9B,$95
	dc.b	$00,$2E,$5B,$4E,$36,$FD,$39,$F2,$90,$06,$DC,$96,$DB,$6E,$B9,$F2
	dc.b	$DA,$71,$2E,$01,$C9,$69,$F5,$D0,$0F,$A4,$2A,$01,$AD,$27,$3E,$15
	dc.b	$F3,$8E,$3C,$86,$F4,$B7,$3E,$1C,$6E,$54,$00,$1B,$95,$0A,$F9,$C7
	dc.b	$1E,$43,$7A,$5B,$9F,$0D,$80,$5C,$D7,$5C,$79,$D2,$BB,$8E,$20,$1B
	dc.b	$38,$93,$3B,$69,$A9,$F4,$EB,$4E,$C2,$54,$2A,$7A,$6B,$E6,$9A,$71
	dc.b	$E7,$4E,$40,$A4,$D6,$DC,$48,$57,$F5,$4E,$7C,$03,$9F,$0A,$FE,$AD
	dc.b	$4A,$85,$43,$D0,$3D,$2A,$54,$00,$A8,$25,$CA,$E8,$03,$9D,$A6,$DC
	dc.b	$6D,$C6,$9A,$97,$00,$25,$C0,$C9,$70,$A4,$FA,$49,$72,$92,$9D,$FE
	dc.b	$2D,$43,$E9,$3E,$9C,$F9,$89,$7F,$F5,$00,$39,$0F,$4A,$EF,$D2,$01
	dc.b	$72,$A1,$CF,$E2,$9B,$DF,$4D,$75,$C7,$9D,$2E,$5C,$35,$D4,$9B,$07
	dc.b	$5C,$4A,$41,$C7,$53,$65,$CA,$46,$BE,$71,$C7,$90,$DE,$97,$2B,$E1
	dc.b	$7F,$38,$E3,$C8,$6F,$78,$F1,$CF,$98,$80,$09,$F4,$9F,$53,$21,$88
	dc.b	$20,$99,$FE,$5A,$80,$6B,$49,$C6,$9D,$87,$10,$3E,$0E,$74,$95,$36
	dc.b	$01,$70,$75,$F3,$72,$A7,$20,$1A,$D2,$71,$A6,$E5,$B4,$9C,$41,$32
	dc.b	$64,$2A,$00,$3A,$90,$DF,$95,$0B,$4F,$A7,$53,$E5,$27,$20,$03,$A9
	dc.b	$0C,$80,$5C,$D7,$5C,$79,$D2,$A5,$CA,$43,$E9,$A4,$B6,$9A,$86,$37
	dc.b	$D3,$53,$D3,$9D,$1E,$4C,$79,$D0,$0D,$6D,$A9,$4D,$B8,$E3,$F5,$F0
	dc.b	$CE,$FA,$6B,$AE,$3C,$EE,$24,$CE,$DB,$A8,$03,$C8,$72,$5C,$03,$5D
	dc.b	$71,$E7,$4C,$EF,$D2,$05,$25,$4C,$43,$25,$34,$96,$D2,$5B,$4D,$25
	dc.b	$B4,$EC,$C9,$50,$C4,$FA,$4F,$23,$6D,$A0,$06,$CC,$46,$A5,$20,$1F
	dc.b	$52,$A1,$BF,$31,$E3,$C8,$10,$DE,$95,$2F,$A0,$17,$FE,$51,$A6,$9A
	dc.b	$97,$2F,$E6,$43,$D0,$C6,$A1,$8E,$CC,$80,$17,$2E,$14,$92,$E5,$37
	dc.b	$00,$D4,$FA,$7E,$9B,$ED,$C0,$02,$5C,$B8,$4B,$80,$06,$4B,$86,$4C
	dc.b	$80,$63,$A9,$2A,$17,$2E,$52,$05,$3A,$F9,$BF,$86,$7C,$A8,$5F,$7D
	dc.b	$35,$2D,$A6,$FB,$C4,$B8,$06,$A7,$D7,$43,$EA,$54,$B4,$B4,$E3,$4D
	dc.b	$A5,$34,$DB,$93,$20,$06,$4B,$7C,$DB,$F4,$E7,$C0,$0A,$F9,$8F,$9A
	dc.b	$EE,$4D,$7E,$90,$3B,$8F,$1D,$78,$DB,$73,$20,$02,$7D,$3E,$EE,$40
	dc.b	$0F,$35,$38,$99,$DF,$A4,$03,$61,$9F,$32,$63,$C8,$6F,$4B,$6B,$F8
	dc.b	$A7,$3E,$62,$5F,$7D,$35,$2D,$CF,$86,$A0,$0D,$42,$A5,$42,$90,$03
	dc.b	$3B,$C7,$1D,$69,$A9,$70,$02,$BF,$AA,$71,$A6,$A5,$C0,$0C,$97,$03
	dc.b	$25,$CE,$40,$08,$3A,$EC,$B8,$00,$DB,$5D,$B6,$DF,$A6,$FF,$AA,$01
	dc.b	$AF,$3B,$6D,$25,$FC,$A9,$F5,$00,$E4,$D4,$B7,$1B,$6D,$B7,$C8,$14
	dc.b	$95,$0D,$97,$0D,$75,$26,$C1,$D7,$1B,$6D,$B8,$00,$53,$70,$E4,$E4
	dc.b	$B7,$12,$D3,$E9,$D6,$9D,$86,$7F,$54,$E7,$7D,$35,$A6,$9C,$79,$D3
	dc.b	$25,$C0,$35,$D4,$F8,$00,$54,$3D,$0D,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
	dc.b	$00,$02,$00,$03,$00,$04,$00,$05,$00,$06,$00,$07,$00,$08,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$09,$00,$0A,$00,$0B,$00,$0C,$00,$0D
	dc.b	$00,$0E,$00,$0F,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$11,$00,$02
	dc.b	$00,$12,$00,$13,$00,$02,$00,$14,$00,$15,$00,$16,$00,$17,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$18,$00,$19,$00,$1A,$00,$1B,$00,$19,$00,$1C
	dc.b	$00,$1D,$00,$1E,$00,$1F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$20,$00,$02,$00,$12,$00,$21,$00,$22,$00,$23,$08,$02
	dc.b	$00,$24,$00,$25,$00,$26,$00,$27,$00,$25,$08,$02,$00,$28,$00,$14
	dc.b	$00,$29,$00,$2A,$00,$05,$00,$06,$00,$2B,$00,$2C,$00,$19,$00,$1A
	dc.b	$00,$2D,$00,$2E,$00,$2F,$00,$30,$00,$31,$00,$32,$00,$33,$00,$34
	dc.b	$00,$32,$08,$0A,$08,$33,$00,$1C,$00,$35,$00,$36,$00,$0D,$00,$0E
	dc.b	$00,$37,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$38,$00,$39,$00,$3A,$00,$3B,$00,$3C
	dc.b	$00,$3D,$00,$3E,$00,$3F,$00,$40,$00,$41,$00,$42,$00,$43,$00,$44
	dc.b	$00,$45,$00,$46,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$47
	dc.b	$00,$47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$4D,$00,$4E
	dc.b	$00,$4F,$00,$50,$00,$51,$00,$52,$00,$2F,$08,$1D,$00,$53,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$54,$00,$55,$00,$56,$00,$57
	dc.b	$00,$58,$00,$59,$00,$5A,$00,$5B,$00,$5C,$00,$5D,$00,$43,$00,$44
	dc.b	$00,$45,$00,$46,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$5E,$00,$5F,$00,$60,$00,$61,$00,$62,$00,$63,$00,$64,$00,$1D
	dc.b	$00,$1D,$08,$64,$00,$51,$00,$52,$00,$2F,$08,$1D,$00,$53,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$65,$00,$66,$00,$67,$08,$24,$00,$24,$00,$16
	dc.b	$00,$02,$00,$68,$00,$69,$00,$6A,$00,$6B,$00,$6C,$00,$6D,$00,$6E
	dc.b	$00,$6F,$00,$70,$00,$3D,$00,$00,$00,$00,$00,$00,$00,$71,$00,$72
	dc.b	$00,$73,$00,$74,$00,$31,$00,$1E,$00,$75,$00,$62,$00,$63,$00,$76
	dc.b	$00,$77,$00,$78,$00,$79,$00,$7A,$00,$7B,$00,$7C,$00,$7D,$00,$7E
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$7F,$00,$80,$00,$81
	dc.b	$00,$82,$08,$27,$08,$16,$08,$02,$00,$83,$00,$84,$00,$70,$00,$13
	dc.b	$00,$85,$00,$86,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$87,$00,$88,$00,$4C,$00,$89,$00,$8A,$00,$8B,$08,$0A
	dc.b	$00,$8C,$00,$8D,$00,$8E,$00,$8F,$08,$10,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$90,$00,$91,$00,$02,$08,$24
	dc.b	$00,$92,$00,$93,$08,$24,$00,$40,$00,$94,$00,$02,$00,$95,$00,$96
	dc.b	$00,$22,$00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$97,$00,$47,$00,$19,$00,$74,$00,$98,$00,$99,$00,$74,$00,$4E
	dc.b	$00,$9A,$00,$19,$00,$9B,$00,$9C,$00,$2E,$00,$9D,$00,$9E,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$02,$00,$A0
	dc.b	$00,$A1,$00,$A2,$08,$02,$00,$A3,$00,$02,$08,$02,$00,$02,$00,$03
	dc.b	$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$A4,$00,$0A,$00,$A5,$00,$A6,$08,$79,$00,$30,$00,$A7
	dc.b	$00,$0A,$00,$A8,$00,$0A,$00,$A9,$00,$AA,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$38,$00,$39,$00,$3A,$00,$3B,$00,$3C
	dc.b	$00,$3D,$00,$3E,$00,$3F,$00,$40,$00,$41,$00,$42,$00,$29,$00,$AB
	dc.b	$00,$93,$00,$57,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$47
	dc.b	$00,$47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$4D,$00,$4E
	dc.b	$00,$4F,$00,$50,$00,$AC,$00,$AD,$00,$AE,$00,$AF,$00,$9E,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$54,$00,$55,$00,$56,$00,$57
	dc.b	$00,$58,$00,$59,$00,$5A,$00,$5B,$00,$5C,$00,$5D,$00,$29,$00,$AB
	dc.b	$00,$93,$00,$57,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$5E,$00,$5F,$00,$60,$00,$61,$00,$62,$00,$63,$00,$64,$00,$1D
	dc.b	$00,$1D,$08,$64,$00,$AC,$00,$AD,$00,$AE,$00,$AF,$00,$9E,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$B0
	dc.b	$00,$B1,$00,$42,$00,$29,$00,$AB,$00,$93,$00,$57,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$B2,$00,$B3,$00,$50,$00,$AC,$00,$AD
	dc.b	$00,$AE,$00,$AF,$00,$9E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$B4,$00,$27,$00,$B5
	dc.b	$08,$02,$08,$16,$08,$24,$00,$28,$08,$40,$00,$02,$08,$02,$00,$02
	dc.b	$00,$58,$00,$B6,$00,$28,$00,$B7,$08,$70,$00,$B8,$00,$00,$00,$00
	dc.b	$00,$00,$00,$09,$00,$34,$00,$B9,$00,$30,$00,$8B,$00,$74,$08,$33
	dc.b	$08,$4E,$00,$19,$00,$A8,$00,$0A,$00,$BA,$00,$BB,$08,$33,$00,$BC
	dc.b	$00,$BD,$00,$BE,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$27,$00,$BF,$00,$56,$00,$57,$00,$C0,$00,$02,$00,$C1,$00,$C2
	dc.b	$00,$C3,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$34,$00,$C4,$00,$60,$00,$61
	dc.b	$00,$C5,$00,$19,$00,$C6,$00,$C7,$00,$C8,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$3A,$00,$C9,$00,$CA,$00,$70,$00,$3D,$00,$CB
	dc.b	$00,$CC,$08,$24,$00,$24,$08,$40,$00,$02,$00,$29,$00,$42,$00,$29
	dc.b	$00,$CD,$00,$CE,$00,$56,$00,$CF,$00,$00,$00,$00,$00,$48,$00,$73
	dc.b	$00,$33,$00,$79,$00,$D0,$00,$D1,$08,$BA,$00,$74,$00,$31,$08,$4E
	dc.b	$00,$19,$00,$AC,$00,$D2,$00,$AC,$00,$D3,$00,$51,$00,$D4,$00,$D5
	dc.b	$00,$D6,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	endif
	; End of explicit regional source data.
	endif
