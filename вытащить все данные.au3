#include <MsgBoxConstants.au3>
#include <Array.au3>

; Получаем весь текст окна Цодд.
Local $sText = WinGetText("Объекты")

; Разбираем текст на строки, использую скобку как разделитель
$aArray = StringSplit($sText,@LF,1)

; Выводим сообщение с результатами, оставляя только цифры
MsgBox(4096, "Всего", $aArray[32])

;~ 77000000000155700, 109240, 77, р-н Таганский, пер Котельнический 1-й, д 5, строен 2