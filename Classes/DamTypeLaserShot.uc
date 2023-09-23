class DamTypeLaserShot extends DamTypeSniperShot
	abstract;

defaultproperties
{
     WeaponClass=Class'mm_FHIWeapons.LaserRifle'
     DeathString="%o was fried by %k's laser rifle"
     DamageOverlayMaterial=Shader'mm_FHIWeapons.FHIShaders.LaserRifleHit_Shader'
     DamageOverlayTime=1.250000
     GibPerterbation=0.750000
}