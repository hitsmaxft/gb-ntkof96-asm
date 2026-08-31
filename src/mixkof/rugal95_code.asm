; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Rugal_KickHN:
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
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #3 ---------------
.chkEnd:
	; Wait for the animation to advance before ending the move
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveInputReader_Rugal ===============
; Special move input checker for RUGAL.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Rugal:
	mMvIn_Validate Rugal
.chkAir:
	jp   MoveInputReader_Rugal_NoMove
	
.chkGround:
	; Easy Move review against KOF95 bank18: Reppu Ken is DF, Genocide
	; Cutter is DB, Dark Barrier is DF+K, God Press is FDB, Kaiser Wave is
	; FBDF, and Gigantic Pressure is the only super. F and B stay distinct.
	mMvIn_ChkEasyDir MoveInit_Rugal_ReppuKen, MoveInit_Rugal_GenocideCutter, MoveInit_Rugal_DarkBarrier, MoveInit_Rugal_GodPress, MoveInit_Rugal_KaiserWave, MoveInit_Rugal_GiganticPressure, MoveInputReader_Rugal_NoMove
	mMvIn_ChkGA Rugal, .chkPunch, .chkKick

.chkPunch:
	; FBDF+P -> Kaiser Wave
	mMvIn_ChkDir MoveInput_FBDF, MoveInit_Rugal_KaiserWave
	; FDB+P -> God Press
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Rugal_GodPress
	; DF+P -> Reppu Ken
	mMvIn_ChkDir MoveInput_DF, MoveInit_Rugal_ReppuKen
	; End
	jp   MoveInputReader_Rugal_NoMove
.chkKick:
	mMvIn_ValSuper .chkKickNoSuper
	; FDBFDB+K -> Gigantic Pressure
	mMvIn_ChkDir MoveInput_FDBFDB, MoveInit_Rugal_GiganticPressure
.chkKickNoSuper:
	; DB+K -> Genocide Cutter
	mMvIn_ChkDir MoveInput_DB, MoveInit_Rugal_GenocideCutter
	; DF+K -> Dark Barrier
	mMvIn_ChkDir MoveInput_DF, MoveInit_Rugal_DarkBarrier
	; End
	jp   MoveInputReader_Rugal_NoMove
	
; =============== MoveInit_Rugal_ReppuKen ===============
MoveInit_Rugal_ReppuKen:
	mMvIn_ValProjActive MoveInputReader_Rugal_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RUGAL_REPPU_KEN_L, MOVE_RUGAL_REPPU_KEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Rugal_MoveSet
	
; =============== MoveInit_Rugal_GodPress ===============
MoveInit_Rugal_GodPress:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RUGAL_GOD_PRESS_L, MOVE_RUGAL_GOD_PRESS_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Rugal_MoveSet
	
; =============== MoveInit_Rugal_DarkBarrier ===============
MoveInit_Rugal_DarkBarrier:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_RUGAL_DARK_BARRIER_L, MOVE_RUGAL_DARK_BARRIER_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREFLECT, [hl]
	jp   MoveInputReader_Rugal_MoveSet
	
; =============== MoveInit_Rugal_GenocideCutter ===============
MoveInit_Rugal_GenocideCutter:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_RUGAL_GENOCIDE_CUTTER_L, MOVE_RUGAL_GENOCIDE_CUTTER_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Rugal_MoveSet
	
; =============== MoveInit_Rugal_KaiserWave ===============
MoveInit_Rugal_KaiserWave:
	mMvIn_ValProjActive MoveInputReader_Rugal_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RUGAL_KAISER_WAVE_L, MOVE_RUGAL_KAISER_WAVE_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Rugal_MoveSet
	
; =============== MoveInit_Rugal_GiganticPressure ===============
MoveInit_Rugal_GiganticPressure:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_RUGAL_GIGANTIC_PRESSURE_S
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Rugal_MoveSet
	
; =============== MoveInputReader_Rugal_MoveSet ===============
MoveInputReader_Rugal_MoveSet:
	scf  
	ret  
; =============== MoveInputReader_Rugal_NoMove ===============
MoveInputReader_Rugal_NoMove:
	or   a
	ret
	
