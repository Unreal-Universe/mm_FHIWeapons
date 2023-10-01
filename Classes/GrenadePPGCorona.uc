class GrenadePPGCorona extends Effects;

auto state Start
{
	simulated function Tick(float dt)
	{
		SetDrawScale(FMin(DrawScale + dt*12.0, 1.5));
		if (DrawScale >= 1.5)
			GotoState('End');
	}
}

state End
{
	simulated function Tick(float dt)
	{
		SetDrawScale(FMax(DrawScale - dt*12.0, 0.9));
		if (DrawScale <= 0.9)
			GotoState('');
	}
}

defaultproperties
{
     bHighDetail=True
     Physics=PHYS_Trailer
     Texture=Texture'mm_FHIWeapons.FHITex.Flare_D'
     DrawScale3D=(X=0.175000,Y=0.175000,Z=0.175000)
     Skins(0)=Texture'mm_FHIWeapons.FHITex.Flare_D'
     Style=STY_Translucent
     Mass=13.000000
}