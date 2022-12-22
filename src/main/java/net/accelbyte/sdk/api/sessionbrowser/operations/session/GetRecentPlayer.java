/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetRecentPlayer
 *
 * <p>Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:RECENTPLAYER [READ]
 *
 * <p>Required scope: social
 *
 * <p>Query recent player by user ID
 */
@Getter
@Setter
public class GetRecentPlayer extends Operation {
  /** generated field's value */
  private String path = "/sessionbrowser/namespaces/{namespace}/recentplayer/{userID}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userID;

  /**
   * @param namespace required
   * @param userID required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetRecentPlayer(String namespace, String userID) {
    this.namespace = namespace;
    this.userID = userID;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userID != null) {
      pathParams.put("userID", this.userID);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userID == null) {
      return false;
    }
    return true;
  }

  public ModelsRecentPlayerQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsRecentPlayerQueryResponse().createFromJson(json);
  }
}
