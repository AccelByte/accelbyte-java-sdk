/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.catalog_changes;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * unselectRecord
 *
 * <p>Unselect a change, it will not be included when partial publish. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:STORE", action=4 (UPDATE)
 */
@Getter
@Setter
public class UnselectRecord extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/stores/{storeId}/catalogChanges/{changeId}/unselect";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String changeId;

  private String namespace;
  private String storeId;

  /**
   * @param changeId required
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UnselectRecord(String changeId, String namespace, String storeId) {
    this.changeId = changeId;
    this.namespace = namespace;
    this.storeId = storeId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.changeId != null) {
      pathParams.put("changeId", this.changeId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.storeId != null) {
      pathParams.put("storeId", this.storeId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.changeId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
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
