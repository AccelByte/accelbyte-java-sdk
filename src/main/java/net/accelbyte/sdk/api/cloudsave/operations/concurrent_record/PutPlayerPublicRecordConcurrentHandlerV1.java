/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.concurrent_record;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * putPlayerPublicRecordConcurrentHandlerV1
 *
 * <p>Required Permission | `NAMESPACE:{namespace}:USER:{userId}:PUBLIC:CLOUDSAVE:RECORD [UPDATE]`
 * --------------------|------------------------------------------------------------------------
 * Required Scope | `social`
 *
 * <p>## Description
 *
 * <p>This endpoints will create new player public record or replace the existing player public
 * record.
 *
 * <p>Replace behaviour: The existing value will be replaced completely with the new value.
 *
 * <p>Example - Existing JSON:
 *
 * <p>{ "data1": "value" }
 *
 * <p>- New JSON:
 *
 * <p>{ "data2": "new value" }
 *
 * <p>- Result:
 *
 * <p>{ "data2": "new value" }
 *
 * <p>## Restriction
 *
 * <p>This is the restriction of Key Naming for the record: 1. Cannot use "." as the key name -
 *
 * <p>{ "data.2": "value" }
 *
 * <p>2. Cannot use "$" as the prefix in key names -
 *
 * <p>{ "$data": "value" }
 *
 * <p>3. Cannot use empty string in key names -
 *
 * <p>{ "": "value" }
 *
 * <p>## Reserved Word
 *
 * <p>Reserved Word List: __META
 *
 * <p>The reserved word cannot be used as a field in record value, If still defining the field when
 * creating or updating the record, it will be ignored.
 *
 * <p>## Optimistic Concurrency Control
 *
 * <p>This endpoint implement optimistic concurrency control to avoid race condition. If the record
 * has been updated since the client fetch it, the server will return HTTP status code 412
 * (precondition failed) and client need to redo the operation (fetch data and do update).
 * Otherwise, the server will process the request.
 */
@Getter
@Setter
public class PutPlayerPublicRecordConcurrentHandlerV1 extends Operation {
  /** generated field's value */
  private String path =
      "/cloudsave/v1/namespaces/{namespace}/users/{userId}/concurrent/records/{key}/public";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String key;

  private String namespace;
  private String userId;
  private Boolean responseBody;
  private ModelsConcurrentRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PutPlayerPublicRecordConcurrentHandlerV1(
      String key,
      String namespace,
      String userId,
      Boolean responseBody,
      ModelsConcurrentRecordRequest body) {
    this.key = key;
    this.namespace = namespace;
    this.userId = userId;
    this.responseBody = responseBody;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.key != null) {
      pathParams.put("key", this.key);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "responseBody",
        this.responseBody == null ? null : Arrays.asList(String.valueOf(this.responseBody)));
    return queryParams;
  }

  @Override
  public ModelsConcurrentRecordRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.key == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelsPlayerRecordConcurrentUpdateResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPlayerRecordConcurrentUpdateResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("responseBody", "None");
    return result;
  }
}
