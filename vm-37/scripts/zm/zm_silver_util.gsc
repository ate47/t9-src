#using script_5bb072c3abf4652c;
#using script_64111d5c475f54c2;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;

#namespace namespace_2b924e50;

/*
	Name: init
	Namespace: namespace_2b924e50
	Checksum: 0x145F6902
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.zm_silver_hud = zm_silver_hud::register();
	/#
		level thread function_37597f29();
	#/
}

/*
	Name: function_30fe7a2
	Namespace: namespace_2b924e50
	Checksum: 0x5631934
	Offset: 0x120
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_30fe7a2()
{
	foreach(player in getplayers())
	{
		player thread function_2c918ed();
	}
}

/*
	Name: function_8fbe908e
	Namespace: namespace_2b924e50
	Checksum: 0xA937B30B
	Offset: 0x1B8
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_8fbe908e()
{
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player thread function_b9adea4e();
	}
}

/*
	Name: function_1aeb4889
	Namespace: namespace_2b924e50
	Checksum: 0x6BA38C23
	Offset: 0x260
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_1aeb4889()
{
	if(!level.zm_silver_hud zm_silver_hud::is_open(self))
	{
		level.zm_silver_hud zm_silver_hud::open(self);
	}
}

/*
	Name: close_hud
	Namespace: namespace_2b924e50
	Checksum: 0xE4E1F744
	Offset: 0x2B0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function close_hud()
{
	if(level.zm_silver_hud zm_silver_hud::is_open(self))
	{
		level.zm_silver_hud zm_silver_hud::close(self);
	}
}

/*
	Name: function_12995a01
	Namespace: namespace_2b924e50
	Checksum: 0xA53C9797
	Offset: 0x300
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_12995a01(status)
{
	self function_1aeb4889();
	level.zm_silver_hud zm_silver_hud::function_9efecfd1(self, status);
}

/*
	Name: function_2c918ed
	Namespace: namespace_2b924e50
	Checksum: 0x9AA0E4B5
	Offset: 0x350
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_2c918ed(n_display_time, str_waittill)
{
	self endon(#"death");
	self function_1aeb4889();
	level.zm_silver_hud zm_silver_hud::function_39ee9107(self, 1);
}

/*
	Name: function_b9adea4e
	Namespace: namespace_2b924e50
	Checksum: 0x5B6618FB
	Offset: 0x3B8
	Size: 0x206
	Parameters: 0
	Flags: Linked
*/
function function_b9adea4e()
{
	self notify("58e14372dca4219");
	self endon("58e14372dca4219");
	self endon(#"death");
	self function_1aeb4889();
	var_fc700937 = 0;
	var_573efcf5 = 0;
	while(true)
	{
		if(self flag::get(#"hash_7ef7aab6a305d0b0"))
		{
			self function_12995a01(3);
			if(!var_573efcf5)
			{
				self playsoundtoplayer(#"hash_361ed2e67423ebbb", self);
				self thread zm_vo::function_d6f8bbd9(#"hash_5fe32f7cc1d6606e", undefined, self);
				var_573efcf5 = 1;
			}
		}
		else
		{
			if(self flag::get(#"hash_1154242c9b1e4518"))
			{
				self function_12995a01(2);
				if(!var_fc700937)
				{
					self playsoundtoplayer(#"hash_361ed1e67423ea08", self);
					self thread zm_vo::function_d6f8bbd9(#"hash_2356723908acaf7b", undefined, self);
					var_fc700937 = 1;
				}
			}
			else
			{
				self playsoundtoplayer(#"hash_361ed4e67423ef21", self);
				self function_12995a01(1);
				var_fc700937 = 0;
				var_573efcf5 = 0;
			}
		}
		self waittill(#"hash_1154242c9b1e4518", #"hash_7ef7aab6a305d0b0");
	}
}

/*
	Name: function_3be9e71a
	Namespace: namespace_2b924e50
	Checksum: 0xD6AA55DF
	Offset: 0x5C8
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function function_3be9e71a()
{
	var_9463599a = spawncollision(#"hash_1d1c56a494aa468e", "collider", self.origin + vectorscale((0, 0, 1), 50), self.angles);
	var_9463599a setscale(2);
	return var_9463599a;
}

/*
	Name: function_cd16733
	Namespace: namespace_2b924e50
	Checksum: 0xEAC068C5
	Offset: 0x648
	Size: 0x30
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cd16733()
{
	if(isdefined(self.mdl_gameobject))
	{
		mdl_gameobject = self.mdl_gameobject;
	}
	else
	{
		mdl_gameobject = self;
	}
	return mdl_gameobject;
}

/*
	Name: function_ac49076a
	Namespace: namespace_2b924e50
	Checksum: 0x95B84EE9
	Offset: 0x680
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_ac49076a()
{
	mdl_gameobject = self function_cd16733();
	if(isdefined(mdl_gameobject))
	{
		mdl_gameobject gameobjects::enable_object(1, 1);
	}
}

/*
	Name: function_cc15b58a
	Namespace: namespace_2b924e50
	Checksum: 0x9D380EB2
	Offset: 0x6D8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_cc15b58a()
{
	mdl_gameobject = self function_cd16733();
	if(isdefined(mdl_gameobject))
	{
		mdl_gameobject gameobjects::disable_object(1, 1);
	}
}

/*
	Name: function_1194b9bc
	Namespace: namespace_2b924e50
	Checksum: 0x7EAC3AA
	Offset: 0x730
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_1194b9bc()
{
	mdl_gameobject = self function_cd16733();
	if(isdefined(mdl_gameobject))
	{
		mdl_gameobject thread gameobjects::destroy_object(1, 1);
	}
}

/*
	Name: function_e6830825
	Namespace: namespace_2b924e50
	Checksum: 0xC400CF96
	Offset: 0x788
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e6830825(player)
{
	if(isplayer(player))
	{
		player function_66337ef1(#"hash_a8e842ba4e72dc5");
		self.trigger setinvisibletoplayer(player);
	}
	self playsound(#"hash_8b8a9471179166a");
}

/*
	Name: function_834fd6bc
	Namespace: namespace_2b924e50
	Checksum: 0x50F016EC
	Offset: 0x810
	Size: 0x104
	Parameters: 3
	Flags: Linked
*/
function function_834fd6bc(team, player, success)
{
	if(isplayer(player))
	{
		player stoprumble(#"hash_a8e842ba4e72dc5");
		self.trigger setvisibletoplayer(player);
		if(is_true(success))
		{
			player function_bc82f900(#"hash_44eeee909d5a03fd");
		}
	}
	if(is_true(success))
	{
		self playsound(#"hash_6fefa7ed76b6836f");
	}
	else
	{
		self playsound(#"hash_454f385830b89f");
	}
}

/*
	Name: function_4cc5fca6
	Namespace: namespace_2b924e50
	Checksum: 0x9B776B74
	Offset: 0x920
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_4cc5fca6()
{
	level endon(#"end_game");
	level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 1);
	array::wait_till(function_a1ef346b(), "fasttravel_over", 15);
	level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 0);
}

/*
	Name: function_dd9482b7
	Namespace: namespace_2b924e50
	Checksum: 0x7953A539
	Offset: 0x9D8
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_dd9482b7(e_player)
{
	if(level flag::get(#"hash_3e765c26047c9f54") || level flag::get("in_exfil_event"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_37597f29
	Namespace: namespace_2b924e50
	Checksum: 0xF21E4088
	Offset: 0xA38
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_72c803d3);
	#/
}

/*
	Name: function_14a89247
	Namespace: namespace_2b924e50
	Checksum: 0xA20A5FBF
	Offset: 0xAF0
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_14a89247()
{
	/#
		foreach(player in function_a1ef346b())
		{
			level.zm_silver_hud zm_silver_hud::function_39ee9107(player, 0);
		}
		waitframe(1);
		function_30fe7a2();
	#/
}

/*
	Name: function_701cd5cf
	Namespace: namespace_2b924e50
	Checksum: 0x9A6CC572
	Offset: 0xBB8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_701cd5cf()
{
	/#
		function_8fbe908e();
	#/
}

/*
	Name: function_df4b3116
	Namespace: namespace_2b924e50
	Checksum: 0x6E414E04
	Offset: 0xBE0
	Size: 0x150
	Parameters: 2
	Flags: None
*/
function function_df4b3116(status, n_time)
{
	/#
		if(!isdefined(n_time))
		{
			n_time = 0;
		}
		a_players = function_a1ef346b();
		if(n_time)
		{
			foreach(player in a_players)
			{
				player thread flag::set_for_time(n_time, status);
			}
		}
		else
		{
			foreach(player in a_players)
			{
				player thread flag::toggle(status);
			}
		}
	#/
}

/*
	Name: function_72c803d3
	Namespace: namespace_2b924e50
	Checksum: 0x9AB68465
	Offset: 0xD38
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_72c803d3(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_bfe1136366775c6":
			{
				function_14a89247();
				break;
			}
			case "hash_385b6dd43dd64f63":
			{
				function_701cd5cf();
				break;
			}
			case "hash_61aa29debb64fda1":
			{
				function_df4b3116(#"hash_1154242c9b1e4518");
				break;
			}
			case "hash_61aa28debb64fbee":
			{
				function_df4b3116(#"hash_7ef7aab6a305d0b0", 2);
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

