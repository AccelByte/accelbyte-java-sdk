/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.wrappers;

import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operations.match_functions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class MatchFunctions {

  private AccelByteSDK sdk;

  public MatchFunctions(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see MatchFunctionList
   */
  public ApiListMatchFunctionsResponse matchFunctionList(MatchFunctionList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateMatchFunction
   */
  public void createMatchFunction(CreateMatchFunction input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMatchFunction
   */
  public ApiMatchFunctionConfig updateMatchFunction(UpdateMatchFunction input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteMatchFunction
   */
  public void deleteMatchFunction(DeleteMatchFunction input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
