class FlareTrail extends xEmitter;

defaultproperties
{
     mStartParticles=0
     mMaxParticles=150
     mLifeRange(0)=1.000000
     mLifeRange(1)=1.000000
     mRegenRange(0)=110.000000
     mRegenRange(1)=110.000000
     mSpeedRange(0)=0.000000
     mSpeedRange(1)=0.000000
     mMassRange(0)=-0.030000
     mMassRange(1)=-0.010000
     mRandOrient=True
     mSpinRange(0)=-105.000000
     mSpinRange(1)=105.000000
     mSizeRange(0)=12.000000
     mSizeRange(1)=16.000000
     mGrowthRate=40.000000
     mColorRange(1)=(B=210,G=210)
     mAttenFunc=ATF_ExpInOut
     mRandTextures=True
     mNumTileColumns=4
     mNumTileRows=4
     Physics=PHYS_Trailer
     Skins(0)=Texture'mm_FHIWeapons.FHITex.FlareFlames'
     Style=STY_Additive
}