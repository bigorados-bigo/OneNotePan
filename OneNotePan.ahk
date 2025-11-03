#Requires AutoHotkey v2.0

; OneNotePan: hold middle mouse or XButton1 to pan, release to restore default tool.

#HotIf WinActive("ahk_exe ONENOTE.EXE") && MouseIsOverOneNote()

*MButton::StartPanning("MButton")
*XButton1::StartPanning("XButton1")

#HotIf

*MButton Up::StopPanning("MButton")
*XButton1 Up::StopPanning("XButton1")

global isPanning := false
global panButton := ""
global panMonitorInterval := 50
; global debugLogging := true
; global logFilePath := A_ScriptDir "\OneNotePan.log"

; DebugLog("OneNotePan script loaded")

StartPanning(button) {
    global isPanning
    global panButton
    if isPanning
        return

    isPanning := true
    panButton := button
    ; DebugLog("Start pan via " button)
    Send("!1")
    Sleep(10)    ; brief pause so OneNote switches tools reliably
    SendSyntheticLeft("Down")
    SetTimer(CheckPanContext, panMonitorInterval)
}

StopPanning(button := "") {
    global isPanning
    global panButton
    if !isPanning
        return

    isPanning := false
    SetTimer(CheckPanContext, 0)
    ; DebugLog("Stop pan request from " button)
    SendSyntheticLeft("Up")
    Sleep(10)    ; allow OneNote to register the release before resetting the tool
    Send("!2")
    panButton := ""
}

CheckPanContext() {
    global isPanning
    global panButton
    if !isPanning
        return

    if panButton && !GetKeyState(panButton, "P") {
        ; DebugLog("Timer saw " panButton " released")
        StopPanning("timer")
        return
    }

    if !WinActive("ahk_exe ONENOTE.EXE") {
        ; DebugLog("OneNote lost focus during pan")
        StopPanning("focus")
        return
    }
}

MouseIsOverOneNote() {
    MouseGetPos(,, &WindowUnderMouse)
    return WinGetProcessName("ahk_id " WindowUnderMouse) = "ONENOTE.EXE"
}

SendSyntheticLeft(state) {
    static flags := Map("Down", 0x0002, "Up", 0x0004) ; MOUSEEVENTF_LEFTDOWN/UP
    if !flags.Has(state)
        return
    DllCall("user32.dll\mouse_event", "UInt", flags[state], "UInt", 0, "UInt", 0, "UInt", 0, "UPtr", 0)
    ; DebugLog("Sent synthetic left " state)
}

/*
DebugLog(message) {
    global debugLogging
    global logFilePath
    if !debugLogging
        return
    stamp := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    line := stamp " | " message "`n"
    FileAppend(line, logFilePath, "UTF-8")
    OutputDebug("OneNotePan> " message)
}
*/

