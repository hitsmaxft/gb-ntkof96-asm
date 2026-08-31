; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Saisyu_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .chkEnd
; --------------- frame #3 ---------------
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_ROTL, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #4 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		mMvC_EndThrow
		jr   .ret
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
; =============== MoveC_Saisyu_PunchFH ===============
; Move code for Saisyu's far heavy punch. (MOVE_SHARED_PUNCH_FH).
MoveC_Saisyu_PunchFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH +$0400
.obj0_cont:
	mMvC_ValFrameEnd .anim
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .chkEnd
		mMvC_SetMoveH +$0800
.chkEnd:
	mMvC_ValFrameEnd .anim
		mMvC_ValFrameEnd .anim ; oops
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Athena_KickHN ===============
; Move code for:
; - Athena's Near Heavy Kick. (MOVE_SHARED_KICK_HN)
; - Kim's Near Heavy Punch. (MOVE_SHARED_PUNCH_HN)
; - Saisyu's Near Heavy Punch. (MOVE_SHARED_PUNCH_HN)
MoveC_Athena_KickHN:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $02, .chkEnd
; --------------- frame #1 ---------------
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
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
	
; =============== MoveInputReader_Saisyu ===============
; Special move input checker for SAISYU.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Saisyu:
	mMvIn_Validate Saisyu
.chkAir:
	jp   MoveInputReader_Saisyu_NoMove

.chkGround:
	; Easy Move review against KOF95 bank02: Yami Barai is DF, Oni Yaki is
	; FDF, En Jou is FDB and Ura Orochi Nagi is the only super. Saisyu has
	; three normal specials, so the five ground routes repeat only adjacent
	; routes while keeping forward and back distinct.
	mMvIn_ChkEasyDir MoveInit_Saisyu_YamiBarai, MoveInit_Saisyu_OniYaki, MoveInit_Saisyu_EnJou, MoveInit_Saisyu_YamiBarai, MoveInit_Saisyu_EnJou, MoveInit_Saisyu_UraOrochiNagi, MoveInputReader_Saisyu_NoMove
	mMvIn_ChkGA Saisyu, .chkPunch, MoveInputReader_Saisyu_NoMove

.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; DBDF+P -> Ura 108 Shiki Orochi Nagi
	mMvIn_ChkDir MoveInput_DBDF, MoveInit_Saisyu_UraOrochiNagi
.chkPunchNoSuper:
	; FDF+P -> 100 Shiki Oni Yaki
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Saisyu_OniYaki
	; DF+P -> 108 Shiki Yami Barai
	mMvIn_ChkDir MoveInput_DF, MoveInit_Saisyu_YamiBarai
	; FDB+P -> 702 Shiki En Jou
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Saisyu_EnJou
	; End
	jp   MoveInputReader_Saisyu_NoMove
	
; =============== MoveInit_Saisyu_YamiBarai ===============
MoveInit_Saisyu_YamiBarai:
	mMvIn_ValProjActive MoveInputReader_Saisyu_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_SAISYU_YAMI_BARAI_L, MOVE_SAISYU_YAMI_BARAI_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Saisyu_MoveSet
; =============== MoveInit_Saisyu_OniYaki ===============
MoveInit_Saisyu_OniYaki:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_SAISYU_ONI_YAKI_L, MOVE_SAISYU_ONI_YAKI_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Saisyu_MoveSet
; =============== MoveInit_Saisyu_EnJou ===============
MoveInit_Saisyu_EnJou:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_SAISYU_EN_JOU_L, MOVE_SAISYU_EN_JOU_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Saisyu_MoveSet
; =============== MoveInit_Saisyu_UraOrochiNagi ===============
MoveInit_Saisyu_UraOrochiNagi:
	call Play_Pl_ClearJoyDirBuffer
	
	ld   a, MOVE_SAISYU_URA_OROCHI_NAGI_S
	call MoveInputS_SetSpecMove_StopSpeed
	
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	inc  hl ; iPlInfo_Flags1
	inc  hl ; iPlInfo_Flags2
	set  PF2B_NOHURTBOX, [hl]
	jp   MoveInputReader_Saisyu_MoveSet
	
; =============== MoveInputReader_Saisyu_MoveSet ===============
MoveInputReader_Saisyu_MoveSet:
	scf
	ret
; =============== MoveInputReader_Saisyu_NoMove ===============
MoveInputReader_Saisyu_NoMove:
	or   a
	ret
	
; =============== MoveC_Saisyu_YamiBarai ===============
; Move code for Saisyu's 108 Shiki Yami Barai (MOVE_SAISYU_YAMI_BARAI_L, MOVE_SAISYU_YAMI_BARAI_H).
; Identical to MoveC_Kyo_YamiBarai
MoveC_Saisyu_YamiBarai:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .spawnProj
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
	
