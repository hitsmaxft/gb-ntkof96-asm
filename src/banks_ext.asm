; Expansion banks for the mixed KOF95/KOF96 roster.
; Replace each bank's filler incrementally as imported assets are integrated.

SECTION "bank20", ROMX, BANK[$20]
MixKOF_CharSelPortraits:
MixKOF_CharSelPortraitSinglePage:
	INCBIN "data/gfx/charsel_mix_singlepage.bin"
MixKOF_CharSelPortraitVariants:
	INCBIN "data/gfx/charsel_mix_variants.bin"

; The original order-selection sheet contains only KOF96 fighters. Keep the
; source art intact and use the first KOF95 standing frame as a 3x6-tile
; miniature for each imported fighter.
MixKOF_OrdSelCharIdleGFX:
	INCBIN "data/gfx/ordsel_char_kof95.bin"

; IN: C = imported CHAR_ID_* value, DE = VRAM destination
MixKOF_LoadOrdSelCharGFX1P:
	ld   a, c
	cp   CHAR_ID_KIM
	ret  c
	ld   a, $01
	jr   MixKOF_LoadOrdSelCharGFX
MixKOF_LoadOrdSelCharGFX2P:
	ld   a, c
	cp   CHAR_ID_KIM
	ret  c
	xor  a
MixKOF_LoadOrdSelCharGFX:
	push af
		ld   a, c
		sub  CHAR_ID_KIM
		srl  a
		ld   hl, MixKOF_OrdSelCharIdleGFX
		ld   bc, $0120
.seek:
		or   a
		jr   z, .sourceReady
		add  hl, bc
		dec  a
		jr   .seek
.sourceReady:
	pop  af
	ld   b, $12
	or   a
	jr   z, .copyNormal
	call CopyTilesHBlankFlipX
	jr   .done
.copyNormal:
	call CopyTiles
.done:
	inc  b
	ret

; Load 29 derived 16x24 portraits without touching the source artwork. The
; split is kept on a portrait boundary: 13 portraits fit below $9800 and the
; remaining 16 start at $8800. The original selector's UI tiles at $8EC0 and
; above remain available for the selected-character list.
MixKOF_LoadCharSelSinglePageGFX:
	ld   hl, MixKOF_CharSelPortraitSinglePage
	ld   de, $92F0
	ld   b, 13*$06
	call CopyTiles
	ld   de, $8800
	ld   b, 16*$06
	call CopyTiles
	ret

; Copy a four-byte win-animation descriptor into resident WRAM so bank $1E can
; consume mappings that point at imported OBJ lists in independent banks.
; IN: C = imported CHAR_ID_* value (CHAR_ID_KIM and later)
MixKOF_CopyWinAnimEntry:
	ld   a, c
	sub  CHAR_ID_KIM
	add  a, a
	ld   e, a
	ld   d, $00
	ld   hl, MixKOF_WinAnimEntryTbl
	add  hl, de
	ld   de, wLZSS_Buffer
	ld   b, $04
.copy:
	ldi  a, [hl]
	ld   [de], a
	inc  de
	dec  b
	jr   nz, .copy
	ret
MixKOF_WinAnimEntryTbl:
	dp OBJLstPtrTable_Kim_Win
	db $08
	dp OBJLstPtrTable_Benimaru_Win
	db $08
	dp OBJLstPtrTable_Yuri_Win
	db $08
	dp OBJLstPtrTable_Joe_Win
	db $08
	dp OBJLstPtrTable_Heidern_Win
	db $08
	dp OBJLstPtrTable_Ralf_Win
	db $08
	dp OBJLstPtrTable_Kensou_Win
	db $08
	dp OBJLstPtrTable_Eiji_Win
	db $08

Title_DrawTrainingText:
	ld   hl, TextDef_Menu_Training
	jp   TextPrinter_Instant
TextDef_Menu_Training:
	dw $9A24
	db .end-.start
.start:
	db "TRAN MODE"
.end:

; Move through one 6x5 grid. Slot 29 is the only empty cell; imported portrait
; slots are intentionally browseable even before their battle data is wired.
MixKOF_CharSelMoveL:
	ld   e, $FF
	jr   MixKOF_CharSelMoveH
MixKOF_CharSelMoveR:
	ld   e, $01
MixKOF_CharSelMoveH:
	ld   hl, wCharSelP1CursorPos
	ld   a, [wCharSelCurPl]
	or   a
	jr   z, .gotCursor
	inc  hl
