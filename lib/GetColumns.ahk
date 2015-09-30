GetColumns(fPath) {
	orig := FileOpen(fPath, "rw")
	while !RegExMatch(orig.ReadLine(), "^~CURVE INFORMATION")
		continue
	col := []
	while, RegExMatch(orig.ReadLine(), ":\s+\d+\s+\.\s+(.+?)\s*$", m)
		col.Push(m1)
	orig.Close(), orig:=""
	return col
}