; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
; KOF96 relaxed the shared charge duration to two frames. Keep Ryo's KOF95
; Hien Shippuu Kyaku at the original 30-frame back charge.
MoveInput_Ryo95_BF_Charge:
	db $02
	db KEY_LEFT,  KEY_LEFT,  $01, $14
	db KEY_RIGHT, KEY_RIGHT, $1E, $FF

MoveC_Ryo95_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
; When visually switching to #2, hit the opponent.
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamage $06, HITTYPE_LAUNCH_MID_UB_NOSTUN, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		jp   .anim
; --------------- frame #3 ---------------
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
	
; =============== MoveC_Ryo95_PunchFH ===============
; Move code for Ryo's far heavy punch. (MOVE_SHARED_PUNCH_FH).
MoveC_Ryo95_PunchFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID1, PF3_HEAVYHIT|PF3_OVERHEAD
		jp   .anim
; --------------- frame #1 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  
	
; =============== MoveInputReader_Ryo95 ===============
; Special move input checker for RYO.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Ryo95:
	mMvIn_Validate Ryo95
.chkAir:
	;             SELECT + B               SELECT + A
	mMvIn_ChkEasy MoveInit_Ryo95_RyuKoRanbu, MoveInit_Ryo95_KoOuKenAir
	mMvIn_ChkGA Ryo95, .chkAirPunch, MoveInputReader_Ryo95_NoMove
	
.chkAirPunch:
	mMvIn_ValSuper .chkAirPunchNoSuper
	; DFDB+P -> Ryu Ko Ranbu
	mMvIn_ChkDir MoveInput_DFDB, MoveInit_Ryo95_RyuKoRanbu
.chkAirPunchNoSuper:
	; DF+P -> Ko Ou Ken (Air)
	mMvIn_ChkDir MoveInput_DF, MoveInit_Ryo95_KoOuKenAir
	; End
	jp   MoveInputReader_Ryo95_NoMove
	
.chkGround:
	; KOF95 command-family mapping; forward and back intentionally differ.
	mMvIn_ChkEasyDir MoveInit_Ryo95_KoOuKen, MoveInit_Ryo95_KoHou, MoveInit_Ryo95_Zanretsuken, MoveInit_Ryo95_HienShippuuKyaku, MoveInit_Ryo95_HaohShoukouKen, MoveInit_Ryo95_RyuKoRanbu, MoveInputReader_Ryo95_NoMove
	mMvIn_ChkGA Ryo95, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; DFDB+P -> Ryu Ko Ranbu
	mMvIn_ChkDir MoveInput_DFDB, MoveInit_Ryo95_RyuKoRanbu
.chkPunchNoSuper:
	; FBDF+P -> Haoh Shoukou Ken
	mMvIn_ChkDir MoveInput_FBDF, MoveInit_Ryo95_HaohShoukouKen
	; FDF+P -> Ko Hou
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Ryo95_KoHou
	; BDF+P (close) -> Kyokuken Ryu Renbu Ken
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Ryo95_KyokukenRyuRenbuKen
	; DF+P -> Ko Ou Ken
	mMvIn_ChkDir MoveInput_DF, MoveInit_Ryo95_KoOuKen
	; FDB+P -> Zanretsuken
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Ryo95_Zanretsuken
	; End
	jp   MoveInputReader_Ryo95_NoMove
.chkKick:
	; BF+K -> Hien Shippuu Kyaku
	mMvIn_ChkDir MoveInput_Ryo95_BF_Charge, MoveInit_Ryo95_HienShippuuKyaku
	; End
	jp   MoveInputReader_Ryo95_NoMove
	
; =============== MoveInit_Ryo95_KoOuKen ===============
MoveInit_Ryo95_KoOuKen:
	mMvIn_ValProjActive MoveInputReader_Ryo95_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RYO95_KO_OU_KEN_GL, MOVE_YURI_KO_OU_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_HienShippuuKyaku ===============
