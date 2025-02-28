#using script_13da4e6b98ca81a1;
#using script_79917113c7593edd;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace ac130;

/*
	Name: function_dc3918c3
	Namespace: ac130
	Checksum: 0x95FCD641
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dc3918c3()
{
	level notify(1519259333);
}

/*
	Name: __init__system__
	Namespace: ac130
	Checksum: 0x2036EFC4
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ac130", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: ac130
	Checksum: 0xBE576FDB
	Offset: 0x130
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	clientfield::register("toplayer", "inAC130", 1, 1, "int", &function_555656fe, 0, 1);
	callback::function_74f5faf8(&function_74f5faf8);
}

/*
	Name: function_555656fe
	Namespace: ac130
	Checksum: 0xABB52ED7
	Offset: 0x1B8
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function function_555656fe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	postfxbundle = level.var_3e7d252b.ksvehicleposteffectbun;
	if(!isdefined(postfxbundle))
	{
		return;
	}
	self util::function_6d0694af();
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump && codcaster::function_c955fbd1(fieldname))
	{
		bwastimejump = 0;
	}
	if(bwastimejump)
	{
		if(self postfx::function_556665f2(postfxbundle) == 0)
		{
			self codeplaypostfxbundle(postfxbundle);
		}
	}
	else if(self postfx::function_556665f2(postfxbundle))
	{
		self codestoppostfxbundle(postfxbundle);
	}
}

/*
	Name: function_74f5faf8
	Namespace: ac130
	Checksum: 0x8FCB8764
	Offset: 0x2E0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_74f5faf8(eventparams)
{
	localclientnum = eventparams.localclientnum;
	if(codcaster::function_b8fe9b52(localclientnum))
	{
		player = function_5c10bd79(localclientnum);
		if(player clientfield::get_to_player("inAC130"))
		{
			function_555656fe(localclientnum, undefined, !codcaster::function_c955fbd1(localclientnum));
		}
	}
}

