SelectFiles(rootDir:="\\tv-fs1\data\OperationsJobs") {
	FileSelectFile, selFile, M 3, %rootDir%, Select file(s) to convert, Totco Files (*.las)
	if (!selFile)
		return
	selFiles := []
	for c, v in StrSplit(selFile, "`n") {
		if (A_Index = 1) {
			selDir := v
			continue
		}
		selFiles.Push(selDir "\" v)
	}
	return selFiles
}