/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.fulfillment_script.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class FulfillmentScript {

  private AccelByteSDK sdk;

  public FulfillmentScript(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ListFulfillmentScripts
   */
  public List<FulfillmentScriptInfo> listFulfillmentScripts(ListFulfillmentScripts input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetFulfillmentScript
   */
  public FulfillmentScriptInfo getFulfillmentScript(GetFulfillmentScript input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateFulfillmentScript
   */
  public FulfillmentScriptInfo createFulfillmentScript(CreateFulfillmentScript input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteFulfillmentScript
   */
  public void deleteFulfillmentScript(DeleteFulfillmentScript input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateFulfillmentScript
   */
  public FulfillmentScriptInfo updateFulfillmentScript(UpdateFulfillmentScript input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
