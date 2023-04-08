#using scripts\core_common\item_inventory.gsc;
#using script_1caf36ff04a85ff6;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace wz_loadouts;

/*
	Name: function_b25c541a
	Namespace: wz_loadouts
	Checksum: 0xE539BE0E
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b25c541a()
{
	level notify(1889274902);
}

/*
	Name: __init__system__
	Namespace: wz_loadouts
	Checksum: 0x94E92E20
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_loadouts", &function_70a657d8, undefined, undefined, #"item_inventory");
}

/*
	Name: function_70a657d8
	Namespace: wz_loadouts
	Checksum: 0x506FC234
	Offset: 0x100
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	gametype = util::function_5df4294();
	if(gametype !== #"warzone_hot_pursuit" && gametype !== #"hash_77edb49e5314223" && gametype !== #"hash_753fcf1725358921")
	{
		return;
	}
	if((isdefined(getgametypesetting(#"hash_7d8c969e384dd1c9")) ? getgametypesetting(#"hash_7d8c969e384dd1c9") : 0))
	{
		level.var_5c14d2e6 = &function_3fed57dd;
	}
	if((isdefined(getgametypesetting(#"hash_4149d5d65eb07138")) ? getgametypesetting(#"hash_4149d5d65eb07138") : 0))
	{
		level.var_317fb13c = &function_3fed57dd;
		if(gametype === #"hash_753fcf1725358921")
		{
			level.var_317fb13c = &function_a9b8fa06;
		}
	}
}

/*
	Name: function_a9b8fa06
	Namespace: wz_loadouts
	Checksum: 0x2A675DB6
	Offset: 0x270
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_a9b8fa06()
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self) || !isalive(self))
	{
		return;
	}
	item_world::function_1b11e73c();
	while(isdefined(self) && !isdefined(self.inventory))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	self function_7376c60d();
}

/*
	Name: function_3fed57dd
	Namespace: wz_loadouts
	Checksum: 0x20D76381
	Offset: 0x330
	Size: 0x1D2
	Parameters: 0
	Flags: None
*/
function function_3fed57dd()
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self) || !isalive(self))
	{
		return;
	}
	item_world::function_1b11e73c();
	while(isdefined(self) && !isdefined(self.inventory))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(level.var_52b56362))
	{
		self function_58190f52();
		return;
	}
	switch(level.var_52b56362)
	{
		case 0:
		{
			self function_58190f52();
			break;
		}
		case 1:
		{
			self function_6667abef();
			break;
		}
		case 2:
		{
			self function_7376c60d();
			break;
		}
		case 3:
		{
			self function_1f091d2f();
			break;
		}
		case 4:
		{
			self function_2d31b980();
			break;
		}
		default:
		{
			self function_58190f52();
			break;
		}
	}
}

/*
	Name: function_52df229a
	Namespace: wz_loadouts
	Checksum: 0x5E1DC6CD
	Offset: 0x510
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function function_52df229a(item_name, item_count)
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isstring(item_name) && !function_7a600918(item_name))
	{
		/#
			assert(0);
		#/
		return;
	}
	item = namespace_ad5a0cd6::function_49ce7663(item_name);
	if(isdefined(item_count) && isint(item_count))
	{
		if(item.var_a6762160.itemtype == #"ammo")
		{
			item.amount = item.var_a6762160.amount * item_count;
		}
		else
		{
			item.count = item_count;
		}
	}
	var_fa3df96 = self item_inventory::function_e66dcff5(item);
	self item_world::function_de2018e3(item, self, var_fa3df96);
}

/*
	Name: give_weapon
	Namespace: wz_loadouts
	Checksum: 0x3BE7F974
	Offset: 0x690
	Size: 0x25C
	Parameters: 2
	Flags: None
*/
function give_weapon(weaponname, attachmentnames)
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isstring(weaponname) && !function_7a600918(weaponname))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(isdefined(attachmentnames) && !isarray(attachmentnames))
	{
		/#
			assert(0);
		#/
		return;
	}
	weapon = namespace_ad5a0cd6::function_49ce7663(weaponname);
	var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
	if(isdefined(attachmentnames))
	{
		weapon.attachments = [];
		foreach(attachmentname in attachmentnames)
		{
			if(!isstring(attachmentname) && !function_7a600918(attachmentname))
			{
				/#
					assert(0);
				#/
				return;
			}
			attachment = namespace_ad5a0cd6::function_49ce7663(attachmentname);
			namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
		}
		weapon.amount = self function_f09c133d(namespace_a0d533d1::function_2b83d3ff(weapon));
	}
	self item_world::function_de2018e3(weapon, self, var_fa3df96);
}

