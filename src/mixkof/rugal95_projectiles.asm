; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Proj_Rugal_ReppuKen:
	dw OBJLstHdrA_Proj_Rugal_ReppuKen0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Iori_YamiBarai1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Rugal_KaiserWave:
	dw OBJLstHdrA_Proj_Rugal_KaiserWave0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_HaohShoukouKen1_Rugal95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Rugal_GiganticPressure:
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure10, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure10, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure10, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure10, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure22, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure22, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Rugal_GiganticPressure22, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Proj_Benimaru_ThunderBall8_Rugal95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $01 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$FA,$00 ; $00
OBJLstHdrA_Proj_Ryo_HaohShoukouKen1_Rugal95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0B ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Rugal95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Iori_YamiBarai1:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Rugal95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Rugal_ReppuKen0:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F8,$02 ; $00
	db $30,$00,$04 ; $01
	db $30,$08,$06 ; $02
OBJLstHdrA_Proj_Rugal_KaiserWave0:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0B ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $0C ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F8,$08 ; $00
	db $20,$00,$0A ; $01
	db $20,$08,$0C ; $02
	db $10,$F8,$0E ; $03
	db $10,$00,$10 ; $04
	db $10,$08,$12 ; $05
	db $30,$F8,$08|OLR_YFLIP ; $06
	db $30,$00,$0A|OLR_YFLIP ; $07
	db $30,$08,$0C|OLR_YFLIP ; $08
	db $40,$F8,$0E|OLR_YFLIP ; $09
	db $40,$00,$10|OLR_YFLIP ; $0A
	db $40,$08,$12|OLR_YFLIP ; $0B
OBJLstHdrA_Proj_Rugal_GiganticPressure1:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0E ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Rugal95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Rugal_GiganticPressure0:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0E ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $18 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$F0,$14 ; $00
	db $10,$F8,$16 ; $01
	db $20,$F0,$18 ; $02
	db $20,$F8,$1A ; $03
	db $10,$08,$14|OLR_XFLIP ; $04
	db $10,$00,$16|OLR_XFLIP ; $05
	db $20,$08,$18|OLR_XFLIP ; $06
	db $20,$00,$1A|OLR_XFLIP ; $07
	db $F0,$F0,$1C ; $08
	db $F0,$F8,$1E ; $09
	db $F0,$08,$1C|OLR_XFLIP ; $0A
	db $F0,$00,$1E|OLR_XFLIP ; $0B
	db $00,$F0,$1C ; $0C
	db $00,$F8,$1E ; $0D
	db $00,$08,$1C|OLR_XFLIP ; $0E
	db $00,$00,$1E|OLR_XFLIP ; $0F
	db $30,$F0,$1C ; $10
	db $30,$F8,$1E ; $11
	db $30,$08,$1C|OLR_XFLIP ; $12
	db $30,$00,$1E|OLR_XFLIP ; $13
	db $E0,$F0,$1C ; $14
	db $E0,$F8,$1E ; $15
	db $E0,$08,$1C|OLR_XFLIP ; $16
	db $E0,$00,$1E|OLR_XFLIP ; $17
OBJLstHdrA_Proj_Rugal_GiganticPressure10:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0E ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $18 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$F0,$1C ; $00
	db $10,$F8,$1E ; $01
	db $10,$08,$1C|OLR_XFLIP ; $02
	db $10,$00,$1E|OLR_XFLIP ; $03
	db $20,$F0,$1C ; $04
	db $20,$F8,$1E ; $05
	db $20,$08,$1C|OLR_XFLIP ; $06
	db $20,$00,$1E|OLR_XFLIP ; $07
	db $30,$F0,$1C ; $08
	db $30,$F8,$1E ; $09
	db $30,$08,$1C|OLR_XFLIP ; $0A
	db $30,$00,$1E|OLR_XFLIP ; $0B
	db $00,$F0,$1C ; $0C
	db $00,$F8,$1E ; $0D
	db $00,$08,$1C|OLR_XFLIP ; $0E
	db $00,$00,$1E|OLR_XFLIP ; $0F
	db $F0,$F0,$1C ; $10
	db $F0,$F8,$1E ; $11
	db $F0,$08,$1C|OLR_XFLIP ; $12
	db $F0,$00,$1E|OLR_XFLIP ; $13
	db $E0,$F0,$1C ; $14
	db $E0,$F8,$1E ; $15
	db $E0,$08,$1C|OLR_XFLIP ; $16
	db $E0,$00,$1E|OLR_XFLIP ; $17
OBJLstHdrA_Proj_Rugal_GiganticPressure22:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $0C ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$F8,$1C ; $00
	db $10,$00,$1C|OLR_XFLIP ; $01
	db $20,$F8,$1C ; $02
	db $20,$00,$1C|OLR_XFLIP ; $03
	db $30,$F8,$1C ; $04
	db $30,$00,$1C|OLR_XFLIP ; $05
	db $00,$F8,$1C ; $06
	db $00,$00,$1C|OLR_XFLIP ; $07
	db $F0,$F8,$1C ; $08
	db $F0,$00,$1C|OLR_XFLIP ; $09
	db $E0,$F8,$1C ; $0A
	db $E0,$00,$1C|OLR_XFLIP ; $0B
