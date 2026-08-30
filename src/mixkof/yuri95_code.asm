; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Yuri_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .doGravity0
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .obj6
		mMvC_ChkFrame $07, .doGravity1
		mMvC_ChkFrame $08, .doGravity1
		mMvC_ChkFrame $09, .obj9
		mMvC_ChkFrame $0A, .doGravity1
		mMvC_ChkFrame $0B, .anim
		mMvC_ChkFrame $0C, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
; Hold onto opponent.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $04
		mMvC_SetDamageNext $06, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
; Backjump.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH -$0200
		mMvC_SetSpeedV -$0500
.obj1_cont:
	mMvC_ValFrameEnd .doGravity0
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, $00
		jp   .doGravity0
; --------------- frame #2 ---------------
; Throw the opponent far away, moving now forward.
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		mMvC_SetSpeedH +$0040
		mMvC_SetSpeedV +$0000
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_MID_UB_NOSTUN, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #3 ---------------
; Enable manual control for the gravity check, and finish backjump.
.obj3:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetSpeedH +$0040
		mMvC_SetSpeedV +$0000
		jp   .anim
; --------------- common gravity check / frames #1,3,4 ---------------
; When landing on the ground, switch to #5.
.doGravity0:
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $05, $0A
		jp   .ret
; --------------- frame #5 ---------------
; Delay after landing.
.obj5:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $03
		jp   .anim
; --------------- frame #6 ---------------
; Do a second jump while the opponent is flung away.
.obj6:
	mMvC_ValFrameStartFast .obj6_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH +$0000
		mMvC_SetSpeedV -$0480
.obj6_cont:
	mMvC_ValFrameEnd .doGravity1
		mMvC_SetAnimSpeed $02
		jp   .doGravity1
; --------------- frame #9 ---------------
; Enable manual control for gravity check.
.obj9:
	mMvC_ValFrameEnd .doGravity1
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doGravity1
; --------------- common gravity check / frames #6-A ---------------
; When landing now, the throw has finished.
.doGravity1:
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $0B, $03
		jp   .ret
; --------------- frame #C ---------------
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
	
; =============== MoveC_Yuri_KickFH ===============
; Move code for Yuri's Far Heavy Kick (MOVE_SHARED_KICK_FH).
MoveC_Yuri_KickFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0300
.obj1_cont:
	mMvC_ChkGravityHV $0060, .anim
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $02, $03
		jp   .ret
; --------------- frame #2 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret 
	
; =============== MoveInputReader_Yuri ===============
; Special move input checker for YURI.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Yuri:
	mMvIn_Validate Yuri
.chkAir:
	jp   MoveInputReader_Yuri_NoMove ; No Air Moves, dumb check
	
.chkGround:
	;             SELECT + B                    SELECT + A
	mMvIn_ChkEasyDir MoveInit_Yuri_KoOuKen, MoveInit_Yuri_KuuGa, MoveInit_Yuri_RaiOhKen, MoveInit_Yuri_SaiHa, MoveInit_Yuri_HyakuRetsuBinta, MoveInit_Yuri_HienHouOuKyaku, MoveInit_Yuri_HienHouOuKyaku
	mMvIn_ChkGA Yuri, .chkPunch, .chkKick
	
.chkPunch:
	; FBDF+P -> Haoh Shoukou Ken
	mMvIn_ChkDir MoveInput_FBDF, MoveInit_Yuri_HaohShoukouKen
	; FDF+P -> Kuu Ga
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Yuri_KuuGa
	; DF+P -> Ko Ou Ken
	mMvIn_ChkDir MoveInput_DF, MoveInit_Yuri_KoOuKen
	; FDB+P -> Hyaku Retsu Binta
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Yuri_HyakuRetsuBinta
	; DB+P -> Sai Ha
	mMvIn_ChkDir MoveInput_DB, MoveInit_Yuri_SaiHa
	; End
	jp   MoveInputReader_Yuri_NoMove
.chkKick:
	mMvIn_ValSuper .chkKickNoSuper
	; FBFDB+K -> Hien Hou'ou Kyaku
	mMvIn_ChkDir MoveInput_FDBFDB, MoveInit_Yuri_HienHouOuKyaku
