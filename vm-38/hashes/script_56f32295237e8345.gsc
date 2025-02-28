#using script_544e81d6e48b88c0;
#using script_78825cbb1ab9f493;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_cf48051e;

/*
	Name: function_afb2798c
	Namespace: namespace_cf48051e
	Checksum: 0x8243F535
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_afb2798c()
{
	level notify(891022128);
}

/*
	Name: main
	Namespace: namespace_cf48051e
	Checksum: 0xDACE3C9E
	Offset: 0x108
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
	callback::add_callback(#"hash_34e39ee0c9fa0092", &function_3022f6ba);
}

/*
	Name: function_3022f6ba
	Namespace: namespace_cf48051e
	Checksum: 0x837E89EB
	Offset: 0x160
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_3022f6ba(eventstruct)
{
	if(eventstruct.isnew)
	{
		camera = undefined;
		switch(eventstruct.name)
		{
			case "dom_a":
			{
				camera = "dom_a_cam";
				break;
			}
			case "dom_b":
			{
				camera = "dom_b_cam";
				break;
			}
			case "dom_c":
			{
				camera = "dom_c_cam";
				break;
			}
			case "dom_d":
			{
				camera = "dom_d_cam";
				break;
			}
			case "dom_e":
			{
				camera = "dom_e_cam";
				break;
			}
			case "dom_headquarter":
			{
				if(eventstruct.team == #"allies")
				{
					camera = "dom_allies_hq_cam";
				}
				else if(eventstruct.team == #"axis")
				{
					camera = "dom_axis_hq_cam";
				}
				break;
			}
		}
		if(isdefined(camera))
		{
			namespace_99c84a33::function_99652b58(camera, eventstruct.id);
		}
	}
}