; =============== MoveC_Rugal_ReppuKen ===============
; Move code for Rugal's:
; - Reppu Ken (MOVE_RUGAL_REPPU_KEN_L, MOVE_RUGAL_REPPU_KEN_H)
; - Kaiser Wave (MOVE_RUGAL_KAISER_WAVE_L, MOVE_RUGAL_KAISER_WAVE_H)
MoveC_Rugal_ReppuKen:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
	jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
	
		;
		; How long to stay in #3 after the projectile spawns?
		; The heavy version stays for longer.
		;
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; HL = Ptr to anim speed
		cp   MOVE_RUGAL_REPPU_KEN_H		; Doing the heavy version?
		jp   z, .obj1_setSpeedH			; If so, jump
		cp   MOVE_RUGAL_KAISER_WAVE_H	; Doing the heavy version?
		jp   z, .obj1_setSpeedH			; If so, jump
	.obj1_setSpeedL:
		; KOF96-paced projectile recovery: about one third of $08/$10.
		ld   [hl], $03
		jp   .anim
	.obj1_setSpeedH:
		ld   [hl], $05
		jp   .anim

; --------------- frame #3 ---------------
.obj3:
	;
	; Spawn the proper projectile type at the start
	;
	mMvC_ValFrameStartFast .chkEnd
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]
		cp   MOVE_RUGAL_REPPU_KEN_L
		jp   z, .obj3_reppuKen
		cp   MOVE_RUGAL_REPPU_KEN_H
		jp   z, .obj3_reppuKen
	.obj3_kaiserWave:
		call ProjInit_Rugal_KaiserWave
		jp   .chkEnd
	.obj3_reppuKen:
		call ProjInit_Rugal_ReppuKen
.chkEnd:
	; Wait for recovery
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Rugal_DarkBarrier ===============
; Move code for Rugal's Dark Barrier (MOVE_RUGAL_DARK_BARRIER_L, MOVE_RUGAL_DARK_BARRIER_H).
; See also: MoveC_Athena_PsychoReflector
MoveC_Rugal_DarkBarrier:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .chkHit
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #3 ---------------
; Shield disappears.
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		; Animate the shield as fast as possible
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		
		mMvC_PlaySound SCT_REFLECT
		
		; Determine how long the shield is active (loop count from #2 to #1)
		mMvC_ChkMove MOVE_RUGAL_DARK_BARRIER_H, .obj0_setLoopH
	.obj0_setLoopL:
		ld   hl, iPlInfo_Rugal_DarkBarrier_LoopCount
		add  hl, bc
		; Match the shortened KOF96-style reflector active window.
		ld   [hl], $02
		jp   .anim
	.obj0_setLoopH:
		ld   hl, iPlInfo_Rugal_DarkBarrier_LoopCount
		add  hl, bc
		ld   [hl], $03
		jp   .anim
		
; --------------- frame #2 ---------------
; Shield frame #1
.obj2:
	mMvC_ValFrameEnd .chkHit
		; If the loop counter didn't elapse, loop back to #1
		ld   hl, iPlInfo_Rugal_DarkBarrier_LoopCount
		add  hl, bc
		dec  [hl]					; Is the counter elapsed?
		jp   z, .anim				; If it did, allow continuing to #3
		mMvC_SetFrame $01, $00
		jp   .ret
; --------------- common hit check / frames #1-2 ---------------
; Shield frame #0
.chkHit:
	; If the opponent is hit, switch to #3
	mMvC_ValHit .anim, .anim
		mMvC_SetFrame $03, $00
		jp   .ret
; --------------- frame #6 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
	
; =============== MoveC_Rugal_GenocideCutter ===============
; Move code for Rugal's Genocide Cutter (MOVE_RUGAL_GENOCIDE_CUTTER_L, MOVE_RUGAL_GENOCIDE_CUTTER_H).
MoveC_Rugal_GenocideCutter:
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
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		; Prepare for jump
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
		; Set big damage
		mMvC_SetDamageNext $09, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
		jp   .anim
; --------------- frame #1 ---------------
; Jump.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetMoveH $0800
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Set jump settings
		mMvC_ChkMove MOVE_RUGAL_GENOCIDE_CUTTER_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0400
		jp   .obj1_cont
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0600
		jp   .obj1_cont
	.obj1_setJumpE: ; Max Power Heavy 
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0700
.obj1_cont:
	; Wait for YSpeed > -$06 before continuing. This only delays the Max Power version.
	mMvC_NextFrameOnGtYSpeed -$06, ANIMSPEED_INSTANT
	jp   .doGravity
; --------------- frame #2 ---------------
; Jump.
.obj2:
	; Immediately switch to #3
	mMvC_NextFrameOnGtYSpeed -$06, ANIMSPEED_NONE
		mMvC_SetSpeedH $0040
		jp   .doGravity
; --------------- frame #3 ---------------
; Jump.
.obj3:
	; Force low speed
	mMvC_SetSpeedH $0040
; --------------- common gravity check / frames #1-3 ---------------
.doGravity:
	; Easy DF+A selects the light version. Increase only its gravity so the
	; complete cutter (startup + flight + recovery) is approximately half the
	; previous duration without changing the initial launch impulse.
	ld   hl, iPlInfo_MoveId
	add  hl, bc
	ld   a, [hl]
	cp   MOVE_RUGAL_GENOCIDE_CUTTER_H
	jr   z, .doGravityNorm
	ld   hl, $0240
	jr   .doGravityApply
.doGravityNorm:
	ld   hl, $0060
.doGravityApply:
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
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]
		cp   MOVE_RUGAL_GENOCIDE_CUTTER_H
		jr   z, .setLandH
		mMvC_SetLandFrame $04, $02
		jp   .ret
	.setLandH:
		mMvC_SetLandFrame $04, $05
		jp   .ret
