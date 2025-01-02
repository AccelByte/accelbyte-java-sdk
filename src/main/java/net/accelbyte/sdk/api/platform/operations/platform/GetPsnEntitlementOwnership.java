/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.platform;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPsnEntitlementOwnership
 *
 * <p>Get user psn entitlement ownership by entitlement label.
 */
@Getter
@Setter
public class GetPsnEntitlementOwnership extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/platforms/psn/entitlements/{entitlementLabel}/ownership";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String entitlementLabel;

  private String namespace;
  private PsnEntitlementOwnershipRequest body;

  /**
   * @param entitlementLabel required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPsnEntitlementOwnership(
      String entitlementLabel, String namespace, PsnEntitlementOwnershipRequest body) {
    this.entitlementLabel = entitlementLabel;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.entitlementLabel != null) {
      pathParams.put("entitlementLabel", this.entitlementLabel);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public PsnEntitlementOwnershipRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.entitlementLabel == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public Ownership parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new Ownership().createFromJson(json);
  }
}
