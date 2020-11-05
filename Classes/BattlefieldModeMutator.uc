class BattlefieldModeMutator extends ROMutator
    config(Mutator_BattlefieldMode);

function PreBeginPlay()
{
    `bflog("PreBeginPlay()", 'Init');
}

function PostBeginPlay()
{
    `bflog("PostBeginPlay()", 'Init');
    Modifications();
    SaveConfig();
}

simulated function Modifications()
{
    OverrideMapInfo();
}

simulated function OverrideMapInfo()
{
    local ROMapInfo ROMI;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    `bflog("NorthArtilleryStrikeInterval=" $ ROMI.NorthArtilleryStrikeInterval, 'Debug');
    `bflog("SouthArtilleryStrikeInterval=" $ ROMI.SouthArtilleryStrikeInterval, 'Debug');

    ROMI.NorthArtilleryStrikeInterval = ROMI.EROArtyStrikeInterval.STINT_Short_30s; // Not working
    ROMI.SouthArtilleryStrikeInterval = ROMI.EROArtyStrikeInterval.STINT_Short_30s; // Not working
    // No cooldown recon for both sides
    ROMI.ScoutReconInterval = 0;
    ROMI.AerialReconInterval = 0;
    // Instant respawn
    ROMI.MinimumTimeDead = 0;
    ROMI.AxisReinforcementDelay16 = 1;
    ROMI.AxisReinforcementDelay32 = 1;
    ROMI.AxisReinforcementDelay64 = 1;
    ROMI.AlliesReinforcementDelay16 = 1;
    ROMI.AlliesReinforcementDelay32 = 1;
    ROMI.AlliesReinforcementDelay64 = 1;

    `bflog("NorthArtilleryStrikeInterval=" $ ROMI.NorthArtilleryStrikeInterval, 'Debug');
    `bflog("SouthArtilleryStrikeInterval=" $ ROMI.SouthArtilleryStrikeInterval, 'Debug');
}