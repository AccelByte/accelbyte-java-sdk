/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.user_information.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserInformation {

  private AccelByteSDK sdk;

  public UserInformation(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserActivitiesHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getUserActivitiesHandler(GetUserActivitiesHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserActivitiesHandler
   * @deprecated
   */
  @Deprecated
  public void deleteUserActivitiesHandler(DeleteUserActivitiesHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LastUserActivityTimeHandler
   * @deprecated
   */
  @Deprecated
  public ModelsUserLastActivity lastUserActivityTimeHandler(LastUserActivityTimeHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
