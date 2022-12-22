/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event_registry;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UpdateEventRegistryHandler
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:EVENT [UPDATE]`and scope `analytics`
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class UpdateEventRegistryHandler extends Operation {
  /** generated field's value */
  private String path = "/event/registry/eventIds/{eventId}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String eventId;

  private ModelsEventRegistry body;

  /**
   * @param eventId required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateEventRegistryHandler(String eventId, ModelsEventRegistry body) {
    this.eventId = eventId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.eventId != null) {
      pathParams.put("eventId", this.eventId);
    }
    return pathParams;
  }

  @Override
  public ModelsEventRegistry getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.eventId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
