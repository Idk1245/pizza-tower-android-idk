selected_option = 0
max_options = 2
prev_key_jump2 = 0
newstuff = 0
if(file_exists("newstuff.txt")){
	var file_buffer = buffer_load("newstuff.txt");
	textstring = buffer_read(file_buffer, buffer_string);
	buffer_delete(file_buffer);
} else {
	textstring = "newstuff.txt is missing."
}