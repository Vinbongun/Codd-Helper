While 1
;~ РєРѕРїРёСЂСѓРµС‚
$Done = ControlGetText("Р“СЂР°С„РёС‡РµСЃРєРѕРµ СЃРѕРїРѕСЃС‚Р°РІР»РµРЅРёРµ", "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:8]")

;~ РІСЃС‚Р°РІР»СЏРµС‚
$hWin = WinGetHandle("Р“СЂР°С„РёС‡РµСЃРєРѕРµ СЃРѕРїРѕСЃС‚Р°РІР»РµРЅРёРµ")
ControlSetText($hWin, "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:14]", $Done)

Sleep(500)

WEnd