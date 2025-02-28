#using script_57f7003580bb15e0;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_slowed;

/*
	Name: function_89f2df9
	Namespace: status_effect_slowed
	Checksum: 0xA9DA1A15
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"status_effect_slowed", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_slowed
	Checksum: 0x314C927E
	Offset: 0xC8
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(2, &slowed_apply);
	status_effect::function_5bae5120(2, &function_6fe78d40);
	status_effect::function_6f4eaf88(function_4d1e7b48("slowed"));
}

/*
	Name: slowed_apply
	Namespace: status_effect_slowed
	Checksum: 0x5ACC01AD
	Offset: 0x140
	Size: 0xD6
	Parameters: 3
	Flags: Linked
*/
function slowed_apply(var_756fda07, weapon, var_84171a6c)
{
	self.owner.var_23ed81d6 = gettime() + int(var_756fda07.var_77449e9);
	self.owner.var_a010bd8f = var_84171a6c;
	self.owner.var_9060b065 = weapon;
	if(!isdefined(var_84171a6c) || self.owner == var_84171a6c)
	{
		return;
	}
	var_c94d654b = var_84171a6c getentitynumber();
	if(!isdefined(self.owner.var_a4332cab))
	{
		self.owner.var_a4332cab = [];
	}
}

/*
	Name: function_6fe78d40
	Namespace: status_effect_slowed
	Checksum: 0x61EFE2D9
	Offset: 0x220
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function function_6fe78d40()
{
	if(isdefined(self.owner) && isdefined(self.owner.var_a010bd8f) && isdefined(self.owner.var_a010bd8f.var_9d19aa30))
	{
		self.owner.var_a010bd8f.var_9d19aa30 = 0;
	}
}

