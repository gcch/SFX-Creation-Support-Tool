Option Explicit 

' ======================================================================
'
' Run As Admin User by Non-Admin User
'
' Copyright (c) 2017 tag.
'
' [ ATTENTION! ]
' Leak your password possibly becase this script has it in plain text.
' Please scramble this script by using "VBScriptEncoder.vbs."
' But there is some possibility of leaking your password
' because this scramble is not perfect.
' Should not use this script if you feel anxious.
'
' Please put PsExec.exe (included in PsTools) at same directory
'   <https://technet.microsoft.com/ja-jp/sysinternals/pxexec.aspx>
'
' ======================================================================

If WScript.Arguments.Count <> 1 Then
	WScript.Echo("Usage: " & WScript.ScriptName & " <command>")
	WScript.Quit(1)
End If

' Arguments
Dim strTargetCommand : strTargetCommand = WScript.Arguments(0)

' Objects
Dim objShell : Set objShell = CreateObject("WScript.Shell")
Dim objFso : Set objFso = CreateObject("Scripting.FileSystemObject")

' PsExec
Dim strPsExecFile : strPsExecFile = "PsExec.exe"
If Not objFso.FileExists(strPsExecFile) Then
	WScript.Echo("Internal Error.")
	WScript.Quit(1)
End If

' User Info
Dim strUser : strUser = "Domain\Administrator"
Dim strPasswd : strPasswd = "P@ssw0rd"

' Run
Dim strCommand : strCommand = strPsExecFile & " -accepteula -nobanner -u """ & strUser & """ -p """ & strPasswd & """ " & strTargetCommand
objShell.Run strCommand, 0, false

' Finalize
Set objShell = Nothing