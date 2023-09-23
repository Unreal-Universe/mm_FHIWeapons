class RailgunAmmoPickup extends UTAmmoPickup;

defaultproperties
{
     AmmoAmount=40
     InventoryType=Class'mm_FHIWeapons.RailgunAmmo'
     PickupMessage="You picked up some particle ammo."
     PickupSound=Sound'mm_FHIWeapons.FHISnd.Phoenix_PickupAmmo'
     PickupForce="ShockAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'WeaponStaticMesh.LinkAmmoPickup'
     CollisionHeight=32.000000
}
