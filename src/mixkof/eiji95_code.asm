; Ported and reviewed per-character from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08.
; KOF95-only BDFB command table retained byte-for-byte because KOF96 has no
; shared equivalent.
MoveInput_Eiji_BDFB_95:
	db $04
	db KEY_DOWN,  KEY_DOWN,  $01, $14
	db KEY_LEFT,  KEY_LEFT,  $01, $0A
	db KEY_DOWN,  KEY_DOWN,  $01, $0A
	db KEY_RIGHT, KEY_RIGHT, $01, $FF

; =============== MoveC_Eiji_ThrowG ===============
; Move code for Eiji's Ground Throw (MOVE_SHARED_THROW_G).
; This is more similar to an air throw.
MoveC_Eiji_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .doGravity
		mMvC_ChkFrame $04, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	; Grab opponent
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $06
		; KOF96 folds KOF95's initial synced upright grab into the common
		; throw-start state; the following Eiji frames still perform the launch.
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Start high jump
	mMvC_ValFrameStartFast .obj1_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0600
.obj1_cont:
	; Throw diagonally down
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed $04
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_FAST_DB, $00
		jp   .doGravity
; --------------- frame #2 ---------------
.obj2:
	; Freeze in the air for a bit, then jump back
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetSpeedH -$0040 ; at a very slow horz speed
		mMvC_SetSpeedV +$0100
		jp   .anim
; --------------- common gravity check / frames #1-3 ---------------
.doGravity:
	; When touching the ground, switch to #4
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $04, $05
		jp   .ret
; --------------- frame #4 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		mMvC_EndThrow
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_KickHN ===============
; Move code for Eiji's Near Heavy Kick. (MOVE_SHARED_KICK_HN)
; Identical to MoveC_Athena_KickHN other than for adjusted timing.
MoveC_Eiji_KickHN:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj0
		mMvC_ChkFrame $05, .chkEnd
; --------------- frames #0-1,3-4 ---------------
	jp   .anim
; --------------- frame #2 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #5 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_KickHM ===============
; Move code for Eiji's Far Heavy Kick (MOVE_SHARED_KICK_HM).
MoveC_Eiji_KickHM:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj0
		mMvC_ChkFrame $02, .obj2
	jp   .anim ; We never get here
; --------------- frames #0-1 ---------------
.obj0:
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH +$0400
.obj0_cont:
	jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStartFast .chkEnd
		mMvC_SetMoveH +$0400
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveInputReader_Eiji ===============
; Special move input checker for EIJI.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Eiji:
	mMvIn_Validate Eiji

.chkGround:
	; Easy routes follow the same facing-relative semantics as KOF96:
	; F / DF / D / DB / B, then completed DF / DB super motions.
	mMvIn_ChkEasyDir MoveInit_Eiji_Kikouhou, MoveInit_Eiji_KotsuHazakiKiri, MoveInit_Eiji_Zantetsuha, MoveInit_Eiji_KageUtsushi, MoveInit_Eiji_RyuuEijin, MoveInit_Eiji_ZantetsuTourouken, MoveInputReader_Eiji_NoMove
	mMvIn_ChkGA Eiji, .chkPunch, .chkKick

.chkPunch:
	; DFDB+P -> Zantetsuha
	mMvIn_ChkDir MoveInput_DFDB, MoveInit_Eiji_Zantetsuha
	; BDF+P -> Ryuu Eijin
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Eiji_RyuuEijin
	; DB+P -> Kasumi Geri
	mMvIn_ChkDir MoveInput_DB, MoveInit_Eiji_KasumiGeri
	; DF+P -> Kikouhou
	mMvIn_ChkDir MoveInput_DF, MoveInit_Eiji_Kikouhou
	; End
	jp   MoveInputReader_Eiji_NoMove
.chkKick:
	mMvIn_ValSuper .chkKickNoSuper
	; BDFB+K -> Zantetsu Tourouken
	mMvIn_ChkDir MoveInput_Eiji_BDFB_95, MoveInit_Eiji_ZantetsuTourouken
