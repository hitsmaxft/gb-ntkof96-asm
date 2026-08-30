; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
; KOF96's shared DU/BF charge tables require only two held frames. Heidern's
; KOF95 data requires 30, so keep all three original charge motions local.
MoveInput_Heidern_DU_Charge95:
	db $02
	db KEY_UP,   KEY_UP,   $01, $14
	db KEY_DOWN, KEY_DOWN, $1E, $FF

MoveInput_Heidern_BF_Charge95:
	db $02
	db KEY_LEFT,  KEY_LEFT,  $01, $14
	db KEY_RIGHT, KEY_RIGHT, $1E, $FF

MoveInput_Heidern_BDU_Charge95:
	db $03
	db KEY_UP, KEY_UP, $01, $14
	db KEY_DOWN, KEY_DOWN, $01, $0A
	db KEY_RIGHT, KEY_RIGHT, $1E, $FF

MoveC_Heidern_ThrowG:
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
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_ROTL, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
; When visually switching to #3, hit the opponent.
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
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
	
; =============== MoveC_Heidern_ThrowA ===============
; Move code for Heidern's Air Throw (MOVE_SHARED_THROW_A).
; Identical to the standard air throw (MoveC_Base_ThrowA_DirD) except Heidern moves forward when dropping down.
MoveC_Heidern_ThrowA:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		; Enable manual control since #1 lasts until touching the ground
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		; Stick opponent below us
		mMvC_SetDamage $06, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
; Holding on the opponent.
.obj1:
	; Move forwards 1.5px/frame
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetSpeedH +$0180
.obj1_cont:	
	; Continue gravity until touching the ground
	mMvC_ValFrameEnd .doGravity
		;--
		; [POI] If too much time has passed and we didn't touch the ground yet,
		;       throw the opponent.
		mMvC_SetDamage $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .doGravity
		;--
; --------------- frame #2 ---------------
; Holding on the opponent.
.obj2:
	mMvC_ValFrameEnd .anim
	.end:
		; End the throw
		xor  a
		ld   [wPlayPlThrowActId], a
		; New move
		ld   a, MOVE_SHARED_LAUNCH_UB_REC
		call Pl_SetMove_StopSpeed
		
		mMvC_SetSpeedHInt +$0180 ; 1.5px/frame back
		mMvC_SetSpeedV -$0400 ; 4px/frame up
		jr   .ret
; --------------- common gravity for #2 ---------------
.doGravity:
	; Switch to #2 when touching the ground
	mMvC_ChkGravityHV $0060, .anim
		; When touching the ground, perform the actual throw.
		mMvC_SetLandFrame $02, $01
		mMvC_SetDamage $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Heidern_PunchHN ===============
; Move code for Heidern's:
; - Near Heavy punch (MOVE_SHARED_PUNCH_HN)
; - Near Heavy kick (MOVE_SHARED_KICK_HN)
MoveC_Heidern_PunchHN:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
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
	
; =============== MoveInputReader_Heidern ===============
; Special move input checker for HEIDERN.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Heidern:
	mMvIn_Validate Heidern
.chkAir:
	jp   MoveInputReader_Heidern_NoMove

.chkGround:
	; KOF95's neutral shortcuts were SELECT+B -> Final Bringer and
	; SELECT+A -> Neck Roller. Keep Neck Roller on the diagonal shortcut and
	; Final Bringer on completed DB. The normal routes follow the source
	; motions: BF -> forward, DU punch/kick -> down/diagonal, and FDB ->
	; down-back. Storm Bringer cannot also occupy back: holding SELECT for the
	; heavy route walks Heidern out of command-throw range before dispatch.
	; Back therefore deliberately shares the safe Cross Cutter route.
	;             F                         DF                       D                         DB                         B                         super DF                         super DB
	mMvIn_ChkEasyDir MoveInit_Heidern_CrossCutter, MoveInit_Heidern_NeckRoller, MoveInit_Heidern_MoonSlasher, MoveInit_Heidern_StormBringer, MoveInit_Heidern_CrossCutter, MoveInputReader_Heidern_NoMove, MoveInit_Heidern_FinalBringer
	mMvIn_ChkGA Heidern, .chkPunch, .chkKick

.chkPunch:
	; DU+P -> Moon Slasher
	mMvIn_ChkDir MoveInput_Heidern_DU_Charge95, MoveInit_Heidern_MoonSlasher
	; BF+P -> Cross Cutter
	mMvIn_ChkDir MoveInput_Heidern_BF_Charge95, MoveInit_Heidern_CrossCutter
	; FDB+P -> Storm Bringer
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Heidern_StormBringer
	; End
	jp   MoveInputReader_Heidern_NoMove
.chkKick:
	mMvIn_ValSuper .chkKickNoSuper
	; BDU+K -> Final Bringer
	mMvIn_ChkDir MoveInput_Heidern_BDU_Charge95, MoveInit_Heidern_FinalBringer
