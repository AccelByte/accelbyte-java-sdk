/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.devices_v4;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGetBannedDevicesV4
 *
 * <p>This is the endpoint for an admin to get banned devices.
 *
 * <p>Required permission
 *
 * <p>'ADMIN:NAMESPACE:{namespace}:DEVICE [READ]'
 */
@Getter
@Setter
public class AdminGetBannedDevicesV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/namespaces/{namespace}/devices/banned";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String deviceType;
  private String endDate;
  private Integer limit;
  private Integer offset;
  private String startDate;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetBannedDevicesV4(
      String namespace,
      String deviceType,
      String endDate,
      Integer limit,
      Integer offset,
      String startDate) {
    this.namespace = namespace;
    this.deviceType = deviceType;
    this.endDate = endDate;
    this.limit = limit;
    this.offset = offset;
    this.startDate = startDate;

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
    queryParams.put("deviceType", this.deviceType == null ? null : Arrays.asList(this.deviceType));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelDeviceBannedResponseV4 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelDeviceBannedResponseV4().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("deviceType", "None");
    result.put("endDate", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("startDate", "None");
    return result;
  }
}