.chkKickNoSuper:
	; DF+K -> Rai'oh Ken
	mMvIn_ChkDir MoveInput_DF, MoveInit_Yuri_RaiOhKen
	; End
	jp   MoveInputReader_Yuri_NoMove

; =============== MoveInit_Yuri_KoOuKen ===============
MoveInit_Yuri_KoOuKen:
	mMvIn_ValProjActive MoveInputReader_Yuri_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_YURI_KO_OU_KEN_L, MOVE_YURI_KO_OU_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInit_Yuri_SaiHa ===============
MoveInit_Yuri_SaiHa:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_YURI_SAI_HA_L, MOVE_YURI_SAI_HA_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInit_Yuri_HyakuRetsuBinta ===============
MoveInit_Yuri_HyakuRetsuBinta:
	;
	; The heavy version of this command throw has Yuri run forwards,
	; so it doesn't perform a standard command throw check here.
	;
	; Meanwhile the light version does it at a standstill, so the
	; check is made here.
	;
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_ChkLHP .heavy
.light:
	; Check throw range and other things
	mMvIn_ValStartCmdThrow_StdColi Yuri
		; OK, start the throw
		ld   a, MOVE_YURI_HYAKU_RETSU_BINTA_L
		call MoveInputS_SetSpecMove_StopSpeed
		; Invulnerable during the command throw 
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		set  PF1B_INVULN, [hl]
		jp   MoveInputReader_Yuri_MoveSet
.heavy:
	; Set the forwards run
	ld   a, MOVE_YURI_HYAKU_RETSU_BINTA_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInit_Yuri_KuuGa ===============
MoveInit_Yuri_KuuGa:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_YURI_KUU_GA_L, MOVE_YURI_KUU_GA_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInit_Yuri_RaiOhKen ===============
MoveInit_Yuri_RaiOhKen:
	mMvIn_ValProjActive MoveInputReader_Yuri_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_YURI_RAI_OH_KEN_L, MOVE_YURI_RAI_OH_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInit_Yuri_HaohShoukouKen ===============
MoveInit_Yuri_HaohShoukouKen:
	mMvIn_ValProjActive MoveInputReader_Yuri_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_YURI_HAOH_SHOUKOU_KEN_L, MOVE_YURI_HAOH_SHOUKOU_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInit_Yuri_HienHouOuKyaku ===============
MoveInit_Yuri_HienHouOuKyaku:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_YURI_HIEN_HOU_OU_KYA_KU_S
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Yuri_MoveSet
	
; =============== MoveInputReader_Yuri_MoveSet ===============
MoveInputReader_Yuri_MoveSet:
	scf  
	ret  
; =============== MoveInputReader_Yuri_NoMove ===============
MoveInputReader_Yuri_NoMove:
	or   a
	ret  
	
; =============== MoveC_Yuri_KoOuKen ===============
; Move code for Yuri's Ko-Ou Ken (MOVE_YURI_KO_OU_KEN_L, MOVE_YURI_KO_OU_KEN_H).
; See also: MoveC_Ryo_KoOuKenG
MoveC_Yuri_KoOuKen:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
	
		; How long to stay in #2 after the projectile spawns?
		; The heavy version stays for longer.
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]				; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de					; HL = Ptr to anim speed
		cp   MOVE_YURI_KO_OU_KEN_H	; Doing the heavy version?
		jp   z, .obj1_setSpeedH		; If so, jump
	.obj1_setSpeedL:
		ld   [hl], $08
		jp   .anim
	.obj1_setSpeedH:
		ld   [hl], $10
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Ryo_KoOuKenG
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Yuri_SaiHa ===============
; Move code for Yuri's Sai Ha (MOVE_YURI_SAI_HA_L, MOVE_YURI_SAI_HA_H).
MoveC_Yuri_SaiHa:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
	mMvC_ChkFrame $00, .obj0
	mMvC_ChkFrame $01, .obj1
	mMvC_ChkFrame $02, .obj2
	mMvC_ChkFrame $03, .obj3
	mMvC_ChkFrame $04, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SCT_MOVEJUMP_A
		jp   .anim
