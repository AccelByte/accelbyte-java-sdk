/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_reports;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminSubmitReport
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:TICKET [CREATE] Submit a report and will
 * return ticket for reported object. New ticket will be created if no OPEN ticket present for
 * reported object (based by objectId and objectType) in a namespace.
 *
 * <p>Admin can only submit report once for each different user / object reported in the same OPEN
 * ticket. Reporting the same user / object in the same OPEN ticket will return HTTP code 409
 * (conflict).
 *
 * <p>Fill the 'reason' field with a 'reason title' Supported category:
 *
 * <p>* UGC * USER * CHAT * EXTENSION
 */
@Getter
@Setter
public class AdminSubmitReport extends Operation {
  /** generated field's value */
  private String path = "/reporting/v1/admin/namespaces/{namespace}/reports";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private RestapiSubmitReportRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSubmitReport(String namespace, RestapiSubmitReportRequest body) {
    this.namespace = namespace;
    this.body = body;

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
  public RestapiSubmitReportRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public RestapiSubmitReportResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RestapiSubmitReportResponse().createFromJson(json);
  }
}
