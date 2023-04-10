/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteClientPermission
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'CLIENT:ADMIN [UPDATE]'
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint:
 * /iam/v3/admin/namespaces/{namespace}/clients/{clientId}/permissions/{resource}/{action} [DELETE]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DeleteClientPermission extends Operation {
  /** generated field's value */
  private String path = "/iam/clients/{clientId}/clientpermissions/{resource}/{action}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private Integer action;

  private String clientId;
  private String resource;

  /**
   * @param action required
   * @param clientId required
   * @param resource required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteClientPermission(Integer action, String clientId, String resource) {
    this.action = action;
    this.clientId = clientId;
    this.resource = resource;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.action != null) {
      pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
    }
    if (this.clientId != null) {
      pathParams.put("clientId", this.clientId);
    }
    if (this.resource != null) {
      pathParams.put("resource", this.resource);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.action == null) {
      return false;
    }
    if (this.clientId == null) {
      return false;
    }
    if (this.resource == null) {
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
