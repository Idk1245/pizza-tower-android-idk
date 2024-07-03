draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(global.bigfont)

var _levelinfo = level_array[selected_world][selected_level]
draw_text(480, 270, concat(world_array[selected_world], "\n", selected_level + 1, ". ", _levelinfo[0]))

var xx = 405
var yy = 380
var c = c_white
ini_open_from_string(obj_savesystem.ini_str)
draw_text(480, yy - 38, ini_read_real("Highscore", _levelinfo[2], 0))

for (var i = 0; i < array_length(toppin_info); i++)
{
	var b = toppin_info[i]
	var ix = b[0]
	if !ini_read_real("Toppin", concat(_levelinfo[2], i + 1), 0)
	{
		c = c_black
		ix = 0
	}
	else
		c = c_white
	draw_sprite_ext(b[1], ix, xx + (i * 47), yy, 1, 1, 0, c, 1)
}

if _levelinfo[1] != war_1
{
	if !ini_read_real("Treasure", _levelinfo[2], 0)
		c = c_black
	else
		c = c_white
	draw_sprite_ext(spr_treasure_eggplant, 0, 637, (yy + 26), 1, 1, 0, c, 1)
}
var rank = ini_read_string("Ranks", _levelinfo[2], 0)
switch(rank){
	case "p":
		draw_sprite_ext(spr_ranks_hud, 5, 351, (yy + 26), 1, 1, 0, c_white, 1)
	break
	case "s":
		draw_sprite_ext(spr_ranks_hud, 4, 351, (yy + 26), 1, 1, 0, c_white, 1)
	break
	case "a":
		draw_sprite_ext(spr_ranks_hud, 3, 351, (yy + 26), 1, 1, 0, c_white, 1)
	break
	case "b":
		draw_sprite_ext(spr_ranks_hud, 2, 351, (yy + 26), 1, 1, 0, c_white, 1)
	break
	case "c":
		draw_sprite_ext(spr_ranks_hud, 1, 351, (yy + 26), 1, 1, 0, c_white, 1)
	break
	case "d":
		draw_sprite_ext(spr_ranks_hud, 0, 351, (yy + 26), 1, 1, 0, c_white, 1)
	break
	default:
		draw_sprite_ext(spr_ranks_hud, 0, 351, (yy + 26), 1, 1, 0, c_black, 1)
	break
}


draw_set_font(global.smallfont)
var sf = ini_read_real("Secret", _levelinfo[2], 0)
if _levelinfo[1] != war_1
	draw_text_color(480, (yy + 88), concat(sf, " OUT OF 3 SECRETS"), c_white, c_white, c_white, c_white, 1)
ini_close()
draw_set_halign(fa_left)
draw_set_valign(fa_top)