; --------------- frame #1 ---------------
; Fire frame #0.
.obj1:
	; At the start of the frame, move player forward by a certain amount
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_ChkMove MOVE_YURI_SAI_HA_H, .obj1_setMoveH
	.obj1_setMoveL: ; Light
		ld   hl, +$0100
		jp   .obj1_setMove
	.obj1_setMoveH: ; Heavy
		mMvC_ChkMaxPow .obj1_setMoveE
		ld   hl, +$0700
		jp   .obj1_setMove
	.obj1_setMoveE: ; Max Power Heavy
		ld   hl, +$0C00
	.obj1_setMove:
		call Play_OBJLstS_MoveH_ByXFlipR
.obj1_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		jp   .anim
; --------------- frame #2 ---------------
; Fire frame #1.
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		jp   .anim
; --------------- frame #3 ---------------
; Fire frame #2.
.obj3:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
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
	
; =============== MoveC_Yuri_RaiOhKen ===============
; Move code for Yuri's Rai'oh Ken (MOVE_YURI_RAI_OH_KEN_L, MOVE_YURI_RAI_OH_KEN_H).
; Jump + diagonal down projectile
MoveC_Yuri_RaiOhKen:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
	mMvC_ChkFrame $00, .obj0
	mMvC_ChkFrame $01, .obj1
	mMvC_ChkFrame $03, .obj3
	mMvC_ChkFrame $04, .obj4
	mMvC_ChkFrame $05, .doGravity
	mMvC_ChkFrame $06, .chkEnd
; --------------- frame #2 ---------------
; Jump continuation.
	jp   .anim
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
; Jump.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Pick initial jump speed
		mMvC_ChkMove MOVE_YURI_RAI_OH_KEN_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		ld   hl, -$0600
		jp   .obj1_setJump
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		ld   hl, -$0700
		jp   .obj1_setJump
	.obj1_setJumpE: ; Max Power Heavy
		ld   hl, -$0800
	.obj1_setJump:
		call Play_OBJLstS_SetSpeedV
.obj1_cont:
	; Wait for Y Speed > -$06 before continuing to #2
	mMvC_ValNextFrameOnGtYSpeed -$06, ANIMSPEED_NONE, .doGravity
		;--
		; mMvC_SetAnimSpeed $03
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de
		ld   [hl], $03
		;--
		jp   .doGravity
; --------------- frame #3 ---------------
; Near the peak of jump, spawn projectile.
.obj3:
	mMvC_ValFrameStartFast .obj3_cont
		call ProjInit_Yuri_RaiOhKen
.obj3_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $02
		jp   .doGravity
; --------------- frame #4 ---------------
; Setup for gravity check
.obj4:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doGravity
; --------------- common gravity check ---------------
.doGravity:
	; Continue to #6 when touching the ground
	mMvC_ChkGravityHV $0060, .anim
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $06, $03
		jp   .ret
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
	
; =============== MoveC_Yuri_HaohShoukouKen ===============
; Move code for Yuri's Haoh Shoukou Ken. (MOVE_YURI_HAOH_SHOUKOU_KEN_L, MOVE_YURI_HAOH_SHOUKOU_KEN_H)
; See also: MoveC_Ryo_HaohShoukouKen
MoveC_Yuri_HaohShoukouKen:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
	jp   .anim
.obj1:
	mMvC_ValFrameEnd .anim
	
		; How long to stay in #2 after the projectile spawns?
		; The heavy version stays for longer.
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]						; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de							; HL = Ptr to anim speed
		cp   MOVE_YURI_HAOH_SHOUKOU_KEN_H	; Doing the heavy version?
		jp   z, .obj1_setSpeedH				; If so, jump
	.obj1_setSpeedL:
		ld   [hl], $08
		jp   .anim
	.obj1_setSpeedH:
		ld   [hl], $10
		jp   .anim
