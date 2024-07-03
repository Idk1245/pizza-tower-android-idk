var playerid = obj_player1
if (obj_player1.spotlight == 0)
	playerid = obj_player2
if (image_alpha == 1)
{
	var dir = point_direction(x, y, playerid.x, playerid.y)
	x += lengthdir_x(maxspeed, dir)
	y += lengthdir_y(maxspeed, dir)
}
else
	image_alpha += 0.01
if (place_meeting(x, y, playerid) && (!playerid.cutscene) && playerid.state != states.actor && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && image_alpha == 1)
{
	if instance_exists(obj_toppinwarrior)
	{
		if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
			instance_destroy(global.toppinwarriorid1)
		else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
			instance_destroy(global.toppinwarriorid2)
		else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
			instance_destroy(global.toppinwarriorid3)
		else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
			instance_destroy(global.toppinwarriorid4)
		else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
			instance_destroy(global.toppinwarriorid5)
		instance_create(x, y, obj_flash)
		global.panic = true
		global.fill = 59 * 12
		with(obj_tv){
			pizzaface_sprite = spr_timer_pizzaface1
			chunkmax = global.fill
		}
		obj_camera.alarm[1] = 60
		obj_camera.ded = 0
		instance_destroy()
	}
	else if (!instance_exists(obj_toppinwarrior))
	{
		with (playerid)
		{
			instance_destroy(obj_fadeout)
			targetDoor = "A"
			room = timesuproom
			state = states.timesup
			sprite_index = spr_Timesup
			image_index = 0
			audio_stop_all()
			if (global.oldsprites == true) {
				scr_soundeffect(mu_timesup)
			} else {
				scr_soundeffect(mu_Your_Fat_Ass_Slows_You_Down)
			}
		}
	}
	instance_destroy()
}
if (maxspeed < 3 && image_alpha == 1)
	maxspeed += 0.01
