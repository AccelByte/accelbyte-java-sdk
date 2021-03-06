/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.presence;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UsersPresenceHandlerV1
 *
 * <p>Query users presence with given namespace and userIds.
 */
@Getter
@Setter
public class UsersPresenceHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/public/presence/namespaces/{namespace}/users/presence";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private Boolean countOnly;
  private String userIds;

  /**
   * @param namespace required
   * @param userIds required
   */
  @Builder
  public UsersPresenceHandlerV1(String namespace, Boolean countOnly, String userIds) {
    this.namespace = namespace;
    this.countOnly = countOnly;
    this.userIds = userIds;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "countOnly", this.countOnly == null ? null : Arrays.asList(String.valueOf(this.countOnly)));
    queryParams.put("userIds", this.userIds == null ? null : Arrays.asList(this.userIds));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userIds == null) {
      return false;
    }
    return true;
  }

  public HandlersGetUsersPresenceResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new HandlersGetUsersPresenceResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("countOnly", "None");
    result.put("userIds", "None");
    return result;
  }
}
