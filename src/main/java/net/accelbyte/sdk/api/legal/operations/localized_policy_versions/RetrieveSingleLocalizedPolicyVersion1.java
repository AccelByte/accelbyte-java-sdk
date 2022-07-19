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
 * retrieveSingleLocalizedPolicyVersion_1
 *
 * <p>Retrieve specific localized policy version including the policy version and base policy
 * version where the localized policy version located. Other detail info:
 */
@Getter
@Setter
public class RetrieveSingleLocalizedPolicyVersion1 extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/localized-policy-versions/{localizedPolicyVersionId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String localizedPolicyVersionId;

  /**
   * @param localizedPolicyVersionId required
   */
  @Builder
  public RetrieveSingleLocalizedPolicyVersion1(String localizedPolicyVersionId) {
    this.localizedPolicyVersionId = localizedPolicyVersionId;
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.localizedPolicyVersionId != null) {
      pathParams.put("localizedPolicyVersionId", this.localizedPolicyVersionId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.localizedPolicyVersionId == null) {
      return false;
    }
    return true;
  }

  public RetrieveLocalizedPolicyVersionPublicResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new RetrieveLocalizedPolicyVersionPublicResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
