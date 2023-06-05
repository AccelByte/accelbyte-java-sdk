/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * setDefaultPolicy_2
 *
 * <p>Update a policy to be the default. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
public class SetDefaultPolicy2 extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/policies/{policyId}/default";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String policyId;

  /**
   * @param policyId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SetDefaultPolicy2(String policyId) {
    this.policyId = policyId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.policyId != null) {
      pathParams.put("policyId", this.policyId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.policyId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