; --------------- frame #2 ---------------	
.obj2:
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Ryo_HaohShoukouKen
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------	
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Yuri_HyakuRetsuBintaL ===============
; Move code for the light version of Yuri's Haoh Shoukou Ken. (MOVE_YURI_HYAKU_RETSU_BINTA_L).
; This is a straight command throw that has Yuri slap the opponent.
MoveC_Yuri_HyakuRetsuBintaL:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $02, .slap1
		mMvC_ChkFrame $04, .slap0
		mMvC_ChkFrame $06, .slap1
		mMvC_ChkFrame $08, .slap0
		mMvC_ChkFrame $0A, .slap1
		mMvC_ChkFrame $0C, .slap0
		mMvC_ChkFrame $0E, .slap1
		mMvC_ChkFrame $10, .slap0
		mMvC_ChkFrame $12, .slap1
		mMvC_ChkFrame $14, .obj14
		mMvC_ChkFrame $15, .obj15
		mMvC_ChkFrame $16, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
; Startup grab
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
		jp   .anim
; --------------- frame #4,8,C,10 ---------------
; Damage frame #0
.slap0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
		jp   .chkOtherEscape
; --------------- frame #2,6,A,E,12 ---------------
; Damage frame #1
.slap1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, $00
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
		; Otherwise, transition to hop
		ld   a, MOVE_SHARED_HOP_B
		call Pl_SetMove_StopSpeed
		; End the throw sequence
		xor  a
		ld   [wPlayPlThrowActId], a
		jp   .ret
; --------------- frame #14 ---------------
.obj14:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #15 ---------------
.obj15:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $14
		jp   .anim
; --------------- frame #16 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		mMvC_EndThrow
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Yuri_HyakuRetsuBintaH ===============
; Move code for the heavy version of Yuri's Haoh Shoukou Ken. (MOVE_YURI_HYAKU_RETSU_BINTA_H).
; This is a run motion that transitions to the command throw move (light version).
MoveC_Yuri_HyakuRetsuBintaH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
; Run startup.
.obj0:
IF FIX_BUGS
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $10
		jp   .anim
ELSE
	mMvC_ValFrameEnd MoveC_Yuri_KuuGaL.anim
		mMvC_SetAnimSpeed $10
		jp   MoveC_Yuri_KuuGaL.anim
ENDC
; --------------- frame #1 ---------------
; Run forwards.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound $02
		mMvC_ChkMaxPow .obj1_setRunSpeedMaxPow
	.obj1_setRunSpeedNorm:
		mMvC_SetSpeedH +$0500
		jp   .movePl
	.obj1_setRunSpeedMaxPow:
		mMvC_SetSpeedH +$0680
		jp   .movePl
