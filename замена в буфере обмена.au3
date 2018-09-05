#Include <Misc.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;~ полный список клавиш http://autoit-script.ru/autoit3_docs/libfunctions/_ispressed.htm
;~ замена в буфере обмена

;~ убирает стандартные пункты из трея
;~ Opt("TrayMenuMode", 1)
;~ отключает остановку скрипта по нажатию на иконку в трее
Opt("TrayAutoPause", 0)


; Проверка на запуск одного экземпляра приложения
$p = ProcessList(StringReplace(@ScriptName,".au3",".exe"))
If $p[0][0] > 1 Then
    MsgBox(0,"Внимание", "Приложение уже запущенно", 3)
    Exit
EndIf

;~ #Region GUI
;~ Запускаем GUI и делаем поверх всех окон
;~ $Form1 = WinSetOnTop(GUICreate("Помощник ЦОДД", 283, 70, 1625, 934), "", 1)
;~ $Button_Start = GUICtrlCreateButton("Запустить", 104, 16, 75, 38)
;~ $Text_Status = GUICtrlCreateLabel("Выключен", 8, 25, 83, 24)
;~ GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
;~ GUICtrlSetColor(-1, 0xFF0000)
;~ $Button1 = GUICtrlCreateButton("Остановить", 192, 16, 75, 38)
;~ GUISetState(@SW_SHOW)
;~ #EndRegion GUI


;~ $button_About = TrayCreateItem("Инструкция")
;~ $button_Setup = TrayCreateItem("Настройки")
While 1
	If _IsPressed(75) Then ;~ Запуск по нажатию F6
		Do
	$temp = StringReplace(ClipGet ( ), "строен.на уч.", "%")
	$temp = StringReplace($temp, "санаторий", "%")
	$temp = StringReplace($temp, "строен.на", "%")
	$temp = StringReplace($temp, "строение", "%")
	$temp = StringReplace($temp, "дер. ко", "%")
	$temp = StringReplace($temp, "на уч.", "%")
	$temp = StringReplace($temp, "у ст.", "%")
	$temp = StringReplace($temp, "вблизи", "%")
	$temp = StringReplace($temp, "влд.", "%")
	$temp = StringReplace($temp, "вбл.", "%")
	$temp = StringReplace($temp, "с/о", "%")
	$temp = StringReplace($temp, "тер.", "%")
	$temp = StringReplace($temp, "стр.", "%")
	$temp = StringReplace($temp, "уч-к", "%")
	$temp = StringReplace($temp, "кв,", "%")
	$temp = StringReplace($temp, "р-н", "%")
	$temp = StringReplace($temp, "уч.", "%")
	$temp = StringReplace($temp, " уч ", "%")
	$temp = StringReplace($temp, "г.", "%")
	$temp = StringReplace($temp, " д ", "%")
	$temp = StringReplace($temp, " спк ", "%")
	$temp = StringReplace($temp, "ул.", "%")
	$temp = StringReplace($temp, "д.", "%")
	$temp = StringReplace($temp, "ст.", "%")
	$temp = StringReplace($temp, "с/т", "%")
	$temp = StringReplace($temp, "№", "%")
	$temp = StringReplace($temp, ".", "%")
	$temp = StringReplace($temp, ",", "%")
	$temp = StringReplace($temp, '"', "%")
	$temp = StringReplace($temp, "/", "%")
	$temp = StringReplace($temp, " ", "%")
	$temp = StringReplace($temp, "%%", "%")
	$temp_Done = StringReplace($temp, "%%%", "%")
	ClipPut ( $temp_Done )
	;~ 	Обновляет в GUI статус выполнения
;~ GUICtrlSetData($Label7, StringRegExpReplace(StringSplit(WinGetText("ЦОД v.1.0.8.5"), ")",1)[1],'[^0-9]',''))
	Sleep(100)
	Until _IsPressed(76) <> 0 ;~ Стоп по нажатию F7
EndIf
$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd





