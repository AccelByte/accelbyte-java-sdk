/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event_v2.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class EventV2 {

  private AccelByteSDK sdk;

  public EventV2(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryEventStreamHandler
   */
  public ModelsEventResponseV2 queryEventStreamHandler(QueryEventStreamHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventSpecificUserV2Handler
   */
  public ModelsEventResponseV2 getEventSpecificUserV2Handler(GetEventSpecificUserV2Handler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPublicEditHistory
   */
  public ModelsEventResponseV2 getPublicEditHistory(GetPublicEditHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEventsV2Public
   */
  public ModelsEventResponseV2 getUserEventsV2Public(GetUserEventsV2Public input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
