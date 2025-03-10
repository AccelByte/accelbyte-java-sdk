/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval_s2s;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * S2SGetDataRequestByRequestID
 *
 * <p>Scope: account
 *
 * <p>Get Personal Data Request by Request Id. If the request has been completed, it will return a
 * download url for the data package.
 *
 * <p>--- ## This API for S2S integration purpose only
 */
@Getter
@Setter
public class S2SGetDataRequestByRequestID extends Operation {
  /** generated field's value */
  private String path = "/gdpr/s2s/namespaces/{namespace}/requests/{requestId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String requestId;

  /**
   * @param namespace required
   * @param requestId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public S2SGetDataRequestByRequestID(String namespace, String requestId) {
    this.namespace = namespace;
    this.requestId = requestId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.requestId != null) {
      pathParams.put("requestId", this.requestId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.requestId == null) {
      return false;
    }
    return true;
  }

  public DtoS2SDataRequestSummary parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new DtoS2SDataRequestSummary().createFromJson(json);
  }
}
