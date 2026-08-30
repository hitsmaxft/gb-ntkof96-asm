; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveAnimTbl_Ralf96:
	db $4C,$00,$00,$00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $0C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_WalkF, $0C, $01, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_WalkB, $0C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Crouch, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_JumpN, $1C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_JumpF, $1C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_JumpB, $1C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_BlockG, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_BlockC, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_BlockG, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_HopF, $08, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_HopB, $08, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_ChargeMeter, $04, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Taunt, $00, $0A, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Dodge, $00, $1E, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Dodge, $00, $1E, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Wakeup, $04, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Dizzy, $04, $0A, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Win, $18, $03, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Win, $18, $03, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LostTimeover, $00, $01, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Intro, $34, $03, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Intro, $34, $03, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_PunchLN, $08, $00, $04, HITTYPE_HIT_MID0, $00
	mMvAnDef OBJLstPtrTable_Ralf_PunchHN, $0C, $01, $04, HITTYPE_HIT_MID1, $00
	mMvAnDef OBJLstPtrTable_Ralf_KickLN, $08, $01, $08, HITTYPE_HIT_MID1, $00
	mMvAnDef OBJLstPtrTable_Ralf_KickHN, $08, $02, $08, HITTYPE_HIT_MID1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_PunchCL, $08, $00, $03, HITTYPE_HIT_MID1, $00
	mMvAnDef OBJLstPtrTable_Ralf_PunchCH, $08, $01, $03, HITTYPE_HIT_MID1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_KickCL, $08, $00, $06, HITTYPE_HIT_MID1, PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Ralf_KickCH, $08, $02, $06, HITTYPE_SWEEP, PF3_HEAVYHIT|PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Ralf_Strike, $08, $01, $06, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_PunchALI, $10, $01, $05, HITTYPE_HIT_MID0, PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Ralf_KickALI, $10, $01, $09, HITTYPE_HIT_MID0, PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Ralf_KickALI, $10, $01, $06, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_OVERHEAD
	; Vulcan Punch arms its single hit from MoveC_Ralf_VulcanPunch after the
	; startup frame. Keep the table damage at zero so a close opponent cannot
	; take the old initial $0A hit followed by the code's $08 hit.
	mMvAnDef OBJLstPtrTable_Ralf_VulcanPunchL, $0C, $01, $00, HITTYPE_LAUNCH_HIGH_UB, PF3_FIRE
	mMvAnDef OBJLstPtrTable_Ralf_VulcanPunchL, $0C, $01, $00, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
	mMvAnDef OBJLstPtrTable_Ralf_GatlingAttackL, $14, $02, $0A, HITTYPE_HIT_MID1, PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Ralf_GatlingAttackL, $14, $04, $0A, HITTYPE_HIT_MID1, PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Ralf_BackBreaker, $28, $0A, $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_BackBreaker, $28, $0A, $04, HITTYPE_HIT_MID1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_BakudanPunchL, $2C, $01, $09, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_BakudanPunchL, $2C, $02, $09, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_BaribariVulcanPunchS, $30, $01, $0A, HITTYPE_HIT_MID1, PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Ralf_BaribariVulcanPunchS, $30, $01, $0A, HITTYPE_HIT_MID1, PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Ralf_ThrowG, $14, $0A, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Idle, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_BlockG, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_BlockG, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchUB, $10, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Hit0Mid, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Hit1Mid, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_HitLow, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchUB, $10, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchSwoopup, $18, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_HitSweep, $08, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchUBRec, $18, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Hit0Mid, $00, $14, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_Hit1Mid, $00, $14, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_GrabUBNoSync, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Ralf_LaunchDBShake, $00, $3C, $00, $00, $00

MoveCodePtrTbl_Ralf96:
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Ralf_VulcanPunch
	mMvCodeDef MoveC_Ralf_VulcanPunch
	mMvCodeDef MoveC_Ralf_GatlingAttack
	mMvCodeDef MoveC_Ralf_GatlingAttack
	mMvCodeDef MoveC_Ralf_BackBreaker
	mMvCodeDef MoveC_Ralf_BackBreaker
	mMvCodeDef MoveC_Ralf_BakudanPunch
	mMvCodeDef MoveC_Ralf_BakudanPunch
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Ralf_BaribariVulcanPunch
	mMvCodeDef MoveC_Ralf_BaribariVulcanPunch
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Ralf_ThrowG
	mMvCodeDef MoveC_Base_Idle
