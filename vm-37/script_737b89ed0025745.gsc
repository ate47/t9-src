#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;

#namespace namespace_12d19e59;

/*
	Name: function_89f2df9
	Namespace: namespace_12d19e59
	Checksum: 0x817D8003
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2d64f78469a542e9", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_12d19e59
	Checksum: 0x41F8B001
	Offset: 0xD0
	Size: 0x50
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_joined_team(&on_joined_team);
	callback::on_disconnect(&on_player_disconnect);
	level.var_8dcd4dc8 = [];
}

/*
	Name: on_joined_team
	Namespace: namespace_12d19e59
	Checksum: 0x37D11A2D
	Offset: 0x128
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function on_joined_team(params)
{
	if(!isdefined(level.var_8dcd4dc8))
	{
		return;
	}
	players = level.var_8dcd4dc8[self.team];
	if(!isarray(players))
	{
		if(!isdefined(players))
		{
			level.var_8dcd4dc8[self.team] = array(self);
		}
	}
	else
	{
		arrayinsert(players, self, randomint(players.size + 1));
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_12d19e59
	Checksum: 0x184A0188
	Offset: 0x1F0
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	if(!isdefined(level.var_8dcd4dc8))
	{
		return;
	}
	players = level.var_8dcd4dc8[self.team];
	if(getplayers(self.team).size <= 1)
	{
		level.var_8dcd4dc8[self.team] = [];
	}
	else if(isarray(players))
	{
		arrayremovevalue(players, self);
	}
}

/*
	Name: start
	Namespace: namespace_12d19e59
	Checksum: 0xF3DE8D55
	Offset: 0x298
	Size: 0x1D0
	Parameters: 0
	Flags: None
*/
function start()
{
	if(!isdefined(level.var_8dcd4dc8))
	{
		return;
	}
	if(level.maxteamplayers < 2)
	{
		return;
	}
	level endon(#"hash_6a4335e44b9a5086");
	globallogic::function_bf2901cf();
	lookup = function_bb3ec038();
	var_8dcd4dc8 = [];
	while(true)
	{
		foreach(team, players in level.var_8dcd4dc8)
		{
			if(isarray(players) && players.size > 1)
			{
				foreach(player in players)
				{
					if(isdefined(player) && player function_4d9b2d83(players, lookup))
					{
						level.var_8dcd4dc8[team] = 1;
						break;
					}
				}
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_bb3ec038
	Namespace: namespace_12d19e59
	Checksum: 0x9892A962
	Offset: 0x470
	Size: 0xFE
	Parameters: 0
	Flags: None
*/
function function_bb3ec038()
{
	lookup = [];
	var_f0b4da50 = tablelookuprowcount(#"hash_5ec1825aeab754a2");
	for(i = 0; i < var_f0b4da50; i++)
	{
		row = tablelookuprow(#"hash_5ec1825aeab754a2", i);
		player1 = row[0];
		player2 = row[1];
		if(!isdefined(lookup[player1]))
		{
			lookup[player1] = [];
		}
		var_1518f1fb = lookup[player1];
		if(!isdefined(var_1518f1fb[player2]))
		{
			var_1518f1fb[player2] = 0;
		}
		var_1518f1fb[player2]++;
	}
	return lookup;
}

/*
	Name: function_4d9b2d83
	Namespace: namespace_12d19e59
	Checksum: 0x7B93EE0C
	Offset: 0x578
	Size: 0x1D0
	Parameters: 2
	Flags: None
*/
function function_4d9b2d83(players, lookup)
{
	if(!self isonground())
	{
		return false;
	}
	assetname = self getmpdialogname();
	if(!isdefined(assetname))
	{
		return false;
	}
	var_1518f1fb = lookup[assetname];
	if(!isdefined(var_1518f1fb) || var_1518f1fb.size <= 0)
	{
		return false;
	}
	foreach(player in players)
	{
		if(!isdefined(player) || player == self || !player isonground() || distancesquared(self.origin, player.origin) > 1000000)
		{
			continue;
		}
		var_d8c635a4 = player getmpdialogname();
		if(!isdefined(var_d8c635a4))
		{
			continue;
		}
		var_a9f3e2d4 = var_1518f1fb[player getmpdialogname()];
		if(isdefined(var_a9f3e2d4))
		{
			self function_18aba49d(1, undefined, player);
			return true;
		}
	}
	return false;
}

/*
	Name: stop
	Namespace: namespace_12d19e59
	Checksum: 0xFEF2A1EE
	Offset: 0x750
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function stop()
{
	if(level.prematchperiod > 10)
	{
		wait(level.prematchperiod - 10);
	}
	level notify(#"hash_6a4335e44b9a5086");
	level.var_8dcd4dc8 = undefined;
}

