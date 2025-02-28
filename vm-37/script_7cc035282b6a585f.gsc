#using script_44c87b4589ee1f93;
#using script_581877678e31274c;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_5eb9b9b6;

/*
	Name: function_89f2df9
	Namespace: namespace_5eb9b9b6
	Checksum: 0xD5D7CAB8
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1bc870c3bcb2ff32", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5eb9b9b6
	Checksum: 0xAD94D946
	Offset: 0x100
	Size: 0x7C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "ZombieDogVocals", 1, 2, "int", &zombiedogvocals, 0, 0);
	ai::add_archetype_spawn_function(#"zombie_dog", &function_3b0e8b8b);
}

/*
	Name: function_3b0e8b8b
	Namespace: namespace_5eb9b9b6
	Checksum: 0xCD86B426
	Offset: 0x188
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_3b0e8b8b(localclientnum)
{
	util::waittill_dobj(localclientnum);
}

/*
	Name: zombiedogvocals
	Namespace: namespace_5eb9b9b6
	Checksum: 0xB1498234
	Offset: 0x1B8
	Size: 0x172
	Parameters: 7
	Flags: None
*/
function zombiedogvocals(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	self endon(#"death");
	if(isdefined(self.var_64e89a2f))
	{
		self stoploopsound(self.var_64e89a2f);
	}
	if(wasdemojump)
	{
		switch(wasdemojump)
		{
			case 1:
			{
				var_e5404960 = undefined;
				var_9c464736 = #"hash_50a34ea4add0897";
				break;
			}
			case 2:
			{
				var_e5404960 = #"hash_16838de4eb2b7f00";
				var_9c464736 = #"hash_219cfeed2cbf8adc";
				break;
			}
		}
		if(isdefined(var_e5404960))
		{
			self playsound(fieldname, var_e5404960, self.origin + (20, 0, 30));
		}
		self.var_35e2a4c0 = self playloopsound(var_9c464736, 1.5, (20, 0, 30));
	}
}

