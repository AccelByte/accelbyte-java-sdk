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
 * requestPresignedURL
 *
 * <p>Request presigned URL for upload attachment for a particular localized version of base policy.
 * Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=1 (CREATE)
 */
@Getter
@Setter
public class RequestPresignedURL extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}/attachments";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String localizedPolicyVersionId;

  private UploadPolicyVersionAttachmentRequest body;

  /**
   * @param localizedPolicyVersionId required
   */
  @Builder
  public RequestPresignedURL(
      String localizedPolicyVersionId, UploadPolicyVersionAttachmentRequest body) {
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
  public UploadPolicyVersionAttachmentRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.localizedPolicyVersionId == null) {
      return false;
    }
    return true;
  }

  public UploadLocalizedPolicyVersionAttachmentResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 201) {
      return new UploadLocalizedPolicyVersionAttachmentResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