MoveInit_Ryo95_HienShippuuKyaku:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_RYO95_HIEN_SHIPPUU_KYAKU_L, MOVE_RYO95_HIEN_SHIPPUU_KYAKU_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_Zanretsuken ===============
MoveInit_Ryo95_Zanretsuken:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RYO95_ZENRETSUKEN_L, MOVE_RYO95_ZENRETSUKEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_KoHou ===============
MoveInit_Ryo95_KoHou:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RYO95_KO_HOU_L, MOVE_RYO95_KO_HOU_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_KoOuKenAir ===============
MoveInit_Ryo95_KoOuKenAir:
	mMvIn_ValProjActive MoveInputReader_Ryo95_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RYO95_KO_OU_KEN_AL, MOVE_RYO95_KO_OU_KEN_AH
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_HaohShoukouKen ===============
MoveInit_Ryo95_HaohShoukouKen:
	mMvIn_ValProjActive MoveInputReader_Ryo95_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RYO95_HAOH_SHOKOU_KEN_L, MOVE_RYO95_HAOH_SHOKOU_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_KyokukenRyuRenbuKen ===============
MoveInit_Ryo95_KyokukenRyuRenbuKen:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_ValClose MoveInputReader_Ryo95_NoMove
	mMvIn_GetLHP MOVE_RYO95_KYOKUKEN_RYU_RENBU_KEN_L, MOVE_RYO95_KYOKUKEN_RYU_RENBU_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInit_Ryo95_RyuKoRanbu ===============
MoveInit_Ryo95_RyuKoRanbu:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_RYO95_RYU_KO_RANBU_S
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Ryo95_MoveSet
; =============== MoveInputReader_Ryo95_MoveSet ===============
MoveInputReader_Ryo95_MoveSet:
	scf
	ret
; =============== MoveInputReader_Ryo95_NoMove ===============
MoveInputReader_Ryo95_NoMove:
	or   a
	ret
	
; =============== MoveC_Ryo95_KoOuKenG ===============
; Move code for the ground version of Ryo's Ko-Ou Ken (MOVE_RYO95_KO_OU_KEN_GL, MOVE_YURI_KO_OU_KEN_H).
; Horizontal projectile.
MoveC_Ryo95_KoOuKenG:
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
		ld   [hl], $0A
		jp   .anim
	.obj1_setSpeedH:
		ld   [hl], $14
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Ryo95_KoOuKenG
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ryo95_KoOuKenA ===============
; Move code for the air version of Ryo's Ko-Ou Ken (MOVE_RYO95_KO_OU_KEN_AL, MOVE_RYO95_KO_OU_KEN_AH).
; Diagonal projectile.
MoveC_Ryo95_KoOuKenA:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .doGravity
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		call ProjInit_Ryo95_KoOuKenA
.obj1_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doGravity
; --------------- common gravity check ---------------
.doGravity:
	mMvC_ChkGravityHV $0060, .anim
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $03, $03
		jp   .ret
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
	
; =============== MoveC_Ryo95_HaohShoukouKen ===============
; Move code for Ryo's Haoh Shoukou Ken. (MOVE_RYO95_HAOH_SHOUKOU_KEN_L, MOVE_RYO95_HAOH_SHOUKOU_KEN_H)
; See also: MoveC_Ryo95_KoOuKenG
MoveC_Ryo95_HaohShoukouKen:
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
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; HL = Ptr to anim speed
		cp   MOVE_RYO95_HAOH_SHOKOU_KEN_H	; Doing the heavy version?
		jp   z, .obj1_setSpeedH			; If so, jump
	.obj1_setSpeedL:
		ld   [hl], $0A
		jp   .anim
	.obj1_setSpeedH:
		ld   [hl], $14
		jp   .anim
; --------------- frame #2 ---------------	
.obj2:
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Ryo95_HaohShoukouKen
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------	
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ryo95_HienShippuuKyaku ===============
; Move code for Ryo's Hien Shippuu Kyaku (MOVE_RYO95_HIEN_SHIPPUU_KYAKU_L, MOVE_RYO95_HIEN_SHIPPUU_KYAKU_H).
; Full screen forward jump.
MoveC_Ryo95_HienShippuuKyaku:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $05, .chkEnd
; --------------- frames #3-4 ---------------
	jp   .doGravity
