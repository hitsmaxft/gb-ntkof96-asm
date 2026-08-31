; Ported and reviewed per-character from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
; Original DFBF input table retained locally because KOF96 has no equivalent.
MoveInput_Kensou_DFBF_95:
	db $04
	db KEY_LEFT,  KEY_LEFT,  $01, $14
	db KEY_RIGHT, KEY_RIGHT, $01, $0A
	db KEY_LEFT,  KEY_LEFT,  $01, $0A
	; KOF95's default GOOD_INPUTS=0 expands gi KEY_DOWN to all direction
	; bits. Preserve the actual shipped table byte ($0F), not the macro token.
	db KEY_DOWN,  KEY_RIGHT|KEY_LEFT|KEY_UP|KEY_DOWN, $01, $FF

; =============== MoveC_Kensou_ThrowG ===============
; Move code for Kensou's ground throw. (MOVE_SHARED_THROW_G).
; See also: MoveC_Kyo_ThrowG
MoveC_Kensou_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MULTI0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $14
		jp   .anim
; --------------- frame #2 ---------------
.chkEnd:
	; Wait for the animation to advance before ending the move
	mMvC_ValFrameEnd .anim
		; And when it does, also reset the throw sequence
		mMvC_EndThrow
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Kensou_PunchFH ===============
; Move code for Kensou's forward heavy punch. (MOVE_SHARED_PUNCH_FH).
MoveC_Kensou_PunchFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .chkEnd
; --------------- frames #0-1 ---------------
	jp   .anim
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
; =============== MoveC_Kensou_KickFH ===============
; Move code for Kensou's forward heavy kick. (MOVE_SHARED_KICK_FH).
; This is a forward kick hop.
MoveC_Kensou_KickFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
; --------------- frame #1 ---------------
.obj1:
	; At the end, enable manual control for the gravity check
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	; Set jump settings at the start of the frame
	mMvC_ValFrameStartFast .chkGravity
		mMvC_PlaySound SFX_HEAVY
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0200
; --------------- gravity check, frame #2 ---------------
.chkGravity:
	; Switch to #3 when touching the ground
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $03, $03
		jp   .ret
; --------------- frame #3 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveInputReader_Kensou ===============
; Special move input checker for KENSOU.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Kensou:
	mMvIn_Validate Kensou

.chkAir:
	;             SELECT + B                          SELECT + A
	mMvIn_ChkEasyDir MoveInit_Kensou_RyuuGakuSai, MoveInit_Kensou_RyuuGakuSai, MoveInit_Kensou_RyuuSouGeki, MoveInit_Kensou_ChouKyuuDan, MoveInit_Kensou_RyuuRenGa, MoveInit_Kensou_ShinryuuTenbuKyaku, MoveInputReader_Kensou_NoMove
	mMvIn_ChkGA Kensou, .chkAirPunch, .chkAirKick

.chkAirPunch:
	; DB+P -> Ryuu Sou Geki
	mMvIn_ChkDir MoveInput_DB, MoveInit_Kensou_RyuuSouGeki
	; End
	jp   MoveInputReader_Kensou_NoMove
.chkAirKick:
	mMvIn_ValSuper .chkAirKickNoSuper
	; DFBF+K -> Shinryuu Tenbu Kyaku
	mMvIn_ChkDir MoveInput_Kensou_DFBF_95, MoveInit_Kensou_ShinryuuTenbuKyaku
.chkAirKickNoSuper:
	; End
	jp   MoveInputReader_Kensou_NoMove

.chkGround:
	;             SELECT + B                          SELECT + A
	mMvIn_ChkEasyDir MoveInit_Kensou_RyuuGakuSai, MoveInit_Kensou_RyuuGakuSai, MoveInit_Kensou_RyuuSouGeki, MoveInit_Kensou_ChouKyuuDan, MoveInit_Kensou_RyuuRenGa, MoveInit_Kensou_ShinryuuTenbuKyaku, MoveInputReader_Kensou_NoMove
	mMvIn_ChkGA Kensou, .chkPunch, .chkKick

