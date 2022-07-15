/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event_registry;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.models.ModelsEventRegistry;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetRegisteredEventIDHandler
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:EVENT [READ]`and scope `analytics`
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetRegisteredEventIDHandler extends Operation {
  /** generated field's value */
  private String path = "/event/registry/eventIds/{eventId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String eventId;

  /**
   * @param eventId required
   */
  @Builder
  public GetRegisteredEventIDHandler(String eventId) {
    this.eventId = eventId;

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
  public boolean isValid() {
    if (this.eventId == null) {
      return false;
    }
    return true;
  }

  public ModelsEventRegistry parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsEventRegistry().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
