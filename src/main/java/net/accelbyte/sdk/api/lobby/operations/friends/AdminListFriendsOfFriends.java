/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.friends;

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
 * adminListFriendsOfFriends
 *
 * <p>Load list friends and friends of friends in a namespace. Response subjectId will be different
 * with requested userId if the user is not directly friend
 */
@Getter
@Setter
public class AdminListFriendsOfFriends extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/admin/friend/namespaces/{namespace}/users/{userId}/of-friends";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String friendId;
  private Integer limit;
  private Boolean nopaging;
  private Integer offset;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminListFriendsOfFriends(
      String namespace,
      String userId,
      String friendId,
      Integer limit,
      Boolean nopaging,
      Integer offset) {
    this.namespace = namespace;
    this.userId = userId;
    this.friendId = friendId;
    this.limit = limit;
    this.nopaging = nopaging;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("friendId", this.friendId == null ? null : Arrays.asList(this.friendId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "nopaging", this.nopaging == null ? null : Arrays.asList(String.valueOf(this.nopaging)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelFriendshipConnectionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelFriendshipConnectionResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("friendId", "None");
    result.put("limit", "None");
    result.put("nopaging", "None");
    result.put("offset", "None");
    return result;
  }
}