.obj1_cont:
	mMvC_ValFrameEnd .canStartThrow
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		; Fall-through
; --------------- .canStartThrow ---------------
; Attempts to start the command throw if we're close and the opponent didn't block the hit.
.canStartThrow:
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]			; Is the opponent invulnerable?
	jp   nz, .canStartThrow_no		; If so, skip
	bit  PF1B_GUARD, [hl]			; Is the opponent blocking?
	jp   nz, .canStartThrow_no		; If so, skip
	
	; Opponent must be on the ground (what's the air flag?)
	ld   hl, iPlInfo_OBJInfoYOther
	add  hl, bc
	ld   a, [hl]
	cp   PL_FLOOR_POS
	jp   nz, .canStartThrow_no
	
	;--
	;
	; The player must be close to the opponent.
	; Unlike everything else, this requires the player's collision boxes to make contact.
	;
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	ld   a, [hl]
	cp   (1<<PCFB_PUSHED)|(1<<PCFB_PUSHEDOTHER)		; Are we both pushing and being pushed?
	jp   z, .canStartThrow_yes			; If so, jump
	
	; If the opponent is dodging, they have no collision box, so the above check fails.
	; So in this case we do the normal distance check.
	ld   hl, iPlInfo_MoveIdOther
	add  hl, bc
	ld   a, [hl]
	cp   MOVE_SHARED_ROLL_F
	jp   nz, .canStartThrow_no
	mMvIn_ValClose .canStartThrow_no
	;--
	
.canStartThrow_yes:
	call MoveInputS_TryStartCommandThrow_StdColi
	jp   nc, .canStartThrow_no
	call Task_PassControlFar
	ld   a, PLAY_THROWACT_NEXT03
	ld   [wPlayPlThrowActId], a
		; Align player to the ground
		ld   hl, iOBJInfo_Y
		add  hl, de
		ld   [hl], PL_FLOOR_POS
		; Start the command throw move
		ld   a, MOVE_YURI_HYAKU_RETSU_BINTA_L
		call MoveInputS_SetSpecMove_StopSpeed
		; Set initial damage
		mMvC_SetDamageNext $08, HITTYPE_HIT_MULTI1, PF3_HEAVYHIT
		jp   .ret	
.canStartThrow_no:

; --------------- common player movement ---------------
; Run forwards
.movePl:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- frame #12 ---------------
; Whiff.
.chkEnd:
	; Slow down at 1px/frame. End the move when we stop moving.
	mMvC_ChkFrictionH $0100, .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Yuri_KuuGaL ===============
; Move code for the light version of Yuri's Kuu Ga. (MOVE_YURI_KUU_GA_L).
; Straight uppercut.
MoveC_Yuri_KuuGaL:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
; --------------- frame #0 ---------------
; Startup
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
		jp   .anim
; --------------- frame #1 ---------------
; Uppercut #1
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		; Move forward 8px
		mMvC_SetMoveH +$0800
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Determine jump speed, based on the attack strength.
		; This is checked in an unusual way compared to other moves do it.
		ld   hl, iPlInfo_MoveDamageFlags3
		add  hl, bc
		ld   a, [hl]
		cp   PF3_HEAVYHIT			; Hit marked as heavy?
		jp   z, .obj1_setJumpH		; If so, jump
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0600
		jp   .obj1_cont
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0700
		jp   .obj1_cont
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0800
.obj1_cont:
	; Wait for Y Speed > -$06 before continuing to #2
	mMvC_NextFrameOnGtYSpeed -$06, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #2 ---------------
; Uppercut #2
.obj2:
	mMvC_SetSpeedH $0040
; --------------- common gravity check ---------------	
.doGravity:
	; Switch to #3 when landing
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $03, $05
		jp   .ret
; --------------- frame #3 ---------------
; Recovery
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Yuri_KuuGaL ===============
; Move code for the heavy version of Yuri's Kuu Ga. (MOVE_YURI_KUU_GA_H).
; Forward dash followed by an uppercut.
MoveC_Yuri_KuuGaH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
; Everything is here.
.obj0:
	; At the start of the frame, initialize the dash
	mMvC_ValFrameStartFast .chkMove
		; Move forwards 8px
		mMvC_SetMoveH +$0800
		
		; Determine the initial dash speed
		mMvC_ChkMaxPow .setSpeedMaxPow
	.setSpeedNorm: ; Light/Heavy
		mMvC_SetSpeedH +$0400 ; 4px/frame forward
		jp   .chkMove
	.setSpeedMaxPow: ; Max Power
		mMvC_SetSpeedH +$0600 ; 6px/frame forward
; --------------- common movement check ---------------
.chkMove:
	; Move forwards, slowing down by 0.25px/frame. If we stop, trigger the DP.
	mMvC_DoFrictionH $0040
	jp   c, .startDP
	
	; If the animation ended, trigger the DP (reverse of mMvC_ValFrameEnd)
	call OBJLstS_IsInternalFrameAboutToEnd
	jp   c, .startDP
	
	; The slide has an hitbox. If it hits the opponent, trigger the DP.
	mMvC_ValHit .anim, .anim ; and if it didn't yet, continue the animation
	
.startDP:
	; Switch to the light version of the move, which is the uppercut.
	ld   a, MOVE_YURI_KUU_GA_L
	call MoveInputS_SetSpecMove_StopSpeed
	; With these initial damage settings
	mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	jp   .ret
	
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Yuri_HienHouOuKyaKu ===============
; Move code for Yuri's Hien Hou Ou Kya Ku (MOVE_YURI_HIEN_HOU_OU_KYA_KU_S).
; Multi-hit air kick move.
MoveC_Yuri_HienHouOuKyaKu:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .anim
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .kickStart
		mMvC_ChkFrame $05, .objOdd
		mMvC_ChkFrame $07, .objOdd
		mMvC_ChkFrame $09, .objOdd
		mMvC_ChkFrame $0B, .objOdd
		mMvC_ChkFrame $0D, .objOdd
		mMvC_ChkFrame $0F, .objOdd
		mMvC_ChkFrame $11, .kickEnd
		mMvC_ChkFrame $12, .obj12
		mMvC_ChkFrame $13, .chkEnd
	jp   .objEven
; --------------- frame #2 ---------------
.obj2:
	; Prepare for manual jump control
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #3 ---------------
.obj3:
	; Initialize the jump at the start
	mMvC_ValFrameStartFast .obj3_chkGuard
		mMvC_PlaySound SCT_MOVEJUMP_A
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH +$07FF
		mMvC_SetSpeedV -$0200
		jp   .doGravity
.obj3_chkGuard:
	;
	; Continue the jump until hitting the opponent.
	;
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]			; Did we reach?
	jp   z, .obj3_chkGuard_doGravity	; If not, skip
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]				; Is the opponent invulnerable?
	jp   nz, .obj3_chkGuard_doGravity	; If so, skip
	bit  PF1B_HITRECV, [hl]				; Did the opponent get hit?
	jp   z, .obj3_chkGuard_doGravity	; If not, skip	
	
	bit  PF1B_GUARD, [hl]				; Is the opponent blocking?
	jp   nz, .obj3_chkGuard_guard		; If so, jump
	.obj3_chkGuard_noGuard:
		; Otherwise, continue to #4
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		mMvC_SetFrame $04, $01
		mMvC_SetSpeedH $0000
		; Force player on the ground
		ld   hl, iOBJInfo_Y
		add  hl, de
		ld   [hl], PL_FLOOR_POS
		jp   .ret