/*
	Name: function_58190f52
	Namespace: wz_loadouts
	Checksum: 0x16FF8CD0
	Offset: 0x8F8
	Size: 0x124
	Parameters: 0
	Flags: Private
*/
function private function_58190f52()
{
	gametype = util::function_5df4294();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"hash_753fcf1725358921")
	{
		give_weapon(#"hash_5cc9b5e23093ac03");
		function_52df229a(#"hash_212b01feaa916a00");
	}
	else
	{
		if(gametype == #"hash_77edb49e5314223")
		{
			give_weapon(#"hash_15f30a19a23c0190");
			function_52df229a(#"hash_3bf6ed4e3a22e9f3");
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_6667abef
	Namespace: wz_loadouts
	Checksum: 0x6122F091
	Offset: 0xA28
	Size: 0x1CC
	Parameters: 0
	Flags: Private
*/
function private function_6667abef()
{
	gametype = util::function_5df4294();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"hash_753fcf1725358921")
	{
		give_weapon(#"hash_5cc9b5e23093ac03", array(#"hash_513a787ad3a20198", #"hash_559f58d5af0b432d"));
		function_52df229a(#"hash_212b01feaa916a00");
		function_52df229a(#"hash_1abfcce0e9955057", 5);
	}
	else
	{
		if(gametype == #"hash_77edb49e5314223")
		{
			give_weapon(#"hash_15f30a19a23c0190", array(#"hash_513a787ad3a20198", #"hash_5506836b90ed93a9"));
			function_52df229a(#"hash_3bf6ed4e3a22e9f3");
			function_52df229a(#"hash_80292d121740f6f");
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_7376c60d
	Namespace: wz_loadouts
	Checksum: 0x98FD9A79
	Offset: 0xC00
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_7376c60d()
{
	gametype = util::function_5df4294();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"hash_753fcf1725358921")
	{
		give_weapon(#"hash_6a992c957fb327bb");
		function_52df229a(#"hash_182fdef2ad243e20");
		function_52df229a(#"hash_1abfcce0e9955057", 5);
	}
	else
	{
		if(gametype == #"hash_77edb49e5314223")
		{
			give_weapon(#"hash_36978e3a9321b430");
			function_52df229a(#"hash_1f72dec518451f8c");
			function_52df229a(#"hash_80292d121740f6f", 2);
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_1f091d2f
	Namespace: wz_loadouts
	Checksum: 0x86599E79
	Offset: 0xD80
	Size: 0x22C
	Parameters: 0
	Flags: Private
*/
function private function_1f091d2f()
{
	gametype = util::function_5df4294();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"hash_753fcf1725358921")
	{
		give_weapon(#"hash_6a992c957fb327bb", array(#"hash_43d8944b55b1e63c"));
		function_52df229a(#"hash_182fdef2ad243e20");
		function_52df229a(#"hash_1abfcce0e9955057", 5);
		function_52df229a(#"hash_6f80136c3b79d9e");
		function_52df229a(#"hash_2e33ce38d6cda617", 5);
	}
	else
	{
		if(gametype == #"hash_77edb49e5314223")
		{
			give_weapon(#"hash_36978e3a9321b430", array(#"hash_513a787ad3a20198", #"hash_5506836b90ed93a9"));
			function_52df229a(#"hash_1f72dec518451f8c");
			function_52df229a(#"hash_80292d121740f6f", 3);
			function_52df229a(#"hash_568173e016d45c2a");
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_2d31b980
	Namespace: wz_loadouts
	Checksum: 0x9AC50909
	Offset: 0xFB8
	Size: 0x284
	Parameters: 0
	Flags: Private
*/
function private function_2d31b980()
{
	gametype = util::function_5df4294();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"hash_753fcf1725358921")
	{
		give_weapon(#"hash_6a992c957fb327bb", array(#"hash_2b2bf36e2ea5ab8f", #"hash_43d8944b55b1e63c", #"hash_2a10ad247a663aaa"));
		function_52df229a(#"hash_182fdef2ad243e20");
		function_52df229a(#"hash_1abfcce0e9955057", 5);
		function_52df229a(#"hash_8578856a247ab60");
		function_52df229a(#"hash_2e33ce38d6cda617", 5);
	}
	else
	{
		if(gametype == #"hash_77edb49e5314223")
		{
			give_weapon(#"hash_36978e3a9321b430", array(#"hash_66023e3bee6c58a1", #"hash_a1deb882d59a069", #"hash_2a10ad247a663aaa"));
			function_52df229a(#"hash_1f72dec518451f8c");
			function_52df229a(#"hash_80292d121740f6f", 3);
			function_52df229a(#"hash_568173e016d45c2a");
			function_52df229a(#"hash_2e33ce38d6cda617", 5);
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_f56a5599
	Namespace: wz_loadouts
	Checksum: 0x80EA2B9E
	Offset: 0x1248
	Size: 0x104
	Parameters: 0
	Flags: Private
*/
function private function_f56a5599()
{
	give_weapon(#"hash_505c397233e87a32");
	give_weapon(#"hash_3e4707ff6c41feac");
	function_52df229a(#"hash_3bf6ed4e3a22e9f3", 2);
	function_52df229a(#"hash_45ced3880667df22", 5);
	function_52df229a(#"hash_8578856a247ab60");
	function_52df229a(#"hash_4a2739676c12d92a", 5);
	function_52df229a(#"hash_50b970644e43947b", 5);
}

