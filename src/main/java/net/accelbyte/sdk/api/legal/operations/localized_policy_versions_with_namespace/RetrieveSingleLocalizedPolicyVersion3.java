/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace;

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
 * retrieveSingleLocalizedPolicyVersion_3
 *
 * <p>Retrieve specific localized policy version including the policy version and base policy
 * version where the localized policy version located. Other detail info:
 */
@Getter
@Setter
public class RetrieveSingleLocalizedPolicyVersion3 extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/public/namespaces/{namespace}/localized-policy-versions/{localizedPolicyVersionId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String localizedPolicyVersionId;

  private String namespace;

  /**
   * @param localizedPolicyVersionId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveSingleLocalizedPolicyVersion3(String localizedPolicyVersionId, String namespace) {
    this.localizedPolicyVersionId = localizedPolicyVersionId;
    this.namespace = namespace;
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.localizedPolicyVersionId != null) {
      pathParams.put("localizedPolicyVersionId", this.localizedPolicyVersionId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.localizedPolicyVersionId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public RetrieveLocalizedPolicyVersionPublicResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RetrieveLocalizedPolicyVersionPublicResponse().createFromJson(json);
  }
}
