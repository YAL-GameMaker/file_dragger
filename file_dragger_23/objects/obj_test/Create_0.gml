fnames = ["test1.txt", "test2.txt"];
paths = [];
var n = array_length(fnames);
for (var i = 0; i < n; i++) {
	var _fname = fnames[i];
	var _file = file_text_open_write(_fname);
	file_text_write_string(_file, "This is " + _fname);
	file_text_close(_file);
	paths[i] = game_save_id + _fname;
}