.chkKickNoSuper:
	; FDB+K -> Kotsu Hazaki Kiri
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Eiji_KotsuHazakiKiri
	; DF+K -> Tenbakyaku
	mMvIn_ChkDir MoveInput_DF, MoveInit_Eiji_Tenbakyaku
	; DB+K -> Kage Utsushi
	mMvIn_ChkDir MoveInput_DB, MoveInit_Eiji_KageUtsushi
	; End
	jp   MoveInputReader_Eiji_NoMove

; =============== MoveInit_Eiji_Kikouhou ===============
MoveInit_Eiji_Kikouhou:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_EIJI_KIKOUHOU_L, MOVE_EIJI_KIKOUHOU_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_KotsuHazakiKiri ===============
MoveInit_Eiji_KotsuHazakiKiri:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_EIJI_KOTSU_HAZAKI_KIRI_L, MOVE_EIJI_KOTSU_HAZAKI_KIRI_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_RyuuEijin ===============
MoveInit_Eiji_RyuuEijin:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_EIJI_RYUU_EIJIN_L, MOVE_EIJI_RYUU_EIJIN_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREFLECT, [hl]
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_KasumiGeri ===============
MoveInit_Eiji_KasumiGeri:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_EIJI_KASUMI_GERI_L, MOVE_EIJI_KASUMI_GERI_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_Zantetsuha ===============
MoveInit_Eiji_Zantetsuha:
	mMvIn_ValProjActive MoveInputReader_Eiji_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_EIJI_ZANTETSUHA_L, MOVE_EIJI_ZANTETSUHA_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_KageUtsushi ===============
MoveInit_Eiji_KageUtsushi:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_EIJI_KAGE_UTSUSHI_L, MOVE_EIJI_KAGE_UTSUSHI_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_Tenbakyaku ===============
MoveInit_Eiji_Tenbakyaku:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_EIJI_TENBAKYAKU_L, MOVE_EIJI_TENBAKYAKU_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags2
	add  hl, bc
	set  PF2B_NOCOLIBOX, [hl]
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInit_Eiji_ZantetsuTourouken ===============
MoveInit_Eiji_ZantetsuTourouken:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_EIJI_ZANTETSU_TOUROUKEN_S
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Eiji_MoveSet

; =============== MoveInputReader_Eiji_MoveSet ===============
MoveInputReader_Eiji_MoveSet:
	scf
	ret
; =============== MoveInputReader_Eiji_NoMove ===============
MoveInputReader_Eiji_NoMove:
	or   a
	ret
; =============== MoveC_Eiji_Kikouhou ===============
; Move code for Eiji's:
; - Kikouhou (MOVE_EIJI_KIKOUHOU_L, MOVE_EIJI_KIKOUHOU_H)
; - Kasumi Geri (MOVE_EIJI_KASUMI_GERI_L, MOVE_EIJI_KASUMI_GERI_H)
MoveC_Eiji_Kikouhou:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
	mMvC_ChkFrame $01, .obj1
	mMvC_ChkFrame $03, .chkEnd
; --------------- frames #0,2 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .anim

		; Depending on the move...
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]
		cp   MOVE_EIJI_KASUMI_GERI_H
		jp   z, .obj1_kasH
		cp   MOVE_EIJI_KASUMI_GERI_L
		jp   z, .obj1_kasL
		jp   .obj1_kik
	.obj1_kasH:
		; Heavy Kasumi Geri -> Move 8px forward
		mMvC_SetMoveH $0800
		jp   .obj1_kasL
	.obj1_kik:
		; Kikouhou -> Play an unique SFX
		; KOF96 removed Eiji's dedicated KOF95 sound command. Use its
		; large-projectile accent rather than an undefined sound-table entry.
		mMvC_PlaySound SCT_PROJ_LG_A
		jp   .anim
	.obj1_kasL:
		; Light Kasumi Geri -> Play a different unique SFX
		mMvC_PlaySound SCT_MULTIHIT
		jp   .anim
