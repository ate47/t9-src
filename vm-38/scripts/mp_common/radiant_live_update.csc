#using scripts\core_common\system_shared.csc;

#namespace radiant_live_update;

/*
	Name: function_2b2e2138
	Namespace: radiant_live_update
	Checksum: 0x846D80A0
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2b2e2138()
{
	level notify(657986162);
}

/*
	Name: __init__system__
	Namespace: radiant_live_update
	Checksum: 0x6FAF7AAF
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"radiant_live_update", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: radiant_live_update
	Checksum: 0x3C153BA0
	Offset: 0xD0
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		thread scriptstruct_debug_render();
	#/
}

/*
	Name: scriptstruct_debug_render
	Namespace: radiant_live_update
	Checksum: 0x577F7F4A
	Offset: 0xF8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function scriptstruct_debug_render()
{
	/#
		while(true)
		{
			waitresult = undefined;
			waitresult = level waittill(#"liveupdate");
			if(isdefined(waitresult.selected_struct))
			{
				level thread render_struct(waitresult.selected_struct);
			}
			else
			{
				level notify(#"stop_struct_render");
			}
		}
	#/
}

/*
	Name: render_struct
	Namespace: radiant_live_update
	Checksum: 0x37B875DF
	Offset: 0x188
	Size: 0x8E
	Parameters: 1
	Flags: None
*/
function render_struct(selected_struct)
{
	/#
		self endon(#"stop_struct_render");
		if(!isdefined(selected_struct.origin))
		{
			return;
		}
		while(isdefined(selected_struct))
		{
			box(selected_struct.origin, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), 0, (1, 0.4, 0.4));
			waitframe(1);
		}
	#/
}

