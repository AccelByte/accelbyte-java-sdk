/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.social.game_profile.*;
import net.accelbyte.sdk.cli.api.social.global_statistic.*;
import net.accelbyte.sdk.cli.api.social.slot.*;
import net.accelbyte.sdk.cli.api.social.slot_config.*;
import net.accelbyte.sdk.cli.api.social.stat_configuration.*;
import net.accelbyte.sdk.cli.api.social.stat_cycle_configuration.*;
import net.accelbyte.sdk.cli.api.social.user_statistic.*;
import net.accelbyte.sdk.cli.api.social.user_statistic_cycle.*;
import picocli.CommandLine.Command;

@Command(
    name = "social",
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
      GetGlobalStatItemByStatCode.class,
      GetStatCycles.class,
      CreateStatCycle.class,
      BulkGetStatCycle.class,
      GetStatCycle.class,
      UpdateStatCycle.class,
      DeleteStatCycle.class,
      BulkAddStats.class,
      StopStatCycle.class,
      BulkFetchStatItems.class,
      BulkIncUserStatItem.class,
      BulkIncUserStatItemValue.class,
      BulkFetchOrDefaultStatItems.class,
      BulkResetUserStatItem.class,
      GetStats.class,
      CreateStat.class,
      ExportStats.class,
      ImportStats.class,
      QueryStats.class,
      GetStat.class,
      DeleteStat.class,
      UpdateStat.class,
      DeleteTiedStat.class,
      GetUserStatCycleItems.class,
      GetUserStatItems.class,
      BulkCreateUserStatItems.class,
      BulkIncUserStatItem1.class,
      BulkIncUserStatItemValue1.class,
      BulkResetUserStatItem1.class,
      CreateUserStatItem.class,
      DeleteUserStatItems.class,
      IncUserStatItemValue.class,
      ResetUserStatItemValue.class,
      GetGlobalStatItems1.class,
      GetGlobalStatItemByStatCode1.class,
      GetStatCycles1.class,
      BulkGetStatCycle1.class,
      GetStatCycle1.class,
      BulkFetchStatItems1.class,
      PublicBulkIncUserStatItem.class,
      PublicBulkIncUserStatItemValue.class,
      BulkResetUserStatItem2.class,
      CreateStat1.class,
      PublicListMyStatCycleItems.class,
      PublicListMyStatItems.class,
      PublicListAllMyStatItems.class,
      GetUserStatCycleItems1.class,
      PublicQueryUserStatItems.class,
      PublicBulkCreateUserStatItems.class,
      PublicQueryUserStatItems1.class,
      PublicBulkIncUserStatItem1.class,
      BulkIncUserStatItemValue2.class,
      BulkResetUserStatItem3.class,
      PublicCreateUserStatItem.class,
      DeleteUserStatItems1.class,
      PublicIncUserStatItem.class,
      PublicIncUserStatItemValue.class,
      ResetUserStatItemValue1.class,
      BulkUpdateUserStatItemV2.class,
      BulkFetchOrDefaultStatItems1.class,
      AdminListUsersStatItems.class,
      BulkUpdateUserStatItem.class,
      BulkResetUserStatItemValues.class,
      DeleteUserStatItems2.class,
      UpdateUserStatItemValue.class,
      BulkUpdateUserStatItem1.class,
      PublicQueryUserStatItems2.class,
      BulkUpdateUserStatItem2.class,
      UpdateUserStatItemValue1.class,
    })
public class Social implements Runnable {

  @Override
  public void run() {}
}
