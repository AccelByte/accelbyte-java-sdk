/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace;

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
 * createPolicyVersion_1
 *
 * <p>Create a version of a particular country-specific policy. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=1 (CREATE)
 */
@Getter
@Setter
public class CreatePolicyVersion1 extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/namespaces/{namespace}/policies/{policyId}/versions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String policyId;
  private CreatePolicyVersionRequest body;

  /**
   * @param namespace required
   * @param policyId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreatePolicyVersion1(String namespace, String policyId, CreatePolicyVersionRequest body) {
    this.namespace = namespace;
    this.policyId = policyId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.policyId != null) {
      pathParams.put("policyId", this.policyId);
    }
    return pathParams;
  }

  @Override
  public CreatePolicyVersionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.policyId == null) {
      return false;
    }
    return true;
  }

  public CreatePolicyVersionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new CreatePolicyVersionResponse().createFromJson(json);
  }
}
