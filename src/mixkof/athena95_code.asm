; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Athena95_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_MID_UB_NOSTUN, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $14
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

; =============== MoveC_Athena95_ThrowA ===============
; Move code for Athena's Air Throw. (MOVE_SHARED_THROW_A).
; This launches the opponent forwards, diagonally down.
MoveC_Athena95_ThrowA:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .doGravity
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		; Throw the opponent straight down.
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Backjump away at the start
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetSpeedH -$0200
		mMvC_SetSpeedV -$0200
.obj1_cont:
	mMvC_ValFrameEnd .doGravity
		; Set manual control for the gravity check
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doGravity
; --------------- common gravity check / frames #1-2 ---------------
.doGravity:
	; Switch to #4 when landing on the ground
	mMvC_ChkGravityHV $0060, .anim
		mMvC_SetLandFrame $03, $04
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
	
; =============== MoveC_Athena95_PhoenixBomb ===============
; Move code for Athena's Phoenix Bomb. (MOVE_SHARED_KICK_AHD).
MoveC_Athena95_PhoenixBomb:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .doGravity
		mMvC_ChkFrame $04, .chkEnd
; --------------- frame #3 ---------------
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	; Keep moving downwards until the opponent is hit
	mMvC_ValHit .doGravity, .doGravity
		; On contact, rebound the opposite way
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00			; Reset frame #0
		mMvC_SetSpeedH -$0080	; 0.5px/frame back
		mMvC_SetSpeedV -$0300	; 3px/frame up
		jp   .doGravity
; --------------- frame #1 ---------------
.obj1:
	; Switch to #2 on the jump peak
	mMvC_NextFrameOnGtYSpeed $00, ANIMSPEED_NONE
	jp   .doGravity
; --------------- common gravity check / frames #0-2 ---------------
.doGravity:
	; When landing on the ground, switch to #3
	mMvC_ChkGravityHV $0060, .anim
		mMvC_SetLandFrame $04, $04
		jp   .ret
; --------------- frame #4 ---------------
; Recovery when landed on the ground.
.chkEnd:
IF FIX_BUGS
	mMvC_ValFrameEnd .anim
ELSE
	mMvC_ValFrameEnd MoveC_Athena95_ThrowA.anim
ENDC
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  

; =============== MoveInputReader_Athena95 ===============
; Special move input checker for ATHENA.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Athena95:
	mMvIn_Validate Athena95
.chkAir:
	;             SELECT + B                     SELECT + A
	mMvIn_ChkEasy MoveInit_Athena95_ShCrystGround, MoveInit_Athena95_PhoenixArrow
	mMvIn_ChkGA Athena95, .chkAirPunch, MoveInputReader_Athena95_NoMove
	
.chkAirPunch:
	; FDF+P (air) -> Psycho Sword
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Athena95_PsychoSword
	; DB+P (air) -> Phoenix Arrow
	mMvIn_ChkDir MoveInput_DB, MoveInit_Athena95_PhoenixArrow
	; End
	jp   MoveInputReader_Athena95_NoMove
	
.chkGround:
	; KOF95 command-family mapping. Athena has four ground specials, so the
	; outer back route shares Psycho Reflector with down-back; importantly, the
	; forward and back shortcuts remain distinct.
	mMvIn_ChkEasyDir MoveInit_Athena95_PsychoBall, MoveInit_Athena95_PsychoSword, MoveInit_Athena95_PhoenixArrow, MoveInit_Athena95_PsychoReflector, MoveInit_Athena95_PsychoReflector, MoveInit_Athena95_ShCrystGround, MoveInputReader_Athena95_NoMove
	mMvIn_ChkGA Athena95, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; BFDB+P -> Shining Crystal Bit
	mMvIn_ChkDir MoveInput_BFDB, MoveInit_Athena95_ShCrystGround
.chkPunchNoSuper:
	; FDF+P -> Psycho Sword
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Athena95_PsychoSword
	; DB+P -> Psycho Ball
	mMvIn_ChkDir MoveInput_DB, MoveInit_Athena95_PsychoBall
	; End
	jp   MoveInputReader_Athena95_NoMove
.chkKick:
	; BDF+K -> Psycho Reflector
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Athena95_PsychoReflector
	; End
	jp   MoveInputReader_Athena95_NoMove
	
; =============== MoveInit_Athena95_PsychoBall ===============	
MoveInit_Athena95_PsychoBall:
	mMvIn_ValProjActive MoveInputReader_Athena95_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_ATHENA95_PSYCHO_BALL_L, MOVE_ATHENA95_PSYCHO_BALL_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Athena95_MoveSet
	
; =============== MoveInit_Athena95_PsychoReflector ===============
MoveInit_Athena95_PsychoReflector:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_ATHENA95_PSYCHO_REFLECTOR_L, MOVE_ATHENA95_PSYCHO_REFLECTOR_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREFLECT, [hl]
	jp   MoveInputReader_Athena95_MoveSet
	
; =============== MoveInit_Athena95_PsychoSword ===============
MoveInit_Athena95_PsychoSword:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_ATHENA95_PSYCHO_SWORD_L, MOVE_ATHENA95_PSYCHO_SWORD_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Athena95_MoveSet
	
; =============== MoveInit_Athena95_PhoenixArrow ===============
MoveInit_Athena95_PhoenixArrow:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_ATHENA95_PHOENIX_ARROW_L, MOVE_ATHENA95_PHOENIX_ARROW_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Athena95_MoveSet
	
; =============== MoveInit_Athena95_ShCrystGround ===============
MoveInit_Athena95_ShCrystGround:
	mMvIn_ValProjActive MoveInputReader_Athena95_NoMove
	
	; Don't start the move if a projectile sprite is visible.
	; Normally it would be enough to use mMvIn_ValProjActive, 
	; but Athena can reflect projectiles, and when that happens 
	; PF0B_PROJACTIVE isn't updated (by mistake?).
	ld   hl, (OBJINFO_SIZE*2)+iOBJInfo_Status
	add  hl, de								; Seek to the projectile status (2 OBJInfo after the player)
	bit  OSTB_VISIBLE, [hl]					; Is it visible?
	jp   nz, MoveInputReader_Athena95_NoMove	; If so, don't start the move.
	
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_ATHENA95_SHINING_CRYSTAL_BIT_GS
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Athena95_MoveSet
	
; =============== MoveInputReader_Athena95_MoveSet ===============
MoveInputReader_Athena95_MoveSet:
	scf
	ret
; =============== MoveInputReader_Athena95_NoMove ===============
MoveInputReader_Athena95_NoMove:
	or   a
	ret
	