.chkKickNoSuper:
	; DU+K -> Neck Roller
	mMvIn_ChkDir MoveInput_Heidern_DU_Charge95, MoveInit_Heidern_NeckRoller
	; End
	jp   MoveInputReader_Heidern_NoMove
	
; =============== MoveInit_Heidern_CrossCutter ===============
MoveInit_Heidern_CrossCutter:
	mMvIn_ValProjActive MoveInputReader_Heidern_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_HEIDERN_CROSS_CUTTER_L, MOVE_HEIDERN_CROSS_CUTTER_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Heidern_MoveSet
	
; =============== MoveInit_Heidern_NeckRoller ===============
MoveInit_Heidern_NeckRoller:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_HEIDERN_NECK_ROLLER_L, MOVE_HEIDERN_NECK_ROLLER_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Heidern_MoveSet
	
; =============== MoveInit_Heidern_StormBringer ===============
MoveInit_Heidern_StormBringer:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_ValStartCmdThrow_StdColi Heidern
		mMvIn_GetLHP MOVE_HEIDERN_STORM_BRINGER_L, MOVE_HEIDERN_STORM_BRINGER_H
		call MoveInputS_SetSpecMove_StopSpeed
		;--
		; Not coming from a super, so no double damage
		ld   hl, iPlInfo_Heidern_StormBringer_FromSuper
		add  hl, bc
		ld   [hl], $00
		;--
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		set  PF1B_INVULN, [hl]
		jp   MoveInputReader_Heidern_MoveSet
	
; =============== MoveInit_Heidern_MoonSlasher ===============
MoveInit_Heidern_MoonSlasher:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_HEIDERN_MOON_SLASHER_L, MOVE_HEIDERN_MOON_SLASHER_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Heidern_MoveSet
	
; =============== MoveInit_Heidern_FinalBringer ===============
MoveInit_Heidern_FinalBringer:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_HEIDERN_FINAL_BRINGER_S
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Heidern_MoveSet
	
; =============== MoveInputReader_Heidern_MoveSet ===============
MoveInputReader_Heidern_MoveSet:
	scf  
	ret  
; =============== MoveInputReader_Heidern_NoMove ===============
MoveInputReader_Heidern_NoMove:
	or   a
	ret  
	
; =============== MoveC_Heidern_CrossCutter ===============
; Move code for Heidern's Cross Cutter (MOVE_HEIDERN_CROSS_CUTTER_L, MOVE_HEIDERN_CROSS_CUTTER_H)
MoveC_Heidern_CrossCutter:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
	
		; Determine how long to stay in #2
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]						; A = iPlInfo_MoveId
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de							; HL = Ptr to iOBJInfo_FrameTotal
		cp   MOVE_HEIDERN_CROSS_CUTTER_H	; Doing the heavy version?
		jp   z, .obj2_setSpeedH				; If so, jump
	.obj2_setSpeedL:
		ld   [hl], $08	; iOBJInfo_FrameTotal for light or super
		jp   .anim
	.obj2_setSpeedH:
		ld   [hl], $10	; iOBJInfo_FrameTotal for heavy
		jp   .anim
; --------------- frame #2 ---------------
; Spawn the projectile at the start
.obj2:
	mMvC_ValFrameStartFast .obj2_cont
		call ProjInit_Heidern_CrossCutter
.obj2_cont:
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
	
; =============== MoveC_Heidern_NeckRoller ===============
; Move code for Heidern's:
; - Neck Roller (MOVE_HEIDERN_NECK_ROLLER_L, MOVE_HEIDERN_NECK_ROLLER_H)
; - Final Bringer (MOVE_HEIDERN_FINAL_BRINGER_S)
MoveC_Heidern_NeckRoller:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
	mMvC_ChkFrame $00, .obj0
	mMvC_ChkFrame $01, .obj1
	mMvC_ChkFrame $02, .obj2
	mMvC_ChkFrame $03, .obj3
	mMvC_ChkFrame $04, .obj4
	mMvC_ChkFrame $05, .obj5
	mMvC_ChkFrame $06, .obj6
	mMvC_ChkFrame $07, .obj7
	mMvC_ChkFrame $08, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValFrameEnd .anim
		; Prepare for manual jump control
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		; Loop the attack frames 7 times
		ld   hl, iPlInfo_Heidern_NeckRoller_LoopCount
		add  hl, bc
		ld   [hl], $07
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj2
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		
		;
		; Initialize the jump settings.
		;
		
		; Y Speed -> 7px/frame up
		mMvC_SetSpeedV $F900
		
		; X Speed -> depends on the player distance.
		ld   hl, iPlInfo_PlDistance
		add  hl, bc
		ld   a, [hl]				; A = Distance
		ld   h, $26
		cp   h						; A >= $26?
		jp   nc, .obj1_setSpeedFar	; If so, jump
	.obj1_setSpeedNear:
		; Player is near opponent:
		; SpeedH = Distance * 4 / 256
		sla  a			; A = A * 4
		sla  a
		ld   l, a		; In the subpixel speed
		ld   h, $00
		jp   .obj1_setSpeed
	.obj1_setSpeedFar:
		; Player is far from the opponent:
		; SpeedH = Distance / 32
