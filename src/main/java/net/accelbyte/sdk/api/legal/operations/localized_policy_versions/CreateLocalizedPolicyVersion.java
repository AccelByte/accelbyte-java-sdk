/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions;

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
 * createLocalizedPolicyVersion
 *
 * <p>Create a version of a particular country-specific policy. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=1 (CREATE)
 */
@Getter
@Setter
public class CreateLocalizedPolicyVersion extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/localized-policy-versions/versions/{policyVersionId}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String policyVersionId;

  private CreateLocalizedPolicyVersionRequest body;

  /**
   * @param policyVersionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateLocalizedPolicyVersion(
      String policyVersionId, CreateLocalizedPolicyVersionRequest body) {
    this.policyVersionId = policyVersionId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.policyVersionId != null) {
      pathParams.put("policyVersionId", this.policyVersionId);
    }
    return pathParams;
  }

  @Override
  public CreateLocalizedPolicyVersionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.policyVersionId == null) {
      return false;
    }
    return true;
  }

  public CreateLocalizedPolicyVersionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new CreateLocalizedPolicyVersionResponse().createFromJson(json);
  }
}
