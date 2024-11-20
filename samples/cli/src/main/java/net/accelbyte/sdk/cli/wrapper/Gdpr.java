/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.gdpr.configuration.*;
import net.accelbyte.sdk.cli.api.gdpr.data_deletion.*;
import net.accelbyte.sdk.cli.api.gdpr.data_deletion_s2s.*;
import net.accelbyte.sdk.cli.api.gdpr.data_retrieval.*;
import net.accelbyte.sdk.cli.api.gdpr.data_retrieval_s2s.*;
import net.accelbyte.sdk.cli.api.gdpr.platform_account_closure_client.*;
import net.accelbyte.sdk.cli.api.gdpr.platform_account_closure_history.*;
import picocli.CommandLine.Command;

@Command(
    name = "gdpr",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminGetListDeletionDataRequest.class,
      GetAdminEmailConfiguration.class,
      UpdateAdminEmailConfiguration.class,
      SaveAdminEmailConfiguration.class,
      DeleteAdminEmailConfiguration.class,
      AdminGetPlatformAccountClosureClient.class,
      AdminUpdatePlatformAccountClosureClient.class,
      AdminDeletePlatformAccountClosureClient.class,
      AdminGetListPersonalDataRequest.class,
      AdminGetServicesConfiguration.class,
      AdminUpdateServicesConfiguration.class,
      AdminResetServicesConfiguration.class,
      AdminGetPlatformAccountClosureServicesConfiguration.class,
      AdminUpdatePlatformAccountClosureServicesConfiguration.class,
      AdminResetPlatformAccountClosureServicesConfiguration.class,
      AdminGetUserPlatformAccountClosureHistories.class,
      AdminGetUserAccountDeletionRequest.class,
      AdminSubmitUserAccountDeletionRequest.class,
      AdminCancelUserAccountDeletionRequest.class,
      AdminGetUserPersonalDataRequests.class,
      AdminRequestDataRetrieval.class,
      AdminCancelUserPersonalDataRequest.class,
      AdminGeneratePersonalDataURL.class,
      PublicSubmitUserAccountDeletionRequest.class,
      PublicCancelUserAccountDeletionRequest.class,
      PublicGetUserAccountDeletionStatus.class,
      PublicGetUserPersonalDataRequests.class,
      PublicRequestDataRetrieval.class,
      PublicCancelUserPersonalDataRequest.class,
      PublicGeneratePersonalDataURL.class,
      PublicSubmitMyAccountDeletionRequest.class,
      PublicCancelMyAccountDeletionRequest.class,
      PublicGetMyAccountDeletionStatus.class,
      S2SGetListFinishedAccountDeletionRequest.class,
      S2SGetListFinishedPersonalDataRequest.class,
      S2SGetDataRequestByRequestID.class,
      S2SSubmitUserAccountDeletionRequest.class,
      S2SRequestDataRetrieval.class,
      S2SGeneratePersonalDataURL.class,
    })
public class Gdpr implements Runnable {

  @Override
  public void run() {}
}
