/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.key_group;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.KeyGroupInfo;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getKeyGroup
 *
 * <p>Get key group. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:KEYGROUP", action=2 (READ) *
 * Returns : key group info
 */
@Getter
@Setter
public class GetKeyGroup extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String keyGroupId;

  private String namespace;

  /**
   * @param keyGroupId required
   * @param namespace required
   */
  @Builder
  public GetKeyGroup(String keyGroupId, String namespace) {
    this.keyGroupId = keyGroupId;
    this.namespace = namespace;

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
  public boolean isValid() {
    if (this.keyGroupId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public KeyGroupInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new KeyGroupInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
