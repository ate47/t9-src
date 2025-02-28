#using script_14f4a3c583c77d4b;
#using script_1c65dbfc2f1c8d8f;
#using script_243ea03c7a285692;
#using script_3751b21462a54a7d;
#using script_3f9e0dc8454d98e1;
#using script_47fb62300ac0bd60;
#using script_48f7c4ab73137f8;
#using script_5bb072c3abf4652c;
#using script_5f261a5d57de5f7c;
#using script_6021ce59143452c3;
#using script_6e3c826b1814cab6;
#using script_6ef496a1b77e83a4;
#using script_7bafaa95bb1b427e;
#using script_ab890501c40b73c;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_laststand;

/*
	Name: function_89f2df9
	Namespace: zm_laststand
	Checksum: 0x2E9EF2E2
	Offset: 0x520
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_laststand", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_laststand
	Checksum: 0xA62304D9
	Offset: 0x568
	Size: 0x2EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level flag::init("solo_revive");
	level.revive_hud = revive_hud::register();
	level.var_ff482f76 = zm_laststand_client::register();
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_spawned);
	callback::on_disconnect(&function_4d3cb10);
	callback::on_ai_killed(&on_ai_killed);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::on_player_killed(&on_player_killed);
	callback::on_bleedout(&on_bleedout);
	level.var_402b86e = &function_c3249e8c;
	clientfield::function_a8bbc967("ZMInventoryPersonal.self_revive_count", 1, 7, "int");
	clientfield::register("allplayers", "zm_last_stand_postfx", 1, 1, "int");
	level.laststand_update_clientfields = [];
	for(i = 0; i < 5; i++)
	{
		level.laststand_update_clientfields[i] = "laststand_update" + i;
		clientfield::register("world", level.laststand_update_clientfields[i], 1, 5, "float");
		clientfield::function_a8bbc967(("WorldSpaceIndicators.bleedOutModel" + i) + ".hide", 1, 1, "int");
	}
	level.weaponsuicide = getweapon(#"death_self");
	if(!isdefined(getdvar(#"revive_trigger_radius")))
	{
		setdvar(#"revive_trigger_radius", 100);
	}
	if(!isdefined(level.var_3ea7f9f4))
	{
		level.var_3ea7f9f4 = 1;
	}
}

/*
	Name: on_player_connect
	Namespace: zm_laststand
	Checksum: 0xEC7259FA
	Offset: 0x860
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self thread function_b7c101fa();
	self thread function_6155752d();
}

/*
	Name: on_spawned
	Namespace: zm_laststand
	Checksum: 0x67A39D3
	Offset: 0x8A0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_spawned()
{
	self.var_39c78617 = undefined;
}

/*
	Name: on_bleedout
	Namespace: zm_laststand
	Checksum: 0xBD755296
	Offset: 0x8B8
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function on_bleedout()
{
	if(!zm_player::function_3799b373(self, 1) && !zm_utility::function_91403f47())
	{
		if(!zm_trial::function_b47f6aba())
		{
			self takeallweapons();
			self allowstand(0);
			self allowcrouch(0);
			self allowprone(1);
			self allowsprint(0);
			self setstance("prone");
		}
	}
}

/*
	Name: player_last_stand_stats
	Namespace: zm_laststand
	Checksum: 0x16123689
	Offset: 0x9A8
	Size: 0x1EC
	Parameters: 9
	Flags: Linked
*/
function player_last_stand_stats(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(isdefined(deathanimduration) && isplayer(deathanimduration) && deathanimduration != self)
	{
		if("zcleansed" == level.gametype)
		{
			demo::function_ae3420ca(deathanimduration, self, psoffsettime);
			potm::function_ae3420ca(deathanimduration, self, psoffsettime);
		}
		if("zcleansed" == level.gametype)
		{
			if(!is_true(deathanimduration.is_zombie))
			{
				deathanimduration.kills++;
			}
			else
			{
				deathanimduration.downs++;
			}
		}
		else
		{
			deathanimduration.kills++;
		}
	}
	self increment_downed_stat();
	if(level flag::get("solo_game") && self function_618fd37e() == 0 && getnumconnectedplayers() < 2)
	{
		self zm_stats::increment_client_stat("deaths");
		self zm_stats::increment_player_stat("deaths");
		self zm_stats::function_8f10788e("boas_deaths");
	}
}

