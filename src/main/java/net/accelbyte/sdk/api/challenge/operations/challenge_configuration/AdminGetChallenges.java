/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.challenge_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminGetChallenges
 *
 * <p>- Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [READ]
 */
@Getter
@Setter
public class AdminGetChallenges extends Operation {
  /** generated field's value */
  private String path = "/challenge/v1/admin/namespaces/{namespace}/challenges";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String keyword;
  private Integer limit;
  private Integer offset;
  private String sortBy;
  private String status;
  private List<String> tags;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetChallenges(
      String namespace,
      String keyword,
      Integer limit,
      Integer offset,
      String sortBy,
      String status,
      List<String> tags) {
    this.namespace = namespace;
    this.keyword = keyword;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;
    this.status = status;
    this.tags = tags;

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
    queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put(
        "tags",
        this.tags == null
            ? null
            : this.tags.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelListChallengeResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelListChallengeResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("keyword", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("status", "None");
    result.put("tags", "csv");
    return result;
  }

  public enum SortBy {
    Codeasc("code:asc"),
    Codedesc("code:desc"),
    CreatedAt("createdAt"),
    CreatedAtasc("createdAt:asc"),
    CreatedAtdesc("createdAt:desc"),
    Nameasc("name:asc"),
    Namedesc("name:desc"),
    UpdatedAt("updatedAt"),
    UpdatedAtasc("updatedAt:asc"),
    UpdatedAtdesc("updatedAt:desc");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    INIT("INIT"),
    RETIRED("RETIRED"),
    TIED("TIED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminGetChallengesBuilder {
    private String sortBy;
    private String status;

    public AdminGetChallengesBuilder sortBy(final String sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public AdminGetChallengesBuilder sortByFromEnum(final SortBy sortBy) {
      this.sortBy = sortBy.toString();
      return this;
    }

    public AdminGetChallengesBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public AdminGetChallengesBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
