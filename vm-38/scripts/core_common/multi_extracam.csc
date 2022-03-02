#using scripts\core_common\struct.csc;

#namespace multi_extracam;

/*
	Name: function_23e9e6b
	Namespace: multi_extracam
	Checksum: 0x1E1103EA
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_23e9e6b()
{
	level notify(728088660);
}

/*
	Name: extracam_reset_index
	Namespace: multi_extracam
	Checksum: 0x91A067E7
	Offset: 0xA8
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function extracam_reset_index(localclientnum, index)
{
	if(!isdefined(level.camera_ents) || !isdefined(level.camera_ents[localclientnum]))
	{
		return;
	}
	if(isdefined(level.camera_ents[localclientnum][index]))
	{
		level.camera_ents[localclientnum][index] clearextracam();
		level.camera_ents[localclientnum][index] delete();
		level.camera_ents[localclientnum][index] = undefined;
	}
}

/*
	Name: extracam_init_index
	Namespace: multi_extracam
	Checksum: 0xE1CBE91
	Offset: 0x168
	Size: 0x5A
	Parameters: 3
	Flags: Linked
*/
function extracam_init_index(localclientnum, target, index)
{
	camerastruct = struct::get(target, "targetname");
	return extracam_init_item(localclientnum, camerastruct, index);
}

/*
	Name: extracam_init_item
	Namespace: multi_extracam
	Checksum: 0xBA714C5
	Offset: 0x1D0
	Size: 0x16A
	Parameters: 3
	Flags: Linked
*/
function extracam_init_item(localclientnum, copy_ent, index)
{
	if(!isdefined(level.camera_ents))
	{
		level.camera_ents = [];
	}
	if(!isdefined(level.camera_ents[localclientnum]))
	{
		level.camera_ents[localclientnum] = [];
	}
	if(isdefined(level.camera_ents[localclientnum][index]))
	{
		level.camera_ents[localclientnum][index] clearextracam();
		level.camera_ents[localclientnum][index] delete();
		level.camera_ents[localclientnum][index] = undefined;
	}
	if(isdefined(copy_ent))
	{
		level.camera_ents[localclientnum][index] = spawn(localclientnum, copy_ent.origin, "script_origin");
		level.camera_ents[localclientnum][index].angles = copy_ent.angles;
		level.camera_ents[localclientnum][index] setextracam(index);
		return level.camera_ents[localclientnum][index];
	}
	return undefined;
}

