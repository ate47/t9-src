#using script_70a43d6ba27cff6a;
#using script_8988fdbc78d6c53;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace tracker;

/*
	Name: init_shared
	Namespace: tracker
	Checksum: 0xEB18BA4B
	Offset: 0xC0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	register_clientfields();
	level.var_f791a4f2 = spawnstruct();
	level.var_c8241070 = &function_c8241070;
	thread function_a7e7bda0();
	level.var_f791a4f2.var_ec00f4ac = [];
	callback::on_spawned(&onplayerspawned);
}

/*
	Name: register_clientfields
	Namespace: tracker
	Checksum: 0x8C7F8595
	Offset: 0x150
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function register_clientfields()
{
	clientfield::function_a8bbc967("huditems.isExposedOnMinimap", 1, 1, "int");
}

/*
	Name: onplayerspawned
	Namespace: tracker
	Checksum: 0xA9695A8C
	Offset: 0x188
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onplayerspawned()
{
	self clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 0);
}

/*
	Name: function_c8241070
	Namespace: tracker
	Checksum: 0xFD17F064
	Offset: 0x1B8
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_c8241070(player, weapon)
{
	level.var_f791a4f2.var_ec00f4ac[weapon.clientid] = gettime() + (float(getdvarint(#"hash_6f3f10e68d2fedba", 0)) / 1000);
}

/*
	Name: function_43084f6c
	Namespace: tracker
	Checksum: 0x2D7837AF
	Offset: 0x230
	Size: 0x1A2
	Parameters: 1
	Flags: None
*/
function function_43084f6c(player)
{
	if(level.teambased)
	{
		otherteam = util::getotherteam(player.team);
		foreach(var_f53fe24c in getplayers(otherteam))
		{
			if(var_f53fe24c function_d210981e(player.origin))
			{
				return true;
			}
		}
	}
	else
	{
		enemies = getplayers();
		foreach(enemy in enemies)
		{
			if(enemy == player)
			{
				continue;
			}
			if(enemy function_d210981e(player.origin))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_2c77961d
	Namespace: tracker
	Checksum: 0x5653159E
	Offset: 0x3E0
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_2c77961d(player)
{
	expiretime = level.var_f791a4f2.var_ec00f4ac[player.clientid];
	if(!isdefined(expiretime))
	{
		return false;
	}
	if(gettime() > expiretime)
	{
		return false;
	}
	return true;
}

/*
	Name: function_796e0334
	Namespace: tracker
	Checksum: 0x69178D35
	Offset: 0x440
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_796e0334(player)
{
	if(1 && globallogic_player::function_eddea888(player))
	{
		return true;
	}
	if(1 && globallogic_player::function_43084f6c(player))
	{
		return true;
	}
	if(1 && function_2c77961d(player))
	{
		return true;
	}
	if(1 && globallogic_player::function_ce33e204(player))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a7e7bda0
	Namespace: tracker
	Checksum: 0x973621C3
	Offset: 0x4F8
	Size: 0x1C0
	Parameters: 0
	Flags: None
*/
function function_a7e7bda0()
{
	if(getgametypesetting(#"hardcoremode"))
	{
		return;
	}
	while(true)
	{
		foreach(player in level.players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			if(!player hasperk(#"hash_82d803aeee9cafb"))
			{
				continue;
			}
			if(function_796e0334(player))
			{
				if(!isdefined(player.var_7241f6e3))
				{
					player.var_7241f6e3 = gettime() + 100;
				}
				if(player.var_7241f6e3 <= gettime())
				{
					player clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 1);
					player.var_99811216 = gettime() + 100;
				}
				continue;
			}
			if(isdefined(player.var_99811216) && gettime() > player.var_99811216 && player clientfield::get_player_uimodel("huditems.isExposedOnMinimap"))
			{
				player clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 0);
				player.var_7241f6e3 = undefined;
			}
		}
		wait(0.1);
	}
}

