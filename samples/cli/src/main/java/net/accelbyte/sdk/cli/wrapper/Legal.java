/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.legal.admin_user_agreement.*;
import net.accelbyte.sdk.cli.api.legal.admin_user_eligibilities.*;
import net.accelbyte.sdk.cli.api.legal.agreement.*;
import net.accelbyte.sdk.cli.api.legal.agreement_with_namespace.*;
import net.accelbyte.sdk.cli.api.legal.anonymization.*;
import net.accelbyte.sdk.cli.api.legal.base_legal_policies.*;
import net.accelbyte.sdk.cli.api.legal.base_legal_policies_with_namespace.*;
import net.accelbyte.sdk.cli.api.legal.eligibilities.*;
import net.accelbyte.sdk.cli.api.legal.localized_policy_versions.*;
import net.accelbyte.sdk.cli.api.legal.localized_policy_versions_with_namespace.*;
import net.accelbyte.sdk.cli.api.legal.policies.*;
import net.accelbyte.sdk.cli.api.legal.policies_with_namespace.*;
import net.accelbyte.sdk.cli.api.legal.policies_with_namespace_v2.*;
import net.accelbyte.sdk.cli.api.legal.policy_versions.*;
import net.accelbyte.sdk.cli.api.legal.policy_versions_with_namespace.*;
import net.accelbyte.sdk.cli.api.legal.user_info.*;
import net.accelbyte.sdk.cli.api.legal.utility.*;
import picocli.CommandLine.Command;

@Command(
    name = "legal",
    mixinStandardHelpOptions = true,
    subcommands = {
      ChangePreferenceConsent.class,
      OldRetrieveAcceptedAgreements.class,
      OldRetrieveAllUsersByPolicyVersion.class,
      RetrieveAllLegalPolicies.class,
      OldCreatePolicy.class,
      OldRetrieveSinglePolicy.class,
      OldPartialUpdatePolicy.class,
      OldRetrievePolicyCountry.class,
      OldRetrieveLocalizedPolicyVersions.class,
      OldCreateLocalizedPolicyVersion.class,
      OldRetrieveSingleLocalizedPolicyVersion.class,
      OldUpdateLocalizedPolicyVersion.class,
      OldRequestPresignedURL.class,
      OldSetDefaultLocalizedPolicy.class,
      RetrieveAcceptedAgreementsForMultiUsers.class,
      RetrieveAcceptedAgreements.class,
      RetrieveAllUsersByPolicyVersion.class,
      DownloadExportedAgreementsInCSV.class,
      InitiateExportAgreementsToCSV.class,
      RetrieveAllLegalPoliciesByNamespace.class,
      CreatePolicy.class,
      RetrieveSinglePolicy.class,
      DeleteBasePolicy.class,
      PartialUpdatePolicy.class,
      RetrievePolicyCountry.class,
      RetrieveAllPoliciesFromBasePolicy.class,
      CreatePolicyUnderBasePolicy.class,
      DeleteLocalizedPolicy.class,
      RetrieveLocalizedPolicyVersions.class,
      CreateLocalizedPolicyVersion.class,
      RetrieveSingleLocalizedPolicyVersion.class,
      UpdateLocalizedPolicyVersion.class,
      RequestPresignedURL.class,
      SetDefaultLocalizedPolicy.class,
      DeletePolicyVersion.class,
      UpdatePolicyVersion.class,
      PublishPolicyVersion.class,
      UnpublishPolicyVersion.class,
      DeletePolicy.class,
      UpdatePolicy.class,
      SetDefaultPolicy.class,
      RetrieveSinglePolicyVersion.class,
      CreatePolicyVersion.class,
      RetrieveAllPolicyTypes.class,
      IndirectBulkAcceptVersionedPolicy.class,
      AdminRetrieveEligibilities.class,
      RetrievePolicies.class,
      OldUpdatePolicyVersion.class,
      OldPublishPolicyVersion.class,
      OldUpdatePolicy.class,
      OldSetDefaultPolicy.class,
      OldRetrieveSinglePolicyVersion.class,
      OldCreatePolicyVersion.class,
      OldRetrieveAllPolicyTypes.class,
      GetUserInfoStatus.class,
      SyncUserInfo.class,
      InvalidateUserInfoCache.class,
      AnonymizeUserAgreement.class,
      PublicChangePreferenceConsent.class,
      AcceptVersionedPolicy.class,
      RetrieveAgreementsPublic.class,
      BulkAcceptVersionedPolicy.class,
      IndirectBulkAcceptVersionedPolicyV2.class,
      PublicIndirectBulkAcceptVersionedPolicy.class,
      RetrieveEligibilitiesPublic.class,
      RetrieveEligibilitiesPublicIndirect.class,
      OldPublicRetrieveSingleLocalizedPolicyVersion.class,
      PublicRetrieveSingleLocalizedPolicyVersion.class,
      RetrieveCountryListWithPolicies.class,
      RetrieveLatestPolicies.class,
      RetrieveLatestPoliciesPublic.class,
      OldRetrieveLatestPoliciesByNamespaceAndCountryPublic.class,
      CheckReadiness.class,
      RetrieveLatestPoliciesByNamespaceAndCountryPublic.class,
    })
public class Legal implements Runnable {

  @Override
  public void run() {}
}
