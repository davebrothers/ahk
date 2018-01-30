#Include %A_ScriptDir%

; backtick => backspace
;$`::Backspace
;$+`::send {~}
;$^`::send ``

::scripthome::~\Documents\WindowsPowerShell\Scripts
::pshome::~\Documents\WindowsPowerShell\

; window stuff
#z::
IDMonitors()
;SysGet, Mons, MonitorCount
;MsgBox, %Mons%

IDMonitors(disptime=1500,txtcolor="000000",txtsize=300)
{
SysGet, MonNum, MonitorCount
TPColor = AABBCC
GuiNum = 50
Loop %MonNum%
{
	SysGet, Mon%A_Index%, Monitor, %A_Index%
	x := Mon%A_Index%Left
	Gui, %GuiNum%:+LastFound +AlwaysOnTop -Caption +ToolWindow
	Gui, %GuiNum%:Color, %TPColor%
	WinSet, TransColor, %TPColor%
	Gui, %GuiNum%:Font, s%txtsize% w700
	Gui, %GuiNum%:Add, Text, x0 y0 c%txtcolor%, %A_Index%
	Gui, %GuiNum%:Show, x%x% y0 NoActivate
	GuiNum++
}
Sleep, %disptime%
GuiNum = 50
Loop %MonNum%
{
	Gui, %GuiNum%:Destroy
	GuiNum++
}
}