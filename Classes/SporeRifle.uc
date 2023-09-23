class SporeRifle extends tk_BioRifle
    config(TKWeaponsClient);

defaultproperties
{
     FireModeClass(0)=Class'mm_FHIWeapons.SporeFire'
     FireModeClass(1)=Class'mm_FHIWeapons.SporeAltFire'
     GroupOffset=62
     PickupClass=Class'mm_FHIWeapons.SporeRiflePickup'
     BobDamping=3.000000
     AttachmentClass=Class'mm_FHIWeapons.SporeAttachment'
     ItemName="Spore-Rifle"
}
