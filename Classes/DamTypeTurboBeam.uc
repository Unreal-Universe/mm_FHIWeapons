class DamTypeTurboBeam extends DamTypeShockBeam
	abstract;

defaultproperties
{
     WeaponClass=Class'mm_FHIWeapons.TurboLaser'
     DeathString="%o was beamed by %k's Turbo Laser"
     DamageOverlayMaterial=Shader'mm_FHIWeapons.FHIShaders.TurboLaserHit_Shader'
     DamageOverlayTime=1.500000
}