#using script_4108035fe400ce67;
#using script_73bd646be3641c07;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_4abf1500;

/*
	Name: function_89f2df9
	Namespace: namespace_4abf1500
	Checksum: 0xE51FA993
	Offset: 0x180
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_63e00d742a373f5f", &function_70a657d8, &function_8ac3bea9, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_4abf1500
	Checksum: 0x9D67C1BD
	Offset: 0x1E0
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_475f3329eaf62eaf", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_1a818fdb4337dc5e", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_711c8fee28432b7", 1, getminbitcountfornum(28), "int");
	level.var_238bd723 = struct::get_script_bundle_instances("zmintel");
	level.var_14e8600c = 1;
	level.var_eb704e15 = [];
	level.var_54f9341 = function_9b30a057();
	level.var_731907e8 = level.var_54f9341.size;
	level.var_df1d1235 = 0;
	callback::on_connect(&on_connect);
	callback::on_ai_killed(&on_ai_killed);
	callback::function_10a4dd0a(&function_b0049c2a);
	level thread function_696dd88b();
	level thread function_aa317cfe();
	/#
		level thread function_ded2880a();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_4abf1500
	Checksum: 0x80F724D1
	Offset: 0x3E8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_9b30a057
	Namespace: namespace_4abf1500
	Checksum: 0x60651659
	Offset: 0x3F8
	Size: 0x16A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9b30a057()
{
	var_ce9ccdf6 = getscriptbundles(#"zmintel");
	var_a2b0b0d1 = [];
	foreach(var_19a3087c in var_ce9ccdf6)
	{
		if(var_19a3087c.mapname === level.script && function_46181f8c(var_19a3087c) && function_fe74d984(var_19a3087c))
		{
			if(!isdefined(var_a2b0b0d1))
			{
				var_a2b0b0d1 = [];
			}
			else if(!isarray(var_a2b0b0d1))
			{
				var_a2b0b0d1 = array(var_a2b0b0d1);
			}
			if(!isinarray(var_a2b0b0d1, var_19a3087c.name))
			{
				var_a2b0b0d1[var_a2b0b0d1.size] = var_19a3087c.name;
			}
		}
	}
	return var_a2b0b0d1;
}

/*
	Name: function_32b4eecc
	Namespace: namespace_4abf1500
	Checksum: 0x6119FB6C
	Offset: 0x570
	Size: 0xA2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_32b4eecc()
{
	var_731907e8 = 0;
	foreach(var_d5fa8477 in level.var_54f9341)
	{
		if(self function_f0f36d47(var_d5fa8477))
		{
			var_731907e8++;
		}
	}
	return var_731907e8;
}

/*
	Name: function_fe74d984
	Namespace: namespace_4abf1500
	Checksum: 0x64170C06
	Offset: 0x620
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe74d984(var_37a01ce0)
{
	if(isstring(var_37a01ce0) || function_7a600918(var_37a01ce0))
	{
		var_19a3087c = getscriptbundle(var_37a01ce0);
	}
	else
	{
		var_19a3087c = var_37a01ce0;
	}
	if(var_19a3087c.var_83e219de === #"exclusive" && !is_true(level.orbis))
	{
		return false;
	}
	return true;
}

/*
	Name: function_46181f8c
	Namespace: namespace_4abf1500
	Checksum: 0xD9949F8A
	Offset: 0x6E0
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_46181f8c(var_37a01ce0)
{
	if(isstring(var_37a01ce0) || function_7a600918(var_37a01ce0))
	{
		var_19a3087c = getscriptbundle(var_37a01ce0);
	}
	else
	{
		var_19a3087c = var_37a01ce0;
	}
	switch(level.var_14e8600c)
	{
		case 0:
		{
			if(!isdefined(var_19a3087c.season))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		case 1:
		{
			if(!isdefined(var_19a3087c.season) || var_19a3087c.season === 1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		case 2:
		{
			if(!isdefined(var_19a3087c.season) || var_19a3087c.season === 1 || var_19a3087c.season === 2)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_88645994
	Namespace: namespace_4abf1500
	Checksum: 0x740361EB
	Offset: 0x838
	Size: 0xDC
	Parameters: 9
	Flags: None
*/
function function_88645994(var_6f94d397, var_c14aedb3, var_539eabc0, var_765715e3, var_d5f7338b, var_cb9b032f, var_e082343f, var_3e815633, var_baa9c135)
{
	level.var_9ff51719 = var_6f94d397;
	level.var_64d3d5c4 = var_c14aedb3;
	level.var_13ebf509 = var_539eabc0;
	level.var_1e898375 = var_765715e3;
	level.var_b131552c = var_d5f7338b;
	level.var_a62e1750 = var_cb9b032f;
	level.var_bc543de = var_e082343f;
	level.var_fc3c65a7 = var_3e815633;
	level.var_4b66954c = var_baa9c135;
}

/*
	Name: on_connect
	Namespace: namespace_4abf1500
	Checksum: 0x4B81B6D4
	Offset: 0x920
	Size: 0x1A
	Parameters: 0
	Flags: Linked, Private
*/
function private on_connect()
{
	self.var_9d781602 = [];
	self.var_e2d764da = 0;
}

