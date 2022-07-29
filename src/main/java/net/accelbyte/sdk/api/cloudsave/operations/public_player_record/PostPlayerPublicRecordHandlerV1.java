/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.public_player_record;

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
 * postPlayerPublicRecordHandlerV1
 *
 * <p>Required Permission | `NAMESPACE:{namespace}:USER:{userId}:PUBLIC:CLOUDSAVE:RECORD [WRITE]`
 * --------------------|-----------------------------------------------------------------------
 * Required Scope | `social`
 *
 * <p>## Description
 *
 * <p>This endpoints will create new player public record or append the existing player public
 * record.
 *
 * <p>Append example:
 *
 * <p>Example 1 - Existing JSON:
 *
 * <p>{ "data1": "value" }
 *
 * <p>- New JSON:
 *
 * <p>{ "data2": "new value" }
 *
 * <p>- Result:
 *
 * <p>{ "data1": "value", "data2": "new value" }
 *
 * <p>Example 2 - Existing JSON:
 *
 * <p>{ "data1": { "data2": "value" }
 *
 * <p>- New JSON:
 *
 * <p>{ "data1": { "data3": "new value" }
 *
 * <p>- Result:
 *
 * <p>{ "data1": { "data2": "value", "data3": "new value" }
 *
 * <p>## Reserved Word
 *
 * <p>Reserved Word List: __META
 *
 * <p>The reserved word cannot be used as a field in record value, If still defining the field when
 * creating or updating the record, it will be ignored.
 *
 * <p>## Warning: This endpoint is going to deprecate
 *
 * <p>This endpoint is going to deprecate in the future please don't use it.
 *
 * <p>For alternative, please use these endpoints: - POST
 * /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key} and utilizing __META
 * functionality - PUT /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key} and
 * utilizing __META functionality - DELETE
 * /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}
 */
@Getter
@Setter
public class PostPlayerPublicRecordHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}/public";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String key;

  private String namespace;
  private String userId;
  private ModelsPlayerRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  public PostPlayerPublicRecordHandlerV1(
      String key, String namespace, String userId, ModelsPlayerRecordRequest body) {
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
  public ModelsPlayerRecordRequest getBodyParams() {
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

  public ModelsPlayerRecordResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 201) {
      return new ModelsPlayerRecordResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