.gotCursor:
	ld   a, [hl]
.move:
	ld   c, a
.modColumn:
	cp   CHARSEL_GRID_W
	jr   c, .gotColumn
	sub  a, CHARSEL_GRID_W
	jr   .modColumn
.gotColumn:
	bit  7, e
	jr   z, .checkRight
	or   a
	jr   z, .wrapLeft
	ld   a, c
	dec  a
	jr   .checkTarget
.wrapLeft:
	ld   a, c
	add  a, CHARSEL_GRID_W-1
	jr   .checkTarget
.checkRight:
	cp   CHARSEL_GRID_W-1
	jr   z, .wrapRight
	ld   a, c
	inc  a
	jr   .checkTarget
.wrapRight:
	ld   a, c
	sub  a, CHARSEL_GRID_W-1
.checkTarget:
	cp   CHARSEL_ID_RESERVED0
	jr   z, .move
.saveCursor:
	ld   [hl], a
	ret

MixKOF_CharSelMoveD:
	ld   e, CHARSEL_GRID_W
	jr   MixKOF_CharSelMoveV
MixKOF_CharSelMoveU:
	ld   e, -CHARSEL_GRID_W
MixKOF_CharSelMoveV:
	ld   hl, wCharSelP1CursorPos
	ld   a, [wCharSelCurPl]
	or   a
	jr   z, .gotCursor
	inc  hl
.gotCursor:
	ld   a, [hl]
.step:
	bit  7, e
	jr   nz, .up
	add  a, CHARSEL_GRID_W
	cp   CHARSEL_GRID_SIZE
	jr   c, .checkTarget
	sub  a, CHARSEL_GRID_SIZE
	jr   .checkTarget
.up:
	sub  a, CHARSEL_GRID_W
	bit  7, a
	jr   z, .checkTarget
	add  a, CHARSEL_GRID_SIZE
.checkTarget:
	cp   CHARSEL_ID_RESERVED0
	jr   z, .step
.save:
	ld   [hl], a
	ret

; Replace one resident portrait with a base or START-variant image while the
; selector LCD is active.
; IN: wCharSelVariantTileId = asset index, C = destination slot
; FarCall overwrites A before entering this bank, so the asset index must live
; in WRAM instead of being passed through A.
MixKOF_LoadCharSelPortrait:
	push bc
		ld   a, [wCharSelVariantTileId]
		ld   hl, MixKOF_CharSelPortraits
		ld   de, $0060
.seekSource:
		or   a
		jr   z, .sourceReady
		add  hl, de
		dec  a
		jr   .seekSource
.sourceReady:
	pop  bc
	push bc
	ld   a, c
	add  a, a
	ld   c, a
	ld   b, $00
	push hl
		ld   hl, .destinationTbl
		add  hl, bc
		ld   e, [hl]
		inc  hl
		ld   d, [hl]
	pop  hl
	ld   b, $06
	call CopyTilesHBlank
	pop  bc
	ret
.destinationTbl:
	dw $92F0, $9350, $93B0, $9410, $9470, $94D0, $9530
	dw $9590, $95F0, $9650, $96B0, $9710, $9770
	dw $8800, $8860, $88C0, $8920, $8980, $89E0, $8A40
	dw $8AA0, $8B00, $8B60, $8BC0, $8C20, $8C80, $8CE0
	dw $8D40, $8DA0

; Draw the name associated with an expanded single-page portrait. Original
; portrait slots continue to use CharSel_PrintCharName so START variants retain
; their distinct names; imported and reserved slots are keyed by portrait ID.
; IN: C = portrait ID, DE = player cursor OBJInfo
; FarCall overwrites A before entering this bank.
MixKOF_PrintCharSelPortraitName:
	ld   a, LOW(wOBJInfo_Pl1)
	cp   e
	jr   nz, .pl2
.pl1:
	push bc
	ld   hl, MixKOF_CharSelNameBlank
	ld   de, BG_CHARSEL_P1NAME
	call TextPrinter_Instant_CustomPos
	pop  bc
	call .getName
	ld   a, [hl]
	or   a
	ret  z
	ld   de, BG_CHARSEL_P1NAME
	jp   TextPrinter_Instant_CustomPos
