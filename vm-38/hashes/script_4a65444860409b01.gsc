#using script_57f7003580bb15e0;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_dafacbee;

/*
	Name: function_b6961e56
	Namespace: namespace_dafacbee
	Checksum: 0x57D9074D
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b6961e56()
{
	level notify(1942379091);
}

/*
	Name: __init__system__
	Namespace: namespace_dafacbee
	Checksum: 0x27735D49
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_221a828ea2610a47", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dafacbee
	Checksum: 0xA8D1F58F
	Offset: 0xE8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::function_6f4eaf88(function_4d1e7b48("movement"));
	status_effect::function_5bae5120(8, &function_f7e9c0bb);
}

/*
	Name: function_f7e9c0bb
	Namespace: namespace_dafacbee
	Checksum: 0x80F724D1
	Offset: 0x140
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_f7e9c0bb()
{
}

