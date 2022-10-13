/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Event {

  private AccelByteSDK sdk;

  public Event(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetEventByNamespaceHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByNamespaceHandler(GetEventByNamespaceHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostEventHandler
   * @deprecated
   */
  @Deprecated
  public void postEventHandler(PostEventHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByEventIDHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByEventIDHandler(GetEventByEventIDHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByEventTypeHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByEventTypeHandler(GetEventByEventTypeHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByEventTypeAndEventIDHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByEventTypeAndEventIDHandler(
      GetEventByEventTypeAndEventIDHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByUserIDHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByUserIDHandler(GetEventByUserIDHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByUserIDAndEventIDHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByUserIDAndEventIDHandler(
      GetEventByUserIDAndEventIDHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByUserIDAndEventTypeHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByUserIDAndEventTypeHandler(
      GetEventByUserIDAndEventTypeHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventByUserEventIDAndEventTypeHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventResponse getEventByUserEventIDAndEventTypeHandler(
      GetEventByUserEventIDAndEventTypeHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
