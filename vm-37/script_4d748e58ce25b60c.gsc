#using script_164a456ce05c3483;
#using script_179d92c110788f71;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ce46999727f2f2b;
#using script_1ee011cd0961afd7;
#using script_2474a362752098d2;
#using script_256b8879317373de;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_4611af4073d18808;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_68cdf0ca5df5e;
#using script_6b6510e124bad778;
#using script_74a56359b7d02ab6;
#using script_774302f762d76254;
#using script_7bafaa95bb1b427e;
#using script_f38dc50f0e82277;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_b59ddbce;

/*
	Name: init
	Namespace: namespace_b59ddbce
	Checksum: 0xB613A670
	Offset: 0x668
	Size: 0x478
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("allplayers", "bombDrop", 1, 1, "int");
	clientfield::register("toplayer", "cutscene", 1, 2, "int");
	clientfield::register("toplayer", "controlBinding", 1, 4, "counter");
	clientfield::register("toplayer", "goFPS", 1, 1, "counter");
	clientfield::register("toplayer", "exitFPS", 1, 1, "counter");
	clientfield::register("world", "doafps", 1, 1, "int");
	clientfield::register("toplayer", "changeCamera", 1, 1, "counter");
	clientfield::register("toplayer", "resetCamera", 1, 1, "counter");
	clientfield::register("toplayer", "hardResetCamera", 1, 1, "counter");
	clientfield::register("toplayer", "lastStand", 1, 2, "int");
	clientfield::register("toplayer", "setCameraDown", 1, 5, "int");
	clientfield::register("toplayer", "setCameraSide", 1, 1, "int");
	clientfield::register("toplayer", "showMap", 1, 1, "int");
	clientfield::register("toplayer", "toggleflashlight", 1, 1, "int");
	clientfield::register("allplayers", "flipCamera", 1, 2, "int");
	level.var_73ffa220 = [];
	level.laststandweapon = getweapon(#"hash_317890e21bfe805b");
	level.doa.var_e09e5160 = 0;
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_disconnect(&on_player_disconnect);
	callback::add_callback(#"hash_4d2043b190b84792", &function_ef860973);
	callback::add_callback(#"hash_137b937fd26992be", &function_6fa41b21);
	if(isdefined(level.doa.var_cf250523))
	{
		level.callbackplayerkilled = level.doa.var_cf250523;
	}
	if(isdefined(level.doa.var_abe40be4))
	{
		level.callbackplayerdamage = level.doa.var_abe40be4;
	}
	if(isdefined(level.doa.var_cd10d20a))
	{
		level.callbackplayerlaststand = level.doa.var_cd10d20a;
	}
}

/*
	Name: function_ef860973
	Namespace: namespace_b59ddbce
	Checksum: 0xECC26496
	Offset: 0xAE8
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ef860973(params)
{
	if(isplayer(self))
	{
		self notify(#"hash_279998c5df86c04d");
		self notify(#"hash_7893364bd228d63e");
	}
}

/*
	Name: function_6fa41b21
	Namespace: namespace_b59ddbce
	Checksum: 0xE3126DA8
	Offset: 0xB38
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6fa41b21(params)
{
	if(isplayer(self))
	{
		self thread namespace_7f5aeb59::turnplayershieldon();
		self clientfield::increment_to_player("controlBinding");
	}
}

/*
	Name: function_591138a4
	Namespace: namespace_b59ddbce
	Checksum: 0x1D2AA173
	Offset: 0xBA0
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_591138a4()
{
	self notify("51c9e62e2c57f6ed");
	self endon("51c9e62e2c57f6ed");
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		if(getplayers().size == 1)
		{
			continue;
		}
		if(!isdefined(waitresult.menu))
		{
			continue;
		}
		if(!isdefined(waitresult.response))
		{
			continue;
		}
		if(waitresult.menu == #"startmenu_main")
		{
			if(waitresult.response == #"menu_opened")
			{
			}
			else
			{
			}
		}
	}
}

/*
	Name: function_2858dd5a
	Namespace: namespace_b59ddbce
	Checksum: 0x4DD2EBF5
	Offset: 0xCB0
	Size: 0x2B4
	Parameters: 0
	Flags: Linked
*/
function function_2858dd5a()
{
	self endon(#"disconnect");
	self freezecontrols(1);
	self.ignoreme = 1;
	while(!isdefined(self.doa))
	{
		waitframe(1);
	}
	self namespace_83eb6304::function_3ecfde67("remote_player_busy");
	/#
		printtoprightln((("" + gettime()) + "") + self getentitynumber(), (1, 1, 1));
	#/
	self lui::screen_fade_out(0);
	self namespace_ec06fe4a::function_a4b3f184(1);
	while(!is_true(self.var_736d81ba) || self isloadingcinematicplaying())
	{
		waitframe(1);
	}
	if(isdefined(level.var_73ffa220[self.name]))
	{
		self.var_90b81208 = level.var_73ffa220[self.name];
	}
	else
	{
		self.var_90b81208 = level.doa.roundnumber;
	}
	level.var_73ffa220[self.name] = self.var_90b81208;
	if(isdefined(level.var_9dab87f7))
	{
		self function_fc61ee02();
		self thread namespace_7f5aeb59::turnplayershieldon(0);
	}
	self clientfield::set_player_uimodel("closeLoadingMovie", 1);
	if(!isdefined(level.doa.var_ecff3871))
	{
		level.doa.var_ecff3871 = 0;
	}
	self function_a48eea2b(level.doa.var_ecff3871);
	self.is_ready = 1;
	self.ignoreme = 0;
	level.var_3fd55ae0++;
	util::wait_network_frame();
	self namespace_83eb6304::turnofffx("remote_player_busy");
	self thread function_cf969eb1();
}

/*
	Name: function_cf969eb1
	Namespace: namespace_b59ddbce
	Checksum: 0xB0A5FA46
	Offset: 0xF70
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_cf969eb1(timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 5;
	}
	self endon(#"disconnect");
	while(timeout > 0)
	{
		if(isdefined(self.var_d57eeb7f) && self.var_d57eeb7f == 0)
		{
			return;
		}
		wait(0.1);
		timeout = timeout - 0.1;
	}
	self namespace_83eb6304::turnofffx("remote_player_busy");
	if(isdefined(self.var_d57eeb7f) && self.var_d57eeb7f > 0)
	{
		self thread namespace_7f5aeb59::function_96c20925(3);
	}
	self.var_c2fe0818 = 1;
	if(!isdefined(level.var_9dab87f7) && getplayers().size > 1 && level.var_3fd55ae0 != level.var_5c6783e9)
	{
		level namespace_a6ddb172::function_7a0e5387(48);
		level.var_65efe052 = 1;
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_b59ddbce
	Checksum: 0xCABB2622
	Offset: 0x10C8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.var_f5602976 = gettime();
	self setclientminiscoreboardhide(1);
	self thread function_2858dd5a();
	self thread function_591138a4();
}

/*
	Name: on_player_spawned
	Namespace: namespace_b59ddbce
	Checksum: 0x208A3D20
	Offset: 0x1128
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self namespace_7f5aeb59::function_f3143608();
	if(isdefined(level.doa.var_16a35e94))
	{
		self thread [[level.doa.var_16a35e94]]();
	}
	if(isdefined(level.doa.var_4e554b79))
	{
		spot = [[level.doa.var_4e554b79]](self.entnum);
		if(isdefined(spot))
		{
			self setorigin(spot.origin);
			self setplayerangles(spot.angles);
		}
	}
	self thread function_eef0e695();
	self notify(#"stop_player_monitor_travel_dist");
	self.var_736d81ba = 1;
}

/*
	Name: function_fc61ee02
	Namespace: namespace_b59ddbce
	Checksum: 0xF25B397C
	Offset: 0x1258
	Size: 0x1E6
	Parameters: 0
	Flags: Linked
*/
function function_fc61ee02()
{
	self endon(#"disconnect");
	if(level.doa.roundnumber > 4)
	{
		self.doa.score.lives = 0;
		self.doa.score.bombs = 1;
		self.doa.score.var_7a3c00a0 = 1;
	}
	if(isbot(self))
	{
		return;
	}
	self.var_fcb4914a = 1;
	/#
		assert(level.doa.world_state == 0, "");
	#/
	while(!isdefined(level.doa.var_39e3fa99))
	{
		waitframe(1);
	}
	spot = [[ level.doa.var_39e3fa99 ]]->function_fc81ec00(self getentitynumber());
	self setorigin(spot.origin);
	self setplayerangles(spot.angles);
	self function_a48eea2b(level.doa.var_ecff3871);
	wait(1);
	self function_a48eea2b(level.doa.var_ecff3871);
	self thread namespace_7f5aeb59::function_96c20925();
	self.var_fcb4914a = undefined;
}

/*
	Name: function_eef0e695
	Namespace: namespace_b59ddbce
	Checksum: 0xC479A306
	Offset: 0x1448
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_eef0e695()
{
	self notify("62fe79b7d3ca1c9c");
	self endon("62fe79b7d3ca1c9c");
	self endon(#"disconnect");
	self thread namespace_7f5aeb59::function_d690f109();
	wait(10);
	self thread namespace_7f5aeb59::function_d690f109();
	wait(10);
	self thread namespace_7f5aeb59::function_d690f109();
}

/*
	Name: on_player_disconnect
	Namespace: namespace_b59ddbce
	Checksum: 0xF202993C
	Offset: 0x14C8
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	if(isdefined(self.doa.score.var_d252ca7f))
	{
		level clientfield::set_world_uimodel(self.doa.score.var_d252ca7f, 0);
	}
	if(isdefined(self.doa))
	{
		self.doa.score = undefined;
		self.doa = undefined;
	}
}

/*
	Name: main
	Namespace: namespace_b59ddbce
	Checksum: 0x54CD9C1A
	Offset: 0x1540
	Size: 0x3B0
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level endon(#"game_over");
	level waittill(#"hash_671684f03a58b3a3");
	foreach(player in namespace_7f5aeb59::function_23e1f90f())
	{
		player namespace_7f5aeb59::function_513831e1(1);
		player clientfield::increment_to_player("controlBinding");
		player clientfield::increment_to_player("hardResetCamera");
		player namespace_eccff4fb::function_c05eb7e6();
	}
	while(true)
	{
		waitframe(1);
		players = level.players;
		curcount = players.size;
		if(curcount != level.doa.var_e09e5160)
		{
			/#
				namespace_1e25ad94::debugmsg("" + curcount);
			#/
		}
		level.doa.var_e09e5160 = curcount;
		aliveplayers = 0;
		var_e4ab372a = gettime();
		foreach(player in players)
		{
			if(!namespace_7f5aeb59::isplayervalid(player))
			{
				continue;
			}
			if(!is_true(player.laststand) || player.doa.score.lives > 0 || is_true(player.var_4a81243b))
			{
				aliveplayers++;
			}
			player namespace_6e90e490::function_7f7a069d();
			player namespace_eccff4fb::function_7752515d();
			player namespace_41cb996::updateweapon();
			if(player.birthtime + 500 > var_e4ab372a)
			{
				continue;
			}
			if(!is_true(player.laststand))
			{
				player function_7310b24f();
				player doa_pickups::function_d936944a();
				player doa_pickups::function_cbae9ca3();
			}
		}
		if(aliveplayers == 0)
		{
			if(isdefined(level.doa.var_abd5eb1e))
			{
				[[level.doa.var_abd5eb1e]]();
			}
		}
	}
}

/*
	Name: function_7310b24f
	Namespace: namespace_b59ddbce
	Checksum: 0x404A40A5
	Offset: 0x18F8
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function function_7310b24f()
{
	if(isdefined(level.var_ec5aa760))
	{
		self [[level.var_ec5aa760]]();
	}
	if(is_true(self.doa.var_a5eb0385))
	{
		return;
	}
	if(self hasdobj() == 0)
	{
		return;
	}
	self function_ba8327d7();
	self function_56544e8b();
	self function_cf940b05();
	self function_74ba13d0();
	self function_902013ca();
	self function_a8cdc084();
	self function_23c07f29();
	self function_ffc15733();
}

/*
	Name: function_ffc15733
	Namespace: namespace_b59ddbce
	Checksum: 0xDBD0E57D
	Offset: 0x1A30
	Size: 0x1C6
	Parameters: 0
	Flags: Linked
*/
function function_ffc15733()
{
	if(!isdefined(self.doa))
	{
		return;
	}
	if(is_true(self.doa.var_42bbe20))
	{
		return;
	}
	if(isdefined(level.doa.var_a77e6349))
	{
		if(!is_true(self.doa.var_381a0f4e))
		{
			if(self actionslotfourbuttonpressed() || self buttonbitstate("BUTTON_BIT_CAMERA_SIDE"))
			{
				self.doa.var_381a0f4e = 1;
			}
		}
		if(isdefined(self.tweakcam) || is_true(level.doa.var_a3e53b88) || is_true(level.doa.var_af74d0b))
		{
			self.doa.var_381a0f4e = 0;
		}
		if(is_true(self.doa.var_381a0f4e))
		{
			if(!self actionslotfourbuttonpressed() && !self buttonbitstate("BUTTON_BIT_CAMERA_SIDE"))
			{
				self thread function_a48eea2b(!self.doa.var_d748ac3f);
				self.doa.var_381a0f4e = 0;
			}
		}
	}
}

/*
	Name: function_a48eea2b
	Namespace: namespace_b59ddbce
	Checksum: 0x5ADAC271
	Offset: 0x1C00
	Size: 0x1DA
	Parameters: 2
	Flags: Linked
*/
function function_a48eea2b(yaw, reset)
{
	if(!isdefined(yaw))
	{
		yaw = 0;
	}
	if(!isdefined(reset))
	{
		reset = 0;
	}
	self endon(#"disconnect");
	/#
		assert(isplayer(self));
	#/
	/#
		assert(yaw == 0 || yaw == 1);
	#/
	self.doa.var_42bbe20 = 1;
	if(reset)
	{
		self clientfield::set("flipCamera", 2);
		self function_9aabf044(0);
		self.doa.var_d748ac3f = 0;
	}
	else
	{
		if(yaw == 0)
		{
			self.doa.var_d748ac3f = yaw;
			self function_9aabf044(0);
			self clientfield::set("flipCamera", 0);
		}
		else if(yaw == 1)
		{
			self.doa.var_d748ac3f = yaw;
			self function_9aabf044(1);
			self clientfield::set("flipCamera", 1);
		}
	}
	util::wait_network_frame();
	self.doa.var_42bbe20 = undefined;
}

/*
	Name: function_a8cdc084
	Namespace: namespace_b59ddbce
	Checksum: 0x7FCFE227
	Offset: 0x1DE8
	Size: 0x18E
	Parameters: 0
	Flags: Linked
*/
function function_a8cdc084()
{
	if(!isdefined(self.doa))
	{
		return;
	}
	if(is_true(level.doa.var_a3e53b88) || (self actionslottwobuttonpressed() || self buttonbitstate("BUTTON_BIT_MAP") && !is_true(self.doa.var_9ca03c2f)))
	{
		self clientfield::set_to_player("showMap", 1);
		self.doa.var_9ca03c2f = 1;
	}
	if(!is_true(level.doa.var_a3e53b88) && (!self actionslottwobuttonpressed() && !self buttonbitstate("BUTTON_BIT_MAP") && is_true(self.doa.var_9ca03c2f)))
	{
		self clientfield::set_to_player("showMap", 0);
		self.doa.var_9ca03c2f = 0;
	}
}

/*
	Name: function_23c07f29
	Namespace: namespace_b59ddbce
	Checksum: 0x27DB99FF
	Offset: 0x1F80
	Size: 0x18E
	Parameters: 0
	Flags: Linked
*/
function function_23c07f29()
{
	if(!isdefined(self.doa) || !is_true(self.doa.var_82fb5d17))
	{
		return;
	}
	if(is_true(self.doa.var_11cd9fd3))
	{
		if(self actionslotthreebuttonpressed() || self buttonbitstate("BUTTON_BIT_FLASHLIGHT"))
		{
			return;
		}
		self.doa.var_11cd9fd3 = undefined;
	}
	if(self actionslotthreebuttonpressed() || self buttonbitstate("BUTTON_BIT_FLASHLIGHT"))
	{
		self.doa.var_11cd9fd3 = 1;
		self.doa.var_56fdd2fe = 1;
	}
	else
	{
		if(is_true(self.doa.var_56fdd2fe))
		{
			self.doa.var_f583234e = !self.doa.var_f583234e;
			self clientfield::set_to_player("toggleflashlight", self.doa.var_f583234e);
		}
		self.doa.var_56fdd2fe = 0;
	}
}

/*
	Name: function_902013ca
	Namespace: namespace_b59ddbce
	Checksum: 0x5B8D5107
	Offset: 0x2118
	Size: 0x27E
	Parameters: 0
	Flags: Linked
*/
function function_902013ca()
{
	if(!isdefined(self.doa) || gettime() < self.doa.var_99c6ee47)
	{
		return;
	}
	if(is_true(self.doa.var_a8d9dfbe))
	{
		if(self actionslotonebuttonpressed() || self buttonbitstate("BUTTON_BIT_DONATE_LIFE"))
		{
			return;
		}
		self.doa.var_a8d9dfbe = undefined;
	}
	if(self actionslotonebuttonpressed() || self buttonbitstate("BUTTON_BIT_DONATE_LIFE"))
	{
		self.doa.var_a8d9dfbe = 1;
		self.doa.var_f8fd8e97 = 1;
	}
	else
	{
		if(self.doa.score.lives >= 1 && is_true(self.doa.var_f8fd8e97))
		{
			players = arraysortclosest(namespace_7f5aeb59::function_23e1f90f(), self.origin);
			foreach(player in players)
			{
				if(self === player)
				{
					continue;
				}
				if(!is_true(player.laststand))
				{
					continue;
				}
				if(player.doa.score.lives > 0)
				{
					continue;
				}
				self.doa.var_99c6ee47 = gettime() + 2000;
				self thread givealifetoplayer(player);
				break;
			}
		}
		self.doa.var_f8fd8e97 = 0;
	}
}

/*
	Name: givealifetoplayer
	Namespace: namespace_b59ddbce
	Checksum: 0x9A19A299
	Offset: 0x23A0
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function givealifetoplayer(target)
{
	if(self.doa.score.lives > 0)
	{
		self.doa.score.lives--;
		self namespace_e32bb68::function_3a59ec34("hallelujah");
		self thread function_cdcf0e57();
		self thread namespace_7f5aeb59::turnplayershieldon();
		model = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_extra_life", self.angles, "giveALifeToPlayer");
		if(isdefined(model))
		{
			model thread namespace_83eb6304::function_3ecfde67("player_trail_" + self.doa.color);
			model thread namespace_83eb6304::function_3ecfde67("glow_" + self.doa.color);
			distsq = distancesquared(target.origin, self.origin);
			time = mapfloat(0, sqr(1000), 0.25, 1, distsq);
			model moveto(target.origin, time);
			wait(time);
			model delete();
		}
		if(isdefined(target))
		{
			target.doa.score.lives++;
			target namespace_7f5aeb59::function_513831e1();
			if(self doa_fate::function_b01c3b20())
			{
				target thread function_cdcf0e57(50);
			}
		}
	}
}

/*
	Name: function_cdcf0e57
	Namespace: namespace_b59ddbce
	Checksum: 0xC963B238
	Offset: 0x25E8
	Size: 0x4EC
	Parameters: 1
	Flags: Linked
*/
function function_cdcf0e57(range)
{
	if(!isdefined(range))
	{
		range = 100;
	}
	self endon(#"disconnect");
	roll = randomint(range);
	if(roll == 99)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_extra_life"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
	}
	if(roll > 92)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
	}
	if(roll > 78)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
	}
	if(roll > 58)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_chicken"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_chicken"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
	}
	if(roll > 35)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_sawblade"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_sawblade"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
	}
	if(roll > 15)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boxing_glove"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_magnet"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
	}
	level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_ammo"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
	wait(0.5);
	level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_ammo"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
	wait(0.5);
	level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_ammo"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
	wait(0.5);
	if(roll == 0)
	{
		level thread doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_skeleton_key"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
	}
}

