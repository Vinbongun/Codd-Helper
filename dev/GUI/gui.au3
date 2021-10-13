#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

;~ ��� �������� ���������� ��������� ������������ ����
OnAutoItExitRegister("saveSettings")
#NoTrayIcon

;~ ��������� ��������� ������� �� ������� �� ������ � ����
Opt("TrayAutoPause", 0)

; �������� �� ������ ������ ���������� ����������
$p = ProcessList(StringReplace(@ScriptName,".au3",".exe"))
If $p[0][0] > 1 Then
    MsgBox(0,"��������", "���������� ��� ���������", 3)
    Exit
EndIf

$sPathToIni = 'C:\���\cod-helper\config.ini'

$X = IniRead($sPathToIni, 'POS', 'X', -1)
$Y = IniRead($sPathToIni, 'POS', 'Y', -1)
$isChecked = IniRead($sPathToIni, 'Settings', 'setOnTop', -1)


Global $semafore = False

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("�������� ���", 149, 130, $X, $Y, $GUI_SS_DEFAULT_GUI - $WS_MINIMIZEBOX)
$Label1 = GUICtrlCreateLabel("�������� ���", 32, 24, 95, 17)
$StartStop = GUICtrlCreateButton("��������", 40, 72, 75, 25)
$Label2 = GUICtrlCreateLabel("������:", 40, 48, 41, 17)
$nCheckBox = GUICtrlCreateCheckbox('������ ����', 35, 105, 100, 20)
$Status = GUICtrlCreateLabel("����", 88, 48, 30, 17)
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
				GUICtrlSetData($StartStop,'��������')
				GUICtrlSetColor(-1, 0xFF0000)
			Else
				$semafore = True
				GUICtrlSetData($StartStop,'���������')
				GUICtrlSetColor(-1, 0x008000)
			EndIf

;~ 			������ ���� ����
		Case $nCheckBox or $isChecked = 1
			WinSetOnTop($Form1, '', BitAND(GUICtrlRead($nCheckBox), $GUI_CHECKED))
		EndSwitch

		If $semafore Then
			$edit = ControlGetText("�������", "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:1]")
			$temp = StringRegExpReplace($edit, "\x22", "")
			$temp = StringReplace($temp, "������. �� ��.", "%")
			$temp = StringReplace($temp, "���������� ��.", "%")
			$temp = StringReplace($temp, "��� �� ������� ", "%")
			$temp = StringReplace($temp, "��������� ", "%")
			$temp = StringReplace($temp, "����������", "%")
			$temp = StringReplace($temp, "���������", "%")
			$temp = StringReplace($temp, "������.��", "%")
			$temp = StringReplace($temp, "������.", "%")
			$temp = StringReplace($temp, " ������� ", "%")
			$temp = StringReplace($temp, "��������", "%")
			$temp = StringReplace($temp, "���. ��", "%")
			$temp = StringReplace($temp, " � ���.", "%")
			$temp = StringReplace($temp, "� ���.", "%")
			$temp = StringReplace($temp, "��� �� ��.", "%")
			$temp = StringReplace($temp, "����� ", "%")
			$temp = StringReplace($temp, "������� ", "%")
			$temp = StringReplace($temp, "�� ��.", "%")
			$temp = StringReplace($temp, "��.", "%")
			$temp = StringReplace($temp, "�� ", "%")
			$temp = StringReplace($temp, "������.", "%")
			$temp = StringReplace($temp, " ������ ", "%")
			$temp = StringReplace($temp, "������� ", "%")
			$temp = StringReplace($temp, "� ��.", "%")
			$temp = StringReplace($temp, "������ ���.", "%")
			$temp = StringReplace($temp, "������", "%")
			$temp = StringReplace($temp, "���.", "%")
			$temp = StringReplace($temp, "���.", "%")
			$temp = StringReplace($temp, "�/�", "%")
			$temp = StringReplace($temp, "�.�", "%")
			$temp = StringReplace($temp, "�.��", "%")
			$temp = StringReplace($temp, "����� ", "%")
			$temp = StringReplace($temp, "���.", "%")
			$temp = StringReplace($temp, "���", "%")
			$temp = StringReplace($temp, "���.", "%")
			$temp = StringReplace($temp, "��-�", "%")
			$temp = StringReplace($temp, "��,", "%")
			$temp = StringReplace($temp, "�-�", "%")
			$temp = StringReplace($temp, "��.", "%")
			$temp = StringReplace($temp, " �� ", "%")
			$temp = StringReplace($temp, "�.", "%")
			$temp = StringReplace($temp, " � ", "%")
			$temp = StringReplace($temp, " ��� ", "%")
			$temp = StringReplace($temp, " ���.", "%")
			$temp = StringReplace($temp, " ���.", "%")
			$temp = StringReplace($temp, " ��.", "%")
			$temp = StringReplace($temp, "�.", "%")
			$temp = StringReplace($temp, "��.", "%")
			$temp = StringReplace($temp, "�/�", "%")
			$temp = StringReplace($temp, " �� ", "%")
			$temp = StringReplace($temp, "�.", "%")
			$temp = StringReplace($temp, " �.", "%")
			$temp = StringReplace($temp, "�", "%")
			$temp = StringReplace($temp, ".", "%")
			$temp = StringReplace($temp, ",", "%")
			$temp = StringReplace($temp, '"', "%")
			$temp = StringReplace($temp, "/", "%")
			$temp = StringReplace($temp, "�", "%")
			$temp = StringReplace($temp, "�", "%")
			$temp = StringReplace($temp, "'", "%")
			$temp = StringReplace($temp, " ", "%")
			$temp = StringReplace($temp, "%%", "%")
			$temp_Done = StringReplace($temp, "%%%", "%")

			If ControlGetText("�������� ���", "", $Status)  <> '���.' Then
				GUICtrlSetData($Status,'���.')
				GUICtrlSetColor($Status, 0x008000)
				ConsoleWrite ( 'On' & @CRLF)
			EndIf

			;~ �������� ������, ���� �������� �� ���������
			If $temp_Done <> $edit Then
			    ControlSetText("�������", "", "[CLASS:WindowsForms10.EDIT.app.0.13965fa_r9_ad1; INSTANCE:1]", $temp_Done)
			EndIf

		Else
			If ControlGetText("�������� ���", "", $Status)  <> '����.' Then
				GUICtrlSetData($Status,'����.')
				GUICtrlSetColor(-1, 0xFF0000)
				ConsoleWrite ( 'Off' & @CRLF)
			EndIf


		EndIf

WEnd

Func saveSettings()
	$aWinPos = WinGetPos($Form1)
	DirCreate('C:\���\cod-helper\')
	IniWrite($sPathToIni, 'POS', 'X', $aWinPos[0])
	IniWrite($sPathToIni, 'POS', 'Y', $aWinPos[1])
	IniWrite($sPathToIni, 'Settings', 'setOnTop', GUICtrlRead($nCheckBox))
	Exit
EndFunc

