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
import net.accelbyte.sdk.cli.api.gdpr.data_retrieval.*;
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
      AdminGetListPersonalDataRequest.class,
      AdminGetServicesConfiguration.class,
      AdminUpdateServicesConfiguration.class,
      AdminResetServicesConfiguration.class,
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
    })
public class Gdpr implements Runnable {

  @Override
  public void run() {}
}