; --------------- frame #0 ---------------
; Startup
.obj0:
	; Set manual control for next frames, due to the jump logic
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
; Handles the initial jump, shared between light/heavy variations.
.obj1:
	mMvC_ValFrameStart .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		
		; Set forward jump settings
		mMvC_ChkMove MOVE_RYO95_HIEN_SHIPPUU_KYAKU_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0180
		jp   .doGravity
	.obj1_setJumpH:
		; Special settings at max power here
		mMvC_ChkMaxPow .obj1_setJumpMaxPowH
	.obj1_setJumpNormH: ; Heavy
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0200
		jp   .doGravity
	.obj1_setJumpMaxPowH: ; Heavy, Max POW
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV -$0200
		jp   .doGravity
.obj1_cont:
	;
	; The heavy version of the move does a second kick once the opponent is hit.
	;
	
	; The light version does not do this, it just handles gravity and waits for the player
	; to touch the ground.
	mMvC_ChkMove MOVE_RYO95_HIEN_SHIPPUU_KYAKU_L, .doGravity
.obj1_contH:
	; Wait until we hit the opponent once
	mMvC_ValHit .doGravity, .doGravity
		; Opponent hit, switch to #2 and re-enable anims
		mMvC_SetFrame $02, ANIMSPEED_INSTANT
		mMvC_SetSpeedH $0400
		jp   .ret
; --------------- frame #2 ---------------
; Startup for second kick, which knocks down.
.obj2:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- common gravity check / frames #1-4 ---------------
.doGravity:
	mMvC_ChkGravityHV $0030, .anim
		;--
		; Landed on ground, allow canceling specials
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		; If we landed prematurely, switch to #5.
		; Don't interrupt the second kick on #2-4 though, in case we're doing the heavy.
		mMvC_StartChkFrameInt
			mMvC_ChkFrame $02, .anim
			mMvC_ChkFrame $03, .anim
			mMvC_ChkFrame $04, .anim
		mMvC_SetLandFrame $05, $05
		jp   .ret
; --------------- frame #5 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ryo95_Zenretsuken ===============
; Move code for Ryo's Zenretsuken (MOVE_RYO95_ZENRETSUKEN_L, MOVE_RYO95_ZENRETSUKEN_H)
MoveC_Ryo95_Zenretsuken:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		; Check for 1st hit
		mMvC_ChkFrame $00, .chk1stHit
		mMvC_ChkFrame $01, .chk1stHit
		mMvC_ChkFrame $02, .set1stHit0
		mMvC_ChkFrame $03, .chk1stHit
		mMvC_ChkFrame $04, .set1stHit1
		mMvC_ChkFrame $05, .chk1stHit
		mMvC_ChkFrame $06, .set1stHit0
		mMvC_ChkFrame $07, .chk1stHit
		mMvC_ChkFrame $08, .set1stHit1
		mMvC_ChkFrame $09, .chk1stHit
		; Whiff
		mMvC_ChkFrame $0A, .chkEnd
		; Hit sequence
		mMvC_ChkFrame $0B, .hitSeq0
		mMvC_ChkFrame $0D, .hitSeq1
		mMvC_ChkFrame $0F, .hitSeq0
		mMvC_ChkFrame $11, .hitSeq1
		mMvC_ChkFrame $13, .hitSeq0
		mMvC_ChkFrame $15, .hitSeq1NoShift
		mMvC_ChkFrame $16, .hitKnockdown
		; Recovery
		mMvC_ChkFrame $17, .chkEnd
	jp   .anim
	
; --------------- frames #2,#6 ---------------
; Sets HITTYPE_HIT_MULTI0 as damage type for the initial hit.
; This and the next one serve to switch up the initial hit depending on when we make
; contact with the opponent.
.set1stHit0:
	mMvC_ValFrameEnd .chk1stHit
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
		mMvC_PlaySound SFX_HEAVY
		jp   .chk1stHit