/*
	Name: function_aa317cfe
	Namespace: namespace_4abf1500
	Checksum: 0x8EDA10EC
	Offset: 0x948
	Size: 0x358
	Parameters: 0
	Flags: Linked
*/
function function_aa317cfe()
{
	level flag::wait_till("start_zombie_round_logic");
	var_80198f58 = struct::get_array("zm_intel_radio_transmission_locations");
	foreach(var_41c6d68b in var_80198f58)
	{
		switch(var_41c6d68b.faction)
		{
			case "requiem":
			{
				var_bed5445b = #"p9_zm_ndu_radio_transmissions_r";
				var_32edbef9 = #"hash_405e81feb85c5162";
				break;
			}
			case "maxis":
			{
				var_bed5445b = #"p9_zm_ndu_radio_transmissions";
				var_32edbef9 = #"hash_6fec31948ca2058c";
				break;
			}
			case "hash_3460cbae3ad8be88":
			{
				var_bed5445b = #"p9_zm_ndu_reel_to_reel_audio_recorder_01";
				var_32edbef9 = #"hash_28fec49f37a535b9";
				break;
			}
		}
		if(!isdefined(var_32edbef9))
		{
			continue;
		}
		var_41c6d68b.var_bdb97676 = util::spawn_model((isdefined(var_41c6d68b.model) ? var_41c6d68b.model : var_bed5445b), var_41c6d68b.origin, var_41c6d68b.angles);
		var_41c6d68b.var_bdb97676.var_32edbef9 = var_32edbef9;
		var_41c6d68b.var_bdb97676.var_9be0526e = #"hash_20ea75a25d912949";
		var_41c6d68b.var_bdb97676.var_71396476 = 1;
		var_41c6d68b.var_bdb97676 function_619a5c20();
		var_41c6d68b.var_bdb97676 namespace_5b1144e::function_9e0598bb(5);
		if(isdefined(var_41c6d68b.var_75b8887d) && var_41c6d68b.var_75b8887d != (0, 0, 0))
		{
			dimensions = var_41c6d68b.var_75b8887d;
		}
		else if(isdefined(var_41c6d68b.radius) && var_41c6d68b.radius != 0)
		{
			dimensions = var_41c6d68b.radius;
		}
		var_41c6d68b.var_bdb97676 zm_unitrigger::create(&function_8176b2c7, (isdefined(dimensions) ? dimensions : 100), &function_a78987b);
		zm_unitrigger::unitrigger_force_per_player_triggers(var_41c6d68b.var_bdb97676.s_unitrigger, 1);
		zm_unitrigger::function_89380dda(var_41c6d68b.var_bdb97676.s_unitrigger);
	}
}

/*
	Name: function_696dd88b
	Namespace: namespace_4abf1500
	Checksum: 0x46D93E89
	Offset: 0xCA8
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_696dd88b()
{
	level flag::wait_till("start_zombie_round_logic");
	foreach(var_495fa1f8 in level.var_238bd723)
	{
		if(is_true(var_495fa1f8.script_enable_on_start))
		{
			var_495fa1f8 thread function_23255935();
		}
	}
}

/*
	Name: function_23255935
	Namespace: namespace_4abf1500
	Checksum: 0x70B9A488
	Offset: 0xD78
	Size: 0x60C
	Parameters: 1
	Flags: Linked
*/
function function_23255935(str_targetname)
{
	var_99bf2e73 = self;
	if(isdefined(str_targetname))
	{
		var_99bf2e73 = struct::get(str_targetname);
	}
	if(isdefined(var_99bf2e73.scriptbundlename) && !isdefined(var_99bf2e73.var_bdb97676) && !function_1a594d26(var_99bf2e73.scriptbundlename))
	{
		s_bundle = getscriptbundle(var_99bf2e73.scriptbundlename);
		if(isdefined(s_bundle.var_6269746d))
		{
			point = function_4ba8fde(s_bundle.var_6269746d);
			if(isdefined(point.var_a6762160))
			{
				n_count = 0;
				var_d5fa8477 = var_99bf2e73.scriptbundlename;
				foreach(player in getplayers())
				{
					if(!player function_f0f36d47(var_d5fa8477))
					{
						n_count++;
					}
				}
				if(n_count == 0)
				{
					return;
				}
				var_99bf2e73.var_bdb97676 = item_drop::drop_item(0, undefined, n_count, 0, point.id, var_99bf2e73.origin, var_99bf2e73.angles, 1);
				var_99bf2e73.var_bdb97676.var_cbbbaf39 = 1;
				foreach(player in getplayers())
				{
					if(player function_f0f36d47(var_d5fa8477))
					{
						var_99bf2e73.var_bdb97676 hidefromplayer(player);
					}
				}
			}
		}
		else
		{
			if(isdefined(s_bundle.model))
			{
				var_99bf2e73.var_bdb97676 = util::spawn_model(s_bundle.model, var_99bf2e73.origin, var_99bf2e73.angles);
			}
			else
			{
				return;
			}
		}
		var_99bf2e73.var_bdb97676 function_619a5c20();
		var_99bf2e73.var_bdb97676 namespace_5b1144e::function_9e0598bb(5);
		var_99bf2e73.var_bdb97676.var_d5fa8477 = var_99bf2e73.scriptbundlename;
		var_99bf2e73.var_bdb97676.script_flag_true = var_99bf2e73.script_flag_true;
		var_99bf2e73.var_bdb97676.str_faction = s_bundle.var_ad4ad686;
		var_99bf2e73.var_bdb97676.var_2b372cf6 = s_bundle.var_9be0526e;
		var_99bf2e73.var_bdb97676.var_9be0526e = s_bundle.var_9be0526e;
		if(isdefined(var_99bf2e73.modelscale) && var_99bf2e73.modelscale != 1)
		{
			var_99bf2e73.var_bdb97676 setscale(var_99bf2e73.modelscale);
			if(isarray(var_99bf2e73.var_bdb97676.var_9981940d))
			{
				foreach(var_56541b8b in var_99bf2e73.var_bdb97676.var_9981940d)
				{
					var_56541b8b setscale(var_99bf2e73.modelscale);
				}
			}
		}
		if(!is_true(var_99bf2e73.var_bdb97676.var_cbbbaf39))
		{
			if(isdefined(var_99bf2e73.var_75b8887d) && var_99bf2e73.var_75b8887d != (0, 0, 0))
			{
				dimensions = var_99bf2e73.var_75b8887d;
			}
			else if(isdefined(var_99bf2e73.radius) && var_99bf2e73.radius != 0)
			{
				dimensions = var_99bf2e73.radius;
			}
			var_99bf2e73.var_bdb97676 zm_unitrigger::create(&function_8176b2c7, (isdefined(dimensions) ? dimensions : 100), &function_a78987b);
			zm_unitrigger::unitrigger_force_per_player_triggers(var_99bf2e73.var_bdb97676.s_unitrigger, 1);
			zm_unitrigger::function_89380dda(var_99bf2e73.var_bdb97676.s_unitrigger);
		}
		if(isdefined(var_99bf2e73.var_bdb97676) && isdefined(s_bundle.soundloop))
		{
			var_99bf2e73.var_bdb97676 playloopsound(s_bundle.soundloop);
		}
	}
}

