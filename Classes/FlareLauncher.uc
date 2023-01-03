class FlareLauncher extends tk_RocketLauncher
	config(TKWeaponsClient);

// this weapons did not have lock target previously.
// removing this function will enable it, probably. -voltz
function bool CanLockOnTo(Actor Other)
{
	return false;
}

simulated event ClientStartFire(int Mode)
{
	local int OtherMode;

	if (FlareMultiFire(FireMode[Mode]) != None)
	{
		SetTightSpread(false);
	}
	else
	{
		if (Mode == 0)
			OtherMode = 1;
		else
			OtherMode = 0;

		if (FireMode[OtherMode].bIsFiring || (FireMode[OtherMode].NextFireTime > Level.TimeSeconds))
		{
			if (FireMode[OtherMode].Load > 0)
				SetTightSpread(true);

			if (bDebugging)
				log("No RL reg fire because other firing "$FireMode[OtherMode].bIsFiring$" next fire "$(FireMode[OtherMode].NextFireTime - Level.TimeSeconds));

			return;
		}
	}
	Super.ClientStartFire(Mode);
}


simulated state AnimateLoad
{
	simulated function Tick(float dt)
	{
		if (bRotateBarrel)
			UpdateBarrel(dt);
	}

Begin:
	Sleep(0.15);
	RotateBarrel();
	Sleep(0.07);
	PlayOwnedSound(Sound'tk_FHIWeapons.FHISnd.RL_PickupAmmo', SLOT_None,,,,,false);
	ClientPlayForceFeedback("RocketLauncherLoad");
	Sleep(0.28);
	Plunge();
	PlayOwnedSound(Sound'WeaponSounds.RocketLauncher.RocketLauncherPlunger', SLOT_None,,,,,false);
	ClientPlayForceFeedback("RocketLauncherPlunger");
	Sleep(0.29);
	GotoState('');
}

defaultproperties
{
     FireModeClass(0)=Class'tk_FHIWeapons.FlareFire'
     FireModeClass(1)=Class'tk_FHIWeapons.FlareMultiFire'
     Description="The IPFL-MkIII is the latest variant of the Flare Launcher. Firing Ionized Plasma Flare Missiles, the Flare Launcher is one of the deadliest weapons currently in production for the Tournament. With an extreme fire rate on primary, and the ability to load up three missiles on secondary, the Flare Launcher makes very short work of all but the most heavily armoured of opponents. The basic look and feel of the weapon has changed little since it's incorporation into the Tournament, however, the latest batch of upgrades to the missiles themselves have certainly improved the dramatic good looks of the weapon."
     Priority=26
     CustomCrosshair=15
     CustomCrossHairColor=(B=0,G=0)
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Triad2"
     InventoryGroup=8
     GroupOffset=10
     PickupClass=Class'tk_FHIWeapons.FlareLauncherPickup'
     BobDamping=2.990000
     AttachmentClass=Class'tk_FHIWeapons.FlareAttachment'
     IconMaterial=Texture'tk_FHIWeapons.FHIHud.HUDIcons'
     IconCoords=(X1=44,Y1=306,X2=134,Y2=343)
     ItemName="Flare Launcher"
     Mesh=SkeletalMesh'Weapons.RocketLauncher_1st'
     Skins(0)=Texture'tk_FHIWeapons.FHITex.FlareLauncherTex'
     HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}