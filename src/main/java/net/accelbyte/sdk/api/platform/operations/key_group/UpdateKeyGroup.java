/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.key_group;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateKeyGroup
 *
 * <p>Update key group. Other detail info:
 *
 * <p>* Returns : updated key group
 */
@Getter
@Setter
public class UpdateKeyGroup extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String keyGroupId;

  private String namespace;
  private KeyGroupUpdate body;

  /**
   * @param keyGroupId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateKeyGroup(String keyGroupId, String namespace, KeyGroupUpdate body) {
    this.keyGroupId = keyGroupId;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.keyGroupId != null) {
      pathParams.put("keyGroupId", this.keyGroupId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public KeyGroupUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.keyGroupId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public KeyGroupInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new KeyGroupInfo().createFromJson(json);
  }
}