REPT 5
		srl  a			; A = A / 32
ENDR
		ld   h, a		; In the pixel speed
		ld   l, a
	.obj1_setSpeed:
		call Play_OBJLstS_SetSpeedH_ByXFlipR
		jp   .doGravity
; --------------- frame #2 ---------------
.obj2:
	; Immediately transition to the next frame, since YSpeed is always > -$0A
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_NextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #3 ---------------
.obj3:
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
	jp   nz, .startBackjump				; If so, jump
	.obj3_chkGuard_noGuard:
		; Otherwise, continue to #4
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		mMvC_SetFrame $04, $01
		mMvC_SetSpeedH +$0000
		; Force player over opponent
		push bc
			ld   hl, iPlInfo_OBJInfoXOther
			add  hl, bc
			push hl
			pop  bc
			ld   hl, iOBJInfo_X
			add  hl, de
			ld   a, [bc]
			inc  bc
			ldi  [hl], a
			inc  hl
			ld   a, [bc]
			ld   [hl], a
		pop  bc
		jp   .ret
.obj3_chkGuard_doGravity:
	jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	mMvC_ValFrameEnd .anim
	
		;
		; The super move (Final Bringer) transitions to Storm Bringer (health restore) on contact,
		; rather than continuing with the current move.
		;
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]
		cp   MOVE_HEIDERN_FINAL_BRINGER_S		; Doing the super move?
		jp   nz, .anim							; If not, skip
	
		; Force player on the ground
		ld   hl, iOBJInfo_Y
		add  hl, de
		ld   [hl], PL_FLOOR_POS
	
		; New Move
		ld   a, MOVE_HEIDERN_STORM_BRINGER_H
		call MoveInputS_SetSpecMove_StopSpeed
		
		; Initial hit
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		
		; Enable double damage for coming from the super
		ld   hl, iPlInfo_Heidern_StormBringer_FromSuper
		add  hl, bc
		ld   [hl], $01
		jp   .ret
; --------------- frame #5 ---------------
; Spinny damage loop #1.
.obj5:
	mMvC_ValFrameEnd .chkOtherEscape
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		mMvC_SetDamage $01, HITTYPE_HIT_MULTI1, PF3_CONTHIT
		mMvC_SetMoveV -$0100
		jp   .chkOtherEscape
; --------------- frame #6 ---------------
; Spinny damage loop #2.
.obj6:
	mMvC_ValFrameEnd .chkOtherEscape
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		mMvC_SetDamage $01, HITTYPE_HIT_MULTI0, PF3_CONTHIT
		
		; Loop back to #5 if the counter didn't elapse yet
		ld   hl, iPlInfo_Heidern_NeckRoller_LoopCount
		add  hl, bc
		dec  [hl]
		jp   z, .obj6_noLoop
		mMvC_SetFrame $05, $01
		jp   .ret
	.obj6_noLoop:
		; Deal knockdown
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		mMvC_SetDamage $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .chkOtherEscape
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
	jp   .startBackjump
; --------------- common gravity checker / frames #1-3 (before contact) ---------------
.doGravity:
	; If we land on the ground (ie: whiff), switch to #8.
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $08, $07
		jp   .ret
; --------------- frame #7 ---------------
; If we got here, we didn't whiff and finished dealing dealing damage to the opponent.
; Backjump away at the end.
.obj7:
	mMvC_ValFrameEnd .anim
; --------------- switch to backjump ---------------
	.startBackjump:
		ld   a, MOVE_SHARED_LAUNCH_UB_REC
		call Pl_SetMove_StopSpeed
		mMvC_SetSpeedH -$0300 ; 3px/frame back
		mMvC_SetSpeedV -$0500 ; 5px/frame up
		jp   .ret
; --------------- frame #8 ---------------
.chkEnd:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
; =============== MoveC_Heidern_StormBringer ===============
; Move code for Heidern's Storm Bringer (MOVE_HEIDERN_STORM_BRINGER_L, MOVE_HEIDERN_STORM_BRINGER_H).
; Also used as part of the Super Move.
; Command throw that recovers health.
MoveC_Heidern_StormBringer:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .setDamageStart
		mMvC_ChkFrame $02, .setDamageStart
		mMvC_ChkFrame $04, .setDamage0
		mMvC_ChkFrame $06, .setDamage1
		mMvC_ChkFrame $08, .setDamage0
		mMvC_ChkFrame $0A, .setDamage1
		mMvC_ChkFrame $0C, .setDamage0
		mMvC_ChkFrame $0E, .setDamage1
		mMvC_ChkFrame $10, .setDamage0
		mMvC_ChkFrame $12, .setDamage1
		mMvC_ChkFrame $14, .setDamageEnd
		mMvC_ChkFrame $15, .obj15
		mMvC_ChkFrame $16, .chkEnd
	jp   .anim
