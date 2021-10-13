#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

;~ При закрытии приложения сохранить расположение окна
OnAutoItExitRegister("saveSettings")
#NoTrayIcon

;~ отключает остановку скрипта по нажатию на иконку в трее
Opt("TrayAutoPause", 0)

; Проверка на запуск одного экземпляра приложения
$p = ProcessList(StringReplace(@ScriptName,".au3",".exe"))
If $p[0][0] > 1 Then
    MsgBox(0,"Внимание", "Приложение уже запущенно", 3)
    Exit
EndIf

$sPathToIni = 'C:\СПО\cod-helper\config.ini'

$X = IniRead($sPathToIni, 'POS', 'X', -1)
$Y = IniRead($sPathToIni, 'POS', 'Y', -1)
$isChecked = IniRead($sPathToIni, 'Settings', 'setOnTop', -1)


Global $semafore = False

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Помощник ЦОД", 149, 130, $X, $Y, $GUI_SS_DEFAULT_GUI - $WS_MINIMIZEBOX)
$Label1 = GUICtrlCreateLabel("Помощник ЦОД", 32, 24, 95, 17)
$StartStop = GUICtrlCreateButton("Включить", 40, 72, 75, 25)
$Label2 = GUICtrlCreateLabel("Статус:", 40, 48, 41, 17)
$nCheckBox = GUICtrlCreateCheckbox('Поверх окон', 35, 105, 100, 20)
$Status = GUICtrlCreateLabel("выкл", 88, 48, 30, 17)
GUICtrlSetState($nCheckBox,$isChecked)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $StartStop
			If $semafore = True Then
				$semafore = False
				GUICtrlSetData($StartStop,'Включить')
				GUICtrlSetColor(-1, 0xFF0000)
			Else
				$semafore = True
				GUICtrlSetData($StartStop,'Выключить')
				GUICtrlSetColor(-1, 0x008000)
			EndIf

;~ 			Поверх всех окон
		Case $nCheckBox or $isChecked = 1
			WinSetOnTop($Form1, '', BitAND(GUICtrlRead($nCheckBox), $GUI_CHECKED))
		EndSwitch

		If $semafore Then
			$edit = ControlGetText("Объекты", "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:1]")
			$temp = StringRegExpReplace($edit, "\x22", "")
			$temp = StringReplace($temp, "строен. на уч.", "%")
			$temp = StringReplace($temp, "сооружение уч.", "%")
			$temp = StringReplace($temp, "дом на участке ", "%")
			$temp = StringReplace($temp, "Поселение ", "%")
			$temp = StringReplace($temp, "сооружение", "%")
			$temp = StringReplace($temp, "санаторий", "%")
			$temp = StringReplace($temp, "строен.на", "%")
			$temp = StringReplace($temp, "строен.", "%")
			$temp = StringReplace($temp, " участок ", "%")
			$temp = StringReplace($temp, "строение", "%")
			$temp = StringReplace($temp, "дер. ко", "%")
			$temp = StringReplace($temp, " у хут.", "%")
			$temp = StringReplace($temp, "у дер.", "%")
			$temp = StringReplace($temp, "дом на уч.", "%")
			$temp = StringReplace($temp, "район ", "%")
			$temp = StringReplace($temp, "квартал ", "%")
			$temp = StringReplace($temp, "на уч.", "%")
			$temp = StringReplace($temp, "вл.", "%")
			$temp = StringReplace($temp, "вл ", "%")
			$temp = StringReplace($temp, "строен.", "%")
			$temp = StringReplace($temp, " строен ", "%")
			$temp = StringReplace($temp, "деревни ", "%")
			$temp = StringReplace($temp, "у ст.", "%")
			$temp = StringReplace($temp, "вблизи дер.", "%")
			$temp = StringReplace($temp, "вблизи", "%")
			$temp = StringReplace($temp, "влд.", "%")
			$temp = StringReplace($temp, "вбл.", "%")
			$temp = StringReplace($temp, "с/о", "%")
			$temp = StringReplace($temp, "с.о", "%")
			$temp = StringReplace($temp, "д.на", "%")
			$temp = StringReplace($temp, "неопр ", "%")
			$temp = StringReplace($temp, "тер.", "%")
			$temp = StringReplace($temp, "дом", "%")
			$temp = StringReplace($temp, "стр.", "%")
			$temp = StringReplace($temp, "уч-к", "%")
			$temp = StringReplace($temp, "кв,", "%")
			$temp = StringReplace($temp, "р-н", "%")
			$temp = StringReplace($temp, "уч.", "%")
			$temp = StringReplace($temp, " уч ", "%")
			$temp = StringReplace($temp, "г.", "%")
			$temp = StringReplace($temp, " д ", "%")
			$temp = StringReplace($temp, " спк ", "%")
			$temp = StringReplace($temp, " дер.", "%")
			$temp = StringReplace($temp, " пос.", "%")
			$temp = StringReplace($temp, " ул.", "%")
			$temp = StringReplace($temp, "д.", "%")
			$temp = StringReplace($temp, "ст.", "%")
			$temp = StringReplace($temp, "с/т", "%")
			$temp = StringReplace($temp, " ст ", "%")
			$temp = StringReplace($temp, "с.", "%")
			$temp = StringReplace($temp, " п.", "%")
			$temp = StringReplace($temp, "№", "%")
			$temp = StringReplace($temp, ".", "%")
			$temp = StringReplace($temp, ",", "%")
			$temp = StringReplace($temp, '"', "%")
			$temp = StringReplace($temp, "/", "%")
			$temp = StringReplace($temp, "»", "%")
			$temp = StringReplace($temp, "«", "%")
			$temp = StringReplace($temp, "'", "%")
			$temp = StringReplace($temp, " ", "%")
			$temp = StringReplace($temp, "%%", "%")
			$temp_Done = StringReplace($temp, "%%%", "%")

			If ControlGetText("Помощник ЦОД", "", $Status)  <> 'вкл.' Then
				GUICtrlSetData($Status,'вкл.')
				GUICtrlSetColor($Status, 0x008000)
				ConsoleWrite ( 'On' & @CRLF)
			EndIf

			;~ Заменить строку, если значение не совпадает
			If $temp_Done <> $edit Then
			    ControlSetText("Объекты", "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:1]", $temp_Done)
			EndIf

		Else
			If ControlGetText("Помощник ЦОД", "", $Status)  <> 'выкл.' Then
				GUICtrlSetData($Status,'выкл.')
				GUICtrlSetColor(-1, 0xFF0000)
				ConsoleWrite ( 'Off' & @CRLF)
			EndIf


		EndIf

WEnd

Func saveSettings()
	$aWinPos = WinGetPos($Form1)
	DirCreate('C:\СПО\cod-helper\')
	IniWrite($sPathToIni, 'POS', 'X', $aWinPos[0])
	IniWrite($sPathToIni, 'POS', 'Y', $aWinPos[1])
	IniWrite($sPathToIni, 'Settings', 'setOnTop', GUICtrlRead($nCheckBox))
	Exit
EndFunc

