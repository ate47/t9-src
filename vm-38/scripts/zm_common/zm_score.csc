#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace zm_score;

/*
	Name: function_71142897
	Namespace: zm_score
	Checksum: 0xB65775ED
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_71142897()
{
	level notify(383505920);
}

/*
	Name: __init__system__
	Namespace: zm_score
	Checksum: 0x44E19F49
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_score", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_score
	Checksum: 0x7B9D5BD7
	Offset: 0x180
	Size: 0x194
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_697c8943 = array(90, 80, 70, 60, 50, 40, 30, 20, 10);
	foreach(subdivision in level.var_697c8943)
	{
		score_cf_register_info("damage" + subdivision, 1, 7);
	}
	score_cf_register_info("death_head", 1, 3, undefined);
	score_cf_register_info("death_melee", 1, 3, undefined);
	score_cf_register_info("transform_kill", 1, 3, undefined);
	clientfield::register_clientuimodel("hudItems.doublePointsActive", #"hud_items", #"doublepointsactive", 1, 1, "int", undefined, 0, 0);
}

/*
	Name: score_cf_register_info
	Namespace: zm_score
	Checksum: 0x1F0516F7
	Offset: 0x320
	Size: 0xFC
	Parameters: 4
	Flags: Linked
*/
function score_cf_register_info(name, version, max_count, func_callback)
{
	for(i = 0; i < 5; i++)
	{
		clientfield::function_5b7d846d((("PlayerList.client" + i) + ".score_cf_") + name, #"hash_97df1852304b867", [1:#"score_cf_" + name, 0:hash((isdefined(i) ? "" + i : ""))], version, getminbitcountfornum(max_count), "counter", func_callback, 0, 0);
	}
}

