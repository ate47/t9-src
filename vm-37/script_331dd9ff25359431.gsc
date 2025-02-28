#using script_359683f0ff3b3fbb;
#using script_3daa514e0b3cd5f4;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_ec502488;

/*
	Name: main
	Namespace: namespace_ec502488
	Checksum: 0x946B9671
	Offset: 0x1B8
	Size: 0x27C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("allplayers", "cranked_explode_fx", 1, 1, "counter", &function_d2f90d68, 0, 0);
	clientfield::register("toplayer", "cranked_timer_sfx", 1, 1, "int", &function_d76f5ac9, 0, 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedMax", #"zm_hud", #"hash_30167484a080284", 6000, 5, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedPct", #"zm_hud", #"hash_1f89ec485ae9a5c1", 6000, 16, "float", undefined, 0, 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedTimerReset", #"zm_hud", #"hash_4b231de3b871f42", 6000, 1, "counter", undefined, 0, 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedRoundNotification", #"zm_hud", #"hash_5fae6d66ff61741", 6000, 1, "int", undefined, 0, 0);
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
	if(!isdefined(level.var_352498c6))
	{
		prototype_hud::register();
		level.var_352498c6 = 1;
	}
	callback::function_d46d9315(&function_d46d9315);
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: namespace_ec502488
	Checksum: 0x7E50D290
	Offset: 0x440
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	/#
		println("");
	#/
}

/*
	Name: onstartgametype
	Namespace: namespace_ec502488
	Checksum: 0x3CAEEA4
	Offset: 0x470
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	/#
		println("");
	#/
}

/*
	Name: function_d46d9315
	Namespace: namespace_ec502488
	Checksum: 0xBF548DD9
	Offset: 0x4A0
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_d46d9315(localclientnum)
{
	waitframe(1);
	util::function_8eb5d4b0(3500, 2.5);
	function_5ea2c6e3("zmb_cranked_neardeath", 0, 0);
}

/*
	Name: function_d2f90d68
	Namespace: namespace_ec502488
	Checksum: 0x9461C130
	Offset: 0x4F8
	Size: 0xFC
	Parameters: 7
	Flags: None
*/
function function_d2f90d68(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self zm_utility::function_f8796df3(bwastimejump))
	{
		playviewmodelfx(bwastimejump, #"hash_408d10583a1dff7f", "tag_torso");
		self playsound(bwastimejump, #"hash_78ebad845ac95f28");
	}
	else
	{
		util::playfxontag(bwastimejump, #"hash_1ceb9e884b8750bd", self, "j_spine4");
		self playsound(bwastimejump, #"hash_b29118465607b5b");
	}
}

/*
	Name: function_d76f5ac9
	Namespace: namespace_ec502488
	Checksum: 0xD0F55F5D
	Offset: 0x600
	Size: 0xB4
	Parameters: 7
	Flags: None
*/
function function_d76f5ac9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread function_ee85e4e3(fieldname);
	}
	else
	{
		self notify(#"hash_42ef04c28c2ef326");
		if(self function_d2cb869e(#"hash_64660c28c445612f"))
		{
			self codestoppostfxbundle(#"hash_64660c28c445612f");
		}
	}
}

/*
	Name: function_ee85e4e3
	Namespace: namespace_ec502488
	Checksum: 0x7E7111E2
	Offset: 0x6C0
	Size: 0x320
	Parameters: 1
	Flags: None
*/
function function_ee85e4e3(localclientnum)
{
	self notify("210642b6d51f9124");
	self endon("210642b6d51f9124");
	level endon(#"end_game");
	self endon(#"death", #"disconnect", #"hash_42ef04c28c2ef326");
	waitframe(1);
	n_timer = self clientfield::get_to_player("sr_defend_timer");
	str_alias = #"hash_43c0fcbfe93e6423";
	function_672403ca("zmb_cranked_neardeath", 0, 0);
	if(is_true(self.var_5a72f7c9))
	{
		self.var_5a72f7c9 = 0;
		if(n_timer >= 8)
		{
			self playsound(localclientnum, #"hash_2f11528079c42ea6");
		}
	}
	if(isdefined(self.var_e933de5b))
	{
		stopsound(self.var_e933de5b);
	}
	while(n_timer > 0)
	{
		if(n_timer <= 5)
		{
			var_d71c11ca = (abs(n_timer - 6)) / 5;
			if(!isdefined(var_d71c11ca))
			{
				var_d71c11ca = 0;
			}
			function_672403ca("zmb_cranked_neardeath", 1, var_d71c11ca);
			self.var_5a72f7c9 = 1;
			str_alias = #"hash_37a0bf7f61bc3362" + n_timer;
			self playrumbleonentity(localclientnum, #"hash_4b19c1d08875f55c");
		}
		else
		{
			if(n_timer <= 10)
			{
				str_alias = #"hash_bb1df4387e47518";
			}
			else if(n_timer <= 15)
			{
				str_alias = #"hash_43c0ffbfe93e693c";
			}
		}
		if(n_timer <= 6)
		{
			if(!self function_d2cb869e(#"hash_64660c28c445612f"))
			{
				self codeplaypostfxbundle(#"hash_64660c28c445612f");
			}
		}
		else if(self function_d2cb869e(#"hash_64660c28c445612f"))
		{
			self codestoppostfxbundle(#"hash_64660c28c445612f");
		}
		self.var_e933de5b = self playsound(localclientnum, str_alias);
		n_timer--;
		wait(1);
	}
}