.pl2:
	push bc
	ld   hl, MixKOF_CharSelNameBlank
	ld   de, BG_CHARSEL_P2NAME-$07
	call TextPrinter_Instant_CustomPos
	pop  bc
	call .getName
	ld   a, [hl]
	or   a
	ret  z
	ld   e, a
	ld   a, LOW(BG_CHARSEL_P2NAME+1)
	sub  e
	ld   e, a
	ld   d, HIGH(BG_CHARSEL_P2NAME+1)
	jp   TextPrinter_Instant_CustomPos
.getName:
	ld   a, c
	add  a, a
	ld   e, a
	ld   d, $00
	ld   hl, MixKOF_CharSelNamePtrTbl
	add  hl, de
	ldi  a, [hl]
	ld   h, [hl]
	ld   l, a
	ret
MixKOF_CharSelNameBlank: mTxtDef "        "
MixKOF_CharSelNamePtrTbl:
	dw MixKOF_CharSelName_Kyo, MixKOF_CharSelName_Andy, MixKOF_CharSelName_Terry
	dw MixKOF_CharSelName_Ryo, MixKOF_CharSelName_Robert, MixKOF_CharSelName_Iori
	dw MixKOF_CharSelName_Daimon, MixKOF_CharSelName_Mai, MixKOF_CharSelName_Geese
	dw MixKOF_CharSelName_MrBig, MixKOF_CharSelName_Krauser, MixKOF_CharSelName_Mature
	dw MixKOF_CharSelName_Athena, MixKOF_CharSelName_Chizuru, MixKOF_CharSelName_MrKarate
	dw MixKOF_CharSelName_Goenitz, MixKOF_CharSelName_Leona, MixKOF_CharSelName_Benimaru
	dw MixKOF_CharSelName_Yuri, MixKOF_CharSelName_Joe, MixKOF_CharSelName_Heidern
	dw MixKOF_CharSelName_Ralf, MixKOF_CharSelName_Kensou, MixKOF_CharSelName_Kim
	dw MixKOF_CharSelName_Eiji, MixKOF_CharSelName_Billy, MixKOF_CharSelName_Saisyu
	dw MixKOF_CharSelName_Rugal, MixKOF_CharSelName_Nakoruru, MixKOF_CharSelName_None
MixKOF_CharSelName_Kyo:      mTxtDef "KYO"
MixKOF_CharSelName_Andy:     mTxtDef "ANDY"
MixKOF_CharSelName_Terry:    mTxtDef "TERRY"
MixKOF_CharSelName_Ryo:      mTxtDef "RYO"
MixKOF_CharSelName_Robert:   mTxtDef "ROBERT"
MixKOF_CharSelName_Iori:     mTxtDef "IORI"
MixKOF_CharSelName_Daimon:   mTxtDef "DAIMON"
MixKOF_CharSelName_Mai:      mTxtDef "MAI"
MixKOF_CharSelName_Geese:    mTxtDef "GEESE"
MixKOF_CharSelName_MrBig:    mTxtDef "M<r.>BIG"
MixKOF_CharSelName_Krauser:  mTxtDef "KRAUSER"
MixKOF_CharSelName_Mature:   mTxtDef "MATURE"
MixKOF_CharSelName_Athena:   mTxtDef "ATHENA"
MixKOF_CharSelName_Chizuru:  mTxtDef "CHIZURU"
MixKOF_CharSelName_MrKarate: mTxtDef "M<r.>KARATE"
MixKOF_CharSelName_Goenitz:  mTxtDef "GOENITZ"
MixKOF_CharSelName_Leona:    mTxtDef "LEONA"
MixKOF_CharSelName_Benimaru: mTxtDef "BENIMARU"
MixKOF_CharSelName_Yuri:     mTxtDef "YURI"
MixKOF_CharSelName_Joe:      mTxtDef "JOE"
MixKOF_CharSelName_Heidern:  mTxtDef "HEIDERN"
MixKOF_CharSelName_Ralf:     mTxtDef "RALF"
MixKOF_CharSelName_Kensou:   mTxtDef "KENSOU"
MixKOF_CharSelName_Kim:      mTxtDef "KIM"
MixKOF_CharSelName_Eiji:     mTxtDef "EIJI"
MixKOF_CharSelName_Billy:    mTxtDef "BILLY"
MixKOF_CharSelName_Saisyu:   mTxtDef "SAISYU"
MixKOF_CharSelName_Rugal:    mTxtDef "RUGAL"
MixKOF_CharSelName_Nakoruru: mTxtDef "NAKORURU"
MixKOF_CharSelName_None:     db $00
MixKOF_CharSelPortraits_End:

