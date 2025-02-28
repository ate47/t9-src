#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace audio_shared;

/*
	Name: function_bda28fa4
	Namespace: audio_shared
	Checksum: 0xE1E41E6F
	Offset: 0x2F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bda28fa4()
{
	level notify(920634603);
}

#namespace audio;

/*
	Name: __init__system__
	Namespace: audio
	Checksum: 0x72DA57E1
	Offset: 0x318
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"audio", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: audio
	Checksum: 0x40501FF0
	Offset: 0x360
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	util::registerclientsys("duckCmd");
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&sndresetsoundsettings);
	callback::on_player_killed(&on_player_killed);
	callback::on_vehicle_spawned(&vehiclespawncontext);
	level thread register_clientfields();
}

/*
	Name: register_clientfields
	Namespace: audio
	Checksum: 0xD7E8C56
	Offset: 0x420
	Size: 0x2D4
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("world", "sndMatchSnapshot", 1, 2, "int");
	clientfield::register("scriptmover", "sndRattle", 1, 1, "counter");
	clientfield::register("allplayers", "sndRattle", 1, 1, "counter");
	clientfield::register("toplayer", "sndMelee", 1, 1, "int");
	clientfield::register("vehicle", "sndSwitchVehicleContext", 1, 3, "int");
	clientfield::register("toplayer", "sndCCHacking", 1, 2, "int");
	clientfield::register("toplayer", "sndTacRig", 1, 1, "int");
	clientfield::register("toplayer", "sndLevelStartSnapOff", 1, 1, "int");
	clientfield::register("world", "sndIGCsnapshot", 1, 4, "int");
	clientfield::register("world", "sndChyronLoop", 1, 1, "int");
	clientfield::register("world", "sndZMBFadeIn", 1, 1, "int");
	clientfield::register("world", "sndDeactivateSquadSpawnMusic", 1, 1, "int");
	clientfield::register("toplayer", "sndVehicleDamageAlarm", 1, 1, "counter");
	clientfield::register("toplayer", "sndCriticalHealth", 1, 1, "int");
	clientfield::register("toplayer", "sndLastStand", 1, 1, "int");
}

/*
	Name: function_dcd27601
	Namespace: audio
	Checksum: 0x35FEBA18
	Offset: 0x700
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_dcd27601(state, player)
{
	if(isdefined(player))
	{
		util::setclientsysstate("duckCmd", state, player);
	}
	else
	{
		util::setclientsysstate("duckCmd", state);
	}
}

/*
	Name: sndchyronwatcher
	Namespace: audio
	Checksum: 0x5D37BA93
	Offset: 0x768
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function sndchyronwatcher()
{
	level waittill(#"chyron_menu_open");
	if(isdefined(level.var_3bc9e7f0) == 0)
	{
		level clientfield::set("sndChyronLoop", 1);
	}
	level waittill(#"chyron_menu_closed");
	if(isdefined(level.var_3bc9e7f0) == 0)
	{
		level clientfield::set("sndChyronLoop", 0);
	}
}

/*
	Name: sndresetsoundsettings
	Namespace: audio
	Checksum: 0x6772BB2F
	Offset: 0x810
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function sndresetsoundsettings()
{
	self clientfield::set_to_player("sndMelee", 0);
	self util::clientnotify("sndDEDe");
	if(!self flag::exists("playing_stinger_fired_at_me"))
	{
		self flag::init("playing_stinger_fired_at_me", 0);
	}
	else
	{
		self flag::clear("playing_stinger_fired_at_me");
	}
}

/*
	Name: on_player_connect
	Namespace: audio
	Checksum: 0x1BAC64F7
	Offset: 0x8C0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self callback::function_d8abfc3d(#"missile_lock", &on_missile_lock);
	self callback::function_d8abfc3d(#"hash_1a32e0fdeb70a76b", &function_c25f7d1);
}

/*
	Name: on_player_killed
	Namespace: audio
	Checksum: 0xC50F0610
	Offset: 0x930
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	if(sessionmodeiscampaigngame())
	{
		if(self util::function_a1d6293())
		{
			return;
		}
		music::setmusicstate("death");
		self playsound("uin_player_death");
	}
}

/*
	Name: vehiclespawncontext
	Namespace: audio
	Checksum: 0x9949358B
	Offset: 0x9B0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function vehiclespawncontext()
{
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		self clientfield::set("sndSwitchVehicleContext", 1);
	}
}

/*
	Name: sndupdatevehiclecontext
	Namespace: audio
	Checksum: 0x23964683
	Offset: 0xA10
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function sndupdatevehiclecontext(added)
{
	if(!isdefined(self.sndoccupants))
	{
		self.sndoccupants = 0;
	}
	if(added)
	{
		self.sndoccupants++;
	}
	else
	{
		self.sndoccupants--;
		if(self.sndoccupants < 0)
		{
			self.sndoccupants = 0;
		}
	}
	self clientfield::set("sndSwitchVehicleContext", self.sndoccupants + 1);
}

/*
	Name: playtargetmissilesound
	Namespace: audio
	Checksum: 0xF44D831
	Offset: 0xAA0
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function playtargetmissilesound(alias, looping)
{
	self notify(#"stop_target_missile_sound");
	self endon(#"stop_target_missile_sound", #"disconnect", #"death");
	if(isdefined(alias))
	{
		time = soundgetplaybacktime(alias) * 0.001;
		if(time > 0)
		{
			do
			{
				self playlocalsound(alias);
				wait(time);
			}
			while(looping);
		}
	}
}

/*
	Name: on_missile_lock
	Namespace: audio
	Checksum: 0xB4E547E3
	Offset: 0xB68
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function on_missile_lock(params)
{
	/#
		assert(isplayer(self));
	#/
	if(!flag::get("playing_stinger_fired_at_me"))
	{
		self thread playtargetmissilesound(params.weapon.lockontargetlockedsound, params.weapon.lockontargetlockedsoundloops);
		self waittill(#"stinger_fired_at_me", #"missile_unlocked", #"death");
		self notify(#"stop_target_missile_sound");
	}
}

/*
	Name: function_c25f7d1
	Namespace: audio
	Checksum: 0xF4AC4B3F
	Offset: 0xC40
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_c25f7d1(params)
{
	/#
		assert(isplayer(self));
	#/
	self endon(#"death", #"disconnect");
	self flag::set("playing_stinger_fired_at_me");
	self thread playtargetmissilesound(params.weapon.lockontargetfiredonsound, params.weapon.lockontargetfiredonsoundloops);
	params.projectile waittill(#"projectile_impact_explode", #"death");
	self notify(#"stop_target_missile_sound");
	self flag::clear("playing_stinger_fired_at_me");
}

/*
	Name: unlockfrontendmusic
	Namespace: audio
	Checksum: 0x3586EBD0
	Offset: 0xD58
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function unlockfrontendmusic(unlockname, allplayers)
{
}

/*
	Name: function_30d4f8c4
	Namespace: audio
	Checksum: 0x7F677B2E
	Offset: 0xD78
	Size: 0x144
	Parameters: 3
	Flags: None
*/
function function_30d4f8c4(attacker, smeansofdeath, weapon)
{
	str_alias = #"hash_4296e7b3cbb7f3de";
	var_90937e56 = function_bd53fa92(attacker, smeansofdeath, weapon);
	if(isdefined(var_90937e56))
	{
		if(var_90937e56 === #"explosive")
		{
			str_alias = #"hash_c43c0f6a63f7e0";
		}
		if(var_90937e56 === #"gas")
		{
			str_alias = #"hash_291958f59b6be82";
		}
		if(var_90937e56 === #"execution")
		{
			str_alias = #"hash_58d3709b34454b17";
		}
		if(var_90937e56 === #"bullet")
		{
			str_alias = #"hash_100370f52a9e0c99";
		}
	}
	if(weapon.name === #"hatchet")
	{
		str_alias = #"hash_55bb02aa30e19da8";
	}
	self playsoundtoplayer(str_alias, self);
}

/*
	Name: function_bd53fa92
	Namespace: audio
	Checksum: 0x9F8EFEF4
	Offset: 0xEC8
	Size: 0x148
	Parameters: 3
	Flags: Linked
*/
function function_bd53fa92(attacker, mod, weapon)
{
	if(isdefined(mod))
	{
		if(mod === "MOD_EXECUTION")
		{
			return #"execution";
		}
		if(mod === "MOD_EXPLOSIVE" || mod === "MOD_GRENADE" || mod === "MOD_GRENADE_SPLASH")
		{
			return #"explosive";
		}
		if(mod === "MOD_GAS")
		{
			return #"gas";
		}
		if(mod === "MOD_BULLET" || mod === "MOD_RIFLE_BULLET" || mod === "MOD_PISTOL_BULLET" || mod === "MOD_HEAD_SHOT")
		{
			return #"bullet";
		}
		if(mod === "MOD_SUICIDE")
		{
		}
	}
	else
	{
		if(isdefined(weapon))
		{
			if(weapon.name === "tear_gas")
			{
				return #"gas";
			}
		}
		return undefined;
	}
}

/*
	Name: function_641cec60
	Namespace: audio
	Checksum: 0x4834352
	Offset: 0x1018
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_641cec60(weapon)
{
	if(!isdefined(weapon))
	{
		return;
	}
	var_80de6af = 0;
	if(weapon.name == #"knife_loadout")
	{
		var_80de6af = 1;
	}
	return var_80de6af;
}

