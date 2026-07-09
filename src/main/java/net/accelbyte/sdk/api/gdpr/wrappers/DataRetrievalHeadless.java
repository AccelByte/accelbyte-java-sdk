/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval_headless.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DataRetrievalHeadless {

  private AccelByteSDK sdk;

  public DataRetrievalHeadless(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicSubmitMyHeadlessPersonalDataRequest
   */
  public ModelsDataRetrievalResponse publicSubmitMyHeadlessPersonalDataRequest(
      PublicSubmitMyHeadlessPersonalDataRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateMyHeadlessPersonalDataURL
   */
  public ModelsUserDataURL publicGenerateMyHeadlessPersonalDataURL(
      PublicGenerateMyHeadlessPersonalDataURL input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyPersonalDataRequests
   */
  public ModelsUserPersonalDataResponse publicGetMyPersonalDataRequests(
      PublicGetMyPersonalDataRequests input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSubmitMyPersonalDataRequest
   */
  public ModelsDataRetrievalResponse publicSubmitMyPersonalDataRequest(
      PublicSubmitMyPersonalDataRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCancelMyPersonalDataRequest
   */
  public void publicCancelMyPersonalDataRequest(PublicCancelMyPersonalDataRequest input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
