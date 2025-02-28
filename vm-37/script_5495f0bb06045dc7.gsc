#using script_1467cf24b0d4ee55;
#using script_16cb0a6a492a6a4f;
#using script_1cc417743d7c262d;
#using script_2416cc31e71459ca;
#using script_277bc0c5e470495e;
#using script_29ed825598140ca0;
#using script_2c49ae69cd8ce30c;
#using script_2da073d4aa78c206;
#using script_335d0650ed05d36d;
#using script_3f9e54c7a9a7e1e2;
#using script_44b0b8420eabacad;
#using script_47fb62300ac0bd60;
#using script_5ebc70029e06b264;
#using script_65d4fc42e5e94766;
#using script_6652a3edaad1063c;
#using script_67ce8e728d8f37ba;
#using script_68d2ee1489345a1d;
#using script_7452a079afe69150;
#using script_788472602edbe3b9;
#using script_7bacb32f8222fa3e;
#using script_9279a21b1e8b6c9;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\gameadvertisement.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\menus.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\wz_common\hud.gsc;
#using scripts\wz_common\oob.gsc;
#using scripts\wz_common\util.gsc;

#namespace namespace_17baa64d;

/*
	Name: init
	Namespace: namespace_17baa64d
	Checksum: 0x2701AA22
	Offset: 0x3D0
	Size: 0x6F4
	Parameters: 0
	Flags: None
*/
function init()
{
	globallogic::init();
	level.var_79219af4 = 0;
	if(getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0)
	{
		level.var_79219af4 = (isdefined(getgametypesetting(#"hash_21ff0f3139be8f97")) ? getgametypesetting(#"hash_21ff0f3139be8f97") : 0);
	}
	level.var_f2814a96 = (isdefined(getgametypesetting(#"hash_6be1c95551e78384")) ? getgametypesetting(#"hash_6be1c95551e78384") : 0);
	if(level.var_f2814a96 !== 1 && level.var_f2814a96 !== 2)
	{
		level.var_3d984b4c = 0;
	}
	level.var_153e7dad = 1;
	level.var_4cea2bec = (isdefined(getgametypesetting(#"hash_6cc7b012775d9662")) ? getgametypesetting(#"hash_6cc7b012775d9662") : 0);
	level.var_6c900548 = (isdefined(getgametypesetting(#"hash_2b3e56efad3a1504")) ? getgametypesetting(#"hash_2b3e56efad3a1504") : 0);
	level.var_e16a689f = (isdefined(getgametypesetting(#"hash_557cb4680634f585")) ? getgametypesetting(#"hash_557cb4680634f585") : 0);
	level.onstartgametype = &function_d81f6eb7;
	level.onspawnplayer = &on_spawn_player;
	level.var_f6d301b = &function_66cbd790;
	level.onendgame = &on_end_game;
	level.ondeadevent = &function_40843d72;
	level.ononeleftevent = &function_80efb8b1;
	level.var_a3e209ba = &function_a3e209ba;
	if((isdefined(getgametypesetting(#"disableclassselection")) ? getgametypesetting(#"disableclassselection") : 0))
	{
		level.var_86513cd0 = &function_3b0db3c2;
	}
	level.var_74b10e67 = &loadout::register_perks;
	level.var_5495fbf1 = 0;
	level.var_e7b05b51 = 0;
	level.var_674e8051 = 1;
	level.var_f48e69e7 = 1;
	level.var_f97a6ba3 = 1;
	level.var_806e130d = 1;
	if((isdefined(getgametypesetting(#"disableweapondrop")) ? getgametypesetting(#"disableweapondrop") : 0))
	{
		level.var_827f5a28 = 1;
	}
	level.var_eed7c027 = [];
	level.on_spawn_player = &spawn::on_spawn_player;
	insertion::init();
	hud::function_9b9cecdf();
	death_circle::init_vo();
	oob::init();
	callback::on_player_killed(&function_c1a417ee);
	player::function_cf3aa03d(&player_killed);
	callback::on_spawned(&on_player_spawned);
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	callback::function_98a0917d(&function_1bcd6e1e);
	callback::add_callback(#"hash_84d8c1164d90313", &function_5af3a29);
	callback::add_callback(#"hash_40cd438036ae13df", &function_1f93e91f);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::add_callback(#"hash_1019ab4b81d07b35", &team_eliminated);
	function_aaa24662();
	level.var_6adbdb63 = 1;
	level.var_b219667f = 1;
	level.var_606becce = [];
	level thread function_23600e7d();
	/#
		callback::on_vehicle_spawned(&function_5d7553c9);
		level.var_5efad16e = &function_73b0f715;
		var_34e67a68 = getdvarstring(#"hash_22388768f7c15ebc", "");
		if(var_34e67a68 != "")
		{
			level.var_34e67a68 = var_34e67a68;
		}
		level thread function_c2a75696();
	#/
}

/*
	Name: on_spawn_player
	Namespace: namespace_17baa64d
	Checksum: 0xCD0B224D
	Offset: 0xAD0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function on_spawn_player(predictedspawn)
{
	if(level.var_f2814a96 === 1 || level.var_f2814a96 === 2)
	{
		namespace_ce472ff1::on_spawn_player(predictedspawn);
	}
	else
	{
		spawn::on_spawn_player(predictedspawn);
	}
}

/*
	Name: function_d81f6eb7
	Namespace: namespace_17baa64d
	Checksum: 0x1005067D
	Offset: 0xB40
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_d81f6eb7()
{
	level.displayroundendtext = 0;
	level.var_992e9235 = [];
	level thread spawn::function_e93291ff();
	level callback::add_callback(#"hash_774be40ec06d5212", &function_bcde1e07);
	level flag::clear(#"spawning_allowed");
	namespace_674e6435::function_414115a0(90, 150);
	namespace_674e6435::function_414115a0(25, 150);
	namespace_674e6435::function_414115a0(15, 150);
	namespace_674e6435::function_414115a0(10, 150);
	namespace_674e6435::function_414115a0(5, 150);
	namespace_674e6435::function_414115a0(3, 150);
	namespace_674e6435::function_414115a0(1, 150);
	namespace_674e6435::function_414115a0(0, 150);
	death_circle::init();
	if(is_true(level.var_4cea2bec))
	{
		level thread function_6ee52dd0(level.var_6c900548, level.var_e16a689f);
	}
	level thread hud::function_5db32126();
}

/*
	Name: function_bcde1e07
	Namespace: namespace_17baa64d
	Checksum: 0xD12B8AC
	Offset: 0xCF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_bcde1e07()
{
	level flag::clear(#"spawning_allowed");
	namespace_67838d10::function_bcde1e07();
}

/*
	Name: function_3b0db3c2
	Namespace: namespace_17baa64d
	Checksum: 0xDA370975
	Offset: 0xD38
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_3b0db3c2()
{
	if(!util::isfirstround())
	{
		return;
	}
	/#
		if(function_7373cc35())
		{
			return;
		}
	#/
	level.prematchperiod = max(level.prematchperiod, 5);
	level waittill(#"hash_78e53817cafb5265");
	/#
		println("");
	#/
	if(level.var_b02808b6)
	{
		gameadvertisement::setadvertisedstatus(0);
	}
}

/*
	Name: function_70171add
	Namespace: namespace_17baa64d
	Checksum: 0x24FD5740
	Offset: 0xDF0
	Size: 0x7E
	Parameters: 0
	Flags: Private
*/
function private function_70171add()
{
	if(randomfloat(1) <= getdvarfloat(#"survey_chance", 0))
	{
		return randomintrange(1, getdvarint(#"survey_count", 0) + 1);
	}
	return 0;
}

/*
	Name: function_1bcd6e1e
	Namespace: namespace_17baa64d
	Checksum: 0x57879ADF
	Offset: 0xE78
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function function_1bcd6e1e()
{
	level notify(#"hash_1c605a92cc507414");
	/#
		println("");
	#/
	if(level.var_b02808b6)
	{
		gameadvertisement::setadvertisedstatus(0);
	}
	teams::function_344e464d();
	if(is_true(level.spawnsystem.var_f220c297))
	{
		level callback::add_callback(#"hash_3057417db7f8acdd", &function_77319881);
	}
	function_65469e2e();
	if(spawning::function_daa5852f())
	{
		level namespace_67838d10::function_8dcd8623();
	}
	level.ingraceperiod = 0;
	spawning::function_7a87efaa();
	level.var_bde3d03 = undefined;
	var_f9adbf05 = function_70171add();
	foreach(player in getplayers())
	{
		player spawn::function_8cef1872();
		player val::reset(#"hash_2c372a1c55b534a4", "takedamage");
		if(sessionmodeisonlinegame())
		{
			player stats::function_7a850245(#"demofileid", getdemofileid());
			if(level.rankedmatch)
			{
				player stats::function_7a850245("surveyId", var_f9adbf05);
			}
		}
	}
	spawn::function_cb5864fc();
}

/*
	Name: on_player_connect
	Namespace: namespace_17baa64d
	Checksum: 0x48C9AEF2
	Offset: 0x1100
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self.var_63af7f75 = -1;
	self.var_c5134737 = 1;
	level hud::function_22df4165();
	self namespace_d3564fd8::function_456aacb1();
}

/*
	Name: on_player_disconnect
	Namespace: namespace_17baa64d
	Checksum: 0x203799ED
	Offset: 0x1158
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	self namespace_d3564fd8::player_disconnected();
	level hud::function_22df4165();
	dogtag = self.var_c0ad34c;
	if(isdefined(dogtag))
	{
		item_drop::function_ccba50c6(dogtag);
	}
}

/*
	Name: team_eliminated
	Namespace: namespace_17baa64d
	Checksum: 0x7D573D6A
	Offset: 0x11C8
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function team_eliminated(params)
{
	team = params.team;
	foreach(player in getplayers(team))
	{
		dogtag = player.var_c0ad34c;
		if(isdefined(dogtag))
		{
			item_drop::function_ccba50c6(dogtag);
		}
	}
}

/*
	Name: function_5d7553c9
	Namespace: namespace_17baa64d
	Checksum: 0x51BFAFD7
	Offset: 0x1298
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_5d7553c9()
{
	/#
		if(game.state == #"pregame")
		{
			return;
		}
		if(level flag::get(#"hash_38a387462f3a9ad"))
		{
			return;
		}
		if(!is_true(self.var_46439e18))
		{
			return;
		}
		if(!isdefined(level.var_c18a1e6b))
		{
			level.var_c18a1e6b = 0;
		}
		level.var_c18a1e6b++;
		if(getdvarint(#"hash_10daadecda56ef52", 1) && level.var_c18a1e6b > 120)
		{
			/#
				assert(level.var_c18a1e6b <= 120, "");
			#/
		}
	#/
}

/*
	Name: function_c2a75696
	Namespace: namespace_17baa64d
	Checksum: 0xDFF21506
	Offset: 0x13A0
	Size: 0x130
	Parameters: 0
	Flags: Private
*/
function private function_c2a75696()
{
	/#
		mapname = util::function_53bbf9d2();
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		while(true)
		{
			waitframe(1);
			string = getdvarstring(#"hash_68a6ac70f8821d9d", "");
			switch(string)
			{
				case "start":
				{
					function_73b0f715();
					break;
				}
				default:
				{
					break;
				}
			}
			setdvar(#"hash_68a6ac70f8821d9d", "");
		}
	#/
}

/*
	Name: function_75189494
	Namespace: namespace_17baa64d
	Checksum: 0x45FDD038
	Offset: 0x14D8
	Size: 0x84
	Parameters: 3
	Flags: Private
*/
function private function_75189494(var_c6ce2627, playercount, var_404397c4)
{
	data = {#hash_4a2854ac:var_404397c4, #hash_f388074a:playercount, #hash_19b5b856:var_c6ce2627};
	function_92d1707f(#"hash_7bcd081bd6940681", data);
}

/*
	Name: function_23600e7d
	Namespace: namespace_17baa64d
	Checksum: 0xFAA6AE5F
	Offset: 0x1568
	Size: 0xFC0
	Parameters: 0
	Flags: Private
*/
function private function_23600e7d()
{
	var_26ef8eea = (isdefined(getgametypesetting(#"hash_bd1199baafe11fe")) ? getgametypesetting(#"hash_bd1199baafe11fe") : 1);
	/#
		var_26ef8eea = 0;
	#/
	if(var_26ef8eea && !isdedicated())
	{
		/#
			println("");
		#/
		return;
	}
	if(getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0)
	{
		/#
			println("");
		#/
		return;
	}
	while(!isdefined(game.state) || game.state != #"pregame")
	{
		waitframe(1);
	}
	while(function_a1ef346b().size == 0)
	{
		waitframe(1);
	}
	if(getdvarint(#"hash_4ea975785ad6baf9", 0) != 0)
	{
		/#
			println("");
		#/
		level function_73b0f715();
		return;
	}
	/#
		if(function_7373cc35())
		{
			return;
		}
	#/
	level endon(#"hash_1c605a92cc507414");
	level.var_8fcd8a61 = (isdefined(getgametypesetting(#"hash_35c2d850e39fa704")) ? getgametypesetting(#"hash_35c2d850e39fa704") : 100);
	level.var_e9d6c52f = (isdefined(getgametypesetting(#"hash_46f957248efbd39a")) ? getgametypesetting(#"hash_46f957248efbd39a") : 10);
	level.var_f414be13 = (isdefined(getgametypesetting(#"hash_21e0d28e8692d5a")) ? getgametypesetting(#"hash_21e0d28e8692d5a") : 4);
	level.var_9290cd7c = (isdefined(getgametypesetting(#"hash_368f9b5b4992b8da")) ? getgametypesetting(#"hash_368f9b5b4992b8da") : 20);
	level.var_8ca0499 = (isdefined(getgametypesetting(#"hash_ad6c0d1cd92c1fe")) ? getgametypesetting(#"hash_ad6c0d1cd92c1fe") : 30);
	level.var_493d04d3 = (isdefined(getgametypesetting(#"hash_28233b1037888945")) ? getgametypesetting(#"hash_28233b1037888945") : 15);
	level.max_wait_time = (isdefined(getgametypesetting(#"max_wait_time")) ? getgametypesetting(#"max_wait_time") : 0);
	level.var_3f631d69 = (isdefined(getgametypesetting(#"hash_2d4ff63e866cdd74")) ? getgametypesetting(#"hash_2d4ff63e866cdd74") : 120);
	if(level.var_9290cd7c <= 0)
	{
		level.var_9290cd7c = 1;
	}
	level.var_25fc8e84 = int(ceil((level.max_wait_time * 60) / level.var_9290cd7c));
	starttime = gettime();
	var_fb9555e1 = 3;
	level.var_a132ca2b = level.var_8fcd8a61;
	level.var_7dc1df3a = spawnstruct();
	level.var_7dc1df3a.var_e2382b29 = level.var_8fcd8a61;
	var_e09e5160 = function_a1ef346b().size;
	var_761c5049 = 0;
	/#
		println("" + starttime);
	#/
	/#
		println("" + level.var_8fcd8a61);
	#/
	/#
		println("" + level.var_e9d6c52f);
	#/
	/#
		println("" + level.var_f414be13);
	#/
	/#
		println("" + level.var_9290cd7c);
	#/
	/#
		println("" + level.var_8ca0499);
	#/
	/#
		println("" + level.var_493d04d3);
	#/
	/#
		println("" + level.max_wait_time);
	#/
	/#
		println("" + level.var_3f631d69);
	#/
	/#
		println("" + level.var_25fc8e84);
	#/
	/#
		println("" + level.var_a132ca2b);
	#/
	while(true)
	{
		/#
			println("");
		#/
		/#
			println("" + var_761c5049);
		#/
		if(getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0)
		{
			/#
				println("");
			#/
			level.var_7dc1df3a = undefined;
			return;
		}
		if(level.max_wait_time > 0 && level.var_25fc8e84 <= 0)
		{
			level.var_a132ca2b = level.var_e9d6c52f;
			level.var_8ca0499 = level.var_3f631d69;
			level.var_493d04d3 = 0;
			/#
				println(("" + level.max_wait_time) + "");
			#/
			/#
				println((("" + level.var_a132ca2b) + "") + level.var_8ca0499);
			#/
		}
		if(function_a1ef346b().size >= level.var_a132ca2b)
		{
			level.var_7dc1df3a.var_7be962bb = function_a1ef346b().size;
			level.var_7dc1df3a.var_7d960258 = level.var_a132ca2b;
			if(function_a1ef346b().size < level.var_8fcd8a61)
			{
				/#
					println((("" + level.var_8fcd8a61) + "") + function_a1ef346b().size);
				#/
				if(level.var_8ca0499 > 0)
				{
					timeleft = level.var_8ca0499;
					/#
						println("" + level.var_8ca0499);
					#/
					while(timeleft > 0)
					{
						timeleft = timeleft - 1;
						wait(1);
						if(function_a1ef346b().size >= level.var_8fcd8a61)
						{
							break;
						}
					}
					level.var_7dc1df3a.var_a104a7da = function_a1ef346b().size - level.var_7dc1df3a.var_7be962bb;
				}
			}
			if(function_a1ef346b().size < level.var_a132ca2b)
			{
				wait(5);
				var_fb9555e1 = 3;
				continue;
			}
			if(level.var_b02808b6)
			{
				/#
					println("");
				#/
				gameadvertisement::setadvertisedstatus(0);
			}
			level.var_7dc1df3a.duration = gettime() - starttime;
			/#
				println("" + gettime());
			#/
			level function_73b0f715();
			return;
		}
		if(level.var_493d04d3 <= 0 && function_a1ef346b().size < level.var_e9d6c52f)
		{
			if(var_fb9555e1 > 0)
			{
				/#
					println("" + function_a1ef346b().size);
				#/
				wait(5);
				var_fb9555e1--;
				/#
					println("" + var_fb9555e1);
				#/
				continue;
			}
			function_75189494(gettime() - starttime, function_a1ef346b().size, level.var_e9d6c52f);
			/#
				println("" + gettime());
			#/
			level.var_7dc1df3a = undefined;
			exitlevel(0, #"hash_35b5848d9f1b58e0");
			return;
		}
		/#
			println("");
		#/
		/#
			println("" + function_a1ef346b().size);
		#/
		/#
			println("" + level.var_a132ca2b);
		#/
		if(function_a1ef346b().size < level.var_a132ca2b)
		{
			var_7bce82a7 = function_a1ef346b().size - var_e09e5160;
			if(var_7bce82a7 >= 3)
			{
				/#
					println("" + var_7bce82a7);
				#/
				if(level.var_a132ca2b < level.var_8fcd8a61 - level.maxteamplayers)
				{
					var_b0c8b797 = level.var_a132ca2b - function_a1ef346b().size;
					if(var_b0c8b797 < 4 * level.maxteamplayers)
					{
						level.var_a132ca2b = level.var_a132ca2b + level.maxteamplayers;
						/#
							println("" + level.var_a132ca2b);
						#/
					}
				}
				var_e09e5160 = function_a1ef346b().size;
				wait(2);
				/#
					println("" + var_761c5049);
				#/
				continue;
			}
		}
		var_761c5049++;
		var_e09e5160 = function_a1ef346b().size;
		/#
			println("" + level.var_9290cd7c);
		#/
		timeleft = level.var_9290cd7c;
		while(timeleft > 0)
		{
			timeleft = timeleft - 1;
			wait(1);
			if(function_a1ef346b().size >= level.var_a132ca2b)
			{
				break;
			}
		}
		if(function_a1ef346b().size < level.var_a132ca2b)
		{
			level.var_a132ca2b = level.var_a132ca2b - level.var_f414be13;
			if(level.var_a132ca2b < level.var_e9d6c52f)
			{
				level.var_a132ca2b = level.var_e9d6c52f;
			}
		}
		if(level.var_25fc8e84 > 0)
		{
			level.var_25fc8e84--;
		}
		if(level.var_493d04d3 > 0)
		{
			level.var_493d04d3--;
		}
		/#
			println("" + level.var_a132ca2b);
		#/
		/#
			println("" + level.var_493d04d3);
		#/
		/#
			println("");
		#/
	}
}

/*
	Name: function_ec2c9808
	Namespace: namespace_17baa64d
	Checksum: 0x1B2050DB
	Offset: 0x2530
	Size: 0x1A8
	Parameters: 2
	Flags: Private
*/
function private function_ec2c9808(response, intpayload)
{
	if(!isalive(self) && !player::function_21695e86())
	{
		return;
	}
	foreach(player in getplayers())
	{
		if(player.team === self.team)
		{
			if(response == "placed")
			{
				xcoord = int(intpayload / 1000);
				ycoord = intpayload - (xcoord * 1000);
				player luinotifyevent(#"hash_34bb692dbc392d7f", 3, self getentitynumber(), xcoord, ycoord);
				continue;
			}
			if(response == "removed")
			{
				player luinotifyevent(#"hash_123261c89a0bc7a", 1, self getentitynumber());
			}
		}
	}
}

/*
	Name: function_cc47bb2f
	Namespace: namespace_17baa64d
	Checksum: 0xF577B335
	Offset: 0x26E0
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_cc47bb2f()
{
	if(game.state == #"pregame")
	{
		return true;
	}
	return false;
}

/*
	Name: on_player_spawned
	Namespace: namespace_17baa64d
	Checksum: 0x271D9E33
	Offset: 0x2710
	Size: 0x52A
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self endon(#"death");
	level endon(#"game_ended");
	self.var_1ab1ec0c = self.origin;
	self namespace_674e6435::function_7e714b6a();
	dogtag = self.var_c0ad34c;
	if(isdefined(dogtag))
	{
		item_drop::function_ccba50c6(dogtag);
	}
	self clientfield::set_player_uimodel("hudItems.playerCleanUps", self.cleanups);
	self clientfield::set_player_uimodel("hudItems.playerKills", self.kills);
	level hud::function_22df4165();
	character_index = self getcharacterbodytype();
	fields = getcharacterfields(character_index, currentsessionmode());
	if(isdefined(fields))
	{
		if(isdefined(fields.var_9c1be670) && fields.var_9c1be670)
		{
			self hidepart("tag_ability_hero");
		}
		if(isdefined(fields.var_1b216715) && fields.var_1b216715)
		{
			self hidepart("tag_equipment_hero");
		}
	}
	if(isdefined(self.pers) && isdefined(self.pers[#"lives"]))
	{
		self spawn::function_1390f875(self.pers[#"lives"]);
		if(self.pers[#"lives"] != 1 && !is_true(self.var_874448e8))
		{
			self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 1);
			self.var_874448e8 = 1;
		}
		if(self.pers[#"lives"] == 1)
		{
			self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 0);
		}
	}
	if(function_cc47bb2f())
	{
		if(is_true(getgametypesetting("allowPlayerMovementPrematch")))
		{
			self val::reset(#"spawn_player", "freezecontrols");
		}
		self val::reset(#"spawn_player", "disablegadgets");
		self val::set(#"hash_2c372a1c55b534a4", "takedamage", 0);
		if(level.var_79219af4 > 0 && (function_a1ef346b().size + 1) >= level.var_79219af4)
		{
			level function_73b0f715();
		}
	}
	else
	{
		if(namespace_c2bb938a::function_42a8e289())
		{
			self thread namespace_c2bb938a::function_1579c63e();
		}
		else if(level.var_f2814a96 === 0)
		{
			/#
				if(getdvarint(#"hash_6fd0fd3292f07618", 0))
				{
					return;
				}
			#/
			var_7eb8f61a = (isdefined(getgametypesetting(#"hash_648fb3af9bc11566")) ? getgametypesetting(#"hash_648fb3af9bc11566") : 0);
			switch(var_7eb8f61a)
			{
				case 0:
				{
					self thread namespace_c2bb938a::function_584c9f1();
					break;
				}
				case 1:
				{
					self thread namespace_c2bb938a::function_39a51e47();
					break;
				}
				case 2:
				{
					self thread namespace_c2bb938a::function_3c4884f1();
					break;
				}
			}
		}
	}
}

/*
	Name: function_66cbd790
	Namespace: namespace_17baa64d
	Checksum: 0xCE5D8BF0
	Offset: 0x2C48
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_66cbd790(var_c1e98979)
{
	teams::function_f1394038();
	function_16e6bd2e(var_c1e98979);
}

/*
	Name: function_40843d72
	Namespace: namespace_17baa64d
	Checksum: 0x35C34205
	Offset: 0x2C88
	Size: 0x1E4
	Parameters: 1
	Flags: None
*/
function function_40843d72(team)
{
	if(team == "all")
	{
		var_d72df62 = teams::function_c7eae573();
		winning_team = teams::function_c2f2fb84(var_d72df62);
		count = 2;
		foreach(var_b524076f in var_d72df62)
		{
			if(!isdefined(winning_team) || util::function_fbce7263(winning_team, var_b524076f.team))
			{
				teams::team_eliminated(var_b524076f.team, count);
				count++;
			}
		}
		teams::function_5fed3908(winning_team);
		round::function_af2e264f(winning_team);
		thread globallogic::end_round(6);
	}
	else if(teams::function_9dd75dad(team) && !is_true(level.var_606becce[team]) && teams::is_all_dead(team))
	{
		teams::team_eliminated(team, globallogic::function_e9e52d05() + 1);
	}
}

/*
	Name: function_5af3a29
	Namespace: namespace_17baa64d
	Checksum: 0x56ABB3F6
	Offset: 0x2E78
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_5af3a29(params)
{
	level thread function_3832a0d2(params.teams_alive[0]);
	teams::function_5fed3908(params.teams_alive[0]);
}

/*
	Name: function_3832a0d2
	Namespace: namespace_17baa64d
	Checksum: 0x5DDC4F0A
	Offset: 0x2ED8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_3832a0d2(team)
{
	winner = function_b5f4c9d8(team);
	if(isdefined(winner))
	{
		var_fc96f513 = winner getmpdialogname();
		if(isdefined(var_fc96f513))
		{
			var_6cc23875 = getscriptbundle(var_fc96f513);
			if(isdefined(var_6cc23875))
			{
				var_520b24a = var_6cc23875.boostwin;
				if(isdefined(var_520b24a))
				{
					level.var_fec861a7 = 1;
					winner battlechatter::function_a48c33ff(var_520b24a, 148, 5);
					level.var_fec861a7 = undefined;
				}
			}
		}
	}
	wait(5);
	globallogic_audio::leader_dialog("warTeamWon", team);
}

/*
	Name: function_b5f4c9d8
	Namespace: namespace_17baa64d
	Checksum: 0x37F18F5F
	Offset: 0x2FE0
	Size: 0x106
	Parameters: 1
	Flags: Private
*/
function private function_b5f4c9d8(team)
{
	winner = undefined;
	players = getplayers(team);
	foreach(player in players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(!isdefined(player.lastkilltime))
		{
			player.lastkilltime = 0;
		}
		if(!isdefined(winner) || player.lastkilltime > winner.lastkilltime)
		{
			winner = player;
		}
	}
	return winner;
}

/*
	Name: function_80efb8b1
	Namespace: namespace_17baa64d
	Checksum: 0x110AF552
	Offset: 0x30F0
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function function_80efb8b1(team)
{
	if(team == "all")
	{
		return;
	}
	foreach(player in getplayers(team))
	{
		if(isalive(player) && !player laststand::player_is_in_laststand())
		{
			player globallogic_audio::leader_dialog_on_player("warLastManStanding");
			return;
		}
	}
}

/*
	Name: function_379afb41
	Namespace: namespace_17baa64d
	Checksum: 0x6A6E9213
	Offset: 0x31E8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_379afb41()
{
	death_circle::function_27d5d349();
}

/*
	Name: on_end_game
	Namespace: namespace_17baa64d
	Checksum: 0xA33434FE
	Offset: 0x3208
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function on_end_game(var_c1e98979)
{
	function_379afb41();
	level.var_bde3d03 = &oob::function_b777ff94;
	level thread globallogic_audio::function_85818e24("matchcomplete");
	winner = round::function_9b24638f();
	match::function_af2e264f(winner);
	setmatchflag("game_ended", 1);
}

/*
	Name: function_c1a417ee
	Namespace: namespace_17baa64d
	Checksum: 0xBFD4C36D
	Offset: 0x32B8
	Size: 0x264
	Parameters: 1
	Flags: None
*/
function function_c1a417ee(params)
{
	level hud::function_22df4165();
	attacker = params.attacker;
	weapon = params.weapon;
	smeansofdeath = params.smeansofdeath;
	if(isdefined(params.laststandparams))
	{
		attacker = params.laststandparams.attacker;
		weapon = params.laststandparams.weapon;
		smeansofdeath = params.laststandparams.smeansofdeath;
	}
	if(isplayer(attacker))
	{
		itemindex = getitemindexfromref(weapon.name);
		if(itemindex == 0)
		{
			itemindex = getitemindexfromref(weapon.statname);
		}
		var_97dcd0a5 = getunlockableiteminfofromindex(itemindex, 1);
		if(isdefined(var_97dcd0a5))
		{
			attackerid = attacker getentitynumber();
			self luinotifyevent(#"hash_4f354475cce89512", 3, attackerid, 0, weapon.statindex);
		}
		else
		{
			self luinotifyevent(#"hash_4f354475cce89512", 3, 0, function_4a856ead(smeansofdeath), 0);
		}
	}
	else
	{
		self luinotifyevent(#"hash_4f354475cce89512", 3, 0, function_4a856ead(smeansofdeath), 0);
	}
	self function_e6f9e3cd();
	self.specialty = self getloadoutperks(0);
	self loadout::register_perks();
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_17baa64d
	Checksum: 0xEC8413D2
	Offset: 0x3528
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_10a4dd0a(params)
{
	item = params.item;
	var_a6762160 = item.var_a6762160;
	if(var_a6762160.itemtype != #"dogtag")
	{
		return;
	}
	if(isfunctionptr(level.var_c4dc9178))
	{
		item [[level.var_c4dc9178]](self);
	}
}

/*
	Name: function_c14ef1aa
	Namespace: namespace_17baa64d
	Checksum: 0x5B34EE3B
	Offset: 0x35B8
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function function_c14ef1aa(attacker)
{
	if(getdvarint(#"hash_10c3f1c0958c1fba", 0) == 0)
	{
		return false;
	}
	if(!isdedicated())
	{
		return false;
	}
	if(isalive(self))
	{
		return false;
	}
	if(isdefined(self.switching_teams))
	{
		return false;
	}
	if(isdefined(attacker) && attacker == self)
	{
		return false;
	}
	if(level.teambased && isdefined(attacker) && isdefined(attacker.team) && attacker.team == self.team)
	{
		return false;
	}
	if(isdefined(attacker) && (!isdefined(attacker.team) || attacker.team == #"none") && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn"))
	{
		return false;
	}
	return true;
}

/*
	Name: player_killed
	Namespace: namespace_17baa64d
	Checksum: 0xA96B604E
	Offset: 0x3710
	Size: 0x304
	Parameters: 9
	Flags: None
*/
function player_killed(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	self clientfield::set_to_player("realtime_multiplay", 0);
	if(smeansofdeath == "MOD_META")
	{
		return;
	}
	if(is_true(level.droppedtagrespawn) && !is_true(getgametypesetting(#"useitemspawns")))
	{
		thread dogtags::checkallowspectating();
		should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
		should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
		if(should_spawn_tags)
		{
			level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
		}
	}
	if(isplayer(attacker) && self function_c14ef1aa(attacker))
	{
		var_27a8d662 = self getxuid(1) + attacker getxuid(1);
		self function_b096092b(var_27a8d662);
		attacker function_b096092b(var_27a8d662);
	}
	if(isplayer(attacker) && attacker.team != self.team)
	{
		if(!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || is_true(level.killstreaksgivegamescore))
		{
			attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
			self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
			if(smeansofdeath == "MOD_HEAD_SHOT")
			{
				attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperheadshot);
			}
		}
	}
}

/*
	Name: function_16e6bd2e
	Namespace: namespace_17baa64d
	Checksum: 0x34085098
	Offset: 0x3A20
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_16e6bd2e(var_c1e98979)
{
	var_1e866967 = spawnstruct();
	var_1e866967.remainingtime = max(0, globallogic_utils::gettimeremaining());
	switch(var_c1e98979)
	{
		case 2:
		{
			var_1e866967.wintype = "time_limit_reached";
			break;
		}
		case 3:
		{
			var_1e866967.wintype = "score_limit_reached";
			break;
		}
		case 9:
		case 10:
		default:
		{
			var_1e866967.wintype = "NA";
			break;
		}
	}
	bb::function_bf5cad4e(var_1e866967);
}

/*
	Name: function_73b0f715
	Namespace: namespace_17baa64d
	Checksum: 0x8E66E534
	Offset: 0x3B30
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function function_73b0f715(player)
{
	if(game.state != #"pregame")
	{
		return;
	}
	if(isdedicated())
	{
		if(getdvarint(#"hash_41feb500743b0d15", 0) != 0)
		{
			return;
		}
	}
	level notify(#"hash_78e53817cafb5265");
}

/*
	Name: function_a3e209ba
	Namespace: namespace_17baa64d
	Checksum: 0x2F1940F4
	Offset: 0x3BB8
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function function_a3e209ba()
{
	if(namespace_67838d10::function_6660c1f())
	{
		return false;
	}
	return true;
}

/*
	Name: function_aaa24662
	Namespace: namespace_17baa64d
	Checksum: 0xD78B1566
	Offset: 0x3BE0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_aaa24662()
{
	var_c013a394 = getent("below_world_trigger", "targetname");
	if(!isentity(var_c013a394))
	{
		return;
	}
	var_c013a394 callback::function_35a12f19(&function_3c8be2d2);
}

/*
	Name: function_1e150a0b
	Namespace: namespace_17baa64d
	Checksum: 0x4FBE69EA
	Offset: 0x3C58
	Size: 0x264
	Parameters: 1
	Flags: Private
*/
function private function_1e150a0b(player)
{
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_9c24b065 = 5;
	var_2497d4aa = 100;
	var_9a5b8004 = 250;
	var_3a60655f = 100;
	var_50c30b0c = 250;
	var_5988a0d = 10000;
	var_85d40a8 = player.origin[2] + 500;
	startpos = (player.origin[0] + randomintrange(var_2497d4aa, var_9a5b8004), player.origin[1] + randomintrange(var_3a60655f, var_50c30b0c), var_5988a0d);
	endpos = (startpos[0], startpos[1], var_85d40a8);
	for(index = 0; index < var_9c24b065; index++)
	{
		var_708a2754 = physicstrace(startpos, endpos, (0, 0, 0), (0, 0, 0), player, 32);
		if(var_708a2754[#"fraction"] < 1)
		{
			player setorigin(var_708a2754[#"position"]);
			return;
		}
		startpos = (startpos[0] + randomintrange(var_2497d4aa, var_9a5b8004), startpos[1] + randomintrange(var_3a60655f, var_50c30b0c), var_5988a0d);
		endpos = (startpos[0], startpos[1], var_85d40a8);
	}
	player dodamage(player.health * 100, player.origin);
}

/*
	Name: function_6ee52dd0
	Namespace: namespace_17baa64d
	Checksum: 0x63949F96
	Offset: 0x3EC8
	Size: 0x264
	Parameters: 2
	Flags: Private
*/
function private function_6ee52dd0(damage, var_c71fc4f4)
{
	level flag::wait_till(#"hash_5a3e17fbc33cdc86");
	var_366959 = 0;
	var_1b5e849 = int(var_c71fc4f4 * 1000);
	while(!is_true(level.gameended))
	{
		time = gettime();
		foreach(i, player in getplayers())
		{
			if(!isalive(player))
			{
				continue;
			}
			if(!isdefined(player.var_21b83511))
			{
				if(player ishidden() || player isinfreefall() || player isparachuting())
				{
					continue;
				}
				player.var_21b83511 = time + var_1b5e849;
				continue;
			}
			if(player.heal.enabled)
			{
				delta = player.var_21b83511 - time;
				player.var_21b83511 = time + delta;
				continue;
			}
			if((i % 10) == var_366959 && player.var_21b83511 < time)
			{
				player dodamage(damage, player.origin, undefined, undefined, undefined, "MOD_BLED_OUT");
				player.var_21b83511 = time + var_1b5e849;
			}
		}
		var_366959 = (var_366959 + 1) % 10;
		waitframe(1);
	}
}

/*
	Name: function_77319881
	Namespace: namespace_17baa64d
	Checksum: 0xD577B63
	Offset: 0x4138
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_77319881()
{
	if(!is_true(level.spawnsystem.var_f220c297))
	{
		return;
	}
	level flag::set(#"spawning_allowed");
	/#
		function_cc5d43a1("");
	#/
	level namespace_c2bb938a::function_fec68e5c();
	/#
		function_cc5d43a1("");
	#/
	level flag::clear(#"spawning_allowed");
	waitframe(1);
	if(!util::function_47851c07())
	{
		namespace_c2bb938a::function_8ea9be1c();
		level callback::remove_callback(#"hash_3057417db7f8acdd", &function_77319881);
	}
}

/*
	Name: function_cc5d43a1
	Namespace: namespace_17baa64d
	Checksum: 0x7234DED4
	Offset: 0x4268
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_cc5d43a1(msg)
{
	/#
		println(msg);
		adddebugcommand("");
	#/
}

/*
	Name: function_1f93e91f
	Namespace: namespace_17baa64d
	Checksum: 0xAD5B84C7
	Offset: 0x42B0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_1f93e91f(params)
{
	util::function_8076d591("warSupplyDropIncoming");
}

/*
	Name: function_293cd859
	Namespace: namespace_17baa64d
	Checksum: 0xB8321EFF
	Offset: 0x42E0
	Size: 0x16C
	Parameters: 1
	Flags: Private
*/
function private function_293cd859(ent)
{
	if(isplayer(ent))
	{
		data = {#type:#"player", #pos_z:ent.origin[2], #pos_y:ent.origin[1], #pos_x:ent.origin[0]};
		function_92d1707f(#"hash_5820ed7a498888c4", data);
	}
	else
	{
		data = {#type:ent.model, #pos_z:ent.origin[2], #pos_y:ent.origin[1], #pos_x:ent.origin[0]};
		function_92d1707f(#"hash_5820ed7a498888c4", data);
	}
}

/*
	Name: function_3ca20639
	Namespace: namespace_17baa64d
	Checksum: 0x7C367792
	Offset: 0x4458
	Size: 0x140
	Parameters: 1
	Flags: Private
*/
function private function_3ca20639(vehicle)
{
	occupants = vehicle getvehoccupants();
	foreach(occupant in occupants)
	{
		occupant unlink();
	}
	vehicle delete();
	foreach(occupant in occupants)
	{
		function_1e150a0b(occupant);
	}
}

/*
	Name: function_3c8be2d2
	Namespace: namespace_17baa64d
	Checksum: 0xF1ED6572
	Offset: 0x45A0
	Size: 0x3BC
	Parameters: 1
	Flags: Private
*/
function private function_3c8be2d2(trigger_struct)
{
	level endon(#"game_ended");
	self endon(#"death");
	usetrigger = self;
	activator = trigger_struct.activator;
	if(isplayer(activator))
	{
		/#
			iprintlnbold(((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "");
		#/
		function_293cd859(activator);
		if(activator isinvehicle())
		{
			vehicle = activator getvehicleoccupied();
			function_3ca20639(vehicle);
		}
		else
		{
			function_1e150a0b(activator);
		}
	}
	else
	{
		if(isvehicle(activator))
		{
			/#
				iprintlnbold(((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "");
				print((((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "") + "");
			#/
			function_293cd859(activator);
			function_3ca20639(activator);
		}
		else if(isentity(activator))
		{
			/#
				iprintlnbold(((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "");
				print((((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "") + "");
			#/
			function_293cd859(activator);
			activator delete();
		}
	}
}