; =============== MoveC_Athena95_PsychoBall ===============
; Move code for Athena's Psycho Ball (MOVE_ATHENA95_PSYCHO_BALL_L, MOVE_ATHENA95_PSYCHO_BALL_H).
; Horizontal projectile.
; See also: MoveC_Ryo_KoOuKenG
MoveC_Athena95_PsychoBall:
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
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; HL = Ptr to anim speed
		cp   MOVE_ATHENA95_PSYCHO_BALL_H	; Doing the heavy version?
		jp   z, .obj0_setSpeedH			; If so, jump
	.obj0_setSpeedL:
		ld   [hl], $0C
		jp   .anim
	.obj0_setSpeedH:
		ld   [hl], $18
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .chkEnd
		call ProjInit_Athena95_PsychoBall
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; KOF95 Psycho Ball projectile initialization adapted to KOF96's shared
; projectile-slot initializer. The move-id comparison is retained because 95
; encodes light/heavy in the first special-move pair.
ProjInit_Athena95_PsychoBall:
	mMvC_PlaySound SCT_PROJ_LG_B
	push bc
		push de
			ld   hl, iPlInfo_Pow
			add  hl, bc
			ld   a, [hl]
			cp   PLAY_POW_MAX
			jr   z, .maxPow
			or   a
			jr   .getMove
		.maxPow:
			scf
		.getMove:
			ld   hl, iPlInfo_MoveId
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Athena_PsychoBall_Athena95)
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Athena_PsychoBall_Athena95)
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Athena_PsychoBall_Athena95)
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
				mMvC_SetMoveH +$1000
				mMvC_SetMoveV -$0400
			pop  af
			jr   nc, .noMaxPow
			cp   MOVE_ATHENA95_PSYCHO_BALL_H
			jr   z, .heavy
			jr   .light
		.noMaxPow:
			cp   MOVE_ATHENA95_PSYCHO_BALL_H
			jr   z, .heavyMaxPow
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
	
; =============== MoveC_Athena95_PsychoReflector ===============
; Move code for Athena's Psycho Reflector (MOVE_ATHENA95_PSYCHO_REFLECTOR_L, MOVE_ATHENA95_PSYCHO_REFLECTOR_H).
; In this game, the reflector is a literal shield.
MoveC_Athena95_PsychoReflector:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .chkHit
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .chkEnd
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
		mMvC_ChkMove MOVE_ATHENA95_PSYCHO_REFLECTOR_H, .obj0_setLoopH
	.obj0_setLoopL:
		ld   hl, iPlInfo_Athena_PsychoReflector_LoopCount
		add  hl, bc
		; Match the compact active window of KOF96 Athena's reflector.
		ld   [hl], $02
		jp   .anim
	.obj0_setLoopH:
		ld   hl, iPlInfo_Athena_PsychoReflector_LoopCount
		add  hl, bc
		ld   [hl], $03
		jp   .anim
		
; --------------- frame #2 ---------------
; Shield frame #1
.obj2:
	mMvC_ValFrameEnd .chkHit
		; If the loop counter didn't elapse, loop back to #1
		ld   hl, iPlInfo_Athena_PsychoReflector_LoopCount
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
; --------------- frame #4 ---------------
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

; =============== MoveC_Athena95_PsychoSword ===============
; Move code for Athena's Psycho Sword (MOVE_ATHENA95_PSYCHO_SWORD_L, MOVE_ATHENA95_PSYCHO_SWORD_H)
MoveC_Athena95_PsychoSword:
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
		mMvC_ChkFrame $06, .chkGravity
		mMvC_ChkFrame $07, .chkEnd
; --------------- frame #0 ---------------	
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------	
.obj1:
	mMvC_ValFrameStart .obj1_cont
		mMvC_SetMoveH $0800
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Set different jump speed depending on attack strength
		mMvC_ChkMove MOVE_ATHENA95_PSYCHO_SWORD_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj1_chkGravity
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj1_chkGravity
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0800
	.obj1_chkGravity:
		jp   .chkGravity
.obj1_cont:
	; Immediately switch to #2, since the Y speed is always > -$0A.
	; Unlike 96, this does not deal low continuous damage, but rather a single large hit
	; at the end of the frames.
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .chkGravity ; YSpeed > -$0A? If not, jump
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .chkGravity
; --------------- frame #2 ---------------	
.obj2:
	; Identical to .obj1_cont, more immediate damage
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .chkGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .chkGravity

; frames #3-5 handle the straight upwards part of the DP, continuing the animation when reaching a Y Speed threshold
; --------------- frame #3 ---------------
; Immediate threshold, to clear the horizontal speed as soon as possible.
.obj3:
	ld   a, -$0A
	jp   .chkThresholdY
; --------------- frame #4 ---------------	
.obj4:
	ld   a, -$03
	jp   .chkThresholdY
; --------------- frame #5 ---------------	
.obj5:
	ld   a, +$00
; --------------- common YSpeed threshold check / frames #3-5 ---------------
.chkThresholdY:
	ld   h, ANIMSPEED_NONE			; Manual control as always
	call OBJLstS_ReqAnimOnGtYSpeed	; mMvC_NextFrameOnGtYSpeed <A>, ANIMSPEED_NONE
	jp   nc, .chkGravity			; YSpeed >= Threshold? If not, jump
	mMvC_SetSpeedH $0000			; No horizontal movement on these three frames
	jp   .chkGravity
	
; --------------- common gravity handler ---------------
; If we touch the ground at any point between #1-#7, switch to #8.
.chkGravity:
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $07, $07
		jp   .ret
; --------------- frame #8 ---------------	
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		;--
		; [POI] Not used.
		ld   hl, iPlInfo_Athena_PsychoSword_77
		add  hl, bc
		ld   [hl], $00
		;--
		jr   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Athena95_PhoenixArrow ===============
; Move code for Athena's Phoenix Arrow (MOVE_ATHENA95_PHOENIX_ARROW_L, MOVE_ATHENA95_PHOENIX_ARROW_H).
MoveC_Athena95_PhoenixArrow:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj2
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		jp   .anim
; --------------- frame #1 ---------------
; Diagonal forward-down dive from the air.
.obj1:
	mMvC_ValFrameStart .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		mMvC_ChkMove MOVE_ATHENA95_PHOENIX_ARROW_H, .obj1_setDashH
	.obj1_setDashL: ; Light
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV +$0200
		jp   .obj1_cont
	.obj1_setDashH: ; Heavy
		mMvC_ChkMaxPow .obj1_setDashE
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV +$0180
		jp   .obj1_cont
	.obj1_setDashE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV +$0000
.obj1_cont:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID0, $00
		jp   .doGravity
; --------------- frames #2,4 ---------------
; Again.
.obj2:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID1, $00
		jp   .doGravity
; --------------- frame #3 ---------------
; Again.
.obj3:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID0, $00
		jp   .doGravity
; --------------- frame #5 ---------------
; Again.
.obj5:
	mMvC_ValFrameEnd .doGravity
		; Loop to #2 if we didn't touch the ground by the end of the frame
		mMvC_SetDamageNext $04, HITTYPE_HIT_MID0, $00
		mMvC_SetFrameOnEnd $02
		jp   .doGravity
; --------------- frames #1-5 / common gravity check ---------------
.doGravity:
	mMvC_ChkGravityHV $0018, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		
		; The heavy version performs a kick at the end, by switching to a separate move.
		; (In 96, the code for it would be directly integrated into this move)
		; The light one doesn't, and continues to #6 instead.
		mMvC_ChkMove MOVE_ATHENA95_PHOENIX_ARROW_L, .doGravity_setNextL
	.doGravity_setNextH:
		ld   a, MOVE_ATHENA95_PHOENIX_ARROW_KICK_H
		call MoveInputS_SetSpecMove_StopSpeed
		jp   .ret
	.doGravity_setNextL:
		mMvC_SetLandFrame $06, $08
		jp   .ret