; --------------- frames #0,2 ---------------
; Deal damage.
.setDamageStart:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
		jp   .anim
; --------------- frames #4,8,C,10 ---------------
.setDamage0:
	mMvC_ValFrameEnd .anim
		; If we came here from the super move, deal double damage
		; iPlInfo_Heidern_StormBringer_FromSuper is set to $01 in that case.
		ld   hl, iPlInfo_Heidern_StormBringer_FromSuper
		add  hl, bc
		bit  0, [hl]
		jp   nz, .setDamageSuper0
	.setDamageNorm0:
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
		jp   .restoreHealth
	.setDamageSuper0:
		mMvC_SetDamageNext $02, HITTYPE_HIT_MULTI0, PF3_SUPERALT
		jp   .restoreHealth
; --------------- frames #6,A,E,12 ---------------
.setDamage1:
	mMvC_ValFrameEnd .anim
		; Same as above but for HITTYPE_HIT_MULTI1
		ld   hl, iPlInfo_Heidern_StormBringer_FromSuper
		add  hl, bc
		bit  0, [hl]
		jp   nz, .setDamageSuper1
	.setDamageNorm1:
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, $00
		jp   .restoreHealth
	.setDamageSuper1:
		mMvC_SetDamageNext $02, HITTYPE_HIT_MULTI1, PF3_SUPERALT
; --------------- common health restore  ---------------
	.restoreHealth:
		; Restores health line by line until we reach the cap
		ld   hl, iPlInfo_Health
		add  hl, bc
		ld   a, [hl]				; A = Health
		cp   PLAY_HEALTH_MAX		; Health == $48?
		jp   z, .chkOtherEscape		; If so, don't increment it anymore
		inc  [hl]					; Otherwise, Health++
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
		ld   a, MOVE_SHARED_HOP_B
		call Pl_SetMove_StopSpeed
		xor  a
		ld   [wPlayPlThrowActId], a
		jp   .ret
; --------------- frame #14 ---------------
.setDamageEnd:
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
	
; =============== MoveC_Heidern_MoonSlasher ===============
; Move code for Heidern's Moon Slasher (MOVE_HEIDERN_MOON_SLASHER_L, MOVE_HEIDERN_MOON_SLASHER_H).
MoveC_Heidern_MoonSlasher:
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
		; If we're at max power, deal extra damage
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_ChkNotMaxPow .anim ; Jump to .anim if not at max power
			mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
			jp   .anim
; --------------- frame #1 ---------------	
.obj1:
	mMvC_ValFrameStart .obj1_cont
		mMvC_SetMoveH +$0400
.obj1_cont:
	jp   .damageNotMaxPow
; --------------- frame #2 ---------------	
.obj2:
	mMvC_ValFrameStart .damageNotMaxPow
		mMvC_SetMoveH +$0400
; --------------- frmes #1-2 / extra damage check ---------------	
.damageNotMaxPow:
	; If we're at max power, deal extra damage
	mMvC_ValFrameEnd .anim
		mMvC_ChkNotMaxPow .anim ; Jump to .anim if not at max power
			mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
			jp   .anim
; --------------- frame #3 ---------------
.obj3:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $08
		jp   .anim
; --------------- frame #4 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== ProjInit_Heidern_CrossCutter ===============
; Initializes the projectile for Heidern's Cross Cutter (MOVE_HEIDERN_CROSS_CUTTER_L, MOVE_HEIDERN_CROSS_CUTTER_H)
ProjInit_Heidern_CrossCutter:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Heidern_CrossCutter)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Heidern_CrossCutter)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Heidern_CrossCutter)	; iOBJInfo_OBJLstPtrTbl_High
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

			jp   nc, .fldMaxPow					; Are we at max power? If not, jump
			cp   MOVE_HEIDERN_CROSS_CUTTER_H	; Was this an heavy attack?
			jp   z, .fldHeavy					; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_HEIDERN_CROSS_CUTTER_H	; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow				; If so, jump
		.fldLight:
			mMvC_SetSpeedH +$0100
			jp   .end
		.fldHeavyMaxPow:
			mMvC_SetSpeedH +$0200
			jp   .end
		.fldHeavy:
			mMvC_SetSpeedH +$0400
		.end:

		pop  de
	pop  bc
	ret
	
; 
