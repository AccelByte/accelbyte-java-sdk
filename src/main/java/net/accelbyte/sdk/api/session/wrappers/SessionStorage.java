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
   * @see AdminReadPartySessionStorage
   */
  public Map<String, ?> adminReadPartySessionStorage(AdminReadPartySessionStorage input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
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
   * @see PublicReadPartySessionStorage
   */
  public Map<String, ?> publicReadPartySessionStorage(PublicReadPartySessionStorage input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateInsertPartySessionStorage
   */
  public Map<String, ?> publicUpdateInsertPartySessionStorage(
      PublicUpdateInsertPartySessionStorage input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateInsertPartySessionStorageReserved
   */
  public Map<String, ?> publicUpdateInsertPartySessionStorageReserved(
      PublicUpdateInsertPartySessionStorageReserved input) throws Exception {
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

  /**
   * @see PublicReplaceSessionStorageLeaderV2
   */
  public Map<String, ?> publicReplaceSessionStorageLeaderV2(
      PublicReplaceSessionStorageLeaderV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateInsertSessionStorageLeaderV2
   */
  public Map<String, ?> publicUpdateInsertSessionStorageLeaderV2(
      PublicUpdateInsertSessionStorageLeaderV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicReplaceSessionStorageUserV2
   */
  public Map<String, ?> publicReplaceSessionStorageUserV2(PublicReplaceSessionStorageUserV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateInsertSessionStorageUserV2
   */
  public Map<String, ?> publicUpdateInsertSessionStorageUserV2(
      PublicUpdateInsertSessionStorageUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
