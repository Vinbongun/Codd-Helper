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
TrayCreateItem("Выход")
TrayItemSetOnEvent(-1, "On_Exit")



; Проверка на запуск одного экземпляра приложения
$p = ProcessList(StringReplace(@ScriptName,".au3",".exe"))
If $p[0][0] > 1 Then
    MsgBox(0,"Внимание", "Приложение уже запущенно", 3)
    Exit
EndIf

#Region GUI
;~ Запускаем GUI и делаем поверх всех окон
$Form1 = WinSetOnTop(GUICreate("Помощник ЦОДД", 283, 70, 1625, 934), "", 1)
$Button_Start = GUICtrlCreateButton("Запустить", 104, 16, 75, 38)
$Text_Status = GUICtrlCreateLabel("Выключен", 8, 25, 83, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Button_Stop = GUICtrlCreateButton("Остановить", 192, 16, 75, 38)
GUISetState(@SW_SHOW)
#EndRegion GUI


;~ $button_About = TrayCreateItem("Инструкция")
;~ $button_Setup = TrayCreateItem("Настройки")
While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
        Case $Button_Stop
            GUICtrlSetColor($Text_Status, 0xff0000)
			 GUICtrlSetData($Text_Status, "Выключен")
			 MsgBox($MB_SYSTEMMODAL, "", "Стоп")
        Case $Button_Start
            While 1
                For $i = 1 To 500
                    If GUIGetMsg() = $Button_Stop Then Exit
                    Sleep(10)
				$temp = StringReplace(ClipGet ( ), "строен.на уч.", "%")
				$temp = StringReplace($temp, "строен. на уч.", "%")
				$temp = StringReplace($temp, "сооружение уч.", "%")
				$temp = StringReplace($temp, "дом на участке ", "%")
				$temp = StringReplace($temp, "сооружение", "%")
				$temp = StringReplace($temp, "санаторий", "%")
				$temp = StringReplace($temp, "строен.на", "%")
				$temp = StringReplace($temp, "строен.", "%")
				$temp = StringReplace($temp, " участок ", "%")
				$temp = StringReplace($temp, "строение", "%")
				$temp = StringReplace($temp, "дер. ко", "%")
				$temp = StringReplace($temp, "дом на уч.", "%")
				$temp = StringReplace($temp, "район ", "%")
				$temp = StringReplace($temp, "квартал ", "%")
				$temp = StringReplace($temp, "на уч.", "%")
				$temp = StringReplace($temp, "вл.", "%")
				$temp = StringReplace($temp, "строен.", "%")
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
				$temp = StringReplace($temp, "дер.", "%")
				$temp = StringReplace($temp, "ул.", "%")
				$temp = StringReplace($temp, "д.", "%")
				$temp = StringReplace($temp, "ст.", "%")
				$temp = StringReplace($temp, "с/т", "%")
				$temp = StringReplace($temp, " ст ", "%")
				$temp = StringReplace($temp, "с.", "%")
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
					ClipPut ( $temp_Done )
			Next
			GUICtrlSetColor($Text_Status, 0x008000)
			 GUICtrlSetData($Text_Status, "Включен")
			 MsgBox($MB_SYSTEMMODAL, "", "Стоп")
            WEnd
    EndSwitch
WEnd
While $start1 = 0
  sleep(10)
  WinActivate("%%здесь было имя")
  ; $ButtonStop - это идентификатор кнопки "остановить"
  If GUIGetMsg() = $ButtonStop Then $start1 = 1
WEnd
