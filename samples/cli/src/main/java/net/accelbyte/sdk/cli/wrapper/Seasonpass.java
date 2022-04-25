/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.seasonpass.season.*;
import net.accelbyte.sdk.cli.api.seasonpass.pass.*;
import net.accelbyte.sdk.cli.api.seasonpass.reward.*;
import net.accelbyte.sdk.cli.api.seasonpass.tier.*;

import picocli.CommandLine.Command;

@Command(name = "seasonpass",
        mixinStandardHelpOptions = true,
        subcommands = {
                QuerySeasons.class,
                CreateSeason.class,
                GetCurrentSeason.class,
                GetSeason.class,
                DeleteSeason.class,
                UpdateSeason.class,
                CloneSeason.class,
                QueryPasses.class,
                CreatePass.class,
                GetPass.class,
                DeletePass.class,
                UpdatePass.class,
                PublishSeason.class,
                RetireSeason.class,
                QueryRewards.class,
                CreateReward.class,
                GetReward.class,
                DeleteReward.class,
                UpdateReward.class,
                QueryTiers.class,
                CreateTier.class,
                UpdateTier.class,
                DeleteTier.class,
                ReorderTier.class,
                UnpublishSeason.class,
                GetUserParticipatedSeasons.class,
                GrantUserExp.class,
                GrantUserPass.class,
                ExistsAnyPassByPassCodes.class,
                GetCurrentUserSeasonProgression.class,
                CheckSeasonPurchasable.class,
                ResetUserSeason.class,
                GrantUserTier.class,
                GetUserSeason.class,
                PublicGetCurrentSeason.class,
                PublicGetCurrentUserSeason.class,
                PublicClaimUserReward.class,
                PublicBulkClaimUserRewards.class,
                PublicGetUserSeason.class,
        }
)
public class Seasonpass implements Runnable {

    @Override
    public void run() {

    }
}