; --------------- frame #3 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_RyuuEijin ===============
; Move code for Eiji's Ryuu Eijin (MOVE_EIJI_RYUU_EIJIN_L, MOVE_EIJI_RYUU_EIJIN_H).
MoveC_Eiji_RyuuEijin:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $06, .chkEnd
; --------------- frames #0,1-5 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .anim
		mMvC_PlaySound SCT_PROJ_LG_B
		jp   .anim
; --------------- frame #6 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_Zantetsuha ===============
; Move code for Eiji's Zantetsuha (MOVE_EIJI_ZANTETSUHA_L, MOVE_EIJI_ZANTETSUHA_H).
MoveC_Eiji_Zantetsuha:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
; --------------- frame #0 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		;
		; The heavy version keeps Eiji in the "throw" frame for longer.
		;
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; Seek to anim speed
		cp   MOVE_EIJI_ZANTETSUHA_H		; Doing the heavy version?
		jp   z, .heavy					; If so, jump
	.light:
		ld   [hl], $0A					; iOBJInfo_FrameTotal = $0A
		jp   .anim
	.heavy:
		ld   [hl], $14					; iOBJInfo_FrameTotal = $14
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	; Spawn the projectile at the start
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Eiji_Zantetsuha
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_KotsuHazakiKiri ===============
; Move code for Eiji's:
; - Kotsu Hazaki Kiri (MOVE_EIJI_KOTSU_HAZAKI_KIRI_L, MOVE_EIJI_KOTSU_HAZAKI_KIRI_H)
; - Tenbakyaku (MOVE_EIJI_TENBAKYAKU_L, MOVE_EIJI_TENBAKYAKU_H)
; Fast dash moves, the former dealing damage.
MoveC_Eiji_KotsuHazakiKiri:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		; 8 frames to reach opponent
		mMvC_SetAnimSpeed $08
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A

		; Set dash speed depending on the move strength
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]
		cp   MOVE_EIJI_KOTSU_HAZAKI_KIRI_H
		jp   z, .obj1_setDashH
		cp   MOVE_EIJI_TENBAKYAKU_H
		jp   z, .obj1_setDashH
	.obj1_setDashL: ; Light
		mMvC_SetSpeedH +$0500
		jp   .obj1_cont
	.obj1_setDashH: ; Heavy
		mMvC_ChkMaxPow .obj1_setDashE
		mMvC_SetSpeedH +$0600
		jp   .obj1_cont
	.obj1_setDashE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
.obj1_cont:

	;
	; Both Kotsu Hazaki Kiri and Tenbakyaku have the player move forward at a constant speed.
	;
	; Kotsu Hazaki Kiri deals damage, so it has a few extra frames for the damage animation
	; which are skipped by Tenbakyaku.
	;

	; Move at that fixed speed
	call OBJLstS_ApplyXSpeed
	; If the frame ends, skip to #5
	mMvC_ValFrameEnd .chkNear
		mMvC_SetFrame $05, $04
		jp   .ret

.chkNear:

	; If the player is doing Kotsu Hazaki Kiri and is within $38px from the opponent, continue to #2
	ld   hl, iPlInfo_MoveId
	add  hl, bc
	ld   a, [hl]
	cp   MOVE_EIJI_TENBAKYAKU_L		; Doing the light one?
	jp   z, .anim					; If so, skip
	cp   MOVE_EIJI_TENBAKYAKU_H		; Doing the heavy one?
	jp   z, .anim					; If so, skip
	mMvIn_ValClose .anim, $38		; Distance check
		mMvC_SetFrame $02, $00
		jp   .ret
; --------------- frame #2 ---------------
; Post-hit animation.
.obj2:
	mMvC_DoFrictionH $0080
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $03
		jp   .anim
; --------------- frame #3 ---------------
; Post-hit animation.
.obj3:
	mMvC_DoFrictionH $0080
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		jp   .anim
; --------------- frame #4 ---------------
; Post-hit animation.
.obj4:
	mMvC_DoFrictionH $0080
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $02
		jp   .anim
