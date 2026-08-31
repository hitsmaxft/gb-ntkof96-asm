; Manually compressed from the KOF95 Eiji tables for KOF96's 0x00-0x98 layout.
; Standing attacks use the original near L/H pairs. In particular, near heavy
; kick keeps its KOF95 mid-animation HEAVYHIT stage and custom move code.
MoveAnimTbl_Eiji96:
	db $4C,$00,$00,$00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Idle, $04,$04,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_WalkF, $04,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_WalkB, $04,$04,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Crouch, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_JumpN, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_JumpF, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_JumpB, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_BlockC, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_HopF, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_HopB, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_ChargeMeter, $04,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Taunt, $14,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Wakeup, $04,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Dizzy, $04,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Win, $08,$09,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Win, $08,$09,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LostTimeover, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Intro, $20,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Intro, $20,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_PunchLN, $08,$00,$04,HITTYPE_HIT_MID0,$00
	mMvAnDef OBJLstPtrTable_Eiji_PunchHN, $08,$01,$04,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KickLN, $08,$01,$08,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Eiji_KickHN, $14,$01,$08,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Eiji_PunchCL, $08,$00,$03,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Eiji_PunchCH, $08,$01,$03,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KickCL, $08,$00,$06,HITTYPE_HIT_MID1,PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Eiji_KickCH, $08,$02,$06,HITTYPE_SWEEP,PF3_HEAVYHIT|PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Eiji_Strike, $08,$01,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_PunchALI, $10,$01,$05,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Eiji_KickALI, $10,$01,$09,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Eiji_AttackA, $10,$01,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Eiji_Kikouhou, $0C,$01,$0A,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_Kikouhou, $0C,$02,$0A,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KotsuHazakiKiri, $14,$01,$0A,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KotsuHazakiKiri, $14,$01,$0A,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_RyuuEijin, $18,$01,$04,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_RyuuEijin, $18,$04,$04,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KasumiGeri, $0C,$01,$09,HITTYPE_HIT_MID0,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KasumiGeri, $0C,$01,$09,HITTYPE_HIT_MID0,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_Zantetsuha, $08,$01,$09,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_Zantetsuha, $08,$01,$09,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Eiji_KageUtsushi, $10,$01,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Eiji_KageUtsushi, $10,$01,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Eiji_KotsuHazakiKiri, $14,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_KotsuHazakiKiri, $14,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_ZantetsuTourouken, $54,$00,$01,HITTYPE_HIT_MULTI1,PF3_HEAVYHIT|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Eiji_ZantetsuTourouken, $54,$00,$01,HITTYPE_HIT_MULTI1,PF3_HEAVYHIT|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Eiji_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_ThrowG, $0C,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Idle, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Hit0Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Hit1Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_HitLow, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_HitSweep, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchSwoopup, $18,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_HitSweep, $08,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchUBRec, $18,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Hit0Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_Hit1Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_GrabUBNoSync, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Eiji_LaunchDBShake, $00,$3C,$00,$00,$00

MoveCodePtrTbl_Eiji96:
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Eiji_KickHN
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Eiji_Kikouhou
	mMvCodeDef MoveC_Eiji_Kikouhou
	mMvCodeDef MoveC_Eiji_KotsuHazakiKiri
	mMvCodeDef MoveC_Eiji_KotsuHazakiKiri
	mMvCodeDef MoveC_Eiji_RyuuEijin
	mMvCodeDef MoveC_Eiji_RyuuEijin
	mMvCodeDef MoveC_Eiji_Kikouhou
	mMvCodeDef MoveC_Eiji_Kikouhou
	mMvCodeDef MoveC_Eiji_Zantetsuha
	mMvCodeDef MoveC_Eiji_Zantetsuha
	mMvCodeDef MoveC_Eiji_KageUtsushi
	mMvCodeDef MoveC_Eiji_KageUtsushi
	mMvCodeDef MoveC_Eiji_KotsuHazakiKiri
	mMvCodeDef MoveC_Eiji_KotsuHazakiKiri
	mMvCodeDef MoveC_Eiji_ZantetsuTourouken
	mMvCodeDef MoveC_Eiji_ZantetsuTourouken
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Eiji_ThrowG
	mMvCodeDef MoveC_Base_Idle
