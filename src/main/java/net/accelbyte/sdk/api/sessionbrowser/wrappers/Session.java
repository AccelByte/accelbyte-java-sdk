/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Session {

  private AccelByteSDK sdk;

  public Session(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminQuerySession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionQueryResponse adminQuerySession(AdminQuerySession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTotalActiveSession
   * @deprecated
   */
  @Deprecated
  public ModelsCountActiveSessionResponse getTotalActiveSession(GetTotalActiveSession input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetActiveCustomGameSessions
   * @deprecated
   */
  @Deprecated
  public ModelsActiveCustomGameResponse getActiveCustomGameSessions(
      GetActiveCustomGameSessions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetActiveMatchmakingGameSessions
   * @deprecated
   */
  @Deprecated
  public ModelsActiveMatchmakingGameResponse getActiveMatchmakingGameSessions(
      GetActiveMatchmakingGameSessions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetSession
   * @deprecated
   */
  @Deprecated
  public ModelsAdminSessionResponse adminGetSession(AdminGetSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteSession
   * @deprecated
   */
  @Deprecated
  public ModelsAdminSessionResponse adminDeleteSession(AdminDeleteSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSearchSessionsV2
   * @deprecated
   */
  @Deprecated
  public ModelsGetSessionHistorySearchResponseV2 adminSearchSessionsV2(AdminSearchSessionsV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSessionHistoryDetailed
   * @deprecated
   */
  @Deprecated
  public List<ModelsGetSessionHistoryDetailedResponseItem> getSessionHistoryDetailed(
      GetSessionHistoryDetailed input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserQuerySession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionQueryResponse userQuerySession(UserQuerySession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateSession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse createSession(CreateSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSessionByUserIDs
   * @deprecated
   */
  @Deprecated
  public ModelsSessionByUserIDsResponse getSessionByUserIDs(GetSessionByUserIDs input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse getSession(GetSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse updateSession(UpdateSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse deleteSession(DeleteSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see JoinSession
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse joinSession(JoinSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSessionLocalDS
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse deleteSessionLocalDS(DeleteSessionLocalDS input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddPlayerToSession
   * @deprecated
   */
  @Deprecated
  public ModelsAddPlayerResponse addPlayerToSession(AddPlayerToSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RemovePlayerFromSession
   * @deprecated
   */
  @Deprecated
  public ModelsAddPlayerResponse removePlayerFromSession(RemovePlayerFromSession input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSettings
   * @deprecated
   */
  @Deprecated
  public ModelsSessionResponse updateSettings(UpdateSettings input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRecentPlayer
   * @deprecated
   */
  @Deprecated
  public ModelsRecentPlayerQueryResponse getRecentPlayer(GetRecentPlayer input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
