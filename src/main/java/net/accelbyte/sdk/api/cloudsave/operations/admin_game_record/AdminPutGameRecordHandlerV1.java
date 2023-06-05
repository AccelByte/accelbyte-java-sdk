/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_game_record;

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
 * adminPutGameRecordHandlerV1
 *
 * <p>Required permission: `ADMIN:NAMESPACE:{namespace}:CLOUDSAVE:RECORD [UPDATE]` Required scope:
 * `social`
 *
 * <p>## Description
 *
 * <p>This endpoints will create new game record or replace the existing game record.
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
 * <p>## Record Metadata
 *
 * <p>Metadata allows user to define the behaviour of the record. Metadata can be defined in request
 * body with field name __META. When creating record, if __META field is not defined, the metadata
 * value will use the default value. When updating record, if __META field is not defined, the
 * existing metadata value will stay as is.
 *
 * <p>Metadata List: 1. set_by (default: CLIENT, type: string) Indicate which party that could
 * modify the game record. SERVER: record can be modified by server only. CLIENT: record can be
 * modified by client and server.
 *
 * <p>Request Body Example:
 *
 * <p>{ "__META": { "set_by": "SERVER" } ... }
 */
@Getter
@Setter
public class AdminPutGameRecordHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/cloudsave/v1/admin/namespaces/{namespace}/records/{key}";

  private String method = "PUT";
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
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminPutGameRecordHandlerV1(String key, String namespace, ModelsGameRecordRequest body) {
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

  public ModelsGameRecordResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGameRecordResponse().createFromJson(json);
  }
}
