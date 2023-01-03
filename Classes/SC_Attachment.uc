class SC_Attachment extends xWeaponAttachment;

simulated event ThirdPersonEffects()
{
	Super.ThirdPersonEffects();
}

defaultproperties
{
     bHeavy=True
     Mesh=SkeletalMesh'tk_FHIWeapons.FHIAnim.SC_3rd'
     DrawScale=0.420000
}