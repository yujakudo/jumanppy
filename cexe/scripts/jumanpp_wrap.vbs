' jumanpp wrapper
Set oShell = WScript.CreateObject("WScript.Shell")

args = ""
For i = 0 To WScript.Arguments.Count - 1
	args = args & " " & WScript.Arguments(i)
Next

Set Exec = oShell.Exec("jumanpp.exe " & args)
Set oStream = CreateObject("ADODB.Stream")

Do While 1
	line = WScript.Stdin.ReadLine
	If Trim(line) = "exit" Then Exit Do
	oExec.StdIn.Write line
	Do While 1
		line = oExec.StdOut.ReadLine
		WScript.Echo line
		if Trim(line) = "EOS" Then Exit Do
	Loop
Loop
