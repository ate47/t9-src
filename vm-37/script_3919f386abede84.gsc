#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\doors_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\util.gsc;

class class_e500a966 : cdoor
{
	var m_s_bundle;

	/*
		Name: constructor
		Namespace: namespace_e500a966
		Checksum: 0x988102E9
		Offset: 0x408
		Size: 0x22
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self.m_str_type = "window";
	}

	/*
		Name: destructor
		Namespace: namespace_e500a966
		Checksum: 0xC71AC9E8
		Offset: 0x438
		Size: 0x14
		Parameters: 0
		Flags: 16
	*/
	destructor()
	{
	}

	/*
		Name: init
		Namespace: namespace_e500a966
		Checksum: 0xE77F8C9
		Offset: 0x458
		Size: 0x52
		Parameters: 2
		Flags: None
	*/
	function init(var_82b05767, s_instance)
	{
		self.m_s_bundle = var_82b05767;
		self.var_a2f96f78 = s_instance;
		s_instance.c_door = doors::setup_door_info(m_s_bundle, s_instance, self);
	}

}

#namespace windows;

/*
	Name: function_89f2df9
	Namespace: windows
	Checksum: 0xBA03638B
	Offset: 0x138
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"windows", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: windows
	Checksum: 0x18E7B813
	Offset: 0x190
	Size: 0x20
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.a_s_windows))
	{
		level.a_s_windows = [];
	}
}

/*
	Name: init_window
	Namespace: windows
	Checksum: 0x5DACD189
	Offset: 0x1B8
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function init_window()
{
	if(isdefined(self.scriptbundlename))
	{
		var_82b05767 = getscriptbundle(self.scriptbundlename);
	}
	var_9bff4cd8 = new class_e500a966();
	var_9bff4cd8 = [[ var_9bff4cd8 ]]->init(var_82b05767, self);
	return var_9bff4cd8;
}

/*
	Name: function_8ac3bea9
	Namespace: windows
	Checksum: 0x5339CE24
	Offset: 0x230
	Size: 0x1CE
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level flag::wait_till("radiant_gameobjects_initialized");
	level.a_s_windows = struct::get_array("scriptbundle_windows", "classname");
	foreach(s_instance in level.a_s_windows)
	{
		c_door = s_instance init_window();
		if(isdefined(c_door))
		{
			s_instance.c_door = c_door;
		}
	}
	foreach(s_instance in level.a_s_windows)
	{
		if(isdefined(s_instance.linkname))
		{
			var_d5700a96 = struct::get_array(s_instance.linkname, "linkto");
			if(isdefined(var_d5700a96[0]))
			{
				s_instance.c_door.var_d1c4f848 = var_d5700a96[0];
				var_d5700a96[0].c_door.var_d1c4f848 = s_instance;
			}
		}
	}
}

/*
	Name: open
	Namespace: windows
	Checksum: 0x997B858
	Offset: 0xF00
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function open(str_value, str_key)
{
	self doors::open(str_value, str_key);
}

/*
	Name: close
	Namespace: windows
	Checksum: 0x86610D65
	Offset: 0xF38
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function close(str_value, str_key)
{
	self doors::close(str_value, str_key);
}

/*
	Name: lock
	Namespace: windows
	Checksum: 0x630E5074
	Offset: 0xF70
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function lock(str_value, str_key, b_do_close)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_do_close))
	{
		b_do_close = 1;
	}
	self doors::lock(str_value, str_key, b_do_close);
}

/*
	Name: unlock
	Namespace: windows
	Checksum: 0x4E0EEA2B
	Offset: 0xFD8
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function unlock(str_value, str_key, b_do_open)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_do_open))
	{
		b_do_open = 1;
	}
	self doors::unlock(str_value, str_key, b_do_open);
}

/*
	Name: function_d216984f
	Namespace: windows
	Checksum: 0xDBA1E692
	Offset: 0x1040
	Size: 0x116
	Parameters: 2
	Flags: None
*/
function function_d216984f(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	a_s_windows = [];
	if(isdefined(str_value))
	{
		a_structs = struct::get_array(str_value, str_key);
		foreach(struct in a_structs)
		{
			if(isinarray(level.a_s_windows, struct))
			{
				array::add(a_s_windows, struct, 0);
			}
		}
	}
	else
	{
		a_s_windows = level.a_s_windows;
	}
	return a_s_windows;
}

