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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publishPolicyVersion_1
 *
 * <p>Manually publish a version of a particular country-specific policy. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
public class PublishPolicyVersion1 extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/admin/namespaces/{namespace}/policies/versions/{policyVersionId}/latest";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String policyVersionId;
  private Boolean shouldNotify;

  /**
   * @param namespace required
   * @param policyVersionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublishPolicyVersion1(String namespace, String policyVersionId, Boolean shouldNotify) {
    this.namespace = namespace;
    this.policyVersionId = policyVersionId;
    this.shouldNotify = shouldNotify;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.policyVersionId != null) {
      pathParams.put("policyVersionId", this.policyVersionId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "shouldNotify",
        this.shouldNotify == null ? null : Arrays.asList(String.valueOf(this.shouldNotify)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.policyVersionId == null) {
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

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("shouldNotify", "None");
    return result;
  }
}
