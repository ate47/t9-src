#using script_1478fbd17fe393cf;
#using script_1cf46b33555422b7;
#using script_263b7f2982258785;
#using script_32399001bdb550da;
#using script_35ae72be7b4fec10;
#using script_4607f5d47c16102b;
#using script_4ae261b2785dda9f;
#using script_5513c8efed5ff300;
#using script_5961deb533dad533;
#using script_633abfc63faf8efc;
#using script_6df46b7b233fa3c;
#using script_7d0013bbc05623b9;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\string_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\collectibles.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\oed.gsc;

#namespace util;

/*
	Name: function_e07f8544
	Namespace: util
	Checksum: 0xC07499B3
	Offset: 0x610
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e07f8544()
{
	level notify(46926478);
}

/*
	Name: __init__system__
	Namespace: util
	Checksum: 0x2F9745DA
	Offset: 0x630
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3b7610eda5a02b79", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: util
	Checksum: 0x3E5FB5AC
	Offset: 0x678
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_54ce800f))
	{
		level.var_54ce800f = [];
	}
	function_3969639b(&cp_hint_text::register, "cp_hint_text");
	lui::add_luimenu("pip_menu", &pip_menu::register);
	clientfield::register("toplayer", "cinematicmotion_blend", 1, 1, "int");
	serverfield::register("cinematicmotion_blend", 1, 1, "int", &function_e6d37e3b);
	animation::add_notetrack_func("dialog_gender_vo", &function_b7367cc0);
	animation::add_notetrack_func("dialog_faction_vo", &function_244408f7);
}

/*
	Name: function_e6d37e3b
	Namespace: util
	Checksum: 0xCD1E12E6
	Offset: 0x7B0
	Size: 0x58
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e6d37e3b(oldval, newval)
{
	player = getplayers()[0];
	if(isdefined(player))
	{
		player notify(#"hash_301c38546c8e722d");
	}
}

/*
	Name: function_5f1df718
	Namespace: util
	Checksum: 0x5DCC201B
	Offset: 0x810
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_5f1df718(var_474d98c7)
{
	/#
		assert(isplayer(self));
	#/
	self thread function_3ca27921(var_474d98c7);
}

/*
	Name: function_3ca27921
	Namespace: util
	Checksum: 0xF2521EB7
	Offset: 0x868
	Size: 0x132
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3ca27921(var_474d98c7)
{
	self endon(#"death");
	if(var_474d98c7 === self function_43ee4470())
	{
		return;
	}
	self notify("247bcf35d68b6074");
	self endon("247bcf35d68b6074");
	if(self clientfield::get_to_player("cinematicmotion_blend") != 1)
	{
		self clientfield::set_to_player("cinematicmotion_blend", 1);
		self waittill(#"hash_301c38546c8e722d");
	}
	self function_6ea199e(var_474d98c7);
	if(self clientfield::get_to_player("cinematicmotion_blend") != 0)
	{
		self clientfield::set_to_player("cinematicmotion_blend", 0);
		self waittill(#"hash_301c38546c8e722d");
	}
}

/*
	Name: function_6ea199e
	Namespace: util
	Checksum: 0x3074BAA2
	Offset: 0x9A8
	Size: 0x176
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ea199e(var_474d98c7)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.var_758eae6))
	{
		self.var_758eae6 = {};
	}
	if(!isdefined(self.var_758eae6.previous) && !isdefined(self.var_758eae6.current))
	{
		self.var_758eae6.previous = self function_43ee4470();
	}
	if(isdefined(var_474d98c7))
	{
		self setcinematicmotionoverride(var_474d98c7);
	}
	else
	{
		if(isdefined(self.var_758eae6.previous))
		{
			if(isdefined(self.var_758eae6.current) && self.var_758eae6.current == self function_43ee4470())
			{
				self setcinematicmotionoverride(self.var_758eae6.previous);
			}
			self.var_758eae6.previous = undefined;
		}
		else
		{
			self clearcinematicmotionoverride();
		}
	}
	self.var_758eae6.current = var_474d98c7;
}

/*
	Name: function_d1397ecd
	Namespace: util
	Checksum: 0x14F4A8B2
	Offset: 0xB28
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_d1397ecd(str_id)
{
	return level.var_54ce800f[str_id];
}

/*
	Name: function_3969639b
	Namespace: util
	Checksum: 0x54FDE183
	Offset: 0xB50
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_3969639b(func, str_id)
{
	level.var_54ce800f[str_id] = [[func]]();
}

/*
	Name: function_ebbb8995
	Namespace: util
	Checksum: 0xD17CAB49
	Offset: 0xB88
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_ebbb8995(str_id)
{
	level.var_54ce800f[str_id] = luielemtext::register();
}

/*
	Name: function_351488bb
	Namespace: util
	Checksum: 0x54DE8469
	Offset: 0xBB8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_351488bb(str_id)
{
	level.var_54ce800f[str_id] = luielembar::register();
}

/*
	Name: function_d2554df
	Namespace: util
	Checksum: 0xBC3A704E
	Offset: 0xBE8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_d2554df(str_id)
{
	level.var_54ce800f[str_id] = luielemimage::register();
}

/*
	Name: add_gametype
	Namespace: util
	Checksum: 0x21FDE551
	Offset: 0xC18
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function add_gametype(gt)
{
}

/*
	Name: within_fov
	Namespace: util
	Checksum: 0x7F305945
	Offset: 0xC30
	Size: 0x8C
	Parameters: 4
	Flags: Linked
*/
function within_fov(start_origin, start_angles, end_origin, fov)
{
	normal = vectornormalize(end_origin - start_origin);
	forward = anglestoforward(start_angles);
	dot = vectordot(forward, normal);
	return dot >= fov;
}

/*
	Name: get_player_height
	Namespace: util
	Checksum: 0x6BBF9FA7
	Offset: 0xCC8
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function get_player_height()
{
	return 70;
}

/*
	Name: isbulletimpactmod
	Namespace: util
	Checksum: 0xFF1C453E
	Offset: 0xCE0
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function isbulletimpactmod(smeansofdeath)
{
	return issubstr(smeansofdeath, "BULLET") || smeansofdeath == "MOD_HEAD_SHOT";
}

/*
	Name: waitrespawnbutton
	Namespace: util
	Checksum: 0x3D85896C
	Offset: 0xD28
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function waitrespawnbutton()
{
	self endon(#"disconnect", #"end_respawn");
	while(self usebuttonpressed() != 1)
	{
		waitframe(1);
	}
}

/*
	Name: printonteam
	Namespace: util
	Checksum: 0xA3891B29
	Offset: 0xD80
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function printonteam(text, str_team)
{
	str_team = get_team_mapping(str_team);
	/#
		assert(isdefined(level.players));
	#/
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == str_team)
		{
			player iprintln(text);
		}
	}
}

/*
	Name: printboldonteam
	Namespace: util
	Checksum: 0x7AED5C00
	Offset: 0xE80
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function printboldonteam(text, str_team)
{
	str_team = get_team_mapping(str_team);
	/#
		assert(isdefined(level.players));
	#/
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == str_team)
		{
			player iprintlnbold(text);
		}
	}
}

/*
	Name: printboldonteamarg
	Namespace: util
	Checksum: 0x1AB5AA26
	Offset: 0xF80
	Size: 0xFC
	Parameters: 3
	Flags: None
*/
function printboldonteamarg(text, str_team, arg)
{
	str_team = get_team_mapping(str_team);
	/#
		assert(isdefined(level.players));
	#/
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == str_team)
		{
			player iprintlnbold(text, arg);
		}
	}
}

/*
	Name: printonteamarg
	Namespace: util
	Checksum: 0xD8109C52
	Offset: 0x1088
	Size: 0x1C
	Parameters: 3
	Flags: None
*/
function printonteamarg(text, team, arg)
{
}