; --------------- frame #5 ---------------
; Recovery.
.chkEnd:
	mMvC_DoFrictionH $0100
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_KageUtsushi ===============
; Move code for Eiji's Kage Utsushi (MOVE_EIJI_KAGE_UTSUSHI_L, MOVE_EIJI_KAGE_UTSUSHI_H).
MoveC_Eiji_KageUtsushi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .chkEnd
	jp   .doGravity ; We never get here
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		; Set manual ctrl for near check
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set jumpkick settings
		mMvC_ChkMove MOVE_EIJI_KAGE_UTSUSHI_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0400
		jp   .doGravity
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0400
		mMvC_SetSpeedV -$0500
		jp   .doGravity
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV -$0500
		jp   .doGravity
.obj1_cont:
	; Switch to #2 only when close to the opponent
	mMvIn_ValClose .doGravity
		mMvC_SetFrame $02, $00
		jp   .ret
; --------------- frame #2 ---------------
; Kick loop
.obj2:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $05, HITTYPE_HIT_MID0, PF3_CONTHIT
		jp   .doGravity
; --------------- frame #3 ---------------
; Kick loop
.obj3:
	; If we didn't touch the ground by the end of #3, loop to #2
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $05, HITTYPE_HIT_MID1, PF3_CONTHIT
		mMvC_SetFrameOnEnd $02
		jp   .doGravity
; --------------- common gravity check / frames #1-3 ---------------
.doGravity:
	; Switch to #4 when touching the ground
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $04, $05
		jp   .ret
; --------------- frame #4 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Eiji_ZantetsuTourouken ===============
; Move code for Eiji's Zantetsu Tourouken (MOVE_EIJI_ZANTETSU_TOUROUKEN_S).
; See also: MoveC_Iori_KinYaOtome
MoveC_Eiji_ZantetsuTourouken:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret

	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .setDamage0
		mMvC_ChkFrame $03, .setDamage1
		mMvC_ChkFrame $05, .setDamage1
		mMvC_ChkFrame $07, .setDamage1
		mMvC_ChkFrame $09, .setDamage1
		mMvC_ChkFrame $0B, .setDamage1
		mMvC_ChkFrame $0D, .setDamage1
		mMvC_ChkFrame $0F, .setDamage1
		mMvC_ChkFrame $11, .setDamage1
		mMvC_ChkFrame $12, .setDamage1_chkOtherBlock
		mMvC_ChkFrame $13, .anim
		mMvC_ChkFrame $14, .chkEnd
		mMvC_ChkFrame $15, .setDamageFinisher
	jp   .setDamage0_chkOtherBlock
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $09
		jp   .anim
; --------------- frame #1 ---------------
; Run towards the opponent.
; We have $12 frames to hit the opponent, otherwise the move ends.
.obj1:
	mMvC_ValFrameStart .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		; Move forward near 8px/frame at the start
		mMvC_SetSpeedH +$07FF
.obj1_cont:
	; Move forwards. If the frame ends, switch to #15
	call OBJLstS_ApplyXSpeed
	mMvC_ValFrameEnd .obj1_chkGuard
		mMvC_SetFrame $15, $08
		jp   .ret
.obj1_chkGuard:
	;
	; Continue moving forwards until we collided (last frame) with the opponent.
	;
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]			; Did we reach?
	jp   z, .obj1_chkGuard_noHit		; If not, skip
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]				; Is the opponent invulnerable?
	jp   nz, .obj1_chkGuard_noHit		; If so, skip
	bit  PF1B_HITRECV, [hl]				; Did the opponent get hit?
	jp   z, .obj1_chkGuard_noHit		; If not, skip

	bit  PF1B_GUARD, [hl]				; Is the opponent blocking?
	jp   nz, .obj1_chkGuard_slowdown	; If so, the slowdown significantly

	.obj1_chkGuard_noGuard:
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		mMvC_SetFrame $02, $00
		mMvC_SetSpeedH $0000
		jp   .ret
.obj1_chkGuard_slowdown:
	mMvC_SetSpeedH +$0100
.obj1_chkGuard_noHit:
	jp   .anim

