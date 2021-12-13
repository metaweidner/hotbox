/*
 ****************************************************************
 * HotBox.ahk                                                   *
 *                                                              *
 * Description: personal desktop management tool                *
 *                                                              *
 * Version History:                                             *
 * 1.0 December 2012                                            *
 * 1.1 January 2013: Added path variables & display             *
 * 1.2 February 2013: updated for TDNP_Microfilm                *
 * 1.3 March 2013: added search scripts, activate HotBox        *
 * 1.4 March 2014: updated for UH Libraries                     *
 * 1.5 August 2014: retooled for current use                    *
 * 1.6 November 2014: streamlined number of functions           *
 * 1.7 July 2015: removed cruft                                 *
 * 1.8 October 2015: updated network drive folder               *
 ****************************************************************
 */

#NoEnv
#persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

; ===========================================VARIABLES
firefoxpath = C:\Program Files (x86)\Mozilla Firefox\firefox.exe

; ContentDM Menu
CDMadminPath = http://digital.lib.uh.edu:81/cgi-bin/admin/home.exe
CDMhelpPath = http://contentdm.org/help6/server-admin/index.asp
CDMuserPath = http://www.contentdm.org/login/login_USC.asp


ReloadMessage = There are only two possible explanations: either no one told me, or no one knows.
;   Matrix Reloaded

ExitMessage = The end is important in all things.
;   Ghost Dog

TimecardMessage = Run and run to catch up with the sun.
;   Pink Floyd "Time"

SublimeMessage = With our thoughts we make the world.
;   Buddha

RubyMessage = Home.  I like to be here.  When I can.
;   Pink Floyd "Time"

StaffPortalMessage = Learn about all ways to find your own.

; working meditations
count = 1
quote1 = Pound on the sky. Listen to the sound.
;   Tron (sequel)
quote2 = Emptiness is form.    Form is emptiness.
;   Ghost Dog
; ===========================================VARIABLES


; initiate GUI
Gui,Color, c0c0c0, 912206
Gui, Show, h0 w0, HotBox


; ===========================================MENUS
; see MENU FUNCTIONS at end of file

; File menu
Menu, FileMenu, Add, &About, About
Menu, FileMenu, Add
Menu, FileMenu, Add, &Reload, Reload
Menu, FileMenu, Add, E&xit, Exit
Menu, FileMenu, Add
Menu, FileMenu, Add, &Log Off, LogOff

; MDS menu
Menu, MDSMenu, Add, &Outlook, Outlook
Menu, MDSMenu, Add
Menu, MDSMenu, Add, &Documents, Documents
Menu, MDSMenu, Add, &M: Drive, Mdrive
Menu, MDSMenu, Add
Menu, MDSMenu, Add, P:\Digital &Projects, PdriveDigital
Menu, MDSMenu, Add
Menu, MDSMenu, Add, O:\&MDS, OdriveMDS
Menu, MDSMenu, Add, O:\Digital &Projects, OdriveDigital
Menu, MDSMenu, Add, &X: Drive, Xdrive

; ContentDM menu
Menu, ContentDMMenu, Add, &Web Admin, CDMadmin
Menu, ContentDMMenu, Add, Online &Help, CDMhelp
Menu, ContentDMMenu, Add, &User Support, CDMuser

; Software menu
Menu, SoftwareMenu, Add, &Sublime, SublimeText
Menu, SoftwareMenu, Add, &Ruby, RubyShell
Menu, SoftwareMenu, Add
Menu, SoftwareMenu, Add, &brays, brays
Menu, SoftwareMenu, Add, &cdmeta, cdmeta
Menu, SoftwareMenu, Add, &AutoHotkey, AutoHotkey

; create menus
Menu, MenuBar, Add, &File, :FileMenu
Menu, MenuBar, Add, &MDS, :MDSMenu
Menu, MenuBar, Add, &CDM, :ContentDMMenu
Menu, MenuBar, Add, &Software, :SoftwareMenu

; create menu toolbar
Gui, Menu, MenuBar
; ===========================================MENUS


; format GUI
Gui, +AlwaysOnTop
Gui, Show, h32 w220, HotBox
winactivate, HotBox

; quote field
Gui, Add, Text, x20 y10 w190 h15, Pound on the sky. Listen to the sound.

; decorative box
Gui, Add, GroupBox, x2 y-5 w215 h35,       


; ===========================================SCRIPTS
; =================Activate HotBox
^!h::
	SetTitleMatchMode 1
	WinWait, HotBox, , , ,
	IfWinNotActive, HotBox, , , ,
	WinActivate, HotBox, , , ,
	WinWaitActive, HotBox, , , ,
Return
; =================Activate HotBox

; ===========================================SCRIPTS


; ===========================================MENU FUNCTIONS
; =================FILE
; display version info
About:
MsgBox HotBox.ahk`nVersion 1.7`najweidner@uh.edu
Return

; reload application
Reload:
MsgBox, %ReloadMessage%
Reload

; exit application
Exit:
MsgBox, %ExitMessage%
ExitApp

; log off system
LogOff:
Shutdown, 0
Return
; =================FILE


; =================MDS
Outlook:
Run, "C:\Program Files\Microsoft Office\Office15\OUTLOOK.EXE"
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

Documents:
Run, C:\Users\weidnera\Documents
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

Mdrive:
Run, M:\
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

OdriveMDS:
Run, "O:\Metadata and Digitization Services"
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

OdriveDigital:
Run, "O:\Digital Projects"
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

Xdrive:
Run, X:\
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return
; =================MDS

; =================ContentDM
CDMadmin:
Run, %CDMadminPath%
Sleep, 500
SetTitleMatchMode 2
IfWinActive, Untitled
{
	Send, {Enter}
}
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

CDMhelp:
Run, %CDMhelpPath%
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

CDMuser:
Run, %CDMuserPath%
SetTitleMatchMode 2
WinWaitActive, Log In,, 3
IfWinActive, Log In
{
	Sleep, 200
	Send, {TAB 10}
	Send, {Enter}
}
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return
; =================ContentDM

; =================Software
SublimeText:
Run, "M:\Software\Sublime Text Build 3059 x64\sublime_text.exe"
	ControlSetText, Static1, %SublimeMessage%, HotBox
Return

RubyShell:
Run, "C:\Bitnami\rubystack-2.0.0-23\use_ruby.bat"
	ControlSetText, Static1, %RubyMessage%, HotBox
Return

AutoHotkey:
	Run, "O:\Metadata and Digitization Services\Metadata\Software\AutoHotkey"
	count++
	if Mod(count, 2)=0 {    
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

brays:
Run, "C:\Bitnami\rubystack-2.0.0-23\use_ruby.bat"
	ControlSetText, Static1, %RubyMessage%, HotBox
	WinWaitActive, Bitnami Ruby Stack Environment
	Send, cd c:\Users\weidnera\Documents\GitHub\brays
	Send, {Enter}
Return

cdmeta:
Run, "C:\Bitnami\rubystack-2.0.0-23\use_ruby.bat"
	ControlSetText, Static1, %RubyMessage%, HotBox
	WinWaitActive, Bitnami Ruby Stack Environment
	Send, cd c:\Users\weidnera\Documents\GitHub\cdmeta\cdmeta
	Send, {Enter}
Return

; =================Software
; ===========================================MENU FUNCTIONS

GuiClose:
ExitApp