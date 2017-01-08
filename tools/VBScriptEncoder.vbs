Option Explicit 

' ======================================================================
'
' VBScript Encoder
'
' Copyright (c) 2017 tag.
'
' ======================================================================

If WScript.Arguments.Count <> 2 Then
	WScript.Echo("Usage: " & WScript.ScriptName & " <input.vbs> <output.vbe>")
	WScript.Quit(1)
End If

' Arguments
Dim strSrcFile : strSrcFile = WScript.Arguments(0)	' vbs file
Dim strDstFile : strDstFile = WScript.Arguments(1)	' vbe file

' Objects
Dim objFso : Set objFso = CreateObject("Scripting.FileSystemObject")
Dim objEncoder : Set objEncoder = CreateObject("Scripting.Encoder")

' Input
Dim objSrcFile : Set objSrcFile = objFso.GetFile(strSrcFile)
Dim objStream : Set objStream = objSrcFile.OpenAsTextStream(1)
Dim strScript : strScript = objStream.ReadAll
objStream.Close
Set objStream = Nothing

' Encode
Dim strEncodedScript : strEncodedScript = objEncoder.EncodeScriptFile(".vbs", strScript, 0, "")

' Output
Dim objDstFile : Set objDstFile = objFso.CreateTextFile(strDstFile)
objDstFile.Write(strEncodedScript)
objDstFile.Close
Set objDstFile = Nothing

' Finalize
Set objFso = Nothing
Set objEncoder = Nothing