.chkPunch:
	; BDF+P -> Ryuu Ren Ga
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Kensou_RyuuRenGa
	; DB+P -> Chou Kyuu Dan
	mMvIn_ChkDir MoveInput_DB, MoveInit_Kensou_ChouKyuuDan
	; End
	jp   MoveInputReader_Kensou_NoMove
.chkKick:
	mMvIn_ValSuper .chkKickNoSuper
	; DFBF+K -> Shinryuu Tenbu Kyaku
	mMvIn_ChkDir MoveInput_Kensou_DFBF_95, MoveInit_Kensou_ShinryuuTenbuKyaku
.chkKickNoSuper:
	; BDB+K -> Ryuu Gaku Sai
	mMvIn_ChkDir MoveInput_BDB, MoveInit_Kensou_RyuuGakuSai
	; End
	jp   MoveInputReader_Kensou_NoMove

; =============== MoveInit_Kensou_ChouKyuuDan ===============
MoveInit_Kensou_ChouKyuuDan:
	mMvIn_ValProjActive MoveInputReader_Kensou_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_KENSOU_CHOU_KYUU_DAN_L, MOVE_KENSOU_CHOU_KYUU_DAN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Kensou_MoveSet

; =============== MoveInit_Kensou_RyuuGakuSai ===============
MoveInit_Kensou_RyuuGakuSai:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_KENSOU_RYUU_GAKU_SAI_L, MOVE_KENSOU_RYUU_GAKU_SAI_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	; Not coming from a super
	ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
	add  hl, bc
	ld   [hl], $00
	jp   MoveInputReader_Kensou_MoveSet

; =============== MoveInit_Kensou_RyuuRenGa ===============
MoveInit_Kensou_RyuuRenGa:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_KENSOU_RYUU_REN_GA_L, MOVE_KENSOU_RYUU_REN_GA_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kensou_MoveSet

; =============== MoveInit_Kensou_RyuuSouGeki ===============
MoveInit_Kensou_RyuuSouGeki:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_KENSOU_RYUU_SOU_GEKI_L, MOVE_KENSOU_RYUU_SOU_GEKI_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kensou_MoveSet

; =============== MoveInit_Kensou_ShinryuuTenbuKyaku ===============
MoveInit_Kensou_ShinryuuTenbuKyaku:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_KENSOU_SHINRYUU_TENBU_KYAKU_S
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Kensou_MoveSet

; =============== MoveInputReader_Kensou_MoveSet ===============
MoveInputReader_Kensou_MoveSet:
	scf
	ret
; =============== MoveInputReader_Kensou_NoMove ===============
MoveInputReader_Kensou_NoMove:
	or   a
	ret

; =============== MoveC_Kensou_ChouKyuuDan ===============
; Move code for Kensou's Chou Kyuu Dan (MOVE_KENSOU_CHOU_KYUU_DAN_L, MOVE_KENSOU_CHOU_KYUU_DAN_H).
; Horizontal projectile.
; See also: MoveC_Athena_PsychoBall
MoveC_Kensou_ChouKyuuDan:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim

		; How long to stay in #2 after the projectile spawns?
		; The heavy version stays for longer.
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]						; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de							; HL = Ptr to anim speed
		cp   MOVE_KENSOU_CHOU_KYUU_DAN_H	; Doing the heavy version?
		jp   z, .obj0_setSpeedH				; If so, jump
	.obj0_setSpeedL:
		ld   [hl], $0E
		jp   .anim
	.obj0_setSpeedH:
		ld   [hl], $1A
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Kensou_ChouKyuuDan95
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Kensou_RyuuGakuSai ===============
; Move code for Kensou's Gaku Sai (MOVE_KENSOU_RYUU_GAKU_SAI_L, MOVE_KENSOU_RYUU_GAKU_SAI_H).
; Essentially a fancy uppercut.
MoveC_Kensou_RyuuGakuSai:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .obj6
		mMvC_ChkFrame $07, .obj7
		mMvC_ChkFrame $08, .doGravity
		mMvC_ChkFrame $09, .chkEnd
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .anim

		; If coming from the super, move $0Cpx forwards
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   a, [hl]
		or   a
		jp   z, .anim
		mMvC_SetMoveH +$0C00
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A

		; Deal half damage if coming from the super move
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   a, [hl]
		or   a							; Super flag set?
		jp   z, .obj2_setDamageNorm		; If not, jump
	.obj2_setDamageSuper:
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		jp   .anim
	.obj2_setDamageNorm:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #3 ---------------