; --------------- frames #4,#8 ---------------
; Sets HITTYPE_HIT_MULTI1 as damage type for the initial hit.
.set1stHit1:
	mMvC_ValFrameEnd .chk1stHit
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, $00
		mMvC_PlaySound SFX_HEAVY
		jp   .chk1stHit
; --------------- initial hit check / frames #0-9 ---------------
.chk1stHit:
	
	; Initialize the vertical shift offset for the damage loop, for when we get there
	ld   hl, iPlInfo_Ryo_Zanretsuken_VShift
	add  hl, bc
	ld   [hl], $00
	
	; If we don't hit the opponent by #A, the move ends prematurely. (.chkEnd)
	
	; Wait until the opponent is hit
	mMvC_ValHit .anim, .anim
	; Wait until the opponent is no longer invulnerable. KOF96 does not expose
	; KOF95's one-use macro, so keep its exact flag test inline.
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]
	jp   nz, .anim
	; Hit confirmed, jump to the damage loop
	mMvC_SetFrame $0B, ANIMSPEED_INSTANT
	jp   .ret
	
; --------------- frames #B,F,13 ---------------
; Hit sequence #0
.hitSeq0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
		; Increment the vertical shift offset.
		; This is used by HitTypeS_MovePlToOpFront to progressively move the opponent up,
		; which is used by HITTYPE_HIT_MULTI0 and HITTYPE_HIT_MULTI1.
		ld   hl, iPlInfo_Ryo_Zanretsuken_VShift
		add  hl, bc
		inc  [hl]
		jp   .anim
; --------------- frames #D,11 ---------------
; Hit sequence #1.
; Same as the other one, just using HITTYPE_HIT_MULTI1.
.hitSeq1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		ld   hl, iPlInfo_Ryo_Zanretsuken_VShift
		add  hl, bc
		inc  [hl]
		jp   .anim
; --------------- frame #15 ---------------
; Hit with no more upmove.
.hitSeq1NoShift:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $04, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		jp   .anim
; --------------- frame #16 ---------------
; Hit that deals a knockdown at the end.
.hitKnockdown:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $14
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #17 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		; Cleanup
		ld   hl, iPlInfo_Ryo_Zanretsuken_VShift
		add  hl, bc
		ld   [hl], $00
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ryo95_KoHou ===============
; Move code for Ryo's Ko Hou (MOVE_RYO95_KO_HOU_L, MOVE_RYO95_KO_HOU_H).
; Became MoveC_Robert_RyuuGa in 96.
MoveC_Ryo95_KoHou:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .chkEnd
; --------------- frame #1 ---------------	
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_ChkMove MOVE_RYO95_KO_HOU_H, .obj1_setHitH
	.obj1_setHitL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
	.obj1_setHitH: ; Heavy
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------	
.obj2:
	mMvC_ValFrameStart .obj2_cont
		mMvC_SetMoveH $0800
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl	; Seek to iPlInfo_Flags1
		res  PF1B_INVULN, [hl]
		mMvC_ChkMove MOVE_RYO95_KO_HOU_H, .obj2_setJumpH
	.obj2_setJumpL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj2_doGravity
	.obj2_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj2_setJumpE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj2_doGravity
	.obj2_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0800
	.obj2_doGravity:
		jp   .doGravity
.obj2_cont:
	mMvC_NextFrameOnGtYSpeed -$06, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #3 ---------------	
.obj3:
	mMvC_NextFrameOnGtYSpeed +$01, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #4 ---------------	
.obj4:
	mMvC_SetSpeedH $0040
; --------------- frame #1-4 / common gravity ---------------	
.doGravity:
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $05, $03
		jp   .ret
