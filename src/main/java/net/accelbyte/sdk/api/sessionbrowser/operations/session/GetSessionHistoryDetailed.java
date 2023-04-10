/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * GetSessionHistoryDetailed
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [Read]
 *
 * <p>Required Scope: social
 *
 * <p>Get session history detailed.
 *
 * <p>if party_id value empty/null, field will not show in response body.
 */
@Getter
@Setter
public class GetSessionHistoryDetailed extends Operation {
  /** generated field's value */
  private String path =
      "/sessionbrowser/admin/namespaces/{namespace}/sessions/{matchID}/history/detailed";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String matchID;

  private String namespace;

  /**
   * @param matchID required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSessionHistoryDetailed(String matchID, String namespace) {
    this.matchID = matchID;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.matchID != null) {
      pathParams.put("matchID", this.matchID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.matchID == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<ModelsGetSessionHistoryDetailedResponseItem> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsGetSessionHistoryDetailedResponseItem>>() {});
  }
}