; --------------- odd frames #3,5,7,9,B,D,F - line damage + block check ---------------
.setDamage1:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		jp   .chkOtherEscape
; --------------- frame #2 ---------------
.setDamage0:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		jp   .anim
; --------------- even frames - line damage ---------------
.setDamage0_chkOtherBlock:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		jp   .chkOtherEscape
; --------------- frame #12 - line damage + block check ---------------
.setDamage1_chkOtherBlock:
	mMvC_ValFrameStart .anim
	IF REV_LANG_EN
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	ELSE
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
	ENDC
		jp   .anim
; --------------- common escape check ---------------
; Done at the start of about half of the frames.
	.chkOtherEscape:
		;
		; [POI] If the opponent somehow isn't in one of the hit effects
		;       this move sets, hop back instead of continuing.
		;       This can happen if the opponent gets hit by a previously thrown
		;       fireball in the middle of the move.
		;
		ld   hl, iPlInfo_HitTypeIdOther
		add  hl, bc
		ld   a, [hl]
		cp   HITTYPE_HIT_MULTI0	; A == HITTYPE_HIT_MULTI0?
		jp   z, .anim			; If so, skip
		cp   HITTYPE_HIT_MULTI1	; A == HITTYPE_HIT_MULTI1?
		jp   z, .anim			; If so, skip
			ld   a, MOVE_SHARED_HOP_B
			call Pl_SetMove_StopSpeed
			jp   .ret
