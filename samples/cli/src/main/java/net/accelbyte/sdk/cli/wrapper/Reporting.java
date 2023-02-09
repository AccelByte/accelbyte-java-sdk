/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.reporting.admin_configurations.*;
import net.accelbyte.sdk.cli.api.reporting.admin_extension_categories_and_auto_moderation_actions.*;
import net.accelbyte.sdk.cli.api.reporting.admin_moderation_rule.*;
import net.accelbyte.sdk.cli.api.reporting.admin_reasons.*;
import net.accelbyte.sdk.cli.api.reporting.admin_reports.*;
import net.accelbyte.sdk.cli.api.reporting.admin_tickets.*;
import net.accelbyte.sdk.cli.api.reporting.public_reasons.*;
import net.accelbyte.sdk.cli.api.reporting.public_reports.*;
import picocli.CommandLine.Command;

@Command(
    name = "reporting",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminFindActionList.class,
      AdminCreateModAction.class,
      AdminFindExtensionCategoryList.class,
      AdminCreateExtensionCategory.class,
      Get.class,
      Upsert.class,
      AdminListReasonGroups.class,
      CreateReasonGroup.class,
      GetReasonGroup.class,
      DeleteReasonGroup.class,
      UpdateReasonGroup.class,
      AdminGetReasons.class,
      CreateReason.class,
      AdminGetAllReasons.class,
      AdminGetUnusedReasons.class,
      AdminGetReason.class,
      DeleteReason.class,
      UpdateReason.class,
      ListReports.class,
      AdminSubmitReport.class,
      CreateModerationRule.class,
      UpdateModerationRule.class,
      DeleteModerationRule.class,
      UpdateModerationRuleStatus.class,
      GetModerationRules.class,
      GetModerationRuleDetails.class,
      ListTickets.class,
      TicketStatistic.class,
      GetTicketDetail.class,
      DeleteTicket.class,
      GetReportsByTicket.class,
      UpdateTicketResolutions.class,
      PublicListReasonGroups.class,
      PublicGetReasons.class,
      SubmitReport.class,
    })
public class Reporting implements Runnable {

  @Override
  public void run() {}
}
