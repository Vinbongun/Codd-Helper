; Пример 1, замена текста
$sText = StringReplace("это строка текста", " ", "%")
$iReplacements = @extended
MsgBox(4096, 'Строка после замены', $sText & @CRLF & @CRLF & _
        'Количество сделанных замен: ' & $iReplacements)

; Пример 2, замена в позиции
$sText = StringReplace("это строка текста", 6, "---")
MsgBox(0, 'Замена в позиции', $sText)


$text = "77000000000155700, 109240, 77, р-н Таганскийд, пер Котельнический 1-й, д 5, строен 2 переулок строенчис р-нон"
$codAll = StringRegExpReplace($text,'пер|строен|[д]|р-н','')
$codAll = StringRegExpReplace($codAll,',','')
;~ $codAll = StringRegExpReplace($codAll,' ','%')
MsgBox(0, 'Замена', $codAll)
