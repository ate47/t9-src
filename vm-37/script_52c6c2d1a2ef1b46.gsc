#using script_1a82674d68f69c23;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_6747c550;

/*
	Name: function_89f2df9
	Namespace: namespace_6747c550
	Checksum: 0x859B76A3
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_23b05089013ba630", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6747c550
	Checksum: 0xD1F4099A
	Offset: 0x118
	Size: 0x178
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connecting(&onconnect);
	clientfield::function_91cd7763("string", "hudItems.zmFeatureDescription", 1, 1);
	zm_inventory::function_c7c05a13();
	var_b9b9b499 = [];
	foreach(mapping in level.var_a16c38d9)
	{
		if(!isdefined(var_b9b9b499[mapping.var_cd35dfb2]))
		{
			var_b9b9b499[mapping.var_cd35dfb2] = 1;
			if(is_true(mapping.var_7f12f171))
			{
				clientfield::function_a8bbc967(mapping.var_cd35dfb2, 1, mapping.numbits, "int");
				continue;
			}
			clientfield::function_5b7d846d(mapping.var_cd35dfb2, 1, mapping.numbits, "int");
		}
	}
}

/*
	Name: onconnect
	Namespace: namespace_6747c550
	Checksum: 0x78EEBEFF
	Offset: 0x298
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private onconnect()
{
	self thread function_13ad9a60();
}

/*
	Name: function_13ad9a60
	Namespace: namespace_6747c550
	Checksum: 0x23C50B9F
	Offset: 0x2C0
	Size: 0x82
	Parameters: 0
	Flags: Linked, Private
*/
function private function_13ad9a60()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		response = waitresult.response;
		if(response == "zm_inventory_opened")
		{
			self notify(#"zm_inventory_menu_opened");
		}
	}
}

/*
	Name: function_7df6bb60
	Namespace: namespace_6747c550
	Checksum: 0x7B98B8D1
	Offset: 0x350
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_7df6bb60(fieldname, value, player)
{
	var_d5423fb8 = level.var_a16c38d9[fieldname];
	if(!(isdefined(var_d5423fb8) && is_true(var_d5423fb8.var_7f12f171)))
	{
		self clientfield::set_world_uimodel(var_d5423fb8.var_cd35dfb2, value);
	}
	else
	{
		/#
			assert(isplayer(player));
		#/
		if(!isdefined(player))
		{
			return;
		}
		player clientfield::set_player_uimodel(var_d5423fb8.var_cd35dfb2, value);
	}
}

/*
	Name: function_d8f1d200
	Namespace: namespace_6747c550
	Checksum: 0xDC32B8B4
	Offset: 0x438
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d8f1d200(var_ee9637ec)
{
	self clientfield::set_player_uimodel("hudItems.zmFeatureDescription", var_ee9637ec);
}

