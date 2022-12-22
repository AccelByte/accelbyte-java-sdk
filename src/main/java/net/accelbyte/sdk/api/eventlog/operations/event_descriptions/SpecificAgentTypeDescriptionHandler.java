/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event_descriptions;

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
 * SpecificAgentTypeDescriptionHandler
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SpecificAgentTypeDescriptionHandler extends Operation {
  /** generated field's value */
  private String path = "/event/descriptions/agentType/listByAgentTypes";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String agentTypes;

  /** */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SpecificAgentTypeDescriptionHandler(String agentTypes) {
    this.agentTypes = agentTypes;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("agentTypes", this.agentTypes == null ? null : Arrays.asList(this.agentTypes));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelsMultipleAgentType parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsMultipleAgentType().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("agentTypes", "None");
    return result;
  }
}
