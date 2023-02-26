/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.stat_cycle_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getStatCycles
 *
 * <p>List stat cycles by pagination. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:STAT", action=2 (READ) * Returns
 * : stat cycles
 */
@Getter
@Setter
public class GetStatCycles extends Operation {
  /** generated field's value */
  private String path = "/social/v1/admin/namespaces/{namespace}/statCycles";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String cycleType;
  private Integer limit;
  private String name;
  private Integer offset;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetStatCycles(
      String namespace,
      String cycleType,
      Integer limit,
      String name,
      Integer offset,
      String status) {
    this.namespace = namespace;
    this.cycleType = cycleType;
    this.limit = limit;
    this.name = name;
    this.offset = offset;
    this.status = status;

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
    queryParams.put("cycleType", this.cycleType == null ? null : Arrays.asList(this.cycleType));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public StatCyclePagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new StatCyclePagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("cycleType", "None");
    result.put("limit", "None");
    result.put("name", "None");
    result.put("offset", "None");
    result.put("status", "None");
    return result;
  }

  public enum CycleType {
    ANNUALLY("ANNUALLY"),
    DAILY("DAILY"),
    MONTHLY("MONTHLY"),
    SEASONAL("SEASONAL"),
    WEEKLY("WEEKLY");

    private String value;

    CycleType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    INIT("INIT"),
    STOPPED("STOPPED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetStatCyclesBuilder {
    private String cycleType;
    private String status;

    public GetStatCyclesBuilder cycleType(final String cycleType) {
      this.cycleType = cycleType;
      return this;
    }

    public GetStatCyclesBuilder cycleTypeFromEnum(final CycleType cycleType) {
      this.cycleType = cycleType.toString();
      return this;
    }

    public GetStatCyclesBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public GetStatCyclesBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
