/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_player_record;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminDeletePlayerPublicRecordHandlerV1
 *
 * <p>Required Permission | `ADMIN:NAMESPACE:{namespace}:USER:{userId}:PUBLIC:CLOUDSAVE:RECORD
 * [DELETE]`
 * --------------------|------------------------------------------------------------------------------
 * Required Scope | `social`
 *
 * <p>Delete player public record.
 *
 * <p>## Warning: This endpoint is going to deprecate
 *
 * <p>This endpoint is going to deprecate in the future please don't use it.
 *
 * <p>For alternative, please use these endpoints: - POST
 * /cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key} and utilizing __META
 * functionality - PUT /cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key} and
 * utilizing __META functionality - DELETE
 * /cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}
 */
@Getter
@Setter
public class AdminDeletePlayerPublicRecordHandlerV1 extends Operation {
  /** generated field's value */
  private String path =
      "/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}/public";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String key;

  private String namespace;
  private String userId;

  /**
   * @param key required
   * @param namespace required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDeletePlayerPublicRecordHandlerV1(String key, String namespace, String userId) {
    this.key = key;
    this.namespace = namespace;
    this.userId = userId;

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
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
