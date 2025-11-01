#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_exe ONENOTE.EXE") && MouseIsOverOneNote()     ;   Check if onenote window is active AND mouse is over OneNote

*MButton::{
    Send("!1")             ;   Alt+1 for pan tool
    sleep(10)              ;   sleep briefly for stability
    Send("{LButton Down}") ;   Left button down to activate pan tool and grab page
}

*MButton Up::{      ;When Middle Mouse released - return to normal operations
   
    Send("{LButton Up}")
    
    Send("!2")                              ;   Alt+2 for default mouse tool
    WinActivate("ahk_class Shell_TrayWnd")  ; activate the taskbar to steal focus from OneNote
    WinActivate("ahk_exe ONENOTE.EXE")      ;   reactive onenote window
}


*XButton1::{
    Send("!1")             ;   Alt+1 for pan tool
    sleep(10)              ;   sleep briefly for stability
    Send("{LButton Down}") ;   Left button down to activate pan tool and grab page
}

*XButton1 Up::{      ;When Middle Mouse released - return to normal operations
   
    Send("{LButton Up}")
    
    Send("!2")                              ;   Alt+2 for default mouse tool
    WinActivate("ahk_class Shell_TrayWnd")  ; activate the taskbar to steal focus from OneNote
    WinActivate("ahk_exe ONENOTE.EXE")      ;   reactive onenote window
}

#HotIf

; Function to check if mouse cursor is over a OneNote window
MouseIsOverOneNote() {
    MouseGetPos(,, &WindowUnderMouse)
    return WinGetProcessName("ahk_id " WindowUnderMouse) = "ONENOTE.EXE"
}

