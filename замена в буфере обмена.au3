#Include <Misc.au3>
;~ полный список клавиш http://autoit-script.ru/autoit3_docs/libfunctions/_ispressed.htm
;~ замена в буфере обмена

;~ убирает стандартные пункты из трея
;~ Opt("TrayMenuMode", 1)


; Проверка на запуск одного экземпляра приложения
$p = ProcessList(StringReplace(@ScriptName,".au3",".exe"))
If $p[0][0] > 1 Then
    MsgBox(0,"Внимание", "Приложение уже запущенно", 3)
    Exit
EndIf

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
	Sleep(100)
	Until _IsPressed(76) <> 0 ;~ Стоп по нажатию F7
EndIf
WEnd
