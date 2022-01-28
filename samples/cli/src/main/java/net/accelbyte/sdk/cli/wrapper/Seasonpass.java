package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.seasonpass.pass.*;
import net.accelbyte.sdk.cli.api.seasonpass.reward.*;
import net.accelbyte.sdk.cli.api.seasonpass.season.*;
import net.accelbyte.sdk.cli.api.seasonpass.tier.*;

import picocli.CommandLine.Command;

@Command(name = "seasonpass",
        mixinStandardHelpOptions = true,
        subcommands = {
                GetPass.class,
                DeletePass.class,
                UpdatePass.class,
                QueryPasses.class,
                CreatePass.class,
                GetReward.class,
                DeleteReward.class,
                UpdateReward.class,
                QueryRewards.class,
                CreateReward.class,
                UnpublishSeason.class,
                GetSeason.class,
                DeleteSeason.class,
                UpdateSeason.class,
                CloneSeason.class,
                QuerySeasons.class,
                CreateSeason.class,
                RetireSeason.class,
                PublishSeason.class,
                GetCurrentSeason.class,
                UpdateTier.class,
                DeleteTier.class,
                QueryTiers.class,
                CreateTier.class,
                ExistsAnyPassByPassCodes.class,
                GrantUserTier.class,
                GetUserSeason.class,
                CheckSeasonPurchasable.class,
                GetCurrentUserSeasonProgression.class,
                ResetUserSeason.class,
                GrantUserPass.class,
                GetUserParticipatedSeasons.class,
                GrantUserExp.class,
                PublicGetCurrentSeason.class,
                PublicClaimUserReward.class,
                PublicGetCurrentUserSeason.class,
                PublicBulkClaimUserRewards.class,
                PublicGetUserSeason.class,
        }
)
public class Seasonpass implements Runnable {

    @Override
    public void run() {

    }
}