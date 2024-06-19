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
 * S2SGetListFinishedPersonalDataRequest
 *
 * <p>Scope: account
 *
 * <p>Get list of finished personal data requests based on the finished time period. Unfinished
 * personal data requests will not appear here, i.e. have Status **Pending**, **In-Progress** or
 * **Canceled**.
 *
 * <p>**Anonymize userId for deleted account:** For user accounts that have been deleted, the
 * **userId** field in this API will be anonymized automatically after **7 days** from the success
 * deletion. This measure is implemented to ensure compliance with GDPR regulations. Please make
 * sure to synchronize the data from this API before it undergoes anonymization.
 *
 * <p>--- ## This API for S2S integration purpose only
 */
@Getter
@Setter
public class S2SGetListFinishedPersonalDataRequest extends Operation {
  /** generated field's value */
  private String path = "/gdpr/s2s/namespaces/{namespace}/requests/finished";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String end;
  private String start;

  /**
   * @param namespace required
   * @param end required
   * @param start required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public S2SGetListFinishedPersonalDataRequest(String namespace, String end, String start) {
    this.namespace = namespace;
    this.end = end;
    this.start = start;

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
    queryParams.put("end", this.end == null ? null : Arrays.asList(this.end));
    queryParams.put("start", this.start == null ? null : Arrays.asList(this.start));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.end == null) {
      return false;
    }
    if (this.start == null) {
      return false;
    }
    return true;
  }

  public DtoListFinishedDataRequests parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new DtoListFinishedDataRequests().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("end", "None");
    result.put("start", "None");
    return result;
  }
}
