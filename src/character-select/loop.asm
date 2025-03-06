; ---------------------------------------------------------------------------

CheckSideInputCharacterSelect:
	LDA Player1JoypadPress
	AND #ControllerInput_Right | ControllerInput_Left | ControllerInput_Down | ControllerInput_Up
	BNE CharacterSelect_ChangeCharacter

	JMP CharacterSelectMenuLoop

; ---------------------------------------------------------------------------

CharacterSelect_ChangeCharacter:
  LDA CursorLocation
  STA PrevCursorLocation


CheckRightCharSelect:
	LDA Player1JoypadPress
	AND #ControllerInput_Right
	BEQ CheckLeftCharSelect
	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1

MoveCursorRightCharSelect:
  INC CursorLocation
  LDA CursorLocation
  CMP #CursorOverflow
  BNE CheckLeftCharSelect
  AND #$00 ; Set cursor back to 0
  STA CursorLocation


CheckLeftCharSelect:
	LDA Player1JoypadPress
	AND #ControllerInput_Left
	BEQ CheckUpCharSelect

	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1

MoveCursorLeftCharSelect:
  DEC CursorLocation
  BPL CheckUpCharSelect
  LDA #MaxCursorIndex
  STA CursorLocation


CheckUpCharSelect:
  LDA Player1JoypadPress
  AND #ControllerInput_Up
  BEQ CheckDownCharSelect
  LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1

MoveCursorUpCharSelect:
  LDA CursorLocation
  SEC
  SBC #$04
  BPL SetCursorUpCharSelect
  AND #$0B
SetCursorUpCharSelect:
  STA CursorLocation


CheckDownCharSelect:
  LDA Player1JoypadPress
  AND #ControllerInput_Down
  BEQ SetCursorLocationGFXCharSelect
  LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1

MoveCursorDownCharSelect:
  LDA CursorLocation
  CLC
  ADC #$04
  CMP #CursorOverflow
  BMI SetCursorDownCharSelect
  AND #$03
SetCursorDownCharSelect:
  STA CursorLocation

; Update the cursor
SetCursorLocationGFXCharSelect:
  LDA CursorLocation
  LSR A
  LSR A
  TAX
  LDA CursorLocation
  AND #$03
  TAY
  LDA PlayerSelectPLetterX, Y
  STA SpriteDMAArea + 3
  LDA PlayerSelectPNumberX, Y
  STA SpriteDMAArea + 7
  LDA PlayerSelectCursorY, X
  STA SpriteDMAArea
  STA SpriteDMAArea + 4


UpdatePaletteCharacter:
  LDY PrevCursorLocation
  LDA DMATableCharacterPalette, Y
  TAY
  LDA #$00
  STA SpriteDMAArea, Y
  STA SpriteDMAArea + 8, Y
  LDA #$40
  STA SpriteDMAArea + 4, Y
  STA SpriteDMAArea + 12, Y

  LDY CursorLocation
  LDA DMATableCharacterPalette, Y
  TAY
  LDA #$01
  STA SpriteDMAArea, Y
  STA SpriteDMAArea + 8, Y
  LDA #$41
  STA SpriteDMAArea + 4, Y
  STA SpriteDMAArea + 12, Y


; Loop unrolling! Also make it so I can save 3 bytes per palette
DumpNewPaletteCharacter:
  LDY CursorLocation
  LDA PlayerSelectPaletteOffsets, Y
  TAY
  LDA #$3F
  STA PPUBuffer_301
  LDA #$14
  STA PPUBuffer_301 + 1
  LDA #$04
  STA PPUBuffer_301 + 2
  LDA PlayerSelectSpritePalettes, Y
	STA PPUBuffer_301 + 3
  LDA PlayerSelectSpritePalettes + 1, Y
	STA PPUBuffer_301 + 4
  LDA PlayerSelectSpritePalettes + 2, Y
	STA PPUBuffer_301 + 5
  LDA PlayerSelectSpritePalettes + 3, Y
	STA PPUBuffer_301 + 6
  LDA #$00
	STA PPUBuffer_301 + 7
  LDA #$07
  STA byte_RAM_300


CharacterSelectMenuLoop:
	JSR WaitForNMI_TurnOnPPU

	LDA Player1JoypadPress
	AND #ControllerInput_A
	BNE QuitCharacterSelect

	JMP CheckSideInputCharacterSelect
