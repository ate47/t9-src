#using script_1cc417743d7c262d;
#using scripts\core_common\bots\bot.gsc;
#using scripts\killstreaks\mp\killstreaks.gsc;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\_prop_controls.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\prop.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\spawnlogic.gsc;
#using scripts\mp_common\util.gsc;

#namespace _prop_dev;

/*
	Name: function_c4221711
	Namespace: _prop_dev
	Checksum: 0x30B10857
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c4221711()
{
	level notify(658326977);
}

#namespace prop_dev;

/*
	Name: adddevguicommand
	Namespace: prop_dev
	Checksum: 0x8CF7E011
	Offset: 0x118
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function adddevguicommand(path, var_c669188)
{
	/#
		pathstr = ("" + path) + "";
		cmdstr = ("" + var_c669188) + "";
		debugcommand = (("" + pathstr) + "") + cmdstr;
		adddebugcommand(debugcommand);
	#/
}

/*
	Name: function_93440c52
	Namespace: prop_dev
	Checksum: 0x78CA1207
	Offset: 0x1B8
	Size: 0x185E
	Parameters: 0
	Flags: None
*/
function function_93440c52()
{
	/#
		var_6631295a = 0;
		var_e68b7091 = 0;
		var_28c934a0 = 0;
		var_27e85424 = 0;
		var_e535ed97 = 0;
		var_f4098dd1 = 0;
		var_94dbbfd9 = 0;
		var_b948ae6c = 0;
		minigame_on = getdvarint(#"scr_prop_minigame", 1);
		server_hud = getdvarint(#"scr_ph_useprophudserver", 1);
		var_f6fe53f9 = getdvarfloat(#"player_swimdamage", 10);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 1);
		function_5ac4dc99("", 1);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		setdvar(#"hash_4424a07b5272599a", 0);
		setdvar(#"hash_34a3e2c00f7cd27f", 0);
		setdvar(#"hash_3fd977c7de8de72b", 0);
		setdvar(#"hash_5fea18fb5a6e0027", 0);
		setdvar(#"hash_69637702c083dc28", 0);
		setdvar(#"hash_2a03924a528ff9a8", 0);
		setdvar(#"hash_740b6f4a4aa58f21", 0);
		setdvar(#"hash_7115842bdfa67a2b", 0);
		if(getdvarint(#"hash_70c6c4a3e9254926", 0) != 0)
		{
			adddebugcommand("");
		}
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", ("" + 4) + "");
		adddevguicommand("", ("" + 0.25) + "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		adddevguicommand("", "");
		while(true)
		{
			if(is_true(level.prematch_over))
			{
				level.allow_teamchange = getdvarint(#"hash_7f436a7b31a003f3", 0);
				level.var_a7997034 = getdvarint(#"hash_4819c54cbad5ed87", 0) != 0;
			}
			if(getdvarint(#"scr_ph_useprophudserver", 0) != server_hud && isdefined(level.players))
			{
				server_hud = getdvarint(#"scr_ph_useprophudserver", 0);
				if(!isdefined(level.players[0].changepropkey))
				{
					iprintlnbold("");
				}
				else
				{
					foreach(player in level.players)
					{
						if(isdefined(player.team) && player util::isprop())
						{
							player prop_controls::propabilitykeysvisible(server_hud, 1);
						}
					}
					level.elim_hud.alpha = server_hud;
				}
			}
			if(getdvarint(#"hash_2c678eea20875ddd", 0) != var_28c934a0 && isdefined(level.players))
			{
				foreach(player in level.players)
				{
					if(player util::isprop())
					{
						var_28c934a0 = getdvarint(#"hash_2c678eea20875ddd", 0);
						player.var_f18a4260 = !is_true(player.var_f18a4260);
						player iprintlnbold((player.var_f18a4260 ? "" : ""));
					}
				}
			}
			if(getdvarint(#"hash_4aab269ba89e7cb6", 0) != var_27e85424 && isdefined(level.players))
			{
				foreach(player in level.players)
				{
					if(player util::isprop())
					{
						var_27e85424 = getdvarint(#"hash_4aab269ba89e7cb6", 0);
						player.var_7ddbf78d = !is_true(player.var_7ddbf78d);
						player iprintlnbold((player.var_7ddbf78d ? "" : ""));
					}
				}
			}
			if(getdvarint(#"hash_53ee83feb4db4606", 0) != var_e535ed97 && isdefined(level.players))
			{
				foreach(player in level.players)
				{
					if(player util::isprop())
					{
						var_e535ed97 = getdvarint(#"hash_53ee83feb4db4606", 0);
						player.var_d0e95c44 = !is_true(player.var_d0e95c44);
						player iprintlnbold((player.var_d0e95c44 ? "" : ""));
					}
				}
			}
			if(getdvarint(#"hash_62162f1f94cbba77", 0) != var_f4098dd1)
			{
				var_f4098dd1 = getdvarint(#"hash_62162f1f94cbba77", 0);
				if(var_f4098dd1)
				{
					setdvar(#"doublejump_time_before_recharge", 1);
					setdvar(#"doublejump_time_before_recharge_fast", 1);
					setdvar(#"playerenergy_restrate", 10000);
				}
				else
				{
					setdvar(#"doublejump_time_before_recharge", 1600);
					setdvar(#"doublejump_time_before_recharge_fast", 1000);
					setdvar(#"playerenergy_restrate", 400);
					iprintlnbold((var_f4098dd1 ? "" : ""));
				}
			}
			if(getdvarint(#"hash_618be616410fad95", 0) != var_94dbbfd9 && isdefined(level.players))
			{
				foreach(player in level.players)
				{
					if(player prop::function_84793f03())
					{
						var_94dbbfd9 = getdvarint(#"hash_618be616410fad95", 0);
						player.var_8df5658d = !is_true(player.var_8df5658d);
						player iprintlnbold((player.var_8df5658d ? "" : ""));
					}
				}
			}
			var_6271c461 = getdvarint(#"hash_21d7ba8da36d4023", 0);
			if(var_6271c461 != var_6631295a)
			{
				var_6631295a = var_6271c461;
				function_ad983215(!var_6271c461);
			}
			var_90cd8304 = getdvarint(#"hash_34a3e2c00f7cd27f", 0);
			if(var_90cd8304 != var_e68b7091)
			{
				var_e68b7091 = var_90cd8304;
				result = function_fd3c3ed0(var_90cd8304);
				if(!result)
				{
					var_e68b7091 = !var_90cd8304;
				}
				if(var_e68b7091)
				{
					level.drown_damage = 0;
				}
				else
				{
					level.drown_damage = var_f6fe53f9;
				}
			}
			if(getdvarint(#"hash_3fd977c7de8de72b", 0) != 0)
			{
				function_cb8ecc99();
				setdvar(#"hash_3fd977c7de8de72b", 0);
			}
			if(getdvarint(#"hash_5fea18fb5a6e0027", 0) != 0)
			{
				function_2b23b2b6();
				setdvar(#"hash_5fea18fb5a6e0027", 0);
			}
			if(getdvarint(#"hash_69637702c083dc28", 0) != 0)
			{
				function_f2e19297();
				setdvar(#"hash_69637702c083dc28", 0);
			}
			if(getdvarint(#"hash_7115842bdfa67a2b", 0) != 0)
			{
				if(isdefined(level.players) && isdefined(level.players[0]))
				{
					level thread prop::function_c4aeb146(#"score_last_alive", level.players[0]);
				}
				setdvar(#"hash_7115842bdfa67a2b", 0);
			}
			if(getdvarint(#"hash_34e9a7fac83d28a6", 0) != 0)
			{
				function_ad8cc361();
			}
			if(getdvarint(#"hash_7b2608d6176b79f4", 0))
			{
				function_38964c72();
			}
			if(getdvarint(#"hash_4424a07b5272599a", 0) != 0)
			{
				function_89b4b4c();
				setdvar(#"hash_4424a07b5272599a", 0);
			}
			if(getdvarint(#"hash_84008139ad85e21", 0) != 0)
			{
				if(isdefined(level.players) && isdefined(level.players[0]))
				{
					level.players[0] prop_controls::canlock();
				}
			}
			if(getdvarint(#"hash_2fa05819a4eeb99b", 0) != 0 || getdvarint(#"hash_84008139ad85e21", 0) != 0)
			{
				function_1f3923fa();
			}
			if(getdvarint(#"hash_2a03924a528ff9a8", 0) != 0)
			{
				function_5e0d41c4();
				setdvar(#"hash_2a03924a528ff9a8", 0);
			}
			if(getdvarint(#"hash_740b6f4a4aa58f21", 0) != 0)
			{
				function_5646cd5c();
				setdvar(#"hash_740b6f4a4aa58f21", 0);
			}
			if(getdvarint(#"hash_2441330d88677536", 0) != 0 && isdefined(level.players))
			{
				level notify(#"cancelcountdown");
				setdvar(#"hash_2441330d88677536", 0);
			}
			if(getdvarint(#"hash_7da18bcec6fafe7f", 0) != 0)
			{
				function_34a7562e();
			}
			if(getdvarint(#"hash_745b5ef88dd291e1", 0) != 0)
			{
				function_f06fb157();
			}
			if(getdvarint(#"hash_3c0e90252ca92099", 0) != 0)
			{
				showtargets();
			}
			if(getdvarint(#"scr_prop_minigame", 1) != minigame_on && isdefined(level.players) && level.players.size > 0)
			{
				minigame_on = getdvarint(#"scr_prop_minigame", 1);
				iprintlnbold((minigame_on ? "" : ""));
			}
			if(getdvarint(#"hash_6132db0becb8f98", 0) != var_b948ae6c && isdefined(level.players) && level.players.size > 0)
			{
				var_b948ae6c = getdvarint(#"hash_6132db0becb8f98", 0);
				if(var_b948ae6c == 2)
				{
					iprintlnbold("");
				}
				else
				{
					if(var_b948ae6c == 1)
					{
						iprintlnbold("");
					}
					else
					{
						iprintlnbold("");
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ad983215
	Namespace: prop_dev
	Checksum: 0x466D28B
	Offset: 0x1A20
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_ad983215(enabled)
{
	/#
		setdvar(#"com_statmon", enabled);
		setdvar(#"con_minicon", enabled);
		setdvar(#"cg_drawfps", enabled);
		setdvar(#"cg_drawtime", enabled);
		setdvar(#"hash_59587b459995b6eb", enabled);
		setdvar(#"hash_173fd7265ae0b7b1", enabled);
		setdvar(#"hash_2d3acd259cd6aca6", enabled);
	#/
}

/*
	Name: function_fd3c3ed0
	Namespace: prop_dev
	Checksum: 0x62438EE6
	Offset: 0x1B20
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_fd3c3ed0(enabled)
{
	/#
		if(!isdefined(level.players) || level.players.size == 0)
		{
			return false;
		}
		player = level.players[0];
		if(!isdefined(player) || !isalive(player) || isdefined(player.placementoffset) || !isdefined(player.prop))
		{
			return false;
		}
		if(enabled)
		{
			player function_673195f3();
		}
		else
		{
			player function_401f47cd();
		}
		return true;
	#/
}

/*
	Name: function_9cd2eb63
	Namespace: prop_dev
	Checksum: 0xE5EBB063
	Offset: 0x1C08
	Size: 0x76
	Parameters: 5
	Flags: None
*/
function function_9cd2eb63(color, label, value, text, var_e1fb743e)
{
	/#
		hudelem = prop_controls::addupperrighthudelem(label, value, text, var_e1fb743e);
		hudelem.alpha = 0.5;
		hudelem.color = color;
		return hudelem;
	#/
}

/*
	Name: function_673195f3
	Namespace: prop_dev
	Checksum: 0x5108DF96
	Offset: 0x1C88
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_673195f3()
{
	/#
		self prop_controls::cleanuppropcontrolshud();
		self prop_controls::function_1e25f968();
		if(self issplitscreen())
		{
			self.currenthudy = -10;
		}
		else
		{
			self.currenthudy = -80;
		}
		self.var_5f51d2ee = function_1eca597a(self.prop.info.modelname);
		white = (1, 1, 1);
		red = (1, 0, 0);
		green = (0, 1, 0);
		blue = (0, 0.5, 1);
		self.var_28df7051 = array(self.placementmodel, self.var_3634d14e, self.var_a2614669, self.var_5ee5df03, self.var_66df6677, self.var_ec9a93, self.var_811d1afa, self.var_d7336ed8, self.var_334e2710, self.var_faa235b5, self.var_35eb52f1, self.var_a2f59097);
		self.placementindex = 0;
		self function_8d3ffd86();
		self thread function_c3c92269();
		self thread function_4a5dac11();
		self thread function_1e509052();
	#/
}

/*
	Name: function_401f47cd
	Namespace: prop_dev
	Checksum: 0x253FE1
	Offset: 0x1E58
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function function_401f47cd()
{
	/#
		self notify(#"hash_3ecc0277d544b441");
		prop_controls::safedestroy(self.placementmodel);
		prop_controls::safedestroy(self.var_3634d14e);
		prop_controls::safedestroy(self.var_a2614669);
		prop_controls::safedestroy(self.var_5ee5df03);
		prop_controls::safedestroy(self.var_66df6677);
		prop_controls::safedestroy(self.var_ec9a93);
		prop_controls::safedestroy(self.var_811d1afa);
		prop_controls::safedestroy(self.var_d7336ed8);
		prop_controls::safedestroy(self.var_334e2710);
		prop_controls::safedestroy(self.var_faa235b5);
		prop_controls::safedestroy(self.var_35eb52f1);
		prop_controls::safedestroy(self.var_a2f59097);
		self function_cc5afb75();
		self prop_controls::propcontrolshud();
		self prop_controls::setupkeybindings();
	#/
}

/*
	Name: function_1e509052
	Namespace: prop_dev
	Checksum: 0xAE98AC8
	Offset: 0x1FE8
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_1e509052()
{
	/#
		self endon(#"game_ended", #"disconnect", #"hash_3ecc0277d544b441");
		self waittill(#"death");
		setdvar(#"hash_34a3e2c00f7cd27f", 0);
	#/
}

/*
	Name: function_c3c92269
	Namespace: prop_dev
	Checksum: 0xB3C47BA
	Offset: 0x2060
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_c3c92269()
{
	/#
		self endon(#"hash_3ecc0277d544b441");
		while(true)
		{
			debugaxis(self.origin, self.angles, 100, 1, 0, 1);
			box(self.origin, self getmins(), self getmaxs(), self.angles[1], (1, 0, 1), 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_4a5dac11
	Namespace: prop_dev
	Checksum: 0xBF6755E1
	Offset: 0x2118
	Size: 0x1A8
	Parameters: 0
	Flags: None
*/
function function_4a5dac11()
{
	/#
		self endon(#"hash_3ecc0277d544b441");
		self function_ea8e45a8(0);
		while(true)
		{
			waitresult = undefined;
			waitresult = self waittill(#"up", #"down", #"left", #"right", #"shot");
			msg = waitresult._notify;
			if(!isdefined(msg))
			{
				continue;
			}
			if(msg == "")
			{
				self function_92f23bcd(-1);
			}
			else
			{
				if(msg == "")
				{
					self function_92f23bcd(1);
				}
				else
				{
					if(msg == "")
					{
						self function_cdf89a29(1);
					}
					else
					{
						if(msg == "")
						{
							self function_cdf89a29(-1);
						}
						else if(msg == "")
						{
							function_77511c75();
						}
					}
				}
			}
		}
	#/
}

/*
	Name: function_92f23bcd
	Namespace: prop_dev
	Checksum: 0xE45874D0
	Offset: 0x22C8
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function function_92f23bcd(val)
{
	/#
		self endon(#"letgo");
		function_ea8e45a8(val);
		wait(0.5);
		while(true)
		{
			function_ea8e45a8(val);
			wait(0.05);
		}
	#/
}

/*
	Name: function_ea8e45a8
	Namespace: prop_dev
	Checksum: 0x54E1F1F7
	Offset: 0x2338
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_ea8e45a8(val)
{
	/#
		hudelem = self.var_28df7051[self.placementindex];
		hudelem.alpha = 0.5;
		hudelem.fontscale = 1;
		self.placementindex = self.placementindex + val;
		if(self.placementindex >= self.var_28df7051.size)
		{
			self.placementindex = 0;
		}
		else if(self.placementindex < 0)
		{
			self.placementindex = self.var_28df7051.size - 1;
		}
		hudelem = self.var_28df7051[self.placementindex];
		hudelem.alpha = 1;
		hudelem.fontscale = 1.3;
	#/
}

/*
	Name: function_cdf89a29
	Namespace: prop_dev
	Checksum: 0x40836B48
	Offset: 0x2420
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function function_cdf89a29(val)
{
	/#
		self endon(#"letgo");
		function_75154360(val);
		wait(0.05);
		while(true)
		{
			function_75154360(val);
			wait(0.05);
		}
	#/
}

/*
	Name: function_5ee4d3a8
	Namespace: prop_dev
	Checksum: 0x70FEAAB6
	Offset: 0x2490
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_5ee4d3a8(inval)
{
	/#
		tempindex = self.var_5f51d2ee + inval;
		if(tempindex >= level.propindex.size)
		{
			tempindex = 0;
		}
		else if(tempindex < 0)
		{
			tempindex = level.propindex.size - 1;
		}
		self.var_5f51d2ee = tempindex;
	#/
}

/*
	Name: function_1eca597a
	Namespace: prop_dev
	Checksum: 0x8541E5AE
	Offset: 0x2510
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function function_1eca597a(var_8ba3b403)
{
	/#
		for(index = 0; index < level.propindex.size; index++)
		{
			if(level.proplist[level.propindex[index][0]][level.propindex[index][1]].modelname == var_8ba3b403)
			{
				return index;
			}
		}
	#/
}

/*
	Name: function_75154360
	Namespace: prop_dev
	Checksum: 0x1BA580E2
	Offset: 0x25A0
	Size: 0xED4
	Parameters: 1
	Flags: None
*/
function function_75154360(val)
{
	/#
		hudelem = self.var_28df7051[self.placementindex];
		if(hudelem == self.placementmodel)
		{
			function_5ee4d3a8(val);
			self.prop.info = level.proplist[level.propindex[self.var_5f51d2ee][0]][level.propindex[self.var_5f51d2ee][1]];
			prop_controls::propchangeto(self.prop.info);
			self.placementmodel settext((("" + self.var_5f51d2ee) + "") + self.prop.info.modelname);
			self.var_3634d14e settext("" + self.prop.info.propsizetext);
			self.var_a2614669 setvalue(self.prop.info.propsize);
			self.var_5ee5df03 setvalue(self.prop.info.propscale);
			self.var_66df6677 setvalue(self.prop.info.xyzoffset[0]);
			self.var_ec9a93 setvalue(self.prop.info.xyzoffset[1]);
			self.var_811d1afa setvalue(self.prop.info.xyzoffset[2]);
			self.var_d7336ed8 setvalue(self.prop.info.anglesoffset[0]);
			self.var_334e2710 setvalue(self.prop.info.anglesoffset[1]);
			self.var_faa235b5 setvalue(self.prop.info.anglesoffset[2]);
			self.var_35eb52f1 setvalue(self.prop.info.propheight);
			self.var_a2f59097 setvalue(self.prop.info.proprange);
		}
		else
		{
			if(hudelem == self.var_3634d14e || hudelem == self.var_a2614669)
			{
				sizes = array("", "", "", "", "", "");
				index = 0;
				for(i = 0; i < sizes.size; i++)
				{
					if(sizes[i] == self.prop.info.propsizetext)
					{
						index = i;
						break;
					}
				}
				index = index + val;
				if(index < 0)
				{
					index = sizes.size - 1;
				}
				else if(index >= sizes.size)
				{
					index = 0;
				}
				self.prop.info.propsizetext = sizes[index];
				self.prop.info.propsize = prop::getpropsize(self.prop.info.propsizetext);
				self.var_3634d14e settext("" + self.prop.info.propsizetext);
				self.var_a2614669 setvalue(self.prop.info.propsize);
				self.health = self.prop.info.propsize;
				self.maxhealth = self.health;
			}
			else
			{
				if(hudelem == self.var_5ee5df03)
				{
					var_dfa19677 = 0.1;
					var_34b4cc47 = 10;
					var_59913b42 = 0.01;
					self.prop.info.propscale = self.prop.info.propscale + (var_59913b42 * val);
					self.prop.info.propscale = math::clamp(self.prop.info.propscale, var_dfa19677, var_34b4cc47);
					self.prop setscale(self.prop.info.propscale);
					self.var_5ee5df03 setvalue(self.prop.info.propscale);
				}
				else
				{
					if(hudelem == self.var_66df6677)
					{
						self.prop unlink();
						self.prop.info.xyzoffset = (self.prop.info.xyzoffset[0] + val, self.prop.info.xyzoffset[1], self.prop.info.xyzoffset[2]);
						self.prop.xyzoffset = self.prop.info.xyzoffset;
						self.var_66df6677 setvalue(self.prop.info.xyzoffset[0]);
						function_c2ab2206();
					}
					else
					{
						if(hudelem == self.var_ec9a93)
						{
							self.prop unlink();
							self.prop.info.xyzoffset = (self.prop.info.xyzoffset[0], self.prop.info.xyzoffset[1] + val, self.prop.info.xyzoffset[2]);
							self.prop.xyzoffset = self.prop.info.xyzoffset;
							self.var_ec9a93 setvalue(self.prop.info.xyzoffset[1]);
							function_c2ab2206();
						}
						else
						{
							if(hudelem == self.var_811d1afa)
							{
								self.prop unlink();
								self.prop.info.xyzoffset = (self.prop.info.xyzoffset[0], self.prop.info.xyzoffset[1], self.prop.info.xyzoffset[2] + val);
								self.prop.xyzoffset = self.prop.info.xyzoffset;
								self.var_811d1afa setvalue(self.prop.info.xyzoffset[2]);
								function_c2ab2206();
							}
							else
							{
								if(hudelem == self.var_d7336ed8)
								{
									self.prop unlink();
									self.prop.info.anglesoffset = (self.prop.info.anglesoffset[0] + val, self.prop.info.anglesoffset[1], self.prop.info.anglesoffset[2]);
									self.prop.anglesoffset = self.prop.info.anglesoffset;
									self.var_d7336ed8 setvalue(self.prop.info.anglesoffset[0]);
									function_c2ab2206();
								}
								else
								{
									if(hudelem == self.var_334e2710)
									{
										self.prop unlink();
										self.prop.info.anglesoffset = (self.prop.info.anglesoffset[0], self.prop.info.anglesoffset[1] + val, self.prop.info.anglesoffset[2]);
										self.prop.anglesoffset = self.prop.info.anglesoffset;
										self.var_334e2710 setvalue(self.prop.info.anglesoffset[1]);
										function_c2ab2206();
									}
									else
									{
										if(hudelem == self.var_faa235b5)
										{
											self.prop unlink();
											self.prop.info.anglesoffset = (self.prop.info.anglesoffset[0], self.prop.info.anglesoffset[1], self.prop.info.anglesoffset[2] + val);
											self.prop.anglesoffset = self.prop.info.anglesoffset;
											self.var_faa235b5 setvalue(self.prop.info.anglesoffset[2]);
											function_c2ab2206();
										}
										else
										{
											if(hudelem == self.var_35eb52f1)
											{
												adjust = 10;
												self.prop.info.propheight = self.prop.info.propheight + (adjust * val);
												self.prop.info.propheight = math::clamp(self.prop.info.propheight, -30, 40);
												self.thirdpersonheightoffset = self.prop.info.propheight;
												self setclientthirdperson(1);
												self.var_35eb52f1 setvalue(self.prop.info.propheight);
											}
											else if(hudelem == self.var_a2f59097)
											{
												adjust = 10;
												self.prop.info.proprange = self.prop.info.proprange + (adjust * val);
												self.prop.info.proprange = math::clamp(self.prop.info.proprange, 50, 360);
												self.thirdpersonrange = self.prop.info.proprange;
												self setclientthirdperson(1);
												self.var_a2f59097 setvalue(self.prop.info.proprange);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	#/
}

/*
	Name: function_c2ab2206
	Namespace: prop_dev
	Checksum: 0x82FAE659
	Offset: 0x3480
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_c2ab2206()
{
	/#
		self.prop.origin = self.propent.origin;
		self prop::applyxyzoffset();
		self prop::applyanglesoffset();
		self.prop linkto(self.propent);
	#/
}

/*
	Name: function_8d3ffd86
	Namespace: prop_dev
	Checksum: 0xCA398533
	Offset: 0x3500
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function function_8d3ffd86()
{
	/#
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
		self prop_controls::notifyonplayercommand("", "");
	#/
}

/*
	Name: function_cc5afb75
	Namespace: prop_dev
	Checksum: 0xB2D80FBE
	Offset: 0x36F0
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function function_cc5afb75()
{
	/#
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
		self prop_controls::notifyonplayercommandremove("", "");
	#/
}

/*
	Name: function_cbef3d63
	Namespace: prop_dev
	Checksum: 0xD1B145E
	Offset: 0x38E0
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_cbef3d63(vec)
{
	/#
		return isdefined(vec) && (vec[0] != 0 || vec[1] != 0 || vec[2] != 0);
	#/
}

/*
	Name: function_a840713e
	Namespace: prop_dev
	Checksum: 0x74231DE2
	Offset: 0x3938
	Size: 0x46
	Parameters: 1
	Flags: None
*/
function function_a840713e(propinfo)
{
	/#
		return isdefined(propinfo.propheight) && propinfo.propheight != prop::getthirdpersonheightoffsetforsize(propinfo.propsize);
	#/
}

/*
	Name: function_7a3672a6
	Namespace: prop_dev
	Checksum: 0xCA8358EB
	Offset: 0x3988
	Size: 0x46
	Parameters: 1
	Flags: None
*/
function function_7a3672a6(propinfo)
{
	/#
		return isdefined(propinfo.proprange) && propinfo.proprange != prop::getthirdpersonrangeforsize(propinfo.propsize);
	#/
}

/*
	Name: function_2dc5c497
	Namespace: prop_dev
	Checksum: 0xC8785608
	Offset: 0x39D8
	Size: 0x24C
	Parameters: 2
	Flags: None
*/
function function_2dc5c497(file, propinfo)
{
	/#
		var_74b91a95 = (((("" + propinfo.modelname) + "") + propinfo.propsizetext) + "") + propinfo.propscale;
		if(function_cbef3d63(propinfo.xyzoffset))
		{
			var_74b91a95 = var_74b91a95 + ((((("" + propinfo.xyzoffset[0]) + "") + propinfo.xyzoffset[1]) + "") + propinfo.xyzoffset[2]);
		}
		else
		{
			var_74b91a95 = var_74b91a95 + "";
		}
		if(function_cbef3d63(propinfo.anglesoffset))
		{
			var_74b91a95 = var_74b91a95 + ((((("" + propinfo.anglesoffset[0]) + "") + propinfo.anglesoffset[1]) + "") + propinfo.anglesoffset[2]);
		}
		else
		{
			var_74b91a95 = var_74b91a95 + "";
		}
		if(function_a840713e(propinfo))
		{
			var_74b91a95 = var_74b91a95 + ("" + propinfo.propheight);
		}
		else
		{
			var_74b91a95 = var_74b91a95 + ("" + prop::getthirdpersonheightoffsetforsize(propinfo.propsize));
		}
		if(function_7a3672a6(propinfo))
		{
			var_74b91a95 = var_74b91a95 + ("" + propinfo.proprange);
		}
		else
		{
			var_74b91a95 = var_74b91a95 + ("" + prop::getthirdpersonrangeforsize(propinfo.propsize));
		}
		fprintln(file, var_74b91a95);
	#/
}

/*
	Name: function_8639a7b0
	Namespace: prop_dev
	Checksum: 0x39A210AC
	Offset: 0x3C30
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_8639a7b0(file, propinfo)
{
	/#
		var_74b91a95 = ("" + propinfo.modelname) + "";
		fprintln(file, var_74b91a95);
	#/
}

/*
	Name: function_62b9b9ac
	Namespace: prop_dev
	Checksum: 0xF98FB457
	Offset: 0x3C90
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_62b9b9ac(file, propsizetext)
{
	/#
		foreach(var_8889f985 in level.proplist)
		{
			foreach(propinfo in var_8889f985)
			{
				if(propinfo.propsizetext == propsizetext)
				{
					function_2dc5c497(file, propinfo);
				}
			}
		}
	#/
}

/*
	Name: plaza_dom_point_neutral_b_secured
	Namespace: prop_dev
	Checksum: 0xE6999DDC
	Offset: 0x3DC0
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function plaza_dom_point_neutral_b_secured(file, propsizetext)
{
	/#
		foreach(var_8889f985 in level.proplist)
		{
			foreach(propinfo in var_8889f985)
			{
				if(propinfo.propsizetext == propsizetext)
				{
					function_8639a7b0(file, propinfo);
				}
			}
		}
	#/
}

/*
	Name: function_79d57521
	Namespace: prop_dev
	Checksum: 0x48688AAC
	Offset: 0x3EF0
	Size: 0x314
	Parameters: 2
	Flags: None
*/
function function_79d57521(file, var_7723a9cd)
{
	/#
		var_7e52c89c = var_7723a9cd + "";
		var_44c49e4e = var_7723a9cd + "";
		var_473e8b8d = var_7723a9cd + "";
		var_ca180226 = level.script + "";
		var_19494914 = level.script + "";
		var_155d523d = "";
		var_7770e500 = "";
		var_d6ade535 = "";
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, ("" + var_7e52c89c) + "");
		fprintln(file, ("" + var_44c49e4e) + "");
		fprintln(file, (("" + var_473e8b8d) + "") + var_155d523d);
		fprintln(file, (("" + var_7e52c89c) + "") + var_d6ade535);
		fprintln(file, (("" + var_44c49e4e) + "") + var_7770e500);
		fprintln(file, "");
		fprintln(file, (("" + var_ca180226) + "") + var_7723a9cd);
		fprintln(file, ((("" + var_19494914) + "") + var_44c49e4e) + "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
	#/
}

/*
	Name: function_cb8ecc99
	Namespace: prop_dev
	Checksum: 0xCD92A02D
	Offset: 0x4210
	Size: 0x3AC
	Parameters: 0
	Flags: None
*/
function function_cb8ecc99()
{
	/#
		platform = "";
		if(level.orbis)
		{
			platform = "";
		}
		else if(level.durango)
		{
			platform = "";
		}
		var_7723a9cd = level.script + "";
		var_7e52c89c = var_7723a9cd + "";
		var_b522696f = ("" + platform) + "";
		var_d6ade535 = "";
		file = openfile(var_7e52c89c, "");
		if(file == -1)
		{
			iprintlnbold((("" + var_b522696f) + var_7e52c89c) + "");
			println((("" + var_b522696f) + var_7e52c89c) + "");
			return;
		}
		function_79d57521(file, var_7723a9cd);
		fprintln(file, "");
		function_62b9b9ac(file, "");
		fprintln(file, "");
		fprintln(file, "");
		function_62b9b9ac(file, "");
		fprintln(file, "");
		fprintln(file, "");
		function_62b9b9ac(file, "");
		fprintln(file, "");
		fprintln(file, "");
		function_62b9b9ac(file, "");
		fprintln(file, "");
		fprintln(file, "");
		function_62b9b9ac(file, "");
		iprintlnbold(((("" + var_b522696f) + var_7e52c89c) + "") + var_d6ade535);
		println(((("" + var_b522696f) + var_7e52c89c) + "") + var_d6ade535);
		closefile(file);
	#/
}

/*
	Name: function_2b23b2b6
	Namespace: prop_dev
	Checksum: 0x8ABD050B
	Offset: 0x45C8
	Size: 0x394
	Parameters: 0
	Flags: None
*/
function function_2b23b2b6()
{
	/#
		platform = "";
		if(level.orbis)
		{
			platform = "";
		}
		else if(level.durango)
		{
			platform = "";
		}
		var_7723a9cd = level.script + "";
		var_7e52c89c = var_7723a9cd + "";
		var_b522696f = ("" + platform) + "";
		var_d6ade535 = "";
		file = openfile(var_7e52c89c, "");
		if(file == -1)
		{
			iprintlnbold((("" + var_b522696f) + var_7e52c89c) + "");
			println((("" + var_b522696f) + var_7e52c89c) + "");
			return;
		}
		fprintln(file, "");
		plaza_dom_point_neutral_b_secured(file, "");
		fprintln(file, "");
		fprintln(file, "");
		plaza_dom_point_neutral_b_secured(file, "");
		fprintln(file, "");
		fprintln(file, "");
		plaza_dom_point_neutral_b_secured(file, "");
		fprintln(file, "");
		fprintln(file, "");
		plaza_dom_point_neutral_b_secured(file, "");
		fprintln(file, "");
		fprintln(file, "");
		plaza_dom_point_neutral_b_secured(file, "");
		iprintlnbold(((("" + var_b522696f) + var_7e52c89c) + "") + var_d6ade535);
		println(((("" + var_b522696f) + var_7e52c89c) + "") + var_d6ade535);
		closefile(file);
	#/
}

/*
	Name: function_f2e19297
	Namespace: prop_dev
	Checksum: 0xA1070E86
	Offset: 0x4968
	Size: 0xC34
	Parameters: 0
	Flags: None
*/
function function_f2e19297()
{
	/#
		platform = "";
		if(level.orbis)
		{
			platform = "";
		}
		else if(level.durango)
		{
			platform = "";
		}
		var_7723a9cd = level.script + "";
		var_7e52c89c = var_7723a9cd + "";
		var_44c49e4e = var_7723a9cd + "";
		var_473e8b8d = var_7723a9cd + "";
		var_ca180226 = level.script + "";
		var_19494914 = level.script + "";
		var_b522696f = ("" + platform) + "";
		var_155d523d = "";
		var_7770e500 = "";
		var_d6ade535 = "";
		file = openfile(var_7e52c89c, "");
		if(file == -1)
		{
			iprintlnbold((("" + var_b522696f) + var_7e52c89c) + "");
			println((("" + var_b522696f) + var_7e52c89c) + "");
			return;
		}
		function_79d57521(file, var_7723a9cd);
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		closefile(file);
		file = openfile(var_44c49e4e, "");
		if(file == -1)
		{
			iprintlnbold((("" + var_b522696f) + var_44c49e4e) + "");
			println((("" + var_b522696f) + var_44c49e4e) + "");
			return;
		}
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		closefile(file);
		file = openfile(var_473e8b8d, "");
		if(file == -1)
		{
			iprintlnbold((("" + var_b522696f) + var_473e8b8d) + "");
			println((("" + var_b522696f) + var_473e8b8d) + "");
			return;
		}
		fprintln(file, "" + var_7e52c89c);
		fprintln(file, "" + var_44c49e4e);
		closefile(file);
		iprintlnbold("" + var_b522696f);
		println("" + var_b522696f);
	#/
}

/*
	Name: function_77511c75
	Namespace: prop_dev
	Checksum: 0x1906358
	Offset: 0x55A8
	Size: 0x35E
	Parameters: 0
	Flags: None
*/
function function_77511c75()
{
	/#
		player = level.players[0];
		if(!isdefined(player) || !isalive(player) || !is_true(player.hasspawned))
		{
			return;
		}
		if(isdefined(level.players[1]))
		{
			enemybot = level.players[1];
		}
		else
		{
			enemybot = bot::add_bot(util::getotherteam(player.team));
			enemybot.ignoreall = 1;
			enemybot bot::function_bab12815(enemybot.origin);
		}
		if(!isdefined(enemybot.pers[#"participation"]))
		{
			enemybot.pers[#"participation"] = 0;
		}
		if(!isdefined(enemybot.hits))
		{
			enemybot.hits = 0;
		}
		player.health = player.maxhealth;
		weapon = getweapon("");
		end = player.origin;
		dir = anglestoforward(player.angles);
		start = (end + (dir * 100)) + vectorscale((0, 0, 1), 30);
		magicbullet(weapon, start, end, enemybot);
		dirback = -1 * dir;
		start = (end + (dirback * 100)) + vectorscale((0, 0, 1), 30);
		magicbullet(weapon, start, end, enemybot);
		dirright = anglestoright(player.angles);
		start = (end + (dirright * 100)) + vectorscale((0, 0, 1), 30);
		magicbullet(weapon, start, end, enemybot);
		dirleft = -1 * dirright;
		start = (end + (dirleft * 100)) + vectorscale((0, 0, 1), 30);
		magicbullet(weapon, start, end, enemybot);
		start = end + vectorscale((0, 0, 1), 100);
		magicbullet(weapon, start, end, enemybot);
		player waittilltimeout(0.3, #"damage");
		wait(0.05);
		player.health = player.maxhealth;
	#/
}

/*
	Name: function_ad8cc361
	Namespace: prop_dev
	Checksum: 0x88638F42
	Offset: 0x5910
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_ad8cc361()
{
	/#
		if(!isdefined(level.players))
		{
			return;
		}
		foreach(player in level.players)
		{
			if(isdefined(player) && isdefined(player.team) && player.team == game.defenders)
			{
				print3d(player.origin + vectorscale((0, 0, 1), 50), "" + player.health);
			}
		}
	#/
}

/*
	Name: function_34a7562e
	Namespace: prop_dev
	Checksum: 0x1395DFD1
	Offset: 0x5A10
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_34a7562e()
{
	/#
		if(!isdefined(level.players))
		{
			return;
		}
		foreach(player in level.players)
		{
			velocity = player getvelocity();
			var_a79358cf = (velocity[0], velocity[1], 0);
			speed = length(var_a79358cf);
			print3d(player.origin + vectorscale((0, 0, 1), 50), "" + speed);
		}
	#/
}

/*
	Name: function_38964c72
	Namespace: prop_dev
	Checksum: 0x2E6EEC58
	Offset: 0x5B38
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_38964c72()
{
	/#
		if(!isdefined(level.players))
		{
			return;
		}
		foreach(player in level.players)
		{
			if(isdefined(player) && isdefined(player.prop))
			{
				player prop_controls::get_ground_normal(player.prop, 1);
			}
		}
	#/
}

/*
	Name: function_ed0598d
	Namespace: prop_dev
	Checksum: 0x2D88B842
	Offset: 0x5C08
	Size: 0x292
	Parameters: 3
	Flags: None
*/
function function_ed0598d(propinfo, origin, angles)
{
	/#
		propent = spawn("", origin);
		propent setcontents(0);
		propent notsolid();
		propent setplayercollision(0);
		prop = spawn("", propent.origin);
		prop.angles = angles;
		prop setmodel(propinfo.modelname);
		prop setscale(propinfo.propscale);
		prop setcandamage(1);
		prop.xyzoffset = propinfo.xyzoffset;
		prop.anglesoffset = propinfo.anglesoffset;
		prop.health = 1;
		prop setplayercollision(0);
		forward = anglestoforward(angles) * prop.xyzoffset[0];
		right = anglestoright(angles) * prop.xyzoffset[1];
		up = anglestoup(angles) * prop.xyzoffset[2];
		prop.origin = prop.origin + forward;
		prop.origin = prop.origin + right;
		prop.origin = prop.origin + up;
		prop.angles = prop.angles + prop.anglesoffset;
		prop linkto(propent);
		propent.prop = prop;
		propent.propinfo = propinfo;
		return propent;
	#/
}

/*
	Name: function_89b4b4c
	Namespace: prop_dev
	Checksum: 0xCA37D1B6
	Offset: 0x5EA8
	Size: 0x29C
	Parameters: 0
	Flags: None
*/
function function_89b4b4c()
{
	/#
		player = level.players[0];
		angles = player.angles;
		dir = anglestoforward(angles);
		startorigin = player.origin + vectorscale((0, 0, 1), 100);
		origin = startorigin;
		if(!isdefined(level.var_98714fa7))
		{
			level.var_98714fa7 = [];
			foreach(category in level.proplist)
			{
				foreach(propinfo in category)
				{
					level.var_98714fa7[level.var_98714fa7.size] = function_ed0598d(propinfo, origin, angles);
					origin = origin + (dir * 60);
				}
			}
		}
		else
		{
			level notify(#"hash_23283189fad4c217");
			foreach(propent in level.var_98714fa7)
			{
				propent.origin = origin;
				origin = origin + (dir * 60);
			}
		}
		level thread function_bd50e1aa(startorigin, dir, 60, level.var_98714fa7.size);
	#/
}

/*
	Name: function_bd50e1aa
	Namespace: prop_dev
	Checksum: 0xF015F154
	Offset: 0x6150
	Size: 0x13E
	Parameters: 4
	Flags: None
*/
function function_bd50e1aa(startorigin, fwd, var_54290641, var_aba10381)
{
	/#
		level endon(#"hash_23283189fad4c217");
		var_610d90b1 = fwd * var_54290641;
		left = (fwd[1] * -1, fwd[0], 0);
		leftoffset = left * var_54290641;
		var_64e61448 = (0, 0, 1) * var_54290641;
		while(true)
		{
			origin = startorigin;
			for(i = 0; i < var_aba10381; i++)
			{
				line(origin, origin + leftoffset, (0, 1, 0));
				line(origin, origin + var_64e61448, (0, 0, 1));
				origin = origin + var_610d90b1;
			}
			line(startorigin, origin, (1, 0, 0));
			waitframe(1);
		}
	#/
}

/*
	Name: function_1f3923fa
	Namespace: prop_dev
	Checksum: 0x1485328D
	Offset: 0x6298
	Size: 0x344
	Parameters: 0
	Flags: None
*/
function function_1f3923fa()
{
	/#
		if(!isdefined(level.var_f8f7808e))
		{
			return;
		}
		color = (0, 1, 0);
		if(!level.var_f8f7808e.success)
		{
			color = (1, 0, 0);
		}
		print3d(level.var_f8f7808e.playerorg + vectorscale((0, 0, 1), 50), level.var_f8f7808e.type);
		box(level.var_f8f7808e.playerorg, level.var_f8f7808e.playermins, level.var_f8f7808e.playermaxs, level.var_f8f7808e.playerangles[1], color);
		if(isdefined(level.var_f8f7808e.origin1))
		{
			sphere(level.var_f8f7808e.origin1, 5, color);
			line(level.var_f8f7808e.playerorg, level.var_f8f7808e.origin1);
			if(isdefined(level.var_f8f7808e.text1))
			{
				print3d(level.var_f8f7808e.origin1 + (vectorscale((0, 0, -1), 10)), level.var_f8f7808e.text1);
			}
		}
		if(isdefined(level.var_f8f7808e.origin2))
		{
			sphere(level.var_f8f7808e.origin2, 5, color);
			line(level.var_f8f7808e.playerorg, level.var_f8f7808e.origin2);
			if(isdefined(level.var_f8f7808e.text2))
			{
				print3d(level.var_f8f7808e.origin2 + vectorscale((0, 0, 1), 10), level.var_f8f7808e.text2);
			}
		}
		if(isdefined(level.var_f8f7808e.origin3))
		{
			sphere(level.var_f8f7808e.origin3, 5, color);
			line(level.var_f8f7808e.playerorg, level.var_f8f7808e.origin3);
			if(isdefined(level.var_f8f7808e.text3))
			{
				print3d(level.var_f8f7808e.origin3 + vectorscale((0, 0, 1), 30), level.var_f8f7808e.text3);
			}
		}
	#/
}

/*
	Name: function_cded003e
	Namespace: prop_dev
	Checksum: 0x290901E4
	Offset: 0x65E8
	Size: 0x15C
	Parameters: 4
	Flags: None
*/
function function_cded003e(propinfo, origin, angles, team)
{
	/#
		var_6e55957c = spawn("", origin);
		var_6e55957c.targetname = "";
		var_6e55957c setmodel(propinfo.modelname);
		var_6e55957c setscale(propinfo.propscale);
		var_6e55957c.angles = angles;
		var_6e55957c setcandamage(1);
		var_6e55957c.fakehealth = 50;
		var_6e55957c.health = 99999;
		var_6e55957c.maxhealth = 99999;
		var_6e55957c thread prop::function_aa8db165(&prop_controls::damageclonewatch);
		var_6e55957c setplayercollision(0);
		var_6e55957c makesentient();
		var_6e55957c setteam(team);
	#/
}

/*
	Name: function_5646cd5c
	Namespace: prop_dev
	Checksum: 0x4E081DD0
	Offset: 0x6750
	Size: 0x250
	Parameters: 0
	Flags: None
*/
function function_5646cd5c()
{
	/#
		player = level.players[0];
		angles = player.angles;
		dir = anglestoforward(angles);
		origin = player.origin + vectorscale((0, 0, 1), 100);
		if(isdefined(level.var_2ebdcb74))
		{
			foreach(clone in level.var_2ebdcb74)
			{
				clone prop_controls::function_d1a1cc8d();
			}
		}
		level.var_2ebdcb74 = [];
		foreach(category in level.proplist)
		{
			foreach(propinfo in category)
			{
				level.var_2ebdcb74[level.var_2ebdcb74.size] = function_cded003e(propinfo, origin, angles, util::getotherteam(player.team));
				origin = origin + (dir * 60);
			}
		}
	#/
}

/*
	Name: function_5e0d41c4
	Namespace: prop_dev
	Checksum: 0x995DE327
	Offset: 0x69A8
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_5e0d41c4()
{
	/#
		player = level.players[0];
		angles = player.angles;
		dir = anglestoforward(angles);
		origin = player.origin + (dir * vectorscale((0, 0, 1), 100));
		propinfo = prop::getnextprop(player);
		if(!isdefined(level.var_2ebdcb74))
		{
			level.var_2ebdcb74 = [];
		}
		level.var_2ebdcb74[level.var_2ebdcb74.size] = function_cded003e(propinfo, origin, angles, util::getotherteam(player.team));
	#/
}

/*
	Name: function_f06fb157
	Namespace: prop_dev
	Checksum: 0x51C86F38
	Offset: 0x6AB0
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_f06fb157()
{
	/#
		if(!isdefined(level.players))
		{
			return;
		}
		foreach(player in level.players)
		{
			box(player.origin, player getmins(), player getmaxs(), player.angles[1], (1, 0, 1), 1, 0, 1);
		}
	#/
}

/*
	Name: showtargets
	Namespace: prop_dev
	Checksum: 0x30ACEE3E
	Offset: 0x6BA0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function showtargets()
{
	/#
		if(!isdefined(level.var_1103f74e) || !isdefined(level.var_1103f74e.targets))
		{
			return;
		}
		for(i = 0; i < level.var_1103f74e.targets.size; i++)
		{
			target = level.var_1103f74e.targets[i];
			if(isdefined(target))
			{
				print3d(target.origin + vectorscale((0, 0, 1), 30), "" + target.fakehealth);
			}
		}
	#/
}

