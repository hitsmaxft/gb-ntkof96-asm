; Manually compressed from the KOF95 Billy tables into KOF96's $00-$98 layout.
; KOF96 has one standing L/H pair, so use Billy's original near pair. None of
; those four moves has a hidden extra-damage code stage; the KOF95-only far
; slide kick remains intentionally outside the compressed normal slots.
MoveAnimTbl_Billy96:
	db $4C,$00,$00,$00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $0C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_WalkF, $04,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_WalkB, $04,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Crouch, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_JumpN, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_JumpN, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_JumpN, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_BlockC, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_HopF, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_HopB, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_ChargeMeter, $04,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Taunt, $14,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Wakeup, $04,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Dizzy, $04,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Win, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Win, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LostTimeover, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Intro, $30,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Intro, $30,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_PunchLN, $08,$00,$04,HITTYPE_HIT_MID0,$00
	mMvAnDef OBJLstPtrTable_Billy_PunchHN, $08,$01,$04,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Billy_KickLN, $08,$01,$08,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_KickHN, $08,$02,$08,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Billy_PunchCL, $08,$00,$03,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_PunchCH, $08,$01,$03,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Billy_KickCL, $08,$00,$06,HITTYPE_HIT_MID1,PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Billy_KickCH, $08,$02,$06,HITTYPE_SWEEP,PF3_HEAVYHIT|PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Billy_DodgeCounter, $08,$04,$07,HITTYPE_HIT_MID0,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Billy_PunchALI, $10,$01,$05,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Billy_KickALI, $10,$01,$09,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Billy_AttackA, $10,$01,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Billy_SansetsuKonChuudanUchi, $10,$01,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_SansetsuKonChuudanUchi, $10,$03,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_SenpuuKon, $0C,$00,$0A,HITTYPE_HIT_MID1,$00
	; Heavy spin used to hold every one of its ten mappings for three ticks.
	; Instant mappings bring the sustained section to roughly one third.
	mMvAnDef OBJLstPtrTable_Billy_SenpuuKon, $0C,$00,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_SuzumeOtoshi, $10,$01,$04,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_SuzumeOtoshi, $10,$04,$04,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Billy_KyoushuuHishouKon, $1C,$01,$09,HITTYPE_LAUNCH_HIGH_UB,$00
	mMvAnDef OBJLstPtrTable_Billy_KyoushuuHishouKon, $1C,$02,$09,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_ChouKaenSenpuuKon, $40,$00,$20,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_FIRE
	mMvAnDef OBJLstPtrTable_Billy_ChouKaenSenpuuKon, $40,$00,$20,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_FIRE
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_ThrowG, $18,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Idle, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Hit0Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Hit1Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_HitLow, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $0C,$FF,$00,$00,$00
	; KOF96's grounded shake state must start immediately; LaunchDBShake's
	; KOF95 $FF frame would wait forever here.
	mMvAnDef OBJLstPtrTable_Billy_HitSweep, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchSwoopup, $18,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_HitSweep, $08,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchUBRec, $18,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Hit0Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_Hit1Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_GrabUBNoSync, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Billy_LaunchDBShake, $00,$3C,$00,$00,$00

MoveCodePtrTbl_Billy96:
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
	mMvCodeDef MoveC_Billy_SansetsuKonChuudanUchi
	mMvCodeDef MoveC_Billy_SansetsuKonChuudanUchi
	mMvCodeDef MoveC_Billy_SenpuuKon
	mMvCodeDef MoveC_Billy_SenpuuKon
	mMvCodeDef MoveC_Billy_SansetsuKonChuudanUchi
	mMvCodeDef MoveC_Billy_SansetsuKonChuudanUchi
	mMvCodeDef MoveC_Billy_KyoushuuHishouKon
	mMvCodeDef MoveC_Billy_KyoushuuHishouKon
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Billy_ChouKaenSenpuuKon
	mMvCodeDef MoveC_Billy_ChouKaenSenpuuKon
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Billy_ThrowG
	mMvCodeDef MoveC_Base_Idle
