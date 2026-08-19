; ------------------------------------------------------------------------------

GameOverObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A83A(pc,d0.w),d0
	jmp	off_20A83A(pc,d0.w)

; ------------------------------------------------------------------------------

off_20A83A:
	dc.w	GameOverInit-*
	dc.w	GameOverMain-off_20A83A

; ------------------------------------------------------------------------------

GameOverInit:
	move.w	#$82,d0
	jsr	SubCpuCommand
	addq.b	#2,obj.routine(a0)
	move.w	#$E0,obj.x+2(a0)
	move.w	#$80,obj.x(a0)
	move.w	#$120,obj.var_2a(a0)
	move.w	#$8544,obj.sprite_tile(a0)
	move.l	#GameOverSprites,obj.sprite_data(a0)
	move.b	#8,powerup_changed
	bclr	#0,time_over
	beq.s	loc_20A896
	tst.b	lives
	beq.s	loc_20A89E
	move.l	#TimeOverSprites,obj.sprite_data(a0)
	addq.b	#2,powerup_changed
	bra.s	loc_20A89E

; ------------------------------------------------------------------------------

loc_20A896:
	tst.b	lives
	bne.s	loc_20A8AE

loc_20A89E:
	bset	#7,powerup_changed
	jsr	SpawnObject
	beq.s	loc_20A8B4

loc_20A8AE:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20A8B4:
	move.b	#$3B,obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.b	#1,obj.sprite_frame(a1)
	move.w	#$E0,obj.x+2(a1)
	move.w	#$1C0,obj.x(a1)
	move.w	#$120,obj.var_2a(a1)
	tst.b	lives
	bne.s	GameOverMain
	move.w	#$6E,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

GameOverMain:
	moveq	#8,d0
	move.w	obj.var_2a(a0),d1
	cmp.w	obj.x(a0),d1
	beq.s	loc_20A90A
	bge.s	loc_20A906
	neg.w	d0

loc_20A906:
	add.w	d0,obj.x(a0)

loc_20A90A:
	jmp	DrawObject

; ------------------------------------------------------------------------------

OverSprites:
	include	"src/sprites/over.asm"
	even
GameOverSprites		equ .GameOverSprites
TimeOverSprites		equ .TimeOverSprites

; ------------------------------------------------------------------------------
