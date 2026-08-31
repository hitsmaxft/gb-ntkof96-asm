; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Proj_Athena_PsychoBall_Athena95:
	dw OBJLstHdrA_Proj_Athena_PsychoBall0_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_PsychoBall1_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_PsychoBall2_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_PsychoBall1_Athena95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE

OBJLstPtrTable_Proj_Athena_ShCrystCharge_Athena95:
	dw OBJLstHdrA_Proj_Athena_ShCrystCharge0_Athena95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Athena_ShCrystThrown_Athena95:
	dw OBJLstHdrA_Proj_Athena_ShCrystCharge0_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_PsychoBall0_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_ShCrystThrown2_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_PsychoBall2_Athena95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Athena_ShCrystThrown4_Athena95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Proj_Athena_PsychoBall0_Athena95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F8,$02 ; $00
	db $28,$00,$02|OLR_XFLIP ; $01
OBJLstHdrA_Proj_Athena_PsychoBall2_Athena95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F8,$04 ; $00
	db $28,$00,$04|OLR_XFLIP ; $01

; The original KOF95 table reused Ryo's invisible projectile frame because all
; projectile mappings shared one bank. Imported characters live in independent
; banks, so keep an equivalent local frame instead of following a bankless
; pointer into Ryo's bank.
OBJLstHdrA_Proj_Athena_PsychoBall1_Athena95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $01 ; OBJ Count
	db $10,$FA,$00
OBJLstHdrA_Proj_Athena_ShCrystCharge0_Athena95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $01 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$FC,$06 ; $00
OBJLstHdrA_Proj_Athena_ShCrystThrown2_Athena95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F8,$08 ; $00
	db $28,$00,$08|OLR_XFLIP ; $01
OBJLstHdrA_Proj_Athena_ShCrystThrown4_Athena95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F8,$0A ; $00
	db $28,$00,$0A|OLR_XFLIP ; $01