; [POI] Holding B while choosing a mode enables CPU-vs-CPU, except for
; training and serial play. Kept in the expansion bank to free bank $1E.
ModeSelect_CheckCPUvsCPU:
	ld   a, [wTrainingMode]
	or   a
	ret  nz
	ld   a, [wMisc_C025]
	bit  MISCB_SERIAL_MODE, a
	ret  nz
	ldh  a, [hJoyKeys]
	bit  KEYB_B, a
	jr   z, .chkPl2
	ld   hl, wPlInfo_Pl1+iPlInfo_Flags0
	set  PF0B_CPU, [hl]
.chkPl2:
	ldh  a, [hJoyKeys2]
	bit  KEYB_B, a
	ret  z
	ld   hl, wPlInfo_Pl2+iPlInfo_Flags0
	set  PF0B_CPU, [hl]
	ret

; IN/OUT: D = damage. Active Super Cancel damage is floor(D/3), minimum 1.
; A and E are preserved for the common current/pending damage setters.
Play_Pl_ScaleSuperCancelDamageD_Banked:
	push af
		ld   hl, iPlInfo_SuperCancelFlags
		add  hl, bc
		bit  PSCB_DAMAGE_ACTIVE, [hl]
		jr   z, .done
		ld   a, d
		or   a
		jr   z, .done
		ld   d, $00
.divide:
		sub  $03
		jr   c, .minimum
		inc  d
		jr   .divide
.minimum:
		ld   a, d
		or   a
		jr   nz, .done
		inc  d
.done:
	pop  af
	ret

MixKOF_Bank20_End:
	ds $4000-(MixKOF_Bank20_End-MixKOF_CharSelPortraits), $FF
SECTION "bank21", ROMX, BANK[$21]
INCLUDE "src/mixkof/kim95_gfx.asm"
SECTION "bank22", ROMX, BANK[$22]
INCLUDE "src/mixkof/kim95_objlst.asm"
SECTION "bank23", ROMX, BANK[$23]
INCLUDE "src/mixkof/kim96_tables.asm"
SECTION "bank24", ROMX, BANK[$24]
INCLUDE "src/mixkof/kim95_code.asm"
SECTION "bank25", ROMX, BANK[$25]
GFX_Char_Icons: INCBIN "data/gfx/char_icons_mix.bin"
SECTION "bank26", ROMX, BANK[$26]
	INCLUDE "src/mixkof/benimaru95_gfx.asm"
SECTION "bank27", ROMX, BANK[$27]
	INCLUDE "src/mixkof/benimaru95_objlst.asm"
SECTION "bank28", ROMX, BANK[$28]
	INCLUDE "src/mixkof/benimaru96_tables.asm"
SECTION "bank29", ROMX, BANK[$29]
	INCLUDE "src/mixkof/benimaru95_code.asm"
SECTION "bank2A", ROMX, BANK[$2A]
	INCLUDE "src/mixkof/yuri95_gfx.asm"
SECTION "bank2B", ROMX, BANK[$2B]
	INCLUDE "src/mixkof/yuri95_objlst.asm"
SECTION "bank2C", ROMX, BANK[$2C]
	INCLUDE "src/mixkof/yuri96_tables.asm"
SECTION "bank2D", ROMX, BANK[$2D]
	INCLUDE "src/mixkof/yuri95_code.asm"
SECTION "bank2E", ROMX, BANK[$2E]
; Imported fighters keep their headers out of the full ROM0 table. DE carries
; the original player-info base because B is occupied by FarCall's bank number.
MixKOF_Play_LoadImportedChar:
	ld   hl, iPlInfo_CharId
	add  hl, de
	ld   a, [hl]
	sub  CHAR_ID_KIM
	ld   l, a
	ld   h, $00
REPT 3
	sla  l
	rl   h
ENDR
	ld   bc, MixKOF_ImportedCharHeaderTbl
	add  hl, bc
	push hl
	pop  bc
	ld   hl, iPlInfo_MoveAnimTblPtr_Low
	call .copyWord
	ld   hl, iPlInfo_MoveCodePtrTbl_Low
	call .copyWord
	ld   hl, iPlInfo_MoveInputCodePtr_Low
	call .copyWord
	ld   hl, iPlInfo_MoveInputCodePtr_Bank
	add  hl, de
	ld   a, [bc]
	inc  bc
	ld   [hl], a
	inc  bc
	ld   hl, iPlInfo_SpeedX_Sub
	call .copyWord
	ld   hl, iPlInfo_BackSpeedX_Sub
	call .copyWord
	ld   hl, iPlInfo_JumpSpeed_Sub
	call .copyWord
	ld   hl, iPlInfo_Gravity_Sub
