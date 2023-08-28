/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.session.operations.session_storage.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class SessionStorage {

  private AccelByteSDK sdk;

  public SessionStorage(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminReadSessionStorage
   */
  public Map<String, ?> adminReadSessionStorage(AdminReadSessionStorage input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserSessionStorage
   */
  public void adminDeleteUserSessionStorage(AdminDeleteUserSessionStorage input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminReadUserSessionStorage
   */
  public Map<String, ?> adminReadUserSessionStorage(AdminReadUserSessionStorage input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateInsertSessionStorageLeader
   */
  public Map<String, ?> publicUpdateInsertSessionStorageLeader(
      PublicUpdateInsertSessionStorageLeader input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateInsertSessionStorage
   */
  public Map<String, ?> publicUpdateInsertSessionStorage(PublicUpdateInsertSessionStorage input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
