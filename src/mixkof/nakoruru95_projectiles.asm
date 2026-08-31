; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Bird:
	dw OBJLstHdrA_Bird0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Bird1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Nakoruru_Bird:
	dw OBJLstHdrA_Proj_Nakoruru_Bird0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Bird0:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1E,$FA,$02 ; $00
	db $1E,$02,$04 ; $01
	db $1E,$0A,$06 ; $02
	db $2E,$02,$08 ; $03
	db $2E,$FA,$0A ; $04
OBJLstHdrA_Bird1:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $2B,$ED,$0C ; $00
	db $2B,$F5,$0E ; $01
	db $23,$FD,$10 ; $02
	db $33,$FD,$12 ; $03
OBJLstHdrA_Proj_Nakoruru_Bird0:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$14 ; $00
	db $20,$FA,$16 ; $01
	db $20,$02,$18 ; $02
	db $20,$0A,$1A ; $03
	db $30,$FA,$1C ; $04
	db $30,$02,$1E ; $05
	db $38,$F2,$20 ; $06
