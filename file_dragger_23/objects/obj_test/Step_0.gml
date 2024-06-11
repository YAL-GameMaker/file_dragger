if (mouse_check_button_pressed(mb_left)) {
	if (1) {
		show_debug_message("Result: " + string(file_drag_drop_array(paths)));
	} else {
		show_debug_message("Result: " + string(file_drag_drop(paths[0])));
	}
}