; --------------- frame #2 ---------------	
; Initializes the projectile.
.spawnProj:
	mMvC_ValFrameStartFast .anim
		; Spawn it
		call ProjInit_Saisyu_YamiBarai95
		
		;
		; The heavy version keeps Kyo in the "throw" frame for longer.
		;
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; Seek to anim speed
		cp   MOVE_SAISYU_YAMI_BARAI_H	; Doing the heavy version?
		jp   z, .heavy					; If so, jump
	.light:
		ld   [hl], $0A					; iOBJInfo_FrameTotal = $0A
		jp   .anim
	.heavy:
		ld   [hl], $14					; iOBJInfo_FrameTotal = $14
		jp   .anim
; --------------- frame #3 ---------------	
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; KOF96's native Iori projectile uses a different tile layout. Keep Saisyu's
; KOF95 mapping and speed rules while using KOF96's shared projectile runtime.
ProjInit_Saisyu_YamiBarai95:
	mMvC_PlaySound SCT_PROJ_LG_B
	push bc
		push de
			ld   hl, iPlInfo_Pow
			add  hl, bc
			ld   a, [hl]
			cp   PLAY_POW_MAX
			jr   z, .maxPow
			xor  a
			jr   .getFlags2
.maxPow:
			scf
.getFlags2:
			ld   hl, iPlInfo_Flags2
			push af
				add  hl, bc
			pop  af
			ld   a, [hl]
			push af
				call ProjInitS_InitAndGetOBJInfo
				ld   hl, iOBJInfo_Play_CodeBank
				add  hl, de
				ld   [hl], BANK(ProjC_Horz)
				inc  hl
				ld   [hl], LOW(ProjC_Horz)
				inc  hl
				ld   [hl], HIGH(ProjC_Horz)
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Iori_YamiBarai95)
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Iori_YamiBarai95)
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Iori_YamiBarai95)
				inc  hl
				ld   [hl], $00
				ld   hl, iOBJInfo_FrameLeft
				add  hl, de
				ld   [hl], $00
				inc  hl
				ld   [hl], ANIMSPEED_INSTANT
				ld   hl, iOBJInfo_Play_Priority
				add  hl, de
				ld   [hl], $00
				call OBJLstS_Overlap
				mMvC_SetMoveH +$0800
			pop  af
			jr   nc, .notMaxPow
			bit  PF2B_HEAVY, a
			jr   nz, .heavy
			jr   .light
.notMaxPow:
			bit  PF2B_HEAVY, a
			jr   nz, .heavyMaxPow
.light:
			ld   hl, +$0100
			jr   .setSpeed
.heavyMaxPow:
			ld   hl, +$0200
			jr   .setSpeed
.heavy:
			ld   hl, +$0400
.setSpeed:
			call Play_OBJLstS_SetSpeedH_ByXFlipR
		pop  de
	pop  bc
	ret
	
; =============== MoveC_Saisyu_OniYaki ===============
; Move code for Saisyu's 100 Shiki Oni Yaki (MOVE_SAISYU_ONI_YAKI_L, MOVE_SAISYU_ONI_YAKI_H).
; Identical to MoveC_Kyo_OniYaki
MoveC_Saisyu_OniYaki:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .doGravity
		mMvC_ChkFrame $05, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	; The first time we get here, move forward 4px
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH $0400
.obj0_cont:
	; When switching to #0, get manual control (since advancing the animation will
	; depend on the Y speed / touching the ground) and set the move damage.
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
	
		; Deal 8 lines of damage on contact.
		; Light and heavy do identical damage, there's no point in checking it.
		mMvC_ChkMove MOVE_SAISYU_ONI_YAKI_H, .obj0_setDamageH 
	.obj0_setDamageL:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
	.obj0_setDamageH:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
; --------------- frame #1 ---------------
; Starts the jump.
; Touching the ground at any point in this and the next few frames immediately jumps to the landing frame.
.obj1:
	; The first time we get here...
	mMvC_ValFrameStartFast .obj1_cont
		; Move 4px forward
		mMvC_SetMoveH $0400
		; Disable invulnerability
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl	; iPlInfo_Flags1
		res  PF1B_INVULN, [hl]
		
		; Depending on the move strength, use different jump settings.
		mMvC_ChkMove MOVE_SAISYU_ONI_YAKI_H, .obj1_setJumpH 
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj1_doGravity
	.obj1_setJumpH: ; Heavy
		; At MAX Power, the heavy version is even faster.
		; This got relegated to powerup mode in 96.
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj1_doGravity
	.obj1_setJumpE: ; Super
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0800
	.obj1_doGravity:
		jp   .doGravity
.obj1_cont:
	; YSpeed will always be > -$0A, so this advances the animation immediately.
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity ; We never take the jump
		; Deal 8 lines of damage on contact.
		mMvC_ChkMove MOVE_SAISYU_ONI_YAKI_H, .obj1_heavyDamage ; Pointless check, both are the same.
	.obj1_lightDamage:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
	.obj1_heavyDamage:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
	
