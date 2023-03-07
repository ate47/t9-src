#using scripts\zm_common\zm_trial_util.gsc;
#using script_6021ce59143452c3;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_497ab7da;

/*
	Name: function_364a2d5a
	Namespace: namespace_497ab7da
	Checksum: 0x3D6A1D2F
	Offset: 0x3C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_364a2d5a()
{
	level notify(1801441973);
}

/*
	Name: function_89f2df9
	Namespace: namespace_497ab7da
	Checksum: 0xF102BC48
	Offset: 0x3E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_42f44652a16988d8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_497ab7da
	Checksum: 0x2E4AD78D
	Offset: 0x430
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	if(util::get_map_name() === "zm_red")
	{
		level.var_b5079c7c = array("exp_lgt_ar_accurate_t8", "exp_lgt_ar_fastfire_t8", "exp_lgt_ar_modular_t8", "exp_lgt_ar_stealth_t8", "exp_lgt_bowie", "exp_lgt_lmg_standard_t8", "exp_lgt_pistol_revolver_t8", "exp_lgt_pistol_standard_t8", "exp_lgt_shotgun_pump_t8", "exp_lgt_shotgun_trenchgun_t8", "exp_lgt_smg_accurate_t8", "exp_lgt_smg_fastfire_t8", "exp_lgt_smg_handling_t8", "exp_lgt_smg_standard_t8", "exp_lgt_sniper_quickscope_t8", "exp_lgt_tr_leveraction_t8", "exp_lgt_tr_longburst_t8", "exp_lgt_tr_powersemi_t8");
	}
	else
	{
		level.var_b5079c7c = array("exp_lgt_ar_accurate_t8", "exp_lgt_ar_fastfire_t8", "exp_lgt_ar_modular_t8", "exp_lgt_ar_stealth_t8", "exp_lgt_ar_stealth_t8_2", "exp_lgt_bowie", "exp_lgt_bowie_2", "exp_lgt_lmg_standard_t8", "exp_lgt_pistol_burst_t8", "exp_lgt_pistol_standard_t8", "exp_lgt_shotgun_pump_t8", "exp_lgt_shotgun_trenchgun_t8", "exp_lgt_smg_accurate_t8", "exp_lgt_smg_accurate_t8_2", "exp_lgt_smg_drum_pistol_t8", "exp_lgt_smg_fastfire_t8", "exp_lgt_smg_handling_t8", "exp_lgt_smg_standard_t8", "exp_lgt_sniper_quickscope_t8", "exp_lgt_tr_leveraction_t8", "exp_lgt_tr_longburst_t8", "exp_lgt_tr_powersemi_t8");
	}
	zm_trial::register_challenge(#"hash_347b44dd26e1875", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_497ab7da
	Checksum: 0x1FBFBD25
	Offset: 0x630
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private on_begin(var_a29299fb)
{
	if(!is_true(level.var_9d606cae))
	{
		level.var_9d606cae = 1;
		level notify(#"hash_347b44dd26e1875");
		function_6fd56055();
		function_a4284cb4();
		function_47c81160();
		zm_trial_util::function_eea26e56();
		level.var_a29299fb = var_a29299fb;
		if(!isdefined(level.var_a29299fb))
		{
			function_d5e17413();
		}
		zm_trial_util::function_8036c103();
		function_ffdd5310();
	}
}

/*
	Name: on_end
	Namespace: namespace_497ab7da
	Checksum: 0xF4083439
	Offset: 0x718
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	/#
		assert(is_true(level.var_9d606cae));
	#/
	if(!round_reset)
	{
		function_fa70c8c4();
		function_c606ef4b();
		function_d7ee2133();
		zm_trial_util::function_ef1fce77();
		function_c348adcc();
		zm_trial_util::function_302c6014();
		level.var_9d606cae = undefined;
		function_c0da518d();
	}
}

/*
	Name: is_active
	Namespace: namespace_497ab7da
	Checksum: 0xA6C8FF5A
	Offset: 0x7E8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_347b44dd26e1875");
	return isdefined(challenge);
}

/*
	Name: function_8327d26e
	Namespace: namespace_497ab7da
	Checksum: 0x51455034
	Offset: 0x828
	Size: 0x176
	Parameters: 0
	Flags: Linked
*/
function function_8327d26e()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	self endon(#"chest_accessed");
	self.var_7672d70d = 0;
	if(isdefined(self.zbarrier))
	{
		self.zbarrier.var_7672d70d = 0;
	}
	level waittill(#"hash_347b44dd26e1875");
	if(level flag::get("moving_chest_now"))
	{
		return;
	}
	self.var_7672d70d = 1;
	if(isdefined(self.zbarrier))
	{
		self.zbarrier.var_7672d70d = 1;
		self.zbarrier notify(#"box_hacked_respin");
		if(isdefined(self.zbarrier.weapon_model))
		{
			self.zbarrier.weapon_model notify(#"kill_weapon_movement");
		}
		if(isdefined(self.zbarrier.weapon_model_dw))
		{
			self.zbarrier.weapon_model_dw notify(#"kill_weapon_movement");
		}
	}
	wait(0.1);
	self notify(#"trigger", {#activator:level});
}

/*
	Name: function_6fd56055
	Namespace: namespace_497ab7da
	Checksum: 0x856BDA7F
	Offset: 0x9A8
	Size: 0x2D8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fd56055()
{
	/#
		assert(isdefined(level._spawned_wallbuys));
	#/
	foreach(wallbuy in level._spawned_wallbuys)
	{
		target_struct = struct::get(wallbuy.target, "targetname");
		if(isdefined(target_struct) && isdefined(target_struct.target))
		{
			wallbuy_fx = getent(target_struct.target, "targetname");
			if(isdefined(wallbuy_fx))
			{
				wallbuy_fx ghost();
			}
		}
		model = struct::get(wallbuy.target, "targetname");
		if(isdefined(model) && isdefined(model.target))
		{
			var_393a819e = getent(model.target, "targetname");
			if(isdefined(var_393a819e))
			{
				var_393a819e ghost();
			}
		}
		if(isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientfieldname))
		{
			/#
				assert(!isdefined(wallbuy.var_d6cca569));
			#/
			wallbuy.var_d6cca569 = level clientfield::get(wallbuy.trigger_stub.clientfieldname);
			level clientfield::set(wallbuy.trigger_stub.clientfieldname, 0);
		}
	}
	foreach(var_2b84085b in level.var_b5079c7c)
	{
		level exploder::exploder(var_2b84085b);
	}
}

/*
	Name: function_fa70c8c4
	Namespace: namespace_497ab7da
	Checksum: 0x38D9F447
	Offset: 0xC88
	Size: 0x2B8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa70c8c4()
{
	/#
		assert(isdefined(level._spawned_wallbuys));
	#/
	foreach(wallbuy in level._spawned_wallbuys)
	{
		target_struct = struct::get(wallbuy.target, "targetname");
		if(isdefined(target_struct) && isdefined(target_struct.target))
		{
			wallbuy_fx = getent(target_struct.target, "targetname");
			if(isdefined(wallbuy_fx))
			{
				wallbuy_fx show();
			}
		}
		model = struct::get(wallbuy.target, "targetname");
		if(isdefined(model) && isdefined(model.target))
		{
			var_393a819e = getent(model.target, "targetname");
			if(isdefined(var_393a819e))
			{
				var_393a819e show();
			}
		}
		if(isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientfieldname))
		{
			/#
				assert(isdefined(wallbuy.var_d6cca569));
			#/
			level clientfield::set(wallbuy.trigger_stub.clientfieldname, wallbuy.var_d6cca569);
			wallbuy.var_d6cca569 = undefined;
		}
	}
	foreach(var_2b84085b in level.var_b5079c7c)
	{
		level exploder::exploder_stop(var_2b84085b);
	}
}

/*
	Name: _open_arcs
	Namespace: namespace_497ab7da
	Checksum: 0x5B3711AD
	Offset: 0xF48
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private _open_arcs(blocker)
{
	if(isdefined(blocker.script_noteworthy) && (blocker.script_noteworthy == "electric_door" || blocker.script_noteworthy == "local_electric_door"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_fcf197fa
	Namespace: namespace_497ab7da
	Checksum: 0x50775721
	Offset: 0xFA8
	Size: 0x26A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fcf197fa(targetname, show)
{
	blockers = getentarray(targetname, "targetname");
	if(isdefined(blockers))
	{
		foreach(blocker in blockers)
		{
			if(isdefined(blocker.target) && _open_arcs(blocker))
			{
				var_c819ac8 = getentarray(blocker.target, "targetname");
				if(isdefined(var_c819ac8))
				{
					foreach(var_1d6a70e8 in var_c819ac8)
					{
						if(isdefined(var_1d6a70e8.objectid) && !var_1d6a70e8 zm_utility::function_1a4d2910())
						{
							switch(var_1d6a70e8.objectid)
							{
								case "symbol_back_debris":
								case "symbol_front_power":
								case "symbol_back":
								case "symbol_front":
								case "symbol_front_debris":
								case "symbol_back_power":
								{
									if(show)
									{
										var_1d6a70e8 show();
									}
									else
									{
										var_1d6a70e8 ghost();
									}
									break;
								}
								default:
								{
									break;
								}
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_a4284cb4
	Namespace: namespace_497ab7da
	Checksum: 0x6A70D1E5
	Offset: 0x1220
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a4284cb4()
{
	function_fcf197fa("zombie_door", 0);
	function_fcf197fa("zombie_debris", 0);
}

/*
	Name: function_c606ef4b
	Namespace: namespace_497ab7da
	Checksum: 0x51FCFC47
	Offset: 0x1260
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c606ef4b()
{
	function_fcf197fa("zombie_door", 1);
	function_fcf197fa("zombie_debris", 1);
}

/*
	Name: function_4516d298
	Namespace: namespace_497ab7da
	Checksum: 0x58F73E03
	Offset: 0x12B0
	Size: 0x40
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4516d298()
{
	level endon(#"end_game");
	while(level flag::get("moving_chest_now"))
	{
		waitframe(1);
	}
}

/*
	Name: function_610df6d
	Namespace: namespace_497ab7da
	Checksum: 0x532C074C
	Offset: 0x12F8
	Size: 0x40
	Parameters: 0
	Flags: Linked, Private
*/
function private function_610df6d()
{
	level endon(#"end_game");
	while(is_true(self._box_open))
	{
		waitframe(1);
	}
}

/*
	Name: function_47c81160
	Namespace: namespace_497ab7da
	Checksum: 0xB02C1071
	Offset: 0x1340
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_47c81160()
{
	function_4516d298();
	if(level.chest_index != -1)
	{
		chest = level.chests[level.chest_index];
		chest function_610df6d();
		chest zm_magicbox::hide_chest(1);
	}
}

/*
	Name: function_d7ee2133
	Namespace: namespace_497ab7da
	Checksum: 0xF2B64C9B
	Offset: 0x13C0
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d7ee2133()
{
	function_4516d298();
	if(level.chest_index != -1)
	{
		chest = level.chests[level.chest_index];
		chest zm_magicbox::show_chest();
	}
}

/*
	Name: function_d5e17413
	Namespace: namespace_497ab7da
	Checksum: 0xEFA36D4C
	Offset: 0x1428
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d5e17413()
{
	if(!isdefined(level.var_5bfd847e) || !level flag::exists(level.var_5bfd847e))
	{
		return;
	}
	level clientfield::set("fasttravel_exploder", 0);
}

/*
	Name: function_c348adcc
	Namespace: namespace_497ab7da
	Checksum: 0xAB5FCBA7
	Offset: 0x1490
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c348adcc()
{
	if(!isdefined(level.var_5bfd847e) || !level flag::exists(level.var_5bfd847e))
	{
		return;
	}
	if(level flag::get(level.var_5bfd847e))
	{
		level clientfield::set("fasttravel_exploder", 1);
	}
}

/*
	Name: function_ffdd5310
	Namespace: namespace_497ab7da
	Checksum: 0x1AD12F31
	Offset: 0x1518
	Size: 0xE0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ffdd5310()
{
	var_ec9e2b1d = getentarray("zombie_trap", "targetname");
	str_text = #"hash_55d25caf8f7bbb2f";
	foreach(var_9bda8088 in var_ec9e2b1d)
	{
		var_9bda8088 zm_traps::trap_set_string(str_text);
	}
	level notify(#"hash_3c662e7b29cfc3dd");
}

/*
	Name: function_c0da518d
	Namespace: namespace_497ab7da
	Checksum: 0xCBB2BE6
	Offset: 0x1600
	Size: 0xE8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c0da518d()
{
	var_ec9e2b1d = getentarray("zombie_trap", "targetname");
	str_text = #"hash_23c1c09e94181fdb";
	foreach(var_9bda8088 in var_ec9e2b1d)
	{
		var_9bda8088 zm_traps::trap_set_string(str_text, var_9bda8088.zombie_cost);
	}
	level notify(#"traps_available");
}