; --------------- frame #5 ---------------	
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ryo95_KyokukenRyuRenbuKen ===============
; Move code for Ryo's Kyokuken Ryu Renbu Ken.
; Multi-hit close combo.
MoveC_Ryo95_KyokukenRyuRenbuKen:
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
	; Set 1st hit.
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #1 ---------------	
.obj1:
	; Set 2nd hit.
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #2 ---------------	
.obj2:
	; Move forwards, set 3rd hit.
	mMvC_ValFrameStartFast .obj2_cont
		mMvC_SetMoveH +$0800
.obj2_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #3 ---------------	
.obj3:
	; Move forwards one last time in the uppercut pose
	mMvC_ValFrameStartFast .obj3_cont
		mMvC_SetMoveH +$1000
.obj3_cont:
	jp   .anim
; --------------- frame #7 ---------------	
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ryo95_RyuKoRanbuS ===============
; Move code for Ryo's Ryu Ko Ranbu. (MOVE_RYO95_RYU_KO_RANBU_S)
MoveC_Ryo95_RyuKoRanbuS:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .objOdd
		mMvC_ChkFrame $05, .objOdd
		mMvC_ChkFrame $07, .objOdd
		mMvC_ChkFrame $09, .objOdd
		mMvC_ChkFrame $0B, .objOdd
		mMvC_ChkFrame $0D, .objOdd
		mMvC_ChkFrame $0F, .objOdd
		mMvC_ChkFrame $10, .startRyuuGa
		mMvC_ChkFrame $11, .chkEnd
	jp   .objEven
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameStart .obj0_getManCtrl
	; Nothing
.obj0_getManCtrl:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStart .obj1_chkGuard
		mMvC_PlaySound SCT_MOVEJUMP_A
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set jump speed
		mMvC_SetSpeedH +$07FF
		mMvC_SetSpeedV -$0200
		jp   .doGravity
.obj1_chkGuard:
	;
	; Continue the jump until hitting the opponent.
	;
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]				; Did we reach?
	jp   z, .obj1_chkGuard_doGravity	; If not, skip
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]				; Is the opponent invulnerable?
	jp   nz, .obj1_chkGuard_doGravity	; If so, skip
	bit  PF1B_HITRECV, [hl]				; Did the opponent get hit?
	jp   z, .obj1_chkGuard_doGravity	; If not, skip	
	
	bit  PF1B_GUARD, [hl]				; Is the opponent blocking?
	jp   nz, .obj1_chkGuard_guard		; If so, jump
	.obj1_chkGuard_noGuard:
		; Otherwise, continue to #2
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		mMvC_SetFrame $02, $01
		mMvC_SetSpeedH $0000
		; Force player on the ground
		ld   hl, iOBJInfo_Y
		add  hl, de
		ld   [hl], PL_FLOOR_POS
		jp   .ret
.obj1_chkGuard_guard:
	; If the opponent blocked the hit, slow down considerably.
	; This will still moves us back for overlapping with the opponent.
	mMvC_SetSpeedH $0100
.obj1_chkGuard_doGravity:
	jp   .doGravity
; --------------- frames #3,5,7,9... ---------------
; Generic damage - odd frames.
; Alongside .objEven is used to alternate between hit effects constantly.
.objOdd:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		jp   .chkOtherEscape
; --------------- frame #2 ---------------
; Initial frame before the odd/even switching.
; This sets the initial jump speed and doesn't check for block yet.
.obj2:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		jp   .anim
; --------------- frames #4,6,8,A,... ---------------
; Generic damage - even frames.
.objEven:
	mMvC_ValFrameStart .anim
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
			; Otherwise, transition to hop
			ld   a, MOVE_SHARED_HOP_B
			call Pl_SetMove_StopSpeed
			jp   .ret
; --------------- frame #10 ---------------
; Transitions to Ko Hou at the end of the frame.	
.startRyuuGa:
	mMvC_ValFrameEnd .anim
		ld   a, MOVE_RYO95_KO_HOU_H
		call MoveInputS_SetSpecMove_StopSpeed
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
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
		mMvC_SetLandFrame $11, $07
		jp   .ret
