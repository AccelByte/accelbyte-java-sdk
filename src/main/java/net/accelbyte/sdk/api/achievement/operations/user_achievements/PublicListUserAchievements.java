/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.user_achievements;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicListUserAchievements
 *
 * <p>Required permission `NAMESPACE:{namespace}:USER:{userId}:ACHIEVEMENT [READ]` and scope
 * `social`
 *
 * <p>Note:
 *
 * <p>User Achievement status value mean: `status = 1 (in progress)` and `status = 2 (unlocked)`
 *
 * <p>`achievedAt` value will return default value: `0001-01-01T00:00:00Z` for user achievement that
 * locked or in progress
 */
@Getter
@Setter
public class PublicListUserAchievements extends Operation {
  /** generated field's value */
  private String path = "/achievement/v1/public/namespaces/{namespace}/users/{userId}/achievements";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Integer limit;
  private Integer offset;
  private Boolean preferUnlocked;
  private String sortBy;
  private List<String> tags;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicListUserAchievements(
      String namespace,
      String userId,
      Integer limit,
      Integer offset,
      Boolean preferUnlocked,
      String sortBy,
      List<String> tags) {
    this.namespace = namespace;
    this.userId = userId;
    this.limit = limit;
    this.offset = offset;
    this.preferUnlocked = preferUnlocked;
    this.sortBy = sortBy;
    this.tags = tags;

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
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "preferUnlocked",
        this.preferUnlocked == null ? null : Arrays.asList(String.valueOf(this.preferUnlocked)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put("tags", this.tags == null ? null : this.tags);
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

  public ModelsPaginatedUserAchievementResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPaginatedUserAchievementResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("preferUnlocked", "None");
    result.put("sortBy", "None");
    result.put("tags", "csv");
    return result;
  }
}