; --------------- frame #6 ---------------
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
	
; =============== MoveC_Athena95_PhoenixArrowKick ===============
; Move code for the kick that ends the heavy version of Athena's Phoenix Arrow (MOVE_ATHENA95_PHOENIX_ARROW_KICK_H).
MoveC_Athena95_PhoenixArrowKick:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	; No explicit autocorrect unlike 96, because this is handled as a separate move.
	; And starting a new move makes the player face the opponent.
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $0A
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $06
		jp   .anim
; --------------- frame #2 ---------------
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
	
; =============== MoveC_Athena95_ShCryst ===============
; Move code for Athena's Shining Crystal Bit (MOVE_ATHENA95_SHINING_CRYSTAL_BIT_S).
; Significantly simpler than the version in 96.
MoveC_Athena95_ShCryst:
IF REV_LANG_EN
	call Play_Pl_MoveByColiBoxOverlapX
ENDC
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		
; --------------- frame #0 ---------------
; Startup.
.obj0:

	;
	; For some reason, these actions happen a few frames before the
	; actual mMvC_ValFrameEnd triggers.
	; This is so pointless that the English version (and by extension, 96) got rid of this,
	; executing the actions alongside the other "end of frame" code.
	;
	; English 95 still keeps the old iteration though, unreferenced.
	;
	
IF REV_LANG_EN
	; While at the end of the frame...
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		; KOF96-paced charge loop: one third of the KOF95 $0E repeats.
		ld   hl, iPlInfo_Athena_ShCryst_LoopTimer
		add  hl, bc
		ld   [hl], $05
		
		; Initialize the projectile
		call Task_PassControlFar
		call ProjInit_Athena95_ShCrystCharge
		call Task_PassControlFar
		
		; Play ching SGB/DMG SFX
		mMvC_PlaySound SCT_SHCRYSTSPAWN
		call Task_PassControlFar
		jp   .anim
	
.obj0_unused_old:
ENDC

	ld   hl, iOBJInfo_FrameLeft
	add  hl, de
	ld   a, [hl]
	cp   $03				; 3 frames left?
	jp   z, .obj0_initProj	; If so, show the charged projectile
	cp   $02				; 2 frames left?
	jp   z, .obj0_playSFX	; If so, play effect SFX
	
	; While at the end of the frame...
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		; KOF96-paced charge loop: one third of the KOF95 $0E repeats.
		ld   hl, iPlInfo_Athena_ShCryst_LoopTimer
		add  hl, bc
		ld   [hl], $05
		jp   .anim
.obj0_initProj:
	; Initialize the projectile
	call Task_PassControlFar
	call ProjInit_Athena95_ShCrystCharge
	call Task_PassControlFar
	jp   .anim
	
.obj0_playSFX:
	; Play ching SGB/DMG SFX
	mMvC_PlaySound SCT_SHCRYSTSPAWN
	jp   .anim
	
; --------------- frame #1 ---------------
; Phase 1 - double small sphere.
.obj1:
	; Just animates as part of the charge loop.
	jp   .anim

; --------------- frame #2 ---------------
; Phase 1 - double small sphere + input check + loop check.
.obj2:
	mMvC_ValFrameEnd .anim
		; We're at the end of #2, check if we're looping back to #1.
		
		; If the counter elapsed, continue to #3.
		ld   hl, iPlInfo_Athena_ShCryst_LoopTimer
		add  hl, bc
		dec  [hl]		; LoopTimer--
		jp   z, .anim	; Did it elapse? If so, jump
		
		; Holding A ends the move early.
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		bit  KEYB_A, [hl]			; Holding A?
		jp   nz, .part1_earlyEnd	; If so, jump
		
		; Main input logic during the first phase of the move.
		; While the projectile code makes a small sphere orbit around Athena,
		; we check for the DF(+P) input:
		;
		; Performing it quickly switches to #4, past the point where the first
		; part of the move would naturally end.
		;
		; DF -> Next Phase
		mMvIn_ChkDir MoveInput_DF, .part1_startPart2L
		
		; Loop back to #1
		mMvC_SetFrame $01, $01
		jp   .ret
	; --------------- frame #2 / common phase 2 switch ---------------
	; Phase 1 - Switches to the second phase through directional inputs.
	.part1_startPart2L:
		; Start from a clean buffer
		call Play_Pl_ClearJoyDirBuffer
		
		; Switch to #4
		mMvC_SetFrame $04, $01
		
		; Slow down orbiting speed (new proj mode)
		call MoveS_Athena95_ShCryst_SetOrbitNear
		jp   .ret
		
	; --------------- frames #2-3 / early end ---------------
	; Phase 1 - Ends the move immediately (as it's called under mMvC_ValFrameEnd)
	.part1_earlyEnd:
		call Task_PassControlFar
		jp   .end
; --------------- frame #3 ---------------
; Phase 1 - Last frame for the first phase.
.obj3:
	mMvC_ValFrameEnd .anim
	
		; If not holding B, the move ends immediately.
		; To throw the projectile, we must held B at least until phase 2 starts.
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		bit  KEYB_B, [hl]
		jp   z, .part1_earlyEnd
		
		; Set orbiting mode to projectile
		call MoveS_Athena95_ShCryst_SetOrbitNear
		jp   .anim
		
; --------------- frame #4 ---------------
; Phase 2 - Charging up the projectile.
; During this phase, the projectile orbits around Athena's hand, slowing down
; until it almost stops moving over it.
.obj4:
	mMvC_ValFrameEnd .anim
		; Set a significant delay after releasing the projectile.
		mMvC_SetAnimSpeed $14
		
		; Note how there's no automatic release unlike 96.
		
		; If the player releases B, the projectile is thrown
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		bit  KEYB_B, [hl]		; Holding B?
		jp   nz, .ret			; If so, keep waiting
		jp   .anim				; Otherwise, continue to #5
		
; --------------- frame #5 ---------------
; Phase 3 - Throwing the projectile.
.obj5:
	mMvC_ValFrameStartFast .obj5_cont
		; Save the damage
		mMvC_SetDamageNext $12, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		; Apply it to the projectile
		call Play_Proj_CopyMoveDamageFromPl
		; Throw the sphere projectile.
		call ProjInit_Athena95_ShCrystThrown
.obj5_cont:
	mMvC_ValFrameEnd .anim
	
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jr   .ret
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== ProjInit_Athena95_ShCrystThrown ===============
; Initializes the projectile for Athena's Shining Crystal Bit after it gets thrown (phase 3).
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Athena95_ShCrystThrown:
	mMvC_PlaySound SCT_PROJ_SM

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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Athena_ShCrystThrown_Athena95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Athena_ShCrystThrown_Athena95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Athena_ShCrystThrown_Athena95)	; iOBJInfo_OBJLstPtrTbl_High
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
				mMvC_SetMoveV -$0400
			pop  af	; Restore A & C flag

			;
			; Determine projectile horizontal speed.
			;
			jp   nc, .fldMaxPow				; Are we at max power? If not, jump
			ld   hl, +$0400
			jp   .setSpeedH
		.fldMaxPow:
			ld   hl, +$0200
		.setSpeedH:
			call Play_OBJLstS_SetSpeedH_ByXFlipR

		pop  de
	pop  bc
	ret
	