; --------------- frame #11 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== ProjInit_Ryo95_KoOuKenG ===============
; Initializes the projectile for:
; - Ryo's ground version of Ko Ou Ken (MOVE_RYO95_KO_OU_KEN_GL, MOVE_YURI_KO_OU_KEN_H)
; - Yuri's Ko Ou Ken (MOVE_YURI_KO_OU_KEN_L, MOVE_YURI_KO_OU_KEN_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Ryo95_KoOuKenG:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Ryo_KoOuKenG_Ryo95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Ryo_KoOuKenG_Ryo95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Ryo_KoOuKenG_Ryo95)	; iOBJInfo_OBJLstPtrTbl_High
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
	
; =============== ProjInit_Ryo95_KoOuKenA ===============
; Initializes the projectile for:
; - Ryo's air version of Ko Ou Ken (MOVE_RYO95_KO_OU_KEN_AL, MOVE_RYO95_KO_OU_KEN_AH)
; - Yuri's Rai'oh Ken (MOVE_YURI_RAI_OH_KEN_L, MOVE_YURI_RAI_OH_KEN_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Ryo95_KoOuKenA:
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
				ld   [hl], BANK(ProjC_Ryo95_KoOuKenA)	; BANK $02 ; iOBJInfo_Play_CodeBank
				inc  hl
				ld   [hl], LOW(ProjC_Ryo95_KoOuKenA)	; iOBJInfo_Play_CodePtr_Low
				inc  hl
				ld   [hl], HIGH(ProjC_Ryo95_KoOuKenA)	; iOBJInfo_Play_CodePtr_High

				; Write sprite mapping ptr for this projectile.
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Ryo_KoOuKenA_Ryo95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Ryo_KoOuKenA_Ryo95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Ryo_KoOuKenA_Ryo95)	; iOBJInfo_OBJLstPtrTbl_High
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
			; Determine projectile speed.
			; The heavy attack check assumes that moves using this projectile
			; always take up the first pair of special move slots.
			;

			jp   nc, .fldMaxPow			; Are we at max power? If not, jump
			cp   MOVE_SPEC_4_H			; Was this an heavy attack?
			jp   z, .fldHeavy			; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_SPEC_4_H			; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow		; If so, jump
		.fldLight:
			mMvC_SetSpeedH +$0100
			mMvC_SetSpeedV +$0100
			jp   .ret
		.fldHeavyMaxPow:
			mMvC_SetSpeedH +$0200
			mMvC_SetSpeedV +$0180
			jp   .ret
		.fldHeavy:
			mMvC_SetSpeedH +$0400
			mMvC_SetSpeedV +$0300
		.ret:

		pop  de
	pop  bc
	ret
	
; =============== ProjInit_Ryo95_HaohShoukouKen ===============
; Initializes the large projectile for Haoh Shoukou Ken, used by:
; - Ryo (MOVE_RYO95_HAOH_SHOUKOU_KEN_L, MOVE_RYO95_HAOH_SHOUKOU_KEN_H)
; - Yuri (MOVE_YURI_HAOH_SHOUKOU_KEN_L, MOVE_YURI_HAOH_SHOUKOU_KEN_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Ryo95_HaohShoukouKen:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Ryo_HaohShoukouKen_Ryo95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Ryo_HaohShoukouKen_Ryo95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Ryo_HaohShoukouKen_Ryo95)	; iOBJInfo_OBJLstPtrTbl_High
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
	
; =============== ProjC_Ryo95_KoOuKenA ===============
; Like the default projectile code (ProjC_Horz), except it also moves down.
ProjC_Ryo95_KoOuKenA:
	call ExOBJS_Play_ChkHitModeAndMoveH		; Can it despawn?
	jp   c, .despawn						; If so, jump
	mMvC_ChkGravityV $0000, .despawn		; Move down, and despawn when it touches the ground
	call OBJLstS_DoAnimTiming_Loop_by_DE	; Otherwise, continue animating
	ret
.despawn:
	call OBJLstS_Hide
	ret
	
; =============== MoveC_Yuri_ThrowG ===============
; Move code for Yuri's ground throw. (MOVE_SHARED_THROW_G).
