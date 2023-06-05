/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.global_achievements;

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
 * AdminListGlobalAchievementContributors
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [READ]` and scope `social`
 */
@Getter
@Setter
public class AdminListGlobalAchievementContributors extends Operation {
  /** generated field's value */
  private String path =
      "/achievement/v1/admin/namespaces/{namespace}/global/achievements/{achievementCode}/contributors";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String achievementCode;

  private String namespace;
  private Integer limit;
  private Integer offset;
  private String sortBy;

  /**
   * @param achievementCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminListGlobalAchievementContributors(
      String achievementCode, String namespace, Integer limit, Integer offset, String sortBy) {
    this.achievementCode = achievementCode;
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.achievementCode != null) {
      pathParams.put("achievementCode", this.achievementCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.achievementCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsPaginatedContributorResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPaginatedContributorResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    return result;
  }
}