; --------------- frame #4 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Rugal_GodPress ===============
; Move code for Rugal's God Press (MOVE_RUGAL_GOD_PRESS_L, MOVE_RUGAL_GOD_PRESS_H).
; Rugal rushes forwards, grabs the opponent, and smashes them at the edge of the playfield.
MoveC_Rugal_GodPress:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		; Short startup for the KOF96 battle cadence.
		mMvC_SetAnimSpeed $03
		jp   .anim
; --------------- frame #1 ---------------
; Run forwards attempting to grab the opponent.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		; Set dash speed, depending on the move strength
		mMvC_ChkMove MOVE_RUGAL_GOD_PRESS_H, .obj1_setSpeedH
	.obj1_setSpeedL: ; Light
		mMvC_SetSpeedH +$0400
		jp   .obj1_cont
	.obj1_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj1_setSpeedE
		mMvC_SetSpeedH +$0500
		jp   .obj1_cont
	.obj1_setSpeedE: ; Max Power Heavy
		mMvC_SetSpeedH +$0600
.obj1_cont:
	; If by the end of the frame, we didn't reach the opponent
	mMvC_ValFrameEnd .chkOtherHit
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetFrameOnEnd $04
		jp   .moveH
		
.chkOtherHit:
	;
	; If we didn't hit the opponent yet, return without doing anything.
	; 
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]			; Did we reach?
	jp   z, .moveH						; If not, skip
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]				; Is the opponent invulnerable?
	jp   nz, .moveH						; If so, skip
	bit  PF1B_HITRECV, [hl]				; Did the opponent get hit?
	jp   z, .moveH						; If not, skip	
	;
	; If the hit is blocked, backhop away.
	;	
	bit  PF1B_GUARD, [hl]				; Is the opponent blocking?
	jp   nz, .switchToBackHop			; If so, jump
	
	.chkOtherHit_ok:
		;
		; The hit wasn't blocked, so switch to #2 to continue the attack.
		;
		mMvC_SetFrame $02, ANIMSPEED_NONE
		ld   a, PLAY_THROWACT_NEXT03
		ld   [wPlayPlThrowActId], a
		mMvC_SetDamageNext $08, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
		mMvC_SetDamage $08, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
		; KOF96 replaced KOF95's GRAB_UB_SYNC hit type with the generic
		; rotation grab. Supply the missing per-frame position sync explicitly:
		; hold the victim 4px behind and 16px above Rugal while he runs.
		mMvC_MoveThrowOp -$04, -$10
		mMvC_MoveThrowOpSync
	IF FIX_BUGS
		jp   .ret
	ELSE
		jp   MoveC_Rugal_GiganticPressure.ret
	ENDC


