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
import net.accelbyte.sdk.api.legal.operations.agreement.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Agreement {

  private AccelByteSDK sdk;

  public Agreement(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ChangePreferenceConsent
   */
  public void changePreferenceConsent(ChangePreferenceConsent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAcceptedAgreements
   */
  public List<RetrieveAcceptedAgreementResponse> retrieveAcceptedAgreements(
      RetrieveAcceptedAgreements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllUsersByPolicyVersion
   */
  public PagedRetrieveUserAcceptedAgreementResponse retrieveAllUsersByPolicyVersion(
      RetrieveAllUsersByPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ChangePreferenceConsent1
   */
  public void changePreferenceConsent1(ChangePreferenceConsent1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptVersionedPolicy
   */
  public void acceptVersionedPolicy(AcceptVersionedPolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAgreementsPublic
   */
  public List<RetrieveAcceptedAgreementResponse> retrieveAgreementsPublic(
      RetrieveAgreementsPublic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkAcceptVersionedPolicy
   */
  public AcceptAgreementResponse bulkAcceptVersionedPolicy(BulkAcceptVersionedPolicy input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see IndirectBulkAcceptVersionedPolicyV2
   * @deprecated
   */
  @Deprecated
  public AcceptAgreementResponse indirectBulkAcceptVersionedPolicyV2(
      IndirectBulkAcceptVersionedPolicyV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see IndirectBulkAcceptVersionedPolicy1
   */
  public AcceptAgreementResponse indirectBulkAcceptVersionedPolicy1(
      IndirectBulkAcceptVersionedPolicy1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