.obj3_chkGuard_guard:
	; If the opponent blocked the hit, slow down considerably.
	; This will still moves us back for overlapping with the opponent.
	mMvC_SetSpeedH $0100
.obj3_chkGuard_doGravity:
	jp   .doGravity
; --------------- frames #5,7,9... ---------------
; Generic damage - odd frames.
; Alongside .objEven is used to alternate between hit effects constantly.
.objOdd:
	mMvC_ValFrameStart .anim
		mMvC_SetMoveV -$0100
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		jp   .chkOtherEscape
; --------------- frame #4 ---------------
; Frame before the odd/even switching.
; This sets the initial jump speed and doesn't check for block yet.
.kickStart:
	mMvC_ValFrameStart .anim
		mMvC_SetMoveV -$0100
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		jp   .anim
; --------------- frames #6,8,A,... ---------------
; Generic damage - even frames.
.objEven:
	mMvC_ValFrameStart .anim
		mMvC_SetMoveV -$0100
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
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
			; Otherwise, transition to backjump
			ld   a, MOVE_SHARED_LAUNCH_UB_REC
			call Pl_SetMove_StopSpeed
			mMvC_SetSpeedH -$0300 ; 3px/frame back
			mMvC_SetSpeedV -$0500 ; 5px/frame up
			jp   .ret
; --------------- frame #11 ---------------
; Frame after the odd/even switching.
; This sets up the final hit that knocks down the opponent.
.kickEnd:
	mMvC_ValFrameStartFast .anim
		mMvC_SetMoveV -$0100
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
		jp   .anim
; --------------- frame #12 ---------------
; Transitions to the far backhop done at the end of the kicks.
.obj12:
	mMvC_ValFrameEnd .anim
		ld   a, MOVE_SHARED_LAUNCH_UB_REC
		call Pl_SetMove_StopSpeed
		mMvC_SetSpeedH -$0300 ; 3px/frame back
		mMvC_SetSpeedV -$0500 ; 5px/frame up
		jp   .ret
; --------------- common gravity check ---------------	
.doGravity:
	mMvC_ChkGravityHV $0030, .anim
		;--
		; Allow special cancel on ground
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $13, $07
		jp   .ret
