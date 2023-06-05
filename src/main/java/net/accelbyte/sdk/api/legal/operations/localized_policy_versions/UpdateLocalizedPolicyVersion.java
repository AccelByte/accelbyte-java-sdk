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
 * updateLocalizedPolicyVersion
 *
 * <p>Update a version of a particular country-specific policy. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
public class UpdateLocalizedPolicyVersion extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String localizedPolicyVersionId;

  private UpdateLocalizedPolicyVersionRequest body;

  /**
   * @param localizedPolicyVersionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateLocalizedPolicyVersion(
      String localizedPolicyVersionId, UpdateLocalizedPolicyVersionRequest body) {
    this.localizedPolicyVersionId = localizedPolicyVersionId;
    this.body = body;

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
  public UpdateLocalizedPolicyVersionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.localizedPolicyVersionId == null) {
      return false;
    }
    return true;
  }

  public UpdateLocalizedPolicyVersionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new UpdateLocalizedPolicyVersionResponse().createFromJson(json);
  }
}
