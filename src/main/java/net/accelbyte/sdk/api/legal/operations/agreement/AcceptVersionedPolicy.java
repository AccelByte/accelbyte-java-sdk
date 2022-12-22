/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * acceptVersionedPolicy
 *
 * <p>Accepts a legal policy version. Supply with localized version policy id to accept an
 * agreement. Other detail info:
 *
 * <p>* Required permission : login user
 */
@Getter
@Setter
public class AcceptVersionedPolicy extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/public/agreements/localized-policy-versions/{localizedPolicyVersionId}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String localizedPolicyVersionId;

  /**
   * @param localizedPolicyVersionId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AcceptVersionedPolicy(String localizedPolicyVersionId) {
    this.localizedPolicyVersionId = localizedPolicyVersionId;

    securities.add("Bearer");
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