; --------------- frame #13 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== ProjInit_Yuri_RaiOhKen ===============
; Initializes the projectile for Yuri's Rai'oh Ken (MOVE_YURI_RAI_OH_KEN_L, MOVE_YURI_RAI_OH_KEN_H)
ProjInit_Yuri_RaiOhKen:
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
				ld   [hl], $A6	; Graphics from $8A60
			.tileIdRet:
				; ==============================
			

				; --------------- main ---------------

				; Set code pointer
				ld   hl, iOBJInfo_Play_CodeBank
				add  hl, de
				ld   [hl], BANK(ProjC_Yuri_RaiOhKen)	; BANK $02 ; iOBJInfo_Play_CodeBank
				inc  hl
				ld   [hl], LOW(ProjC_Yuri_RaiOhKen)	; iOBJInfo_Play_CodePtr_Low
				inc  hl
				ld   [hl], HIGH(ProjC_Yuri_RaiOhKen)	; iOBJInfo_Play_CodePtr_High

				; Write sprite mapping ptr for this projectile.
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Yuri_RaiOhKen)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Yuri_RaiOhKen)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Yuri_RaiOhKen)	; iOBJInfo_OBJLstPtrTbl_High
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
				ld   [hl], $00

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
			cp   MOVE_YURI_RAI_OH_KEN_H		; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_YURI_RAI_OH_KEN_H		; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow			; If so, jump
		.fldLight:
			mMvC_SetSpeedH +$0100
			mMvC_SetSpeedV +$0100
			jp   .end
		.fldHeavyMaxPow:
			mMvC_SetSpeedH +$0200
			mMvC_SetSpeedV +$0180
			jp   .end
		.fldHeavy:
			mMvC_SetSpeedH +$0400
			mMvC_SetSpeedV +$0300
		.end:
		pop  de
	pop  bc
	ret
	
; =============== ProjC_Yuri_RaiOhKen ===============
; Projectile code for Yuri's Rai'oh Ken (MOVE_YURI_RAI_OH_KEN_L, MOVE_YURI_RAI_OH_KEN_H).
; A fireball that travels diagonally down, exploding on the ground.
ProjC_Yuri_RaiOhKen:
	mMvC_StartChkFrameInt
		mMvC_ChkFrame $00, .move
		mMvC_ChkFrame $01, .move
		mMvC_ChkFrame $07, .despawn
; --------------- frames #2-6 ---------------
; Part of the ground explosion animation.
	jp   .anim
; --------------- frames #0-1 ---------------	
.move:
	; If the opponent got hit by the projectile, despawn it
	call ExOBJS_Play_ChkHitModeAndMoveH
	jp   c, .despawn
	
	; Handle the diagonal down movement.
	; When it touches the ground, switch to #2
	mMvC_ChkGravityV $0000, .explode
	
	; Force the animation to stay on frame #0.
	; As soon as we're set to #1, reset it back to #0.
	mMvC_StartChkFrameInt
		cp   $01*OBJLSTPTR_ENTRYSIZE	; On frame #1?
		jp   nz, .anim					; If not, skip
	ld   [hl], $00*OBJLSTPTR_ENTRYSIZE	; Otherwise, loop back to #0
	ret
	
.explode:
	; Switch to #2
	ld   hl, iOBJInfo_OBJLstPtrTblOffset
	add  hl, de
	ld   [hl], $02*OBJLSTPTR_ENTRYSIZE
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
	ret
.despawn:
	call OBJLstS_Hide
	ret
	

ProjInit_Ryo_KoOuKenG:
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
				ld   [hl], $A6	; Graphics from $8A60
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Ryo_KoOuKenG)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Ryo_KoOuKenG)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Ryo_KoOuKenG)	; iOBJInfo_OBJLstPtrTbl_High
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
				ld   [hl], $00
	
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
			; The heavy attack check assumes that moves using this projectile
			; always take up the first pair of special move slots.
			;

			jp   nc, .fldMaxPow			; Are we at max power? If not, jump
			cp   MOVE_SPEC_0_H			; Was this an heavy attack?
			jp   z, .fldHeavy			; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_SPEC_0_H			; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow		; If so, jump
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
	

ProjInit_Ryo_HaohShoukouKen:
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
				ld   [hl], $A6	; Graphics from $8A60
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Ryo_HaohShoukouKen)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Ryo_HaohShoukouKen)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Ryo_HaohShoukouKen)	; iOBJInfo_OBJLstPtrTbl_High
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
			; The heavy attack check assumes that moves using this projectile
			; always take up the first pair of special move slots.
			;

			jp   nc, .fldMaxPow			; Are we at max power? If not, jump
			cp   MOVE_SPEC_5_H			; Was this an heavy attack?
			jp   z, .fldHeavy			; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_SPEC_5_H			; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow		; If so, jump
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
	