/*
	Name: function_cf940b05
	Namespace: namespace_b59ddbce
	Checksum: 0xDB9650FD
	Offset: 0x2AE0
	Size: 0x212
	Parameters: 0
	Flags: Linked
*/
function function_cf940b05()
{
	if(is_true(level.var_7dcdbe16))
	{
		return;
	}
	if(is_true(self.doa.var_4f3aee7b))
	{
		return;
	}
	if(isdefined(self.doa.vehicle))
	{
		if(is_true(self.doa.var_7a27ee1b))
		{
			if(self function_e01d381a())
			{
				return;
			}
			self.doa.var_7a27ee1b = undefined;
		}
		if(self function_e01d381a())
		{
			self clientfield::increment_to_player("changeCamera");
			self notify(#"hash_444e9c51ba5bd99");
			self.doa.var_7a27ee1b = 1;
		}
	}
	else
	{
		if(is_true(self.doa.var_7a27ee1b))
		{
			if(self weaponswitchbuttonpressed() || self buttonbitstate("BUTTON_BIT_WEAPNEXT"))
			{
				return;
			}
			self.doa.var_7a27ee1b = undefined;
		}
		if(self weaponswitchbuttonpressed() || self buttonbitstate("BUTTON_BIT_WEAPNEXT"))
		{
			if(!is_true(self.doa.var_3e81d24c))
			{
				self clientfield::increment_to_player("changeCamera");
			}
			self notify(#"hash_444e9c51ba5bd99");
			self.doa.var_7a27ee1b = 1;
		}
	}
}

/*
	Name: function_74ba13d0
	Namespace: namespace_b59ddbce
	Checksum: 0x8B26473D
	Offset: 0x2D00
	Size: 0x112
	Parameters: 0
	Flags: Linked
*/
function function_74ba13d0()
{
	if(is_true(level.var_babb5873))
	{
		return;
	}
	if(self namespace_491fa2b2::function_8f5419f1())
	{
		return;
	}
	if(self usebuttonpressed())
	{
		self.doa.var_9d136ff8 = 1;
		return;
	}
	if(is_true(self.doa.var_9d136ff8))
	{
		if(is_true(self.doa.var_af53a5b7))
		{
			self.doa.var_9d136ff8 = undefined;
			self.doa.var_af53a5b7 = undefined;
			return;
		}
		if(isdefined(self.doa.vehicle))
		{
			self notify(#"hash_279998c5df86c04d");
		}
		else
		{
			self namespace_41cb996::function_8b7acf56();
		}
		self.doa.var_9d136ff8 = undefined;
	}
}

/*
	Name: function_ba8327d7
	Namespace: namespace_b59ddbce
	Checksum: 0x85F99CB9
	Offset: 0x2E20
	Size: 0x564
	Parameters: 0
	Flags: Linked
*/
function function_ba8327d7()
{
	if(is_true(level.var_e1857dc3))
	{
		return;
	}
	if(isdefined(self.doa.vehicle))
	{
		return;
	}
	if(is_true(self.doa.var_9049062))
	{
		return;
	}
	if(is_true(self.doa.var_c026f7c9))
	{
		time = gettime();
		if(time < self.doa.var_fdc612e3)
		{
			self setvelocity(self.doa.var_b7001078);
			namespace_1e25ad94::debugmsg(("Player(" + self.doa.color) + ") BOOSTING active");
			if(self.doa.var_c0f32380 < time)
			{
				level notify(#"hash_50be6fd0db982086", {#origin:self.origin});
				self.doa.var_c0f32380 = time + 250;
			}
			return;
		}
		self.doa.var_c026f7c9 = 0;
		self thread namespace_7f5aeb59::turnplayershieldon();
		if(isdefined(self.doa.boosttrigger))
		{
			self.doa.boosttrigger delete();
		}
		namespace_1e25ad94::debugmsg(("Player(" + self.doa.color) + ") BOOSTING deactivating");
	}
	if(is_true(self.doa.var_48d0af86))
	{
		if(self secondaryoffhandbuttonpressed())
		{
			return;
		}
		self.doa.var_48d0af86 = undefined;
	}
	if(self secondaryoffhandbuttonpressed() || is_true(self.doa.var_d524abd8))
	{
		self.doa.var_d524abd8 = 0;
		self.doa.var_48d0af86 = 1;
		if(self.doa.score.var_7a3c00a0 > 0)
		{
			self.doa.var_c026f7c9 = 1;
			self.doa.score.var_7a3c00a0--;
			self thread namespace_7f5aeb59::turnplayershieldon();
			forward = anglestoforward(self.angles);
			self namespace_e32bb68::function_3a59ec34("evt_doa_powerup_boost_activate");
			self.doa.boosttrigger = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, (1 | 512) | 8, 80, 72);
			if(isdefined(self.doa.boosttrigger))
			{
				self.doa.boosttrigger.targetname = "triggerBoost";
				self.doa.boosttrigger enablelinkto();
				self.doa.boosttrigger linkto(self, "tag_origin", vectorscale((1, 0, 0), 200), self.angles);
				self.doa.boosttrigger thread namespace_7f5aeb59::shield_trigger_think(self, undefined, undefined, 1);
				self.doa.boosttrigger thread namespace_ec06fe4a::function_ae010bb4(self);
				self.doa.boosttrigger thread namespace_ec06fe4a::function_52afe5df(0.3);
			}
			self.doa.var_fdc612e3 = gettime() + 300;
			self.doa.var_b7001078 = forward * 2000;
			self.doa.var_b7001078 = self.doa.var_b7001078 + vectorscale((0, 0, 1), 200);
			self setvelocity(self.doa.var_b7001078);
			self.doa.var_b7001078 = self.doa.var_b7001078 - vectorscale((0, 0, 1), 200);
			self.doa.var_c0f32380 = 0;
			self playrumbleonentity("zombietron_booster_rumble");
		}
	}
}

/*
	Name: function_56544e8b
	Namespace: namespace_b59ddbce
	Checksum: 0xDDE6C573
	Offset: 0x3390
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_56544e8b()
{
	if(is_true(level.var_52a59317))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	if(isdefined(self.var_abe341a1))
	{
		return;
	}
	if(is_true(self.doa.var_590072e2))
	{
		return;
	}
	if(is_true(level.var_5e26061e))
	{
		return;
	}
	if(isdefined(self.doa.var_21eab413))
	{
		if(gettime() < self.doa.var_21eab413)
		{
			return;
		}
		self.doa.var_21eab413 = undefined;
	}
	if(is_true(self.doa.var_e6bdbae1))
	{
		if(self fragbuttonpressed())
		{
			return;
		}
		self.doa.var_e6bdbae1 = undefined;
	}
	if(self fragbuttonpressed() || is_true(self.doa.var_640df11b))
	{
		self.doa.var_640df11b = 0;
		self.doa.var_e6bdbae1 = 1;
		if(self.doa.score.bombs > 0)
		{
			self.doa.score.bombs--;
			self thread dropnuke();
		}
	}
}

/*
	Name: dropnuke
	Namespace: namespace_b59ddbce
	Checksum: 0xF6E7E6DC
	Offset: 0x3558
	Size: 0x4F4
	Parameters: 0
	Flags: Linked
*/
function dropnuke()
{
	self endon(#"disconnect");
	player_org = self.origin;
	origin = player_org + (20, 0, 800);
	self thread namespace_7f5aeb59::turnplayershieldon();
	self clientfield::set("bombDrop", 1);
	wait(0.4);
	level notify(#"hash_c1cceae4479f2e5", {#origin:player_org});
	playrumbleonposition("artillery_rumble", self.origin);
	namespace_ec06fe4a::clearallcorpses();
	util::wait_network_frame();
	level notify(#"hash_11f6c6a82650cca2");
	if(namespace_4dae815d::function_59a9cf1d() != 0 || isdefined(level.doa.var_6f3d327))
	{
		guys = getaiteamarray();
		potentials = arraysortclosest(guys, self.origin, 60, 0, 768);
		guys = [];
		foreach(guy in potentials)
		{
			if(abs(guy.origin[2] - self.origin[2]) > 512)
			{
				continue;
			}
			if(!isdefined(guys))
			{
				guys = [];
			}
			else if(!isarray(guys))
			{
				guys = array(guys);
			}
			guys[guys.size] = guy;
		}
	}
	else
	{
		guys = getaiteamarray();
	}
	var_2800ee5b = vectornormalize(origin - player_org);
	var_182c1d00 = 0.3;
	foreach(guy in guys)
	{
		if(isdefined(guy))
		{
			if(is_true(guy.var_c7121c91) || is_true(guy.boss))
			{
				guy.nuked = gettime();
				guy ai::stun(randomfloatrange(3, 7));
				guy notify(#"nuked");
				continue;
			}
			guy.nukedeath = 1;
			if(isvehicle(guy))
			{
				guy dodamage(guy.health + 1, player_org, self, self, "none", "MOD_EXPLOSIVE", 0, getweapon("none"));
				continue;
			}
			if(guy.team != "axis")
			{
				if(!is_true(guy.guardian))
				{
					continue;
				}
			}
			guy thread nukedeath(var_182c1d00, player_org, self, var_2800ee5b);
		}
	}
	util::wait_network_frame();
	self clientfield::set("bombDrop", 0);
	physicsexplosionsphere(player_org, 1024, 1024, 3);
}

/*
	Name: nukedeath
	Namespace: namespace_b59ddbce
	Checksum: 0xA042F28B
	Offset: 0x3A58
	Size: 0x3E6
	Parameters: 4
	Flags: Linked, Private
*/
function private nukedeath(var_182c1d00, origin, player, var_2800ee5b)
{
	self endon(#"death");
	/#
		assert(!is_true(self.boss));
	#/
	if(!isdefined(level.var_5c7cffec))
	{
		level.var_5c7cffec = sqr(160);
		level.var_db768440 = sqr(512);
		level.var_ad08a14b = 75;
		level.var_3444cdb3 = 250;
		level.var_eb2c7de4 = 1;
	}
	distsq = distancesquared(self.origin, player);
	var_2ef058c8 = math::clamp(distsq / level.var_db768440, 0.1, 1);
	time = math::clamp(origin * var_2ef058c8, 0.05, origin);
	wait(time);
	self.takedamage = 1;
	self.allowdeath = 1;
	self.var_418bd7f0 = 0;
	self.marked_for_death = 1;
	if(!is_true(self.no_gib))
	{
		if(distsq < sqr(128) && !isdefined(self.boss))
		{
			self namespace_ed80aead::function_586ef822();
		}
		else
		{
			self thread namespace_83eb6304::function_8b4b9bdd();
			if(!is_true(self.nofire) && isactor(self))
			{
				self namespace_83eb6304::function_3ecfde67("burn_zombie");
			}
			self namespace_ed80aead::function_3ab2b4eb(self.health);
		}
	}
	if(self.archetype == "zombie")
	{
		roll = randomint(100);
		switch(randomint(4))
		{
			case 0:
			{
				self namespace_83eb6304::function_3ecfde67("boost_explode");
				break;
			}
			case 1:
			{
				self namespace_83eb6304::function_3ecfde67("gut_explode");
				break;
			}
			case 2:
			{
				self namespace_83eb6304::function_3ecfde67("saw_explode");
				break;
			}
			default:
			{
				break;
			}
		}
		util::wait_network_frame();
	}
	self dodamage(self.health + 1, player, (isdefined(var_2800ee5b) ? var_2800ee5b : undefined), undefined, "none", "MOD_EXPLOSIVE");
	self.marked_for_death = undefined;
}

/*
	Name: callback_playerkilled
	Namespace: namespace_b59ddbce
	Checksum: 0x6D697172
	Offset: 0x3E48
	Size: 0x14C
	Parameters: 10
	Flags: Linked
*/
function callback_playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	self endon(#"spawned", #"disconnect");
	self notify(#"killed_player");
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = attacker;
	params.idamage = idamage;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.psoffsettime = psoffsettime;
	params.deathanimduration = deathanimduration;
	self callback::callback(#"on_player_killed", {});
}

/*
	Name: callback_playerdamage
	Namespace: namespace_b59ddbce
	Checksum: 0x3020078F
	Offset: 0x3FA0
	Size: 0x54C
	Parameters: 14
	Flags: Linked
*/
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	if(self getinvulnerability() || is_true(self.doa.var_221ef439))
	{
		return;
	}
	time = gettime();
	if(isdefined(self.doa.var_61c7a559) && (time - 1000) < self.doa.var_61c7a559)
	{
		return;
	}
	if(!isbot(self) && self arecontrolsfrozen())
	{
		return;
	}
	if(is_true(self.doa.var_3e81d24c))
	{
		if(isdefined(self.doa.var_b809c3b5))
		{
			if(time > self.doa.var_b809c3b5)
			{
				self.doa.var_b809c3b5 = undefined;
			}
			else
			{
				idamage = 0;
			}
		}
		else
		{
			self.doa.var_b809c3b5 = time + 1500;
		}
	}
	if(smeansofdeath === "MOD_FALLING")
	{
		if(level flag::get("dungeon_building"))
		{
			return;
		}
		if(self.doa.var_dbe90a1f > 0)
		{
			self.doa.var_dbe90a1f--;
			return;
		}
		if(self.doa.var_9ff62c1c > 0)
		{
			idamage = math::clamp(idamage - self.doa.var_9ff62c1c, 0, idamage);
			self.doa.var_9ff62c1c = 0;
		}
		if(is_true(self.doa.var_9fa19717) || is_true(level.var_9fa19717) || namespace_4dae815d::function_59a9cf1d() == 0)
		{
			return;
		}
		if(idamage && idamage >= self.health)
		{
			idamage = math::clamp(self.health - 10, 0, self.health);
		}
	}
	arrayremovevalue(self.doa.var_faa66479, undefined);
	if(self.doa.var_faa66479.size > 0)
	{
		namespace_1e25ad94::debugmsg(("Player (" + self.doa.color) + ") was damaged but shield is on!", 1);
		return;
	}
	if(isdefined(eattacker) && eattacker.team == self.team)
	{
		return;
	}
	idamage = int(idamage);
	var_ef60bf87 = idamage;
	if(is_true(eattacker.var_27860c49))
	{
		idamage = 145;
	}
	if(level.doa.world_state == 0 && !is_true(eattacker.var_27860c49))
	{
		if(weapon == level.doa.var_45c191a4 || weapon == level.doa.var_18a44fc1)
		{
			idamage = 145;
		}
		else
		{
			if(is_true(self.doa.var_3e81d24c))
			{
				idamage = 50;
			}
			else
			{
				idamage = self.maxhealth + 187;
			}
		}
	}
	if(smeansofdeath === "MOD_TRIGGER_HURT")
	{
		idamage = var_ef60bf87;
	}
	self.last_damaged_time = level.time;
	self thread weapons::on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage);
	self playrumbleonentity("damage_heavy");
	self finishplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
}

/*
	Name: callback_playerlaststand
	Namespace: namespace_b59ddbce
	Checksum: 0x58F7A75C
	Offset: 0x44F8
	Size: 0x7F4
	Parameters: 10
	Flags: Linked
*/
function callback_playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, delayoverride)
{
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	self.deaths++;
	level.doa.var_465867b++;
	level.doa.var_bcc1fc05++;
	if(is_true(level.doa.var_41adf604))
	{
		self.doa.var_2d965438++;
	}
	level notify(#"player_died", {#player:self});
	self notify(#"entering_last_stand");
	self notify(#"player_died");
	self.laststand = 1;
	self namespace_41cb996::function_8b7acf56();
	self clientfield::set_to_player("showMap", 0);
	self.doa.var_9ca03c2f = 0;
	self notsolid();
	if(isdefined(smeansofdeath) && isinarray(level.doa.var_5598fe58, smeansofdeath) && is_true(smeansofdeath.collector))
	{
		level notify(#"time_to_leave");
	}
	self namespace_e32bb68::function_3a59ec34("evt_doa_player_death");
	if(is_true(self.doa.var_3e81d24c) && self.doa.var_bb4d9604.size == 0)
	{
		self notify(#"hash_7893364bd228d63e");
	}
	namespace_1e25ad94::debugmsg("player entering last stand");
	delta = gettime() - self.doa.var_77c8b9d4;
	/#
		arrayremovevalue(self.doa.var_faa66479, undefined);
		if(delta < 7000 || self.doa.var_faa66479.size > 0)
		{
			namespace_1e25ad94::debugmsg(("" + self.doa.color) + "");
		}
	#/
	self.doa.var_77c8b9d4 = gettime();
	/#
		killedby = (isdefined(smeansofdeath.zombie_type) ? smeansofdeath.zombie_type : "");
		if(isdefined(smeansofdeath))
		{
			if(isdefined(smeansofdeath.targetname))
			{
				killedby = smeansofdeath.targetname;
			}
		}
		namespace_1e25ad94::debugmsg((("" + self.doa.color) + "") + killedby);
		if(is_true(smeansofdeath.var_cd7dffa1) || (getdvarint(#"hash_55b5b49e1b334929", 0) && isdefined(smeansofdeath)))
		{
			if(is_true(smeansofdeath.var_cd7dffa1))
			{
				namespace_1e25ad94::debugmsg((("" + self.doa.color) + "") + (isdefined(smeansofdeath.zombie_type) ? smeansofdeath.zombie_type : ""), 1);
			}
			namespace_7f5aeb59::function_884143e(smeansofdeath);
		}
	#/
	self function_dc7906e8(idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, delayoverride);
	if(isdefined(level.var_f7b64ada))
	{
		[[level.var_f7b64ada]]();
	}
	self namespace_eccff4fb::function_f6ac4585();
	obituary(self, smeansofdeath, level.weaponnone, "MOD_DOWNED");
	self clientfield::set_to_player("lastStand", (self.doa.score.lives > 0 ? 1 : 2));
	self allowjump(0);
	self namespace_7f5aeb59::laststand_disable_player_weapons();
	self.health = 5;
	self.laststand = 1;
	self.ignoreme = 1;
	self.ignoremelee = 1;
	callback::callback(#"on_player_laststand");
	if(self.doa.score.lives > 0)
	{
		bleedout_time = 5;
		if(self doa_fate::function_b01c3b20())
		{
			bleedout_time = 3;
		}
	}
	else
	{
		bleedout_time = 60;
		if(self doa_fate::function_b01c3b20())
		{
			bleedout_time = 30;
		}
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(player == self)
			{
				continue;
			}
			if(is_true(player.laststand))
			{
				continue;
			}
			if(player.doa.score.lives < 1)
			{
				continue;
			}
			player namespace_6e90e490::showhint(7);
		}
	}
	if(getplayers().size > 1)
	{
		self thread namespace_7f5aeb59::function_52392bd1(bleedout_time == 60);
	}
	self thread namespace_7f5aeb59::function_77785447(1, 1);
	self thread laststand::function_d4c9e1b5();
	self thread function_49b2bfe5(bleedout_time);
}

/*
	Name: function_51e87eda
	Namespace: namespace_b59ddbce
	Checksum: 0xC177A3F6
	Offset: 0x4CF8
	Size: 0x264
	Parameters: 0
	Flags: Linked
*/
function function_51e87eda()
{
	self endon(#"disconnect");
	level endon(#"game_over");
	while(is_true(self.doa.respawning))
	{
		self.doa.var_f64d2ac0 = 0;
		players = namespace_7f5aeb59::function_23e1f90f();
		foreach(player in players)
		{
			if(is_true(player.doa.respawning))
			{
				continue;
			}
			if(isdefined(player.doa.vehicle))
			{
				continue;
			}
			if(!isalive(player))
			{
				continue;
			}
			distsq = distancesquared(self.origin, player.origin);
			checkdistsq = (player doa_fate::function_b01c3b20() ? sqr(72) : sqr(48));
			if(distsq > checkdistsq)
			{
				continue;
			}
			if(self doa_fate::function_b01c3b20() && player doa_fate::function_b01c3b20())
			{
				self.doa.var_f64d2ac0 = self.doa.var_f64d2ac0 + 1;
				continue;
			}
			self.doa.var_f64d2ac0 = self.doa.var_f64d2ac0 + player.doa.var_96ca2395;
		}
		wait(1);
	}
}

/*
	Name: function_49b2bfe5
	Namespace: namespace_b59ddbce
	Checksum: 0x717FD91E
	Offset: 0x4F68
	Size: 0x29C
	Parameters: 1
	Flags: Linked
*/
function function_49b2bfe5(duration)
{
	self endon(#"disconnect");
	self endon(#"player_respawned");
	level endon(#"game_over");
	var_82cfdf77 = duration > 5;
	self.doa.respawning = 1;
	self.doa.var_22e62f63 = duration * 1000;
	self.doa.var_ac8a92d4 = 0;
	self.doa.var_f64d2ac0 = 0;
	self thread function_51e87eda();
	var_58d202bd = (float(function_60d95f53()) / 1000) * 1000;
	var_339d778e = 0;
	while(self.doa.var_ac8a92d4 < self.doa.var_22e62f63)
	{
		if(namespace_4dae815d::function_59a9cf1d() != 2)
		{
			if(var_82cfdf77 && self.doa.score.lives > 0)
			{
				break;
			}
		}
		waitframe(1);
		progress = var_58d202bd;
		if(self.doa.var_f64d2ac0 > 0)
		{
			progress = progress + (var_58d202bd * self.doa.var_f64d2ac0);
			time = gettime();
			if(time > var_339d778e)
			{
				self namespace_83eb6304::function_3ecfde67("player_healOS");
				var_339d778e = time + 2200;
			}
		}
		else
		{
			var_339d778e = 0;
		}
		self.doa.var_ac8a92d4 = self.doa.var_ac8a92d4 + progress;
		if(self getcurrentweapon() != level.laststandweapon)
		{
			self namespace_7f5aeb59::laststand_disable_player_weapons();
		}
	}
	self.laststandparams = undefined;
	self.var_bfc8055f = undefined;
	self notify(#"player_revived");
	self thread namespace_7f5aeb59::function_513831e1();
}

/*
	Name: function_dc7906e8
	Namespace: namespace_b59ddbce
	Checksum: 0x3DEC2EB
	Offset: 0x5210
	Size: 0x27E
	Parameters: 8
	Flags: Linked
*/
function function_dc7906e8(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc)
{
	self.laststandparams = spawnstruct();
	self.var_bfc8055f = spawnstruct();
	self.laststandparams.einflictor = einflictor;
	self.var_bfc8055f.var_b5346661 = (isdefined(einflictor) ? einflictor getentitynumber() : -1);
	self.laststandparams.attacker = attacker;
	self.var_bfc8055f.attackernum = (isdefined(attacker) ? attacker getentitynumber() : -1);
	self.laststandparams.attackerorigin = attacker.origin;
	if(isplayer(attacker))
	{
		self.laststandparams.var_83634238 = attacker getplayerangles();
	}
	else
	{
		self.laststandparams.var_83634238 = attacker.angles;
	}
	self.laststandparams.idamage = idamage;
	self.laststandparams.smeansofdeath = smeansofdeath;
	self.laststandparams.weapon = weapon;
	self.laststandparams.var_fd90b0bb = var_fd90b0bb;
	self.laststandparams.vdir = vdir;
	self.laststandparams.shitloc = shitloc;
	self.laststandparams.laststandstarttime = gettime();
	self.laststandparams.victimorigin = self.origin;
	self.laststandparams.var_5fceefd4 = self getplayerangles();
	self.laststandparams.victimweapon = self.currentweapon;
	self.laststandparams.var_10d87328 = gettime();
	self.laststandparams.bledout = 0;
	self.laststandparams.var_59b19c1b = 1;
}

/*
	Name: function_ca9b286c
	Namespace: namespace_b59ddbce
	Checksum: 0xFF1B7BCA
	Offset: 0x5498
	Size: 0xB4
	Parameters: 1
	Flags: Event
*/
event function_ca9b286c(eventstruct)
{
	if(isvehicle(eventstruct.vehicle))
	{
		vehicle = eventstruct.vehicle;
		var_7efce95 = 1;
		if(isdefined(vehicle.var_7efce95))
		{
			var_7efce95 = vehicle.var_7efce95;
		}
		if(var_7efce95)
		{
			self.doa.var_9d136ff8 = 1;
			self.doa.var_1b452923 = 1;
			self thread namespace_a4bedd45::function_1f704cee(1, 0);
		}
	}
}

/*
	Name: function_e011eea6
	Namespace: namespace_b59ddbce
	Checksum: 0x273D1E8B
	Offset: 0x5558
	Size: 0x66
	Parameters: 1
	Flags: Event
*/
event function_e011eea6(eventstruct)
{
	if(is_true(self.doa.var_3e81d24c))
	{
		self.doa.var_1b452923 = undefined;
		self notify(#"hash_7893364bd228d63e", {#hash_cff8d1e:1});
	}
}

