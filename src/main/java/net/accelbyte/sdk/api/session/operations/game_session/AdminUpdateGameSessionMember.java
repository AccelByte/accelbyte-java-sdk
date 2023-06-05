/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminUpdateGameSessionMember
 *
 * <p>Update a game session member status.
 */
@Getter
@Setter
public class AdminUpdateGameSessionMember extends Operation {
  /** generated field's value */
  private String path =
      "/session/v1/admin/namespaces/{namespace}/gamesessions/{sessionId}/members/{memberId}/status/{statusType}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String memberId;

  private String namespace;
  private String sessionId;
  private String statusType;

  /**
   * @param memberId required
   * @param namespace required
   * @param sessionId required
   * @param statusType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateGameSessionMember(
      String memberId, String namespace, String sessionId, String statusType) {
    this.memberId = memberId;
    this.namespace = namespace;
    this.sessionId = sessionId;
    this.statusType = statusType;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.memberId != null) {
      pathParams.put("memberId", this.memberId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.sessionId != null) {
      pathParams.put("sessionId", this.sessionId);
    }
    if (this.statusType != null) {
      pathParams.put("statusType", this.statusType);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.memberId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.sessionId == null) {
      return false;
    }
    if (this.statusType == null) {
      return false;
    }
    return true;
  }

  public ApimodelsUpdateGameSessionMemberStatusResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsUpdateGameSessionMemberStatusResponse().createFromJson(json);
  }
}
