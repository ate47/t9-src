#using script_29ed825598140ca0;
#using script_32c8b5b0eb2854f3;
#using script_3f9e54c7a9a7e1e2;
#using script_47fb62300ac0bd60;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\laststand.gsc;

#namespace namespace_78a95918;

/*
	Name: function_89f2df9
	Namespace: namespace_78a95918
	Checksum: 0x5DF7329F
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3a6339817ab93cc4", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_78a95918
	Checksum: 0xFEE399C3
	Offset: 0x158
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	contracts::init_player_contract_events();
	callback::on_finalize_initialization(&finalize_init);
}

/*
	Name: finalize_init
	Namespace: namespace_78a95918
	Checksum: 0xB0B610F1
	Offset: 0x1B8
	Size: 0x5BC
	Parameters: 0
	Flags: None
*/
function finalize_init()
{
	if(can_process_contracts())
	{
		callback::on_connect(&on_player_connect);
		callback::on_player_killed(&on_player_killed);
		callback::on_player_damage(&on_player_damage);
		callback::function_1475a073(&function_4927535c);
		callback::on_revived(&on_player_revived);
		callback::on_ai_killed(&on_ai_killed);
		callback::on_vehicle_killed(&on_vehicle_killed);
		callback::function_10a4dd0a(&function_dd00c744);
		callback::function_955a779c(&function_9d4c3c52);
		callback::function_c55a0479(&function_c55a0479);
		callback::add_callback("on_driving_wz_vehicle", &on_driving_wz_vehicle);
		callback::add_callback(#"hash_677c43609aa6ce47", &function_5648f82);
		level.var_79a93566 = &function_902ef0de;
		level.var_f202fa67 = &function_a221f6d7;
		level.var_e3551fe4 = &function_a7cdb8f0;
		level.var_c3e2bb05 = 4;
		level.var_bd3ddb14 = &function_bd3ddb14;
		level.var_d9ae19f0 = &function_d9ae19f0;
		level.var_29ab88df = &function_29ab88df;
		level callback::add_callback(#"hash_7119d854cd41a4fd", &function_28ba0ba6);
		level callback::add_callback(#"hash_69ec922777c59153", &function_362499ea);
		level.var_79a3ba26 = [#"hash_6e237d1aec5ebae2":1, #"hash_28fb7b6581fc57fb":1, #"hash_6c2f4d31b7682613":1, #"hash_5a5408262448eb77":1, #"hash_714bee6de3dc1fd7":1, #"hash_2fa6d3d57c82720c":1, #"hash_2f614bc6ce414164":1, #"hash_2cee20f0ab20f5d5":1, #"hash_3e6f00dcaccdb98e":1, #"hash_7f4ee068772cc5aa":1, #"hash_3458fd4dff2bd9e8":1, #"hash_6075c220f6315daf":1];
		level.var_f290f0ba = [#"hash_78f8f730158519ff":30, #"hash_4af84a8334451ab5":29, #"hash_62810f3ef5d7c53b":28, #"hash_468067e2be6e3cfd":27, #"hash_4b49cb98f0fd776a":26, #"hash_6dea2e4afc816818":25, #"hash_2783dbab1f862606":24, #"hash_2141ecb8d2d86b22":23, #"hash_678a1efded2b597a":22, #"hash_1b83b702bbaae298":21, #"hash_7d028af90dad72ae":20, #"hash_a211476d10546c":19, #"hash_308758c2f91807aa":18, #"hash_550872d1d1938f94":17, #"hash_408b3ed7db6f9401":16, #"hash_734bf5054445e0df":15, #"hash_2a93e93b275c38ed":14, #"hash_75cc919e81dc8b19":13, #"hash_779cba7072600ad1":12, #"hash_47a63bc4a605b45f":11, #"hash_4ee6deffa30cc6e2":10, #"hash_ca8b234ad1fea38":9, #"hash_66f790c2630deace":8, #"hash_49e8a607ea22e650":7, #"hash_43647ef7af66f82f":6, #"hash_61373b747c6a21fd":5, #"hash_3ad3de90342f2d4b":4, #"hash_2b546c0315159617":3, #"hash_33f7121f70c3065f":2, #"hash_6a0d13acf3e5687d":1];
		callback::add_callback(#"hash_5775ae80fc576ea6", &function_314e09eb);
		/#
			thread devgui_setup();
		#/
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_78a95918
	Checksum: 0xC08431B4
	Offset: 0x780
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self contracts::setup_player_contracts(3, &function_1d4c6768);
}

/*
	Name: on_ai_killed
	Namespace: namespace_78a95918
	Checksum: 0xAC0FD9D7
	Offset: 0x7B8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function on_ai_killed(params)
{
	if(isplayer(params.eattacker))
	{
		attacker = params.eattacker;
		if("_zombie" === self.scoretype)
		{
			attacker function_ed661177(#"hash_3be4286ceb86e3ee");
		}
		if(isdefined(params.weapon))
		{
			weapon = params.weapon;
			if(weapon.statname == #"ray_gun" || weapon.statname == #"ray_gun_mk2")
			{
				attacker function_ed661177(#"hash_662a7934c69c5aa7");
			}
		}
	}
}

/*
	Name: on_vehicle_killed
	Namespace: namespace_78a95918
	Checksum: 0x68B9047F
	Offset: 0x8C0
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function on_vehicle_killed(params)
{
	if(isdefined(params))
	{
		if(isplayer(params.eattacker))
		{
			attacker = params.eattacker;
			if(!attacker util::isenemyteam(self.team))
			{
				return;
			}
			if(isdefined(params.weapon))
			{
				weapon = params.weapon;
				if(weapon.statname == #"eq_tripwire")
				{
					attacker function_ed661177(#"hash_5468af4499f0c7fe");
				}
			}
		}
	}
}

/*
	Name: on_player_killed
	Namespace: namespace_78a95918
	Checksum: 0xFEDEFEC5
	Offset: 0x990
	Size: 0xC14
	Parameters: 1
	Flags: None
*/
function on_player_killed(var_a2f12b49)
{
	if(teams::is_all_dead(self.team) || !self player::function_73da2f89())
	{
		self function_521ac7e5();
	}
	if(!isdefined(self.laststandparams))
	{
		return;
	}
	attacker = self.laststandparams.attacker;
	weapon = self.laststandparams.weapon;
	if(!isplayer(attacker))
	{
		return;
	}
	if(!attacker util::isenemyteam(self.team))
	{
		return;
	}
	entnum = self getentitynumber();
	if(isdefined(attacker.var_9a787df5) && is_true(attacker.var_9a787df5[entnum]))
	{
		attacker function_ed661177(#"hash_1567f7b8fb5d379a");
	}
	else
	{
		attacker function_ed661177(#"hash_4bc7882cf1404beb");
	}
	if(death_circle::is_active() && isdefined(level.var_52b56362))
	{
		if(!isdefined(attacker.var_4f1edabd) || attacker.var_4f1edabd < level.var_52b56362)
		{
			attacker.var_4f1edabd = level.var_52b56362;
			attacker function_ed661177(#"hash_427ce6c8328c38d0");
		}
	}
	if(attacker isinvehicle() && !attacker isremotecontrolling())
	{
		e_vehicle = attacker getvehicleoccupied();
		n_seat = e_vehicle getoccupantseat(attacker);
		if(isdefined(n_seat) && n_seat != 0)
		{
			attacker function_ed661177(#"hash_222aca7930cc6c4f");
		}
		turret_weapon = e_vehicle seatgetweapon(n_seat);
		if(isdefined(turret_weapon) && self.laststandparams.smeansofdeath != "MOD_CRUSH")
		{
			attacker function_ed661177(#"hash_6e74e2826c57979a");
		}
	}
	if(isdefined(level.deathcircle.players) && array::contains(level.deathcircle.players, attacker))
	{
		attacker function_ed661177(#"hash_27068f5b82298af6");
	}
	if(isdefined(self.var_156bf46e))
	{
		vehicle = self.var_156bf46e;
		if(isdefined(vehicle) && isvehicle(vehicle) && !vehicle isremotecontrol())
		{
			attacker function_ed661177(#"hash_3a8e1cd16ced090d");
		}
	}
	if(attacker isplayerswimming())
	{
		attacker function_ed661177(#"hash_3f01fdb33d536780");
	}
	if(isdefined(attacker.var_700a5910))
	{
		dt = (gettime() - attacker.var_700a5910) / 1000;
		if(dt <= 3)
		{
			attacker function_ed661177(#"hash_d0e756015e4f2e4");
		}
	}
	if(attacker === self.var_53b73ccf)
	{
		dt = (gettime() - self.var_2481a15b) / 1000;
		if(dt <= 2)
		{
			attacker function_ed661177(#"hash_55d855a64a351c16");
		}
	}
	if(self namespace_674e6435::is_reviving_any())
	{
		attacker function_ed661177(#"hash_579396af83d0d2b6");
	}
	var_96f43b4d = attacker.origin[2] - self.origin[2];
	if(var_96f43b4d >= 787.402)
	{
		attacker function_ed661177(#"hash_165a9439e9bfe79e");
	}
	if(isdefined(self.laststunnedtime))
	{
		if(isdefined(self.var_45b88627))
		{
			var_38dce50e = self.var_45b88627;
		}
		else
		{
			var_38dce50e = gettime();
		}
		dt = (var_38dce50e - self.laststunnedtime) / 1000;
		if(dt <= 3)
		{
			attacker function_ed661177(#"hash_500fb646c4b9ca1a");
		}
	}
	if(isdefined(attacker) && isdefined(attacker.pers) && isdefined(attacker.pers[#"characterindex"]))
	{
		n_character_index = attacker.pers[#"characterindex"];
		rf = function_fb05c532(n_character_index, currentsessionmode());
		if(isdefined(rf))
		{
			if(!isdefined(rf.var_f0a975bf))
			{
				rf.var_f0a975bf = 0;
			}
			switch(rf.var_f0a975bf)
			{
				case 0:
				{
					attacker function_ed661177(#"hash_69ce9185eb96006");
					break;
				}
				case 1:
				{
					attacker function_ed661177(#"hash_762415d6941c625e");
					break;
				}
				case 2:
				{
					break;
				}
				case 3:
				{
					attacker function_ed661177(#"hash_3e6ea7a7898a0816");
					break;
				}
			}
		}
	}
	if(isdefined(weapon))
	{
		if(weapon.statname == #"melee_bowie")
		{
			if(!isdefined(attacker.var_6f3e3a9c))
			{
				attacker.var_6f3e3a9c = 1;
				attacker thread function_e49226a4();
			}
			else
			{
				attacker.var_6f3e3a9c++;
				if(attacker.var_6f3e3a9c >= 2)
				{
					attacker.var_6f3e3a9c = undefined;
					attacker function_ed661177(#"hash_375ede206821cb1");
				}
			}
		}
		if(weapon.statname == #"hatchet")
		{
			n_dist = distance(attacker.origin, self.origin);
			if(n_dist >= 3937.01)
			{
				attacker function_ed661177(#"hash_29c133baf1e0570a");
			}
		}
		var_49f7c24a = 0;
		weaponclass = util::getweaponclass(weapon);
		if(isdefined(weaponclass))
		{
			switch(weaponclass)
			{
				case "weapon_assault":
				{
					attacker function_ed661177(#"hash_26960896e41b052e");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_lmg":
				{
					attacker function_ed661177(#"hash_787c6658b5d8e5ab");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_pistol":
				{
					attacker function_ed661177(#"hash_55566633fad3906");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_cqb":
				{
					attacker function_ed661177(#"hash_917ca1622ee909");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_smg":
				{
					attacker function_ed661177(#"hash_15d3178944567fc8");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_sniper":
				{
					attacker function_ed661177(#"hash_24a6fe1d38c78fa6");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_grenade":
				{
					if(!isdefined(attacker.var_c9daf540))
					{
						attacker.var_c9daf540 = 1;
						attacker thread function_db2da6f7();
					}
					else
					{
						attacker.var_c9daf540++;
						if(attacker.var_c9daf540 >= 2)
						{
							attacker.var_c9daf540 = undefined;
							attacker function_ed661177(#"hash_6d2f5796b496e676");
						}
					}
					break;
				}
				default:
				{
					break;
				}
			}
		}
		if(var_49f7c24a)
		{
			if(!isdefined(attacker.var_9c8d1c79))
			{
				attacker.var_9c8d1c79 = [];
			}
			if(attacker.var_9c8d1c79.size < 3 && !array::contains(attacker.var_9c8d1c79, weapon))
			{
				array::add(attacker.var_9c8d1c79, weapon, 0);
				if(attacker.var_9c8d1c79.size >= 3)
				{
					attacker function_ed661177(#"hash_1d768bc95604897d");
				}
			}
		}
		if(weapon.inventorytype === "offhand")
		{
			attacker function_ed661177(#"hash_667f2b93bcb7cf97");
		}
		if(is_true(level.var_79a3ba26[weapon.name]))
		{
			attacker function_ed661177(#"hash_5f4ee5f31ebf4597");
		}
	}
}

/*
	Name: function_e49226a4
	Namespace: namespace_78a95918
	Checksum: 0x3F94B438
	Offset: 0x15B0
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_e49226a4()
{
	self endon(#"death");
	wait(10);
	if(isplayer(self))
	{
		self.var_6f3e3a9c = undefined;
	}
}

/*
	Name: function_db2da6f7
	Namespace: namespace_78a95918
	Checksum: 0x92089F9B
	Offset: 0x15F8
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_db2da6f7()
{
	self endon(#"disconnect");
	wait(0.25);
	if(isplayer(self))
	{
		self.var_c9daf540 = undefined;
	}
}

/*
	Name: on_player_damage
	Namespace: namespace_78a95918
	Checksum: 0x5241BDC
	Offset: 0x1640
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function on_player_damage(params)
{
	if(!isdefined(params))
	{
		return;
	}
	attacker = params.eattacker;
	if(isplayer(attacker))
	{
		if(attacker != self)
		{
			if(!isdefined(self.var_9a787df5))
			{
				self.var_9a787df5 = [];
			}
			self.var_9a787df5[attacker getentitynumber()] = 1;
		}
	}
}

/*
	Name: function_4927535c
	Namespace: namespace_78a95918
	Checksum: 0x6553B14
	Offset: 0x16D0
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_4927535c()
{
	if(isdefined(self.laststandparams))
	{
		attacker = self.laststandparams.attacker;
		if(!isplayer(attacker))
		{
			return;
		}
		if(!attacker util::isenemyteam(self.team))
		{
			return;
		}
		self.var_53b73ccf = attacker;
		self.var_2481a15b = gettime();
	}
}

/*
	Name: on_player_revived
	Namespace: namespace_78a95918
	Checksum: 0xB25144D7
	Offset: 0x1758
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function on_player_revived(params)
{
	if(isdefined(params.reviver))
	{
		e_reviver = params.reviver;
		e_reviver function_ed661177(#"hash_4b331df1cf084980");
		if(isdefined(level.deathcircle.players) && array::contains(level.deathcircle.players, e_reviver))
		{
			e_reviver function_ed661177(#"hash_3ff60e8cd6dabd89");
		}
	}
}

/*
	Name: can_process_contracts
	Namespace: namespace_78a95918
	Checksum: 0xFF95D8C
	Offset: 0x1820
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function can_process_contracts()
{
	if(getdvarint(#"hash_5f85c5979e163766", 0) == 0)
	{
		return false;
	}
	if(getdvarint(#"hash_1b390d095b88b25a", 1) == 0)
	{
		return false;
	}
	if(!function_f99d2668())
	{
		return false;
	}
	return true;
}

/*
	Name: function_ed661177
	Namespace: namespace_78a95918
	Checksum: 0x44ED9034
	Offset: 0x18A8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function function_ed661177(var_38280f2f, delta)
{
	if(!isdefined(delta))
	{
		delta = 1;
	}
	if(!can_process_contracts() || !self contracts::is_contract_active(var_38280f2f))
	{
		return;
	}
	if(level.inprematchperiod)
	{
		return;
	}
	self function_902ef0de(var_38280f2f, delta);
}

/*
	Name: function_902ef0de
	Namespace: namespace_78a95918
	Checksum: 0xD5C9EA60
	Offset: 0x1930
	Size: 0x40C
	Parameters: 2
	Flags: Private
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
		params = spawnstruct();
		params.player = self;
		params.var_38280f2f = var_38280f2f;
		self callback::callback(#"contract_complete", params);
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
	Name: function_a221f6d7
	Namespace: namespace_78a95918
	Checksum: 0xA355D31B
	Offset: 0x1D48
	Size: 0x84
	Parameters: 1
	Flags: Private
*/
function private function_a221f6d7(var_38280f2f)
{
	switch(var_38280f2f)
	{
		case "hash_2c9ffdfc4e716112":
		case "hash_42580a6cc2bf989e":
		case "hash_443909a5b54c22b9":
		case "hash_48730ce04835417f":
		case "hash_7d40878d77a51836":
		case "hash_7e50a6cdb307039a":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a7cdb8f0
	Namespace: namespace_78a95918
	Checksum: 0xEA5D12E8
	Offset: 0x1DD8
	Size: 0xE4
	Parameters: 1
	Flags: Private
*/
function private function_a7cdb8f0(var_38280f2f)
{
	switch(var_38280f2f)
	{
		case "hash_114034ef741c57c":
		case "hash_67444eea6c3a2b4":
		case "hash_137173b281445b4d":
		case "hash_158213f4ee12211e":
		case "hash_17ed7af10aadfdbf":
		case "hash_1dbb5150a78086fb":
		case "hash_372bbe55a27ec4af":
		case "hash_395b9be57a35044e":
		case "hash_47ce5d5ec0614886":
		case "hash_533d85cab61c7cbe":
		case "hash_6bdbeb895b012fb2":
		case "hash_6f4d7d1506be4c97":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_1d4c6768
	Namespace: namespace_78a95918
	Checksum: 0xC3810268
	Offset: 0x1EC8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_1d4c6768(slot)
{
	return contracts::function_d17bcd3c(slot);
}

/*
	Name: function_bd3ddb14
	Namespace: namespace_78a95918
	Checksum: 0x12C24C05
	Offset: 0x1EF8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_bd3ddb14(e_player)
{
	e_player function_ed661177(#"hash_101e4b07a4707d36");
}

/*
	Name: function_d9ae19f0
	Namespace: namespace_78a95918
	Checksum: 0xD4E40755
	Offset: 0x1F30
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_d9ae19f0(e_player)
{
	e_player.var_b2f09f9f = 1;
	e_player function_ed661177(#"hash_6c95edbb431aa4e2");
}

/*
	Name: function_521ac7e5
	Namespace: namespace_78a95918
	Checksum: 0x97968FA2
	Offset: 0x1F78
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_521ac7e5()
{
	if(isdefined(self.var_56bd2c02))
	{
		return;
	}
	team = self.team;
	var_9d12108c = (isdefined(self.timeplayed[team]) ? self.timeplayed[team] : 0);
	self.var_56bd2c02 = self stats::function_441050ca(#"time_played_total") + var_9d12108c;
}

/*
	Name: function_4ec3f8fe
	Namespace: namespace_78a95918
	Checksum: 0x9944DBD7
	Offset: 0x2018
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_4ec3f8fe()
{
	if(isdefined(self.var_c619a827))
	{
		return;
	}
	team = self.team;
	var_9d12108c = (isdefined(self.timeplayed[team]) ? self.timeplayed[team] : 0);
	self.var_c619a827 = self stats::function_441050ca(#"time_played_total") + var_9d12108c;
}

/*
	Name: function_29ab88df
	Namespace: namespace_78a95918
	Checksum: 0xF2416BC9
	Offset: 0x20B8
	Size: 0x1A6
	Parameters: 2
	Flags: None
*/
function function_29ab88df(a_players, var_c1735b56)
{
	teamsize = getgametypesetting("maxTeamPlayers");
	foreach(player in a_players)
	{
		player function_4ec3f8fe();
		switch(teamsize)
		{
			case 1:
			{
				if(var_c1735b56 <= 10)
				{
					player function_ed661177(#"hash_443909a5b54c22b9");
				}
				break;
			}
			case 2:
			{
				if(var_c1735b56 <= 5)
				{
					player function_ed661177(#"hash_48730ce04835417f");
				}
				break;
			}
			case 4:
			{
				if(var_c1735b56 <= 3)
				{
					player function_ed661177(#"hash_2c9ffdfc4e716112");
				}
				break;
			}
		}
	}
}

/*
	Name: function_28ba0ba6
	Namespace: namespace_78a95918
	Checksum: 0x2C78EFED
	Offset: 0x2268
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_28ba0ba6()
{
	a_players = get_alive_players();
	foreach(player in a_players)
	{
		player function_ed661177(#"hash_76a6aeacc63e7ce7");
	}
}

/*
	Name: function_362499ea
	Namespace: namespace_78a95918
	Checksum: 0x3B8B680F
	Offset: 0x2318
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_362499ea(params)
{
	player = params.attacker;
	if(isplayer(player))
	{
		vehicle = params.vehicle;
		if(player util::isenemyteam(vehicle.team))
		{
			var_bbc128bb = vehicle getspeedmph();
			if(var_bbc128bb > 0)
			{
				player function_ed661177(#"hash_614322e468d90148");
			}
		}
	}
}

/*
	Name: function_dd00c744
	Namespace: namespace_78a95918
	Checksum: 0xDE6B01CC
	Offset: 0x23E0
	Size: 0x1DC
	Parameters: 1
	Flags: None
*/
function function_dd00c744(params)
{
	if(!gamestate::is_state(#"playing") || !isdefined(params.item))
	{
		return;
	}
	item = params.item;
	if(isplayer(self))
	{
		if(!isdefined(self.var_7c5ea163))
		{
			self.var_7c5ea163 = 0;
		}
		self.var_7c5ea163++;
		var_a6762160 = item.var_a6762160;
		self function_ed661177(#"hash_403147407bd1decc");
		if(var_a6762160.itemtype == #"backpack")
		{
			if(!is_true(self.var_9ed7994f))
			{
				self.var_9ed7994f = 1;
				self function_ed661177(#"hash_683a35f38b014b9");
			}
		}
		if(isdefined(item.targetname))
		{
			if(isdefined(level.var_f290f0ba[item.targetname]))
			{
				if(!isdefined(self.var_b4dfe8d3))
				{
					self.var_b4dfe8d3 = [];
				}
				self.var_b4dfe8d3[item.targetname] = 1;
				if(self.var_b4dfe8d3.size >= 2 && !is_true(self.var_8958535a))
				{
					self.var_8958535a = 1;
					self function_ed661177(#"hash_16305079185fffb7");
				}
			}
		}
	}
}

/*
	Name: function_314e09eb
	Namespace: namespace_78a95918
	Checksum: 0x87EF3E35
	Offset: 0x25C8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_314e09eb(item)
{
	if(isdefined(self.inventory) && isdefined(self.inventory.consumed))
	{
		if((isdefined(self.inventory.consumed.size + 1) ? self.inventory.consumed.size + 1 : 0) >= 5)
		{
			function_ed661177(#"hash_5d572a379b7adf62");
		}
	}
}

/*
	Name: function_9d4c3c52
	Namespace: namespace_78a95918
	Checksum: 0x91B354D5
	Offset: 0x2668
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_9d4c3c52(params)
{
	if(!gamestate::is_state(#"playing") || !isdefined(params.item))
	{
		return;
	}
	item = params.item;
	if(isplayer(self))
	{
		var_a6762160 = item.var_a6762160;
		if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
		{
			self function_ed661177(#"hash_209c6ecb45a25a6a");
		}
	}
}

/*
	Name: function_9b431779
	Namespace: namespace_78a95918
	Checksum: 0x1B1D1133
	Offset: 0x2738
	Size: 0x3EC
	Parameters: 1
	Flags: None
*/
function function_9b431779(n_time_played)
{
	n_time_played = float(n_time_played) / 60000;
	self function_ed661177(#"hash_372bbe55a27ec4af", n_time_played);
	switch(level.gametype)
	{
		case "hash_35f8ee90cbffa9e7":
		case "hash_705732a4b2fae093":
		{
			self function_ed661177(#"hash_1dbb5150a78086fb", n_time_played);
			break;
		}
		case "hash_327338a0b51bd1e4":
		case "hash_63ca3fdb7abe2758":
		{
			self function_ed661177(#"hash_67444eea6c3a2b4", n_time_played);
			break;
		}
		case "hash_14de0f7fa012b74f":
		case "hash_58d5a3978376b453":
		{
			self function_ed661177(#"hash_6f4d7d1506be4c97", n_time_played);
			break;
		}
		case "hash_b42506e4d4c358e":
		case "hash_135411bb98a54f65":
		case "hash_67bcd474fe4e62f6":
		{
			self function_ed661177(#"hash_bc7c4d0a20fd6b5", n_time_played);
			break;
		}
		case "warzone_hot_pursuit":
		{
			self function_ed661177(#"hash_47ce5d5ec0614886", n_time_played);
			break;
		}
		case "hash_4ac976029f8312d":
		case "hash_1aca23c137acc4c4":
		case "hash_5885c4aff962e114":
		{
			self function_ed661177(#"hash_395b9be57a35044e", n_time_played);
			break;
		}
		case "hash_168eea8163f308b":
		case "hash_7650e8c1507eaae3":
		case "hash_7b8c22ec4dfa6d6e":
		{
			self function_ed661177(#"hash_114034ef741c57c", n_time_played);
			break;
		}
		case "hash_34cb5dcee52ca389":
		case "hash_6ebd226da5b61bfb":
		case "warzone_dbno":
		{
			self function_ed661177(#"hash_137173b281445b4d", n_time_played);
			break;
		}
		case "hash_5c2ae02085e90527":
		case "hash_753fcf1725358921":
		{
			self function_ed661177(#"hash_16f3e3af0442596a", n_time_played);
			break;
		}
		case "hash_573d214827019393":
		{
			self function_ed661177(#"hash_533d85cab61c7cbe", n_time_played);
			break;
		}
	}
	var_819e1b79 = (isdefined(getgametypesetting(#"hash_648fb3af9bc11566")) ? getgametypesetting(#"hash_648fb3af9bc11566") : 0);
	if(var_819e1b79 == 1)
	{
		self function_ed661177(#"hash_17ed7af10aadfdbf", n_time_played);
	}
}

/*
	Name: get_alive_players
	Namespace: namespace_78a95918
	Checksum: 0x54D1C16A
	Offset: 0x2B30
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function get_alive_players(var_67bb0009)
{
	var_4553626a = [];
	foreach(team in level.teams)
	{
		var_22d28a75 = getplayers(team);
		foreach(player in var_22d28a75)
		{
			if(player === var_67bb0009)
			{
				continue;
			}
			if(isalive(player))
			{
				var_4553626a[var_4553626a.size] = player;
			}
		}
	}
	return var_4553626a;
}

/*
	Name: on_driving_wz_vehicle
	Namespace: namespace_78a95918
	Checksum: 0x5C3E4294
	Offset: 0x2C88
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function on_driving_wz_vehicle(params)
{
	if(level.inprematchperiod)
	{
		return;
	}
	vehicle = params.vehicle;
	player = params.player;
	seatindex = params.seatindex;
	var_9a8c81d3 = isairborne(vehicle);
	var_9f80c1b9 = vehicle.vehicleclass === "boat";
	var_e20fb13a = !var_9a8c81d3 && !var_9f80c1b9;
	if(var_9a8c81d3)
	{
		player.var_925d487 = 1;
	}
	else
	{
		if(var_9f80c1b9)
		{
			player.var_8a507747 = 1;
		}
		else if(var_e20fb13a)
		{
			player.var_45708ffb = 1;
			if(seatindex == 0)
			{
				vehicle thread function_6fcfeebb(player);
			}
		}
	}
	if(is_true(player.var_925d487) && is_true(player.var_8a507747) && is_true(player.var_45708ffb))
	{
		player function_ed661177(#"hash_80a5bc9c87ee9ae");
	}
}

/*
	Name: function_6fcfeebb
	Namespace: namespace_78a95918
	Checksum: 0xFF9FFFEA
	Offset: 0x2E30
	Size: 0x140
	Parameters: 1
	Flags: None
*/
function function_6fcfeebb(player)
{
	self endon(#"death");
	if(!isplayer(player))
	{
		return;
	}
	player endon(#"exit_vehicle");
	player endon(#"death");
	player endon(#"disconnect");
	player endon(#"change_seat");
	while(true)
	{
		self waittill(#"veh_inair");
		time = gettime();
		self waittill(#"veh_landed");
		var_6f285389 = gettime();
		var_3cb46af = (float(var_6f285389 - time)) / 1000;
		if(var_3cb46af >= 2)
		{
			player function_ed661177(#"hash_64c765ebb1ad37db");
		}
	}
}

/*
	Name: function_c55a0479
	Namespace: namespace_78a95918
	Checksum: 0x9B343567
	Offset: 0x2F78
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_c55a0479(params)
{
	if(!gamestate::is_state(#"playing") || !isdefined(params.activator))
	{
		return;
	}
	activator = params.activator;
	if(isplayer(activator))
	{
		if(isdefined(self.birthtime))
		{
			activator function_ed661177(#"hash_20b07175517ed179");
		}
	}
}

/*
	Name: function_5648f82
	Namespace: namespace_78a95918
	Checksum: 0xF664C80A
	Offset: 0x3020
	Size: 0x20E
	Parameters: 1
	Flags: None
*/
function function_5648f82(team)
{
	teamsize = getgametypesetting("maxTeamPlayers");
	if(isdefined(team))
	{
		foreach(player in getplayers(team))
		{
			player function_ed661177(#"hash_7e50a6cdb307039a");
			if(!isdefined(player.var_7c5ea163))
			{
				player.var_7c5ea163 = 0;
			}
			if(player.var_7c5ea163 <= 20)
			{
				player function_ed661177(#"hash_42580a6cc2bf989e");
			}
			if(!is_true(player.var_b2f09f9f))
			{
				player function_ed661177(#"hash_7d40878d77a51836");
			}
			switch(teamsize)
			{
				case 1:
				{
					player function_ed661177(#"hash_443909a5b54c22b9");
					break;
				}
				case 2:
				{
					player function_ed661177(#"hash_48730ce04835417f");
					break;
				}
				case 4:
				{
					player function_ed661177(#"hash_2c9ffdfc4e716112");
					break;
				}
			}
		}
	}
}

/*
	Name: devgui_setup
	Namespace: namespace_78a95918
	Checksum: 0x6C4E2D13
	Offset: 0x3238
	Size: 0xA24
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		var_74757534 = "";
		wait(3);
		contracts::function_e07e542b(var_74757534, undefined);
		var_c8d599b5 = "";
		var_78a6fb52 = var_74757534 + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		var_78a6fb52 = var_74757534 + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		var_78a6fb52 = var_74757534 + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		var_78a6fb52 = var_74757534 + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

