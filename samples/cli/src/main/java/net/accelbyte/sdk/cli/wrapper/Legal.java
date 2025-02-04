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
      RetrieveAcceptedAgreements.class,
      RetrieveAllUsersByPolicyVersion.class,
      RetrieveAllLegalPolicies.class,
      CreatePolicy.class,
      RetrieveSinglePolicy.class,
      PartialUpdatePolicy.class,
      RetrievePolicyCountry.class,
      RetrieveLocalizedPolicyVersions.class,
      CreateLocalizedPolicyVersion.class,
      RetrieveSingleLocalizedPolicyVersion.class,
      UpdateLocalizedPolicyVersion.class,
      RequestPresignedURL.class,
      SetDefaultPolicy.class,
      RetrieveAcceptedAgreementsForMultiUsers.class,
      RetrieveAcceptedAgreements1.class,
      RetrieveAllUsersByPolicyVersion1.class,
      DownloadExportedAgreementsInCSV.class,
      InitiateExportAgreementsToCSV.class,
      RetrieveAllLegalPoliciesByNamespace.class,
      CreatePolicy1.class,
      RetrieveSinglePolicy1.class,
      DeleteBasePolicy.class,
      PartialUpdatePolicy1.class,
      RetrievePolicyCountry1.class,
      RetrieveAllPoliciesFromBasePolicy.class,
      CreatePolicyUnderBasePolicy.class,
      DeleteLocalizedPolicy.class,
      RetrieveLocalizedPolicyVersions1.class,
      CreateLocalizedPolicyVersion1.class,
      RetrieveSingleLocalizedPolicyVersion1.class,
      UpdateLocalizedPolicyVersion1.class,
      RequestPresignedURL1.class,
      SetDefaultPolicy1.class,
      DeletePolicyVersion.class,
      UpdatePolicyVersion1.class,
      PublishPolicyVersion1.class,
      UnpublishPolicyVersion.class,
      DeletePolicy.class,
      UpdatePolicy1.class,
      SetDefaultPolicy3.class,
      RetrieveSinglePolicyVersion1.class,
      CreatePolicyVersion1.class,
      RetrieveAllPolicyTypes1.class,
      IndirectBulkAcceptVersionedPolicy.class,
      AdminRetrieveEligibilities.class,
      RetrievePolicies.class,
      UpdatePolicyVersion.class,
      PublishPolicyVersion.class,
      UpdatePolicy.class,
      SetDefaultPolicy2.class,
      RetrieveSinglePolicyVersion.class,
      CreatePolicyVersion.class,
      RetrieveAllPolicyTypes.class,
      GetUserInfoStatus.class,
      SyncUserInfo.class,
      InvalidateUserInfoCache.class,
      AnonymizeUserAgreement.class,
      ChangePreferenceConsent1.class,
      AcceptVersionedPolicy.class,
      RetrieveAgreementsPublic.class,
      BulkAcceptVersionedPolicy.class,
      IndirectBulkAcceptVersionedPolicyV2.class,
      IndirectBulkAcceptVersionedPolicy1.class,
      RetrieveEligibilitiesPublic.class,
      RetrieveEligibilitiesPublicIndirect.class,
      RetrieveSingleLocalizedPolicyVersion2.class,
      RetrieveSingleLocalizedPolicyVersion3.class,
      RetrieveCountryListWithPolicies.class,
      RetrieveLatestPolicies.class,
      RetrieveLatestPoliciesPublic.class,
      RetrieveLatestPoliciesByNamespaceAndCountryPublic.class,
      CheckReadiness.class,
      RetrieveLatestPoliciesByNamespaceAndCountryPublic1.class,
    })
public class Legal implements Runnable {

  @Override
  public void run() {}
}
