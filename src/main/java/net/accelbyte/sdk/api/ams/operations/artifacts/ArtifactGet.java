/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.artifacts;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * ArtifactGet
 *
 * <p>Get all artifacts matching the provided search criteria. When criteria is not specified the
 * data returned won't have been filtered on those parameters
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:AMS:ARTIFACT [READ]
 */
@Getter
@Setter
public class ArtifactGet extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/artifacts";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String artifactType;
  private Integer count;
  private String endDate;
  private String fleetID;
  private String imageID;
  private Integer maxSize;
  private Integer minSize;
  private Integer offset;
  private String region;
  private String serverId;
  private String startDate;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ArtifactGet(
      String namespace,
      String artifactType,
      Integer count,
      String endDate,
      String fleetID,
      String imageID,
      Integer maxSize,
      Integer minSize,
      Integer offset,
      String region,
      String serverId,
      String startDate,
      String status) {
    this.namespace = namespace;
    this.artifactType = artifactType;
    this.count = count;
    this.endDate = endDate;
    this.fleetID = fleetID;
    this.imageID = imageID;
    this.maxSize = maxSize;
    this.minSize = minSize;
    this.offset = offset;
    this.region = region;
    this.serverId = serverId;
    this.startDate = startDate;
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
    queryParams.put(
        "artifactType", this.artifactType == null ? null : Arrays.asList(this.artifactType));
    queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("fleetID", this.fleetID == null ? null : Arrays.asList(this.fleetID));
    queryParams.put("imageID", this.imageID == null ? null : Arrays.asList(this.imageID));
    queryParams.put(
        "maxSize", this.maxSize == null ? null : Arrays.asList(String.valueOf(this.maxSize)));
    queryParams.put(
        "minSize", this.minSize == null ? null : Arrays.asList(String.valueOf(this.minSize)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("serverId", this.serverId == null ? null : Arrays.asList(this.serverId));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
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

  public List<ApiArtifactResponse> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiArtifactResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("artifactType", "None");
    result.put("count", "None");
    result.put("endDate", "None");
    result.put("fleetID", "None");
    result.put("imageID", "None");
    result.put("maxSize", "None");
    result.put("minSize", "None");
    result.put("offset", "None");
    result.put("region", "None");
    result.put("serverId", "None");
    result.put("startDate", "None");
    result.put("status", "None");
    return result;
  }
}
