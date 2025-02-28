#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\systems\debug.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;

class class_6fde4e6 
{

	/*
		Name: constructor
		Namespace: namespace_6fde4e6
		Checksum: 0x1AFFB52C
		Offset: 0x400
		Size: 0x32
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.claimed = 0;
		self.var_4f0ea1b5 = 0;
		self.owner = undefined;
		self.var_6f08706b = undefined;
	}

	/*
		Name: destructor
		Namespace: namespace_6fde4e6
		Checksum: 0x80F724D1
		Offset: 0x440
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

class class_b599a4bc 
{

	/*
		Name: constructor
		Namespace: namespace_b599a4bc
		Checksum: 0x29178F89
		Offset: 0x4D8
		Size: 0x1A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f6d13e1b = [];
		self.entity = undefined;
	}

	/*
		Name: destructor
		Namespace: namespace_b599a4bc
		Checksum: 0x80F724D1
		Offset: 0x500
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace zm_lockdown_util;

/*
	Name: function_7bbb30f8
	Namespace: zm_lockdown_util
	Checksum: 0xAEB355B
	Offset: 0x398
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7bbb30f8()
{
	level notify(769427545);
}

/*
	Name: __init__system__
	Namespace: zm_lockdown_util
	Checksum: 0x4D4BFEF2
	Offset: 0x3B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_lockdown_util", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_lockdown_util
	Checksum: 0x84A56340
	Offset: 0x598
	Size: 0x130
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread function_b595044c();
	level thread function_ccf7ac87();
	level.var_492142a5 = [#"lockdown_stub_type_wallbuys":&function_9c7d5271, #"lockdown_stub_type_traps":&function_d2ce5ac1, #"lockdown_stub_type_perks":&function_db989a2a, #"lockdown_stub_type_pap":&function_165e2bd6, #"lockdown_stub_type_magic_box":&function_e6761711, #"lockdown_stub_type_crafting_tables":&function_d0e1d38c, #"lockdown_stub_type_boards":&function_8850974b];
	level.var_85c076ab = [];
	/#
	#/
}

/*
	Name: function_b595044c
	Namespace: zm_lockdown_util
	Checksum: 0xC39F03E0
	Offset: 0x6D0
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b595044c()
{
	level endon(#"end_game");
	if(!isdefined(level.var_f17bdf53))
	{
		level.var_f17bdf53 = [];
	}
	if(!isdefined(level.pap_lockdown_stubs))
	{
		level.pap_lockdown_stubs = [];
	}
	if(!isdefined(level.var_9235b607))
	{
		level.var_9235b607 = [];
	}
	if(!isdefined(level.var_16cfe3ef))
	{
		level.var_16cfe3ef = [];
	}
	level flag::wait_till("start_zombie_round_logic");
	function_eeeb30d7();
	function_9559446b();
	function_f7bd473a();
	level flag::wait_till("pap_machine_active");
	function_2bdb235d();
}

/*
	Name: function_ccf7ac87
	Namespace: zm_lockdown_util
	Checksum: 0x7421F4A1
	Offset: 0x7E0
	Size: 0x200
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ccf7ac87()
{
	level endon(#"end_game");
	if(!isdefined(level.var_2510f3e4))
	{
		level.var_2510f3e4 = [];
	}
	level flag::wait_till("start_zombie_round_logic");
	traps = getentarray("zombie_trap", "targetname");
	foreach(trap in traps)
	{
		if(!isdefined(trap._trap_use_trigs))
		{
			continue;
		}
		foreach(trap_trig in trap._trap_use_trigs)
		{
			if(!isdefined(trap_trig._trap))
			{
				continue;
			}
			if(!isdefined(level.var_2510f3e4))
			{
				level.var_2510f3e4 = [];
			}
			else if(!isarray(level.var_2510f3e4))
			{
				level.var_2510f3e4 = array(level.var_2510f3e4);
			}
			level.var_2510f3e4[level.var_2510f3e4.size] = trap_trig;
		}
	}
}

/*
	Name: function_d67bafb5
	Namespace: zm_lockdown_util
	Checksum: 0xCD542225
	Offset: 0x9E8
	Size: 0x35A
	Parameters: 2
	Flags: Linked
*/
function function_d67bafb5(stub, category)
{
	if(!isdefined(stub) || !isdefined(category))
	{
		return;
	}
	switch(category)
	{
		case "lockdown_stub_type_wallbuys":
		{
			if(!isdefined(level.var_f17bdf53))
			{
				level.var_f17bdf53 = [];
			}
			if(!isinarray(level.var_f17bdf53, stub))
			{
				if(!isdefined(level.var_f17bdf53))
				{
					level.var_f17bdf53 = [];
				}
				else if(!isarray(level.var_f17bdf53))
				{
					level.var_f17bdf53 = array(level.var_f17bdf53);
				}
				level.var_f17bdf53[level.var_f17bdf53.size] = stub;
			}
			break;
		}
		case "lockdown_stub_type_pap":
		{
			if(!isdefined(level.pap_lockdown_stubs))
			{
				level.pap_lockdown_stubs = [];
			}
			if(!isinarray(level.pap_lockdown_stubs, stub))
			{
				if(!isdefined(level.pap_lockdown_stubs))
				{
					level.pap_lockdown_stubs = [];
				}
				else if(!isarray(level.pap_lockdown_stubs))
				{
					level.pap_lockdown_stubs = array(level.pap_lockdown_stubs);
				}
				level.pap_lockdown_stubs[level.pap_lockdown_stubs.size] = stub;
			}
			break;
		}
		case "lockdown_stub_type_perks":
		{
			if(!isdefined(level.var_9235b607))
			{
				level.var_9235b607 = [];
			}
			if(!isinarray(level.var_9235b607, stub))
			{
				if(!isdefined(level.var_9235b607))
				{
					level.var_9235b607 = [];
				}
				else if(!isarray(level.var_9235b607))
				{
					level.var_9235b607 = array(level.var_9235b607);
				}
				level.var_9235b607[level.var_9235b607.size] = stub;
			}
			break;
		}
		case "lockdown_stub_type_crafting_tables":
		{
			if(!isdefined(level.var_16cfe3ef))
			{
				level.var_16cfe3ef = [];
			}
			if(!isinarray(level.var_16cfe3ef, stub))
			{
				if(!isdefined(level.var_16cfe3ef))
				{
					level.var_16cfe3ef = [];
				}
				else if(!isarray(level.var_16cfe3ef))
				{
					level.var_16cfe3ef = array(level.var_16cfe3ef);
				}
				level.var_16cfe3ef[level.var_16cfe3ef.size] = stub;
			}
			break;
		}
	}
}

/*
	Name: function_6b9e848
	Namespace: zm_lockdown_util
	Checksum: 0x51B9830E
	Offset: 0xD50
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_6b9e848(stub)
{
	function_77caff8b(stub);
	if(isdefined(level.var_f17bdf53) && isinarray(level.var_f17bdf53, stub))
	{
		arrayremovevalue(level.var_f17bdf53, stub);
	}
	if(isdefined(level.pap_lockdown_stubs) && isinarray(level.pap_lockdown_stubs, stub))
	{
		arrayremovevalue(level.pap_lockdown_stubs, stub);
	}
	if(isdefined(level.var_9235b607) && isinarray(level.var_9235b607, stub))
	{
		arrayremovevalue(level.var_9235b607, stub);
	}
	if(isdefined(level.var_16cfe3ef) && isinarray(level.var_16cfe3ef, stub))
	{
		arrayremovevalue(level.var_16cfe3ef, stub);
	}
}

/*
	Name: function_b913ec1b
	Namespace: zm_lockdown_util
	Checksum: 0x18D6394F
	Offset: 0xEC0
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b913ec1b(targetname, category)
{
	foreach(stub in level._unitriggers.trigger_stubs)
	{
		if(isdefined(stub.targetname) && stub.targetname == targetname)
		{
			function_d67bafb5(stub, category);
		}
	}
}

/*
	Name: function_eeeb30d7
	Namespace: zm_lockdown_util
	Checksum: 0xC0755420
	Offset: 0xF90
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_eeeb30d7()
{
	function_b913ec1b("weapon_upgrade", "lockdown_stub_type_wallbuys");
	function_b913ec1b("bowie_upgrade", "lockdown_stub_type_wallbuys");
}

/*
	Name: function_9559446b
	Namespace: zm_lockdown_util
	Checksum: 0xE079CBF8
	Offset: 0xFE0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9559446b()
{
	function_b913ec1b("perk_vapor_altar_stub", "lockdown_stub_type_perks");
}

/*
	Name: function_f7bd473a
	Namespace: zm_lockdown_util
	Checksum: 0x9962AFA8
	Offset: 0x1010
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f7bd473a()
{
	function_b913ec1b("crafting_trigger", "lockdown_stub_type_crafting_tables");
}

/*
	Name: function_2bdb235d
	Namespace: zm_lockdown_util
	Checksum: 0x21205E1E
	Offset: 0x1040
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_2bdb235d()
{
	function_b913ec1b("pap_machine_stub", "lockdown_stub_type_pap");
}

/*
	Name: function_2bdff7e1
	Namespace: zm_lockdown_util
	Checksum: 0xC372D551
	Offset: 0x1070
	Size: 0xE6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2bdff7e1(entity, stub, node)
{
	var_5bd89846 = groundtrace(node.origin + vectorscale((0, 0, 1), 8), node.origin + (vectorscale((0, 0, -1), 100000)), 0, entity)[#"position"];
	var_66694b96 = {#angles:node.angles, #origin:var_5bd89846};
	if(!is_true(stub.var_7c2f9a8b))
	{
		stub.var_66694b96 = var_66694b96;
	}
	return var_66694b96;
}

/*
	Name: function_dab6d796
	Namespace: zm_lockdown_util
	Checksum: 0xE8BA1BC7
	Offset: 0x1160
	Size: 0x374
	Parameters: 2
	Flags: None
*/
function function_dab6d796(entity, stub)
{
	if(!isdefined(stub))
	{
		return undefined;
	}
	if(isdefined(stub.var_66694b96))
	{
		return stub.var_66694b96;
	}
	if(isdefined(stub.target))
	{
		node = getnode(stub.target, "targetname");
		if(isdefined(node))
		{
			return function_2bdff7e1(entity, stub, node);
		}
	}
	radius = entity getpathfindingradius();
	height = entity function_6a9ae71();
	heightoffset = (0, 0, (height * -1) / 2);
	var_e790dc87 = (radius, radius, height / 2);
	if(isentity(stub))
	{
		maxs = stub.maxs;
	}
	else
	{
		switch(stub.script_unitrigger_type)
		{
			case "unitrigger_box_use":
			{
				maxs = (stub.script_width / 2, stub.script_height / 2, stub.script_length / 2);
				break;
			}
			case "unitrigger_radius_use":
			{
				maxs = (stub.radius, stub.script_height / 2, stub.radius);
				break;
			}
		}
	}
	search_radius = max(max(maxs[0] + var_e790dc87[0], maxs[1] + var_e790dc87[1]), maxs[2] + var_e790dc87[2]);
	nodes = getnodearray("lockdown_alignment_node", "script_noteworthy");
	nodes = arraysortclosest(nodes, stub.origin + heightoffset, 1, 0, search_radius);
	fallback_node = undefined;
	foreach(node in nodes)
	{
		if(!isdefined(fallback_node))
		{
			fallback_node = node;
		}
		if(node.script_noteworthy === "lockdown_alignment_node")
		{
			return function_2bdff7e1(entity, stub, node);
		}
	}
	if(isdefined(fallback_node))
	{
		return function_2bdff7e1(entity, stub, fallback_node);
	}
}

/*
	Name: function_da72073
	Namespace: zm_lockdown_util
	Checksum: 0x3E0EBDB1
	Offset: 0x14E0
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_da72073(stub)
{
	if(!isdefined(stub))
	{
		return undefined;
	}
	if(isdefined(stub.fxnode))
	{
		return stub.fxnode;
	}
	if(isdefined(stub.script_height))
	{
		n_radius = stub.script_height;
	}
	else
	{
		n_radius = 64;
	}
	a_structs = struct::get_array("lockdown_fx", "targetname");
	fxnode = arraygetclosest(stub.origin, a_structs, n_radius);
	if(isdefined(fxnode) && !is_true(stub.var_7e4bc0a2))
	{
		stub.fxnode = fxnode;
	}
	return fxnode;
}

/*
	Name: function_9f952db3
	Namespace: zm_lockdown_util
	Checksum: 0x4C445275
	Offset: 0x15E0
	Size: 0x184
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9f952db3(stub, entity, maxheight)
{
	if(entity.origin[2] > stub.origin[2])
	{
		/#
			if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
			{
				function_78eae22a(entity, stub, 7);
			}
		#/
		return false;
	}
	if(stub.origin[2] - entity.origin[2] > maxheight)
	{
		/#
			if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
			{
				function_78eae22a(entity, stub, 11, stub.origin[2] - entity.origin[2]);
			}
		#/
		return false;
	}
	return true;
}

/*
	Name: function_adb36e84
	Namespace: zm_lockdown_util
	Checksum: 0x363494F6
	Offset: 0x1770
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_adb36e84(stub)
{
	self waittill(#"death");
	function_77caff8b(stub);
}

/*
	Name: function_77caff8b
	Namespace: zm_lockdown_util
	Checksum: 0x1C950E78
	Offset: 0x17B0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_77caff8b(stub)
{
	if(!isdefined(stub))
	{
		return;
	}
	var_a0692a89 = function_fd31eb92(stub);
	if(isdefined(var_a0692a89) && var_a0692a89.claimed)
	{
		function_66941fc3(stub);
	}
}

/*
	Name: function_66941fc3
	Namespace: zm_lockdown_util
	Checksum: 0xFE5EB48
	Offset: 0x1820
	Size: 0xF4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_66941fc3(stub)
{
	for(var_77f297ef = 0; var_77f297ef < level.var_85c076ab.size; var_77f297ef++)
	{
		var_2943f1ec = level.var_85c076ab[var_77f297ef];
		for(index = 0; index < var_2943f1ec.var_f6d13e1b.size; index++)
		{
			if(var_2943f1ec.var_f6d13e1b[index].stub == stub)
			{
				var_2943f1ec.var_f6d13e1b = array::remove_index(var_2943f1ec.var_f6d13e1b, index);
				break;
			}
		}
		if(var_2943f1ec.var_f6d13e1b.size == 0)
		{
			level.var_85c076ab = array::remove_index(level.var_85c076ab, var_77f297ef);
		}
	}
}

/*
	Name: function_fd31eb92
	Namespace: zm_lockdown_util
	Checksum: 0x98C65F40
	Offset: 0x1920
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fd31eb92(stub)
{
	foreach(var_2943f1ec in level.var_85c076ab)
	{
		foreach(var_f1e20c7f in var_2943f1ec.var_f6d13e1b)
		{
			if(var_f1e20c7f.stub === stub || var_f1e20c7f.var_6f08706b === stub)
			{
				return var_f1e20c7f;
			}
		}
	}
}

/*
	Name: function_f7315b07
	Namespace: zm_lockdown_util
	Checksum: 0xC812DB02
	Offset: 0x1A48
	Size: 0x96
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f7315b07(entity)
{
	foreach(var_2943f1ec in level.var_85c076ab)
	{
		if(var_2943f1ec.entity === entity)
		{
			return var_2943f1ec;
		}
	}
}

/*
	Name: function_4ad92a9a
	Namespace: zm_lockdown_util
	Checksum: 0x56A32B90
	Offset: 0x1AE8
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ad92a9a(entity)
{
	foreach(var_2943f1ec in level.var_85c076ab)
	{
		if(var_2943f1ec.entity === entity)
		{
			foreach(var_f1e20c7f in var_2943f1ec.var_f6d13e1b)
			{
				if(is_true(var_f1e20c7f.claimed))
				{
					return var_f1e20c7f;
				}
			}
		}
	}
}

/*
	Name: function_e1f6d06a
	Namespace: zm_lockdown_util
	Checksum: 0xD5DEDB17
	Offset: 0x1C18
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1f6d06a(stub)
{
	var_f1e20c7f = function_fd31eb92(stub);
	return isdefined(var_f1e20c7f) && is_true(var_f1e20c7f.var_4f0ea1b5);
}

/*
	Name: function_55d2ad24
	Namespace: zm_lockdown_util
	Checksum: 0x32AF4102
	Offset: 0x1C78
	Size: 0x6E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_55d2ad24(stub, entity)
{
	var_f1e20c7f = function_fd31eb92(stub);
	return isdefined(var_f1e20c7f) && is_true(var_f1e20c7f.claimed) && entity !== var_f1e20c7f.owner;
}

/*
	Name: function_d3fbb5ec
	Namespace: zm_lockdown_util
	Checksum: 0xA5E3E8BF
	Offset: 0x1CF0
	Size: 0x74
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d3fbb5ec(entity, stub, current_zone)
{
	if(isdefined(current_zone) && isdefined(stub.in_zone) && stub.in_zone != current_zone)
	{
		/#
			function_78eae22a(entity, stub, 2);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_9c7d5271
	Namespace: zm_lockdown_util
	Checksum: 0x422A88FB
	Offset: 0x1D70
	Size: 0x1EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9c7d5271(entity, &registerlotus_right, range)
{
	current_zone = entity zm_utility::get_current_zone();
	stubs = arraysortclosest(level.var_f17bdf53, entity.origin, undefined, 0, range);
	foreach(stub in stubs)
	{
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(entity, stub, 0);
			#/
			continue;
		}
		if(function_55d2ad24(stub, entity))
		{
			/#
				function_78eae22a(entity, stub, 1);
			#/
			continue;
		}
		if(!function_d3fbb5ec(entity, stub, current_zone))
		{
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_wallbuys";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, stub))
		{
			registerlotus_right[registerlotus_right.size] = stub;
		}
	}
}

/*
	Name: function_fea6f0c0
	Namespace: zm_lockdown_util
	Checksum: 0x1C37A6B3
	Offset: 0x1F68
	Size: 0xCC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_fea6f0c0(entity, stub, current_zone)
{
	if(isdefined(current_zone) && isdefined(stub.in_zone) && stub.in_zone != current_zone)
	{
		/#
			function_78eae22a(entity, stub, 2);
		#/
		return false;
	}
	if(isdefined(stub.var_3468124) && stub.var_3468124.var_2977c27 !== "on")
	{
		/#
			function_78eae22a(entity, stub, 17);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_db989a2a
	Namespace: zm_lockdown_util
	Checksum: 0x83BA15B
	Offset: 0x2040
	Size: 0x1EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_db989a2a(entity, &registerlotus_right, range)
{
	current_zone = entity zm_utility::get_current_zone();
	stubs = arraysortclosest(level.var_9235b607, entity.origin, undefined, 0, range);
	foreach(stub in stubs)
	{
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(entity, stub, 0);
			#/
			continue;
		}
		if(function_55d2ad24(stub, entity))
		{
			/#
				function_78eae22a(entity, stub, 1);
			#/
			continue;
		}
		if(!function_fea6f0c0(entity, stub, current_zone))
		{
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_perks";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, stub))
		{
			registerlotus_right[registerlotus_right.size] = stub;
		}
	}
}

/*
	Name: function_ea677a9a
	Namespace: zm_lockdown_util
	Checksum: 0x2A751376
	Offset: 0x2238
	Size: 0x74
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ea677a9a(entity, stub, current_zone)
{
	if(isdefined(current_zone) && isdefined(stub.in_zone) && stub.in_zone != current_zone)
	{
		/#
			function_78eae22a(entity, stub, 2);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_d0e1d38c
	Namespace: zm_lockdown_util
	Checksum: 0x9AD79F87
	Offset: 0x22B8
	Size: 0x1EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d0e1d38c(entity, &registerlotus_right, range)
{
	current_zone = entity zm_utility::get_current_zone();
	stubs = arraysortclosest(level.var_16cfe3ef, entity.origin, undefined, 0, range);
	foreach(stub in stubs)
	{
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(entity, stub, 0);
			#/
			continue;
		}
		if(function_55d2ad24(stub, entity))
		{
			/#
				function_78eae22a(entity, stub, 1);
			#/
			continue;
		}
		if(!function_ea677a9a(entity, stub, current_zone))
		{
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_crafting_tables";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, stub))
		{
			registerlotus_right[registerlotus_right.size] = stub;
		}
	}
}

/*
	Name: function_95250640
	Namespace: zm_lockdown_util
	Checksum: 0x7260AC42
	Offset: 0x24B0
	Size: 0x17C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_95250640(entity, stub)
{
	if(level flag::get("moving_chest_now"))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 15);
		#/
		return false;
	}
	if(is_true(stub.trigger_target.hidden))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 3);
		#/
		return false;
	}
	if(is_true(stub.trigger_target._box_open))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 4);
		#/
		return false;
	}
	if(is_true(stub.trigger_target.was_temp) || is_true(stub.trigger_target.being_removed))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 13);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_e6761711
	Namespace: zm_lockdown_util
	Checksum: 0x7EA448D2
	Offset: 0x2638
	Size: 0x1E6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_e6761711(entity, &registerlotus_right, range)
{
	chests = arraysortclosest(level.chests, entity.origin, undefined, 0, range);
	foreach(chest in chests)
	{
		if(!function_95250640(entity, chest.unitrigger_stub))
		{
			continue;
		}
		if(function_e1f6d06a(chest.unitrigger_stub))
		{
			/#
				function_78eae22a(entity, chest, 0);
			#/
			continue;
		}
		if(function_55d2ad24(chest.unitrigger_stub, entity))
		{
			/#
				function_78eae22a(entity, chest, 1);
			#/
			continue;
		}
		chest.unitrigger_stub.lockdowntype = "lockdown_stub_type_magic_box";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, chest.unitrigger_stub))
		{
			registerlotus_right[registerlotus_right.size] = chest.unitrigger_stub;
		}
	}
}

/*
	Name: function_790e3eb0
	Namespace: zm_lockdown_util
	Checksum: 0xC524F6D6
	Offset: 0x2828
	Size: 0xA4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_790e3eb0(entity, trigger)
{
	if(trigger.pap_machine.state !== "powered")
	{
		/#
			function_78eae22a(entity, trigger, 5);
		#/
		return false;
	}
	if(!trigger.pap_machine flag::get("pap_waiting_for_user"))
	{
		/#
			function_78eae22a(entity, trigger, 6);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_165e2bd6
	Namespace: zm_lockdown_util
	Checksum: 0x3D4155B9
	Offset: 0x28D8
	Size: 0x1B6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_165e2bd6(entity, &registerlotus_right, range)
{
	if(!level flag::get("pap_machine_active"))
	{
		return;
	}
	foreach(stub in level.pap_lockdown_stubs)
	{
		if(function_55d2ad24(stub, registerlotus_right))
		{
			/#
				function_78eae22a(registerlotus_right, stub, 1);
			#/
			continue;
		}
		if(!function_790e3eb0(registerlotus_right, stub))
		{
			continue;
		}
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(registerlotus_right, stub, 0);
			#/
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_pap";
		if(!isdefined(range))
		{
			range = [];
		}
		else if(!isarray(range))
		{
			range = array(range);
		}
		if(!isinarray(range, stub))
		{
			range[range.size] = stub;
		}
	}
}

/*
	Name: function_809ae5cb
	Namespace: zm_lockdown_util
	Checksum: 0x3E1E64FC
	Offset: 0x2A98
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_809ae5cb(entity, blocker)
{
	if(zm_utility::all_chunks_destroyed(blocker, blocker.barrier_chunks))
	{
		/#
			function_78eae22a(entity, blocker, 12);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_8850974b
	Namespace: zm_lockdown_util
	Checksum: 0xE3978B07
	Offset: 0x2B00
	Size: 0x1DE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_8850974b(entity, &registerlotus_right, range)
{
	blockers = arraysortclosest(level.exterior_goals, entity.origin, undefined, 0, range);
	foreach(blocker in blockers)
	{
		if(function_55d2ad24(blocker, entity))
		{
			/#
				function_78eae22a(entity, blocker, 1);
			#/
			continue;
		}
		if(function_e1f6d06a(blocker))
		{
			/#
				function_78eae22a(entity, blocker, 0);
			#/
			continue;
		}
		if(!function_809ae5cb(entity, blocker))
		{
			/#
				function_78eae22a(entity, blocker, 12);
			#/
			continue;
		}
		blocker.lockdowntype = "lockdown_stub_type_boards";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, blocker))
		{
			registerlotus_right[registerlotus_right.size] = blocker;
		}
	}
}

/*
	Name: function_387fd27e
	Namespace: zm_lockdown_util
	Checksum: 0x60A6C33B
	Offset: 0x2CE8
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private function_387fd27e(entity, trap_trig)
{
	if(!trap_trig._trap._trap_in_use || !trap_trig._trap istriggerenabled())
	{
		/#
			function_78eae22a(entity, trap_trig, 16);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_d2ce5ac1
	Namespace: zm_lockdown_util
	Checksum: 0x3770DDE0
	Offset: 0x2D68
	Size: 0x18E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d2ce5ac1(entity, &registerlotus_right, range)
{
	trap_trigs = arraysortclosest(level.var_2510f3e4, entity.origin, undefined, 0, range);
	foreach(trap_trig in trap_trigs)
	{
		if(function_55d2ad24(trap_trig, entity))
		{
			/#
				function_78eae22a(entity, trap_trig, 1);
			#/
			continue;
		}
		if(!function_387fd27e(entity, trap_trig))
		{
			continue;
		}
		trap_trig.lockdowntype = "lockdown_stub_type_traps";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, trap_trig))
		{
			registerlotus_right[registerlotus_right.size] = trap_trig;
		}
	}
}

/*
	Name: function_22aeb4e9
	Namespace: zm_lockdown_util
	Checksum: 0xE36B2D42
	Offset: 0x2F00
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function function_22aeb4e9(lockdowntype)
{
	switch(lockdowntype)
	{
		case "lockdown_stub_type_pap":
		{
			return "PAP";
		}
		case "lockdown_stub_type_magic_box":
		{
			return "MAGIC_BOX";
		}
		case "lockdown_stub_type_boards":
		{
			return "BOARDS";
		}
		case "lockdown_stub_type_wallbuys":
		{
			return "WALLBUY";
		}
		case "lockdown_stub_type_crafting_tables":
		{
			return "CRAFTING_TABLE";
		}
		case "lockdown_stub_type_perks":
		{
			return "PERK";
		}
		case "lockdown_stub_type_traps":
		{
			return "TRAP";
		}
	}
	return "INVALID";
}

/*
	Name: function_87c1193e
	Namespace: zm_lockdown_util
	Checksum: 0x72D49AF9
	Offset: 0x2FE0
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_87c1193e(entity)
{
	var_a0692a89 = function_4ad92a9a(entity);
	if(isdefined(var_a0692a89))
	{
		return var_a0692a89.stub;
	}
}

/*
	Name: function_50ba1eb0
	Namespace: zm_lockdown_util
	Checksum: 0xCB3DEFBA
	Offset: 0x3028
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function function_50ba1eb0(entity, stub)
{
	var_2943f1ec = function_f7315b07(entity);
	if(!isdefined(var_2943f1ec))
	{
		var_2943f1ec = new class_b599a4bc();
		var_2943f1ec.entity = entity;
		array::add(level.var_85c076ab, var_2943f1ec);
	}
	var_f1e20c7f = function_fd31eb92(stub);
	if(!isdefined(var_f1e20c7f))
	{
		var_f1e20c7f = new class_6fde4e6();
		var_f1e20c7f.stub = stub;
		var_f1e20c7f.owner = entity;
		var_f1e20c7f.claimed = 1;
		array::add(var_2943f1ec.var_f6d13e1b, var_f1e20c7f);
		/#
			function_78eae22a(entity, stub, 10);
		#/
	}
	entity thread function_adb36e84(stub);
}

/*
	Name: function_9b84bb88
	Namespace: zm_lockdown_util
	Checksum: 0x59FAC91E
	Offset: 0x3168
	Size: 0x1E2
	Parameters: 4
	Flags: None
*/
function function_9b84bb88(entity, stubtypes, var_d05e79c8, var_c7455683)
{
	/#
		if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
		{
			entity.var_d187874c = [];
		}
	#/
	registerlotus_right = [];
	foreach(stubtype in stubtypes)
	{
		[[level.var_492142a5[stubtype]]](entity, registerlotus_right, var_d05e79c8);
	}
	registerlotus_right = array::filter(registerlotus_right, 0, &function_9f952db3, entity, var_c7455683);
	/#
		if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
		{
			function_6351d1c3(entity, registerlotus_right, var_d05e79c8);
		}
	#/
	return arraysortclosest(registerlotus_right, entity.origin);
}

/*
	Name: function_7258b5cc
	Namespace: zm_lockdown_util
	Checksum: 0xF8EB2533
	Offset: 0x3358
	Size: 0x34E
	Parameters: 4
	Flags: None
*/
function function_7258b5cc(entity, var_410a8c7, var_2baba799, unlockfunc)
{
	var_a0692a89 = function_4ad92a9a(entity);
	if(!isdefined(var_a0692a89) || !isdefined(var_a0692a89.stub))
	{
		return;
	}
	if(!function_c9105448(entity, var_a0692a89.stub))
	{
		function_77caff8b(var_a0692a89.stub);
		return undefined;
	}
	stub = var_a0692a89.stub;
	if(stub.lockdowntype === "lockdown_stub_type_boards")
	{
		zm_blockers::open_zbarrier(stub);
		function_66941fc3(stub);
		return;
	}
	if(stub.lockdowntype === "lockdown_stub_type_traps")
	{
		stub._trap notify(#"trap_finished");
		function_66941fc3(stub);
		return;
	}
	if(!isentity(stub))
	{
		if(!isdefined(stub.var_a0fc37f6))
		{
			stub.var_a0fc37f6 = stub.prompt_and_visibility_func;
		}
		stub.prompt_and_visibility_func = var_410a8c7;
		if(!isdefined(stub.var_492080a5))
		{
			stub.var_492080a5 = stub.trigger_func;
		}
		stub.trigger_func = var_2baba799;
		zm_unitrigger::reregister_unitrigger(stub);
	}
	else
	{
		stub triggerenable(0);
		newstub = stub zm_unitrigger::function_9267812e(stub.maxs[0] - stub.mins[0], stub.maxs[1] - stub.mins[1], stub.maxs[2] - stub.mins[2]);
		newstub.prompt_and_visibility_func = var_410a8c7;
		newstub.var_6f08706b = stub;
		newstub.lockdowntype = stub.lockdowntype;
		newstub.script_string = stub.script_string;
		stub.lockdowntype = undefined;
		stub.lockdownstub = newstub;
		var_a0692a89.stub = newstub;
		var_a0692a89.var_6f08706b = stub;
		stub = newstub;
		zm_unitrigger::register_unitrigger(newstub, var_2baba799);
	}
	if(stub.lockdowntype === "lockdown_stub_type_perks")
	{
		stub.var_3468124 zm_perks::function_efd2c9e6();
	}
	stub.unlockfunc = unlockfunc;
	var_a0692a89.var_4f0ea1b5 = 1;
	var_a0692a89.claimed = 0;
	return stub;
}

/*
	Name: function_7bfa8895
	Namespace: zm_lockdown_util
	Checksum: 0x3EBDC5AF
	Offset: 0x36B0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_7bfa8895(entity)
{
	return isdefined(function_4ad92a9a(entity));
}

/*
	Name: function_b5dd9241
	Namespace: zm_lockdown_util
	Checksum: 0x6DE95126
	Offset: 0x36E0
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_b5dd9241(stub)
{
	var_a0692a89 = function_fd31eb92(stub);
	if(!isdefined(var_a0692a89))
	{
		return 0;
	}
	return var_a0692a89.var_4f0ea1b5 === 1;
}

/*
	Name: function_c9105448
	Namespace: zm_lockdown_util
	Checksum: 0x331FEA4D
	Offset: 0x3730
	Size: 0x1AA
	Parameters: 2
	Flags: Linked
*/
function function_c9105448(entity, stub)
{
	switch(stub.lockdowntype)
	{
		case "lockdown_stub_type_boards":
		{
			return function_809ae5cb(entity, stub);
		}
		case "lockdown_stub_type_crafting_tables":
		{
			current_zone = entity zm_utility::get_current_zone();
			return function_ea677a9a(entity, stub, current_zone);
		}
		case "lockdown_stub_type_magic_box":
		{
			return function_95250640(entity, stub);
		}
		case "lockdown_stub_type_pap":
		{
			return function_790e3eb0(entity, stub);
		}
		case "lockdown_stub_type_perks":
		{
			current_zone = entity zm_utility::get_current_zone();
			return function_fea6f0c0(entity, stub, current_zone);
		}
		case "lockdown_stub_type_wallbuys":
		{
			current_zone = entity zm_utility::get_current_zone();
			return function_d3fbb5ec(entity, stub, current_zone);
		}
		case "lockdown_stub_type_traps":
		{
			return function_387fd27e(entity, stub);
		}
		default:
		{
			return 1;
		}
	}
}

/*
	Name: function_ac6907ec
	Namespace: zm_lockdown_util
	Checksum: 0xB88CB47E
	Offset: 0x38E8
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_ac6907ec()
{
	var_a0692a89 = function_fd31eb92(self);
	if(isdefined(var_a0692a89))
	{
		var_a0692a89.var_4f0ea1b5 = 2;
	}
	if(isdefined(self) && isdefined(self.unlockfunc))
	{
		[[self.unlockfunc]](self);
	}
	self.prompt_and_visibility_func = self.var_a0fc37f6;
	self.trigger_func = self.var_492080a5;
	if(self.lockdowntype === "lockdown_stub_type_perks")
	{
		self.var_3468124 zm_perks::function_1e721859();
	}
	self.var_a0fc37f6 = undefined;
	self.var_492080a5 = undefined;
	function_66941fc3(self);
	zm_unitrigger::reregister_unitrigger(self);
}

/*
	Name: function_4de23f77
	Namespace: zm_lockdown_util
	Checksum: 0xBBA04933
	Offset: 0x39E8
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_4de23f77()
{
	var_a0692a89 = function_fd31eb92(self);
	if(isdefined(var_a0692a89))
	{
		var_a0692a89.var_4f0ea1b5 = 2;
	}
	self.var_6f08706b.lockdownstub = undefined;
	if(isdefined(self) && isdefined(self.unlockfunc))
	{
		[[self.unlockfunc]](self);
	}
	self.var_6f08706b triggerenable(1);
	function_66941fc3(self);
	zm_unitrigger::unregister_unitrigger(self);
}

/*
	Name: function_61a9bc58
	Namespace: zm_lockdown_util
	Checksum: 0x80E586C7
	Offset: 0x3AB8
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_61a9bc58()
{
	var_a0692a89 = function_fd31eb92(self);
	/#
		assert(isdefined(var_a0692a89));
	#/
	self.var_6156031a = 1;
	if(isdefined(self.var_6f08706b))
	{
		self function_4de23f77();
	}
	else
	{
		self function_ac6907ec();
	}
	self.var_6156031a = undefined;
}

/*
	Name: function_78eae22a
	Namespace: zm_lockdown_util
	Checksum: 0xFD408B62
	Offset: 0x3B58
	Size: 0x124
	Parameters: 4
	Flags: Variadic
*/
function function_78eae22a(entity, stub, reason, ...)
{
	/#
		if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
		{
			if(!isdefined(entity.var_d187874c))
			{
				entity.var_d187874c = [];
			}
			else if(!isarray(entity.var_d187874c))
			{
				entity.var_d187874c = array(entity.var_d187874c);
			}
			entity.var_d187874c[entity.var_d187874c.size] = {#args:vararg, #reason:reason, #stub:stub};
		}
	#/
}

/*
	Name: function_f3cff6ff
	Namespace: zm_lockdown_util
	Checksum: 0x3373920
	Offset: 0x3C88
	Size: 0x520
	Parameters: 1
	Flags: None
*/
function function_f3cff6ff(entity)
{
	/#
		if(!(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1))
		{
			return;
		}
		if(!isdefined(entity.var_d187874c))
		{
			return;
		}
		if((getdvarint(#"zm_lockdown_ent", -1)) != entity getentitynumber())
		{
			return;
		}
		foreach(var_ca00d79a in entity.var_d187874c)
		{
			text = entity getentitynumber() + "";
			color = (1, 0, 0);
			switch(var_ca00d79a.reason)
			{
				case 0:
				{
					text = text + "";
					break;
				}
				case 1:
				{
					text = text + "";
					break;
				}
				case 2:
				{
					text = text + "";
					break;
				}
				case 3:
				{
					text = text + "";
					break;
				}
				case 4:
				{
					text = text + "";
					break;
				}
				case 5:
				{
					text = text + "";
					break;
				}
				case 6:
				{
					text = text + "";
					break;
				}
				case 8:
				{
					text = text + ("" + var_ca00d79a.args[0]);
					break;
				}
				case 9:
				{
					text = text + "";
					break;
				}
				case 7:
				{
					text = text + "";
					break;
				}
				case 11:
				{
					text = text + ("" + var_ca00d79a.args[0]);
					break;
				}
				case 10:
				{
					text = text + "";
					color = (0, 1, 0);
					break;
				}
				case 13:
				{
					text = text + "";
					break;
				}
				case 14:
				{
					text = text + "";
					recordstar(var_ca00d79a.args[0], (0, 1, 1));
					recordstar(var_ca00d79a.args[1].origin, (1, 0, 1));
					recordline(var_ca00d79a.args[1].origin, var_ca00d79a.args[1].origin + (anglestoforward(var_ca00d79a.args[1].angles) * 10), (1, 1, 0));
					break;
				}
				case 15:
				{
					text = text + "";
					break;
				}
				case 16:
				{
					text = text + "";
					break;
				}
				case 17:
				{
					text = text + "";
					break;
				}
			}
			recordstar(var_ca00d79a.stub.origin, (1, 1, 0));
			record3dtext(text, var_ca00d79a.stub.origin + vectorscale((0, 0, 1), 10), color);
		}
	#/
}

/*
	Name: function_6351d1c3
	Namespace: zm_lockdown_util
	Checksum: 0x2C7EA0F4
	Offset: 0x41B0
	Size: 0x100
	Parameters: 3
	Flags: Private
*/
function private function_6351d1c3(entity, registerlotus_right, var_d05e79c8)
{
	/#
		foreach(stub in registerlotus_right)
		{
			dist = distancesquared(entity.origin, stub.origin);
			if(dist > sqr(var_d05e79c8))
			{
				function_78eae22a(entity, stub, 8, sqrt(dist));
			}
		}
	#/
}

/*
	Name: function_946bb116
	Namespace: zm_lockdown_util
	Checksum: 0x39B805B3
	Offset: 0x42B8
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_946bb116()
{
	/#
		zm_devgui::add_custom_devgui_callback(&function_2765c63);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_2765c63
	Namespace: zm_lockdown_util
	Checksum: 0x1DD97ABF
	Offset: 0x4368
	Size: 0xAA
	Parameters: 1
	Flags: Private
*/
function private function_2765c63(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_619d20b906a39230":
			{
				level.var_cd20e41b = !is_true(level.var_cd20e41b);
				if(is_true(level.var_cd20e41b))
				{
					level thread function_6e1690d5();
				}
				else
				{
					level notify(#"hash_52b90374b27fcb8a");
				}
				break;
			}
		}
	#/
}

/*
	Name: function_6e1690d5
	Namespace: zm_lockdown_util
	Checksum: 0xE274BB4A
	Offset: 0x4420
	Size: 0x3CC
	Parameters: 0
	Flags: Private
*/
function private function_6e1690d5()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_52b90374b27fcb8a");
		stubs = arraycombine(level.exterior_goals, level.var_16cfe3ef, 0, 0);
		stubs = arraycombine(stubs, level.pap_lockdown_stubs, 0, 0);
		stubs = arraycombine(stubs, level.var_9235b607, 0, 0);
		stubs = arraycombine(stubs, level.var_2510f3e4, 0, 0);
		stubs = arraycombine(stubs, level.var_f17bdf53, 0, 0);
		foreach(chest in level.chests)
		{
			if(!isdefined(stubs))
			{
				stubs = [];
			}
			else if(!isarray(stubs))
			{
				stubs = array(stubs);
			}
			stubs[stubs.size] = chest.unitrigger_stub;
		}
		var_3bd3c0c1 = vectorscale((-1, -1, 0), 16);
		var_cbe5413e = (16, 16, 32);
		while(true)
		{
			wait(0.5);
			entity = getentbynum(getdvarint(#"zm_lockdown_ent", -1));
			if(!isdefined(entity))
			{
				continue;
			}
			foreach(stub in stubs)
			{
				var_754b10b4 = function_dab6d796(entity, stub);
				if(isdefined(var_754b10b4))
				{
					box(var_754b10b4.origin, var_3bd3c0c1, var_cbe5413e, var_754b10b4.angles[1], (0, 1, 0), 1, 0, 10);
					line(var_754b10b4.origin, var_754b10b4.origin + (anglestoforward(var_754b10b4.angles) * 32), (0, 1, 0), 1, 0, 10);
					continue;
				}
				circle(stub.origin, 16, (1, 0, 0), 0, 0, 10);
			}
		}
	#/
}

