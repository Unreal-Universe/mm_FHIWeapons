class SC_FireAlt extends tk_ProjectileFire;

function projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile p;

	p = Super.SpawnProjectile(Start,Dir);

	return p;
}

defaultproperties
{
     ProjSpawnOffset=(X=100.000000,Z=0.000000)
     bSplashDamage=True
     bRecommendSplashDamage=True
     TransientSoundVolume=1.000000
     FireSound=Sound'mm_FHIWeapons.FHISnd.Sing_Fire'
     FireForce="redeemer_shoot"
     FireRate=4.100000
     AmmoClass=Class'mm_FHIWeapons.SC_Ammo'
     AmmoPerFire=1
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-20.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     ProjectileClass=Class'mm_FHIWeapons.SC_ProjectileAlt'
     BotRefireRate=0.990000
}