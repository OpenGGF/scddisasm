; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 3 final boss compatibility wrapper
; -------------------------------------------------------------------------

; The R13 boss source predates the current object ABI. These aliases keep
; its recovered routines and mappings unchanged while binding them to the
; current object layout and level services.

obj.id			EQU	oID
obj.sprite_flags	EQU	oSprFlags
obj.sprite_tile		EQU	oTile
obj.sprite_data		EQU	oMap
obj.x			EQU	oX
obj.x_speed		EQU	oXVel
obj.y			EQU	oY
obj.y_speed		EQU	oYVel
obj.height		EQU	oYRadius
obj.width_2		EQU	oWidth
obj.sprite_layer	EQU	oPriority
obj.sprite_frame	EQU	oMapFrame
obj.anim_index		EQU	oAnimFrame
obj.anim_id		EQU	oAnim
obj.anim_timer		EQU	oAnimTime
obj.collide_type	EQU	oColType
obj.collide_status	EQU	oColStatus
obj.flags		EQU	oFlags
obj.routine		EQU	oRoutine
obj.routine_2		EQU	oRoutine2
obj.angle		EQU	oAngle
obj.subtype		EQU	oSubtype
obj.subtype_2		EQU	oSubtype2
obj.ground_speed	EQU	oPlayerGVel
obj.var_1f		EQU	oVar1F
obj.var_2a		EQU	oVar2A
obj.var_2b		EQU	oVar2B
obj.var_2c		EQU	oVar2C
obj.var_2d		EQU	oVar2D
obj.var_2e		EQU	oVar2E
obj.var_30		EQU	oVar30
obj.var_32		EQU	oVar32
obj.var_34		EQU	oVar34
obj.var_35		EQU	oVar35
obj.var_36		EQU	oVar36
obj.var_38		EQU	oVar38
obj.var_3a		EQU	oVar3A
obj.var_3c		EQU	oVar3C

player_object		EQU	objPlayerSlot
boss_flags		EQU	bossFlags
boss_started		EQU	bossFight
good_future		EQU	goodFuture
bottom_bound		EQU	bottomBound
target_bottom_bound	EQU	destBottomBound
left_bound		EQU	leftBound
target_left_bound	EQU	destLeftBound
right_bound		EQU	rightBound
target_right_bound	EQU	destRightBound
scroll_focus_y		EQU	camYCenter

AddGfxQueue		EQU	LoadPLC
CheckBlockDown		EQU	ObjGetFloorDist
LoadCapsulePalette	EQU	LoadCapsulePal
PlayFmSound		EQU	PlayFMSound
SineCosine		EQU	CalcSine
SubCpuCommand		EQU	SubCPUCmd
unk_2027F8		EQU	CamBounds

	include	"objects/r1/boss.asm"
