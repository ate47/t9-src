#using scripts\core_common\system_shared.csc;

#namespace zm_gold_ffotd;

/*
	Name: function_e2d7eb86
	Namespace: zm_gold_ffotd
	Checksum: 0x5771428F
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e2d7eb86()
{
	level notify(1136247081);
}

/*
	Name: function_89f2df9
	Namespace: zm_gold_ffotd
	Checksum: 0xF9B48D51
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_gold_ffotd", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_gold_ffotd
	Checksum: 0x80F724D1
	Offset: 0xD0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

