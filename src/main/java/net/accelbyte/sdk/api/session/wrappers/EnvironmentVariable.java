/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.environment_variable.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class EnvironmentVariable {

  private AccelByteSDK sdk;

  public EnvironmentVariable(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListEnvironmentVariables
   */
  public ApimodelsEnvironmentVariableListResponse adminListEnvironmentVariables(
      AdminListEnvironmentVariables input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