; --------------- frame #2 ---------------	
; Runs forward holding the opponent until reaching the edge of the stage.
.obj2:

	;
	; If the opponent isn't in the intended HITTYPE_GRAB_ROTU after 8 frames,
	; assume that something went wrong and hop back, ending the move.
	;
	
	;--
	ld   hl, iOBJInfo_Status
	add  hl, de
	bit  OSTB_GFXNEWLOAD, [hl]	; First time we get here?
	jp   nz, .obj2_chkEdge		; If so, skip (not needed, see below)
	;--
	
		; Delay the first hit and the HITTYPE check for the first 5 frames.
		; We can do it this way since we know the initial value iOBJInfo_FrameLeft is set to,
		; and that decrements every frame.
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   a, [hl]
		cp   ANIMSPEED_NONE-$05		; iOBJInfo_FrameLeft >= $FA?
		jp   nc, .obj2_1stDamage	; If so, skip
		
		ld   hl, iPlInfo_HitTypeIdOther
		add  hl, bc
		ld   a, [hl]
		cp   HITTYPE_GRAB_ROTU	; Opponent's HitType != HITTYPE_GRAB_ROTU?
		jp   nz, .switchToBackHop	; If so, jump
		
	jp   .obj2_chkEdge
.obj2_1stDamage:
	; Deal the hit on contact, which will only take effect once.
	mMvC_SetDamage $08, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
.obj2_chkEdge:
	
	;
	; Continue moving until either we or the opponent get near the edge of the stage.
	; When that happens, switch to #3, the recovery.
	;
	ld   hl, iPlInfo_OBJInfoXOther
	add  hl, bc
	ld   a, [hl]
	cp   $20
	jp   c, .obj2_setDamage
	cp   $E0
	jp   nc, .obj2_setDamage
	ld   hl, iOBJInfo_X
	add  hl, de
	ld   a, [hl]
	cp   $20
	jp   c, .obj2_setDamage
	cp   $E0
	jp   nc, .obj2_setDamage
	; Otherwise, continue moving
	jp   .moveH
.obj2_setDamage:
	;
	; Switch to #3 and setup the damage dealt by the move.
	;
	mMvC_SetFrame $03, $08
	mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	xor  a
	ld   [wPlayPlGrabRotSync], a
	jp   .ret
; --------------- frame #3 ---------------
.obj3:
	mMvC_ValFrameEnd .anim
; --------------- common early end - opponent blocked ---------------
.switchToBackHop:
	; When the opponent blocks the move, hop away.
	ld   a, MOVE_SHARED_HOP_B
	call Pl_SetMove_StopSpeed
	; And end the throw sequence
	ld   a, PLAY_THROWACT_NONE
	ld   [wPlayPlThrowActId], a
	xor  a
	ld   [wPlayPlGrabRotSync], a
	jp   .ret
; --------------- common forwards movement / frames #1-3 ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- frame #4 ---------------
.chkEnd:
	mMvC_ChkFrictionH $0100, .anim
		; End the throw
		call Play_Pl_EndMove
		ld   a, PLAY_THROWACT_NONE
		ld   [wPlayPlThrowActId], a
		xor  a
		ld   [wPlayPlGrabRotSync], a
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Rugal_GiganticPressure ===============
; Move code for Rugal's Gigantic Pressure (MOVE_RUGAL_GIGANTIC_PRESSURE_S).
MoveC_Rugal_GiganticPressure:
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
; --------------- frame #0 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		; About one third of the original 16-frame startup.
		mMvC_SetAnimSpeed $05
		jp   .anim
; --------------- frame #2 ---------------
; Initial dash towards opponent.
.obj2:
	mMvC_ValFrameStartFast .obj2_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		; Set dash speed
		mMvC_SetSpeedH +$0700
.obj2_cont:
	mMvC_ValFrameEnd .chkOtherHit
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetFrameOnEnd $05
		jp   .moveH
		
