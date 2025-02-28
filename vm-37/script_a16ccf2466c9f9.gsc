#using script_256b8879317373de;
#using script_57f7003580bb15e0;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_8fe9f293;

/*
	Name: function_89f2df9
	Namespace: namespace_8fe9f293
	Checksum: 0x45C0E5F1
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3a3bac1147cc9f9d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8fe9f293
	Checksum: 0x91CA50FF
	Offset: 0xF0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(6, &function_d31a78fe);
	status_effect::function_5bae5120(6, &function_923bcb9c);
	status_effect::function_6f4eaf88(function_4d1e7b48("wound"));
}

/*
	Name: function_d31a78fe
	Namespace: namespace_8fe9f293
	Checksum: 0x49A84CF8
	Offset: 0x168
	Size: 0x1EC
	Parameters: 3
	Flags: Linked
*/
function function_d31a78fe(var_756fda07, weapon, var_84171a6c)
{
	self.var_f031d238 = var_84171a6c.var_6406d0cd;
	self.var_4a3f5865 = var_84171a6c.var_18d16a6b;
	if(!isdefined(var_84171a6c.var_752c0834))
	{
		return;
	}
	var_9e04a872 = var_84171a6c.var_752c0834;
	if(self.owner.maxhealth - var_9e04a872 < var_84171a6c.var_8ea635df)
	{
		var_9e04a872 = self.owner.maxhealth - var_84171a6c.var_8ea635df;
	}
	var_da1d7911 = [];
	var_da1d7911[0] = {#hash_b861a047:undefined, #name:"cleanse_buff"};
	if(self.owner.health > 0)
	{
		self.owner player::function_2a67df65(self.var_4a3f5865, var_9e04a872 * -1, var_da1d7911);
	}
	self.var_18d16a6b = var_84171a6c.var_18d16a6b;
	if(self.owner.health > self.owner.var_66cb03ad)
	{
		var_1a197232 = !isdefined(self.owner.var_abe2db87);
		if(var_1a197232)
		{
			self.owner.health = self.owner.var_66cb03ad;
		}
	}
	if(self.endtime > 0)
	{
		self thread function_f6fec56f();
		self thread function_a54d41f7(self.endtime - self.duration);
	}
}

/*
	Name: function_a54d41f7
	Namespace: namespace_8fe9f293
	Checksum: 0xBE7962D2
	Offset: 0x360
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_a54d41f7(starttime)
{
	self notify(#"hash_77a943337c92549a");
	self endon(#"hash_77a943337c92549a", #"hash_13d72ca5a7cfd2bd");
	var_1420e67b = self.endtime;
	while(self.endtime > gettime())
	{
		waitframe(1);
		if(self.endtime != var_1420e67b)
		{
			var_3a8a4c13 = gettime() - starttime;
			self.owner function_eb1cd20(starttime, self.duration + var_3a8a4c13, self.var_3cf2d21);
			var_1420e67b = self.endtime;
		}
	}
}

/*
	Name: function_f6fec56f
	Namespace: namespace_8fe9f293
	Checksum: 0xCA70654
	Offset: 0x438
	Size: 0xF0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f6fec56f()
{
	self notify(#"hash_35c63d8ef4b4825");
	self endon(#"hash_35c63d8ef4b4825", #"hash_13d72ca5a7cfd2bd");
	while(true)
	{
		waitresult = undefined;
		waitresult = self.owner waittill(#"fully_healed", #"death", #"disconnect", #"healing_disabled");
		if(waitresult._notify != "fully_healed")
		{
			return;
		}
		if(isdefined(self.var_f031d238))
		{
			self.owner playsoundtoplayer(self.var_f031d238, self.owner);
		}
	}
}

/*
	Name: function_923bcb9c
	Namespace: namespace_8fe9f293
	Checksum: 0x6D360F01
	Offset: 0x530
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_923bcb9c()
{
	self.owner player::function_b933de24(self.var_4a3f5865);
}