/*
	Name: increment_downed_stat
	Namespace: zm_laststand
	Checksum: 0xD45BBBE
	Offset: 0xBA0
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function increment_downed_stat()
{
	if("zcleansed" != level.gametype)
	{
		self.downs++;
	}
	self zm_stats::increment_global_stat("TOTAL_DOWNS");
	self zm_stats::increment_map_stat("TOTAL_DOWNS");
	self zm_stats::function_f1a1191d("TOTAL_DOWNS");
	self zm_stats::function_2726a7c2("TOTAL_DOWNS");
	self zm_stats::increment_client_stat("downs");
	self zm_stats::function_8f10788e("boas_downs");
	self add_weighted_down();
	self zm_stats::increment_player_stat("downs");
	if(!zm_utility::is_survival() && !zm_utility::function_c200446c())
	{
		zonename = self zm_utility::get_current_zone();
		if(!isdefined(zonename))
		{
			zonename = "";
		}
		self recordplayerdownzombies(zonename);
	}
}

/*
	Name: registerfxanim_warehouse_explo
	Namespace: zm_laststand
	Checksum: 0xC7B96C51
	Offset: 0xD40
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function registerfxanim_warehouse_explo(var_c247e7dc)
{
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(self._gadgets_player[slot]))
		{
			continue;
		}
		self function_19ed70ca(slot, var_c247e7dc);
	}
}

/*
	Name: playerlaststand
	Namespace: zm_laststand
	Checksum: 0xDE40509F
	Offset: 0xDB0
	Size: 0x874
	Parameters: 10
	Flags: Linked
*/
function playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	self notify(#"entering_last_stand");
	self disableweaponcycling();
	self registerfxanim_warehouse_explo(1);
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	if(is_true(self.in_zombify_call))
	{
		return;
	}
	clientfield::set_world_uimodel(("PlayerList.client" + self.entnum) + ".playerIsDowned", 1);
	self thread player_last_stand_stats(attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
	if(weapon == "MOD_SUICIDE" || self === idamage)
	{
		self zm_stats::increment_client_stat("suicides");
		self zm_stats::increment_player_stat("suicides");
		self zm_stats::function_8f10788e("boas_suicides");
	}
	if(self namespace_e86ffa8::function_8923370c(1))
	{
		self setmovespeedscale(2);
	}
	self allowjump(0);
	currweapon = self getcurrentweapon();
	self stats::function_e24eec31(currweapon, #"deathsduringuse", 1);
	if(self function_618fd37e() > 0 && !is_true(level.var_28bbd30a))
	{
		if(!zm_utility::is_survival() && is_true(self.var_20f86af4))
		{
			self thread wait_and_revive();
		}
		else
		{
			self thread function_3699b145();
		}
	}
	self zm_utility::clear_is_drinking();
	self zm_score::player_downed_penalty();
	self disableoffhandweapons();
	self disableoffhandspecial();
	if(self isusingoffhand())
	{
		self forceoffhandend();
	}
	if(isdefined(level._zombie_minigun_powerup_last_stand_func))
	{
		self thread [[level._zombie_minigun_powerup_last_stand_func]]();
	}
	if(isdefined(level._zombie_tesla_powerup_last_stand_func))
	{
		self thread [[level._zombie_tesla_powerup_last_stand_func]]();
	}
	if(self hasperk(#"specialty_electriccherry"))
	{
		if(isdefined(level.custom_laststand_func))
		{
			self thread [[level.custom_laststand_func]]();
		}
	}
	if(isdefined(self.intermission) && self.intermission)
	{
		wait(0.5);
		self stopsounds();
		level waittill(#"forever");
	}
	self clientfield::set("zm_last_stand_postfx", 1);
	self.health = 1;
	self.laststand = 1;
	self val::set(#"laststand", "ignoreme");
	callback::callback(#"on_player_laststand");
	if(weapon != "MOD_SUICIDE" && weapon != "MOD_FALLING")
	{
		self thread util::delay(1, "disconnect", &zm_vo::function_d342796e, #"hash_97e18b450a8ee6c", undefined, 1, undefined, undefined, 20);
	}
	if(!is_true(self.no_revive_trigger) || !is_true(self.var_39c78617))
	{
		self revive_trigger_spawn();
	}
	if(is_true(self.is_zombie))
	{
		self takeallweapons();
		if(isdefined(idamage) && isplayer(idamage) && idamage != self)
		{
			idamage notify(#"killed_a_zombie_player", attacker, self, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
		}
	}
	else
	{
		self laststand_disable_player_weapons();
		self laststand_give_pistol();
	}
	if(isdefined(self.var_c4890291))
	{
		self.var_c4890291 = [];
	}
	if(!isdefined(self.n_downs))
	{
		self.n_downs = 0;
	}
	self.n_downs = self.n_downs + 1;
	bleedout_time = getdvarfloat(#"hash_1116ba0f929df636", (isdefined(self.var_b92e42da) ? self.var_b92e42da : getdvarfloat(#"player_laststandbleedouttime", 0)));
	if(namespace_59ff1d6c::function_901b751c(#"hash_2d34a5d9024db85f") && self.n_downs > namespace_59ff1d6c::function_901b751c(#"hash_2d34a5d9024db85f"))
	{
		bleedout_time = 0;
	}
	if(isdefined(self.n_bleedout_time_multiplier))
	{
		bleedout_time = bleedout_time * self.n_bleedout_time_multiplier;
	}
	if(isdefined(self.var_5c4f1263))
	{
		bleedout_time = bleedout_time * self.var_5c4f1263;
	}
	self thread laststand_bleedout(bleedout_time);
	demo::bookmark(#"player_downed", gettime(), self);
	potm::bookmark(#"player_downed", gettime(), self);
	self notify(#"player_downed");
	self thread refire_player_downed();
	self thread laststand::function_d4c9e1b5();
	self thread auto_revive_on_notify();
	if(self function_1a2fa922())
	{
		self playsound(#"hash_19b37c3454f86a4a");
	}
}

/*
	Name: function_70fcc093
	Namespace: zm_laststand
	Checksum: 0x75DCA64B
	Offset: 0x1630
	Size: 0x126
	Parameters: 0
	Flags: None
*/
function function_70fcc093()
{
	if(isdefined(level.var_e1d82d33))
	{
		foreach(player in function_a1ef346b(self.team))
		{
			if(isplayer(player) && player != self)
			{
				s_path = generatenavmeshpath(self.origin, player.origin);
				if(isdefined(s_path))
				{
					if(isdefined(s_path.pathdistance))
					{
						if(s_path.pathdistance < level.var_e1d82d33)
						{
							return true;
						}
					}
				}
				else
				{
					return true;
				}
				waitframe(1);
			}
		}
	}
	return false;
}

/*
	Name: auto_revive_on_notify
	Namespace: zm_laststand
	Checksum: 0x6BBDB088
	Offset: 0x1760
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function auto_revive_on_notify()
{
	self endon(#"death", #"player_revived");
	s_result = undefined;
	s_result = self waittill(#"auto_revive", #"remote_revive");
	self thread auto_revive(s_result.reviver);
}

/*
	Name: function_1a2fa922
	Namespace: zm_laststand
	Checksum: 0x15BAF5F8
	Offset: 0x17E8
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_1a2fa922()
{
	if(level.players.size > 1)
	{
		foreach(e_player in level.players)
		{
			if(zm_utility::is_player_valid(e_player))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: wait_and_revive
	Namespace: zm_laststand
	Checksum: 0x45CECEDF
	Offset: 0x18A0
	Size: 0x34C
	Parameters: 0
	Flags: Linked
*/
function wait_and_revive()
{
	self endoncallback(&function_e0f05bad, #"player_revived", #"death");
	level flag::set("wait_and_revive");
	level.wait_and_revive = 1;
	if(is_true(self.waiting_to_revive))
	{
		return;
	}
	self.waiting_to_revive = 1;
	if(isdefined(level.exit_level_func))
	{
		self thread [[level.exit_level_func]]();
	}
	else if(getplayers().size == 1)
	{
		player = getplayers()[0];
		level.move_away_points = positionquery_source_navigation(player.origin, 480, 960, 120, 20);
		if(!isdefined(level.move_away_points))
		{
			level.move_away_points = positionquery_source_navigation(player.last_valid_position, 480, 960, 120, 20);
		}
	}
	var_3269dfa3 = (isdefined(self.var_b92e42da) ? self.var_b92e42da : getdvarfloat(#"player_laststandbleedouttime", 0)) * 0.25;
	var_3269dfa3 = getdvarfloat(#"hash_1d447d6b4492bf4f", var_3269dfa3);
	self thread laststand::revive_hud_show_n_fade(#"hash_45804a37272bc580", var_3269dfa3);
	var_c564fe97 = undefined;
	var_c564fe97 = level waittilltimeout(var_3269dfa3, #"end_of_round");
	if(var_c564fe97._notify === "end_of_round")
	{
		self thread laststand::revive_hud_show_n_fade(#"hash_45804a37272bc580", 1);
	}
	while(self.var_16735873 === 1)
	{
		wait(0.1);
	}
	if(isdefined(level.a_revive_success_perk_func))
	{
		foreach(func in level.a_revive_success_perk_func)
		{
			self [[func]]();
		}
	}
	self thread function_e0f05bad();
	self thread auto_revive(self, 1, 1);
}

/*
	Name: function_e0f05bad
	Namespace: zm_laststand
	Checksum: 0x9FC85098
	Offset: 0x1BF8
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_e0f05bad(var_c34665fc)
{
	level flag::clear("wait_and_revive");
	level.wait_and_revive = 0;
	if(isdefined(self))
	{
		self.waiting_to_revive = 0;
	}
}

/*
	Name: refire_player_downed
	Namespace: zm_laststand
	Checksum: 0x379DF807
	Offset: 0x1C50
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function refire_player_downed()
{
	self endon(#"player_revived", #"death");
	wait(1);
	if(self.num_perks)
	{
		self notify(#"player_downed");
	}
}

/*
	Name: laststand_disable_player_weapons
	Namespace: zm_laststand
	Checksum: 0x9AC27FBF
	Offset: 0x1CA8
	Size: 0x1D6
	Parameters: 0
	Flags: Linked
*/
function laststand_disable_player_weapons()
{
	self disableweaponcycling();
	var_df4942c2 = self getweaponslist(1);
	self.lastactiveweapon = self.lastnonkillstreakweapon;
	self.laststandpistol = function_549df594();
	foreach(weapon in var_df4942c2)
	{
		if(weapon == level.var_34d27b26)
		{
			continue;
		}
		if(zm_weapons::get_base_weapon(weapon) == zm_weapons::get_base_weapon(self.laststandpistol))
		{
			function_f351748e(weapon);
		}
		if(self function_94cd8c0f())
		{
			self zm_stats::increment_client_stat("failed_sacrifices");
			self zm_stats::increment_player_stat("failed_sacrifices");
			continue;
		}
		if(weapon.isperkbottle)
		{
			self takeweapon(weapon);
			self.lastactiveweapon = level.weaponnone;
			continue;
		}
	}
	self notify(#"weapons_taken_for_last_stand");
}

/*
	Name: laststand_enable_player_weapons
	Namespace: zm_laststand
	Checksum: 0x3EB08A9E
	Offset: 0x1E88
	Size: 0x31A
	Parameters: 1
	Flags: Linked
*/
function laststand_enable_player_weapons(b_bled_out)
{
	self endon(#"death");
	if(isdefined(self.laststandpistol))
	{
		if(isdefined(self.var_1d2409c1))
		{
			if(is_true(self.var_9c882b2d))
			{
				self.var_9c882b2d = undefined;
				self takeweapon(self.laststandpistol);
			}
			else
			{
				function_a9cb028f();
			}
			self.var_1d2409c1 = undefined;
		}
		else if(is_true(self.var_9c882b2d))
		{
			self.var_9c882b2d = undefined;
			self takeweapon(self.laststandpistol);
		}
	}
	if(!is_true(b_bled_out))
	{
		self enableweaponcycling();
		self enableoffhandweapons();
		self enableoffhandspecial();
		self registerfxanim_warehouse_explo(0);
		if(self.lastactiveweapon != level.weaponnone && self hasweapon(self.lastactiveweapon, 1) && !zm_loadout::is_placeable_mine(self.lastactiveweapon) && !zm_equipment::is_equipment(self.lastactiveweapon) && !zm_loadout::is_hero_weapon(self.lastactiveweapon) && !self.lastactiveweapon.isriotshield)
		{
			self switchtoweapon(self.lastactiveweapon);
		}
		else
		{
			if(self getweaponslistprimaries().size)
			{
				self switchtoweapon();
			}
			else
			{
				zm_weapons::give_fallback_weapon();
			}
		}
		do
		{
			var_be17187b = undefined;
			var_be17187b = self waittilltimeout(2.5, #"weapon_change_complete");
		}
		while(self getcurrentweapon() === level.weaponnone);
	}
	self.laststandpistol = undefined;
	self notify(#"hash_9b426cce825928d");
	if(is_true(b_bled_out))
	{
		waitframe(1);
		self.s_loadout = zm_weapons::player_get_loadout();
	}
}

/*
	Name: laststand_has_players_weapons_returned
	Namespace: zm_laststand
	Checksum: 0x30C961F7
	Offset: 0x21B0
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function laststand_has_players_weapons_returned()
{
	if(isdefined(self.laststandpistol))
	{
		return false;
	}
	return true;
}

/*
	Name: function_cbfcda16
	Namespace: zm_laststand
	Checksum: 0x3EA1D36F
	Offset: 0x21D0
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_cbfcda16()
{
	if(level.players.size > 1)
	{
		return level.default_laststandpistol;
	}
	return level.default_solo_laststandpistol;
}

/*
	Name: function_5ff83684
	Namespace: zm_laststand
	Checksum: 0x9D44FF75
	Offset: 0x2210
	Size: 0x228
	Parameters: 0
	Flags: Linked
*/
function function_5ff83684()
{
	level.pistol_values = [];
	level.pistol_values[level.pistol_values.size] = level.default_laststandpistol;
	level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_semiauto_t9");
	level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t9");
	level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t9");
	level.pistol_value_solo_replace_below = level.pistol_values.size - 1;
	level.pistol_values[level.pistol_values.size] = level.default_solo_laststandpistol;
	level.pistol_values[level.pistol_values.size] = getweapon(#"hash_e58e352069bc0a5");
	level.pistol_values[level.pistol_values.size] = getweapon(#"hash_7ea686a9e6a34c98");
	level.pistol_values[level.pistol_values.size] = getweapon(#"hash_8930926b44733df");
	level.pistol_values[level.pistol_values.size] = getweapon(#"ray_gun");
	level.pistol_values[level.pistol_values.size] = getweapon(#"ray_gun_upgraded");
}

/*
	Name: function_aac4b2c9
	Namespace: zm_laststand
	Checksum: 0x337885D5
	Offset: 0x2440
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function function_aac4b2c9(weapon)
{
	/#
		assert(weapon.weapclass === "" || weapon.weapclass === "" || weapon.weapclass === "", "");
	#/
	level flag::wait_till(#"load_main_complete");
	level.pistol_values[level.pistol_values.size] = weapon;
}

/*
	Name: function_6155752d
	Namespace: zm_laststand
	Checksum: 0x7BEA1456
	Offset: 0x24F0
	Size: 0x1B6
	Parameters: 0
	Flags: Linked
*/
function function_6155752d()
{
	self endon(#"disconnect");
	self.var_d84718d1 = [];
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"weapon_change_complete");
		if(isinarray(self.var_d84718d1, s_result.weapon) || laststand::player_is_in_laststand())
		{
			continue;
		}
		switch(s_result.weapon.weapclass)
		{
			case "hash_69055a4af9ca989":
			case "pistolspread":
			case "pistol":
			{
				if(is_true(level.var_d3cfc0c0) && zm_weapons::is_weapon_upgraded(s_result.weapon))
				{
					continue;
				}
				else
				{
					if(!isdefined(self.var_d84718d1))
					{
						self.var_d84718d1 = [];
					}
					else if(!isarray(self.var_d84718d1))
					{
						self.var_d84718d1 = array(self.var_d84718d1);
					}
					self.var_d84718d1[self.var_d84718d1.size] = s_result.weapon;
				}
				continue;
			}
			default:
			{
				continue;
			}
		}
	}
}

/*
	Name: function_25a89622
	Namespace: zm_laststand
	Checksum: 0xEBF684AF
	Offset: 0x26B0
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_25a89622()
{
	if(self zm_loadout::has_powerup_weapon())
	{
		self.lastactiveweapon = level.weaponnone;
	}
	if(isdefined(self.w_min_last_stand_pistol_override))
	{
		self function_f161bb2d();
	}
	if(!self hasweapon(self.laststandpistol, 0))
	{
		self.var_9c882b2d = 1;
		self giveweapon(self.laststandpistol);
	}
	else if(!self hasweapon(self.laststandpistol, 0, 0))
	{
		n_id = function_9f1cc9a9(self.laststandpistol);
		var_feac2bf9 = (n_id ? 0 : 1);
		self.laststandpistol = function_eeddea9a(self.laststandpistol, var_feac2bf9);
	}
	if(isdefined(self.var_1d2409c1))
	{
		self setweaponammoclip(self.laststandpistol, self.laststandpistol.clipsize);
	}
	self setweaponammostock(self.laststandpistol, self.laststandpistol.clipsize * 2);
	self switchtoweapon(self.laststandpistol);
}

/*
	Name: function_f161bb2d
	Namespace: zm_laststand
	Checksum: 0x93E1F596
	Offset: 0x2868
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function function_f161bb2d()
{
	for(i = 0; i < level.pistol_values.size; i++)
	{
		if(level.pistol_values[i] == self.w_min_last_stand_pistol_override)
		{
			n_min_last_stand_pistol_value = i;
			break;
		}
	}
	for(k = 0; k < level.pistol_values.size; k++)
	{
		if(level.pistol_values[k] == self.laststandpistol)
		{
			n_default_last_stand_pistol_value = k;
			break;
		}
	}
	if(n_min_last_stand_pistol_value > n_default_last_stand_pistol_value)
	{
		self.hadpistol = 0;
		self.laststandpistol = self.w_min_last_stand_pistol_override;
	}
}

/*
	Name: function_549df594
	Namespace: zm_laststand
	Checksum: 0x4FD2D64A
	Offset: 0x2948
	Size: 0x1A2
	Parameters: 0
	Flags: Linked
*/
function function_549df594()
{
	var_2a32d68 = self.var_d84718d1;
	if(!isdefined(var_2a32d68))
	{
		var_2a32d68 = [];
	}
	else if(!isarray(var_2a32d68))
	{
		var_2a32d68 = array(var_2a32d68);
	}
	if(!isinarray(var_2a32d68, function_cbfcda16()))
	{
		var_2a32d68[var_2a32d68.size] = function_cbfcda16();
	}
	var_d3702e29 = 0;
	w_pistol = var_2a32d68[0];
	foreach(var_21ae1e3c in var_2a32d68)
	{
		for(j = 0; j < level.pistol_values.size; j++)
		{
			if(level.pistol_values[j] == var_21ae1e3c.rootweapon)
			{
				if(j > var_d3702e29)
				{
					var_d3702e29 = j;
					w_pistol = var_21ae1e3c;
				}
				break;
			}
		}
	}
	return self getbuildkitweapon(w_pistol);
}

/*
	Name: function_f351748e
	Namespace: zm_laststand
	Checksum: 0xAF0BA5F6
	Offset: 0x2AF8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_f351748e(weapon)
{
	var_1d2409c1 = spawnstruct();
	var_1d2409c1.n_clip = self getweaponammoclip(weapon);
	var_1d2409c1.var_d54402a8 = 0;
	if(weapon.dualwieldweapon != level.weaponnone)
	{
		var_1d2409c1.var_d54402a8 = self getweaponammoclip(weapon.dualwieldweapon);
	}
	var_1d2409c1.n_stock = self getweaponammostock(weapon);
	self.var_1d2409c1 = var_1d2409c1;
}

/*
	Name: function_a9cb028f
	Namespace: zm_laststand
	Checksum: 0xBBBBEA56
	Offset: 0x2BB8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_a9cb028f()
{
	var_1d2409c1 = self.var_1d2409c1;
	weapon = self.laststandpistol;
	if(self hasweapon(weapon, 1))
	{
		self setweaponammoclip(weapon, var_1d2409c1.n_clip);
		if(weapon.dualwieldweapon != level.weaponnone)
		{
			self setweaponammoclip(weapon.dualwieldweapon, var_1d2409c1.var_d54402a8);
		}
		self setweaponammostock(weapon, var_1d2409c1.n_stock);
	}
}

/*
	Name: laststand_clean_up_on_disconnect
	Namespace: zm_laststand
	Checksum: 0x95810366
	Offset: 0x2C90
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function laststand_clean_up_on_disconnect(e_revivee)
{
	self endon(#"do_revive_ended_normally", #"death");
	revivetrigger = e_revivee.revivetrigger;
	e_revivee waittill(#"disconnect");
	if(isdefined(revivetrigger))
	{
		revivetrigger delete();
	}
	self function_92bfddb4();
}

/*
	Name: laststand_clean_up_reviving_any
	Namespace: zm_laststand
	Checksum: 0x10AE8EE2
	Offset: 0x2D30
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function laststand_clean_up_reviving_any(e_revivee)
{
	self endon(#"do_revive_ended_normally", #"disconnect");
	e_revivee waittill(#"disconnect", #"zombified", #"stop_revive_trigger");
	if(!isdefined(self.is_reviving_any))
	{
		self.is_reviving_any = 0;
	}
	self.is_reviving_any--;
	if(self.is_reviving_any < 0)
	{
		self.is_reviving_any = 0;
	}
}

/*
	Name: laststand_give_pistol
	Namespace: zm_laststand
	Checksum: 0x3F03B895
	Offset: 0x2DD8
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function laststand_give_pistol()
{
	/#
		assert(isdefined(self.laststandpistol));
	#/
	/#
		assert(self.laststandpistol != level.weaponnone);
	#/
	function_25a89622();
	self thread wait_switch_weapon(1, self.laststandpistol);
}

/*
	Name: wait_switch_weapon
	Namespace: zm_laststand
	Checksum: 0xFB382400
	Offset: 0x2E60
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function wait_switch_weapon(n_delay, w_weapon)
{
	self endon(#"player_revived", #"zombified", #"disconnect");
	wait(n_delay);
	self switchtoweapon(w_weapon);
}

/*
	Name: function_4d7504fd
	Namespace: zm_laststand
	Checksum: 0xFDB3027E
	Offset: 0x2ED0
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4d7504fd(notifyhash)
{
	if(isplayer(self) && isdefined(level.var_ff482f76) && level.var_ff482f76 zm_laststand_client::is_open(self))
	{
		level.var_ff482f76 zm_laststand_client::close(self);
	}
	self laststand::function_f5714974();
	self namespace_791d0451::function_4af7e89f();
}

/*
	Name: function_c499895c
	Namespace: zm_laststand
	Checksum: 0x1A4E92A8
	Offset: 0x2F80
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c499895c(notifyhash)
{
	a_e_players = getplayers();
	foreach(player in a_e_players)
	{
		player function_4d7504fd();
	}
}

/*
	Name: laststand_bleedout
	Namespace: zm_laststand
	Checksum: 0xD8CB94C7
	Offset: 0x3030
	Size: 0x5C4
	Parameters: 1
	Flags: Linked
*/
function laststand_bleedout(delay)
{
	self endoncallback(&function_4d7504fd, #"player_revived", #"zombified", #"disconnect", #"hash_257d7f8fe6f97830", #"fake_death");
	level endoncallback(&function_c499895c, #"end_game", #"round_reset");
	if(level flag::get("round_reset"))
	{
		return;
	}
	self thread zm_perks::function_b4c0e0ee(delay);
	if(is_true(level.var_5b7d2700))
	{
		return;
	}
	if(is_true(self.is_zombie) || is_true(self.var_39c78617))
	{
		self notify(#"bled_out");
		globallogic_player::function_b2873ebe();
		level notify(#"player_bled_out", {#player:self});
		self callback::callback(#"on_player_bleedout");
		util::wait_network_frame();
		self bleed_out();
		return;
	}
	self clientfield::set("zmbLastStand", 1);
	self.bleedout_time = delay;
	n_default_bleedout_time = getdvarfloat(#"player_laststandbleedouttime", 0);
	if(!level.var_ff482f76 zm_laststand_client::is_open(self))
	{
		level.var_ff482f76 zm_laststand_client::open(self, 0);
	}
	level.var_ff482f76 zm_laststand_client::function_65194707(self, self.n_downs);
	level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, 0);
	while(self.bleedout_time > 0)
	{
		if(is_true(self.var_16735873))
		{
			if(isplayer(self) && isdefined(level.var_ff482f76) && level.var_ff482f76 zm_laststand_client::is_open(self))
			{
				level.var_ff482f76 zm_laststand_client::close(self);
				self laststand::function_f5714974();
			}
		}
		else
		{
			if(!level.var_ff482f76 zm_laststand_client::is_open(self))
			{
				level.var_ff482f76 zm_laststand_client::open(self, 0);
				level.var_ff482f76 zm_laststand_client::function_65194707(self, self.n_downs);
				level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, 0);
			}
			self.bleedout_time = self.bleedout_time - 0.2;
			level clientfield::set("laststand_update" + self getentitynumber(), self.bleedout_time / delay);
			level.var_ff482f76 zm_laststand_client::function_67bdfe40(self, self.bleedout_time / delay);
		}
		wait(0.2);
	}
	if(is_true(self.var_16735873))
	{
		self function_473d2fe1(delay);
	}
	while(isdefined(self.revivetrigger) && (is_true(self.revivetrigger.beingrevived) || is_true(self.var_d1e03242)))
	{
		wait(0.1);
	}
	self notify(#"bled_out");
	globallogic_player::function_b2873ebe();
	level notify(#"player_bled_out", {#player:self});
	self callback::callback(#"on_player_bleedout");
	self.var_ea7ea155 = 1;
	util::wait_network_frame();
	self function_4d7504fd();
	self bleed_out();
}

/*
	Name: function_473d2fe1
	Namespace: zm_laststand
	Checksum: 0x887941A8
	Offset: 0x3600
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function function_473d2fe1(delay)
{
	self endoncallback(&function_4d7504fd, #"player_revived", #"zombified", #"disconnect", #"hash_257d7f8fe6f97830");
	level endoncallback(&function_c499895c, #"end_game", #"round_reset");
	while(self.var_16735873 === 1)
	{
		wait(0.1);
	}
	if(!level.var_ff482f76 zm_laststand_client::is_open(self))
	{
		level.var_ff482f76 zm_laststand_client::open(self, 0);
		level.var_ff482f76 zm_laststand_client::function_65194707(self, self.n_downs);
		level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, 0);
		level clientfield::set("laststand_update" + self getentitynumber(), self.bleedout_time / delay);
		level.var_ff482f76 zm_laststand_client::function_67bdfe40(self, self.bleedout_time / delay);
	}
}

/*
	Name: bleed_out
	Namespace: zm_laststand
	Checksum: 0xCEE5E3E1
	Offset: 0x37A8
	Size: 0x38C
	Parameters: 0
	Flags: Linked
*/
function bleed_out()
{
	self endon(#"disconnect");
	self notify(#"stop_revive_trigger");
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	foreach(talent in self.var_7341f980)
	{
		namespace_791d0451::function_4c1d0e25(talent);
	}
	if(!isdefined(self.var_3b511a7c))
	{
		self.var_3b511a7c = 0;
	}
	self.var_3b511a7c++;
	self.var_3b511a7c = math::clamp(self.var_3b511a7c, 0, 9999);
	self namespace_791d0451::function_a173ab53();
	self laststand_enable_player_weapons(1);
	self.laststand = undefined;
	self clientfield::set("zmbLastStand", 0);
	self zm_stats::increment_client_stat("deaths");
	self zm_stats::increment_player_stat("deaths");
	self zm_stats::function_8f10788e("boas_deaths");
	self recordplayerdeathzombies();
	self.last_bleed_out_time = gettime();
	self zm_equipment::take();
	demo::bookmark(#"zm_player_bledout", gettime(), self, undefined, 1);
	potm::bookmark(#"zm_player_bledout", gettime(), self, undefined, 1);
	level notify(#"bleed_out", {#character_index:self.characterindex});
	self undolaststand();
	self clientfield::set("zm_last_stand_postfx", 0);
	zm_player::function_8ef51109(self, 1);
	self.var_ea7ea155 = undefined;
	self suicide();
	clientfield::set_world_uimodel(("PlayerList.client" + self.entnum) + ".playerIsDowned", 0);
	self.statusicon = "hud_status_dead";
	if(is_true(level.is_zombie_level))
	{
		self thread [[level.player_becomes_zombie]]();
	}
	else
	{
		self val::reset(#"laststand", "ignoreme");
	}
}

/*
	Name: can_suicide
	Namespace: zm_laststand
	Checksum: 0xF0C23605
	Offset: 0x3B40
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function can_suicide()
{
	if(!isalive(self))
	{
		return false;
	}
	if(!self laststand::player_is_in_laststand())
	{
		return false;
	}
	if(!isdefined(self.suicideprompt))
	{
		return false;
	}
	if(is_true(self.is_zombie))
	{
		return false;
	}
	if(is_true(level.intermission))
	{
		return false;
	}
	return true;
}

/*
	Name: is_suiciding
	Namespace: zm_laststand
	Checksum: 0x54CA6C89
	Offset: 0x3BD8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function is_suiciding(revivee)
{
	return self usebuttonpressed() && can_suicide();
}

/*
	Name: function_4d3cb10
	Namespace: zm_laststand
	Checksum: 0xCF444AD9
	Offset: 0x3C20
	Size: 0x270
	Parameters: 0
	Flags: Linked
*/
function function_4d3cb10()
{
	level notify(#"hash_ec82a2f41cadbea");
	level endon(#"hash_ec82a2f41cadbea");
	var_9156a121 = 0;
	var_972a361b = 0;
	waitframe(1);
	a_e_players = getplayers();
	if(a_e_players.size == 1)
	{
		var_9156a121 = 1;
		if(!level flag::get("solo_game"))
		{
			var_972a361b = 1;
			level flag::set("solo_game");
		}
	}
	else if(level flag::get("solo_game"))
	{
		var_972a361b = 1;
		level flag::clear("solo_game");
	}
	if(var_972a361b && !zm_utility::is_standard() && !zm_utility::is_trials())
	{
		foreach(e_player in a_e_players)
		{
			if(is_true(e_player.var_240cf7be))
			{
				if(var_9156a121)
				{
					e_player function_3d685b5f(int(max(0, e_player.var_d66589da - e_player.var_308dc243)));
					continue;
				}
				e_player function_3d685b5f(int(max(0, e_player.var_5d4c5daf - e_player.var_308dc243)));
			}
		}
	}
}

/*
	Name: function_3d685b5f
	Namespace: zm_laststand
	Checksum: 0x4C61516
	Offset: 0x3E98
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_3d685b5f(var_7f2e1d50)
{
	var_7f2e1d50 = int(max(var_7f2e1d50, 0));
	self.var_72249004 = var_7f2e1d50;
	self clientfield::set_player_uimodel("ZMInventoryPersonal.self_revive_count", var_7f2e1d50);
	self clientfield::set_world_uimodel(("PlayerList.client" + self.entnum) + ".self_revives", self.var_72249004);
}

/*
	Name: function_618fd37e
	Namespace: zm_laststand
	Checksum: 0xEB2D269A
	Offset: 0x3F40
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_618fd37e()
{
	return self.var_72249004;
}

/*
	Name: function_3a00302e
	Namespace: zm_laststand
	Checksum: 0x2FF6AA4B
	Offset: 0x3F58
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_3a00302e(n_count, var_d47c52b4)
{
	if(!isdefined(n_count))
	{
		n_count = 1;
	}
	if(!isdefined(var_d47c52b4))
	{
		var_d47c52b4 = 1;
	}
	if(var_d47c52b4)
	{
		self.var_d66589da = self.var_d66589da + n_count;
		self.var_5d4c5daf = self.var_5d4c5daf + n_count;
	}
	self function_3d685b5f(self function_618fd37e() + n_count);
}

/*
	Name: function_409dc98e
	Namespace: zm_laststand
	Checksum: 0xB63992FE
	Offset: 0x4000
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_409dc98e(n_count, b_revived)
{
	if(!isdefined(n_count))
	{
		n_count = 1;
	}
	if(!isdefined(b_revived))
	{
		b_revived = 1;
	}
	if(b_revived)
	{
		self.var_308dc243 = self.var_308dc243 + n_count;
	}
	self function_3d685b5f(self function_618fd37e() - n_count);
}

/*
	Name: function_b7c101fa
	Namespace: zm_laststand
	Checksum: 0x79513ADE
	Offset: 0x4090
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function function_b7c101fa()
{
	self endon(#"disconnect");
	self.var_72249004 = 0;
	self.var_308dc243 = 0;
	self.var_d66589da = int(zombie_utility::function_d2dfacfd(#"hash_67ae1b8cbb7c985"));
	self.var_5d4c5daf = int(zombie_utility::function_d2dfacfd(#"hash_3098c53bba6402d3"));
	level thread function_4d3cb10();
	self waittill(#"spawned");
	if(!zm_utility::is_survival())
	{
		level flag::wait_till("start_zombie_round_logic");
	}
	else
	{
		self function_3d685b5f(0);
		return;
	}
	if(getplayers().size == 1)
	{
		var_7f2e1d50 = self.var_d66589da;
		self.var_240cf7be = 1;
	}
	else
	{
		var_7f2e1d50 = self.var_5d4c5daf;
	}
	var_48f2f554 = namespace_59ff1d6c::function_901b751c(#"hash_21ae4d5b707b063");
	if(var_48f2f554)
	{
		self.var_d66589da = int(var_48f2f554);
		self.var_5d4c5daf = int(var_48f2f554);
		self function_3d685b5f(var_48f2f554);
	}
	else
	{
		self function_3d685b5f(var_7f2e1d50);
	}
}

/*
	Name: function_3699b145
	Namespace: zm_laststand
	Checksum: 0x8BFF27C5
	Offset: 0x42A0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_3699b145()
{
	self.var_c2bb0cce = 1;
	self thread function_76043ec3();
}

/*
	Name: function_76043ec3
	Namespace: zm_laststand
	Checksum: 0x59F13B9D
	Offset: 0x42D0
	Size: 0x1C8
	Parameters: 0
	Flags: Linked
*/
function function_76043ec3()
{
	self endon(#"disconnect", #"zombified", #"player_revived", #"bled_out");
	level endon(#"end_game");
	while(self usebuttonpressed())
	{
		wait(1);
	}
	if(!isdefined(self.var_c2bb0cce))
	{
		return;
	}
	self.var_c6a6f334 = 0;
	while(true)
	{
		wait(0.1);
		if(!isdefined(self.var_c2bb0cce))
		{
			continue;
		}
		if(!self function_550c4ac4())
		{
			continue;
		}
		n_duration = revive_get_revive_time(self);
		self_revive_success = function_73d6c609(n_duration);
		if(self_revive_success)
		{
			if(isdefined(level.a_revive_success_perk_func))
			{
				foreach(func in level.a_revive_success_perk_func)
				{
					self [[func]]();
				}
			}
			self thread auto_revive(self, 1, 1);
		}
	}
}

/*
	Name: function_550c4ac4
	Namespace: zm_laststand
	Checksum: 0xE9009BB7
	Offset: 0x44A0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_550c4ac4()
{
	return self usebuttonpressed() && function_30b9cdd5();
}

/*
	Name: function_30b9cdd5
	Namespace: zm_laststand
	Checksum: 0xFB9DA758
	Offset: 0x44E0
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_30b9cdd5()
{
	if(!isalive(self))
	{
		return false;
	}
	if(is_true(self.var_c6a6f334))
	{
		return false;
	}
	if(!isdefined(self.var_c2bb0cce))
	{
		return false;
	}
	if(is_true(self.is_zombie))
	{
		return false;
	}
	if(is_true(level.intermission))
	{
		return false;
	}
	if(is_true(self.var_16735873))
	{
		return false;
	}
	return true;
}

/*
	Name: function_73d6c609
	Namespace: zm_laststand
	Checksum: 0x605F2204
	Offset: 0x45A0
	Size: 0x15E
	Parameters: 1
	Flags: Linked
*/
function function_73d6c609(n_duration)
{
	self endoncallback(&function_a7f11faa, #"player_revived", #"zombified", #"bled_out", #"disconnect");
	level endon(#"end_game");
	var_722c6f25 = 0;
	b_success = 0;
	while(true)
	{
		while(self function_550c4ac4())
		{
			waitframe(1);
			var_722c6f25 = var_722c6f25 + 0.05;
			level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, var_722c6f25 / n_duration);
			if(var_722c6f25 >= n_duration)
			{
				b_success = 1;
				break;
			}
		}
		var_722c6f25 = 0;
		level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, var_722c6f25 / n_duration);
		if(is_true(b_success))
		{
			return b_success;
		}
		waitframe(1);
	}
}

/*
	Name: function_a7f11faa
	Namespace: zm_laststand
	Checksum: 0x9310285C
	Offset: 0x4708
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_a7f11faa(var_c34665fc)
{
}

/*
	Name: revive_trigger_spawn
	Namespace: zm_laststand
	Checksum: 0x9A4EE285
	Offset: 0x4730
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function revive_trigger_spawn()
{
	if(is_true(level.var_28bbd30a))
	{
		return;
	}
	radius = getdvarint(#"revive_trigger_radius", 100);
	self.revivetrigger = spawn("trigger_radius", (0, 0, 0), 0, radius, radius);
	self.revivetrigger sethintstring("");
	self.revivetrigger setcursorhint("HINT_NOICON");
	self.revivetrigger setmovingplatformenabled(1);
	self.revivetrigger enablelinkto();
	self.revivetrigger.origin = self.origin;
	self.revivetrigger linkto(self);
	self.revivetrigger setinvisibletoplayer(self);
	self.revivetrigger.beingrevived = 0;
	self.revivetrigger.createtime = gettime();
	self.revivetrigger.radius = radius;
	self thread revive_trigger_think();
}

/*
	Name: revive_trigger_think
	Namespace: zm_laststand
	Checksum: 0x82870F0A
	Offset: 0x48C0
	Size: 0x594
	Parameters: 1
	Flags: Linked
*/
function revive_trigger_think(t_secondary)
{
	self endon(#"disconnect", #"zombified", #"stop_revive_trigger", #"death");
	level endon(#"end_game");
	while(true)
	{
		wait(0.1);
		if(isdefined(t_secondary))
		{
			t_revive = t_secondary;
		}
		else
		{
			if(isdefined(self.revivetrigger))
			{
				if(!isdefined(self.revivetrigger))
				{
					break;
				}
				t_revive = self.revivetrigger;
			}
			else
			{
				self notify(#"stop_revive_trigger");
				return;
			}
		}
		t_revive sethintstring("");
		t_revive function_268e4500();
		foreach(e_player in getplayers())
		{
			n_depth = 0;
			n_depth = self depthinwater();
			if(isdefined(t_secondary))
			{
				if(e_player can_revive(self, 1, 1) && e_player istouching(t_revive) || n_depth > 20)
				{
					t_revive setrevivehintstring(#"hash_12272c5573321d90", self.team);
					break;
				}
				continue;
			}
			if(e_player can_revive_via_override(self) || e_player can_revive(self) || n_depth > 20)
			{
				t_revive setrevivehintstring(#"hash_12272c5573321d90", self.team);
				break;
			}
		}
		foreach(e_reviver in getplayers())
		{
			if(!isdefined(e_reviver) || (self == e_reviver && !isdefined(self.var_6d772cb)) || !e_reviver is_reviving(self, t_secondary))
			{
				continue;
			}
			if(!isdefined(self.var_6d772cb) && (!isdefined(e_reviver.s_revive_override_used) || e_reviver.s_revive_override_used.b_use_revive_tool))
			{
				if(e_reviver function_94cd8c0f())
				{
					continue;
				}
				e_reviver gestures::function_56e00fbf("gestable_t9_stimshot_last_stand");
				e_reviver disableweaponcycling();
				e_reviver disableoffhandweapons();
				e_reviver disableoffhandspecial();
				e_reviver function_432f99ff();
				e_reviver val::set("laststand_revive", "allow_movement", 0);
				e_reviver thread revive_give_back_weapons_when_done(self);
			}
			b_revive_successful = e_reviver revive_do_revive(self, t_secondary);
			if(isdefined(e_reviver))
			{
				e_reviver notify(#"revive_done");
			}
			if(b_revive_successful)
			{
				if(isdefined(level.a_revive_success_perk_func))
				{
					foreach(func in level.a_revive_success_perk_func)
					{
						self [[func]]();
					}
				}
				self thread revive_success(e_reviver);
				self notify(#"stop_revive_trigger");
				return;
			}
			if(isdefined(e_reviver))
			{
				e_reviver zm_vo::function_57b8cd17();
			}
		}
	}
}

/*
	Name: function_8fd9d8b9
	Namespace: zm_laststand
	Checksum: 0x6A056A5E
	Offset: 0x4E60
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_8fd9d8b9(e_reviver)
{
	self endon(#"death");
	self zm_vo::function_57b8cd17();
	self notify(#"hash_1fe68a6b935c321d", {#reviver:e_reviver});
	if(isplayer(e_reviver) && e_reviver != self && !isdefined(self.var_6d772cb) && !is_true(self.var_54cb40e6))
	{
		e_reviver zm_vo::function_d342796e(#"hash_3db45a32611292d9", undefined, undefined, 1, undefined, 20);
		self thread zm_vo::function_d342796e(#"hash_3db46b326112afbc", undefined, undefined, 1, undefined, 20);
	}
}

/*
	Name: revive_give_back_weapons_wait
	Namespace: zm_laststand
	Checksum: 0x6F9CD1C5
	Offset: 0x4F80
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function revive_give_back_weapons_wait(e_reviver, e_revivee)
{
	e_revivee endon(#"disconnect", #"zombified", #"stop_revive_trigger", #"death");
	level endon(#"end_game");
	e_reviver waittill(#"revive_done");
}

/*
	Name: revive_give_back_weapons_when_done
	Namespace: zm_laststand
	Checksum: 0xEC819D55
	Offset: 0x5018
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function revive_give_back_weapons_when_done(e_revivee)
{
	self endon(#"death");
	revive_give_back_weapons_wait(self, e_revivee);
	self function_92bfddb4();
}

/*
	Name: function_92bfddb4
	Namespace: zm_laststand
	Checksum: 0x7D40CC6E
	Offset: 0x5070
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_92bfddb4()
{
	self stopgestureviewmodel(self gestures::function_c77349d4("gestable_t9_stimshot_last_stand"));
	self val::reset("laststand_revive", "allow_movement");
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	self enableoffhandweapons();
	self enableoffhandspecial();
	if(!is_true(self.var_b6840ea0))
	{
		self function_6c22c47a();
	}
	self enableweaponcycling();
	self weapons::function_d571ac59();
}

/*
	Name: function_c3249e8c
	Namespace: zm_laststand
	Checksum: 0x56AD1C22
	Offset: 0x5180
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_c3249e8c()
{
	/#
		assert(isplayer(self));
	#/
	players = getplayers(self.team);
	for(index = 0; index < players.size; index++)
	{
		if(players[index] == self)
		{
			continue;
		}
		if(self can_revive(players[index]))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: can_revive
	Namespace: zm_laststand
	Checksum: 0xB8A13FED
	Offset: 0x5230
	Size: 0x326
	Parameters: 3
	Flags: Linked
*/
function can_revive(e_revivee, ignore_sight_checks, ignore_touch_checks)
{
	if(!isdefined(ignore_sight_checks))
	{
		ignore_sight_checks = 0;
	}
	if(!isdefined(ignore_touch_checks))
	{
		ignore_touch_checks = 0;
	}
	if(!isdefined(e_revivee.revivetrigger))
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self laststand::player_is_in_laststand())
	{
		return false;
	}
	if(self.team != e_revivee.team)
	{
		return false;
	}
	if(is_true(self.is_zombie))
	{
		return false;
	}
	if(self zm_loadout::has_powerup_weapon())
	{
		return false;
	}
	if(!is_true(level.var_3ea7f9f4) && self zm_loadout::has_hero_weapon())
	{
		return false;
	}
	if(is_true(level.can_revive_use_depthinwater_test) && e_revivee depthinwater() > 10)
	{
		return true;
	}
	if(isdefined(level.can_revive) && ![[level.can_revive]](e_revivee))
	{
		return false;
	}
	if(isdefined(level.can_revive_game_module) && ![[level.can_revive_game_module]](e_revivee))
	{
		return false;
	}
	if(!ignore_sight_checks && isdefined(level.revive_trigger_should_ignore_sight_checks))
	{
		ignore_sight_checks = [[level.revive_trigger_should_ignore_sight_checks]](self);
		if(ignore_sight_checks && is_true(e_revivee.revivetrigger.beingrevived))
		{
			ignore_touch_checks = 1;
		}
	}
	if(!ignore_touch_checks)
	{
		if(!self istouching(e_revivee.revivetrigger))
		{
			return false;
		}
	}
	if(!ignore_sight_checks)
	{
		if(!self laststand::is_facing(e_revivee))
		{
			return false;
		}
		if(!sighttracepassed(self.origin + vectorscale((0, 0, 1), 50), e_revivee.origin + vectorscale((0, 0, 1), 30), 0, undefined))
		{
			return false;
		}
		if(!bullettracepassed(self.origin + vectorscale((0, 0, 1), 50), e_revivee.origin + vectorscale((0, 0, 1), 30), 0, undefined))
		{
			return false;
		}
	}
	if(is_true(e_revivee.var_d1e03242))
	{
		return false;
	}
	return true;
}

/*
	Name: is_reviving
	Namespace: zm_laststand
	Checksum: 0xD5A1670
	Offset: 0x5560
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function is_reviving(e_revivee, t_secondary)
{
	if(self is_reviving_via_override(e_revivee))
	{
		return 1;
	}
	if(isdefined(t_secondary))
	{
		return self usebuttonpressed() && self can_revive(e_revivee, 1, 1) && self istouching(t_secondary);
	}
	return self usebuttonpressed() && can_revive(e_revivee);
}

/*
	Name: is_reviving_any
	Namespace: zm_laststand
	Checksum: 0xCACBFA96
	Offset: 0x5628
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function is_reviving_any()
{
	return is_true(self.is_reviving_any);
}

/*
	Name: revive_get_revive_time
	Namespace: zm_laststand
	Checksum: 0xFB18220C
	Offset: 0x5650
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function revive_get_revive_time(e_revivee)
{
	revivetime = 3;
	if(self namespace_e86ffa8::function_8923370c(0))
	{
		revivetime = revivetime * self function_bd85bc2f();
	}
	if(isdefined(self.get_revive_time))
	{
		revivetime = self [[self.get_revive_time]](e_revivee);
	}
	return revivetime;
}

/*
	Name: revive_do_revive
	Namespace: zm_laststand
	Checksum: 0x7789B7EE
	Offset: 0x56D0
	Size: 0x450
	Parameters: 2
	Flags: Linked
*/
function revive_do_revive(e_revivee, t_secondary)
{
	/#
		assert(self is_reviving(e_revivee, t_secondary));
	#/
	revivetime = self revive_get_revive_time(e_revivee);
	if(!isdefined(e_revivee.var_6fc48a11))
	{
		e_revivee.var_6fc48a11 = 0;
	}
	revived = 0;
	e_revivee notify(#"player_being_revived");
	e_revivee.revivetrigger.beingrevived = 1;
	e_revivee thread laststand::revive_hud_show_n_fade(#"hash_12e2c5e29f8ce6ad", 3, self);
	e_revivee.revivetrigger sethintstring("");
	if(isplayer(e_revivee))
	{
		e_revivee startrevive(self, e_revivee.var_6fc48a11 / revivetime);
		e_revivee.var_c6a6f334 = 1;
	}
	self thread laststand_clean_up_on_disconnect(e_revivee);
	if(!isdefined(self.is_reviving_any))
	{
		self.is_reviving_any = 0;
	}
	self.is_reviving_any++;
	self thread laststand_clean_up_reviving_any(e_revivee);
	if(!isdefined(self.revive_progress))
	{
		self.revive_progress = 0;
	}
	self.revive_progress = self.revive_progress + 1;
	self thread check_for_failed_revive(e_revivee);
	while(isdefined(self) && self is_reviving(e_revivee, t_secondary))
	{
		level.var_ff482f76 zm_laststand_client::function_d50fdde9(e_revivee, e_revivee.var_6fc48a11 / revivetime);
		if(is_true(e_revivee.revivetrigger.auto_revive))
		{
			break;
		}
		if(e_revivee.var_6fc48a11 >= revivetime)
		{
			e_revivee.laststand = undefined;
			revived = 1;
			break;
		}
		waitframe(1);
		e_revivee.var_6fc48a11 = e_revivee.var_6fc48a11 + (float(function_60d95f53()) / 1000);
	}
	if(!is_true(e_revivee.revivetrigger.auto_revive) && !revived)
	{
		if(isplayer(e_revivee))
		{
			e_revivee stoprevive(self);
		}
	}
	e_revivee.revivetrigger sethintstring(#"hash_12272c5573321d90");
	e_revivee.revivetrigger.beingrevived = 0;
	if(isdefined(self))
	{
		self notify(#"do_revive_ended_normally");
		if(!isdefined(self.is_reviving_any))
		{
			self.is_reviving_any = 0;
		}
		self.is_reviving_any--;
		if(self.is_reviving_any < 0)
		{
			self.is_reviving_any = 0;
		}
		self.revive_progress = 0;
	}
	e_revivee.var_c6a6f334 = 0;
	if(!revived)
	{
		e_revivee thread checkforbleedout(self);
		e_revivee thread function_2cc9a315(revivetime);
		e_revivee thread function_7165ead0();
	}
	else
	{
		e_revivee.var_6fc48a11 = 0;
		level.var_ff482f76 zm_laststand_client::function_d50fdde9(e_revivee, 0);
	}
	return revived;
}

/*
	Name: function_2cc9a315
	Namespace: zm_laststand
	Checksum: 0x9B20C3A6
	Offset: 0x5B28
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function function_2cc9a315(revivetime)
{
	self endon(#"player_being_revived", #"player_revived", #"disconnect", #"bled_out");
	while(!is_true(self.var_c6a6f334) && isdefined(self.var_6fc48a11) && self.var_6fc48a11 >= 0)
	{
		self.var_6fc48a11 = self.var_6fc48a11 - 0.05;
		level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, self.var_6fc48a11 / revivetime);
		waitframe(1);
	}
}

/*
	Name: function_7165ead0
	Namespace: zm_laststand
	Checksum: 0x4EE47A49
	Offset: 0x5C10
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_7165ead0()
{
	self endon(#"player_being_revived", #"player_revived", #"disconnect");
	self waittill(#"bled_out");
	if(isdefined(self.var_6fc48a11))
	{
		self.var_6fc48a11 = 0;
	}
}

/*
	Name: checkforbleedout
	Namespace: zm_laststand
	Checksum: 0x15A4CAFF
	Offset: 0x5C80
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function checkforbleedout(player)
{
	if(isdefined(player) && zm_utility::is_classic())
	{
		if(!isdefined(player.failed_revives))
		{
			player.failed_revives = 0;
		}
		player.failed_revives++;
		player notify(#"player_failed_revive");
	}
}

/*
	Name: auto_revive
	Namespace: zm_laststand
	Checksum: 0xD6B506D4
	Offset: 0x5CE8
	Size: 0x19C
	Parameters: 4
	Flags: Linked
*/
function auto_revive(reviver, b_track_stats, var_c0ab6a65, var_3f8e593d)
{
	if(!isdefined(b_track_stats))
	{
		b_track_stats = 1;
	}
	if(!isdefined(var_3f8e593d))
	{
		var_3f8e593d = 0;
	}
	level endon(#"end_game");
	self endoncallback(&function_48ce762a, #"disconnect");
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger.auto_revive = 1;
		if(self.revivetrigger.beingrevived)
		{
			while(true)
			{
				if(!isdefined(self.revivetrigger) || !self.revivetrigger.beingrevived)
				{
					break;
				}
				util::wait_network_frame();
			}
		}
		if(isdefined(self.revivetrigger))
		{
			self.revivetrigger.auto_trigger = 0;
		}
	}
	self notify(#"stop_revive_trigger");
	if(self === reviver)
	{
		self zm_stats::increment_challenge_stat(#"hash_5f6b0b87e8f76ae1");
		self contracts::function_5b88297d(#"hash_15ceac9a2c2c1a18");
	}
	self thread revive_success(reviver, b_track_stats, var_c0ab6a65, var_3f8e593d);
}

/*
	Name: function_48ce762a
	Namespace: zm_laststand
	Checksum: 0x6BD46B72
	Offset: 0x5E90
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_48ce762a(param)
{
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
	}
}

/*
	Name: revive_success
	Namespace: zm_laststand
	Checksum: 0x6E5E2A7B
	Offset: 0x5ED0
	Size: 0x1CC
	Parameters: 4
	Flags: Linked
*/
function revive_success(reviver, b_track_stats, var_c0ab6a65, var_5f465b1)
{
	if(!isdefined(b_track_stats))
	{
		b_track_stats = 1;
	}
	if(!isdefined(var_5f465b1))
	{
		var_5f465b1 = 0;
	}
	level endon(#"end_game");
	if(!isplayer(self))
	{
		self notify(#"player_revived", {#reviver:reviver});
		return;
	}
	self thread function_8fd9d8b9(reviver);
	clientfield::set_world_uimodel(("PlayerList.client" + self.entnum) + ".playerIsDowned", 0);
	if(isplayer(reviver) && is_true(b_track_stats))
	{
		reviver xp_revive_once_per_round(self);
		if(!is_true(level.isresetting_grief))
		{
			reviver thread check_for_sacrifice();
		}
	}
	if(isplayer(reviver) && (reviver namespace_e86ffa8::function_8923370c(3) || var_5f465b1))
	{
		reviver zm_utility::function_e0448fec();
	}
	self function_54e3af3c(reviver, b_track_stats, var_c0ab6a65);
}

/*
	Name: function_54e3af3c
	Namespace: zm_laststand
	Checksum: 0xDCCCF30E
	Offset: 0x60A8
	Size: 0x650
	Parameters: 3
	Flags: Linked, Private
*/
function private function_54e3af3c(reviver, b_track_stats, var_c0ab6a65)
{
	if(!isdefined(var_c0ab6a65))
	{
		var_c0ab6a65 = 0;
	}
	self reviveplayer();
	self zm_utility::function_e0448fec();
	self clientfield::set("zmbLastStand", 0);
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	self clientfield::set("zm_last_stand_postfx", 0);
	self val::set("zm_laststand", "allowdeath", 0);
	self util::delay(2, "death", &val::reset, "zm_laststand", "allowdeath");
	self util::delay(2, "death", &val::reset, "laststand", "ignoreme");
	self.laststand = undefined;
	if(var_c0ab6a65)
	{
		self function_409dc98e();
	}
	self setmovespeedscale(1);
	self allowjump(1);
	if(isplayer(reviver))
	{
		reviver notify(#"player_did_a_revive", {#revived_player:self});
		level thread popups::displayteammessagetoteam(#"hash_abc7d6b5c944b2", reviver, reviver.team, undefined, self.entnum);
		if(self !== reviver)
		{
			if(is_true(reviver.var_b1164fd0))
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"aether_shroud_revive_zm", #attacker:reviver});
				reviver stats::function_622feb0d(#"aether_shroud", #"hash_13a923231c746585", 1);
				reviver zm_stats::increment_challenge_stat(#"hash_2cbe744ecd9ac482");
			}
			else
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"revived_teammate_zm", #attacker:reviver});
			}
		}
		if(!is_true(level.isresetting_grief) && is_true(b_track_stats) && reviver != self)
		{
			reviver.revives++;
			reviver zm_stats::increment_client_stat("revives");
			reviver zm_stats::increment_player_stat("revives");
			reviver zm_stats::function_f1a1191d("revives");
			reviver zm_stats::function_3468f864("revives");
			reviver zm_stats::function_7bc347f6("revives");
			reviver zm_stats::function_8f10788e("boas_revives");
			self recordplayerrevivezombies(reviver);
			demo::bookmark(#"zm_player_revived", gettime(), reviver, self);
			potm::bookmark(#"zm_player_revived", gettime(), reviver, self);
		}
	}
	self notify(#"player_revived", {#hash_a4916eac:self.var_84280a99, #reviver:reviver});
	s_params = spawnstruct();
	s_params.e_revivee = self;
	s_params.e_reviver = reviver;
	s_params.var_84280a99 = self.var_84280a99;
	self callback::callback(#"on_player_revived", s_params);
	waitframe(1);
	if(isdefined(self))
	{
		self thread laststand_enable_player_weapons();
	}
	if(getplayers().size == 1)
	{
		ais = getactorarray();
		foreach(ai in ais)
		{
			zm_utility::get_closest_valid_player(ai.origin, undefined, 1);
		}
	}
}

/*
	Name: xp_revive_once_per_round
	Namespace: zm_laststand
	Checksum: 0xD3C0BE87
	Offset: 0x6700
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function xp_revive_once_per_round(player_being_revived)
{
	if(!isdefined(self.number_revives_per_round))
	{
		self.number_revives_per_round = [];
	}
	if(!isdefined(self.number_revives_per_round[player_being_revived.characterindex]))
	{
		self.number_revives_per_round[player_being_revived.characterindex] = 0;
	}
	if(self != player_being_revived && self.number_revives_per_round[player_being_revived.characterindex] == 0)
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"revive_an_ally", #attacker:self});
	}
	self.number_revives_per_round[player_being_revived.characterindex]++;
}

/*
	Name: revive_force_revive
	Namespace: zm_laststand
	Checksum: 0x7676E51
	Offset: 0x67E0
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function revive_force_revive(reviver)
{
	/#
		assert(isdefined(self));
	#/
	/#
		assert(isplayer(self));
	#/
	/#
		assert(self laststand::player_is_in_laststand());
	#/
	self thread revive_success(reviver);
}

/*
	Name: revive_hud_think
	Namespace: zm_laststand
	Checksum: 0x5405175
	Offset: 0x6878
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function revive_hud_think()
{
	level endon(#"last_player_died");
	while(true)
	{
		wait(0.1);
		if(!laststand::player_any_player_in_laststand())
		{
			continue;
		}
		players = getplayers();
		playertorevive = undefined;
		for(i = 0; i < players.size; i++)
		{
			if(!isdefined(players[i].revivetrigger) || !isdefined(players[i].revivetrigger.createtime))
			{
				continue;
			}
			if(!isdefined(playertorevive) || playertorevive.revivetrigger.createtime > players[i].revivetrigger.createtime)
			{
				playertorevive = players[i];
			}
		}
		if(isdefined(playertorevive))
		{
			for(i = 0; i < players.size; i++)
			{
				if(players[i] laststand::player_is_in_laststand())
				{
					continue;
				}
				if(util::function_5df4294() == "vs")
				{
					if(players[i].team != playertorevive.team)
					{
						continue;
					}
				}
				if(zm_utility::is_encounter())
				{
					if(players[i].sessionteam != playertorevive.sessionteam)
					{
						continue;
					}
					if(is_true(level.hide_revive_message))
					{
						continue;
					}
				}
				players[i] thread laststand::revive_hud_show_n_fade(#"hash_453f3038b87fbc77", 3, playertorevive);
			}
			playertorevive.revivetrigger.createtime = undefined;
			wait(3.5);
		}
	}
}

/*
	Name: check_for_sacrifice
	Namespace: zm_laststand
	Checksum: 0x7D55C59E
	Offset: 0x6AA8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function check_for_sacrifice()
{
	self endon(#"death", #"sacrifice_denied");
	self util::delay_notify("sacrifice_denied", 1);
	self waittill(#"player_downed");
	self zm_stats::increment_client_stat("sacrifices");
	self zm_stats::increment_player_stat("sacrifices");
}

/*
	Name: check_for_failed_revive
	Namespace: zm_laststand
	Checksum: 0xE2CCC6DC
	Offset: 0x6B50
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function check_for_failed_revive(e_revivee)
{
	self notify(#"checking_for_failed_revive");
	self endon(#"disconnect", #"checking_for_failed_revive");
	e_revivee endon(#"disconnect", #"player_revived");
	e_revivee waittill(#"bled_out");
	self zm_stats::increment_client_stat("failed_revives");
	self zm_stats::increment_player_stat("failed_revives");
	self zm_stats::function_8f10788e("boas_failed_revives");
}

/*
	Name: add_weighted_down
	Namespace: zm_laststand
	Checksum: 0x29A85FD2
	Offset: 0x6C38
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function add_weighted_down()
{
	if(!level.curr_gametype_affects_rank)
	{
		return;
	}
	weighted_down = 1000;
	if(level.round_number > 0)
	{
		weighted_down = int(1000 / (ceil(level.round_number / 5)));
	}
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::function_dad108fa(#"weighted_downs", weighted_down);
}

/*
	Name: register_revive_override
	Namespace: zm_laststand
	Checksum: 0xCA6ABF9C
	Offset: 0x6D08
	Size: 0xC8
	Parameters: 3
	Flags: None
*/
function register_revive_override(func_is_reviving, func_can_revive, b_use_revive_tool)
{
	if(!isdefined(func_can_revive))
	{
		func_can_revive = undefined;
	}
	if(!isdefined(b_use_revive_tool))
	{
		b_use_revive_tool = 0;
	}
	if(!isdefined(self.a_s_revive_overrides))
	{
		self.a_s_revive_overrides = [];
	}
	s_revive_override = spawnstruct();
	s_revive_override.func_is_reviving = func_is_reviving;
	if(isdefined(func_can_revive))
	{
		s_revive_override.func_can_revive = func_can_revive;
	}
	else
	{
		s_revive_override.func_can_revive = func_is_reviving;
	}
	s_revive_override.b_use_revive_tool = b_use_revive_tool;
	self.a_s_revive_overrides[self.a_s_revive_overrides.size] = s_revive_override;
	return s_revive_override;
}

/*
	Name: deregister_revive_override
	Namespace: zm_laststand
	Checksum: 0xA7C38BD6
	Offset: 0x6DD8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function deregister_revive_override(s_revive_override)
{
	if(isdefined(self) && isdefined(self.a_s_revive_overrides))
	{
		arrayremovevalue(self.a_s_revive_overrides, s_revive_override);
	}
}

/*
	Name: can_revive_via_override
	Namespace: zm_laststand
	Checksum: 0x81120C52
	Offset: 0x6E20
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function can_revive_via_override(e_revivee)
{
	if(isdefined(self) && isdefined(self.a_s_revive_overrides))
	{
		for(i = 0; i < self.a_s_revive_overrides.size; i++)
		{
			if(self [[self.a_s_revive_overrides[i].func_can_revive]](e_revivee))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: is_reviving_via_override
	Namespace: zm_laststand
	Checksum: 0x656C053D
	Offset: 0x6EA0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function is_reviving_via_override(e_revivee)
{
	if(isdefined(self) && isdefined(self.a_s_revive_overrides))
	{
		if(isdefined(e_revivee.var_84280a99) && e_revivee.var_84280a99 !== self)
		{
			return false;
		}
		for(i = 0; i < self.a_s_revive_overrides.size; i++)
		{
			if(self [[self.a_s_revive_overrides[i].func_is_reviving]](e_revivee))
			{
				self.s_revive_override_used = self.a_s_revive_overrides[i];
				return true;
			}
		}
	}
	if(isdefined(self))
	{
		self.s_revive_override_used = undefined;
	}
	return false;
}

/*
	Name: function_16c5dddd
	Namespace: zm_laststand
	Checksum: 0x6B2E329C
	Offset: 0x6F70
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_16c5dddd()
{
	self.var_39c78617 = 1;
	self notify(#"hash_257d7f8fe6f97830");
	if(self laststand::player_is_in_laststand())
	{
		waitframe(4);
		bleed_out();
	}
	else
	{
		self dodamage(self.maxhealth + 666, self.origin);
	}
}

/*
	Name: on_ai_killed
	Namespace: zm_laststand
	Checksum: 0x1272887D
	Offset: 0x7000
	Size: 0x112
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(s_params)
{
	e_player = s_params.eattacker;
	if(isplayer(e_player) && (e_player namespace_791d0451::function_56cedda7(#"hash_504b3df717f88c4e") || is_true(e_player.var_5f465b1)) && e_player laststand::player_is_in_laststand())
	{
		if(e_player namespace_791d0451::function_56cedda7(#"hash_504b3df717f88c4e"))
		{
			e_player namespace_791d0451::function_4c1d0e25(#"hash_504b3df717f88c4e");
		}
		e_player thread auto_revive(e_player, 1, 0, 1);
		e_player notify(#"stop_revive_trigger");
		e_player.var_5f465b1 = undefined;
	}
}

/*
	Name: function_10a4dd0a
	Namespace: zm_laststand
	Checksum: 0x40E0EDB7
	Offset: 0x7120
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_10a4dd0a(s_params)
{
	item = s_params.item;
	var_a6762160 = item.var_a6762160;
	if(var_a6762160.name === #"hash_2cdb76a587cf7a3b")
	{
		if(self function_618fd37e() < 1)
		{
			self function_3a00302e(1);
		}
	}
}

/*
	Name: on_player_killed
	Namespace: zm_laststand
	Checksum: 0x6CAA9FD2
	Offset: 0x71B0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(s_params)
{
	self function_3d685b5f(0);
}

/*
	Name: function_94cd8c0f
	Namespace: zm_laststand
	Checksum: 0x37D3273E
	Offset: 0x71E0
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_94cd8c0f()
{
	if(self isgestureplaying(self gestures::function_c77349d4("gestable_t9_stimshot_last_stand")))
	{
		return true;
	}
	return false;
}

