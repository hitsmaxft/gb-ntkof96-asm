; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveAnimTbl_Rugal96:
	db $4C,$00,$00,$00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $0C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_WalkF, $08, $01, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_WalkB, $08, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Crouch, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_JumpN, $1C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_JumpN, $1C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_JumpN, $1C, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_BlockG, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_BlockC, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_BlockG, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_HopF, $08, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_HopB, $08, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_ChargeMeter, $04, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Taunt, $1C, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Dodge, $00, $1E, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Dodge, $00, $1E, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Wakeup, $04, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Dizzy, $04, $0A, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Win, $10, $08, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Win, $10, $08, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LostTimeover, $04, $04, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Intro, $08, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Intro, $08, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_PunchLN, $08, $00, $04, HITTYPE_HIT_MID0, $00
	mMvAnDef OBJLstPtrTable_Rugal_PunchHN, $0C, $01, $04, HITTYPE_HIT_MID1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_KickLN, $08, $01, $08, HITTYPE_HIT_MID1, PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Rugal_KickHN, $0C, $01, $08, HITTYPE_HIT_MID1, $00
	mMvAnDef OBJLstPtrTable_Rugal_PunchCL, $08, $00, $03, HITTYPE_HIT_MID1, $00
	mMvAnDef OBJLstPtrTable_Rugal_PunchCH, $08, $01, $03, HITTYPE_HIT_MID1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_KickCL, $08, $00, $06, HITTYPE_HIT_MID1, PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Rugal_KickCH, $08, $02, $06, HITTYPE_SWEEP, PF3_HEAVYHIT|PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Rugal_Strike, $08, $03, $06, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_PunchALI, $10, $01, $05, HITTYPE_HIT_MID0, PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Rugal_KickALI, $10, $01, $09, HITTYPE_HIT_MID0, PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Rugal_AttackA, $10, $01, $06, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Rugal_ReppuKen, $0C, $01, $0A, HITTYPE_HIT_MID0, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_ReppuKen, $0C, $03, $0A, HITTYPE_HIT_MID0, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_GodPress, $10, $02, $0A, HITTYPE_HIT_MULTI1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_GodPress, $10, $02, $0A, HITTYPE_HIT_MULTI1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_DarkBarrier, $18, $01, $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_DarkBarrier, $18, $04, $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	; Easy DF+A light version: shorten the 16-frame startup to four frames;
	; together with the faster lift/recovery, the complete action is halved.
	mMvAnDef OBJLstPtrTable_Rugal_GenocideCutter, $04, $01, $09, HITTYPE_HIT_MID1, PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Rugal_GenocideCutter, $10, $02, $09, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Rugal_KaiserWave, $0C, $01, $09, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_KaiserWave, $0C, $04, $09, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_GiganticPressure, $14, $00, $0A, HITTYPE_HIT_MULTI1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_GiganticPressure, $14, $00, $0A, HITTYPE_HIT_MULTI1, PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Rugal_ThrowG, $0C, $0A, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Idle, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_BlockG, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_BlockG, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchUB, $10, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Hit0Mid, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Hit1Mid, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_HitLow, $00, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchUB, $10, $05, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_HitSweep, $00, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchSwoopup, $18, $00, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_HitSweep, $08, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchUBRec, $18, $02, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Hit0Mid, $00, $14, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_Hit1Mid, $00, $14, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $0C, $FF, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_GrabUBNoSync, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $00, $3C, $00, $00, $00
	mMvAnDef OBJLstPtrTable_Rugal_LaunchDBShake, $00, $3C, $00, $00, $00

MoveCodePtrTbl_Rugal96:
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Rugal_KickHN
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Rugal_ReppuKen
	mMvCodeDef MoveC_Rugal_ReppuKen
	mMvCodeDef MoveC_Rugal_GodPress
	mMvCodeDef MoveC_Rugal_GodPress
	mMvCodeDef MoveC_Rugal_DarkBarrier
	mMvCodeDef MoveC_Rugal_DarkBarrier
	mMvCodeDef MoveC_Rugal_GenocideCutter
	mMvCodeDef MoveC_Rugal_GenocideCutter
	mMvCodeDef MoveC_Rugal_ReppuKen
	mMvCodeDef MoveC_Rugal_ReppuKen
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Rugal_GiganticPressure
	mMvCodeDef MoveC_Rugal_GiganticPressure
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Joe_ThrowG
	mMvCodeDef MoveC_Base_Idle