/*
	Name: printonplayers
	Namespace: util
	Checksum: 0x424069E7
	Offset: 0x10B0
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function printonplayers(text, str_team)
{
	str_team = get_team_mapping(str_team);
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(str_team))
		{
			if(isdefined(players[i].pers[#"team"]) && players[i].pers[#"team"] == str_team)
			{
				players[i] iprintln(text);
			}
			continue;
		}
		players[i] iprintln(text);
	}
}

/*
	Name: _playlocalsound
	Namespace: util
	Checksum: 0x39EFDD91
	Offset: 0x11A8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function _playlocalsound(soundalias)
{
	if(level.splitscreen && !self ishost())
	{
		return;
	}
	self playlocalsound(soundalias);
}

/*
	Name: getotherteam
	Namespace: util
	Checksum: 0x9B0BED1E
	Offset: 0x1200
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function getotherteam(str_team)
{
	str_team = get_team_mapping(str_team);
	if(str_team == #"allies")
	{
		return #"axis";
	}
	if(str_team == #"axis")
	{
		return #"allies";
	}
	return #"allies";
}

/*
	Name: getteammask
	Namespace: util
	Checksum: 0xEB50721F
	Offset: 0x12B8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function getteammask(str_team)
{
	str_team = get_team_mapping(str_team);
	if(!level.teambased || !isdefined(str_team) || !isdefined(level.spawnsystem.ispawn_teammask[str_team]))
	{
		return level.spawnsystem.var_c2989de;
	}
	return level.spawnsystem.ispawn_teammask[str_team];
}

/*
	Name: getotherteamsmask
	Namespace: util
	Checksum: 0x5F9190E5
	Offset: 0x1350
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function getotherteamsmask(str_skip_team)
{
	str_skip_team = get_team_mapping(str_skip_team);
	mask = 0;
	foreach(str_team in level.teams)
	{
		if(str_team == str_skip_team)
		{
			continue;
		}
		mask = mask | getteammask(str_team);
	}
	return mask;
}

/*
	Name: getfx
	Namespace: util
	Checksum: 0x8D7345F
	Offset: 0x1430
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function getfx(fx)
{
	/#
		assert(isdefined(level._effect[fx]), ("" + fx) + "");
	#/
	return level._effect[fx];
}

/*
	Name: add_trigger_to_ent
	Namespace: util
	Checksum: 0xA7B24490
	Offset: 0x1498
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function add_trigger_to_ent(ent)
{
	if(!isdefined(ent._triggers))
	{
		ent._triggers = [];
	}
	ent._triggers[self getentitynumber()] = 1;
}

/*
	Name: remove_trigger_from_ent
	Namespace: util
	Checksum: 0x9610FC46
	Offset: 0x14E8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function remove_trigger_from_ent(ent)
{
	if(!isdefined(ent))
	{
		return;
	}
	if(!isdefined(ent._triggers))
	{
		return;
	}
	if(!isdefined(ent._triggers[self getentitynumber()]))
	{
		return;
	}
	ent._triggers[self getentitynumber()] = 0;
}

/*
	Name: ent_already_in_trigger
	Namespace: util
	Checksum: 0xF79E7A0C
	Offset: 0x1560
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function ent_already_in_trigger(trig)
{
	if(!isdefined(self._triggers))
	{
		return false;
	}
	if(!isdefined(self._triggers[trig getentitynumber()]))
	{
		return false;
	}
	if(!self._triggers[trig getentitynumber()])
	{
		return false;
	}
	return true;
}

/*
	Name: trigger_thread_death_monitor
	Namespace: util
	Checksum: 0x9161FC22
	Offset: 0x15D8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function trigger_thread_death_monitor(ent, ender)
{
	ent waittill(#"death");
	self endon(ender);
	self remove_trigger_from_ent(ent);
}

/*
	Name: trigger_thread
	Namespace: util
	Checksum: 0xFAB0949E
	Offset: 0x1630
	Size: 0x184
	Parameters: 3
	Flags: None
*/
function trigger_thread(ent, on_enter_payload, on_exit_payload)
{
	ent endon(#"death");
	if(ent ent_already_in_trigger(self))
	{
		return;
	}
	self add_trigger_to_ent(ent);
	ender = (("end_trig_death_monitor" + self getentitynumber()) + " ") + ent getentitynumber();
	self thread trigger_thread_death_monitor(ent, ender);
	endon_condition = "leave_trigger_" + self getentitynumber();
	if(isdefined(on_enter_payload))
	{
		self thread [[on_enter_payload]](ent, endon_condition);
	}
	while(isdefined(ent) && ent istouching(self))
	{
		wait(0.01);
	}
	ent notify(endon_condition);
	if(isdefined(ent) && isdefined(on_exit_payload))
	{
		self thread [[on_exit_payload]](ent);
	}
	if(isdefined(ent))
	{
		self remove_trigger_from_ent(ent);
	}
	self notify(ender);
}

/*
	Name: isstrstart
	Namespace: util
	Checksum: 0x84871E31
	Offset: 0x17C0
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function isstrstart(string1, substr)
{
	return getsubstr(string1, 0, substr.size) == substr;
}

/*
	Name: iskillstreaksenabled
	Namespace: util
	Checksum: 0x8EBFBB67
	Offset: 0x1800
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function iskillstreaksenabled()
{
	return isdefined(level.killstreaksenabled) && level.killstreaksenabled;
}

/*
	Name: clearusingremote
	Namespace: util
	Checksum: 0x59C523F9
	Offset: 0x1828
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function clearusingremote(remotename)
{
	if(isdefined(self.carryicon))
	{
		self.carryicon.alpha = 1;
	}
	self.usingremote = undefined;
	self enableoffhandweapons();
	self.killstreak_delay_killcam = undefined;
	self notify(#"stopped_using_remote");
}

/*
	Name: getremotename
	Namespace: util
	Checksum: 0xA4E161EE
	Offset: 0x1890
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function getremotename()
{
	/#
		assert(self isusingremote());
	#/
	return self.usingremote;
}

/*
	Name: setobjectivetext
	Namespace: util
	Checksum: 0xCBD2A0FF
	Offset: 0x18D0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function setobjectivetext(team, text)
{
	team = get_team_mapping(team);
	game.strings["objective_" + level.teams[team]] = text;
}

/*
	Name: setobjectivescoretext
	Namespace: util
	Checksum: 0x73C7954A
	Offset: 0x1930
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function setobjectivescoretext(team, text)
{
	team = get_team_mapping(team);
	game.strings["objective_score_" + level.teams[team]] = text;
}

/*
	Name: setobjectivehinttext
	Namespace: util
	Checksum: 0x8366FF5F
	Offset: 0x1990
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function setobjectivehinttext(team, text)
{
	team = get_team_mapping(team);
	game.strings["objective_hint_" + level.teams[team]] = text;
}

/*
	Name: getobjectivetext
	Namespace: util
	Checksum: 0x954E2979
	Offset: 0x19F0
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function getobjectivetext(team)
{
	team = get_team_mapping(team);
	return game.strings["objective_" + level.teams[team]];
}

/*
	Name: getobjectivescoretext
	Namespace: util
	Checksum: 0xF7427082
	Offset: 0x1A40
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function getobjectivescoretext(team)
{
	team = get_team_mapping(team);
	return game.strings["objective_score_" + level.teams[team]];
}

/*
	Name: getobjectivehinttext
	Namespace: util
	Checksum: 0x14221091
	Offset: 0x1A90
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function getobjectivehinttext(team)
{
	team = get_team_mapping(team);
	return game.strings["objective_hint_" + level.teams[team]];
}

/*
	Name: registerroundswitch
	Namespace: util
	Checksum: 0xE93A5809
	Offset: 0x1AE0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerroundswitch(minvalue, maxvalue)
{
	level.roundswitch = math::clamp(getgametypesetting(#"roundswitch"), minvalue, maxvalue);
	level.roundswitchmin = minvalue;
	level.roundswitchmax = maxvalue;
}

/*
	Name: registerroundlimit
	Namespace: util
	Checksum: 0x185BE15C
	Offset: 0x1B60
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerroundlimit(minvalue, maxvalue)
{
	level.roundlimit = math::clamp(getgametypesetting(#"roundlimit"), minvalue, maxvalue);
	level.roundlimitmin = minvalue;
	level.roundlimitmax = maxvalue;
}

/*
	Name: registerroundwinlimit
	Namespace: util
	Checksum: 0x72FABBE7
	Offset: 0x1BE0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerroundwinlimit(minvalue, maxvalue)
{
	level.roundwinlimit = math::clamp(getgametypesetting(#"roundwinlimit"), minvalue, maxvalue);
	level.roundwinlimitmin = minvalue;
	level.roundwinlimitmax = maxvalue;
}

/*
	Name: registerscorelimit
	Namespace: util
	Checksum: 0x60C65AE0
	Offset: 0x1C60
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerscorelimit(minvalue, maxvalue)
{
	level.scorelimit = math::clamp(getgametypesetting(#"scorelimit"), minvalue, maxvalue);
	level.scorelimitmin = minvalue;
	level.scorelimitmax = maxvalue;
}

/*
	Name: registertimelimit
	Namespace: util
	Checksum: 0x6C634BB0
	Offset: 0x1CE0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registertimelimit(minvalue, maxvalue)
{
	level.timelimit = math::clamp(getgametypesetting(#"timelimit"), minvalue, maxvalue);
	level.timelimitmin = minvalue;
	level.timelimitmax = maxvalue;
}

/*
	Name: registernumlives
	Namespace: util
	Checksum: 0xF80CB72D
	Offset: 0x1D60
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registernumlives(minvalue, maxvalue)
{
	level.numlives = math::clamp(getgametypesetting(#"playernumlives"), minvalue, maxvalue);
	level.numlivesmin = minvalue;
	level.numlivesmax = maxvalue;
}

/*
	Name: getplayerfromclientnum
	Namespace: util
	Checksum: 0x25D25CEC
	Offset: 0x1DE0
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function getplayerfromclientnum(clientnum)
{
	if(clientnum < 0)
	{
		return undefined;
	}
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i] getentitynumber() == clientnum)
		{
			return level.players[i];
		}
	}
	return undefined;
}

/*
	Name: ispressbuild
	Namespace: util
	Checksum: 0xED1403D
	Offset: 0x1E68
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function ispressbuild()
{
	buildtype = getdvarstring(#"buildtype");
	if(isdefined(buildtype) && buildtype == "press")
	{
		return true;
	}
	return false;
}

/*
	Name: isflashbanged
	Namespace: util
	Checksum: 0x77E31562
	Offset: 0x1EC8
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function isflashbanged()
{
	return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

/*
	Name: isentstunned
	Namespace: util
	Checksum: 0x8CDEE9AF
	Offset: 0x1EF0
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function isentstunned()
{
	time = gettime();
	if(isdefined(self.stunned) && self.stunned)
	{
		return true;
	}
	if(self isflashbanged())
	{
		return true;
	}
	if(isdefined(self.stun_fx))
	{
		return true;
	}
	if(isdefined(self.laststunnedtime) && (self.laststunnedtime + 5000) > time)
	{
		return true;
	}
	if(isdefined(self.concussionendtime) && self.concussionendtime > time)
	{
		return true;
	}
	return false;
}

/*
	Name: domaxdamage
	Namespace: util
	Checksum: 0xC084959A
	Offset: 0x1FB0
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function domaxdamage(origin, attacker, inflictor, headshot, mod)
{
	if(isdefined(self.damagedtodeath) && self.damagedtodeath)
	{
		return;
	}
	if(isdefined(self.maxhealth))
	{
		damage = self.maxhealth + 1;
	}
	else
	{
		damage = self.health + 1;
	}
	self.damagedtodeath = 1;
	self dodamage(damage, origin, attacker, inflictor, headshot, mod);
}

/*
	Name: self_delete
	Namespace: util
	Checksum: 0x1914709A
	Offset: 0x2070
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function self_delete()
{
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: screen_message_create
	Namespace: util
	Checksum: 0xEF30C32
	Offset: 0x20A0
	Size: 0x55C
	Parameters: 5
	Flags: None
*/
function screen_message_create(string_message_1, string_message_2, string_message_3, n_offset_y, n_time)
{
	/#
		level notify(#"screen_message_create");
		level endon(#"screen_message_create");
		if(isdefined(level.missionfailed) && level.missionfailed)
		{
			return;
		}
		if(getdvarint(#"hud_missionfailed", 0) == 1)
		{
			return;
		}
		if(!isdefined(n_offset_y))
		{
			n_offset_y = 0;
		}
		if(!isdefined(level._screen_message_1))
		{
			level._screen_message_1 = newdebughudelem();
			level._screen_message_1.elemtype = "";
			level._screen_message_1.font = "";
			level._screen_message_1.fontscale = 1.8;
			level._screen_message_1.horzalign = "";
			level._screen_message_1.vertalign = "";
			level._screen_message_1.alignx = "";
			level._screen_message_1.aligny = "";
			level._screen_message_1.y = -60 + n_offset_y;
			level._screen_message_1.sort = 2;
			level._screen_message_1.color = (1, 1, 1);
			level._screen_message_1.alpha = 1;
			level._screen_message_1.hidewheninmenu = 1;
		}
		level._screen_message_1 settext(string_message_1);
		if(isdefined(string_message_2))
		{
			if(!isdefined(level._screen_message_2))
			{
				level._screen_message_2 = newdebughudelem();
				level._screen_message_2.elemtype = "";
				level._screen_message_2.font = "";
				level._screen_message_2.fontscale = 1.8;
				level._screen_message_2.horzalign = "";
				level._screen_message_2.vertalign = "";
				level._screen_message_2.alignx = "";
				level._screen_message_2.aligny = "";
				level._screen_message_2.y = -33 + n_offset_y;
				level._screen_message_2.sort = 2;
				level._screen_message_2.color = (1, 1, 1);
				level._screen_message_2.alpha = 1;
				level._screen_message_2.hidewheninmenu = 1;
			}
			level._screen_message_2 settext(string_message_2);
		}
		else if(isdefined(level._screen_message_2))
		{
			level._screen_message_2 destroy();
		}
		if(isdefined(string_message_3))
		{
			if(!isdefined(level._screen_message_3))
			{
				level._screen_message_3 = newdebughudelem();
				level._screen_message_3.elemtype = "";
				level._screen_message_3.font = "";
				level._screen_message_3.fontscale = 1.8;
				level._screen_message_3.horzalign = "";
				level._screen_message_3.vertalign = "";
				level._screen_message_3.alignx = "";
				level._screen_message_3.aligny = "";
				level._screen_message_3.y = -6 + n_offset_y;
				level._screen_message_3.sort = 2;
				level._screen_message_3.color = (1, 1, 1);
				level._screen_message_3.alpha = 1;
				level._screen_message_3.hidewheninmenu = 1;
			}
			level._screen_message_3 settext(string_message_3);
		}
		else if(isdefined(level._screen_message_3))
		{
			level._screen_message_3 destroy();
		}
		if(isdefined(n_time) && n_time > 0)
		{
			wait(n_time);
			screen_message_delete();
		}
	#/
}

/*
	Name: screen_message_delete
	Namespace: util
	Checksum: 0xAC0A14B5
	Offset: 0x2608
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function screen_message_delete(delay)
{
	/#
		if(isdefined(delay))
		{
			wait(delay);
		}
		if(isdefined(level._screen_message_1))
		{
			level._screen_message_1 destroy();
		}
		if(isdefined(level._screen_message_2))
		{
			level._screen_message_2 destroy();
		}
		if(isdefined(level._screen_message_3))
		{
			level._screen_message_3 destroy();
		}
	#/
}

/*
	Name: screen_message_create_client
	Namespace: util
	Checksum: 0xEF0AD96E
	Offset: 0x26A8
	Size: 0x544
	Parameters: 5
	Flags: None
*/
function screen_message_create_client(string_message_1, string_message_2, string_message_3, n_offset_y, n_time)
{
	/#
		self notify(#"screen_message_create");
		self endon(#"screen_message_create", #"death");
		if(isdefined(level.missionfailed) && level.missionfailed)
		{
			return;
		}
		if(getdvarint(#"hud_missionfailed", 0) == 1)
		{
			return;
		}
		if(!isdefined(n_offset_y))
		{
			n_offset_y = 0;
		}
		if(!isdefined(self._screen_message_1))
		{
			self._screen_message_1 = newdebughudelem(self);
			self._screen_message_1.elemtype = "";
			self._screen_message_1.font = "";
			self._screen_message_1.fontscale = 1.8;
			self._screen_message_1.horzalign = "";
			self._screen_message_1.vertalign = "";
			self._screen_message_1.alignx = "";
			self._screen_message_1.aligny = "";
			self._screen_message_1.y = -60 + n_offset_y;
			self._screen_message_1.sort = 2;
			self._screen_message_1.color = (1, 1, 1);
			self._screen_message_1.alpha = 1;
			self._screen_message_1.hidewheninmenu = 1;
		}
		self._screen_message_1 settext(string_message_1);
		if(isdefined(string_message_2))
		{
			if(!isdefined(self._screen_message_2))
			{
				self._screen_message_2 = newdebughudelem(self);
				self._screen_message_2.elemtype = "";
				self._screen_message_2.font = "";
				self._screen_message_2.fontscale = 1.8;
				self._screen_message_2.horzalign = "";
				self._screen_message_2.vertalign = "";
				self._screen_message_2.alignx = "";
				self._screen_message_2.aligny = "";
				self._screen_message_2.y = -33 + n_offset_y;
				self._screen_message_2.sort = 2;
				self._screen_message_2.color = (1, 1, 1);
				self._screen_message_2.alpha = 1;
				self._screen_message_2.hidewheninmenu = 1;
			}
			self._screen_message_2 settext(string_message_2);
		}
		else if(isdefined(self._screen_message_2))
		{
			self._screen_message_2 destroy();
		}
		if(isdefined(string_message_3))
		{
			if(!isdefined(self._screen_message_3))
			{
				self._screen_message_3 = newdebughudelem(self);
				self._screen_message_3.elemtype = "";
				self._screen_message_3.font = "";
				self._screen_message_3.fontscale = 1.8;
				self._screen_message_3.horzalign = "";
				self._screen_message_3.vertalign = "";
				self._screen_message_3.alignx = "";
				self._screen_message_3.aligny = "";
				self._screen_message_3.y = -6 + n_offset_y;
				self._screen_message_3.sort = 2;
				self._screen_message_3.color = (1, 1, 1);
				self._screen_message_3.alpha = 1;
				self._screen_message_3.hidewheninmenu = 1;
			}
			self._screen_message_3 settext(string_message_3);
		}
		else if(isdefined(self._screen_message_3))
		{
			self._screen_message_3 destroy();
		}
		if(isdefined(n_time) && n_time > 0)
		{
			self thread screen_message_delete_client(n_time);
		}
	#/
}

/*
	Name: screen_message_delete_client
	Namespace: util
	Checksum: 0x64E0DEF6
	Offset: 0x2BF8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function screen_message_delete_client(delay)
{
	/#
		self endon(#"screen_message_create");
		if(isdefined(delay))
		{
			wait(delay);
		}
		if(isdefined(self._screen_message_1))
		{
			self._screen_message_1 destroy();
		}
		if(isdefined(self._screen_message_2))
		{
			self._screen_message_2 destroy();
		}
		if(isdefined(self._screen_message_3))
		{
			self._screen_message_3 destroy();
		}
	#/
}

/*
	Name: screen_fade_out
	Namespace: util
	Checksum: 0x68CB27EB
	Offset: 0x2CA8
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function screen_fade_out(n_time, str_shader, str_menu_id)
{
	if(!isdefined(str_shader))
	{
		str_shader = "black";
	}
	level lui::screen_fade_out(n_time, str_shader, str_menu_id);
}

/*
	Name: screen_fade_in
	Namespace: util
	Checksum: 0xD22B8736
	Offset: 0x2D00
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function screen_fade_in(n_time, str_shader, str_menu_id)
{
	if(!isdefined(str_shader))
	{
		str_shader = "black";
	}
	level lui::screen_fade_in(n_time, str_shader, str_menu_id);
}

/*
	Name: missionfailedwrapper
	Namespace: util
	Checksum: 0x2B1DE01E
	Offset: 0x2D58
	Size: 0x17C
	Parameters: 9
	Flags: Linked
*/
function missionfailedwrapper(fail_reason, fail_hint, shader, iwidth, iheight, fdelay, x, y, b_count_as_death)
{
	if(!isdefined(b_count_as_death))
	{
		b_count_as_death = 1;
	}
	if(level.missionfailed || level.var_5be43b2d === 1)
	{
		return;
	}
	if(isdefined(level.nextmission))
	{
		return;
	}
	if(getdvarint(#"failure_disabled", 0))
	{
		return;
	}
	/#
		screen_message_delete();
	#/
	level prompts::function_86eedc();
	if(isdefined(y))
	{
		setdvar(#"ui_deadquote", y);
	}
	level.missionfailed = 1;
	level.missionfailed_reason = x;
	level.missionfailed_hint = y;
	level notify(#"hash_2bb74762daab3cd");
	level callback::callback(#"on_mission_failed");
}

/*
	Name: missionfailedwrapper_nodeath
	Namespace: util
	Checksum: 0x2DD45D0A
	Offset: 0x2EE0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function missionfailedwrapper_nodeath(fail_reason, fail_hint)
{
	missionfailedwrapper(fail_reason, fail_hint, 0);
}

/*
	Name: show_hit_marker
	Namespace: util
	Checksum: 0x29DA4ACA
	Offset: 0x2F18
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function show_hit_marker()
{
	if(isplayer(self))
	{
		if(isdefined(self) && isdefined(self.hud_damagefeedback))
		{
			/#
				self.hud_damagefeedback setshader(#"damage_feedback", 24, 48);
				self.hud_damagefeedback.alpha = 1;
				self.hud_damagefeedback fadeovertime(1);
				self.hud_damagefeedback.alpha = 0;
			#/
		}
		else if(isdefined(self) && !isdefined(self.hud_damagefeedback))
		{
			self playhitmarker(undefined, 1, undefined, 0, 0);
		}
	}
}

/*
	Name: init_hero
	Namespace: util
	Checksum: 0x41DBC4F5
	Offset: 0x3010
	Size: 0x2A0
	Parameters: 8
	Flags: Linked
*/
function init_hero(name, func_init, arg1, arg2, arg3, arg4, arg5, b_show_in_ev)
{
	if(!isdefined(b_show_in_ev))
	{
		b_show_in_ev = 1;
	}
	if(!isdefined(level.heroes))
	{
		level.heroes = [];
	}
	name = tolower(name);
	ai_hero = getent(name, "targetname", 1);
	if(!isalive(ai_hero))
	{
		spawner = getent(name, "targetname");
		if(!is_true(spawner.spawning))
		{
			spawner.count++;
			ai_hero = spawner::simple_spawn_single(spawner);
			/#
				assert(isdefined(ai_hero), ("" + name) + "");
			#/
			spawner notify(#"hero_spawned", {#hero:ai_hero});
		}
		else
		{
			waitresult = undefined;
			waitresult = spawner waittill(#"hero_spawned");
			ai_hero = waitresult.hero;
		}
	}
	level.heroes[name] = ai_hero;
	level.(name) = ai_hero;
	ai_hero.animname = name;
	ai_hero.is_hero = 1;
	ai_hero.enableterrainik = 1;
	ai_hero magic_bullet_shield();
	ai_hero thread _hero_death(name);
	if(isdefined(func_init))
	{
		single_thread(ai_hero, func_init, arg1, arg2, arg3, arg4, arg5);
	}
	if(isdefined(level.customherospawn))
	{
		ai_hero [[level.customherospawn]]();
	}
	if(b_show_in_ev)
	{
		ai_hero thread oed::enable_thermal();
	}
	return ai_hero;
}

/*
	Name: init_heroes
	Namespace: util
	Checksum: 0x7C7D6590
	Offset: 0x32B8
	Size: 0x126
	Parameters: 7
	Flags: None
*/
function init_heroes(a_hero_names, func, arg1, arg2, arg3, arg4, arg5)
{
	a_heroes = [];
	foreach(str_hero in a_hero_names)
	{
		if(!isdefined(a_heroes))
		{
			a_heroes = [];
		}
		else if(!isarray(a_heroes))
		{
			a_heroes = array(a_heroes);
		}
		a_heroes[a_heroes.size] = init_hero(str_hero, func, arg1, arg2, arg3, arg4, arg5);
	}
	return a_heroes;
}

/*
	Name: _hero_death
	Namespace: util
	Checksum: 0xC93F7016
	Offset: 0x33E8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function _hero_death(str_name)
{
	self endon(#"unmake_hero");
	self waittill(#"death");
	if(isdefined(self) && !is_true(level.var_5be43b2d))
	{
		/#
			assertmsg(("" + str_name) + "");
		#/
	}
	unmake_hero(str_name);
}

/*
	Name: unmake_hero
	Namespace: util
	Checksum: 0x36E5C9E
	Offset: 0x3490
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function unmake_hero(str_name, b_delete)
{
	if(!isdefined(b_delete))
	{
		b_delete = 0;
	}
	ai_hero = level.heroes[str_name];
	level.heroes = array::remove_index(level.heroes, str_name, 1);
	if(isalive(ai_hero))
	{
		ai_hero stop_magic_bullet_shield();
		ai_hero notify(#"unmake_hero");
		if(b_delete)
		{
			ai_hero delete();
		}
	}
}

/*
	Name: get_heroes
	Namespace: util
	Checksum: 0xB625E04B
	Offset: 0x3560
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function get_heroes()
{
	return level.heroes;
}

/*
	Name: get_hero
	Namespace: util
	Checksum: 0x212CD5F7
	Offset: 0x3578
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function get_hero(str_name)
{
	if(!isdefined(level.heroes))
	{
		level.heroes = [];
	}
	if(isdefined(level.heroes[str_name]))
	{
		return level.heroes[str_name];
	}
	return init_hero(str_name);
}

/*
	Name: is_hero
	Namespace: util
	Checksum: 0x7383CCA5
	Offset: 0x35E8
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function is_hero()
{
	return is_true(self.is_hero);
}

/*
	Name: init_streamer_hints
	Namespace: util
	Checksum: 0x7D8921DA
	Offset: 0x3610
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function init_streamer_hints(number_of_zones)
{
	clientfield::register("world", "force_streamer", 1, getminbitcountfornum(number_of_zones), "int");
}

/*
	Name: clear_streamer_hint
	Namespace: util
	Checksum: 0xB2BCA1BD
	Offset: 0x3668
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function clear_streamer_hint()
{
	level flag::wait_till("all_players_connected");
	level clientfield::set("force_streamer", 0);
}

/*
	Name: set_streamer_hint
	Namespace: util
	Checksum: 0xD0F8F54E
	Offset: 0x36B8
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function set_streamer_hint(n_zone, b_clear_previous)
{
	if(!isdefined(b_clear_previous))
	{
		b_clear_previous = 1;
	}
	level thread _set_streamer_hint(n_zone, b_clear_previous);
}

/*
	Name: _set_streamer_hint
	Namespace: util
	Checksum: 0xEEF80FAD
	Offset: 0x3708
	Size: 0x2CC
	Parameters: 2
	Flags: Linked
*/
function _set_streamer_hint(n_zone, b_clear_previous)
{
	if(!isdefined(b_clear_previous))
	{
		b_clear_previous = 1;
	}
	level notify(#"set_streamer_hint");
	level endon(#"set_streamer_hint");
	/#
		assert(n_zone > 0, "");
	#/
	level flag::set(#"streamer_loading");
	level flag::wait_till("all_players_connected");
	if(b_clear_previous)
	{
		level clientfield::set("force_streamer", 0);
		wait_network_frame();
	}
	level clientfield::set("force_streamer", n_zone);
	if(!isdefined(level.b_wait_for_streamer_default))
	{
		level.b_wait_for_streamer_default = 1;
		/#
			level.b_wait_for_streamer_default = 0;
		#/
	}
	foreach(player in level.players)
	{
		player thread _streamer_hint_wait(n_zone);
	}
	/#
		n_timeout = gettime() + 15000;
	#/
	array::wait_till(level.players, "streamer" + n_zone, 15);
	level flag::clear(#"streamer_loading");
	level streamer_wait();
	/#
		if(gettime() >= n_timeout)
		{
			printtoprightln("" + string::rjust(gettime(), 6, ""), (1, 0, 0));
		}
		else
		{
			printtoprightln("" + string::rjust(gettime(), 6, ""), (1, 1, 1));
		}
	#/
}

/*
	Name: _streamer_hint_wait
	Namespace: util
	Checksum: 0xC11C9338
	Offset: 0x39E0
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function _streamer_hint_wait(n_zone)
{
	self endon(#"disconnect");
	level endon(#"set_streamer_hint");
	self waittillmatch({#zone:n_zone}, #"streamer");
	self notify("streamer" + n_zone);
}

/*
	Name: set_low_ready
	Namespace: util
	Checksum: 0x4BB51865
	Offset: 0x3A58
	Size: 0x314
	Parameters: 2
	Flags: Linked
*/
function set_low_ready(b_lowready, gesture)
{
	if(!isdefined(gesture))
	{
		gesture = #"hash_743809219cd0d96b";
	}
	self val::reset_all(#"low_ready");
	if(isdefined(self.var_acac2f93))
	{
		self stopgestureviewmodel(self.var_acac2f93);
		self notify(#"hash_1e1bc72a511dc338");
		self.var_acac2f93 = undefined;
	}
	if(b_lowready)
	{
		if(isstring(gesture) || ishash(gesture) && isgesture(gesture))
		{
			self val::set(#"low_ready", "disable_weapon_fire", 1);
			self playgestureviewmodel(gesture);
			self.var_acac2f93 = gesture;
			self thread function_79e25924();
		}
		else
		{
			self val::set(#"low_ready", "low_ready", 1);
		}
		self val::set(#"low_ready", "show_weapon_hud", 0);
		self val::set(#"low_ready", "allow_jump", 0);
		self val::set(#"low_ready", "allow_double_jump", 0);
		self val::set(#"low_ready", "allow_sprint", 0);
		self val::set(#"low_ready", "disable_offhand_weapons", 1);
		self val::set(#"low_ready", "disable_offhand_special", 1);
		self val::set(#"low_ready", "allow_ads", 0);
		self val::set(#"low_ready", "disable_aim_assist", 1);
		self val::set(#"low_ready", "allow_prone", 0);
	}
	self.var_f82e2c3d = undefined;
	oed::enable_ev(!b_lowready);
}

/*
	Name: function_1478233c
	Namespace: util
	Checksum: 0x8FBBBAC3
	Offset: 0x3D78
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_1478233c(var_e601604e)
{
	if(isdefined(self.var_acac2f93))
	{
		if(isfloat(var_e601604e))
		{
			self.var_f82e2c3d = gettime() + (int(var_e601604e * 1000));
			self stopgestureviewmodel(self.var_acac2f93);
		}
		else
		{
			if(isgesture(var_e601604e))
			{
				self.var_f82e2c3d = gettime() + (int((self getgestureanimlength(var_e601604e) - 0.2) * 1000));
				self playgestureviewmodel(var_e601604e, undefined, undefined, undefined, undefined, undefined, 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
}

/*
	Name: function_79e25924
	Namespace: util
	Checksum: 0xC6B6DFA6
	Offset: 0x3EA0
	Size: 0x11E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_79e25924()
{
	self endon(#"death", #"hash_1e1bc72a511dc338");
	var_826fad97 = 0;
	while(true)
	{
		if(!self isgestureplaying(self.var_acac2f93))
		{
			var_daab3ee6 = self getcurrentweapon() === level.weaponnone;
			if(!var_daab3ee6)
			{
				if(var_826fad97)
				{
					waitframe(1);
				}
				if(isdefined(self.var_f82e2c3d) && gettime() < self.var_f82e2c3d)
				{
					waitframe(1);
					continue;
				}
				if(!self isplayinganimscripted())
				{
					self playgestureviewmodel(self.var_acac2f93, undefined, undefined, undefined, undefined, undefined, 1);
				}
			}
			var_826fad97 = var_daab3ee6;
		}
		waitframe(1);
	}
}

/*
	Name: cleanupactorcorpses
	Namespace: util
	Checksum: 0x57B92CC2
	Offset: 0x3FC8
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function cleanupactorcorpses()
{
	foreach(corpse in getcorpsearray())
	{
		if(isactorcorpse(corpse))
		{
			corpse delete();
		}
	}
}

/*
	Name: set_level_start_flag
	Namespace: util
	Checksum: 0xDBA9D0AB
	Offset: 0x4078
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function set_level_start_flag(str_flag)
{
	level.str_level_start_flag = str_flag;
	level flag::init(level.str_level_start_flag);
}

/*
	Name: set_player_start_flag
	Namespace: util
	Checksum: 0x60686309
	Offset: 0x40C0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function set_player_start_flag(str_flag)
{
	level.str_player_start_flag = str_flag;
}

/*
	Name: set_rogue_controlled
	Namespace: util
	Checksum: 0x8359468B
	Offset: 0x40E8
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function set_rogue_controlled(b_state)
{
	if(!isdefined(b_state))
	{
		b_state = 1;
	}
	if(b_state)
	{
		self.rogue_controlled = 1;
	}
	else
	{
		self.rogue_controlled = undefined;
	}
}

/*
	Name: init_breath_fx
	Namespace: util
	Checksum: 0x9A5BC230
	Offset: 0x4130
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function init_breath_fx()
{
	clientfield::register("toplayer", "player_cold_breath", 1, 1, "int");
	clientfield::register("actor", "ai_cold_breath", 1, 1, "counter");
}

/*
	Name: player_frost_breath
	Namespace: util
	Checksum: 0xA622FFD1
	Offset: 0x41A0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function player_frost_breath(b_true)
{
	self clientfield::set_to_player("player_cold_breath", b_true);
}

/*
	Name: ai_frost_breath
	Namespace: util
	Checksum: 0xB22AFEB7
	Offset: 0x41D8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function ai_frost_breath()
{
	self endon(#"death");
	if(self.archetype === "human")
	{
		wait(randomfloatrange(1, 3));
		self clientfield::increment("ai_cold_breath");
	}
}

/*
	Name: show_hint_text
	Namespace: util
	Checksum: 0x8359CFCC
	Offset: 0x4248
	Size: 0xAC
	Parameters: 4
	Flags: Linked
*/
function show_hint_text(str_text_to_show, b_should_blink, str_turn_off_notify, n_display_time)
{
	if(!isdefined(str_turn_off_notify))
	{
		str_turn_off_notify = "notify_turn_off_hint_text";
	}
	if(!isdefined(n_display_time))
	{
		n_display_time = -1;
	}
	if(!level flag::get(#"mission_failed"))
	{
		self thread hint_tutorial::function_4c2d4fc4(b_should_blink, #"", 0, #"", 2, n_display_time, str_turn_off_notify, 0);
	}
}

/*
	Name: function_84f75222
	Namespace: util
	Checksum: 0xEE32DDD6
	Offset: 0x4300
	Size: 0x10C
	Parameters: 4
	Flags: None
*/
function function_84f75222(str_text_to_show, b_should_blink, str_turn_off_notify, n_display_time)
{
	lui_elem = function_d1397ecd("cp_hint_text");
	if(lui_elem cp_hint_text::is_open(self))
	{
		self hide_hint_text(0);
	}
	lui_elem cp_hint_text::open(self);
	lui_elem cp_hint_text::set_hint_text(self, str_text_to_show);
	wait_network_frame();
	if(b_should_blink)
	{
		lui_elem cp_hint_text::function_64d95cad(self);
	}
	else
	{
		lui_elem cp_hint_text::function_a981d6b6(self);
	}
	self thread function_7b7dfab3(n_display_time, str_turn_off_notify);
}

/*
	Name: hide_hint_text
	Namespace: util
	Checksum: 0xE7E7496C
	Offset: 0x4418
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function hide_hint_text(b_fade_before_hiding)
{
	if(!isdefined(b_fade_before_hiding))
	{
		b_fade_before_hiding = 1;
	}
	self hint_tutorial::function_9f427d88((b_fade_before_hiding ? 2 : 0));
}

/*
	Name: function_7b7dfab3
	Namespace: util
	Checksum: 0x5B7B5199
	Offset: 0x4468
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_7b7dfab3(n_display_time, str_turn_off_notify)
{
	self endon(#"disconnect");
	s_waitresult = undefined;
	if(n_display_time > 0.75)
	{
		s_waitresult = undefined;
		s_waitresult = self waittilltimeout(n_display_time - 0.75, str_turn_off_notify, #"kill_hint_text", #"death");
	}
	else
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(str_turn_off_notify, #"kill_hint_text", #"death");
	}
	if(s_waitresult._notify == "timeout")
	{
		hide_hint_text(1);
	}
	else
	{
		hide_hint_text(0);
	}
}

/*
	Name: show_event_message
	Namespace: util
	Checksum: 0xCAFD43D4
	Offset: 0x4570
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function show_event_message(player_handle, str_message)
{
	player_handle luinotifyevent(#"comms_event_message", 1, str_message);
}

/*
	Name: function_502198f3
	Namespace: util
	Checksum: 0x417BE7DB
	Offset: 0x45B8
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_502198f3(var_67df10fb)
{
	if(!isdefined(var_67df10fb))
	{
		var_67df10fb = 4;
	}
	self notify("2142fa1c1345de02");
	self endon("2142fa1c1345de02");
	if(!namespace_61e6d095::exists(#"checkpoint_reached"))
	{
		namespace_61e6d095::create(#"checkpoint_reached", #"hash_bca0ed0cade1b34");
		namespace_61e6d095::function_d3c3e5c3(#"checkpoint_reached", [2:#"computer", 1:#"dialog_tree", 0:#"hash_ee64d6a280a2e42"]);
		namespace_61e6d095::function_46df0bc7(#"checkpoint_reached", 1000);
	}
	namespace_61e6d095::function_9ade1d9b(#"checkpoint_reached", "text", #"hash_15fd757c26b65474", 0, 0, 0, 1);
	namespace_61e6d095::function_9ade1d9b(#"checkpoint_reached", "time", var_67df10fb, 0, 0, 0, 1);
	var_67df10fb = var_67df10fb + 4;
	if(var_67df10fb >= (float(function_60d95f53()) / 1000))
	{
		wait(var_67df10fb);
		if(namespace_61e6d095::exists(#"checkpoint_reached"))
		{
			namespace_61e6d095::remove(#"checkpoint_reached");
		}
	}
}

/*
	Name: function_b9dfcfb7
	Namespace: util
	Checksum: 0x9C35FF11
	Offset: 0x47E8
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_b9dfcfb7(var_67df10fb)
{
	if(!isdefined(var_67df10fb))
	{
		var_67df10fb = 4;
	}
	self notify("6ecd26f4e31dfab8");
	self endon("6ecd26f4e31dfab8");
	if(!namespace_61e6d095::exists(#"hash_4362296ac2fe0d63"))
	{
		namespace_61e6d095::create(#"hash_4362296ac2fe0d63", #"hash_35889974967db979");
		namespace_61e6d095::function_d3c3e5c3(#"hash_4362296ac2fe0d63", [2:#"computer", 1:#"dialog_tree", 0:#"hash_ee64d6a280a2e42"]);
		namespace_61e6d095::function_46df0bc7(#"hash_4362296ac2fe0d63", 1000);
	}
	namespace_61e6d095::function_9ade1d9b(#"hash_4362296ac2fe0d63", "text", #"hash_55ed0cb21f07064d", 0, 0, 0, 1);
	namespace_61e6d095::function_9ade1d9b(#"hash_4362296ac2fe0d63", "time", var_67df10fb, 0, 0, 0, 1);
	var_67df10fb = var_67df10fb + 1;
	if(var_67df10fb >= (float(function_60d95f53()) / 1000))
	{
		wait(var_67df10fb);
		if(namespace_61e6d095::exists(#"hash_4362296ac2fe0d63"))
		{
			namespace_61e6d095::remove(#"hash_4362296ac2fe0d63");
		}
	}
}

/*
	Name: update_current_team_objective
	Namespace: util
	Checksum: 0xC3FFBE0F
	Offset: 0x4A18
	Size: 0x104
	Parameters: 4
	Flags: None
*/
function update_current_team_objective(str_team, str_objective, n_time_on_screen, b_remain_until_player_move)
{
	if(!isdefined(n_time_on_screen))
	{
		n_time_on_screen = 3;
	}
	if(!isdefined(b_remain_until_player_move))
	{
		b_remain_until_player_move = 1;
	}
	str_team = get_team_mapping(str_team);
	a_players = getplayers(str_team);
	array::thread_all(a_players, &globallogic_ui::hide_instruction_text_ui);
	waitframe(1);
	if(str_team === #"allies")
	{
		mission.str_current_allies_objective = str_objective;
	}
	else
	{
		mission.str_current_axis_objective = str_objective;
	}
	array::thread_all(a_players, &player_objective_popup, str_objective, n_time_on_screen, b_remain_until_player_move);
}

/*
	Name: player_objective_popup
	Namespace: util
	Checksum: 0x509D0743
	Offset: 0x4B28
	Size: 0x154
	Parameters: 3
	Flags: Linked
*/
function player_objective_popup(str_objective, n_display_time_after_move, b_remain_until_player_move)
{
	if(!isdefined(n_display_time_after_move))
	{
		n_display_time_after_move = 2;
	}
	if(!isdefined(b_remain_until_player_move))
	{
		b_remain_until_player_move = 1;
	}
	self notify(#"end_player_objective_popup");
	self endon(#"end_player_objective_popup", #"disconnect");
	if(!isdefined(str_objective))
	{
		return;
	}
	self thread globallogic_ui::hide_instruction_text_ui();
	waitframe(1);
	if(isdefined(self))
	{
		self thread globallogic_ui::show_instruction_text_ui(str_objective);
	}
	else
	{
		return;
	}
	if(b_remain_until_player_move)
	{
		v_starting_origin = self getorigin();
		while(isalive(self) && distance2dsquared(self getorigin(), v_starting_origin) < 1)
		{
			waitframe(1);
		}
	}
	wait(n_display_time_after_move);
	if(isdefined(self))
	{
		self thread globallogic_ui::hide_instruction_text_ui();
	}
}

/*
	Name: function_74a9e89b
	Namespace: util
	Checksum: 0xC618A3CF
	Offset: 0x4C88
	Size: 0x3E0
	Parameters: 2
	Flags: None
*/
function function_74a9e89b(str_team, str_vehicle)
{
	if(!isdefined(str_team))
	{
		str_team = #"any";
	}
	if(!isdefined(str_vehicle))
	{
		str_vehicle = undefined;
	}
	level flag::wait_till("all_players_spawned");
	foreach(e_player in getplayers(str_team))
	{
		var_30181301 = [];
		if(str_team == #"axis")
		{
			var_261c6219 = struct::get_array("cp_player_vehicle_spawn_axis", "targetname");
		}
		else
		{
			if(str_team == #"allies")
			{
				var_261c6219 = struct::get_array("cp_player_vehicle_spawn_allies", "targetname");
			}
			else
			{
				var_261c6219 = arraycombine(struct::get_array("cp_player_vehicle_spawn_axis", "targetname"), struct::get_array("cp_player_vehicle_spawn_allies", "targetname"), 0, 0);
			}
		}
		var_b72afb0d = struct::get_array("cp_vh_spawn_loc", "variantname");
		var_17d40a0f = arraycombine(var_b72afb0d, var_261c6219, 0, 0);
		if(isdefined(level.skipto_current_objective) && level.skipto_current_objective.size > 0)
		{
			foreach(var_e56f5f30 in var_17d40a0f)
			{
				if(!isdefined(var_e56f5f30.script_objective) || isinarray(level.skipto_current_objective, var_e56f5f30.script_objective))
				{
					if(!isdefined(var_30181301))
					{
						var_30181301 = [];
					}
					else if(!isarray(var_30181301))
					{
						var_30181301 = array(var_30181301);
					}
					if(!isinarray(var_30181301, var_e56f5f30))
					{
						var_30181301[var_30181301.size] = var_e56f5f30;
					}
				}
			}
		}
		else
		{
			var_30181301 = var_17d40a0f;
		}
		/#
			/#
				assert(var_30181301.size > 0, "");
			#/
		#/
		s_point = arraygetclosest(e_player.origin, var_30181301);
		e_player vehicle::function_fa8ced6e(s_point.origin, s_point.angles, str_vehicle);
	}
}

/*
	Name: function_2020ca4e
	Namespace: util
	Checksum: 0x2F317130
	Offset: 0x5070
	Size: 0x200
	Parameters: 0
	Flags: None
*/
function function_2020ca4e()
{
	while(isdefined(self))
	{
		str_result = undefined;
		str_result = self waittill(#"vehicle_used", #"enter_vehicle", #"exit_vehicle", #"death");
		if(str_result._notify == "death")
		{
			if(isdefined(self))
			{
				self.var_fb195aa2 = undefined;
				self clientfield::set("vehicle_keyline_toggle", 0);
			}
			return;
		}
		if(isdefined(self))
		{
			b_occupied = undefined;
			for(i = 0; i < 4; i++)
			{
				if(self function_dcef0ba1(i))
				{
					if(self isvehicleseatoccupied(i))
					{
						b_occupied = 1;
						break;
					}
					continue;
				}
				break;
			}
			if(is_true(b_occupied) && !is_true(self.var_fb195aa2))
			{
				self clientfield::set("vehicle_keyline_toggle", 1);
				self.var_fb195aa2 = 1;
			}
			else if(!is_true(b_occupied) && is_true(self.var_fb195aa2))
			{
				self.var_fb195aa2 = undefined;
				self clientfield::set("vehicle_keyline_toggle", 0);
			}
		}
	}
}

/*
	Name: function_30d3b9ff
	Namespace: util
	Checksum: 0x304C3C6B
	Offset: 0x5278
	Size: 0x312
	Parameters: 5
	Flags: Linked
*/
function function_30d3b9ff(var_428cf68a, ai, latency, var_593afcc1, var_8230ceac)
{
	currenttime = gettime();
	if(!isdefined(latency))
	{
		latency = 0;
	}
	frompoint = var_428cf68a;
	entnum = -1;
	if(!isdefined(var_8230ceac))
	{
		var_8230ceac = ai;
	}
	if(isentity(var_428cf68a))
	{
		if(!isdefined(var_593afcc1))
		{
			var_593afcc1 = var_428cf68a;
		}
		entnum = var_428cf68a getentitynumber();
		if(isdefined(ai.var_830332de) && (ai.var_830332de[entnum] + latency) >= currenttime)
		{
			/#
				assert(isdefined(ai.var_59c5720b[entnum]));
			#/
			return ai.var_59c5720b[entnum];
		}
		if(!isdefined(ai.var_830332de))
		{
			ai.var_830332de = [];
			ai.var_59c5720b = [];
		}
		ai.var_830332de[entnum] = currenttime;
		if(!within_fov(var_428cf68a.origin, var_428cf68a.angles, ai.origin, 0.766))
		{
			ai.var_59c5720b[entnum] = 0;
			return 0;
		}
		if(isplayer(var_428cf68a) || isai(var_428cf68a))
		{
			frompoint = var_428cf68a geteye();
		}
	}
	var_8544fe8e = ai.origin;
	if(sighttracepassed(frompoint, var_8544fe8e, 1, var_593afcc1, var_8230ceac))
	{
		if(entnum >= 0)
		{
			ai.var_59c5720b[entnum] = 1;
		}
		return 1;
	}
	eyeorigin = ai geteye();
	if(sighttracepassed(frompoint, eyeorigin, 1, var_593afcc1, var_8230ceac))
	{
		if(entnum >= 0)
		{
			ai.var_59c5720b[entnum] = 1;
		}
		return 1;
	}
	midorigin = (eyeorigin + var_8544fe8e) * 0.5;
	if(sighttracepassed(frompoint, midorigin, 1, var_593afcc1, var_8230ceac))
	{
		if(entnum >= 0)
		{
			ai.var_59c5720b[entnum] = 1;
		}
		return 1;
	}
	if(entnum >= 0)
	{
		ai.var_59c5720b[entnum] = 0;
	}
	return 0;
}

/*
	Name: create_cursor_hint
	Namespace: util
	Checksum: 0xB28C6AF1
	Offset: 0x5598
	Size: 0x1DC
	Parameters: 13
	Flags: Linked
*/
function create_cursor_hint(tag, originoffset, hintstring, var_2b3af0de, var_2625ed95, var_49394206, prompt, var_42dabd79, var_b42660a4, var_3a0702cc, ignorecollision, var_a9618cc5, validatefunc)
{
	if(!isdefined(originoffset))
	{
		originoffset = (0, 0, 0);
	}
	if(!isdefined(var_2b3af0de))
	{
		var_2b3af0de = 85;
	}
	if(!isdefined(var_2625ed95))
	{
		var_2625ed95 = 0.25;
	}
	if(!isdefined(prompt))
	{
		prompt = #"use";
	}
	if(isdefined(tag) && (tag == #"" || !isdefined(self gettagorigin(tag))))
	{
		tag = undefined;
	}
	var_754bedbb = !isdefined(tag);
	var_248cbbcf = {};
	var_248cbbcf.var_4d98c3ce = hintstring;
	var_248cbbcf.complete_callback = var_49394206;
	var_248cbbcf.tag = tag;
	var_248cbbcf.offset = originoffset;
	var_248cbbcf.var_de6f0004 = var_2625ed95;
	var_248cbbcf.var_87c991f3 = var_2b3af0de;
	var_248cbbcf.var_754bedbb = var_754bedbb;
	var_248cbbcf.var_71b9f0c0 = var_42dabd79;
	var_248cbbcf.var_5e83875a = var_b42660a4;
	var_248cbbcf.var_8ce60046 = var_3a0702cc;
	var_248cbbcf.var_9a27c4ee = ignorecollision;
	var_248cbbcf.var_be77841a = var_a9618cc5;
	var_248cbbcf.var_531201f1 = validatefunc;
	self prompts::function_c97a48c7(prompt, var_248cbbcf);
}

/*
	Name: remove_cursor_hint
	Namespace: util
	Checksum: 0x5C253C19
	Offset: 0x5780
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function remove_cursor_hint(prompt)
{
	if(!isdefined(prompt))
	{
		prompt = #"use";
	}
	self prompts::remove(prompt);
}

/*
	Name: function_5b2f930e
	Namespace: util
	Checksum: 0x6B1A387E
	Offset: 0x57C8
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function function_5b2f930e(slot, image, button)
{
	self setactionslot(slot, "scripted");
	wait_network_frame(2);
	globallogic_ui::function_9ed5232e(("hudItems.actionSlots.actionSlot" + slot) + ".image", image, undefined, 1);
	globallogic_ui::function_9ed5232e(("hudItems.actionSlots.actionSlot" + slot) + ".ammo", -1, undefined, 1);
	if(isdefined(button))
	{
		globallogic_ui::function_9ed5232e(("hudItems.actionSlots.actionSlot" + slot) + ".button", button, undefined, 1);
	}
}

/*
	Name: function_ae1d1464
	Namespace: util
	Checksum: 0xAE38A99D
	Offset: 0x58C0
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_ae1d1464(slot, var_d108d25b)
{
	globallogic_ui::function_9ed5232e(("hudItems.actionSlots.actionSlot" + slot) + ".isUpdated", var_d108d25b, undefined, 1);
}

/*
	Name: function_658a8750
	Namespace: util
	Checksum: 0x23FA6F45
	Offset: 0x5910
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_658a8750(slot)
{
	self setactionslot(slot, "");
	globallogic_ui::function_2ec075a9(("hudItems.actionSlots.actionSlot" + slot) + ".image");
	globallogic_ui::function_2ec075a9(("hudItems.actionSlots.actionSlot" + slot) + ".ammo");
	globallogic_ui::function_2ec075a9(("hudItems.actionSlots.actionSlot" + slot) + ".button");
}

/*
	Name: function_49cff8b0
	Namespace: util
	Checksum: 0x605CC82E
	Offset: 0x59C0
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_49cff8b0(slot, do_show)
{
	if(!isdefined(do_show))
	{
		do_show = 1;
	}
	type = "scripted";
	if(!do_show)
	{
		type = "";
	}
	if(isarray(slot))
	{
		for(i = 1; i <= slot.size; i++)
		{
			self setactionslot(i, type);
		}
	}
	else
	{
		self setactionslot(slot, type);
	}
}

/*
	Name: give_offhand_weapon
	Namespace: util
	Checksum: 0xE556C97F
	Offset: 0x5A88
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function give_offhand_weapon(weapon)
{
	offhandslot = 0;
	if(isdefined(self._gadgets_player[offhandslot]))
	{
		self takeweapon(self._gadgets_player[offhandslot]);
	}
	self giveweapon(weapon);
	slot = self gadgetgetslot(weapon);
	self gadgetpowerset(slot, 100);
	self gadgetcharging(slot, 0);
}

/*
	Name: are_enemies_nearby
	Namespace: util
	Checksum: 0x177B84F3
	Offset: 0x5B50
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function are_enemies_nearby(origin, radius)
{
	if(!isdefined(radius))
	{
		radius = 2000;
	}
	var_d3a6fe2b = self getenemiesinradius(origin, radius);
	foreach(enemy in var_d3a6fe2b)
	{
		if(isalive(enemy) && !is_true(enemy.in_melee_death))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_5045bb33
	Namespace: util
	Checksum: 0x2AAC7F8C
	Offset: 0x5C50
	Size: 0x184
	Parameters: 6
	Flags: Linked
*/
function function_5045bb33(var_6d369e51, var_c8ae7644, var_5816725d, var_c0bf04f, var_724aaf0a, var_18542db1)
{
	if(!isdefined(var_18542db1))
	{
		var_18542db1 = 1;
	}
	/#
		assert(isplayer(self));
	#/
	self notify(#"hash_b771812661a9fdc");
	self endon(#"hash_b771812661a9fdc");
	if(!isdefined(var_5816725d))
	{
		var_5816725d = 0.2;
	}
	if(!isdefined(var_c0bf04f))
	{
		var_c0bf04f = var_5816725d;
	}
	if(!isdefined(var_724aaf0a))
	{
		var_724aaf0a = "_never_";
	}
	var_eb7c3686 = 1 - ((1 - var_c8ae7644) * var_18542db1);
	setslowmotion(1, var_c8ae7644, var_5816725d, 1, var_eb7c3686);
	wait_time = (var_6d369e51 * var_c8ae7644) + (var_5816725d * (((1 - var_c8ae7644) * 0.5) + var_c8ae7644));
	self waittilltimeout(wait_time, var_724aaf0a);
	setslowmotion(var_c8ae7644, 1, var_c0bf04f, var_eb7c3686, 1);
}

/*
	Name: blend_movespeedscale
	Namespace: util
	Checksum: 0x30B59658
	Offset: 0x5DE0
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function blend_movespeedscale(n_scale, n_time)
{
	if(!isdefined(n_time))
	{
		n_time = 0;
	}
	player = self;
	if(!isplayer(player))
	{
		player = getplayers()[0];
	}
	player thread player_speed_proc(n_scale, n_time);
}

/*
	Name: player_speed_proc
	Namespace: util
	Checksum: 0xE0CEC0C7
	Offset: 0x5E68
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function player_speed_proc(n_speed, n_time)
{
	self notify("59e496bf94583510");
	self endon("59e496bf94583510");
	var_ab3e25a2 = self getmovespeedscale();
	n_goal_speed = n_speed;
	if(isdefined(n_time))
	{
		n_range = n_goal_speed - var_ab3e25a2;
		n_cycles = n_time / (float(function_60d95f53()) / 1000);
		n_fraction = n_range / n_cycles;
		while(abs(n_goal_speed - var_ab3e25a2) > abs(n_fraction * 1.1))
		{
			var_ab3e25a2 = var_ab3e25a2 + n_fraction;
			self setmovespeedscale(var_ab3e25a2);
			waitframe(1);
		}
	}
	self setmovespeedscale(n_goal_speed);
}

/*
	Name: blend_movespeedscale_default
	Namespace: util
	Checksum: 0x91E93FA5
	Offset: 0x5FB8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function blend_movespeedscale_default(n_time)
{
	if(!isdefined(n_time))
	{
		n_time = 0;
	}
	player = self;
	if(!isplayer(player))
	{
		player = getplayers()[0];
	}
	player blend_movespeedscale(1, n_time);
}

/*
	Name: function_27f5f662
	Namespace: util
	Checksum: 0x7A7E1F22
	Offset: 0x6038
	Size: 0x108
	Parameters: 3
	Flags: Linked
*/
function function_27f5f662(nag_array, end_flag, delay)
{
	if(!isdefined(delay))
	{
		delay = 4;
	}
	level endon(end_flag);
	var_29a0fa27 = 0;
	while(!flag::get(end_flag) && var_29a0fa27 < nag_array.size)
	{
		if(soundexists(nag_array[var_29a0fa27]))
		{
			if(self != level)
			{
				self dialogue::queue(nag_array[var_29a0fa27]);
			}
			else
			{
				self dialogue::radio(nag_array[var_29a0fa27]);
			}
		}
		else
		{
			iprintlnbold(nag_array[var_29a0fa27]);
		}
		var_29a0fa27++;
		wait(delay);
		delay = delay * 2;
	}
}

/*
	Name: function_b7367cc0
	Namespace: util
	Checksum: 0xEFDFFD1B
	Offset: 0x6148
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b7367cc0(parms)
{
	if(!is_true(level.var_4032a278))
	{
		lines = strtok(parms, " ;,");
		/#
			assert(lines.size == 3, "");
		#/
		self dialog_gender_vo(lines[0], lines[1], lines[2]);
	}
}

/*
	Name: function_244408f7
	Namespace: util
	Checksum: 0x45E74A27
	Offset: 0x61F0
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_244408f7(parms)
{
	if(!is_true(level.var_4032a278))
	{
		lines = strtok(parms, " ;,");
		/#
			assert(lines.size == 4, "");
		#/
		self dialog_faction_vo(lines[0], lines[1], lines[2], lines[3]);
	}
}

/*
	Name: dialog_faction_vo
	Namespace: util
	Checksum: 0x8FE38754
	Offset: 0x62A0
	Size: 0x12A
	Parameters: 4
	Flags: Linked
*/
function dialog_faction_vo(var_d9823b39, var_be096d26, var_7f1981e0, var_500f33b5)
{
	player = getplayers()[0];
	if(!isplayer(player))
	{
		return;
	}
	switch(player namespace_70eba6e6::function_b6a02677())
	{
		case 1:
		{
			self function_b6f9da41(var_d9823b39);
			break;
		}
		case 2:
		{
			self function_b6f9da41(var_be096d26);
			break;
		}
		case 3:
		{
			self function_b6f9da41(var_7f1981e0);
			break;
		}
		case 0:
		{
			self function_b6f9da41(var_500f33b5);
			break;
		}
	}
}

/*
	Name: function_c76fa9e1
	Namespace: util
	Checksum: 0x7044620B
	Offset: 0x63D8
	Size: 0xFA
	Parameters: 3
	Flags: None
*/
function function_c76fa9e1(var_42ff3045, var_d47e50e, var_97085828)
{
	player = getplayers()[0];
	if(!isplayer(player))
	{
		return;
	}
	switch(player player_decision::function_1c4fb6d4())
	{
		case 0:
		{
			self function_b6f9da41(var_42ff3045);
			break;
		}
		case 1:
		{
			self function_b6f9da41(var_d47e50e);
			break;
		}
		case 2:
		{
			self function_b6f9da41(var_97085828);
			break;
		}
	}
}

/*
	Name: dialog_gender_vo
	Namespace: util
	Checksum: 0xACA23A84
	Offset: 0x64E0
	Size: 0x102
	Parameters: 3
	Flags: Linked
*/
function dialog_gender_vo(var_fb68995e, var_75afe953, var_7c7241a)
{
	player = getplayers()[0];
	if(!isplayer(player))
	{
		return;
	}
	switch(player namespace_70eba6e6::function_33bf99f8(1))
	{
		case 0:
		{
			self function_b6f9da41(var_7c7241a);
			break;
		}
		case 1:
		{
			self function_b6f9da41(var_fb68995e);
			break;
		}
		case 2:
		{
			self function_b6f9da41(var_75afe953);
			break;
		}
	}
}

/*
	Name: function_b6f9da41
	Namespace: util
	Checksum: 0xDAB61F3A
	Offset: 0x65F0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_b6f9da41(str_vo)
{
	if(isdefined(str_vo) && isstring(str_vo))
	{
		if(self != level)
		{
			self dialogue::queue(str_vo);
		}
		else
		{
			self dialogue::radio(str_vo);
		}
	}
}

/*
	Name: function_d8ae866d
	Namespace: util
	Checksum: 0x9A529113
	Offset: 0x6668
	Size: 0xD2
	Parameters: 4
	Flags: None
*/
function function_d8ae866d(var_d9823b39, var_be096d26, var_7f1981e0, var_500f33b5)
{
	player = getplayers()[0];
	switch(player namespace_70eba6e6::function_b6a02677())
	{
		case 1:
		{
			return var_d9823b39;
			break;
		}
		case 2:
		{
			return var_be096d26;
			break;
		}
		case 3:
		{
			return var_7f1981e0;
			break;
		}
		case 0:
		{
			return var_500f33b5;
			break;
		}
	}
}

/*
	Name: function_a1a0fe0c
	Namespace: util
	Checksum: 0xB6DBAC05
	Offset: 0x6748
	Size: 0xB2
	Parameters: 3
	Flags: None
*/
function function_a1a0fe0c(var_42ff3045, var_d47e50e, var_97085828)
{
	player = getplayers()[0];
	switch(player player_decision::function_1c4fb6d4())
	{
		case 0:
		{
			return var_42ff3045;
			break;
		}
		case 1:
		{
			return var_d47e50e;
			break;
		}
		case 2:
		{
			return var_97085828;
			break;
		}
	}
}

/*
	Name: function_3ac6fa36
	Namespace: util
	Checksum: 0x6E46920B
	Offset: 0x6808
	Size: 0xBA
	Parameters: 3
	Flags: None
*/
function function_3ac6fa36(var_fb68995e, var_75afe953, var_7c7241a)
{
	player = getplayers()[0];
	switch(player namespace_70eba6e6::function_33bf99f8(1))
	{
		case 0:
		{
			return var_7c7241a;
			break;
		}
		case 1:
		{
			return var_fb68995e;
			break;
		}
		case 2:
		{
			return var_75afe953;
			break;
		}
	}
}

/*
	Name: function_875955a
	Namespace: util
	Checksum: 0x83E1EDB7
	Offset: 0x68D0
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function function_875955a()
{
	player = getplayers()[0];
	switch(player player_decision::function_1c4fb6d4())
	{
		case 0:
		{
			var_ea95c1e7 = "park";
			break;
		}
		case 1:
		{
			var_ea95c1e7 = "lazar";
			break;
		}
		case 2:
		default:
		{
			var_ea95c1e7 = "sims";
			break;
		}
	}
	return var_ea95c1e7;
}

/*
	Name: function_a5318821
	Namespace: util
	Checksum: 0xF5315B2E
	Offset: 0x69A0
	Size: 0x344
	Parameters: 4
	Flags: None
*/
function function_a5318821(var_79a934ad, var_6fa12df4, var_64b54706, var_20900fd)
{
	if(!isdefined(var_79a934ad))
	{
		var_79a934ad = 1;
	}
	if(!isdefined(var_6fa12df4))
	{
		var_6fa12df4 = 0;
	}
	if(!isdefined(var_64b54706))
	{
		var_64b54706 = undefined;
	}
	if(!isdefined(var_20900fd))
	{
		var_20900fd = 0;
	}
	if(var_79a934ad)
	{
		self.var_4fc36735 = 1;
		self namespace_70eba6e6::function_516d14be();
	}
	else
	{
		self.var_4fc36735 = 0;
	}
	thread function_62e48a();
	if(var_20900fd)
	{
		return;
	}
	var_f82db92c = get_map_name();
	if(isdefined(var_64b54706))
	{
		var_f82db92c = var_64b54706;
	}
	var_1afba46e = [9:#"hash_75e51938faa93db4", 8:#"cp_ger_stakeout", 7:#"cp_rus_siege", 6:#"cp_ger_hub", 5:#"cp_nic_revolucion", 4:#"cp_nam_prisoner", 3:#"cp_rus_kgb", 2:#"cp_rus_duga", 1:#"cp_nam_armada", 0:#"cp_rus_amerika"];
	for(lookup = 0; lookup < var_1afba46e.size; lookup++)
	{
		if(var_1afba46e[lookup] == var_f82db92c)
		{
			break;
		}
	}
	if(lookup >= var_1afba46e.size)
	{
		/#
			println(("" + var_f82db92c) + "");
		#/
		return;
	}
	var_918f15a4 = self namespace_70eba6e6::function_33bf99f8(2) - 1;
	var_55f32da2 = ((lookup * 2) + var_918f15a4) + 3;
	self setcharacterbodytype(var_55f32da2);
	var_cc362ad9 = (self namespace_70eba6e6::function_e86cb765() - 1) + (8 * var_6fa12df4);
	self setcharacteroutfit(var_cc362ad9);
	var_50faf85d = self namespace_70eba6e6::function_33bf99f8(1);
	setsaveddvar(#"hash_270ca5acff742bb9", var_50faf85d);
}

/*
	Name: function_de500b59
	Namespace: util
	Checksum: 0x58F97222
	Offset: 0x6CF0
	Size: 0xFA
	Parameters: 0
	Flags: Linked
*/
function function_de500b59()
{
	mapname = get_map_name();
	if(mapname === #"cp_takedown" || mapname === #"cp_rus_yamantau" || mapname === #"cp_sidemission_takedown" || mapname === #"cp_sidemission_tundra")
	{
		return #"hash_4d5f6c0e8d8bec20";
	}
	if(mapname === #"cp_rus_kgb")
	{
		if(getplayers()[0].var_4fc36735 === 1)
		{
			return #"hash_40c037a247e8b24f";
		}
		return #"hash_59ecd456f45762d4";
	}
	return #"hash_40c037a247e8b24f";
}

/*
	Name: function_62e48a
	Namespace: util
	Checksum: 0x4C0EB8A5
	Offset: 0x6DF8
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_62e48a()
{
	missionname = savegame::get_mission_name();
	var_c4258839 = function_de500b59();
	var_d3f10235 = collectibles::function_7be39f53(missionname);
	var_68be2f7a = collectibles::function_9f976c54(missionname);
	globallogic_ui::function_9ed5232e("cp_start_menu.missionName", hash(missionname), 0, 1);
	globallogic_ui::function_9ed5232e("cp_start_menu.characterName", hash(var_c4258839), 0, 1);
	globallogic_ui::function_9ed5232e("cp_start_menu.evidenceEarnedCount", var_d3f10235, 0, 1);
	globallogic_ui::function_9ed5232e("cp_start_menu.evidenceMaxCount", var_68be2f7a, 0, 1);
	globallogic_ui::function_d9f3d3b4("cp_start_menu.updated", 0, 0);
}

/*
	Name: getteamindex
	Namespace: util
	Checksum: 0x1B0D203E
	Offset: 0x6F50
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function getteamindex(team)
{
	if(!isdefined(team))
	{
		return 0;
	}
	if(team == #"none")
	{
		return 0;
	}
	if(team == #"allies")
	{
		return 1;
	}
	if(team == #"axis")
	{
		return 2;
	}
	return 0;
}

/*
	Name: nvidiaansel_scriptdisable
	Namespace: util
	Checksum: 0xE13CA22D
	Offset: 0x6FC8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function nvidiaansel_scriptdisable(b_disable)
{
	if(function_9d3d451a())
	{
		setsaveddvar(#"hash_26b59191d536cbe1", b_disable);
	}
}

/*
	Name: nvidiaansel_overridecollisionradius
	Namespace: util
	Checksum: 0x9913434C
	Offset: 0x7018
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function nvidiaansel_overridecollisionradius(n_radius)
{
	if(function_9d3d451a())
	{
		setsaveddvar(#"hash_60764845bd5c3f80", n_radius);
	}
}

/*
	Name: function_5b433130
	Namespace: util
	Checksum: 0xDC02650A
	Offset: 0x7068
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_5b433130(n_radius)
{
	if(function_9d3d451a())
	{
		setsaveddvar(#"hash_469ff38ad6da23d1", n_radius);
	}
}

/*
	Name: function_3909412
	Namespace: util
	Checksum: 0x44A591B4
	Offset: 0x70B8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_3909412(b_allow)
{
	if(function_9d3d451a())
	{
		setsaveddvar(#"hash_5a382c4d43aa1e3f", b_allow);
	}
}

/*
	Name: function_eefca70f
	Namespace: util
	Checksum: 0x13E1D314
	Offset: 0x7108
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_eefca70f(b_allow)
{
	if(function_9d3d451a())
	{
		setsaveddvar(#"hash_25c492a152a9ee98", b_allow);
	}
}

/*
	Name: function_3e65fe0b
	Namespace: util
	Checksum: 0x52A972DE
	Offset: 0x7158
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_3e65fe0b(enabled)
{
	if(!isdefined(enabled))
	{
		enabled = 0;
	}
	setsaveddvar(#"hash_22e2bc16e5d98b38", is_true(enabled));
}

