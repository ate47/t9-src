#using script_47fb62300ac0bd60;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\util.gsc;

#namespace contracts;

/*
	Name: function_89f2df9
	Namespace: contracts
	Checksum: 0x56DEFB8E
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7f404914b14e9019", &function_70a657d8, undefined, &finalize_init, undefined);
}

/*
	Name: function_70a657d8
	Namespace: contracts
	Checksum: 0x2B8E2E50
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	init_player_contract_events();
}

/*
	Name: finalize_init
	Namespace: contracts
	Checksum: 0xE573ACB3
	Offset: 0x148
	Size: 0x1A4
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize_init()
{
	callback::on_connect(&on_player_connect);
	if(can_process_contracts())
	{
		challenges::registerchallengescallback("gameEnd", &function_a4c8ce2a);
		globallogic_score::registercontractwinevent(&contract_win);
		register_player_contract_event(#"score", &on_player_score, 2);
		register_player_contract_event(#"ekia", &function_71eb8a5a, 2);
		register_player_contract_event(#"objective_ekia", &function_660b0026);
		register_player_contract_event(#"damagedone", &function_6d90b18a, 1);
		level.var_79a93566 = &function_902ef0de;
		level.var_c3e2bb05 = 2;
		function_7364a587();
		/#
			thread devgui_setup();
		#/
	}
}

/*
	Name: function_7364a587
	Namespace: contracts
	Checksum: 0xEB0983A3
	Offset: 0x2F8
	Size: 0x356
	Parameters: 0
	Flags: Linked
*/
function function_7364a587()
{
	level.var_9d6b3096 = [];
	level.var_9d6b3096[#"hash_35a6541d081acef5"] = spawnstruct();
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"] = spawnstruct();
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"] = spawnstruct();
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_9dd75c18 = 3000;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_9dd75c18 = 2500;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_9dd75c18 = 500;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_9a5a8dcf = 4000;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_9a5a8dcf = 3000;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_9a5a8dcf = 1000;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_f703cb6c = 20;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_f703cb6c = 15;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_f703cb6c = 4;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_39027dc7 = 30;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_39027dc7 = 25;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_39027dc7 = 7;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_81bbb381 = 3500;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_81bbb381 = 3000;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_81bbb381 = 750;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_9037b57b = 15;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_9037b57b = 10;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_9037b57b = 1;
}

/*
	Name: on_player_connect
	Namespace: contracts
	Checksum: 0xE6478F8A
	Offset: 0x658
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(can_process_contracts())
	{
		self setup_player_contracts(3, &function_1fd13839);
	}
}

/*
	Name: can_process_contracts
	Namespace: contracts
	Checksum: 0xE2775038
	Offset: 0x6A0
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function can_process_contracts()
{
	if(getdvarint(#"hash_5f85c5979e163766", 0) == 0)
	{
		return 0;
	}
	if(getdvarint(#"hash_332424e6c4a080d8", 1) == 0)
	{
		return 0;
	}
	if(!sessionmodeismultiplayergame())
	{
		return 0;
	}
	if(level.var_73e51905 !== 1)
	{
		return 0;
	}
	if(level.arenamatch !== 1)
	{
		return 0;
	}
	return challenges::canprocesschallenges();
}

/*
	Name: on_player_score
	Namespace: contracts
	Checksum: 0xF2398E72
	Offset: 0x768
	Size: 0x1C4
	Parameters: 2
	Flags: Linked
*/
function on_player_score(new_score, delta_score)
{
	gametype = level.gametype;
	if(!isdefined(level.var_9d6b3096[gametype]))
	{
		return;
	}
	player = self;
	old_score = new_score - delta_score;
	target_value = level.var_9d6b3096[gametype].var_9dd75c18;
	if(old_score < target_value)
	{
		if(new_score >= target_value)
		{
			player function_ccf82192(#"hash_78214e78d4159f84");
			switch(gametype)
			{
				case "hash_35a6541d081acef5":
				{
					player function_ccf82192(#"hash_ae762b8f099ea78");
					break;
				}
				case "hash_594c4ab1d31aa150":
				{
					player function_ccf82192(#"hash_7f6444fe885ce68c");
					break;
				}
				case "hash_5fd7317230bb0fac":
				{
					player function_ccf82192(#"hash_6eae617e00faf9d1");
					break;
				}
			}
		}
	}
	else
	{
		var_2c74fba6 = level.var_9d6b3096[gametype].var_9a5a8dcf;
		if(old_score < var_2c74fba6 && new_score >= var_2c74fba6)
		{
			player function_ccf82192(#"hash_1075c38287814aa0");
		}
	}
}

/*
	Name: function_71eb8a5a
	Namespace: contracts
	Checksum: 0xCBC7DA10
	Offset: 0x938
	Size: 0x1AC
	Parameters: 2
	Flags: Linked
*/
function function_71eb8a5a(weapon, victim)
{
	gametype = level.gametype;
	if(!isdefined(level.var_9d6b3096[gametype]))
	{
		return;
	}
	player = self;
	var_350027d1 = player.pers[#"ekia"];
	if(var_350027d1 == level.var_9d6b3096[gametype].var_f703cb6c)
	{
		player function_ccf82192(#"hash_1d1b3fe36f24b6ac");
		switch(level.gametype)
		{
			case "hash_35a6541d081acef5":
			{
				player function_ccf82192(#"hash_5094a25541df9380");
				break;
			}
			case "hash_594c4ab1d31aa150":
			{
				player function_ccf82192(#"hash_4a7745c3b4819d04");
				break;
			}
			case "hash_5fd7317230bb0fac":
			{
				player function_ccf82192(#"hash_2783d4c96f09717");
				break;
			}
		}
	}
	else if(var_350027d1 == level.var_9d6b3096[gametype].var_39027dc7)
	{
		player function_ccf82192(#"hash_63e1c91ddca36b58");
	}
}

/*
	Name: function_660b0026
	Namespace: contracts
	Checksum: 0x39CAC1CF
	Offset: 0xAF0
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function function_660b0026()
{
	gametype = level.gametype;
	if(!isdefined(level.var_9d6b3096[gametype]))
	{
		return;
	}
	player = self;
	objective_ekia = player.pers[#"objectiveekia"] + 1;
	if(objective_ekia == level.var_9d6b3096[gametype].var_9037b57b)
	{
		player function_ccf82192(#"hash_518ce6f8a5567a08");
		switch(level.gametype)
		{
			case "hash_35a6541d081acef5":
			{
				player function_ccf82192(#"hash_2b23579cbf8999f4");
				break;
			}
			case "hash_594c4ab1d31aa150":
			{
				player function_ccf82192(#"hash_7182bb77d8974488");
				break;
			}
			case "hash_5fd7317230bb0fac":
			{
				player function_ccf82192(#"hash_501faf9b8da2fcc7");
				break;
			}
		}
	}
}

/*
	Name: function_6d90b18a
	Namespace: contracts
	Checksum: 0x9B325D52
	Offset: 0xC60
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function function_6d90b18a(damagedone)
{
	player = self;
	if(player is_contract_active(#"hash_783240d7e11018c9"))
	{
		gametype = level.gametype;
		if(!isdefined(level.var_9d6b3096[gametype]))
		{
			return;
		}
		var_2e0944a3 = self.pers[#"damagedone"];
		var_5f607191 = var_2e0944a3 - damagedone;
		target_value = level.var_9d6b3096[gametype].var_81bbb381;
		if(var_5f607191 < target_value && var_2e0944a3 >= target_value)
		{
			player function_ccf82192(#"hash_783240d7e11018c9");
			switch(level.gametype)
			{
				case "hash_35a6541d081acef5":
				{
					player function_ccf82192(#"hash_41263195cd7fa7f");
					break;
				}
				case "hash_594c4ab1d31aa150":
				{
					player function_ccf82192(#"hash_5579ada75c110186");
					break;
				}
				case "hash_5fd7317230bb0fac":
				{
					player function_ccf82192(#"hash_693d0b4e9c956a4");
					break;
				}
			}
		}
	}
}

/*
	Name: function_ccf82192
	Namespace: contracts
	Checksum: 0x61A52CFA
	Offset: 0xE20
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_ccf82192(var_38280f2f, delta)
{
	if(!isdefined(delta))
	{
		delta = 1;
	}
	if(self is_contract_active(var_38280f2f))
	{
		self function_902ef0de(var_38280f2f, delta);
	}
}

/*
	Name: function_902ef0de
	Namespace: contracts
	Checksum: 0xFBCE9819
	Offset: 0xE88
	Size: 0x3AC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_902ef0de(var_38280f2f, delta)
{
	/#
		if(getdvarint(#"scr_contract_debug_multiplier", 0) > 0)
		{
			delta = delta * getdvarint(#"scr_contract_debug_multiplier", 1);
		}
	#/
	if(delta <= 0)
	{
		return;
	}
	target_value = self.pers[#"contracts"][var_38280f2f].target_value;
	old_progress = (isdefined(self.pers[#"contracts"][var_38280f2f].current_value) ? self.pers[#"contracts"][var_38280f2f].current_value : self.pers[#"contracts"][var_38280f2f].var_59cb904f);
	if(old_progress == target_value)
	{
		return;
	}
	new_progress = int(old_progress + delta);
	if(new_progress > target_value)
	{
		new_progress = target_value;
	}
	if(new_progress != old_progress)
	{
		self.pers[#"contracts"][var_38280f2f].current_value = new_progress;
		if(isdefined(level.var_90031a39[var_38280f2f]))
		{
			self luinotifyevent(#"hash_4b04b1cb4b3498d0", 2, level.var_90031a39[var_38280f2f], new_progress);
		}
	}
	if(old_progress < target_value && target_value <= new_progress)
	{
		var_9d12108c = (isdefined(self.timeplayed[self.team]) ? self.timeplayed[self.team] : 0);
		self.pers[#"contracts"][var_38280f2f].var_be5bf249 = (self stats::function_441050ca(#"time_played_total") - self.pers[#"hash_5651f00c6c1790a4"]) + var_9d12108c;
		if(isdefined(level.var_90031a39[var_38280f2f]))
		{
			self luinotifyevent(#"hash_1739c4bd5baf83bc", 1, level.var_90031a39[var_38280f2f]);
		}
	}
	/#
		if(getdvarint(#"scr_contract_debug", 0) > 0)
		{
			iprintln((((function_9e72a96(var_38280f2f) + "") + new_progress) + "") + target_value);
			if(old_progress < target_value && target_value <= new_progress)
			{
				iprintln(function_9e72a96(var_38280f2f) + "");
			}
		}
	#/
}

/*
	Name: function_1fd13839
	Namespace: contracts
	Checksum: 0xC8873D5D
	Offset: 0x1240
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_1fd13839(slot)
{
	return function_d17bcd3c(slot);
}

/*
	Name: function_a4c8ce2a
	Namespace: contracts
	Checksum: 0xCAF9437A
	Offset: 0x1270
	Size: 0x2B4
	Parameters: 1
	Flags: Linked
*/
function function_a4c8ce2a(data)
{
	if(!isdefined(data))
	{
		return;
	}
	player = data.player;
	if(!isplayer(player))
	{
		return;
	}
	player function_ccf82192(#"hash_5f67f3e8adbeb98a");
	switch(level.gametype)
	{
		case "hash_35a6541d081acef5":
		{
			player function_ccf82192(#"hash_c3dd6c976fd6da0");
			break;
		}
		case "hash_594c4ab1d31aa150":
		{
			player function_ccf82192(#"hash_59ddf56a06fffa34");
			break;
		}
		case "hash_5fd7317230bb0fac":
		{
			player function_ccf82192(#"hash_41aad2f69ccae443");
			break;
		}
	}
	team = player.team;
	if(isdefined(level.placement[team]) && player.score > 0)
	{
		var_414a209b = min(level.placement.size, 3);
		for(i = 0; i < var_414a209b; i++)
		{
			if(level.placement[team][i] == player)
			{
				player function_a54e2068(#"hash_355152b5a8de61ef");
				break;
			}
		}
	}
	arenaslot = arenagetslot();
	var_67d27328 = player stats::get_stat(#"arenastats", arenaslot, #"hash_60f1e9335197f661", #"hash_36cd820c1ff6c16b");
	if(var_67d27328 > 0)
	{
		player function_a54e2068(#"hash_35e52e40ab6d1223", var_67d27328);
		player function_a54e2068(#"hash_421c3b5196a40f99", var_67d27328);
	}
	player function_78083139();
}

/*
	Name: contract_win
	Namespace: contracts
	Checksum: 0xBC9CE997
	Offset: 0x1530
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function contract_win(winner)
{
	winner function_ccf82192(#"hash_4e903e32da421b17");
	winner function_ccf82192(#"hash_2809e14b0f3b4c5e");
	switch(level.gametype)
	{
		case "hash_35a6541d081acef5":
		{
			winner function_ccf82192(#"hash_7ad97dfb4e13dcf5");
			break;
		}
		case "hash_594c4ab1d31aa150":
		{
			winner function_ccf82192(#"hash_1d7c20fdd4a3cef1");
			break;
		}
		case "hash_5fd7317230bb0fac":
		{
			winner function_ccf82192(#"hash_70bec139292fe3e2");
			break;
		}
	}
	var_283195f2 = winner stats::function_441050ca(#"hash_56a0e77eea02664d");
	if(var_283195f2 > 0)
	{
		if((var_283195f2 % 4) == 0)
		{
			winner function_ccf82192(#"hash_40186850547832f7");
		}
		if((var_283195f2 % 2) == 0)
		{
			winner function_ccf82192(#"hash_4a14b348f01ad76d");
		}
	}
}

/*
	Name: devgui_setup
	Namespace: contracts
	Checksum: 0x469D2A2D
	Offset: 0x16E0
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		var_74757534 = "";
		wait(3);
		function_e07e542b(var_74757534, undefined);
		function_17a92a99(var_74757534);
		function_7f05e018(var_74757534);
		function_bdc473ef(var_74757534);
		function_936f8390(var_74757534);
		function_2e9917ec(var_74757534);
		function_295a8005(var_74757534);
	#/
}

/*
	Name: function_17a92a99
	Namespace: contracts
	Checksum: 0xFCB1AFD7
	Offset: 0x17B8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_17a92a99(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_7f05e018
	Namespace: contracts
	Checksum: 0x55F4DD50
	Offset: 0x18F0
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_7f05e018(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_bdc473ef
	Namespace: contracts
	Checksum: 0xD1BC86C6
	Offset: 0x19B0
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_bdc473ef(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_936f8390
	Namespace: contracts
	Checksum: 0x348BE9F4
	Offset: 0x1B10
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_936f8390(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_2e9917ec
	Namespace: contracts
	Checksum: 0xDB06EEC6
	Offset: 0x1C70
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_2e9917ec(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_ef925b75
	Namespace: contracts
	Checksum: 0xB52F44C6
	Offset: 0x1DD0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_ef925b75(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
	#/
}

/*
	Name: function_295a8005
	Namespace: contracts
	Checksum: 0x5AB434D0
	Offset: 0x1E18
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_295a8005(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

