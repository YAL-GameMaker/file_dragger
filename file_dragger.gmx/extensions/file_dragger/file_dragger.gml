#define file_drag_drop
/// (path, ...paths)->
for (var i = 0; i < argument_count; i++) {
    file_drag_drop_raw_0(argument[i]);
}
return file_drag_drop_raw_1(window_handle());

#define file_drag_drop_array
/// (path_array)->
var n = array_length(argument0);
for (var i = 0; i < n; i++) {
    file_drag_drop_raw_0(argument0[i]);
}
return file_drag_drop_raw_1(window_handle());