.obj3:
	mMvC_ValFrameStartFast .obj3_cont
		mMvC_SetMoveH +$0C00
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--

		; Pick jump settings
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   a, [hl]
		or   a
		jp   nz, .obj3_setJumpS
		mMvC_ChkMove MOVE_KENSOU_RYUU_GAKU_SAI_H, .obj3_setJumpH
	.obj3_setJumpL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj3_doGravity
	.obj3_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj3_setJumpE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj3_doGravity
	.obj3_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0800
		jp   .obj3_doGravity
	.obj3_setJumpS: ; Super
		mMvC_SetSpeedH +$0480
		mMvC_SetSpeedV -$0680
	.obj3_doGravity:
		jp   .doGravity
.obj3_cont:
	; Immediately switch to the next frame
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity
		; Deal half damage if coming from the super move
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   a, [hl]
		or   a
		jp   z, .obj3_setDamageNorm
	.obj3_setDamageSuper:
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		jp   .anim
	.obj3_setDamageNorm:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	; Identical to .obj3_cont
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   a, [hl]
		or   a
		jp   z, .obj4_setDamageNorm
	.obj4_setDamageSuper:
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		jp   .anim
	.obj4_setDamageNorm:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #5 ---------------
.obj5:
	; Immediately switch to the next frame
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity
		mMvC_SetSpeedH +$0040
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #6 ---------------
.obj6:
	; Wait for near peak
	mMvC_NextFrameOnGtYSpeed -$03, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #7 ---------------
.obj7:
	; Wait for post-peak
	mMvC_NextFrameOnGtYSpeed +$01, ANIMSPEED_NONE
	jp   .doGravity
; --------------- common gravity check ---------------
.doGravity:
	; Switch to #9 when landing on the ground
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $09, $07
		jp   .ret
; --------------- frame #9 ---------------
.chkEnd:
	; Recovery
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		; Cleanup
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   [hl], $00
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Kensou_RyuuRenGa ===============
; Move code for Kensou's Gaku Sai (MOVE_KENSOU_RYUU_REN_GA_L, MOVE_KENSOU_RYUU_REN_GA_H).
; Forwards hopkick.
MoveC_Kensou_RyuuRenGa:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #3 ---------------
	jp   .moveH
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
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
		; Set forwards hop settings
		mMvC_ChkMove MOVE_KENSOU_RYUU_REN_GA_H, .obj1_setJumpH
	.obj1_setJumpL:
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0200
		jp   .obj1_cont
	.obj1_setJumpH:
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0400
		mMvC_SetSpeedV -$0200
		jp   .obj1_cont
	.obj1_setJumpE:
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0200
.obj1_cont:
	; On hit, align to the floor and start moving forward dealing the other hits
	mMvC_ValHit .chkGravity, .chkGravity
		mMvC_SetFrame $02, $01
		; Align to floor
		ld   hl, iOBJInfo_Y
		add  hl, de
		ld   [hl], PL_FLOOR_POS
		mMvC_SetSpeedH $0200
		jp   .ret
; --------------- frame #2 ---------------
; 2nd kick
.obj2:
	mMvC_ValFrameEnd .moveH
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_CONTHIT
		jp   .moveH
; --------------- frame #4 ---------------
; 3rd kick
.obj4:
	mMvC_ValFrameEnd .moveH
		mMvC_SetAnimSpeed $08
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .moveH
; --------------- frame #5 ---------------
; Slow down at 0.5px/frame
.obj5:
	mMvC_DoFrictionH $0080
		mMvC_ValFrameEnd .anim
		jp   .end
; --------------- common horizontal movement / frames #2-5 ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- common gravity check / frame #1 ---------------
.chkGravity:
	; We only get here on #1.
	; If we touch the ground, the move whiffed. Skip to #6.
	mMvC_ChkGravityHV $0030, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $06, $07
		jp   .ret