/*
	Name: function_2ba45c94
	Namespace: namespace_4abf1500
	Checksum: 0x2061C397
	Offset: 0x1390
	Size: 0x480
	Parameters: 7
	Flags: Linked
*/
function function_2ba45c94(var_d5fa8477, v_pos, v_ang, var_cd038aea, var_d65061b2, b_play_fx, var_b09e2381)
{
	if(!isdefined(v_ang))
	{
		v_ang = (0, 0, 0);
	}
	if(!isdefined(var_d65061b2))
	{
		var_d65061b2 = 0;
	}
	if(!isdefined(b_play_fx))
	{
		b_play_fx = 0;
	}
	s_bundle = getscriptbundle(var_d5fa8477);
	if(isdefined(s_bundle.var_6269746d))
	{
		point = function_4ba8fde(s_bundle.var_6269746d);
		if(isdefined(point.var_a6762160))
		{
			var_bdb97676 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_pos, v_ang, 2);
			var_bdb97676.var_d5fa8477 = hash(var_d5fa8477);
			var_bdb97676.var_cbbbaf39 = 1;
			var_bdb97676.var_b09e2381 = var_b09e2381;
			foreach(player in getplayers())
			{
				if(player function_f0f36d47(var_d5fa8477) || (isdefined(var_bdb97676.var_b09e2381) && player.name != var_bdb97676.var_b09e2381))
				{
					var_bdb97676 hidefromplayer(player);
				}
			}
		}
		else
		{
			var_bdb97676 = util::spawn_model((isdefined(s_bundle.model) ? s_bundle.model : "tag_origin"), v_pos, v_ang);
			var_bdb97676 function_619a5c20();
			var_bdb97676 namespace_5b1144e::function_9e0598bb(5);
			var_bdb97676.var_d5fa8477 = hash(var_d5fa8477);
			var_3e4e3c6a = 1;
		}
	}
	else
	{
		var_bdb97676 = util::spawn_model((isdefined(s_bundle.model) ? s_bundle.model : "tag_origin"), v_pos, v_ang);
		var_bdb97676.var_d5fa8477 = hash(var_d5fa8477);
		var_3e4e3c6a = 1;
	}
	if(var_d65061b2)
	{
		var_bdb97676 rotate(vectorscale((0, 1, 0), 90));
		var_bdb97676 bobbing((0, 0, 1), 2, 1.5);
	}
	if(b_play_fx)
	{
		var_bdb97676 clientfield::set("" + #"hash_475f3329eaf62eaf", 1);
	}
	if(is_true(var_3e4e3c6a))
	{
		s_unitrigger = var_bdb97676 zm_unitrigger::create(&function_8176b2c7, (isdefined(var_cd038aea) ? var_cd038aea : 100), &function_a78987b);
		zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
		zm_unitrigger::function_89380dda(s_unitrigger);
	}
	if(isdefined(s_bundle.soundloop))
	{
		var_bdb97676 playloopsound(s_bundle.soundloop);
	}
	/#
		var_bdb97676 thread function_fe024191();
	#/
	return var_bdb97676;
}