; =============== ProjInit_Athena95_ShCrystCharge ===============
; Initializes the projectile for Athena's Shining Crystal Bit before it gets thrown.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Athena95_ShCrystCharge:
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
			ld   [hl], BANK(ProjC_Athena95_ShCrystCharge)	; BANK $18 ; iOBJInfo_Play_CodeBank
			inc  hl
			ld   [hl], LOW(ProjC_Athena95_ShCrystCharge)	; iOBJInfo_Play_CodePtr_Low
			inc  hl
			ld   [hl], HIGH(ProjC_Athena95_ShCrystCharge)	; iOBJInfo_Play_CodePtr_High

			; Write sprite mapping ptr for this projectile.
			ld   hl, iOBJInfo_BankNum
			add  hl, de
			ld   [hl], BANK(OBJLstPtrTable_Proj_Athena_ShCrystCharge_Athena95)	; BANK $01 ; iOBJInfo_BankNum
			inc  hl
			ld   [hl], LOW(OBJLstPtrTable_Proj_Athena_ShCrystCharge_Athena95)	; iOBJInfo_OBJLstPtrTbl_Low
			inc  hl
			ld   [hl], HIGH(OBJLstPtrTable_Proj_Athena_ShCrystCharge_Athena95)	; iOBJInfo_OBJLstPtrTbl_High
			inc  hl
			ld   [hl], $00	; iOBJInfo_OBJLstPtrTblOffset


			; Set animation speed.
			ld   hl, iOBJInfo_FrameLeft
			add  hl, de
			ld   [hl], $00	; iOBJInfo_FrameLeft
			inc  hl
			ld   [hl], ANIMSPEED_INSTANT	; iOBJInfo_FrameTotal
			
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
			mMvC_SetMoveH +$0800
			mMvC_SetMoveV -$1000
	
			; Save a copy of the player's position to the projectile's slot.
			; This is because it's used as the projectile's origin.
			; This exact thing will be also done when updating the origin through ProjC_Athena95_ShCrystCharge_SetOrigin (English version only)
			push bc
				; BC = Ptr to X Position
				ld   hl, iOBJInfo_X
				add  hl, de
				push hl
				pop  bc
				
				; Copy it over to iOBJInfo_Proj_ShCrystCharge_OrigX
				ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
				add  hl, de		
				ld   a, [bc]	; A = X Position
				ldi  [hl], a	; Save it to iOBJInfo_Proj_ShCrystCharge_OrigX, seek to iOBJInfo_Proj_ShCrystCharge_OrigY
				
				; Copy over the Y position to iOBJInfo_Proj_ShCrystCharge_OrigY
				inc  bc			; Seek to iOBJInfo_XSub
				inc  bc			; Seek to iOBJInfo_Y
				ld   a, [bc]	; A = Y Position
				ld   [hl], a	; Save it to iOBJInfo_Proj_ShCrystCharge_OrigY
			pop  bc
			
			; Set priority value
			ld   hl, iOBJInfo_Play_Priority
			add  hl, de
			ld   [hl], PROJ_PRIORITY_NODESPAWN
				
			; Initialize the X and Y indexes for the sine coords table.
			; For the electron-like movement, the indexes are set up so that the projectile
			; initially moves right and down, and increment by $20 and $22 respectively
			; so they won't sync.
			xor  a
			ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosId
			add  hl, de
			ld   [hl], $00	; iOBJInfo_Proj_ShCrystCharge_XPosId ($0000, then right)
			inc  hl ; neg
			ld   [hl], $80	; iOBJInfo_Proj_ShCrystCharge_YPosId ($0000, then down)
			
			; Multipliers start at $00
			inc  hl
			ldi  [hl], a	; iOBJInfo_Proj_ShCrystCharge_XPosMul
			ld   [hl], a	; iOBJInfo_Proj_ShCrystCharge_YPosMul
			
			; Start from the first phase
			ld   hl, iOBJInfo_Proj_ShCrystCharge_OrbitMode
			add  hl, de
			ld   [hl], PROJ_SHCRYST_ORBITMODE_OVAL

			
			; 8 times for smooth origin transition between Slow and Hold mode
			ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigMoveLeft
			add  hl, de
			ld   [hl], $08
		pop  de
	pop  bc
	ret  
	
; =============== MoveS_Athena95_ShCryst_SetOrbitNear ===============
; Sets the initial orbit mode for "Phase 2".
; This is when Athena holds an hand up, with the projectile's orbit slowly
; getting smaller. 
; IN
; - DE: Ptr to player wOBJInfo
MoveS_Athena95_ShCryst_SetOrbitNear:
	push bc
		push de
			; BC = DE = Ptr to wOBJInfo
			push de
			pop  bc
			
			; DE = Ptr to the wOBJInfo of our projectile
			ld   hl, (OBJINFO_SIZE*2) ; 2 slots after ours
			add  hl, bc
			push hl
			pop  de
			
			; Set the new orbit mode
			ld   hl, iOBJInfo_Proj_ShCrystCharge_OrbitMode
			add  hl, de
			ld   [hl], PROJ_SHCRYST_ORBITMODE_SLOW
		pop  de
	pop  bc
	ret
	
; =============== ProjC_Athena95_ShCrystCharge ===============
; Projectile code for Athena's Shining Crystal Bit while it gets charged up.
; While charging, the projectile always orbits something.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo for the projectile
ProjC_Athena95_ShCrystCharge:

IF REV_LANG_EN
	; 30FPS exec, across players
	call ProjC_Athena95_ShCrystCharge_CanExec
	ret  c
