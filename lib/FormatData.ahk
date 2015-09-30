FormatData(fPath, oDir:="") {
	fp := FilePath(fPath)
	oDir := oDir ? oDir : fp.dir
	if (!FileExist(oDir))
		FileCreateDir, %oDir%
	if (FileExist(oPath:=RegExReplace(oDir, "\\$") "\mod_" fp.name))
		FileDelete, %oPath%
	FileAppend, % DelimObj(GetColumns(fPath), "`t") "`r`n", %oPath%
	orig := FileOpen(fPath, "rw")
	while !RegExMatch(orig.ReadLine(), "^~ASCII DATA AREA")
		continue
	FileAppend, % orig.Read(), %oPath%
	orig.Close(), orig:=""
	return oPath
}