; --------------- frame #6 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jr   .ret
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Kensou_RyuuSouGeki ===============
; Move code for Kensou's Ryuu Sou Geki (MOVE_KENSOU_RYUU_SOU_GEKI_L, MOVE_KENSOU_RYUU_SOU_GEKI_H).
; Divekick.
MoveC_Kensou_RyuuSouGeki:
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
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		; Set divekick speed
		mMvC_ChkMove MOVE_KENSOU_RYUU_SOU_GEKI_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV +$0200
		jp   .obj1_cont
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV +$0180
		jp   .obj1_cont
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV +$0000
.obj1_cont:
	mMvC_ValFrameEnd .chkGravity
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID0, $00
		jp   .chkGravity
; --------------- frame #2 ---------------
; Damage frame
.obj2:
	mMvC_ValFrameEnd .chkGravity
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID1, $00
		jp   .chkGravity
; --------------- frame #3 ---------------
; Damage frame
.obj3:
	mMvC_ValFrameEnd .chkGravity
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID0, $00
		mMvC_SetFrameOnEnd $02
		jp   .chkGravity
; --------------- common gravity check / frame #1-3 ---------------
.chkGravity:
	; Touching the ground at any point skips to #4, preparing for the final kick
	mMvC_ChkGravityHV $0018, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $04, $01
		jp   .ret
; --------------- frame #4 ---------------
; Landed
.obj4:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $08
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		mMvC_PlaySound SCT_MOVEJUMP_A
		jp   .anim
; --------------- frame #5 ---------------
; The kick takes effect here.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Kensou_ShinryuuTenbuKyaku ===============
; Move code for Kensou's Shinryuu Tenbu Kyaku (MOVE_KENSOU_SHINRYUU_TENBU_KYAKU_S)
; Fancy DP that transitions to another fancy DP.
MoveC_Kensou_ShinryuuTenbuKyaku:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Set jump speed at the start
	mMvC_ValFrameStartFast .obj2
		mMvC_PlaySound SCT_MOVEJUMP_A
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0300
; --------------- frame #2 ---------------
; Damage frame #0
.obj2:
	mMvC_ValFrameEnd .chkGravity
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
		jp   .chkGravity
; --------------- frame #3 ---------------
; Damage frame #1
.obj3:
	mMvC_ValFrameEnd .chkGravity
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
		jp   .chkGravity
; --------------- frame #4 ---------------
; Set fast forward movement for #5
.obj4:
	mMvC_ValFrameEnd .chkGravity
		mMvC_SetSpeedH +$0400
		jp   .chkGravity
; --------------- frame #5 ---------------
; Fast fall.
.obj5:
	ld   hl, +$0300 ; High gravity
	jp   .chkGravityCustom
; --------------- common gravity chck --------------
.chkGravity:
	ld   hl, +$0030 ; Low gravity
.chkGravityCustom:
	; Switch to #6 when landing on the ground
	call OBJLstS_ApplyGravityVAndMoveHV
	jp   nc, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $06, $00
		jp   .ret
; --------------- frame #6 ---------------
.chkEnd:
	; Transition to the DP at the end
	mMvC_ValFrameEnd .anim
		; New move
		ld   a, MOVE_KENSOU_RYUU_GAKU_SAI_H
		call MoveInputS_SetSpecMove_StopSpeed
		; Reset the frame timer
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		; Deal half damage for some frames
		ld   hl, iPlInfo_Kensou_RyuuGakuSai_FromSuper
		add  hl, bc
		ld   [hl], $01
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== ProjInit_Kensou_ChouKyuuDan95 ===============
; Initializes the projectile for:
; - Athena's 108 Psycho Ball (MOVE_ATHENA_PSYCHO_BALL_L, MOVE_ATHENA_PSYCHO_BALL_H)
; - Kensou's Chou Kyuu Dan (MOVE_KENSOU_CHOU_KYUU_DAN_L, MOVE_KENSOU_CHOU_KYUU_DAN_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Kensou_ChouKyuuDan95:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Kensou_ChouKyuuDan95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Kensou_ChouKyuuDan95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Kensou_ChouKyuuDan95)	; iOBJInfo_OBJLstPtrTbl_High
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
				mMvC_SetMoveV -$0400
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
