/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.fleets;

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
 * FleetList
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA:FLEET [READ]
 */
@Getter
@Setter
public class FleetList extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/fleets";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean active;
  private Integer count;
  private String name;
  private Integer offset;
  private String region;
  private String sortBy;
  private String sortDirection;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public FleetList(
      String namespace,
      Boolean active,
      Integer count,
      String name,
      Integer offset,
      String region,
      String sortBy,
      String sortDirection) {
    this.namespace = namespace;
    this.active = active;
    this.count = count;
    this.name = name;
    this.offset = offset;
    this.region = region;
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
    queryParams.put(
        "active", this.active == null ? null : Arrays.asList(String.valueOf(this.active)));
    queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
    queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
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

  public ApiFleetListResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiFleetListResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("active", "None");
    result.put("count", "None");
    result.put("name", "None");
    result.put("offset", "None");
    result.put("region", "None");
    result.put("sortBy", "None");
    result.put("sortDirection", "None");
    return result;
  }

  public enum SortBy {
    Active("active"),
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

  public static class FleetListBuilder {
    private String sortBy;
    private String sortDirection;

    public FleetListBuilder sortBy(final String sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public FleetListBuilder sortByFromEnum(final SortBy sortBy) {
      this.sortBy = sortBy.toString();
      return this;
    }

    public FleetListBuilder sortDirection(final String sortDirection) {
      this.sortDirection = sortDirection;
      return this;
    }

    public FleetListBuilder sortDirectionFromEnum(final SortDirection sortDirection) {
      this.sortDirection = sortDirection.toString();
      return this;
    }
  }
}
