#using script_113dd7f0ea2a1d4f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_score.gsc;

#namespace namespace_7eea54d0;

/*
	Name: init
	Namespace: namespace_7eea54d0
	Checksum: 0x7885BD48
	Offset: 0x90
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function init()
{
	callback::on_connect(&on_player_connect);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::on_ai_damage(&on_ai_damage);
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: on_player_connect
	Namespace: namespace_7eea54d0
	Checksum: 0x7AA397CE
	Offset: 0x120
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self.var_47eb9d8e = 0;
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_7eea54d0
	Checksum: 0x81B4B28A
	Offset: 0x138
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_10a4dd0a(s_params)
{
	var_a6762160 = s_params.item.var_a6762160;
	if(var_a6762160.itemtype === #"hash_910bf9605abbcea")
	{
		if(isplayer(self))
		{
			e_player = self;
		}
		else
		{
			e_player = s_params.player;
		}
		var_b25755cf = 50 * var_a6762160.amount;
		e_player thread function_d9365a20(var_b25755cf, 0);
	}
}

/*
	Name: on_ai_damage
	Namespace: namespace_7eea54d0
	Checksum: 0x8A9FD84
	Offset: 0x1F8
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function on_ai_damage(s_params)
{
	e_player = s_params.eattacker;
	if(!isplayer(e_player))
	{
		return;
	}
	if(!isdefined(self.var_d7d6cced))
	{
		self.var_d7d6cced = [];
	}
	else if(!isarray(self.var_d7d6cced))
	{
		self.var_d7d6cced = array(self.var_d7d6cced);
	}
	if(!isinarray(self.var_d7d6cced, e_player))
	{
		self.var_d7d6cced[self.var_d7d6cced.size] = e_player;
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_7eea54d0
	Checksum: 0x2A255F5B
	Offset: 0x2C0
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function on_ai_killed(s_params)
{
	e_player = s_params.eattacker;
	if(!isplayer(e_player))
	{
		return;
	}
	if(isdefined(level.var_138fad10))
	{
		var_b25755cf = self [[level.var_138fad10]](s_params);
	}
	if(!isdefined(var_b25755cf))
	{
		var_b25755cf = 10;
		if(self.var_9fde8624 === #"hash_7a778318514578f7" || self.var_9fde8624 === #"hash_622e7c9cc7c06c7")
		{
			var_b25755cf = 20;
		}
		else
		{
			switch(self.archetype)
			{
				case "avogadro":
				{
					var_b25755cf = 50;
					break;
				}
				case "raz":
				case "brutus":
				{
					var_b25755cf = 100;
					break;
				}
				case "mechz":
				case "blight_father":
				{
					var_b25755cf = 250;
					break;
				}
			}
		}
	}
	if(!isdefined(self.var_d7d6cced))
	{
		self.var_d7d6cced = [];
	}
	else if(!isarray(self.var_d7d6cced))
	{
		self.var_d7d6cced = array(self.var_d7d6cced);
	}
	if(!isinarray(self.var_d7d6cced, e_player))
	{
		self.var_d7d6cced[self.var_d7d6cced.size] = e_player;
	}
	arrayremovevalue(self.var_d7d6cced, undefined);
	if(var_b25755cf > 0)
	{
		array::thread_all(self.var_d7d6cced, &function_d9365a20, var_b25755cf, 0);
	}
}

/*
	Name: function_b121c9be
	Namespace: namespace_7eea54d0
	Checksum: 0xBC15CDA
	Offset: 0x4E8
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_b121c9be()
{
	return self.var_47eb9d8e;
}

/*
	Name: function_d9365a20
	Namespace: namespace_7eea54d0
	Checksum: 0x6DF249F4
	Offset: 0x500
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_d9365a20(var_b25755cf, var_86756f69)
{
	if(isdefined(self.var_47eb9d8e))
	{
		self.var_47eb9d8e = int(self.var_47eb9d8e + var_86756f69);
	}
	zm_score::add_to_player_score(var_86756f69);
}

/*
	Name: function_1efdfa9d
	Namespace: namespace_7eea54d0
	Checksum: 0xA1D3AA20
	Offset: 0x568
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_1efdfa9d(var_b25755cf)
{
	var_47eb9d8e = self.var_47eb9d8e - var_b25755cf;
	var_47eb9d8e = max(var_47eb9d8e, 0);
	self.var_47eb9d8e = int(var_47eb9d8e);
}