; --------------- hit check / frame #2 ---------------
; Checks if the opponent was successfully hit.
.chkOtherHit:
	;
	; If we didn't hit the opponent yet, return without doing anything.
	; 
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]		; Did we reach?
	jp   z, .moveH					; If not, skip
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]			; Is the opponent invulnerable?
	jp   nz, .moveH					; If so, skip
	bit  PF1B_HITRECV, [hl]			; Did the opponent get hit?
	jp   z, .moveH					; If not, skip	
	;
	; If the hit is blocked, backhop away.
	;	
	bit  PF1B_GUARD, [hl]			; Is the opponent blocking?
	jp   nz, .switchToBackHop		; If so, jump
	
	.chkOtherHit_ok:
		;
		; The hit wasn't blocked, so switch to #3 to continue the attack.
		;
		mMvC_SetFrame $03, ANIMSPEED_NONE
		ld   a, PLAY_THROWACT_NEXT03
		ld   [wPlayPlThrowActId], a
		mMvC_SetDamageNext $20, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
		mMvC_SetDamage $20, HITTYPE_GRAB_ROTU, PF3_HEAVYHIT
		mMvC_MoveThrowOp -$04, -$10
		mMvC_MoveThrowOpSync
		jp   .ret
		
; --------------- frame #4 ---------------	
; Runs forward holding the opponent until reaching the edge of the stage.
.obj3:

	;
	; If the opponent isn't in the intended HITTYPE_GRAB_ROTU after 8 frames,
	; assume that something went wrong and hop back, ending the move.
	;
	
	;--
	ld   hl, iOBJInfo_Status
	add  hl, de
	bit  OSTB_GFXNEWLOAD, [hl]	; First time we get here?
	jp   nz, .obj3_chkEdge		; If so, skip (not needed, see below)
	;--
	
		; Skip the HITTYPE check for the first 8 frames.
		; We can do it this way since we know the initial value iOBJInfo_FrameLeft is set to,
		; and that decrements every frame.
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   a, [hl]
		cp   ANIMSPEED_NONE-$07		; iOBJInfo_FrameLeft >= $F8?
		jp   nc, .obj3_chkEdge		; If so, skip
		
		ld   hl, iPlInfo_HitTypeIdOther
		add  hl, bc
		ld   a, [hl]
		cp   HITTYPE_GRAB_ROTU	; Opponent's HitType != HITTYPE_GRAB_ROTU?
		jp   nz, .switchToBackHop	; If so, jump
.obj3_chkEdge:
	;
	; Continue moving until either we or the opponent get near the edge of the stage.
	; When that happens, switch to #5 and spawn the skull projectile.
	;
	ld   hl, iPlInfo_OBJInfoXOther
	add  hl, bc
	ld   a, [hl]
	cp   $20
	jp   c, .obj3_setDamage
	cp   $E0
	jp   nc, .obj3_setDamage
	ld   hl, iOBJInfo_X
	add  hl, de
	ld   a, [hl]
	cp   $20
	jp   c, .obj3_setDamage
	cp   $E0
	jp   nc, .obj3_setDamage
	; Otherwise, continue moving
	jp   .moveH
.obj3_setDamage:
	;
	; Switch to #4 and setup the damage dealt by the move.
	;
	mMvC_SetFrame $04, $08
	mMvC_SetDamageNext $20, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
	xor  a
	ld   [wPlayPlGrabRotSync], a
	jp   .ret
; --------------- frame #4 ---------------
; Last frame, with Rugal and the opponent on the wall.
.obj4:
	mMvC_ValFrameEnd .anim
		; Set damage settings
		mMvC_SetDamageNext $20, HITTYPE_LAUNCH_SWOOPUP, PF3_HEAVYHIT
		; Copy them over to the projectile
		call Play_Proj_CopyMoveDamageFromPl
		; And spawn said projectile
		call ProjInit_Rugal_GiganticPressure
		; Finally, backhop and end the move.
		
; --------------- common backhop switch ---------------
; Switches to the backwards hop.
.switchToBackHop:
	ld   a, MOVE_SHARED_HOP_B
	call Pl_SetMove_StopSpeed
	ld   a, PLAY_THROWACT_NONE
	ld   [wPlayPlThrowActId], a
	xor  a
	ld   [wPlayPlGrabRotSync], a
	jp   .ret