.copyWord:
	add  hl, de
	ld   a, [bc]
	inc  bc
	ld   [hl], a
	dec  hl
	ld   a, [bc]
	inc  bc
	ld   [hl], a
	ret

MixKOF_ImportedCharHeaderTbl:
	dw MoveAnimTbl_Kim96, MoveCodePtrTbl_Kim96
	dpr MoveInputReader_Kim96
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Benimaru96, MoveCodePtrTbl_Benimaru96
	dpr MoveInputReader_Benimaru
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Yuri96, MoveCodePtrTbl_Yuri96
	dpr MoveInputReader_Yuri
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Joe96, MoveCodePtrTbl_Joe96
	dpr MoveInputReader_Joe
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Heidern96, MoveCodePtrTbl_Heidern96
	dpr MoveInputReader_Heidern
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Ralf96, MoveCodePtrTbl_Ralf96
	dpr MoveInputReader_Ralf
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Kensou96, MoveCodePtrTbl_Kensou96
	dpr MoveInputReader_Kensou
	db $00
	dw +$0180, -$0100, -$0700, +$0060
	dw MoveAnimTbl_Eiji96, MoveCodePtrTbl_Eiji96
	dpr MoveInputReader_Eiji
	db $00
	dw +$0180, -$0100, -$0700, +$0060

MixKOF_GetMoveTblBank_Banked:
	ld   hl, iPlInfo_CharId
	add  hl, de
	ld   a, [hl]
	cp   CHAR_ID_KIM
	jr   z, .kim
	cp   CHAR_ID_BENIMARU
	jr   z, .benimaru
	cp   CHAR_ID_YURI
	jr   z, .yuri
	cp   CHAR_ID_JOE
	jr   z, .joe
	cp   CHAR_ID_HEIDERN
	jr   z, .heidern
	cp   CHAR_ID_RALF
	jr   z, .ralf
	cp   CHAR_ID_KENSOU
	jr   z, .kensou
	cp   CHAR_ID_EIJI
	jr   z, .eiji
	ld   a, BANK(MoveAnimTbl_Marker)
	jr   .save
.kim:
	ld   a, BANK(MoveAnimTbl_Kim96)
	jr   .save
.benimaru:
	ld   a, BANK(MoveAnimTbl_Benimaru96)
	jr   .save
.yuri:
	ld   a, BANK(MoveAnimTbl_Yuri96)
	jr   .save
.joe:
	ld   a, BANK(MoveAnimTbl_Joe96)
	jr   .save
.heidern:
	ld   a, BANK(MoveAnimTbl_Heidern96)
	jr   .save
.ralf:
	ld   a, BANK(MoveAnimTbl_Ralf96)
	jr   .save
.kensou:
	ld   a, BANK(MoveAnimTbl_Kensou96)
	jr   .save
.eiji:
	ld   a, BANK(MoveAnimTbl_Eiji96)

.save:
	ldh  [hMoveTblBank], a
	ret
SECTION "bank2F", ROMX, BANK[$2F]
	INCLUDE "src/mixkof/joe95_gfx.asm"
SECTION "bank30", ROMX, BANK[$30]
	INCLUDE "src/mixkof/joe95_objlst.asm"
SECTION "bank31", ROMX, BANK[$31]
	INCLUDE "src/mixkof/joe96_tables.asm"
SECTION "bank32", ROMX, BANK[$32]
	INCLUDE "src/mixkof/joe95_code.asm"
SECTION "bank33", ROMX, BANK[$33]
	INCLUDE "src/mixkof/heidern95_gfx.asm"
SECTION "bank34", ROMX, BANK[$34]
	INCLUDE "src/mixkof/heidern95_objlst.asm"
SECTION "bank35", ROMX, BANK[$35]
	INCLUDE "src/mixkof/heidern96_tables.asm"
SECTION "bank36", ROMX, BANK[$36]
	INCLUDE "src/mixkof/heidern95_code.asm"
SECTION "bank37", ROMX, BANK[$37]
	INCLUDE "src/mixkof/ralf95_gfx_0.asm"
