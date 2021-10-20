/// @description 
draw_set_font(Font1);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(20, room_height-50, global.print_message);
draw_text(20, 20, "state: "+string(state));