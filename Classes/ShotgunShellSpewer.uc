class ShotgunShellSpewer extends xEmitter;

var() Sound ShellImpactSnd;

function CollisionSound()
{
    PlaySound(ShellImpactSnd);
}

defaultproperties
{
     ShellImpactSnd=ProceduralSound'WeaponSounds.PShell1.P1Shell1'
     mParticleType=PT_Mesh
     mStartParticles=0
     mMaxParticles=150
     mLifeRange(0)=0.500000
     mLifeRange(1)=1.000000
     mRegenRange(0)=0.000000
     mRegenRange(1)=0.000000
     mDirDev=(X=0.500000,Y=0.200000,Z=0.600000)
     mSpeedRange(0)=200.000000
     mSpeedRange(1)=250.000000
     mMassRange(0)=2.000000
     mMassRange(1)=2.000000
     mSpinRange(0)=-100.000000
     mSpinRange(1)=100.000000
     mAttenFunc=ATF_None
     mMeshNodes(0)=StaticMesh'mm_FHIWeapons.FHIMesh.ShotgunBullet'
     mColMakeSound=True
     bHighDetail=True
     bNetTemporary=False
     DrawScale=0.200000
     Skins(0)=Texture'mm_FHIWeapons.FHITex.ShotgunShellTex'
}
