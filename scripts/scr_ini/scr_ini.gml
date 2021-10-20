// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ini(){
	
	// Set window size of app
	window_set_size(browser_width, browser_height);
	window_set_position(0, 0);

	// Initialize variables
	global.print_message="";
	global.user_address="0";

	

}

function print(msg) {
	global.print_message += "\n"+string(msg);
	//show_debug_message(global.print_message)
}
