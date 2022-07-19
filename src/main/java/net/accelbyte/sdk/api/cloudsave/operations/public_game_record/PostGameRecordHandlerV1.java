/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.public_game_record;

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
 * postGameRecordHandlerV1
 *
 * <p>Required permission: `NAMESPACE:{namespace}:CLOUDSAVE:RECORD [CREATE]` Required scope:
 * `social`
 *
 * <p>## Description
 *
 * <p>This endpoints will create new game record or append the existing game record.
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
 */
@Getter
@Setter
public class PostGameRecordHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/cloudsave/v1/namespaces/{namespace}/records/{key}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String key;

  private String namespace;
  private ModelsGameRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param body required
   */
  @Builder
  public PostGameRecordHandlerV1(String key, String namespace, ModelsGameRecordRequest body) {
    this.key = key;
    this.namespace = namespace;
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
    return pathParams;
  }

  @Override
  public ModelsGameRecordRequest getBodyParams() {
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
    return true;
  }

  public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
