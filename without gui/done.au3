#Include <Misc.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;~ ������ ������ ������ http://autoit-script.ru/autoit3_docs/libfunctions/_ispressed.htm
;~ ������ � ������ ������

;~ ������� ����������� ������ �� ����
;~ Opt("TrayMenuMode", 1)
;~ ��������� ��������� ������� �� ������� �� ������ � ����
Opt("TrayAutoPause", 0)


; �������� �� ������ ������ ���������� ����������
$p = ProcessList(StringReplace(@ScriptName,".au3",".exe"))
If $p[0][0] > 1 Then
    MsgBox(0,"��������", "���������� ��� ���������", 3)
    Exit
EndIf

;~ #Region GUI
;~ ��������� GUI � ������ ������ ���� ����
;~ $Form1 = WinSetOnTop(GUICreate("�������� ����", 283, 70, 1625, 934), "", 1)
;~ $Button_Start = GUICtrlCreateButton("���������", 104, 16, 75, 38)
;~ $Text_Status = GUICtrlCreateLabel("��������", 8, 25, 83, 24)
;~ GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
;~ GUICtrlSetColor(-1, 0xFF0000)
;~ $Button1 = GUICtrlCreateButton("����������", 192, 16, 75, 38)
;~ GUISetState(@SW_SHOW)
;~ #EndRegion GUI


;~ $button_About = TrayCreateItem("����������")
;~ $button_Setup = TrayCreateItem("���������")
While 1
	If _IsPressed(75) Then ;~ ������ �� ������� F6
		Do
	$temp = StringReplace(ClipGet ( ), "������.�� ��.", "%")
				$temp = StringReplace($temp, "������. �� ��.", "%")
				$temp = StringReplace($temp, "���������� ��.", "%")
				$temp = StringReplace($temp, "��� �� ������� ", "%")
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
				$temp = StringReplace($temp, "������.", "%")
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
				$temp = StringReplace($temp, "���.", "%")
				$temp = StringReplace($temp, "��.", "%")
				$temp = StringReplace($temp, "�.", "%")
				$temp = StringReplace($temp, "��.", "%")
				$temp = StringReplace($temp, "�/�", "%")
				$temp = StringReplace($temp, " �� ", "%")
				$temp = StringReplace($temp, "�.", "%")
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
	ClipPut ( $temp_Done )
	;~ 	��������� � GUI ������ ����������
;~ GUICtrlSetData($Label7, StringRegExpReplace(StringSplit(WinGetText("��� v.1.0.8.5"), ")",1)[1],'[^0-9]',''))
	Sleep(100)
	Until _IsPressed(76) <> 0 ;~ ���� �� ������� F7
EndIf
$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd