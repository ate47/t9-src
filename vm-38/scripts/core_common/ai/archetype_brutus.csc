#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace archetype_brutus;

/*
	Name: function_a9feea33
	Namespace: archetype_brutus
	Checksum: 0xC7FA14CE
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a9feea33()
{
	level notify(1058570071);
}

/*
	Name: __init__system__
	Namespace: archetype_brutus
	Checksum: 0xD936EB8F
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"brutus", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: precache
	Namespace: archetype_brutus
	Checksum: 0x80F724D1
	Offset: 0xF8
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec precache()
{
}

/*
	Name: function_70a657d8
	Namespace: archetype_brutus
	Checksum: 0x80F724D1
	Offset: 0x108
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_6e2a738c
	Namespace: archetype_brutus
	Checksum: 0x1B397CBC
	Offset: 0x118
	Size: 0x2C
	Parameters: 5
	Flags: None
*/
function function_6e2a738c(localclientnum, pos, surface, notetrack, bone)
{
}

