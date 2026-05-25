/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.session_storage;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicUpdateInsertSessionStorageLeaderV2
 *
 * <p>Update partial Session Storage Leader. Performs selective merge with existing leader storage
 * data.
 *
 * <p>Leader (regular token): Only the session leader can update leader storage. Merges patch with
 * existing data, nil values delete keys. Game Admin (client token): Can update leader storage.
 * Merges patch with existing data, nil values delete keys.
 *
 * <p>Deep merge: Nested objects are recursively merged, not replaced. Absent keys in patch are
 * preserved in storage. Leader storage is separate from per-user storage and identified by session
 * context, not userID. Example patch: { "gameState": {"round": "2"}, "difficulty": null }
 *
 * <p>Session Storage feature only available for Gamesession.
 */
@Getter
@Setter
public class PublicUpdateInsertSessionStorageLeaderV2 extends Operation {
  /** generated field's value */
  private String path =
      "/session/v2/public/namespaces/{namespace}/sessions/{sessionId}/storage/leader";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String sessionId;
  private Map<String, ?> body;

  /**
   * @param namespace required
   * @param sessionId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpdateInsertSessionStorageLeaderV2(
      String namespace, String sessionId, Map<String, ?> body) {
    this.namespace = namespace;
    this.sessionId = sessionId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.sessionId != null) {
      pathParams.put("sessionId", this.sessionId);
    }
    return pathParams;
  }

  @Override
  public Map<String, ?> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sessionId == null) {
      return false;
    }
    return true;
  }

  public Map<String, ?> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
  }
}
