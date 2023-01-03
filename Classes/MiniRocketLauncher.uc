class MiniRocketLauncher extends tk_RocketLauncher
	config(TKWeaponsClient);

const FHI_NUM_BARRELS = 6;
const FHI_BARREL_ROTATION_RATE = 5.9;

function Tick(float dt)
{
	Super.Tick(dt);
}

function bool CanLockOnTo(Actor Other)
{
	local Pawn P;

	P = Pawn(Other);
	if (P == None || P == Instigator || !P.bProjTarget)
		return false;

	if (!Level.Game.bTeamGame)
		return true;

	return ((P.PlayerReplicationInfo == None) || (P.PlayerReplicationInfo.Team != Instigator.PlayerReplicationInfo.Team));
}

simulated event RenderOverlays( Canvas Canvas )
{
	if (bLockedOn)
	{
		Canvas.DrawColor = CrosshairColor;
		Canvas.DrawColor.A = 255;
		Canvas.Style = ERenderStyle.STY_Alpha;

		Canvas.SetPos(Canvas.SizeX*0.5-CrosshairX, Canvas.SizeY*0.5-CrosshairY);
		Canvas.DrawTile(Texture'tk_FHIWeapons.FHIHud.MiniRocket_LockIcon', CrosshairX*2.0, CrosshairY*2.0, 0.0, 0.0, Texture'tk_FHIWeapons.FHIHud.MiniRocket_LockIcon'.USize, Texture'tk_FHIWeapons.FHIHud.MiniRocket_LockIcon'.VSize);
	}

	Super.RenderOverlays(Canvas);
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local MiniRocketProj Rocket;
	local MiniSeekingRocketProj SeekingRocket;
	local bot B;

	bBreakLock = true;

	// decide if bot should be locked on
	B = Bot(Instigator.Controller);
	if ( (B != None) && (B.Skill > 2 + 5 * FRand()) && (FRand() < 0.6)
		&& (B.Target == B.Enemy) && (VSize(B.Enemy.Location - B.Pawn.Location) > 2000 + 2000 * FRand())
		&& (Level.TimeSeconds - B.LastSeenTime < 0.4) && (Level.TimeSeconds - B.AcquireTime > 0.5) )
	{
		bLockedOn = true;
		SeekTarget = B.Enemy;
	}

	if (bLockedOn && SeekTarget != None)
	{
		SeekingRocket = Spawn(class'MiniSeekingRocketProj',,, Start, Dir);
		SeekingRocket.Seeking = SeekTarget;
		if (B != None)
		{
			bLockedOn = false;
			SeekTarget = None;
		}
		return SeekingRocket;
	}
	else
	{
		Rocket = Spawn(class'MiniRocketProj',,, Start, Dir);
		return Rocket;
	}
}

simulated function RotateBarrel()
{
	FinalRotation += 65535.0 / FHI_NUM_BARRELS;
	if (FinalRotation >= 65535.0)
	{
		FinalRotation -= 65535.0;
		BarrelRotation -= 65535.0;
	}
	bRotateBarrel = true;
}

simulated function UpdateBarrel(float dt)
{
	local Rotator R;

	BarrelRotation += dt * 65535.0 * FHI_BARREL_ROTATION_RATE / FHI_NUM_BARRELS;
	if (BarrelRotation > FinalRotation)
	{
		BarrelRotation = FinalRotation;
		bRotateBarrel = false;
	}

	R.Roll = BarrelRotation;
	SetBoneRotation('Bone_Barrel', R, 0, 1);
}


simulated event ClientStartFire(int Mode)
{
	local int OtherMode;

	if (MiniRocketAltFire(FireMode[Mode]) != None)
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
				log("No MRL reg fire because other firing "$FireMode[OtherMode].bIsFiring$" next fire "$(FireMode[OtherMode].NextFireTime - Level.TimeSeconds));
			return;
		}
	}
	Super.ClientStartFire(Mode);
}

simulated function bool StartFire(int Mode)
{
	return Super.StartFire(Mode);
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	Super.BringUp(PrevWeapon);
}

simulated state AnimateLoad
{
	simulated function Tick(float dt)
	{
		if (bRotateBarrel)
			UpdateBarrel(dt);
	}

Begin:
	Sleep(0.02);
	RotateBarrel();
	Sleep(0.2);
	PlayOwnedSound(Sound'tk_FHIWeapons.FHISnd.GrenadeLauncher_PickupAmmo', SLOT_None,,,,,false);
	ClientPlayForceFeedback("RocketLauncherLoad");
	Sleep(0.06);
	GotoState('');
}

defaultproperties
{
     SeekCheckFreq=0.100000
     SeekRange=15000.000000
     LockRequiredTime=0.000001
     UnLockRequiredTime=2.000000
     LockAim=0.996000
     CrossHairColor=(R=250,A=255)
     CrosshairX=24.000000
     CrosshairY=24.000000
     FireModeClass(0)=Class'tk_FHIWeapons.MiniRocketFire'
     FireModeClass(1)=Class'tk_FHIWeapons.MiniRocketAltFire'
     PutDownAnim="PutDown"
     SelectForce="SwitchToRocketLauncher"
     AIRating=0.780000
     CurrentRating=0.780000
     Description="Hexadyne weapon systems have been manufacturing the 'Hydra' six-barrel Mini-Rocket Launcher for some years now. A very high rate of fire on primary, coupled with the ability to load up and fire a cluster of up to six rockets on the secondary make this a very powerful weapon indeed. Add to that the fact that it can lock on to thermal heat signatures and send it's rockets homing directly to the target and you have a weapon that is rightly feared and respected by most contestants."
     Priority=24
     HudColor=(G=0)
     CustomCrosshair=2
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Circle1"
     InventoryGroup=6
     GroupOffset=10
     PickupClass=Class'tk_FHIWeapons.MiniRocketLauncherPickup'
     PlayerViewOffset=(X=-5.000000,Y=8.000000)
     PlayerViewPivot=(Yaw=500,Roll=1000)
     BobDamping=2.990000
     AttachmentClass=Class'tk_FHIWeapons.MiniRocketAttachment'
     IconMaterial=Texture'tk_FHIWeapons.FHIHud.HUDIcons'
     IconCoords=(X1=46,Y1=184,X2=138,Y2=216)
     ItemName="Mini-Rocket Launcher"
     Mesh=SkeletalMesh'Weapons.Minigun_1st'
     Skins(0)=Texture'tk_FHIWeapons.FHITex.MiniRocketTex'
     UV2Texture=Shader'XGameShaders.WeaponShaders.WeaponEnvShader'
}