DelimObj(obj, delim) {
	if (!IsObject(obj))
		return obj
	for c, v in obj
		delimStr .= (delimStr ? delim : "") v
	return delimStr
}