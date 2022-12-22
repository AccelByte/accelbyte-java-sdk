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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGenerateReportV4
 *
 * <p>This is the endpoint for an admin to generate device report.
 *
 * <p>Required permission
 *
 * <p>'ADMIN:NAMESPACE:{namespace}:DEVICE [READ]'
 */
@Getter
@Setter
public class AdminGenerateReportV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/namespaces/{namespace}/devices/report";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String endDate;
  private String startDate;
  private String deviceType;

  /**
   * @param namespace required
   * @param deviceType required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGenerateReportV4(
      String namespace, String endDate, String startDate, String deviceType) {
    this.namespace = namespace;
    this.endDate = endDate;
    this.startDate = startDate;
    this.deviceType = deviceType;

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
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("deviceType", this.deviceType == null ? null : Arrays.asList(this.deviceType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.deviceType == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endDate", "None");
    result.put("startDate", "None");
    result.put("deviceType", "None");
    return result;
  }
}
