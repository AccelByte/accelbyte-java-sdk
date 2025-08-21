/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.development;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DevelopmentServerConfigurationList
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA:FLEET [READ]
 */
@Getter
@Setter
public class DevelopmentServerConfigurationList extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/development/server-configurations";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Integer count;
  private String imageId;
  private String name;
  private Integer offset;
  private String sortBy;
  private String sortDirection;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DevelopmentServerConfigurationList(
      String namespace,
      Integer count,
      String imageId,
      String name,
      Integer offset,
      String sortBy,
      String sortDirection) {
    this.namespace = namespace;
    this.count = count;
    this.imageId = imageId;
    this.name = name;
    this.offset = offset;
    this.sortBy = sortBy;
    this.sortDirection = sortDirection;

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
    queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
    queryParams.put("imageId", this.imageId == null ? null : Arrays.asList(this.imageId));
    queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put(
        "sortDirection", this.sortDirection == null ? null : Arrays.asList(this.sortDirection));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApiDevelopmentServerConfigurationListResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiDevelopmentServerConfigurationListResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("count", "None");
    result.put("imageId", "None");
    result.put("name", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("sortDirection", "None");
    return result;
  }

  public enum SortBy {
    CreatedAt("created_at"),
    ExpiresAt("expires_at"),
    Name("name");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SortDirection {
    Asc("asc"),
    Desc("desc");

    private String value;

    SortDirection(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DevelopmentServerConfigurationListBuilder {
    private String sortBy;
    private String sortDirection;

    public DevelopmentServerConfigurationListBuilder sortBy(final String sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public DevelopmentServerConfigurationListBuilder sortByFromEnum(final SortBy sortBy) {
      this.sortBy = sortBy.toString();
      return this;
    }

    public DevelopmentServerConfigurationListBuilder sortDirection(final String sortDirection) {
      this.sortDirection = sortDirection;
      return this;
    }

    public DevelopmentServerConfigurationListBuilder sortDirectionFromEnum(
        final SortDirection sortDirection) {
      this.sortDirection = sortDirection.toString();
      return this;
    }
  }
}
