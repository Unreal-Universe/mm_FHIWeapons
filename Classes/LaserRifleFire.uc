class LaserRifleFire extends tk_SniperFire;

function InitEffects()
{
	Super.InitEffects();
	if (FlashEmitter != None)
		Weapon.AttachToBone(FlashEmitter, 'tip');
}

defaultproperties
{
     HitEmitterClass=Class'mm_FHIWeapons.LaserRifleBolt'
     SecHitEmitterClass=Class'mm_FHIWeapons.LaserRifleSparks'
     NumArcs=4
     DamageTypeHeadShot=Class'mm_FHIWeapons.DamTypeLaserHeadShot'
     DamageType=Class'mm_FHIWeapons.DamTypeLaserShot'
     DamageMin=105
     DamageMax=105
     TraceRange=36000.000000
     TransientSoundVolume=1.000000
     FireAnimRate=1.110000
     FireSound=Sound'mm_FHIWeapons.FHISnd.LaserRifle_Fire'
     FireRate=0.900000
     AmmoClass=Class'mm_FHIWeapons.LaserRifleAmmo'
     BotRefireRate=0.700000
     FlashEmitterClass=Class'mm_FHIWeapons.LaserRifleMuzFlash'
     aimerror=450.000000
}