; --------------- frame #15 ---------------
; Deals the big boy damage.
.setDamageFinisher:
	mMvC_DoFrictionH +$0080
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- frame #14 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== ProjInit_Eiji_Zantetsuha ===============
; Initialized the projectile for Eiji's Zantetsuha (MOVE_EIJI_ZANTETSUHA_L, MOVE_EIJI_ZANTETSUHA_H).
ProjInit_Eiji_Zantetsuha:
	mMvC_PlaySound SCT_PROJ_LG_B

	push bc
		push de

			; --------------- common projectile init code ---------------

			;
			; C flag = If set, we're at max power
			;
			ld   hl, iPlInfo_Pow
			add  hl, bc
			ld   a, [hl]		; A = Pow meter
			cp   PLAY_POW_MAX	; Are we at max power?
			jp   z, .initMaxPow	; If so, jump
			xor  a				; C flag clear
			jp   .getFlags2
		.initMaxPow:
			scf					; C flag set
		.getFlags2:

			;
			; A = Move ID
			;
			ld   hl, iPlInfo_MoveId
			push af				; Preserve C flag for this
				add  hl, bc		; Seek to iPlInfo_MoveId
			pop  af
			ld   a, [hl]		; Read out to A
			push af ; Save A & C flag

				; =============== ProjInitS_InitAndGetOBJInfo ===============
				; Gets the projectile's wOBJInfo for the current player and initializes its common properties.
				;
				; Extracted to ProjInitS_InitAndGetOBJInfo in 96.
				;
				; IN
				; - BC: Ptr to wPlInfo
				; - DE: Ptr to respective wOBJInfo
				; OUT
				; - DE: Ptr to projectile wOBJInfo (wOBJInfo_Pl*Projectile)
				; WIPES
				; - BC

				;
				; A = Player marker (for the tile ID check)
				;
				ld   hl, iPlInfo_PlId
				add  hl, bc
				ld   a, [hl]

				;
				; Seek to the wOBJInfo for the current player's projectile.
				; This will either be a Ptr to wOBJInfo_Pl1Projectile or a Ptr to wOBJInfo_Pl2Projectile.
				; Save its ptr to DE and HL.
				;
				push af ; Pointless push/pop
					push de			; BC = Ptr to player wOBJInfo
					pop  bc
					ld   hl, (OBJINFO_SIZE*2)+iOBJInfo_Status
					add  hl, bc		; Seek to 2 slots after
					push hl
					pop  de			; Copy it to DE

					;
					; Show the projectile
					;
					ld   [hl], OST_VISIBLE
				pop  af

				;
				; Set the tile ID base for the projectile depending on the player we're playing as.
				; The values must be consistent with that's written in Play_LoadProjectileOBJInfo
				;
				or   a				; iPlInfo_PlId != PL1?
				jp   nz, .tileId2P	; If so, jump
			.tileId1P:
				ld   hl, iOBJInfo_TileIDBase
				add  hl, de		; Seek to iOBJInfo_TileIDBase
				ld   [hl], $80	; Graphics from $8800
				jp   .tileIdRet
			.tileId2P:
				ld   hl, iOBJInfo_TileIDBase
				add  hl, de		; Seek to iOBJInfo_TileIDBase
				ld   [hl], $A6	; Graphics from $8A60 in KOF96
			.tileIdRet:
				; ==============================


				; --------------- main ---------------

				; Set code pointer
				ld   hl, iOBJInfo_Play_CodeBank
				add  hl, de
				ld   [hl], BANK(ProjC_Horz)	; BANK $03 ; iOBJInfo_Play_CodeBank
				inc  hl
				ld   [hl], LOW(ProjC_Horz)	; iOBJInfo_Play_CodePtr_Low
				inc  hl
				ld   [hl], HIGH(ProjC_Horz)	; iOBJInfo_Play_CodePtr_High

				; Write sprite mapping ptr for this projectile.
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Eiji_Zantetsuha)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Eiji_Zantetsuha)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Eiji_Zantetsuha)	; iOBJInfo_OBJLstPtrTbl_High
				inc  hl
				ld   [hl], $00	; iOBJInfo_OBJLstPtrTblOffset


				; Set animation speed.
				ld   hl, iOBJInfo_FrameLeft
				add  hl, de
				ld   [hl], $00	; iOBJInfo_FrameLeft
				inc  hl
				ld   [hl], ANIMSPEED_INSTANT	; iOBJInfo_FrameTotal

				; Set priority value
				ld   hl, iOBJInfo_Play_Priority
				add  hl, de
				ld   [hl], $01

				; Set initial position relative to the player's origin

				; =============== OBJLstS_Overlap ===============
				; Moves an wBJInfo to exactly overlap another one.
				; This copies the coordinates and OBJLstFlags from the source (BC) to destination (DE).
				;
				; Extracted to OBJLstS_Overlap in 96.
				;
				; IN
				; - DE: Ptr to the wOBJInfo structure to be moved
				; - BC: Ptr to target wOBJInfo structure (the "other" one)
				push bc
					;
					; Set up source and destination pointers
					;

					; BC = Ptr to source iOBJInfo_X
					ld   hl, iOBJInfo_X
					add  hl, bc			; HL = BC + iOBJInfo_X
					push hl
					pop  bc				; Move back to BC

					; DE = Ptr to destination iOBJInfo_X
					ld   hl, iOBJInfo_X
					add  hl, de			; HL = DE + iOBJInfo_X

					;
					; Copy the next 4 bytes over (iOBJInfo_X-iOBJInfo_YSub)
					;
			REPT 4
					ld   a, [bc]	; A = Source byte
					inc  bc			; SrcPtr++
					ldi  [hl], a	; Write to dest; DestPtr++
			ENDR
				pop  bc

				;
				; Copy over the byte with sprite mapping flags
				;

				; A = Source iOBJInfo_OBJLstFlags
				ld   hl, iOBJInfo_OBJLstFlags
				add  hl, bc
				ld   a, [hl]
				; HL = Ptr to dest iOBJInfo_OBJLstFlags
				ld   hl, iOBJInfo_OBJLstFlags
				add  hl, de
				; Write it over
				ld   [hl], a
				; ==============================
				mMvC_SetMoveH +$1000
				mMvC_SetMoveV -$0800
			pop  af	; Restore A & C flag

			;
			; Determine projectile horizontal speed.
			;

			jp   nc, .fldMaxPow				; Are we at max power? If not, jump
			cp   MOVE_EIJI_ZANTETSUHA_H		; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_EIJI_ZANTETSUHA_H		; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow			; If so, jump
		.fldLight:
			ld   hl, +$0100
			jp   .setSpeed
		.fldHeavyMaxPow:
			ld   hl, +$0200
			jp   .setSpeed
		.fldHeavy:
			ld   hl, +$0400
		.setSpeed:
			call Play_OBJLstS_SetSpeedH_ByXFlipR

		pop  de
	pop  bc
	ret
