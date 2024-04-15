/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.wrappers;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GameSessionDetail {

  private AccelByteSDK sdk;

  public GameSessionDetail(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminQueryGameSessionDetail
   */
  public ApimodelsGameSessionDetailQueryResponse adminQueryGameSessionDetail(
      AdminQueryGameSessionDetail input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameSessionDetail
   */
  public ApimodelsGameSessionDetail getGameSessionDetail(GetGameSessionDetail input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryMatchmakingDetail
   */
  public ApimodelsMatchmakingDetailQueryResponse adminQueryMatchmakingDetail(
      AdminQueryMatchmakingDetail input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMatchmakingDetailBySessionID
   */
  public ApimodelsMatchmakingDetail adminGetMatchmakingDetailBySessionID(
      AdminGetMatchmakingDetailBySessionID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMatchmakingDetailByTicketID
   */
  public ApimodelsMatchmakingDetail adminGetMatchmakingDetailByTicketID(
      AdminGetMatchmakingDetailByTicketID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryPartyDetail
   */
  public ApimodelsPartyDetailQueryResponse adminQueryPartyDetail(AdminQueryPartyDetail input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPartyDetail
   */
  public ApimodelsPartyDetail getPartyDetail(GetPartyDetail input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryTicketDetail
   */
  public ApimodelsTicketDetailQueryResponse adminQueryTicketDetail(AdminQueryTicketDetail input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTicketDetailGetByTicketID
   */
  public ApimodelsTicketObservabilityDetail adminTicketDetailGetByTicketID(
      AdminTicketDetailGetByTicketID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
