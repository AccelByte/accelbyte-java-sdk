/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_deletion_s2s.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DataDeletionS2S {

  private AccelByteSDK sdk;

  public DataDeletionS2S(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see S2SGetListFinishedAccountDeletionRequest
   */
  public DtoListFinishedDataDeletion s2sGetListFinishedAccountDeletionRequest(
      S2SGetListFinishedAccountDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see S2SSubmitUserAccountDeletionRequest
   */
  public ModelsS2SRequestDeleteResponse s2sSubmitUserAccountDeletionRequest(
      S2SSubmitUserAccountDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