SECTION "bank38", ROMX, BANK[$38]
	INCLUDE "src/mixkof/ralf95_gfx_1.asm"
SECTION "bank39", ROMX, BANK[$39]
	INCLUDE "src/mixkof/ralf95_objlst.asm"
SECTION "bank3A", ROMX, BANK[$3A]
	INCLUDE "src/mixkof/ralf96_tables.asm"
SECTION "bank3B", ROMX, BANK[$3B]
	INCLUDE "src/mixkof/ralf95_code.asm"
SECTION "bank3C", ROMX, BANK[$3C]

; Load the self-contained KOF95 projectile sheet directly into KOF96's
; per-player projectile VRAM region. Play_LoadProjectileGFXFromDef enters this
; routine with a tail far-jump, so restore bank $01 before returning to its
; original caller.
; IN: DE = VRAM destination ($8800 for P1 or $8A60 for P2)
MixKOF_LoadProjectileGFX:
	ld   a, d
	cp   $8A
	ld   a, [wPlInfo_Pl1+iPlInfo_CharId]
	jr   nz, .gotChar
	ld   a, [wPlInfo_Pl2+iPlInfo_CharId]
.gotChar:
	cp   CHAR_ID_KIM
	jr   nc, .imported
	ld   c, a
	ld   b, BANK(OBJInfoInit_Projectile)
	ld   hl, Play_LoadProjectileGFXFromDef.residentFromMix
	jp   $0000
.imported:
	sub  CHAR_ID_KIM
	srl  a
	add  a, a
	ld   l, a
	ld   h, $00
	ld   bc, MixKOF_ProjectileGFXPtrTbl
	add  hl, bc
	ld   a, [hl]
	inc  hl
	ld   h, [hl]
	ld   l, a
	ld   a, h
	or   l
	jr   z, .restoreBank
	; KOF95's projectile OBJ mappings start at relative tile $02. Keep the
	; original two transparent leading tiles so the imported mappings address
	; the same graphics they did in KOF95.
	push hl
		ld   hl, $0000
		ld   b, $02
		call FillGFX
	pop  hl
	ld   b, [hl]
	inc  hl
	call CopyTilesHBlank
.restoreBank:
	ld   b, BANK(OBJInfoInit_Projectile)
	ld   hl, Play_LoadProjectileGFXFromDef.ret
	jp   $0000

MixKOF_ProjectileGFXPtrTbl:
	dw $0000
	dw MixKOF_ProjectileGFX_Benimaru
	dw MixKOF_ProjectileGFX_Yuri
	dw MixKOF_ProjectileGFX_Joe
	dw MixKOF_ProjectileGFX_Heidern
	dw $0000
	dw MixKOF_ProjectileGFX_Kensou
	dw MixKOF_ProjectileGFX_Eiji

MixKOF_ProjectileGFX_Benimaru:
	db $14
	INCBIN "data/gfx/proj/kof95/benimaru.bin"
MixKOF_ProjectileGFX_Yuri:
	db $1C
	INCBIN "data/gfx/proj/kof95/yuri.bin"
MixKOF_ProjectileGFX_Joe:
	db $0E
	INCBIN "data/gfx/proj/kof95/joe.bin"
MixKOF_ProjectileGFX_Heidern:
	db $12
	INCBIN "data/gfx/proj/kof95/heidern.bin"
MixKOF_ProjectileGFX_Kensou:
	db $0A
	INCBIN "data/gfx/proj/kof95/kensou.bin"
MixKOF_ProjectileGFX_Eiji:
	db $08
	INCBIN "data/gfx/proj/kof95/eiji.bin"

	INCLUDE "src/mixkof/kof95_projectiles.asm"
SECTION "bank3D", ROMX, BANK[$3D]
	INCLUDE "src/mixkof/kensou95_gfx.asm"
SECTION "bank3E", ROMX, BANK[$3E]
	INCLUDE "src/mixkof/kensou95_objlst.asm"
	INCLUDE "src/mixkof/eiji95_gfx.asm"
SECTION "bank3F", ROMX, BANK[$3F]
	INCLUDE "src/mixkof/kensou96_tables.asm"
	INCLUDE "src/mixkof/kensou95_code.asm"
	INCLUDE "src/mixkof/eiji95_objlst.asm"
	INCLUDE "src/mixkof/eiji96_tables.asm"
	INCLUDE "src/mixkof/eiji95_code.asm"