; --------------- frame #2 ---------------
; Immediately advances the anim during the jump.
.obj2:
	mMvC_NextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #3 ---------------
; Set movement speed of $00.40px/frame forward while we're here.
; This is until YSpeed > 1.
.obj3:
	mMvC_NextFrameOnGtYSpeed +$01, ANIMSPEED_NONE
	mMvC_SetSpeedH $0040
	jp   .doGravity
; --------------- frame #4 / common gravity ---------------
; Move down until touching the ground. Switch to #6 on that.
.doGravity:
	; Move down $00.60px/frame
	mMvC_ChkGravityHV $0060, .anim
		; Allow canceling into specials now
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl	; iPlInfo_Flags1
		res  PF1B_NOSPECSTART, [hl]
		mMvC_SetLandFrame $05, $03
		jp   .ret
; --------------- frame #5 ---------------
; Landing frame.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret 
	
; =============== MoveC_Saisyu_EnJou ===============
; Move code for Saisyu's 1702 Shiki En Jou (MOVE_SAISYU_EN_JOU_L, MOVE_SAISYU_EN_JOU_H).
MoveC_Saisyu_EnJou:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
; --------------- frame #0 ---------------
; Fast forward movement.
.obj0:
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH +$0800
.obj0_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound SFX_HEAVY

		;--
		; Remove invuln
		; The English version does this later, during recovery.
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
	IF !REV_LANG_EN
		inc  hl
		res  PF1B_INVULN, [hl]	
	ENDC
		;--
		; Set jump settings
		mMvC_ChkMove MOVE_SAISYU_EN_JOU_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0400
		jp   .obj1_doGravity
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0380
		jp   .obj1_doGravity
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0400
	.obj1_doGravity:
		jp   .doGravity
.obj1_cont:
	jp   .doGravity
; --------------- common gravity check / frame #1 ---------------
.doGravity:
	; Switch to #2 when landing
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $02, $01
		jp   .ret
; --------------- frame #2 ---------------
.obj2:
	; Deal knockdown hit.
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $08
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		mMvC_PlaySound SFX_HEAVY
	IF REV_LANG_EN
		; See the version check above
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		res  PF1B_INVULN, [hl]	
	ENDC
		jp   .anim

; --------------- frame #3 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Saisyu_UraOrochiNagi ===============
; Move code for Saisyu's Ura 108 Shiki Orochi Nagi (MOVE_SAISYU_URA_OROCHI_NAGI_S).
; See also: MoveC_Kyo_UraOrochiNagi
MoveC_Saisyu_UraOrochiNagi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $06, .obj6
		mMvC_ChkFrame $07, .obj7
		mMvC_ChkFrame $08, .obj8
		mMvC_ChkFrame $09, .chkEnd
; --------------- frames #0-3 ---------------	
	jp   .anim
; --------------- frame #4 ---------------	
; Charge frame (along with #3)
.obj4:
	mMvC_ValFrameEnd .anim
		;
		; If the frame is allowed to continue animating normally, the charge will be released.
		;
		; It's possible to extend its charge time by holding B, and if so, the frame can loop
		; back to #3. There's a limit to how many times the animation can loop though, and when
		; reaching it B will be treated as released.
		;

		; If we stopped releasing B, animate normally
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		ld   a, [hl]
		and  a, KEY_B	; Holding B?
		jp   z, .anim	; If not, animate
		
		; Otherwise, loop back to #3
		mMvC_SetFrame $03, $01
		jp   .ret
; --------------- frame #6 ---------------
.obj6:
	mMvC_ValFrameStartFast .obj6_cont
		mMvC_SetMoveH $0800
.obj6_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		;--
		; [POI] Where does this come from? We didn't have this set to begin with.
		ld   hl, iPlInfo_Flags2
		add  hl, bc
		res  PF2B_NOHURTBOX, [hl]
		;--
		jp   .anim
; --------------- frame #7 ---------------
; Move horizontally, slowing down gradually.
.obj7:
	; Set the initial movement speed the first time we get here.
	mMvC_ValFrameStartFast .obj7_cont
		mMvC_PlaySound SCT_PHYSFIRE
		mMvC_SetSpeedH +$07C0
		jp   .doFriction
.obj7_cont:
	; Set manual control for friction check
	mMvC_ValFrameEnd .doFriction
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doFriction
; --------------- frame #4 ---------------
; Continue moving horizontally and slow down.
.doFriction:
	mMvC_DoFrictionH +$0070
	jp   .anim
; --------------- frame #8 ---------------
; Slows down at 0.5px/frame, then wait for 3 more frames before continuing.
.obj8:
	mMvC_ChkFrictionH +$0080, .ret
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		mMvC_SetAnimSpeed $03
		jp   .anim
; --------------- frame #9 ---------------
; Recovery frame #2.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
