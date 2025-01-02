/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Matchmaking {

  private AccelByteSDK sdk;

  public Matchmaking(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetAllChannelsHandler
   * @deprecated
   */
  @Deprecated
  public ModelsGetChannelsResponse getAllChannelsHandler(GetAllChannelsHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateChannelHandler
   * @deprecated
   */
  @Deprecated
  public ModelsCreateChannelResponse createChannelHandler(CreateChannelHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMatchPoolMetric
   * @deprecated
   */
  @Deprecated
  public ModelsTicketMetricResultRecord getMatchPoolMetric(GetMatchPoolMetric input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteChannelHandler
   * @deprecated
   */
  @Deprecated
  public void deleteChannelHandler(DeleteChannelHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StoreMatchResults
   * @deprecated
   */
  @Deprecated
  public ModelsMatchResultResponse storeMatchResults(StoreMatchResults input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see Rebalance
   * @deprecated
   */
  @Deprecated
  public ModelsRebalanceResponse rebalance(Rebalance input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueueSessionHandler
   * @deprecated
   */
  @Deprecated
  public void queueSessionHandler(QueueSessionHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DequeueSessionHandler
   * @deprecated
   */
  @Deprecated
  public void dequeueSessionHandler(DequeueSessionHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QuerySessionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMatchmakingResult querySessionHandler(QuerySessionHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllPartyInAllChannel
   * @deprecated
   */
  @Deprecated
  public Map<String, List<ModelsMatchingParty>> getAllPartyInAllChannel(
      GetAllPartyInAllChannel input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetSessions
   * @deprecated
   */
  @Deprecated
  public List<ModelsMatchmakingResult> bulkGetSessions(BulkGetSessions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ExportChannels
   * @deprecated
   */
  @Deprecated
  public InputStream exportChannels(ExportChannels input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ImportChannels
   * @deprecated
   */
  @Deprecated
  public ModelsImportConfigResponse importChannels(ImportChannels input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSingleMatchmakingChannel
   * @deprecated
   */
  @Deprecated
  public ModelsChannelV1 getSingleMatchmakingChannel(GetSingleMatchmakingChannel input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMatchmakingChannel
   * @deprecated
   */
  @Deprecated
  public void updateMatchmakingChannel(UpdateMatchmakingChannel input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllPartyInChannel
   * @deprecated
   */
  @Deprecated
  public List<ModelsMatchingParty> getAllPartyInChannel(GetAllPartyInChannel input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllSessionsInChannel
   * @deprecated
   */
  @Deprecated
  public List<ModelsMatchmakingResult> getAllSessionsInChannel(GetAllSessionsInChannel input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddUserIntoSessionInChannel
   * @deprecated
   */
  @Deprecated
  public void addUserIntoSessionInChannel(AddUserIntoSessionInChannel input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSessionInChannel
   * @deprecated
   */
  @Deprecated
  public void deleteSessionInChannel(DeleteSessionInChannel input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserFromSessionInChannel
   * @deprecated
   */
  @Deprecated
  public void deleteUserFromSessionInChannel(DeleteUserFromSessionInChannel input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetStatData
   * @deprecated
   */
  @Deprecated
  public ModelsStatResumeResponse getStatData(GetStatData input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SearchSessions
   * @deprecated
   */
  @Deprecated
  public ServiceGetSessionHistorySearchResponse searchSessions(SearchSessions input)
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
  public List<ServiceGetSessionHistoryDetailedResponseItem> getSessionHistoryDetailed(
      GetSessionHistoryDetailed input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetAllMatchmakingChannel
   * @deprecated
   */
  @Deprecated
  public List<ModelsChannelV1> publicGetAllMatchmakingChannel(PublicGetAllMatchmakingChannel input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetSingleMatchmakingChannel
   * @deprecated
   */
  @Deprecated
  public ModelsChannelV1 publicGetSingleMatchmakingChannel(PublicGetSingleMatchmakingChannel input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SearchSessionsV2
   * @deprecated
   */
  @Deprecated
  public ServiceGetSessionHistorySearchResponseV2 searchSessionsV2(SearchSessionsV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