/*
	Name: function_fe024191
	Namespace: namespace_4abf1500
	Checksum: 0x40BE477
	Offset: 0x1818
	Size: 0x1EE
	Parameters: 0
	Flags: Private
*/
function private function_fe024191()
{
	/#
		self endon(#"death");
		while(true)
		{
			if(!getdvarint(#"hash_35f8849a638e6c8f", 0))
			{
				waitframe(1);
				continue;
			}
			var_db08e6c3 = "";
			foreach(n_index, player in getplayers())
			{
				if(isdefined(self.var_b09e2381) && player.name == self.var_b09e2381 || (!isdefined(self.var_b09e2381) && !player function_f0f36d47(self.var_d5fa8477)))
				{
					var_db08e6c3 = var_db08e6c3 + (isdefined(player.name) ? player.name : "");
					if(n_index != (getplayers().size - 1))
					{
						var_db08e6c3 = var_db08e6c3 + "";
					}
				}
			}
			print3d(self.origin, (function_9e72a96(self.var_d5fa8477) + "") + var_db08e6c3, (0, 1, 0), undefined, 0.2);
			waitframe(1);
		}
	#/
}

/*
	Name: function_c1974629
	Namespace: namespace_4abf1500
	Checksum: 0xE3E3D23C
	Offset: 0x1A10
	Size: 0x27E
	Parameters: 2
	Flags: None
*/
function function_c1974629(var_3dfc6e69, n_power)
{
	if(!isdefined(n_power))
	{
		n_power = 200;
	}
	if(isstruct(self))
	{
		var_bdb97676 = self.var_bdb97676;
	}
	else
	{
		var_bdb97676 = self;
	}
	if(!isdefined(var_bdb97676))
	{
		return;
	}
	if(!isdefined(var_3dfc6e69) && isdefined(self.target))
	{
		target = getent(self.target, "targetname");
		if(!isdefined(target))
		{
			target = struct::get(self.target, "targetname");
		}
		var_3dfc6e69 = target.origin;
		var_efc184d0 = target.angles;
	}
	/#
		/#
			assert(isdefined(var_3dfc6e69), "" + function_9e72a96(var_bdb97676.var_d5fa8477));
		#/
	#/
	if(is_true(var_bdb97676.var_cbbbaf39))
	{
		n_time = var_bdb97676 zm_utility::fake_physicslaunch(var_3dfc6e69, n_power);
		wait(n_time);
		var_bdb97676.origin = var_3dfc6e69;
		if(isdefined(var_efc184d0))
		{
			var_bdb97676.angles = var_efc184d0;
		}
		if(isstruct(self))
		{
			self.origin = var_bdb97676.origin;
			self.angles = var_bdb97676.angles;
		}
	}
	else
	{
		n_time = var_bdb97676 zm_utility::fake_physicslaunch(var_3dfc6e69, n_power);
		wait(n_time);
		var_bdb97676.origin = var_3dfc6e69;
		if(isdefined(var_efc184d0))
		{
			var_bdb97676.angles = var_efc184d0;
		}
		zm_unitrigger::function_47625e58(var_bdb97676.s_unitrigger, var_bdb97676.origin, var_bdb97676.angles);
		if(isstruct(self))
		{
			self.origin = var_bdb97676.origin;
			self.angles = var_bdb97676.angles;
		}
	}
}

/*
	Name: function_b0049c2a
	Namespace: namespace_4abf1500
	Checksum: 0xCC4DACA0
	Offset: 0x1C98
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b0049c2a(params)
{
	item = params.item;
	if(isplayer(self) && isdefined(item.var_d5fa8477) && !self function_f0f36d47(item.var_d5fa8477))
	{
		self collect_intel(item.var_d5fa8477, item);
	}
}

/*
	Name: function_8176b2c7
	Namespace: namespace_4abf1500
	Checksum: 0x80F76691
	Offset: 0x1D30
	Size: 0x350
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8176b2c7(e_player)
{
	var_bdb97676 = self.stub.related_parent;
	if(isdefined(var_bdb97676.script_flag_true) && !level flag::get(var_bdb97676.script_flag_true))
	{
		var_bdb97676 ghost();
		if(isarray(var_bdb97676.var_9981940d))
		{
			array::run_all(var_bdb97676.var_9981940d, &ghost);
		}
		return false;
	}
	if(var_bdb97676.var_9be0526e === #"hash_20ea75a25d912949" && level flag::get(#"dark_aether_active"))
	{
		return false;
	}
	if(isdefined(var_bdb97676.var_32edbef9))
	{
		if(!isdefined(var_bdb97676.var_56c62073))
		{
			var_bdb97676.var_56c62073 = [];
		}
		if(!isdefined(var_bdb97676.var_56c62073[e_player.name]) || isdefined(level.var_fa1d4366))
		{
			var_bdb97676.var_56c62073[e_player.name] = function_2bcfd899(var_bdb97676.var_32edbef9, e_player);
		}
		var_d5fa8477 = var_bdb97676.var_56c62073[e_player.name];
	}
	else
	{
		var_d5fa8477 = var_bdb97676.var_d5fa8477;
	}
	if(!isdefined(var_d5fa8477) || e_player function_f0f36d47(var_d5fa8477))
	{
		if(isdefined(var_d5fa8477) && is_true(level.var_eb704e15[var_d5fa8477][e_player.name]))
		{
			return false;
		}
		if(var_bdb97676.var_9be0526e === #"hash_20ea75a25d912949")
		{
			if(e_player function_a3e4f9a1(var_bdb97676.var_32edbef9))
			{
				self sethintstringforplayer(e_player, #"hash_4c0799e45640f98c");
			}
			else
			{
				return false;
			}
		}
		else
		{
			var_bdb97676 hidefromplayer(e_player);
			return false;
		}
		return true;
	}
	var_bdb97676 showtoplayer(e_player);
	if(isarray(var_bdb97676.var_9981940d))
	{
		array::run_all(var_bdb97676.var_9981940d, &show);
	}
	self sethintstringforplayer(e_player, e_player zm_utility::function_d6046228(#"hash_33ae89d6ac634cd3", #"hash_5ab1861040dfa3f9"));
	return true;
}

/*
	Name: function_a78987b
	Namespace: namespace_4abf1500
	Checksum: 0x8FF0FB17
	Offset: 0x2088
	Size: 0x120
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a78987b(e_player)
{
	self endon(#"death");
	var_bdb97676 = self.stub.related_parent;
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		e_player = var_be17187b.activator;
		if(isdefined(var_bdb97676.var_56c62073[e_player.name]))
		{
			var_d5fa8477 = var_bdb97676.var_56c62073[e_player.name];
		}
		else
		{
			var_d5fa8477 = var_bdb97676.var_d5fa8477;
		}
		if(!isdefined(var_d5fa8477) || !zm_utility::can_use(e_player, 0) || e_player function_f0f36d47(var_d5fa8477))
		{
			continue;
		}
		e_player thread collect_intel(var_d5fa8477, var_bdb97676);
	}
}

/*
	Name: collect_intel
	Namespace: namespace_4abf1500
	Checksum: 0xE86728A9
	Offset: 0x21B0
	Size: 0x48C
	Parameters: 3
	Flags: Linked
*/
function collect_intel(var_d5fa8477, var_bdb97676, var_eac6151d)
{
	if(isstring(var_d5fa8477))
	{
		var_d5fa8477 = hash(var_d5fa8477);
	}
	/#
		var_65679637 = getscriptbundlenames("");
		/#
			assert(isinarray(var_65679637, var_d5fa8477), function_9e72a96(var_d5fa8477) + "");
		#/
	#/
	if(!self function_f0f36d47(var_d5fa8477))
	{
		var_f83e960b = 1;
	}
	self function_7e211a10(var_d5fa8477);
	self zm_stats::function_a6b15f2c(var_d5fa8477, 1);
	self function_bc82f900(#"hash_410bd55524ae7d");
	if(!isdefined(self.var_9d781602))
	{
		self.var_9d781602 = [];
	}
	else if(!isarray(self.var_9d781602))
	{
		self.var_9d781602 = array(self.var_9d781602);
	}
	if(!isinarray(self.var_9d781602, var_d5fa8477))
	{
		self.var_9d781602[self.var_9d781602.size] = var_d5fa8477;
	}
	self notify(#"intel_collected");
	if(is_true(var_f83e960b))
	{
		currentprogress = self function_32b4eecc();
		var_d486b6 = level.var_731907e8;
		self luinotifyevent(#"hash_c587d2e4faec420", 3, var_d5fa8477, currentprogress, var_d486b6);
	}
	/#
		iprintln((("" + self getentitynumber()) + "") + function_9e72a96(var_d5fa8477));
	#/
	level.var_eb704e15[var_d5fa8477][self.name] = 1;
	self function_3f3be625(var_d5fa8477, (isdefined(var_eac6151d) ? var_eac6151d : var_bdb97676));
	if(isplayer(self))
	{
		level.var_eb704e15[var_d5fa8477][self.name] = undefined;
	}
	if(isdefined(var_bdb97676) && !is_true(var_bdb97676.var_71396476))
	{
		if(function_1a594d26(var_d5fa8477) || (isdefined(var_bdb97676.var_b09e2381) && isdefined(self.name) && var_bdb97676.var_b09e2381 == self.name))
		{
			if(isdefined(var_bdb97676.s_unitrigger))
			{
				zm_unitrigger::unregister_unitrigger(var_bdb97676.s_unitrigger);
			}
			if(isarray(var_bdb97676.var_9981940d))
			{
				array::delete_all(var_bdb97676.var_9981940d);
				var_bdb97676.var_9981940d = undefined;
			}
			if(is_true(var_bdb97676.var_cbbbaf39))
			{
				item_world::function_7730442c(var_bdb97676);
			}
			else
			{
				var_bdb97676 delete();
			}
		}
		else if(isdefined(var_bdb97676) && isplayer(self))
		{
			var_bdb97676 hidefromplayer(self);
		}
	}
}

/*
	Name: function_7e211a10
	Namespace: namespace_4abf1500
	Checksum: 0xC4CAB325
	Offset: 0x2648
	Size: 0x5CA
	Parameters: 1
	Flags: Linked
*/
function function_7e211a10(var_d5fa8477)
{
	if(isdefined(level.var_a62e1750))
	{
		var_6c41667f = getscriptbundle(level.var_a62e1750);
		if(isarray(var_6c41667f.var_572513bb) && var_6c41667f.var_572513bb.size)
		{
			foreach(var_ea06eccb in var_6c41667f.var_572513bb)
			{
				if(var_ea06eccb.season === #"hash_3c8cc59cdaa4bb29")
				{
					continue;
				}
				if(isdefined(self) && var_d5fa8477 === hash(var_ea06eccb.var_cb9cd317) && !self function_f0f36d47(var_ea06eccb.var_cb9cd317))
				{
					self zm_stats::increment_challenge_stat(#"hash_607cee7194682397");
					return;
				}
			}
		}
	}
	if(isdefined(level.var_fc3c65a7))
	{
		var_bd7c92ca = getscriptbundle(level.var_fc3c65a7);
		if(isarray(var_bd7c92ca.var_572513bb) && var_bd7c92ca.var_572513bb.size)
		{
			foreach(var_71fdaa63 in var_bd7c92ca.var_572513bb)
			{
				if(var_71fdaa63.season === #"hash_3c8cc59cdaa4bb29")
				{
					continue;
				}
				if(isdefined(self) && var_d5fa8477 === hash(var_71fdaa63.var_cb9cd317) && !self function_f0f36d47(var_71fdaa63.var_cb9cd317))
				{
					self zm_stats::increment_challenge_stat(#"hash_1cb9f04cdc593ac2");
					return;
				}
			}
		}
	}
	if(isdefined(level.var_bc543de))
	{
		var_24cb44c7 = getscriptbundle(level.var_bc543de);
		if(isarray(var_24cb44c7.var_572513bb) && var_24cb44c7.var_572513bb.size)
		{
			foreach(var_edc4bdb7 in var_24cb44c7.var_572513bb)
			{
				if(var_edc4bdb7.season === #"hash_3c8cc59cdaa4bb29")
				{
					continue;
				}
				if(isdefined(self) && var_d5fa8477 === hash(var_edc4bdb7.var_cb9cd317) && !self function_f0f36d47(var_edc4bdb7.var_cb9cd317))
				{
					self zm_stats::increment_challenge_stat(#"hash_6289f0dc7ba983ec");
					return;
				}
			}
		}
	}
	if(isdefined(level.var_4b66954c))
	{
		var_16642490 = getscriptbundle(level.var_4b66954c);
		if(isarray(var_16642490.var_572513bb) && var_16642490.var_572513bb.size)
		{
			foreach(var_32d7f225 in var_16642490.var_572513bb)
			{
				if(var_32d7f225.season === #"hash_3c8cc59cdaa4bb29")
				{
					continue;
				}
				if(isdefined(self) && var_d5fa8477 === hash(var_32d7f225.var_cb9cd317) && !self function_f0f36d47(var_32d7f225.var_cb9cd317))
				{
					self zm_stats::increment_challenge_stat(#"hash_4748a07c715661dc");
					return;
				}
			}
		}
	}
}

/*
	Name: function_f0f36d47
	Namespace: namespace_4abf1500
	Checksum: 0x2F6E75ED
	Offset: 0x2C20
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_f0f36d47(var_d5fa8477)
{
	/#
		/#
			assert(isdefined(var_d5fa8477), "");
		#/
	#/
	if(self zm_stats::function_376778d3(var_d5fa8477) || isinarray(self.var_9d781602, hash(var_d5fa8477)))
	{
		return true;
	}
	return false;
}

/*
	Name: function_3a2dd570
	Namespace: namespace_4abf1500
	Checksum: 0xC5C0E864
	Offset: 0x2CB0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_3a2dd570(e_player)
{
	if(isplayer(e_player))
	{
		if(!isplayer(self) && isdefined(self.var_9be0526e) && self.var_9be0526e != #"hash_20ea75a25d912949")
		{
			self hidefromplayer(e_player);
		}
		e_player clientfield::increment_to_player("" + #"hash_1a818fdb4337dc5e");
		util::wait_network_frame();
	}
}

/*
	Name: function_3f3be625
	Namespace: namespace_4abf1500
	Checksum: 0x8232B0F
	Offset: 0x2D80
	Size: 0x40C
	Parameters: 2
	Flags: Linked
*/
function function_3f3be625(var_d5fa8477, var_eac6151d)
{
	self endon(#"disconnect");
	/#
		if(getdvarint(#"hash_4f30c8114ee899d3", 0))
		{
			return;
		}
	#/
	if(isdefined(var_eac6151d))
	{
		var_eac6151d stoploopsound();
		var_eac6151d endon(#"death");
	}
	else
	{
		var_eac6151d = self;
	}
	if(isarray(var_eac6151d.var_7e1c3be1) && var_eac6151d.var_7e1c3be1.size)
	{
		foreach(var_b3130155 in var_eac6151d.var_7e1c3be1)
		{
			var_eac6151d stopsound(var_b3130155);
		}
		var_eac6151d.var_7e1c3be1 = [];
	}
	s_bundle = getscriptbundle(var_d5fa8477);
	var_eac6151d function_bd78aea0(s_bundle, self);
	if(isarray(s_bundle.var_1ad142ee) && s_bundle.var_1ad142ee.size)
	{
		if(is_true(s_bundle.var_2a12d36))
		{
			foreach(var_73a92203 in s_bundle.var_1ad142ee)
			{
				if(index == (s_bundle.var_1ad142ee.size - 1))
				{
					var_eac6151d function_8a6749e9(var_73a92203.var_46bd7973, self, var_73a92203.var_f35c5951);
					continue;
				}
				var_eac6151d thread function_8a6749e9(var_73a92203.var_46bd7973, self, var_73a92203.var_f35c5951);
			}
		}
		else
		{
			foreach(var_73a92203 in s_bundle.var_1ad142ee)
			{
				var_eac6151d function_8a6749e9(var_73a92203.var_46bd7973, self, undefined, var_73a92203.var_f35c5951);
			}
		}
		if(isdefined(var_eac6151d.script_flag_true) && !level flag::get(var_eac6151d.script_flag_true))
		{
			var_eac6151d showtoplayer(self);
			var_eac6151d stopsounds();
			util::wait_network_frame();
			if(isdefined(var_eac6151d) && isplayer(self))
			{
				var_eac6151d hidefromplayer(self);
			}
		}
	}
	var_eac6151d function_8f6791a4(s_bundle, self);
}

/*
	Name: function_8a6749e9
	Namespace: namespace_4abf1500
	Checksum: 0x97D0116D
	Offset: 0x3198
	Size: 0x22C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_8a6749e9(var_9c1ebb19, e_player, var_dcfc156f, var_c736b731)
{
	if(!isdefined(self) || !isdefined(e_player))
	{
		return;
	}
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	else
	{
		self endon(#"death");
	}
	if(isplayer(e_player))
	{
		e_player endon(#"disconnect");
	}
	if(isdefined(self.script_flag_true))
	{
		if(level flag::get(self.script_flag_true))
		{
			level endon(self.script_flag_true);
		}
		else
		{
			return;
		}
	}
	if(isdefined(var_9c1ebb19))
	{
		if(isdefined(var_dcfc156f))
		{
			wait(var_dcfc156f);
		}
		self playsoundtoplayer(var_9c1ebb19, e_player);
		if(!isdefined(self.var_7e1c3be1))
		{
			self.var_7e1c3be1 = [];
		}
		else if(!isarray(self.var_7e1c3be1))
		{
			self.var_7e1c3be1 = array(self.var_7e1c3be1);
		}
		self.var_7e1c3be1[self.var_7e1c3be1.size] = var_9c1ebb19;
		var_2690dae = float((isdefined(soundgetplaybacktime(var_9c1ebb19)) ? soundgetplaybacktime(var_9c1ebb19) : 0)) / 1000;
		var_2690dae = max(var_2690dae, 0.1);
		wait(var_2690dae);
		if(isdefined(var_c736b731))
		{
			wait(var_c736b731);
		}
		arrayremovevalue(self.var_7e1c3be1, var_9c1ebb19);
	}
}

/*
	Name: function_bd78aea0
	Namespace: namespace_4abf1500
	Checksum: 0xB9048408
	Offset: 0x33D0
	Size: 0x1C4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bd78aea0(var_19a3087c, e_player)
{
	if(isdefined(self.script_flag_true))
	{
		if(level flag::get(self.script_flag_true))
		{
			level endon(self.script_flag_true);
		}
		else
		{
			return;
		}
	}
	if(isdefined(var_19a3087c.var_348b91fd))
	{
		switch(var_19a3087c.var_348b91fd)
		{
			case "tape":
			{
				var_27c5b5a9 = #"hash_ea30fff000de600";
				var_42e4e060 = #"hash_aa0fa647067d823";
				break;
			}
			case "radio":
			{
				var_27c5b5a9 = #"hash_5c60481ce158163d";
				var_42e4e060 = #"hash_274981480733b7d0";
				break;
			}
			default:
			{
				var_27c5b5a9 = #"hash_23e6a36fce4ab6ef";
				var_42e4e060 = #"hash_6e621d4031bf8c5a";
				break;
			}
		}
	}
	if(isdefined(var_27c5b5a9))
	{
		self playsoundtoplayer(var_27c5b5a9, e_player);
	}
	self function_3a2dd570(e_player);
	wait(1);
	if(isdefined(self) && isplayer(e_player) && isdefined(var_19a3087c.var_3bb3493d))
	{
		self playsoundtoplayer(var_19a3087c.var_3bb3493d, e_player);
	}
}

/*
	Name: function_8f6791a4
	Namespace: namespace_4abf1500
	Checksum: 0xC99A73A3
	Offset: 0x35A0
	Size: 0x114
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8f6791a4(var_19a3087c, e_player)
{
	self function_3a2dd570(e_player);
	if(isdefined(var_19a3087c.var_348b91fd))
	{
		switch(var_19a3087c.var_348b91fd)
		{
			case "tape":
			{
				var_37b08e30 = #"hash_f315a8d18c2e535";
				break;
			}
			case "radio":
			{
				var_37b08e30 = #"hash_203997b7ca5c0dd4";
				break;
			}
			default:
			{
				var_37b08e30 = #"hash_6071229013cd6a96";
				break;
			}
		}
	}
	if(isdefined(self) && isplayer(e_player) && isdefined(var_37b08e30))
	{
		self playsoundtoplayer(var_37b08e30, e_player);
	}
}

/*
	Name: function_2bcfd899
	Namespace: namespace_4abf1500
	Checksum: 0xAB3F22B7
	Offset: 0x36C0
	Size: 0x2FC
	Parameters: 2
	Flags: Linked
*/
function function_2bcfd899(var_f84ece9f, player)
{
	if(isdefined(level.var_fa1d4366))
	{
		var_d5fa8477 = level.var_fa1d4366;
		level.var_fa1d4366 = undefined;
		return var_d5fa8477;
	}
	switch(var_f84ece9f)
	{
		case "hash_76270a10851f51d8":
		{
			var_bf0df48d = level.var_9ff51719;
			break;
		}
		case "hash_71c51f24f7f3037d":
		{
			var_bf0df48d = level.var_64d3d5c4;
			break;
		}
		case "hash_405e81feb85c5162":
		{
			var_bf0df48d = level.var_13ebf509;
			break;
		}
		case "hash_6fec31948ca2058c":
		{
			var_bf0df48d = level.var_1e898375;
			break;
		}
		case "hash_28fec49f37a535b9":
		{
			var_bf0df48d = level.var_b131552c;
			break;
		}
		default:
		{
			/#
				assertmsg("");
			#/
			return;
		}
	}
	if(!isdefined(var_bf0df48d))
	{
		/#
			println("" + var_f84ece9f);
		#/
		return;
	}
	var_71b26808 = getscriptbundle(var_bf0df48d);
	if(!isarray(var_71b26808.var_572513bb) || !var_71b26808.var_572513bb.size)
	{
		return;
	}
	foreach(var_a36fa2c6 in var_71b26808.var_572513bb)
	{
		if(var_a36fa2c6.season === #"hash_3c8cc59cdaa4bb29")
		{
			continue;
		}
		if(isdefined(player))
		{
			if(!player function_f0f36d47(var_a36fa2c6.var_cb9cd317))
			{
				if(var_f84ece9f === #"hash_71c51f24f7f3037d")
				{
					player clientfield::set_to_player("" + #"hash_711c8fee28432b7", n_index);
				}
				return var_a36fa2c6.var_cb9cd317;
			}
			continue;
		}
		if(!function_1a594d26(var_a36fa2c6.var_cb9cd317))
		{
			return var_a36fa2c6.var_cb9cd317;
		}
	}
}

/*
	Name: function_a3e4f9a1
	Namespace: namespace_4abf1500
	Checksum: 0xA31467B2
	Offset: 0x39C8
	Size: 0x23A
	Parameters: 1
	Flags: Linked
*/
function function_a3e4f9a1(var_f84ece9f)
{
	switch(var_f84ece9f)
	{
		case "hash_76270a10851f51d8":
		{
			var_bf0df48d = level.var_9ff51719;
			break;
		}
		case "hash_71c51f24f7f3037d":
		{
			var_bf0df48d = level.var_64d3d5c4;
			break;
		}
		case "hash_405e81feb85c5162":
		{
			var_bf0df48d = level.var_13ebf509;
			break;
		}
		case "hash_6fec31948ca2058c":
		{
			var_bf0df48d = level.var_1e898375;
			break;
		}
		case "hash_28fec49f37a535b9":
		{
			var_bf0df48d = level.var_b131552c;
			break;
		}
		default:
		{
			/#
				assertmsg("");
			#/
			return true;
		}
	}
	if(!isdefined(var_bf0df48d))
	{
		/#
			println("" + var_f84ece9f);
		#/
		return true;
	}
	var_71b26808 = getscriptbundle(var_bf0df48d);
	if(!isarray(var_71b26808.var_572513bb) || !var_71b26808.var_572513bb.size)
	{
		return true;
	}
	foreach(var_a36fa2c6 in var_71b26808.var_572513bb)
	{
		if(var_a36fa2c6.season === #"hash_3c8cc59cdaa4bb29")
		{
			continue;
		}
		if(!self function_f0f36d47(var_a36fa2c6.var_cb9cd317))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_1a594d26
	Namespace: namespace_4abf1500
	Checksum: 0x1F098C75
	Offset: 0x3C10
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_1a594d26(var_d5fa8477)
{
	foreach(player in getplayers())
	{
		if(!player function_f0f36d47(var_d5fa8477))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: on_ai_killed
	Namespace: namespace_4abf1500
	Checksum: 0x191AB05F
	Offset: 0x3CC0
	Size: 0x35C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_ai_killed(params)
{
	if(isplayer(params.eattacker) && (self.var_6f84b820 === #"elite" || self.var_6f84b820 === #"special"))
	{
		if(self.var_9fde8624 === #"hash_12fa854f3a7721b9" || self.var_9fde8624 === #"hash_3498fb1fbfcd0cf" || self.var_9fde8624 === #"hash_5653bbc44a034094" || self.var_9fde8624 === #"hash_70162f4bc795092")
		{
			level.var_df1d1235 = level.var_df1d1235 + 0.5;
		}
		else
		{
			level.var_df1d1235 = level.var_df1d1235 + 1;
		}
	}
	if(isdefined(level.var_fa1d4366) || (self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite" && isplayer(params.eattacker) && (level.var_df1d1235 >= 4 || math::cointoss(10))) && (zm_utility::check_point_in_playable_area(self.origin) || is_true(level.var_374c2805)))
	{
		var_44a24b57 = self.origin + vectorscale((0, 0, 1), 36);
		foreach(player in getplayers())
		{
			if(player.var_e2d764da >= 1 && !isdefined(level.var_fa1d4366))
			{
				continue;
			}
			var_d5fa8477 = function_2bcfd899(#"hash_76270a10851f51d8", player);
			var_e041507a = player getentitynumber();
			if(isdefined(var_d5fa8477))
			{
				var_bdb97676 = function_2ba45c94(var_d5fa8477, var_44a24b57, (0, var_e041507a * 90, 0), vectorscale((1, 1, 1), 64), undefined, undefined, player.name);
				player.var_e2d764da++;
			}
		}
	}
}

/*
	Name: function_ded2880a
	Namespace: namespace_4abf1500
	Checksum: 0xDA5B167A
	Offset: 0x4028
	Size: 0x1E0
	Parameters: 0
	Flags: None
*/
function function_ded2880a()
{
	/#
		util::init_dvar(#"hash_82bcb0445b8db9", "", &function_2ced1cf7);
		util::init_dvar(#"hash_10552bfd7317e7d1", "", &function_2ced1cf7);
		util::init_dvar(#"hash_4bb23fc5179a1812", "", &function_2ced1cf7);
		foreach(var_d5fa8477 in level.var_54f9341)
		{
			var_d5fa8477 = function_9e72a96(var_d5fa8477);
			util::function_345e5b9a(((("" + var_d5fa8477) + "") + var_d5fa8477) + "");
			util::function_345e5b9a(((("" + var_d5fa8477) + "") + var_d5fa8477) + "");
			util::function_345e5b9a(((("" + var_d5fa8477) + "") + var_d5fa8477) + "");
		}
	#/
}

/*
	Name: function_2ced1cf7
	Namespace: namespace_4abf1500
	Checksum: 0x4A9F78C9
	Offset: 0x4210
	Size: 0x434
	Parameters: 1
	Flags: None
*/
function function_2ced1cf7(params)
{
	/#
		if(params.value === "")
		{
			return;
		}
		switch(params.name)
		{
			case "hash_82bcb0445b8db9":
			{
				foreach(player in getplayers())
				{
					player thread collect_intel(params.value);
				}
				break;
			}
			case "hash_10552bfd7317e7d1":
			{
				foreach(var_99bf2e73 in level.var_238bd723)
				{
					if(var_99bf2e73.scriptbundlename === params.value)
					{
						v_pos = var_99bf2e73.origin;
						break;
					}
				}
				if(!isdefined(v_pos))
				{
					a_s_radios = struct::get_array("");
					var_99bf2e73 = getscriptbundle(params.value);
					foreach(s_radio in a_s_radios)
					{
						if(s_radio.faction === var_99bf2e73.var_ad4ad686)
						{
							v_pos = s_radio.origin;
							break;
						}
					}
				}
				if(isdefined(v_pos))
				{
					getplayers()[0] dontinterpolate();
					getplayers()[0] setorigin(v_pos);
				}
				else
				{
					/#
						iprintlnbold("" + params.value);
					#/
				}
				break;
			}
			case "hash_4bb23fc5179a1812":
			{
				if(function_1a594d26(params.value))
				{
					iprintlnbold("" + params.value);
				}
				else
				{
					iprintln(("" + params.value) + "");
					level.var_fa1d4366 = params.value;
				}
				break;
			}
			default:
			{
				break;
			}
		}
		setdvar(#"hash_82bcb0445b8db9", "");
		setdvar(#"hash_10552bfd7317e7d1", "");
		setdvar(#"hash_4bb23fc5179a1812", "");
	#/
}

