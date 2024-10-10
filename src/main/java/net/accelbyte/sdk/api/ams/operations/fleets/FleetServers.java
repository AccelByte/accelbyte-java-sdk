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
 * FleetServers
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA:FLEET [READ]
 */
@Getter
@Setter
public class FleetServers extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/servers";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String fleetID;

  private String namespace;
  private Integer count;
  private Integer offset;
  private String region;
  private String serverId;
  private String sortBy;
  private String sortDirection;
  private String status;

  /**
   * @param fleetID required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public FleetServers(
      String fleetID,
      String namespace,
      Integer count,
      Integer offset,
      String region,
      String serverId,
      String sortBy,
      String sortDirection,
      String status) {
    this.fleetID = fleetID;
    this.namespace = namespace;
    this.count = count;
    this.offset = offset;
    this.region = region;
    this.serverId = serverId;
    this.sortBy = sortBy;
    this.sortDirection = sortDirection;
    this.status = status;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.fleetID != null) {
      pathParams.put("fleetID", this.fleetID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("serverId", this.serverId == null ? null : Arrays.asList(this.serverId));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put(
        "sortDirection", this.sortDirection == null ? null : Arrays.asList(this.sortDirection));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.fleetID == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApiFleetServersResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiFleetServersResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("count", "None");
    result.put("offset", "None");
    result.put("region", "None");
    result.put("serverId", "None");
    result.put("sortBy", "None");
    result.put("sortDirection", "None");
    result.put("status", "None");
    return result;
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

  public enum Status {
    Claimed("claimed"),
    Claiming("claiming"),
    CrashBackoff("crash backoff"),
    Creating("creating"),
    Draining("draining"),
    Ready("ready"),
    Unresponsive("unresponsive");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class FleetServersBuilder {
    private String sortDirection;
    private String status;

    public FleetServersBuilder sortDirection(final String sortDirection) {
      this.sortDirection = sortDirection;
      return this;
    }

    public FleetServersBuilder sortDirectionFromEnum(final SortDirection sortDirection) {
      this.sortDirection = sortDirection.toString();
      return this;
    }

    public FleetServersBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public FleetServersBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
