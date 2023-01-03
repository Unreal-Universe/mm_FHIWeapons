class Pistol extends tk_AssaultRifle
    config(TKWeaponsClient);

var PistolAttachment PistolHandActor;

simulated function DetachFromPawn(Pawn P)
{
	bFireLeft = false;
	Super.DetachFromPawn(P);
	if (PistolHandActor != None)
	{
		PistolHandActor.Destroy();
		PistolHandActor = None;
	}
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	if (ThirdPersonActor == None)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
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

		if (PistolHandActor == None)
		{
			PistolHandActor = PistolAttachment(Spawn(AttachmentClass, Owner));
			PistolHandActor.InitFor(self);
		}

		P.AttachToBone(PistolHandActor, BoneName);
		if (PistolHandActor.AttachmentBone == '')
		{
			PistolHandActor.Destroy();
		}
		else
		{
			ThirdPersonActor.SetDrawScale(0.6);
			PistolHandActor.SetDrawScale(0.6);
			PistolHandActor.bDualGun = true;
			PistolHandActor.TwinGun = PistolAttachment(ThirdPersonActor);

			if (Mesh == OldMesh)
			{
			    PistolHandActor.SetRelativeRotation(rot(0, 32768, 0));
			    PistolHandActor.SetRelativeLocation(vect(20, -10, -5));
			}
			else
			{
			    PistolHandActor.SetRelativeRotation(rot(0, 32768, 0));
			    PistolHandActor.SetRelativeLocation(vect(10, -2, -6));
			}

			PistolAttachment(ThirdPersonActor).TwinGun = PistolHandActor;
		}
	}
}

function float SuggestAttackStyle()
{
	return 0.4;
}

function float SuggestDefenseStyle()
{
	return 0.2;
}

defaultproperties
{
     FireModeClass(0)=Class'tk_FHIWeapons.PistolFire'
     FireModeClass(1)=Class'tk_FHIWeapons.PistolProjFire'
     SelectAnim="Pickup"
     PutDownAnim="PutDown"
     SelectAnimRate=0.750000
     PutDownAnimRate=0.780000
     PutDownTime=0.580000
     BringUpTime=0.600000
     SelectSound=Sound'tk_FHIWeapons.FHISnd.Pistol_Select'
     SelectForce="NewSniperLoad"
     AIRating=0.690000
     CurrentRating=0.690000
     bSniping=True
     Description="This high muzzle velocity pistol is a lethal weapon at short to medium range, especially if you can land a head shot."
     EffectOffset=(X=100.000000,Y=28.000000,Z=-19.000000)
     DisplayFOV=60.000000
     Priority=21
     HudColor=(B=255,G=170,R=185)
     SmallViewOffset=(X=30.900002,Y=15.000000,Z=-14.000000)
     CenteredOffsetY=0.000000
     CenteredYaw=-500
     CustomCrosshair=7
     CustomCrossHairColor=(G=170,R=185)
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
     InventoryGroup=5
     GroupOffset=22
     PickupClass=Class'tk_FHIWeapons.PistolPickup'
     PlayerViewOffset=(X=20.000000,Y=9.300000,Z=-11.000000)
     BobDamping=3.000000
     AttachmentClass=Class'tk_FHIWeapons.PistolAttachment'
     IconMaterial=Texture'tk_FHIWeapons.FHIHud.HUDIcons'
     IconCoords=(X1=51,Y1=108,X2=121,Y2=147)
     ItemName="Pistol"
     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightHue=30
     LightSaturation=170
     LightBrightness=255.000000
     LightRadius=5.000000
     LightPeriod=3
     CullDistance=5000.000000
     Mesh=SkeletalMesh'tk_FHIWeapons.FHIAnim.Pistol_1st'
     DrawScale=0.810000
}