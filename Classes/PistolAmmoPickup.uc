class PistolAmmoPickup extends UTAmmoPickup;

defaultproperties
{
     AmmoAmount=20
     InventoryType=Class'mm_FHIWeapons.PistolAmmo'
     PickupMessage="You picked up pistol clips"
     PickupSound=Sound'mm_FHIWeapons.FHISnd.Pistol_PickupAmmo'
     PickupForce="SniperAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'mm_FHIWeapons.FHIMesh.PistolAmmoMesh''
     PrePivot=(Z=16.000000)
     CollisionHeight=16.000000
}