ENDC
	
	; Make the projectile move in an expanding spiral motion if the move ended early
	; (meaning that we're no longer doing the super).
	; This check was relegated to MoveS_Athena95_ShCryst_SetOrbitExpand in 96.
	ld   hl, iPlInfo_MoveId
	add  hl, bc
	ld   a, [hl]
	cp   MOVE_ATHENA95_SHINING_CRYSTAL_BIT_GS
	jp   nz, .switchToSpiral
	
	; Depending on the phase of the projectile...
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrbitMode
	add  hl, de
	ld   a, [hl]
	cp   PROJ_SHCRYST_ORBITMODE_OVAL
	jp   z, ProjC_Athena95_ShCrystCharge_Oval
	cp   PROJ_SHCRYST_ORBITMODE_SLOW
	jp   z, ProjC_Athena95_ShCrystCharge_Slow
	cp   PROJ_SHCRYST_ORBITMODE_HOLD
	jp   z, ProjC_Athena95_ShCrystCharge_Hold
	

.switchToSpiral:

	;
	; The spiral motion isn't an oval-like orbit, and it gets its own different code pointer
	; so it won't be able to switch to some other mode.
	;

	; Reset indexes to fixed values
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosId
	add  hl, de
	ld   [hl], $00	; iOBJInfo_Proj_ShCrystCharge_XPosId ($0000, moves right)
	inc  hl
	ld   [hl], $40	; iOBJInfo_Proj_ShCrystCharge_YPosId ($4000, rightmost value, so first to move left)
	
	; Move deals no damage
	ld   hl, iOBJInfo_Play_DamageVal
	add  hl, de
	xor  a
	ldi  [hl], a	; iOBJInfo_Play_DamageVal
	ldi  [hl], a	; iOBJInfo_Play_DamageHitTypeId
	ld   [hl], a	; iOBJInfo_Play_DamageFlags3
	
	; Set a new code pointer
	ld   hl, iOBJInfo_Play_CodeBank
	add  hl, de
	ld   [hl], BANK(ProjC_Athena95_ShCrystCharge_Spiral) 	; BANK $18 ; iOBJInfo_Play_CodeBank
	inc  hl
	ld   [hl], LOW(ProjC_Athena95_ShCrystCharge_Spiral)	; iOBJInfo_Play_CodePtr_Low
	inc  hl
	ld   [hl], HIGH(ProjC_Athena95_ShCrystCharge_Spiral)	; iOBJInfo_Play_CodePtr_High
	
	; Display spiral for $10 frames
	ld   hl, iOBJInfo_Proj_ShCrystCharge_DespawnTimer
	add  hl, de
	ld   [hl], $10	; iOBJInfo_Proj_ShCrystCharge_DespawnTimer
	ret
	
; =============== ProjC_Athena95_ShCrystCharge_Oval ===============
; Initial electron-like mode.	
ProjC_Athena95_ShCrystCharge_Oval:

IF REV_LANG_EN
	;
	; First, always sync the origin 16px above, 8px behind the player's origin
	;
	ld   b, -$08
	ld   c, -$10
	call ProjC_Athena95_ShCrystCharge_SetOrigin
ENDC

	;
	; Update the X and Y coordinates, starting with the former.
	; In short, positions are read from a table of 16bit values (pixel + subpixels)
	; and exponentially multiplied ( << ) by some value.
	; Each coordinate has its own index to the table and multiplier, but the table
	; of coordinates is the same.
	;

	;
	; X POSITION
	;
	; XPos = POW(Coords[XPosId+$16], MAX(XPosMul, 4))
	;        -> Where XPosMul is incremented every 8 frames.
	;

	;
	; Slowly increment the X Position multiplier from $00 to $04 every 8 frames.
	;
	
	; DecTimer++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMulUpdTimer
	add  hl, de
	inc  [hl]
	
	; Get divider mask.
	; B = DecTimer % $08
	ld   a, [hl]
	and  a, $07
	ld   b, a
	
	; Seek to XPosMul
	; HL = Ptr to iOBJInfo_Proj_ShCrystCharge_XPosMul
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMul
	add  hl, de
	
	; If the multiplier is already $04, don't increment it further
	ld   a, [hl]		; A = XPosMul
	cp   $04			; XPosMul == 4?
	jp   z, .getX		; If so, skip
	
	; Otherwise, increment the multiplier if (DecTimer % 8) != 0
	ld   a, b			
	or   a				; DecTimer != 0?
	jp   nz, .getX		; If so, skip
	inc  [hl]			; Otherwise, XPosMul++	
	
.getX:

	;
	; Read out to B the relative X position off the table.
	;
		
	; Get/save the new index to the table of coords.
	; A = XPosId + $16
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosId
	add  hl, de
	ld   a, [hl]
	add  a, $16		; Index += $16
	ld   [hl], a	; and save back the updated index
	
	; B = Value multiplier
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMul
	add  hl, de
	ld   b, [hl]
	
	; B = Rel. X Position
	call ProjC_Athena95_ShCrystCharge_GetSinePos
	
	;
	; Set the new X position.
	; ProjX = OriginX + RelX
	;
	
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de
	ld   a, [hl]			; A = X Origin
	add  b					; A += B
	ld   hl, iOBJInfo_X		
	add  hl, de				; HL = Ptr to X Pos
	ld   [hl], a			; Update it
	
	;--
	
	;
	; Y POSITION
	; Same thing, but with a different addresses/settings.
	;
	
	; DecTimer++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMulUpdTimer
	add  hl, de
	inc  [hl]
	
	; Get divider mask.
	; B = DecTimer % $08
	ld   a, [hl]
	and  a, $07
	ld   b, a
	
	; Seek to YPosMul
	; HL = Ptr to iOBJInfo_Proj_ShCrystCharge_YPosMul
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMul
	add  hl, de
	
	; If the multiplier is already $05, don't increment it further
	ld   a, [hl]		; A = XPosMul
	cp   $05			; YPosMul == 5?
	jp   z, .getY		; If so, skip
	
	; Otherwise, increment the multiplier if (DecTimer % 8) != 0
	ld   a, b			
	or   a				; DecTimer != 0?
	jp   nz, .getY		; If so, skip
	inc  [hl]			; Otherwise, YPosMul++	
.getY:
	; Get/save table index
	; A = LastId + $22
	; This extra $02 compared to the horz one makes the vertical movement faster than the horizontal one.
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosId
	add  hl, de
	ld   a, [hl]
	add  a, $22
	ld   [hl], a	; and save it back
	
	; B = Multiplier
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMul
	add  hl, de
	ld   b, [hl]
	
	; B = Rel. Y position
	call ProjC_Athena95_ShCrystCharge_GetSinePos
	
	; ProjY = OrigY + RelY
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigY
	add  hl, de
	ld   a, [hl]			; A = Y Origin
	add  b					; A += B
	ld   hl, iOBJInfo_Y		
	add  hl, de				; HL = Ptr to Y Pos
	ld   [hl], a			; Update it
	ret
	
; =============== ProjC_Athena95_ShCrystCharge_Hold ===============
; Only different thing from ProjC_Athena95_ShCrystCharge_Slow in that
; the origin is on Athena's hand.
; It's not even necessary anyway, since ProjC_Athena95_ShCrystCharge_Slow aligns it perfectly already.
ProjC_Athena95_ShCrystCharge_Hold:
	; [POI] This branch existed in the Japanese version as well, but did not contain any code.
IF REV_LANG_EN
	; Origin is...
	ld   b, +$00 ; 
	ld   c, -$18 ; $18px above player
	call ProjC_Athena95_ShCrystCharge_SetOrigin
	; Fall-through
ENDC
	
; =============== ProjC_Athena95_ShCrystCharge_Slow ===============
; Like oval mode, but the arc keeps getting smaller.
ProjC_Athena95_ShCrystCharge_Slow:

	;
	; First, slowly move the origin over Athena's hand for a smooth transition
	; to Hold mode. When we're done, switch to Hold mode when we're done.
	;
	; This moves the origin 1px backwards and 1px upwards every 8 frames,
	; and it gets done $08 times (what iOBJInfo_Proj_ShCrystCharge_OrigMoveLeft was set to).
	;
	; Considering the origin before getting here is set to:
	; - $00px horz
	; - $10px up
	; By the time we switch to Hold mode, it will be:
	; - $08px back
	; - $18px up
	; Which is the exact origin used by that mode.
	;
	
	; Only do this every 8 frames
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigMoveTimer
	add  hl, de
	inc  [hl]		; Timer++
	ld   a, [hl]		
	and  a, $07		; Timer % 8 != 0?
	jp   nz, .doX	; If so, skip
	
	; Don't do this if we switched to Hold mode already, as that uses its own origin.
	; (it's the only point OrigMoveLeft can be 0 here)
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigMoveLeft
	add  hl, de
	ld   a, [hl]
	or   a			; OrigMoveLeft == 0?
	jp   z, .doX	; If so, skip
	
	; Decrement counter of remaining UB movements.
	; If this is the last time we're getting here (OrigMoveLeft-1 == 0), switch to Hold mode.
	dec  [hl]				; MoveLeft--
	jp   nz, .moveOrigBack	; MoveLeft != 0? If so, skip
	; Otherwise, switch to Hold mode
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrbitMode
	add  hl, de
	ld   [hl], PROJ_SHCRYST_ORBITMODE_HOLD
	
.moveOrigBack:
	; Move origin backwards by 1px.
	; Determine which side the projectile is facing first.
	ld   hl, iOBJInfo_OBJLstFlags
	add  hl, de
	bit  SPRB_XFLIP, [hl]	; Facing right? (originally thrown on 1P side)
	jp   nz, .moveOrigL		; If so, move it left (backwards for 1P side)
	; Otherwise, move it right (backwards for 2P side)
.moveOrigR:
	; OrigX++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de
	inc  [hl]
	jp   .moveOrigU
.moveOrigL:
	; OrigX--
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de
	dec  [hl]
	
.moveOrigU:
	; Move origin up by 1px
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigY
	add  hl, de
	dec  [hl]
	
.doX:
	;
	; Then, update the X and Y coordinates, starting with the former.
	; This process is very similar to what's done in ProjC_Athena95_ShCrystCharge_Oval,
	; except that the multipliers get decremented slowly (not incremented every frame)
	; and that the indexes are incremented by a different value.
	;

	;
	; X POSITION
	;

	;
	; Slowly decrement the X Position multiplier from $05 to $01 every $20 frames.
	;
	
	; DecTimer++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMulUpdTimer
	add  hl, de
	inc  [hl]
	
	; Get divider mask.
	; B = DecTimer % $20
	ld   a, [hl]
	and  a, $1F
	ld   b, a
	
	; Seek to XPosMul
	; HL = Ptr to iOBJInfo_Proj_ShCrystCharge_XPosMul
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMul
	add  hl, de
	
	; If the multiplier is already $01, don't decrement it further
	ld   a, [hl]		; A = XPosMul
	cp   $01			; XPosMul == 1?
	jp   z, .getX		; If so, skip
	
	; Otherwise, decrement the multiplier if (DecTimer % $20) != 0
	ld   a, b			
	or   a				; DecTimer != 0?
	jp   nz, .getX		; If so, skip
	dec  [hl]			; Otherwise, XPosMul--	
	
.getX:
	;
	; Read out to B the relative X position off the table, then apply it.
	;
	
	; Get/save table index
	; A = LastId + $20
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosId
	add  hl, de
	ld   a, [hl]
	add  a, $20
	ld   [hl], a	; and save it back
	
	; B = Multiplier
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMul
	add  hl, de
	ld   b, [hl]
	
	; B = Rel. X position
	call ProjC_Athena95_ShCrystCharge_GetSinePos
	
	; ProjX = OrigX + RelX
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de
	ld   a, [hl]			; A = X Origin
	add  b					; A += B
	ld   hl, iOBJInfo_X		
	add  hl, de				; HL = Ptr to X Pos
	ld   [hl], a			; Update it
	
.doY:
	;
	; Y POSITION
	;
	
	;
	; Decrement the Y Position multiplier from $06 to $01 every *alternating* $20 frames.
	; (that is, decrement for $20 continuous frames, then nothing for the next $20, and so on).
	; This causes the Y Multiplier to decrement much faster than the horizontal one, though
	; because YPosMulDecTimer (and XPosMulDecTimer) don't get initialized, the actual point this happens
	; is effectively randomized depending on how long we held the projectile the previous times.
	;
	
	; DecTimer++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMulUpdTimer
	add  hl, de
	inc  [hl]
	
	; Get divider mask.
	; B = DecTimer & $20
	ld   a, [hl]
	and  a, $20
	ld   b, a
	
	; Seek to YPosMul
	; HL = Ptr to iOBJInfo_Proj_ShCrystCharge_YPosMul
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMul
	add  hl, de
	
	; If the multiplier is already $01, don't decrement it further
	ld   a, [hl]		; A = YPosMul
	cp   $01			; YPosMul == 1?
	jp   z, .getY		; If so, skip
	
	; Otherwise, decrement the multiplier if (DecTimer & $20) != 0
	ld   a, b			
	or   a				; DecTimer != 0?
	jp   nz, .getY		; If so, skip
	dec  [hl]			; Otherwise, YPosMul--	
	
.getY:
	;
	; Read out to B the relative Y position off the table, then apply it.
	;
	
	; Get/save table index
	; A = LastId + $1F
	; This makes the vertical movement slightly slower than the horizontal one ($20).
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosId
	add  hl, de
	ld   a, [hl]
	add  a, $1F
	ld   [hl], a	; and save it back
	
	; B = Multiplier
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMul
	add  hl, de
	ld   b, [hl]
	
	; B = Rel. Y position
	call ProjC_Athena95_ShCrystCharge_GetSinePos
	
	; ProjY = OrigY + RelY
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigY
	add  hl, de
	ld   a, [hl]			; A = Y Origin
	add  b					; A += B
	ld   hl, iOBJInfo_Y		
	add  hl, de				; HL = Ptr to Y Pos
	ld   [hl], a			; Update it
	ret
	
; =============== ProjC_Athena95_ShCrystCharge_Spiral ===============
; Spiral outwards motion, used to despawn the projectile when the move ends early.
; Code-wise, it's very similar to the other modes.
ProjC_Athena95_ShCrystCharge_Spiral:
IF REV_LANG_EN
	; 30FPS exec, across players
	call ProjC_Athena95_ShCrystCharge_CanExec
	ret  c
ENDC
	; Not necessary, already done by .switchToSpiral
	ld   hl, iOBJInfo_Play_DamageVal
	add  hl, de
	xor  a
	ldi  [hl], a	; iOBJInfo_Play_DamageVal
	ldi  [hl], a	; iOBJInfo_Play_DamageHitTypeId
	ld   [hl], a	; iOBJInfo_Play_DamageFlags3
	
	; Despawn the projectile when the timer expires
	ld   hl, iOBJInfo_Proj_ShCrystCharge_DespawnTimer
	add  hl, de
	dec  [hl]
	jp   z, OBJLstS_Hide
	
.doX:
	;
	; X POSITION
	;

	;
	; Quickly increment the X Position multiplier every 4 frames, with no upper limit.
	;
	
	; IncTimer++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMulUpdTimer
	add  hl, de
	inc  [hl]
	
	; Get divider mask.
	; B = IncTimer % 4
	ld   a, [hl]
	and  a, $03
	ld   b, a
	
	; Seek to XPosMul
	; HL = Ptr to iOBJInfo_Proj_ShCrystCharge_XPosMul
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMul
	add  hl, de
	
	; Increment the multiplier with no upper limit if (IncTimer % 4) != 0
	ld   a, b
	or   a				; IncTimer % 4 != 0?
	jp   nz, .getX		; If so, skip
	inc  [hl]			; Otherwise, XPosMul++	
	
.getX:
	;
	; Read out to B the relative X position off the table, then apply it.
	;
	
	; Get/save table index
	; A = LastId + $20
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosId
	add  hl, de
	ld   a, [hl]
	add  a, $20
	ld   [hl], a	; and save it back
	
	; B = Multiplier
	ld   hl, iOBJInfo_Proj_ShCrystCharge_XPosMul
	add  hl, de
	ld   b, [hl]
	
	; B = Rel. X position
	call ProjC_Athena95_ShCrystCharge_GetSinePos
	
	; ProjX = OrigX + RelX
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de
	ld   a, [hl]			; A = X Origin
	add  b					; A += B
	ld   hl, iOBJInfo_X		
	add  hl, de				; HL = Ptr to X Pos
	ld   [hl], a			; Update it
	
.doY:
	;
	; Y POSITION
	;
	
	;
	; Quickly increment the X Position multiplier every 8 frames, with no upper limit.
	;
	
	; IncTimer++
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMulUpdTimer
	add  hl, de
	inc  [hl]
	
	; Get divider mask.
	; B = IncTimer % 8
	ld   a, [hl]
	and  a, $07
	ld   b, a
	
	; Seek to YPosMul
	; HL = Ptr to iOBJInfo_Proj_ShCrystCharge_YPosMul
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMul
	add  hl, de
	
	; Increment the multiplier with no upper limit if (IncTimer % 8) != 0
	ld   a, b
	or   a				; IncTimer % 8 != 0?
	jp   nz, .getY		; If so, skip
	inc  [hl]			; Otherwise, YPosMul++	
.getY:
	;
	; Read out to B the relative Y position off the table, then apply it.
	;
	
	; Get/save table index
	; A = LastId + $20
	; This is exactly the same as the horizontal one, resulting in a spiral motion
	; as the multipliers grow without limit.
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosId
	add  hl, de
	ld   a, [hl]
	add  a, $20
	ld   [hl], a	; and save it back
	
	; B = Multiplier
	ld   hl, iOBJInfo_Proj_ShCrystCharge_YPosMul
	add  hl, de
	ld   b, [hl]
	
	; B = Rel. Y position
	call ProjC_Athena95_ShCrystCharge_GetSinePos
	
	; ProjY = OrigY + RelY
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigY
	add  hl, de
	ld   a, [hl]			; A = Y Origin
	add  b					; A += B
	ld   hl, iOBJInfo_Y		
	add  hl, de				; HL = Ptr to Y Pos
	ld   [hl], a			; Update it
	ret
	
IF REV_LANG_EN
; =============== ProjC_Athena95_ShCrystCharge_CanExec ===============
; Called at the start of the charging projectile code to determine if 
; the rest of the code should be executed.
; This projectile is special in that it executes its code every other
; gameplay frame, alternating between 1P and 2P.
; Even frames -> 2P exec
; Odd  frames -> 1P exec
; IN
; - BC: Ptr to wPlInfo
; OUT
; - C flag: If set, the code should not execute
ProjC_Athena95_ShCrystCharge_CanExec:
	ld   hl, iPlInfo_PlId
	add  hl, bc
	ld   a, [hl]
	cp   PL2			; Playing as 2P?
	jp   z, .pl2		; If so, jump
.pl1:
	ld   a, [wTimer]
	bit  0, a			; wPlayTimer % 2 == 0? (even frame)
	jp   z, .retSet		; If so, no exec
	jp   .retClear		; Otherwise, exec it
.pl2:
	ld   a, [wTimer]
	bit  0, a			; wPlayTimer % 2 != 0? (odd frame)
	jp   nz, .retSet	; If so, no exec
.retClear:
	scf
	ccf		; C flag clear
	ret
.retSet:
	scf		; C flag set
	ret
ENDC
	
; =============== ProjC_Athena95_ShCrystCharge_GetSinePos ===============
; Gets a value from the coordinates table and shifts it left B times.
; IN
; - A: Index to coordinates table
; - B: Multiplier
; OUT
; - B: Returned position.
;      This will be treated as an X or Y position depending on the context.
ProjC_Athena95_ShCrystCharge_GetSinePos:
	push de
		push hl
			; HL = Base 16bit value (for multiplier $00)
			call ProjC_Athena95_ShCrystCharge_GetBaseSinePos
			
			; Shift it left B times. B will be at most 6.
			; HL = HL << B
		.loop:
			sla  l			; HL << 1
			rl   h
			dec  b			; Did it all times?
			jp   nz, .loop	; If not, loop
			
			; And move it to BC.
			; Only the high byte (pixel count) is usable, since the subpixels got trashed
			; by the shifting, which is fine as projectile positions don't use subpixels.
			push hl	; BC = HL
			pop  bc
			
		pop  hl
	pop  de
	ret

IF REV_LANG_EN
; =============== ProjC_Athena95_ShCrystCharge_SetOrigin ===============
; Sets a new origin for the projectile, relative to the player's current position.
; IN
; - B: X Offset.
;      This is relative to the projectile facing *left*, so positive values move it backwards.
; - C: Y Offset.
; - DE: Ptr to wOBJInfo for projectile
ProjC_Athena95_ShCrystCharge_SetOrigin:

	;
	; Refresh the base origin first.
	; Copy the player's X and Y positions to iOBJInfo_Proj_ShCrystCharge_Orig*.
	;
	push bc
		push de
			; BC = Ptr to the X Origin of the projectile (Destination)
			ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
			add  hl, de
			push hl
			pop  bc
			
			; HL = Ptr to the player's X position (Source)
			push de
				; This requires seeking back to the player's wOBJInfo.
				; As always, it's 2 slots before the one for the projectile, in DE.
				ld   hl, -(OBJINFO_SIZE*2)
				add  hl, de		; HL = iOBJInfo_Status for player
				
				; Seek to the X position
				ld   de, iOBJInfo_X
				add  hl, de
			pop  de
			
			; Sync the X origin
			ld   a, [hl]	; Read Player X Position
			ld   [bc], a	; Copy it over as new X origin
			
			; Sync the Y origin
			inc  hl			; Seek to iOBJInfo_XSub
			inc  hl			; Seek to iOBJInfo_YSub
			inc  bc			; Seek to iOBJInfo_Proj_ShCrystCharge_OrigY
			ld   a, [hl]	; Read Player Y Position
			ld   [bc], a	; Copy it over as new Y origin
		pop  de
	pop  bc
	
	;
	; Apply the X Offset.
	; Bizzarely, positive offset values make set it backwards here.
	;
	ld   hl, iOBJInfo_OBJLstFlags
	add  hl, de
	bit  SPRB_XFLIP, [hl]	; Is the projectile facing right? (initially thrown on the 1P side?)
	jp   nz, .setPosR		; If so, jump
	; Otherwise, it's facing left (2P side)
.setPosL:
	; iOBJInfo_Proj_ShCrystCharge_OrigX += B
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de
	ld   a, [hl]	; A = OrigX
	add  b			; += OffsetX
	ld   [hl], a	; Save it back
	jp   .setPosY
	
.setPosR:
	; iOBJInfo_Proj_ShCrystCharge_OrigX -= B
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigX
	add  hl, de		; HL = Ptr to OrigX
	ld   a, b		; A = -OffsetX
	cpl
	inc  a
	ld   b, [hl]	; B = OrigX
	add  b			; += OffsetX
	ld   [hl], a	; Save it back
	
	;
	; Apply the Y Offset.
	;
.setPosY:
	; iOBJInfo_Proj_ShCrystCharge_OrigY += C
	ld   hl, iOBJInfo_Proj_ShCrystCharge_OrigY
	add  hl, de
	ld   a, [hl]	; A = OrigY
	add  c			; += OffsetY
	ld   [hl], a	; Save it back
	ret
ENDC

; =============== ProjC_Athena95_ShCrystCharge_GetBaseSinePos ===============
; Gets a base coordinate position for the projectile from the coordinates table.
; IN
; - A: Position ID.
; OUT
; - HL: Position (pixels + subpixels)
;       This value will be treated as either an X or Y position, depending
;       on the context this ended up getting called.
ProjC_Athena95_ShCrystCharge_GetBaseSinePos:
	push bc
		; Generate offset to a table of 2-byte positions
		; BC = A * 2
		ld   b, $00
		ld   c, a
		sla  c
		rl   b
		
		; Offset the table
		ld   hl, .sineTbl
		add  hl, bc
		
		; Read out the raw value to BC
		ld   c, [hl]
		inc  hl
		ld   b, [hl]
		
		; For whatever reason, the raw value isn't directly the base value pre-multiplication.
		; Instead, it's the base value shifted right 6 times (*$40), which is the value that
		; would be used with the max multiplier.
		
		; Since we want the base value though, divide it by $40 (>> 6).
		; As we're only using the upper byte (so what's the point of the low one?), we're fine
		; since 6 < 9 shifts.
		; HL = BC / $40
REPT 6
		sra  b	; >> 1 , 6 times
		rr   c
ENDR
		push bc	; Move it to HL
		pop  hl
		
	pop  bc
	ret
	
; SINE TABLE
; Table of incrementing and decrementing 16bit signed numbers (pixels + subpixels).
; Used in order, one by one, these result in the projectile moving in a smooth sine motion.
; To generate the various movement patterns, the X and Y indexes are incremented by
; different offsets.
.sineTbl: 
	dw $0000
	dw $0192
	dw $0324
	dw $04B5
	dw $0646
	dw $07D6
	dw $0964
	dw $0AF1
	dw $0C7C
	dw $0E06
	dw $0F8D
	dw $1112
	dw $1294
	dw $1413
	dw $1590
	dw $1709
	dw $187E
	dw $19EF
	dw $1B5D
	dw $1CC6
	dw $1E2B
	dw $1F8C
	dw $20E7
	dw $223D
	dw $238E
	dw $24DA
	dw $2620
	dw $2760
	dw $289A
	dw $29CE
	dw $2AFB
	dw $2C21
	dw $2D41
	dw $2E5A
	dw $2F6C
	dw $3076
	dw $3179
	dw $3274
	dw $3368
	dw $3453
	dw $3537
	dw $3612
	dw $36E5
	dw $37AF
	dw $3871
	dw $392B
	dw $39DB
	dw $3A82
	dw $3B21
	dw $3BB6
	dw $3C42
	dw $3CC5
	dw $3D3F
	dw $3DAF
	dw $3E15
	dw $3E72
	dw $3EC5
	dw $3F0F
	dw $3F4F
	dw $3F85
	dw $3FB1
	dw $3FD4
	dw $3FEC
	dw $3FFB
	dw $4000
	dw $3FFB
	dw $3FEC
	dw $3FD4
	dw $3FB1
	dw $3F85
	dw $3F4F
	dw $3F0F
	dw $3EC5
	dw $3E72
	dw $3E15
	dw $3DAF
	dw $3D3F
	dw $3CC5
	dw $3C42
	dw $3BB6
	dw $3B21
	dw $3A82
	dw $39DB
	dw $392B
	dw $3871
	dw $37AF
	dw $36E5
	dw $3612
	dw $3537
	dw $3453
	dw $3368
	dw $3274
	dw $3179
	dw $3076
	dw $2F6C
	dw $2E5A
	dw $2D41
	dw $2C21
	dw $2AFB
	dw $29CE
	dw $289A
	dw $2760
	dw $2620
	dw $24DA
	dw $238E
	dw $223D
	dw $20E7
	dw $1F8C
	dw $1E2B
	dw $1CC6
	dw $1B5D
	dw $19EF
	dw $187E
	dw $1709
	dw $1590
	dw $1413
	dw $1294
	dw $1112
	dw $0F8D
	dw $0E06
	dw $0C7C
	dw $0AF1
	dw $0964
	dw $07D6
	dw $0646
	dw $04B5
	dw $0324
	dw $0192
	dw $0000
	dw $FE6E
	dw $FCDC
	dw $FB4B
	dw $F9BA
	dw $F82A
	dw $F69C
	dw $F50F
	dw $F384
	dw $F1FA
	dw $F073
	dw $EEEE
	dw $ED6C
	dw $EBED
	dw $EA70
	dw $E8F8
	dw $E782
	dw $E611
	dw $E4A3
	dw $E33A
	dw $E1D5
	dw $E074
	dw $DF19
	dw $DDC3
	dw $DC72
	dw $DB26
	dw $D9E0
	dw $D8A0
	dw $D766
	dw $D632
	dw $D505
	dw $D3DF
	dw $D2BF
	dw $D1A6
	dw $D094
	dw $CF8A
	dw $CE87
	dw $CD8C
	dw $CC98
	dw $CBAD
	dw $CAC9
	dw $C9EE
	dw $C91B
	dw $C851
	dw $C78F
	dw $C6D5
	dw $C625
	dw $C57E
	dw $C4DF
	dw $C44A
	dw $C3BE
	dw $C33B
	dw $C2C2
	dw $C252
	dw $C1EB
	dw $C18E
	dw $C13B
	dw $C0F1
	dw $C0B1
	dw $C07B
	dw $C04F
	dw $C02C
	dw $C014
	dw $C005
	dw $C000
	dw $C005
	dw $C014
	dw $C02C
	dw $C04F
	dw $C07B
	dw $C0B1
	dw $C0F1
	dw $C13B
	dw $C18E
	dw $C1EB
	dw $C252
	dw $C2C2
	dw $C33B
	dw $C3BE
	dw $C44A
	dw $C4DF
	dw $C57E
	dw $C625
	dw $C6D5
	dw $C78F
	dw $C851
	dw $C91B
	dw $C9EE
	dw $CAC9
	dw $CBAD
	dw $CC98
	dw $CD8C
	dw $CE87
	dw $CF8A
	dw $D094
	dw $D1A6
	dw $D2BF
	dw $D3DF
	dw $D505
	dw $D632
	dw $D766
	dw $D8A0
	dw $D9E0
	dw $DB26
	dw $DC72
	dw $DDC3
	dw $DF19
	dw $E074
	dw $E1D5
	dw $E33A
	dw $E4A3
	dw $E611
	dw $E782
	dw $E8F8
	dw $EA70
	dw $EBED
	dw $ED6C
	dw $EEEE
	dw $F073
	dw $F1FA
	dw $F384
	dw $F50F
	dw $F69C
	dw $F82A
	dw $F9BA
	dw $FB4B
	dw $FCDC
	dw $FE6E

; =============== MoveC_Heidern_ThrowG ===============
; Move code for Heidern's ground throw. (MOVE_SHARED_THROW_G).
; See also: MoveC_Kyo_ThrowG
