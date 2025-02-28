#using script_14fed2239df479b1;
#using script_184abbae9afad370;
#using script_29ed825598140ca0;
#using script_35b5ff21c2a0960f;
#using script_43956600fe6c6be1;
#using script_4c6debf78dffeeaf;
#using script_6f416ed516b814a3;
#using script_79a7e1c31a3e8cc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_actor.gsc;
#using scripts\mp_common\gametypes\hostmigration.gsc;

#namespace callback;

/*
	Name: function_89f2df9
	Namespace: callback
	Checksum: 0xA5393C83
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"callback", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: callback
	Checksum: 0xC043ABED
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	set_default_callbacks();
}

/*
	Name: function_10006d25
	Namespace: callback
	Checksum: 0xFE90294C
	Offset: 0x138
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_10006d25(func, obj)
{
	if(self == level)
	{
		add_callback(#"hash_1303178bdaf337b5", func, obj);
	}
	else
	{
		function_d8abfc3d(#"hash_1303178bdaf337b5", func, obj);
	}
}

/*
	Name: function_c11071a8
	Namespace: callback
	Checksum: 0xBBCB25AE
	Offset: 0x1B0
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_c11071a8(func, obj)
{
	if(self == level)
	{
		add_callback(#"hash_61d33e99084dd46c", func, obj);
	}
	else
	{
		function_d8abfc3d(#"hash_61d33e99084dd46c", func, obj);
	}
}

/*
	Name: function_7117ff72
	Namespace: callback
	Checksum: 0xAE5E80EF
	Offset: 0x228
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_7117ff72(func, obj)
{
	add_callback(#"changed_specialist", func, obj);
}

/*
	Name: set_default_callbacks
	Namespace: callback
	Checksum: 0x70D04C07
	Offset: 0x270
	Size: 0x2CC
	Parameters: 0
	Flags: Linked
*/
function set_default_callbacks()
{
	level.callbackstartgametype = &globallogic::callback_startgametype;
	level.callbackplayerconnect = &player::callback_playerconnect;
	level.callbackplayerdisconnect = &player::callback_playerdisconnect;
	level.callbackplayerdamage = &player::callback_playerdamage;
	level.callbackplayerkilled = &player::callback_playerkilled;
	level.var_3a9881cb = &player::function_74b6d714;
	level.var_7509c7d8 = &player::function_452827de;
	level.callbackplayermelee = &player::callback_playermelee;
	level.callbackplayerlaststand = &player::callback_playerlaststand;
	level.callbackactorspawned = &globallogic_actor::callback_actorspawned;
	level.callbackactordamage = &globallogic_actor::callback_actordamage;
	level.callbackactorkilled = &globallogic_actor::callback_actorkilled;
	level.callbackactorcloned = &globallogic_actor::callback_actorcloned;
	level.var_6788bf11 = &namespace_e42b3e24::function_8c7ec52f;
	level.callbackvehiclespawned = &globallogic_vehicle::callback_vehiclespawned;
	level.callbackvehicledamage = &globallogic_vehicle::callback_vehicledamage;
	level.callbackvehiclekilled = &globallogic_vehicle::callback_vehiclekilled;
	level.callbackvehicleradiusdamage = &globallogic_vehicle::callback_vehicleradiusdamage;
	level.callbackplayermigrated = &player::callback_playermigrated;
	level.callbackhostmigration = &hostmigration::callback_hostmigration;
	level.callbackhostmigrationsave = &hostmigration::callback_hostmigrationsave;
	level.callbackprehostmigrationsave = &hostmigration::callback_prehostmigrationsave;
	level.var_69959686 = &deployable::function_209fda28;
	level.var_bb1ea3f1 = &deployable::function_84fa8d39;
	level.var_2f64d35 = &deployable::function_cf538621;
	level.var_523faa05 = &deployable::function_2750bb69;
	level.var_a28be0a5 = &globallogic::function_991daa12;
	level.var_bd0b5fc1 = &globallogic::function_ec7cf015;
	level._custom_weapon_damage_func = &callback_weapon_damage;
	level._gametype_default = "tdm";
}

