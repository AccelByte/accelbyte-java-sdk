/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record;

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
 * adminPutPlayerRecordConcurrentHandlerV1
 *
 * <p>Required Permission | `ADMIN:NAMESPACE:{namespace}:USER:{userId}:CLOUDSAVE:RECORD [UPDATE]`
 * --------------------|-----------------------------------------------------------------------
 * Required Scope | `social`
 *
 * <p>## Description
 *
 * <p>This endpoints will create new player record or replace the existing player record.
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
 * <p>## Reserved Word
 *
 * <p>Reserved Word List: __META
 *
 * <p>The reserved word cannot be used as a field in record value, If still defining the field when
 * creating or updating the record, it will be ignored.
 *
 * <p>## Parameters Notes
 *
 * <p>1. set_by (default: CLIENT, type: string) Indicate which party that could modify the game
 * record. SERVER: record can be modified by server only. CLIENT: record can be modified by client
 * and server. 2. updatedAt (required: true) Time format style: RFC3339 3. value Json Request Body
 * Example:
 *
 * <p>{ "set_by": "SERVER", "value": {}, "updatedAt": "2022-03-17T10:42:15.444Z" }
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
public class AdminPutPlayerRecordConcurrentHandlerV1 extends Operation {
  /** generated field's value */
  private String path =
      "/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/concurrent/records/{key}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String key;

  private String namespace;
  private String userId;
  private ModelsAdminConcurrentRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public AdminPutPlayerRecordConcurrentHandlerV1(
      String key, String namespace, String userId, ModelsAdminConcurrentRecordRequest body) {
    this.key = key;
    this.namespace = namespace;
    this.userId = userId;
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
  public ModelsAdminConcurrentRecordRequest getBodyParams() {
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
