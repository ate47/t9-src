#using scripts\core_common\util_shared.csc;

#namespace flowgraph_entity;

/*
	Name: isentitydefinedfunc
	Namespace: flowgraph_entity
	Checksum: 0xBA431449
	Offset: 0x78
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function isentitydefinedfunc(e_entity)
{
	return isdefined(e_entity);
}

/*
	Name: getentityorigin
	Namespace: flowgraph_entity
	Checksum: 0x52B09C57
	Offset: 0x90
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function getentityorigin(e_entity)
{
	return e_entity.origin;
}

/*
	Name: getentityangles
	Namespace: flowgraph_entity
	Checksum: 0xF82CE5D2
	Offset: 0xB0
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function getentityangles(e_entity)
{
	return e_entity.angles;
}

/*
	Name: lerpshaderconstantovertime
	Namespace: flowgraph_entity
	Checksum: 0x41171B28
	Offset: 0xD0
	Size: 0x296
	Parameters: 12
	Flags: None
*/
function lerpshaderconstantovertime(x, e_entity, i_script_vector, f_start_x, f_start_y, f_start_z, f_start_w, f_end_x, f_end_y, f_end_z, f_end_w, f_time)
{
	e_entity endon(#"death");
	e_entity util::waittill_dobj(self.owner.localclientnum);
	if(!isdefined(e_entity))
	{
		return;
	}
	if(!isdefined(f_start_x))
	{
		f_start_x = 0;
	}
	if(!isdefined(f_start_y))
	{
		f_start_y = 0;
	}
	if(!isdefined(f_start_z))
	{
		f_start_z = 0;
	}
	if(!isdefined(f_start_w))
	{
		f_start_w = 0;
	}
	if(!isdefined(f_end_x))
	{
		f_end_x = 0;
	}
	if(!isdefined(f_end_y))
	{
		f_end_y = 0;
	}
	if(!isdefined(f_end_z))
	{
		f_end_z = 0;
	}
	if(!isdefined(f_end_w))
	{
		f_end_w = 0;
	}
	s_timer = util::new_timer(self.owner.localclientnum);
	do
	{
		util::server_wait(self.owner.localclientnum, 0.11);
		n_current_time = s_timer util::get_time_in_seconds();
		n_lerp_val = n_current_time / f_time;
		n_delta_val_x = lerpfloat(f_start_x, f_end_x, n_lerp_val);
		n_delta_val_y = lerpfloat(f_start_y, f_end_y, n_lerp_val);
		n_delta_val_z = lerpfloat(f_start_z, f_end_z, n_lerp_val);
		n_delta_val_w = lerpfloat(f_start_w, f_end_w, n_lerp_val);
		e_entity mapshaderconstant(self.owner.localclientnum, 0, "scriptVector" + i_script_vector, n_delta_val_x, n_delta_val_y, n_delta_val_z, n_delta_val_w);
	}
	while(n_current_time < f_time);
}

/*
	Name: function_fd19ef53
	Namespace: flowgraph_entity
	Checksum: 0xF026A462
	Offset: 0x370
	Size: 0x20
	Parameters: 2
	Flags: None
*/
function function_fd19ef53(e_entity, str_field)
{
	return e_entity.(str_field);
}

/*
	Name: function_7e40ae2d
	Namespace: flowgraph_entity
	Checksum: 0xDA03909D
	Offset: 0x398
	Size: 0x38
	Parameters: 4
	Flags: None
*/
function function_7e40ae2d(x, e_entity, str_field, var_b8003601)
{
	e_entity.(str_field) = var_b8003601;
	return true;
}

