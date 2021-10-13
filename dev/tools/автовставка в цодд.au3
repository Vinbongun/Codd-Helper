While 1
;~ копирует
$Done = ControlGetText("Графическое сопоставление", "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:8]")

;~ вставляет
$hWin = WinGetHandle("Графическое сопоставление")
ControlSetText($hWin, "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:14]", $Done)

Sleep(500)

WEnd