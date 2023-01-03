class HVAssaultRifle extends tk_AssaultRifle
	config(TKWeaponsClient);

var HVAssaultAttachment HVOffhandActor;

simulated function DetachFromPawn(Pawn P)
{
	bFireLeft = false;
	HVBombFire(FireMode[1]).ReturnToIdle();
	Super.DetachFromPawn(P);
	if (HVOffhandActor != None)
	{
		HVOffhandActor.Destroy();
		HVOffhandActor = None;
	}
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	if (ThirdPersonActor == None)
	{
		ThirdPersonActor = Spawn(AttachmentClass,Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);
	}

	BoneName = P.GetWeaponBoneFor(self);
	if (BoneName == '')
	{
		ThirdPersonActor.SetLocation(P.Location);
		ThirdPersonActor.SetBase(P);
	}
	else
	{
		P.AttachToBone(ThirdPersonActor, BoneName);
	}

	if (bDualMode)
	{
		BoneName = P.GetOffHandBoneFor(self);
		if (BoneName == '')
			return;

		if (HVOffhandActor == None)
		{
			HVOffhandActor = HVAssaultAttachment(Spawn(AttachmentClass, Owner));
			HVOffhandActor.InitFor(self);
		}

		P.AttachToBone(HVOffhandActor, BoneName);
		if (HVOffhandActor.AttachmentBone == '')
		{
			HVOffhandActor.Destroy();
		}
		else
		{
			ThirdPersonActor.SetDrawScale(0.3);
			HVOffhandActor.SetDrawScale(0.3);
			HVOffhandActor.bDualGun = true;
			HVOffhandActor.TwinGun = HVAssaultAttachment(ThirdPersonActor);

			HVOffhandActor.SetRelativeRotation(rot(0,0,32768));
			HVOffhandActor.SetRelativeLocation(vect(40,-3,-7));

			HVAssaultAttachment(ThirdPersonActor).TwinGun = HVOffhandActor;
		}
	}
}

simulated function NewDrawWeaponInfo(Canvas Canvas, float YPos)
{
	local int i,Count;
	local float ScaleFactor;

	ScaleFactor = 99 * Canvas.ClipX/3200;
	Canvas.Style = ERenderStyle.STY_Alpha;
	Canvas.DrawColor = class'HUD'.Default.WhiteColor;
	Count = Min(8, AmmoAmount(1));
	for(i = 0; i < Count; i++)
	{
		Canvas.SetPos(Canvas.ClipX - (0.5*i+1) * ScaleFactor, YPos);
		Canvas.DrawTile(Material'tk_FHIWeapons.FHIHud.HUDIcons', ScaleFactor, ScaleFactor, 283, 199, 356, 269);
	}

	if (AmmoAmount(1) > 8)
	{
		Count = Min(16,AmmoAmount(1));
		for(i = 8; i < Count; i++)
		{
			Canvas.SetPos(Canvas.ClipX - (0.5*(i-8)+1) * ScaleFactor, YPos - ScaleFactor);
			Canvas.DrawTile(Material'tk_FHIWeapons.FHIHud.HUDIcons', ScaleFactor, ScaleFactor, 283, 199, 356, 269);
		}
	}
}

defaultproperties
{
     FireModeClass(0)=Class'tk_FHIWeapons.HVAssaultFire'
     FireModeClass(1)=Class'tk_FHIWeapons.HVBombFire'
     PutDownAnim="PutDown"
     SelectSound=Sound'WeaponSounds.AssaultRifle.SwitchToAssaultRifle'
     SelectForce="SwitchToAssaultRifle"
     AIRating=0.400000
     CurrentRating=0.400000
     Description="MkII upgraded Assault Rifle. Fires hyper velocity bullets at an extreme rate of fire with less spread than the original model. Secondary grenades have been replaced with deadly anti-gravity (AG) bombs that pack considerable punch and ignore armor."
     EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
     DisplayFOV=70.000000
     Priority=20
     HudColor=(B=255,G=0)
     SmallViewOffset=(X=13.000000,Y=12.000000,Z=-10.000000)
     CenteredOffsetY=-5.000000
     CenteredRoll=3000
     CenteredYaw=-1500
     CustomCrosshair=11
     CustomCrossHairScale=0.666700
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
     InventoryGroup=2
     GroupOffset=10
     PickupClass=Class'tk_FHIWeapons.HVAssaultRiflePickup'
     PlayerViewOffset=(X=4.000000,Y=5.500000,Z=-6.000000)
     PlayerViewPivot=(Pitch=400)
     BobDamping=3.000000
     AttachmentClass=Class'tk_FHIWeapons.HVAssaultAttachment'
     IconMaterial=Texture'HUDContent.Generic.HUD'
     IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
     ItemName="HV Assault Rifle"
     LightType=LT_Pulse
     LightEffect=LE_NonIncidence
     LightHue=30
     LightSaturation=150
     LightBrightness=255.000000
     LightRadius=4.000000
     LightPeriod=3
     Mesh=SkeletalMesh'NewWeapons2004.AssaultRifle'
     DrawScale=0.800000
}