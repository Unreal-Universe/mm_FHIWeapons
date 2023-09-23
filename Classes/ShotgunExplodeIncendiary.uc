class ShotgunExplodeIncendiary extends xHeavyWallHitEffect;

simulated function SpawnEffects()
{
	PlaySound(ImpactSounds[Rand(10)]);

	if ( PhysicsVolume.bWaterVolume )
	{
		Spawn(class'pclImpactSmoke');
		return;
	}
	if ( (Level.DetailMode == DM_Low) || Level.bDropDetail )
	{
		Spawn(class'mm_FHIWeapons.ShotgunSmallExplosion');
		return;
	}

	Spawn(class'pclImpactSmoke');
	Spawn(class'mm_FHIWeapons.ShotgunSmallExplosion');
}

defaultproperties
{
}
