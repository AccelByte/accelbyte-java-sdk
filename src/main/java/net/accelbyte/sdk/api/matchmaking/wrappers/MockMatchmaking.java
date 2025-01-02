/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.operations.mock_matchmaking.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class MockMatchmaking {

  private AccelByteSDK sdk;

  public MockMatchmaking(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CleanAllMocks
   * @deprecated
   */
  @Deprecated
  public void cleanAllMocks(CleanAllMocks input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllMockMatches
   * @deprecated
   */
  @Deprecated
  public ModelsGetMockMatchesResponse getAllMockMatches(GetAllMockMatches input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMockMatchesByTimestamp
   * @deprecated
   */
  @Deprecated
  public ModelsGetMockMatchesResponse getMockMatchesByTimestamp(GetMockMatchesByTimestamp input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllMockTickets
   * @deprecated
   */
  @Deprecated
  public ModelsGetMockTicketsResponse getAllMockTickets(GetAllMockTickets input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateMockTickets
   * @deprecated
   */
  @Deprecated
  public List<ModelsMockTicket> createMockTickets(CreateMockTickets input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkCreateMockTickets
   * @deprecated
   */
  @Deprecated
  public void bulkCreateMockTickets(BulkCreateMockTickets input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMockTicketsByTimestamp
   * @deprecated
   */
  @Deprecated
  public ModelsGetMockTicketsResponse getMockTicketsByTimestamp(GetMockTicketsByTimestamp input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
