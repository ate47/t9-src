#using script_3f9e0dc8454d98e1;
#using script_5660bae5b402a1eb;
#using script_5bb072c3abf4652c;
#using script_6e3c826b1814cab6;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_powerup_fire_sale;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_fire_sale
	Checksum: 0xB5C8A49D
	Offset: 0x198
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_fire_sale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_fire_sale
	Checksum: 0x328AD085
	Offset: 0x1E0
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("fire_sale", &grab_fire_sale);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("fire_sale", #"p7_zm_power_up_firesale", #"hash_2c7bc0fa0980f8f5", &func_should_drop_fire_sale, 0, 0, 0, undefined, "powerup_fire_sale", "zombie_powerup_fire_sale_time", "zombie_powerup_fire_sale_on");
	}
}

/*
	Name: grab_fire_sale
	Namespace: zm_powerup_fire_sale
	Checksum: 0xB25266AE
	Offset: 0x290
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function grab_fire_sale(player)
{
	if(zm_powerups::function_cfd04802("fire_sale"))
	{
		level thread function_3ceac0e1(self, player);
	}
	else
	{
		level thread start_fire_sale(self);
	}
	player thread zm_powerups::powerup_vo("firesale");
}

/*
	Name: function_3ceac0e1
	Namespace: zm_powerup_fire_sale
	Checksum: 0xA54EDB6F
	Offset: 0x320
	Size: 0x14C
	Parameters: 2
	Flags: Linked
*/
function function_3ceac0e1(var_7d81025, player)
{
	self notify("4e8ac3aa35304135");
	self endon("4e8ac3aa35304135");
	player endon(#"disconnect");
	player thread zm_powerups::function_5091b029("fire_sale");
	if(isdefined(player) && isplayer(player) && isdefined(var_7d81025.hint))
	{
		player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", var_7d81025.hint);
	}
	player zombie_utility::function_826f5e98(#"zombie_powerup_fire_sale_on", 1);
	player zombie_utility::function_826f5e98(#"zombie_powerup_fire_sale_time", 30);
	level waittilltimeout(30, #"end_game");
	player zombie_utility::function_826f5e98(#"zombie_powerup_fire_sale_on", 0);
}

/*
	Name: start_fire_sale
	Namespace: zm_powerup_fire_sale
	Checksum: 0xB7C6F6C9
	Offset: 0x478
	Size: 0x3A8
	Parameters: 1
	Flags: Linked
*/
function start_fire_sale(item)
{
	if(is_true(level.custom_firesale_box_leave))
	{
		while(firesale_chest_is_leaving())
		{
			waitframe(1);
		}
	}
	if(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_time") > 0 && is_true(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on")))
	{
		zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_time") + 30);
		return;
	}
	level notify(#"powerup_fire_sale");
	level endon(#"powerup_fire_sale");
	zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", 1);
	level.disable_firesale_drop = 1;
	level thread toggle_fire_sale_on();
	players = getplayers();
	foreach(e_player in players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(item.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", item.hint);
		}
	}
	zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", 30);
	level notify(#"hash_7a941ba8e576862e");
	if(bgb::is_team_enabled(#"zm_bgb_temporal_gift"))
	{
		zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_time") + 30);
	}
	while(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_time") > 0)
	{
		waitframe(1);
		zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_time") - 0.05);
	}
	level thread check_to_clear_fire_sale();
	zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", 0);
	level notify(#"fire_sale_off");
}

/*
	Name: check_to_clear_fire_sale
	Namespace: zm_powerup_fire_sale
	Checksum: 0x5702D1CC
	Offset: 0x828
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function check_to_clear_fire_sale()
{
	level endon(#"powerup_fire_sale");
	while(firesale_chest_is_leaving())
	{
		waitframe(1);
	}
	wait(1);
	level.disable_firesale_drop = undefined;
}

/*
	Name: firesale_chest_is_leaving
	Namespace: zm_powerup_fire_sale
	Checksum: 0xA8738D0E
	Offset: 0x880
	Size: 0xFA
	Parameters: 0
	Flags: Linked
*/
function firesale_chest_is_leaving()
{
	for(i = 0; i < level.chests.size; i++)
	{
		if(i !== level.chest_index)
		{
			if(level.chests[i].zbarrier.state === "leaving" || level.chests[i].zbarrier.state === "open" || level.chests[i].zbarrier.state === "close" || level.chests[i].zbarrier.state === "closing")
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: toggle_fire_sale_on
	Namespace: zm_powerup_fire_sale
	Checksum: 0x9FE7149F
	Offset: 0x988
	Size: 0x29A
	Parameters: 0
	Flags: Linked
*/
function toggle_fire_sale_on()
{
	level endon(#"powerup_fire_sale");
	if(!isdefined(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on")))
	{
		return;
	}
	if(!isdefined(level.chest_index))
	{
		level.chest_index = 0;
	}
	level thread sndfiresalemusic_start();
	for(i = 0; i < level.chests.size; i++)
	{
		show_firesale_box = level.chests[i] [[level._zombiemode_check_firesale_loc_valid_func]]();
		if(show_firesale_box)
		{
			level.chests[i].zombie_cost = 10;
			if(level.chest_index != i)
			{
				if(namespace_59ff1d6c::function_901b751c(#"hash_4e0ec3fe56f08b47") != 3)
				{
					level.chests[i].was_temp = 1;
				}
				if(is_true(level.chests[i].hidden))
				{
					level.chests[i] thread apply_fire_sale_to_chest();
				}
			}
		}
	}
	level notify(#"fire_sale_on");
	level waittill(#"fire_sale_off");
	waittillframeend();
	level thread sndfiresalemusic_stop();
	for(i = 0; i < level.chests.size; i++)
	{
		show_firesale_box = level.chests[i] [[level._zombiemode_check_firesale_loc_valid_func]]();
		if(show_firesale_box)
		{
			if(level.chest_index != i && isdefined(level.chests[i].was_temp))
			{
				level.chests[i].was_temp = undefined;
				level thread remove_temp_chest(i);
			}
			level.chests[i].zombie_cost = level.chests[i].old_cost;
		}
	}
}

/*
	Name: apply_fire_sale_to_chest
	Namespace: zm_powerup_fire_sale
	Checksum: 0xE4641919
	Offset: 0xC30
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function apply_fire_sale_to_chest()
{
	level endon(#"fire_sale_off");
	if(self.zbarrier.state == "leaving")
	{
		self.zbarrier waittilltimeout(10, #"left");
	}
	wait(0.1);
	self thread zm_magicbox::show_chest();
}

/*
	Name: remove_temp_chest
	Namespace: zm_powerup_fire_sale
	Checksum: 0xE484B04
	Offset: 0xCB0
	Size: 0x246
	Parameters: 1
	Flags: Linked
*/
function remove_temp_chest(chest_index)
{
	if(!isdefined(level.chests[chest_index]))
	{
		return;
	}
	level.chests[chest_index].being_removed = 1;
	while(isdefined(level.chests[chest_index]) && (isdefined(level.chests[chest_index].chest_user) || (isdefined(level.chests[chest_index]._box_open) && level.chests[chest_index]._box_open == 1)))
	{
		util::wait_network_frame();
	}
	if(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on"))
	{
		level.chests[chest_index].was_temp = 1;
		level.chests[chest_index].zombie_cost = 10;
		level.chests[chest_index].being_removed = 0;
		return;
	}
	for(i = 0; i < chest_index; i++)
	{
		util::wait_network_frame();
	}
	playfx(level._effect[#"poltergeist"], level.chests[chest_index].orig_origin);
	util::wait_network_frame();
	if(is_true(level.custom_firesale_box_leave))
	{
		level.chests[chest_index] zm_magicbox::hide_chest(1);
	}
	else
	{
		level.chests[chest_index] zm_magicbox::hide_chest();
	}
	level.chests[chest_index].being_removed = 0;
}

/*
	Name: func_should_drop_fire_sale
	Namespace: zm_powerup_fire_sale
	Checksum: 0xDA4D5E8
	Offset: 0xF00
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function func_should_drop_fire_sale()
{
	if(namespace_59ff1d6c::function_901b751c(#"hash_4e0ec3fe56f08b47") == 0 || zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on") == 1 || level.chest_moves < 1 || is_true(level.disable_firesale_drop))
	{
		return false;
	}
	return true;
}

/*
	Name: sndfiresalemusic_start
	Namespace: zm_powerup_fire_sale
	Checksum: 0x80B3FD7C
	Offset: 0xF98
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function sndfiresalemusic_start()
{
	array = level.chests;
	foreach(struct in array)
	{
		if(!isdefined(struct.sndent))
		{
			struct.sndent = spawn("script_origin", struct.origin + vectorscale((0, 0, 1), 100));
		}
		if(is_true(level.player_4_vox_override))
		{
			struct.sndent playloopsound(#"mus_fire_sale_rich", 1);
			continue;
		}
		struct.sndent playloopsound(#"mus_fire_sale", 1);
	}
}

/*
	Name: sndfiresalemusic_stop
	Namespace: zm_powerup_fire_sale
	Checksum: 0xC3EC3A9F
	Offset: 0x10E8
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function sndfiresalemusic_stop()
{
	array = level.chests;
	foreach(struct in array)
	{
		if(isdefined(struct.sndent))
		{
			struct.sndent playsound(#"hash_332ced69176833bb");
			waitframe(1);
			struct.sndent delete();
			struct.sndent = undefined;
		}
	}
}