; --------------- common horizontal movement ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- frame #5 ---------------
; Slow down, and when we stop moving end the move.
; We get here only if the opponent wasn't hit.
.chkEnd:
	mMvC_ChkFrictionH $0100, .anim
		call Play_Pl_EndMove
		ld   a, PLAY_THROWACT_NONE
		ld   [wPlayPlThrowActId], a
		xor  a
		ld   [wPlayPlGrabRotSync], a
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== ProjInit_Rugal_ReppuKen ===============
; Initializes the projectile for Rugal's Reppu Ken (MOVE_RUGAL_REPPU_KEN_L, MOVE_RUGAL_REPPU_KEN_H).
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Rugal_ReppuKen:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Rugal_ReppuKen)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Rugal_ReppuKen)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Rugal_ReppuKen)	; iOBJInfo_OBJLstPtrTbl_High
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
			pop  af	; Restore A & C flag

			;
			; Determine projectile horizontal speed.
			;

			jp   nc, .fldMaxPow				; Are we at max power? If not, jump
			cp   MOVE_RUGAL_REPPU_KEN_H		; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_RUGAL_REPPU_KEN_H		; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow			; If so, jump
		.fldLight:
			ld   hl, +$0100
			jp   .setSpeedH
		.fldHeavyMaxPow:
			ld   hl, +$0200
			jp   .setSpeedH
		.fldHeavy:
			ld   hl, +$0400
		.setSpeedH:
			call Play_OBJLstS_SetSpeedH_ByXFlipR

		pop  de
	pop  bc
	ret
	
; =============== ProjInit_Rugal_KaiserWave ===============
; Initializes the projectile for Rugal's Kaiser Wave (MOVE_RUGAL_KAISER_WAVE_L, MOVE_RUGAL_KAISER_WAVE_H).
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Rugal_KaiserWave:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Rugal_KaiserWave)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Rugal_KaiserWave)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Rugal_KaiserWave)	; iOBJInfo_OBJLstPtrTbl_High
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
			cp   MOVE_RUGAL_KAISER_WAVE_H	; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_RUGAL_KAISER_WAVE_H	; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow			; If so, jump
		.fldLight:
			ld   hl, +$0100
			jp   .setSpeedH
		.fldHeavyMaxPow:
			ld   hl, +$0200
			jp   .setSpeedH
		.fldHeavy:
			ld   hl, +$0400
		.setSpeedH:
			call Play_OBJLstS_SetSpeedH_ByXFlipR

		pop  de
	pop  bc
	ret

; =============== ProjInit_Rugal_GiganticPressure ===============
; Initializes the projectile for Rugal's Gigantic Pressure (MOVE_RUGAL_GIGANTIC_PRESSURE_S).
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Rugal_GiganticPressure:
	mMvC_PlaySound SCT_PROJ_LG_A
	push bc
		push de
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
			ld   [hl], BANK(ProjC_Rugal_GiganticPressure)	; BANK $18 ; iOBJInfo_Play_CodeBank
			inc  hl
			ld   [hl], LOW(ProjC_Rugal_GiganticPressure)	; iOBJInfo_Play_CodePtr_Low
			inc  hl
			ld   [hl], HIGH(ProjC_Rugal_GiganticPressure)	; iOBJInfo_Play_CodePtr_High

			; Write sprite mapping ptr for this projectile.
			ld   hl, iOBJInfo_BankNum
			add  hl, de
			ld   [hl], BANK(OBJLstPtrTable_Proj_Rugal_GiganticPressure)	; BANK $01 ; iOBJInfo_BankNum
			inc  hl
			ld   [hl], LOW(OBJLstPtrTable_Proj_Rugal_GiganticPressure)	; iOBJInfo_OBJLstPtrTbl_Low
			inc  hl
			ld   [hl], HIGH(OBJLstPtrTable_Proj_Rugal_GiganticPressure)	; iOBJInfo_OBJLstPtrTbl_High
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
			ld   [hl], PROJ_PRIORITY_NODESPAWN

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
			mMvC_SetMoveH +$0000
		pop  de
	pop  bc
	ret
	
; =============== ProjC_Rugal_GiganticPressure ===============
; Projectile code for Rugal's Gigantic Pressure (MOVE_RUGAL_GIGANTIC_PRESSURE_S).
ProjC_Rugal_GiganticPressure:
	; Wait for the sprite counter to reach $1A before despawning
	mMvC_StartChkFrameInt
		mMvC_ChkFrame $1A, .chkEnd
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
	ret  
.chkEnd:
	mMvC_ValFrameEnd .anim
		call OBJLstS_Hide
		ret
	
; =============== MoveC_Kensou_ThrowG ===============
; Move code for Kensou's ground throw. (MOVE_SHARED_THROW_G).
; See also: MoveC_Kyo_ThrowG
