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
import net.accelbyte.sdk.api.legal.operations.user_info.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserInfo {

  private AccelByteSDK sdk;

  public UserInfo(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserInfoStatus
   */
  public List<RetrieveUserInfoCacheStatusResponse> getUserInfoStatus(GetUserInfoStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncUserInfo
   * @deprecated
   */
  @Deprecated
  public void syncUserInfo(SyncUserInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InvalidateUserInfoCache
   * @deprecated
   */
  @Deprecated
  public void invalidateUserInfoCache(InvalidateUserInfoCache input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
