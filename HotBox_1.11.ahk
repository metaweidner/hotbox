/*
HotBox.ahk
Description: personal desktop management tool

Version History:
1.0 December 2012
1.1 January 2013: Added path variables & display
1.2 February 2013: updated for TDNP_Microfilm
1.3 March 2013: added search scripts, activate HotBox
1.4 March 2014: updated for UH Libraries
1.5 August 2014: retooled for current use
1.6 November 2014: streamlined number of functions
1.7 July 2015: removed cruft
1.8 October 2015: updated network drive folder
1.9 October 2016: update applications, menus, and drives
1.10 November 2017: update network drives, add node.js
*/

#NoEnv
#persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

; ===========================================VARIABLES
firefoxpath = C:\Program Files (x86)\Mozilla Firefox\firefox.exe

; BCDAMS Menu
UHLDLgithubPath = https://github.com/uhlibraries-digital
B2HgithubPath = https://github.com/bridge2hyku
BCDAMSwikiPath = http://lws.lib.uh.edu/wiki/mbs/index.php/Main/BayouCityDAMS
DAMSTFbasecampPath = https://basecamp.com/2547302/projects/6129405
DAMSTFintranetPath = http://intranet.lib.uh.edu/damstf

; MDS Menu
CDMadminPath = http://digital.lib.uh.edu:81/cgi-bin/admin/home.exe


ReloadMessage = There are only two possible explanations: either no one told me, or no one knows.
;   Matrix Reloaded

ExitMessage = The end is important in all things.
;   Ghost Dog

EditMessage = With our thoughts we make the world.
;   Buddha

DevMessage = Home.  I like to be here.  When I can.
;   Pink Floyd "Time"

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
Menu, FileMenu, Add, &Log Off, LogOff
Menu, FileMenu, Add
Menu, FileMenu, Add, &Reload, Reload
Menu, FileMenu, Add, E&xit, Exit
Menu, FileMenu, Add
Menu, FileMenu, Add, &About, About

; MDS menu
Menu, MDSMenu, Add, &Documents, Documents
Menu, MDSMenu, Add, &M: Drive, Mdrive
Menu, MDSMenu, Add
Menu, MDSMenu, Add, &P:\Digital Projects, PdriveDigital
Menu, MDSMenu, Add, &O:\Digital Projects, OdriveDigital
Menu, MDSMenu, Add, &CDM Web Admin, CDMadmin
Menu, MDSMenu, Add
Menu, MDSMenu, Add, O:\MD&S, OdriveMDS
Menu, MDSMenu, Add, O:\DAMS Taskforce, OdriveDAMSTF


; BCDAMS menu
Menu, BCDAMSMenu, Add, &UHL-DL Github, UHLDLgithub
Menu, BCDAMSMenu, Add, &B2H Github, B2Hgithub
Menu, BCDAMSMenu, Add
Menu, BCDAMSMenu, Add, BCDAMS &Wiki, BCDAMSwiki
Menu, BCDAMSMenu, Add, &DAMSTF Basecamp, DAMSTFbasecamp
Menu, BCDAMSMenu, Add, DAMSTF &Intranet, DAMSTFintranet

; Software menu
Menu, SoftwareMenu, Add, &Sublime, SublimeText
Menu, SoftwareMenu, Add, &Atom, Atom
Menu, SoftwareMenu, Add
Menu, SoftwareMenu, Add, Github &Desktop, GithubDesktop
Menu, SoftwareMenu, Add, Software &Folder, SoftwareFolder
Menu, SoftwareMenu, Add
Menu, SoftwareMenu, Add, &Ruby Shell, RubyGithub
Menu, SoftwareMenu, Add, &Node.js Shell, NodeGithub
Menu, SoftwareMenu, Add
Menu, SoftwareMenu, Add, &Telegram, Telegram

; create menus
Menu, MenuBar, Add, &File, :FileMenu
Menu, MenuBar, Add, &MDS, :MDSMenu
Menu, MenuBar, Add, &BCDAMS, :BCDAMSMenu
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
MsgBox HotBox.ahk`nVersion 1.10`najweidner@uh.edu
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

PdriveDigital:
Run, "P:\DigitalProjects"
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

OdriveMDS:
Run, "O:\Metadata and Digitization Services"
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

OdriveDAMSTF:
Run, "O:\DAMS Taskforce"
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

; =================MDS


; =================BCDAMS
UHLDLgithub:
Run, %UHLDLgithubPath%
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

B2Hgithub:
Run, %B2HgithubPath%
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

BCDAMSwiki:
Run, %BCDAMSwikiPath%
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

DAMSTFbasecamp:
Run, %DAMSTFbasecampPath%
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

DAMSTFintranet:
Run, %DAMSTFintranetPath%
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return
; =================BCDAMS

; =================Software
SublimeText:
	Run, "M:\Software\Sublime Text Build 3059 x64\sublime_text.exe"
	ControlSetText, Static1, %EditMessage%, HotBox
Return

Atom:
	Run, "C:\Users\weidnera\AppData\Local\atom\atom.exe"
	ControlSetText, Static1, %EditMessage%, HotBox
Return

SoftwareFolder:
	Run, M:\Software
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

GithubDesktop:
	Run, "C:\Users\weidnera\AppData\Local\GitHubDesktop\GitHubDesktop.exe"
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return

RubyGithub:
Run, "C:\Bitnami\rubystack-2.3.7-1\use_ruby.bat"
	ControlSetText, Static1, %DevMessage%, HotBox
	WinWaitActive, Bitnami Ruby Stack Environment
	Send, m:
	Send, {Enter}
	Send, cd Software
	Send, {Enter}
Return

NodeGithub:
Run, "C:\Windows\System32\cmd.exe"
	ControlSetText, Static1, %DevMessage%, HotBox
	WinWaitActive, C:\Windows\System32\cmd.exe
	Send, c:
	Send, {Enter}
	Send, cd \Program Files\nodejs
	Send, {Enter}
	Send, nodevars
	Send, {Enter}
	Send, c:
	Send, {Enter}
	Send, cd \Users\weidnera\Documents\GitHub
	Send, {Enter}
Return

Telegram:
	Run, "M:\tportable.0.10.11\Telegram\Telegram.exe"
	count++
	if Mod(count, 2)=0 {
		ControlSetText, Static1, %quote2%, HotBox
	} else ControlSetText, Static1, %quote1%, HotBox
Return
; =================Software
; ===========================================MENU FUNCTIONS

GuiClose:
ExitApp
