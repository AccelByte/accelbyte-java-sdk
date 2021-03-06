/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event_descriptions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class EventDescriptions {

  private AccelByteSDK sdk;

  public EventDescriptions(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AgentTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleAgentType agentTypeDescriptionHandler(AgentTypeDescriptionHandler input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see SpecificAgentTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleAgentType specificAgentTypeDescriptionHandler(
      SpecificAgentTypeDescriptionHandler input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see EventIDDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventID eventIDDescriptionHandler(EventIDDescriptionHandler input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see SpecificEventIDDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventID specificEventIDDescriptionHandler(
      SpecificEventIDDescriptionHandler input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see EventLevelDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventLevel eventLevelDescriptionHandler(EventLevelDescriptionHandler input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see SpecificEventLevelDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventLevel specificEventLevelDescriptionHandler(
      SpecificEventLevelDescriptionHandler input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see EventTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventType eventTypeDescriptionHandler(EventTypeDescriptionHandler input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see SpecificEventTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventType specificEventTypeDescriptionHandler(
      SpecificEventTypeDescriptionHandler input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see UXNameDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleUX uxNameDescriptionHandler(UXNameDescriptionHandler input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see SpecificUXDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleUX specificUXDescriptionHandler(SpecificUXDescriptionHandler input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}
