#using scripts\core_common\bots\bot.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\abilities\ability_gadgets.gsc;
#using scripts\abilities\ability_power.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;

#namespace abilities;

/*
	Name: function_75522674
	Namespace: abilities
	Checksum: 0xC5F4BD8D
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_75522674()
{
	level notify(1733269812);
}

/*
	Name: __init__system__
	Namespace: abilities
	Checksum: 0xCEC9CD49
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"abilities", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: abilities
	Checksum: 0x80F724D1
	Offset: 0x130
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

