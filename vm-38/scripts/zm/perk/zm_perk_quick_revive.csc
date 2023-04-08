#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\zm_common\zm_perks.csc;

#namespace zm_perk_quick_revive;

/*
	Name: function_2f80d5d4
	Namespace: zm_perk_quick_revive
	Checksum: 0x1700B7A8
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2f80d5d4()
{
	level notify(1144449117);
}

/*
	Name: __init__system__
	Namespace: zm_perk_quick_revive
	Checksum: 0x33EE9CEB
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_quick_revive", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_quick_revive
	Checksum: 0x24762576
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_quick_revive_perk_for_level();
}

/*
	Name: enable_quick_revive_perk_for_level
	Namespace: zm_perk_quick_revive
	Checksum: 0xB2F48387
	Offset: 0x160
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function enable_quick_revive_perk_for_level()
{
	zm_perks::register_perk_clientfields(#"hash_7f98b3dd3cce95aa", &quick_revive_client_field_func, &quick_revive_callback_func);
	zm_perks::register_perk_effects(#"hash_7f98b3dd3cce95aa", "revive_light");
	zm_perks::register_perk_init_thread(#"hash_7f98b3dd3cce95aa", &init_quick_revive);
	zm_perks::function_f3c80d73("zombie_perk_bottle_revive");
}

/*
	Name: init_quick_revive
	Namespace: zm_perk_quick_revive
	Checksum: 0x8BCC0B66
	Offset: 0x220
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_quick_revive()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"revive_light"] = "zombie/fx_perk_quickrevive_ndu";
	}
}

/*
	Name: quick_revive_client_field_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x80F724D1
	Offset: 0x268
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function quick_revive_client_field_func()
{
}

/*
	Name: quick_revive_callback_func
	Namespace: zm_perk_quick_revive
	Checksum: 0x80F724D1
	Offset: 0x278
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function quick_revive_callback_func()
{
}

