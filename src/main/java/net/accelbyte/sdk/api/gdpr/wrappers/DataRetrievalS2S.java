/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval_s2s.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DataRetrievalS2S {

  private AccelByteSDK sdk;

  public DataRetrievalS2S(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see S2SGetListFinishedPersonalDataRequest
   */
  public DtoListFinishedDataRequests s2sGetListFinishedPersonalDataRequest(
      S2SGetListFinishedPersonalDataRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see S2SGetDataRequestByRequestID
   */
  public DtoS2SDataRequestSummary s2sGetDataRequestByRequestID(S2SGetDataRequestByRequestID input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see S2SRequestDataRetrieval
   */
  public ModelsS2SDataRetrievalResponse s2sRequestDataRetrieval(S2SRequestDataRetrieval input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see S2SGeneratePersonalDataURL
   */
  public ModelsS2SUserDataURL s2sGeneratePersonalDataURL(S2SGeneratePersonalDataURL input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
