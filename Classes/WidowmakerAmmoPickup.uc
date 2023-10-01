class WidowmakerAmmoPickup extends UTAmmoPickup;

defaultproperties
{
     AmmoAmount=15
     InventoryType=Class'mm_FHIWeapons.WidowmakerAmmo'
     PickupMessage="You picked up sniper ammo."
     PickupSound=Sound'mm_FHIWeapons.FHISnd.SniperRifle_PickupAmmo'
     PickupForce="SniperAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'mm_FHIWeapons.FHIMesh.WidowAmmoMesh'
     PrePivot=(Z=16.000000)
     CollisionHeight=16.000000
}
