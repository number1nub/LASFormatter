#NoEnv
#SingleInstance, Off
SetWorkingDir, %A_ScriptDir%

fList  := []
oFiles := []

if (%false%) {
	Loop, % %false%
		if (FileExist(%A_Index%))
			fList.Push(%A_Index%)
}
else
	fList := SelectFiles()
if (!fList.MaxIndex()) {
	m("Invalid or undefined file(s).", "ico:!")
	ExitApp
}

for c, v in fList
	oFiles.Push(FormatData(v))

if (m("Done! " oFiles.MaxIndex() " files converted.", "", "Open output folder?", "ico:?", "btn:yn")="YES")
	Run, % "explorer.exe /select,""" oFiles[1] """"
ExitApp


#Include <DelimObj>
#Include <FilePath>
#Include <FormatData>
#Include <GetColumns>
#Include <m>
#Include <SelectFiles>