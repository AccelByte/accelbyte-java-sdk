/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AgreementWithNamespace {

  private AccelByteSDK sdk;

  public AgreementWithNamespace(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveAcceptedAgreementsForMultiUsers
   */
  public List<UserAgreementsResponse> retrieveAcceptedAgreementsForMultiUsers(
      RetrieveAcceptedAgreementsForMultiUsers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAcceptedAgreements1
   */
  public List<RetrieveAcceptedAgreementResponse> retrieveAcceptedAgreements1(
      RetrieveAcceptedAgreements1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllUsersByPolicyVersion1
   */
  public List<PagedRetrieveUserAcceptedAgreementResponse> retrieveAllUsersByPolicyVersion1(
      RetrieveAllUsersByPolicyVersion1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
