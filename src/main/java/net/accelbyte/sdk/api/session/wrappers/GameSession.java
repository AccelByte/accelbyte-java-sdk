/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.game_session.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GameSession {

  private AccelByteSDK sdk;

  public GameSession(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminQueryGameSessions
   */
  public ApimodelsGameSessionQueryResponse adminQueryGameSessions(AdminQueryGameSessions input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateGameSessionMember
   */
  public ApimodelsUpdateGameSessionMemberStatusResponse adminUpdateGameSessionMember(
      AdminUpdateGameSessionMember input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateGameSession
   */
  public ApimodelsGameSessionResponse createGameSession(CreateGameSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryGameSessions
   */
  public ApimodelsGameSessionQueryResponse publicQueryGameSessions(PublicQueryGameSessions input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameSessionByPodName
   */
  public ApimodelsGameSessionResponse getGameSessionByPodName(GetGameSessionByPodName input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameSession
   */
  public ApimodelsGameSessionResponse getGameSession(GetGameSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGameSession
   */
  public ApimodelsGameSessionResponse updateGameSession(UpdateGameSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGameSession
   */
  public void deleteGameSession(DeleteGameSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PatchUpdateGameSession
   */
  public ApimodelsGameSessionResponse patchUpdateGameSession(PatchUpdateGameSession input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGameSessionInvite
   */
  public void publicGameSessionInvite(PublicGameSessionInvite input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see JoinGameSession
   */
  public ApimodelsGameSessionResponse joinGameSession(JoinGameSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LeaveGameSession
   */
  public ApimodelsGameSessionResponse leaveGameSession(LeaveGameSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGameSessionReject
   */
  public void publicGameSessionReject(PublicGameSessionReject input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryMyGameSessions
   */
  public List<ApimodelsGameSessionResponse> publicQueryMyGameSessions(
      PublicQueryMyGameSessions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}