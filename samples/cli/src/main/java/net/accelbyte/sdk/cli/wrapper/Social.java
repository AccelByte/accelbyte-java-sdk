package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.social.slot_config.*;
import net.accelbyte.sdk.cli.api.social.game_profile.*;
import net.accelbyte.sdk.cli.api.social.slot.*;
import net.accelbyte.sdk.cli.api.social.global_statistic.*;
import net.accelbyte.sdk.cli.api.social.user_statistic.*;
import net.accelbyte.sdk.cli.api.social.stat_configuration.*;

import picocli.CommandLine.Command;

@Command(name = "social",
        mixinStandardHelpOptions = true,
        subcommands = {
                GetNamespaceSlotConfig.class,
                UpdateNamespaceSlotConfig.class,
                DeleteNamespaceSlotConfig.class,
                GetUserSlotConfig.class,
                UpdateUserSlotConfig.class,
                DeleteUserSlotConfig.class,
                GetUserProfiles.class,
                GetProfile.class,
                GetUserNamespaceSlots.class,
                GetSlotData.class,
                PublicGetUserGameProfiles.class,
                PublicGetUserProfiles.class,
                PublicCreateProfile.class,
                PublicGetProfile.class,
                PublicUpdateProfile.class,
                PublicDeleteProfile.class,
                PublicGetProfileAttribute.class,
                PublicUpdateAttribute.class,
                PublicGetUserNamespaceSlots.class,
                PublicCreateUserNamespaceSlot.class,
                PublicGetSlotData.class,
                PublicUpdateUserNamespaceSlot.class,
                PublicDeleteUserNamespaceSlot.class,
                PublicUpdateUserNamespaceSlotMetadata.class,
                GetGlobalStatItems.class,
                BulkFetchStatItems.class,
                BulkIncUserStatItem.class,
                BulkIncUserStatItemValue.class,
                BulkResetUserStatItem.class,
                GetStats.class,
                CreateStat.class,
                ExportStats.class,
                ImportStats.class,
                QueryStats.class,
                GetStat.class,
                DeleteStat.class,
                UpdateStat.class,
                GetUserStatItems.class,
                BulkCreateUserStatItems.class,
                BulkIncUserStatItem1.class,
                BulkIncUserStatItemValue1.class,
                BulkResetUserStatItem1.class,
                CreateUserStatItem.class,
                DeleteUserStatItems.class,
                IncUserStatItemValue.class,
                ResetUserStatItemValue.class,
                BulkFetchStatItems1.class,
                PublicBulkIncUserStatItem.class,
                PublicBulkIncUserStatItemValue.class,
                BulkResetUserStatItem2.class,
                CreateStat1.class,
                PublicQueryUserStatItems.class,
                PublicBulkCreateUserStatItems.class,
                PublicBulkIncUserStatItem1.class,
                BulkIncUserStatItemValue2.class,
                BulkResetUserStatItem3.class,
                PublicCreateUserStatItem.class,
                DeleteUserStatItems1.class,
                PublicIncUserStatItem.class,
                PublicIncUserStatItemValue.class,
                ResetUserStatItemValue1.class,
                BulkUpdateUserStatItemV2.class,
                BulkUpdateUserStatItem.class,
                DeleteUserStatItems2.class,
                UpdateUserStatItemValue.class,
                BulkUpdateUserStatItem1.class,
                BulkUpdateUserStatItem2.class,
                UpdateUserStatItemValue1.class,
        }
)
public class Social implements Runnable {

    @Override
    public void run() {

    }
}