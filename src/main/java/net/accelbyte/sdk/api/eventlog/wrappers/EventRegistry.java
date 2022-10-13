/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event_registry.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class EventRegistry {

  private AccelByteSDK sdk;

  public EventRegistry(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetRegisteredEventsHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventRegistry getRegisteredEventsHandler(GetRegisteredEventsHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RegisterEventHandler
   * @deprecated
   */
  @Deprecated
  public void registerEventHandler(RegisterEventHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRegisteredEventIDHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventRegistry getRegisteredEventIDHandler(GetRegisteredEventIDHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateEventRegistryHandler
   * @deprecated
   */
  @Deprecated
  public void updateEventRegistryHandler(UpdateEventRegistryHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UnregisterEventIDHandler
   * @deprecated
   */
  @Deprecated
  public void unregisterEventIDHandler(UnregisterEventIDHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRegisteredEventsByEventTypeHandler
   * @deprecated
   */
  @Deprecated
  public ModelsEventRegistry getRegisteredEventsByEventTypeHandler(
      GetRegisteredEventsByEventTypeHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
