class ShotgunAmmoPickup extends UTAmmoPickup;

defaultproperties
{
     AmmoAmount=20
     MaxDesireability=0.320000
     InventoryType=Class'mm_FHIWeapons.ShotgunAmmo'
     PickupMessage="You picked up 20 Shotgun Shells."
     PickupSound=Sound'mm_FHIWeapons.FHISnd.Shotgun_PickupAmmo'
     PickupForce="FlakAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'mm_FHIWeapons.FHIMesh.ShotgunAmmoMesh'
     DrawScale=0.850000
     CollisionHeight=8.250000
}
