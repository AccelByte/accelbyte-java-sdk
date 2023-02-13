/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * partialUpdatePolicy_1
 *
 * <p>Update an existing base policy. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
public class PartialUpdatePolicy1 extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/namespaces/{namespace}/base-policies/{basePolicyId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String basePolicyId;

  private String namespace;
  private UpdateBasePolicyRequestV2 body;

  /**
   * @param basePolicyId required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PartialUpdatePolicy1(
      String basePolicyId, String namespace, UpdateBasePolicyRequestV2 body) {
    this.basePolicyId = basePolicyId;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.basePolicyId != null) {
      pathParams.put("basePolicyId", this.basePolicyId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public UpdateBasePolicyRequestV2 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.basePolicyId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public UpdateBasePolicyResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new UpdateBasePolicyResponse().createFromJson(json);
  }
}
