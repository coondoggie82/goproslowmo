;Autohotkeys program for running slow motion in GoPro Quik. 
;Basically just presses the 'k' key at a specified interval.
;Use: 
;SPACE - toggle slow motion on/off
;UP - speed up slow motion rate by 50ms (default is 250)
;DOWN - slow down slow motion rate by 50ms
;ESC - exit program

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

steprate := 250
paused := 1

#Persistent
SetTimer StepFWD, Off
return

StepFWD:
Send, k
return

StepBack:
Send, j
return

Up::
steprate = % steprate-50
SetTimer StepFWD, % steprate
return

Down::
steprate = % steprate+50
SetTimer StepFWD, % steprate
return

Space::
if(paused > 0){
	SetTimer StepFWD, % steprate
        paused = 0
}else{
	SetTimer StepFWD, Off
	paused = 1
}
return

Esc::
ExitApp
return