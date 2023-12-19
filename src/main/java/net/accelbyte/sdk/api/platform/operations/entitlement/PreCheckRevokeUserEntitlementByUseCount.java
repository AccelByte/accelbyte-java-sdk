/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

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
 * preCheckRevokeUserEntitlementByUseCount
 *
 * <p>Checks if specified use count of user entitlement can be revoked without actually revoking it.
 * Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT",
 * action=1 (READ) * Returns : true if revokable, false otherwise
 */
@Getter
@Setter
public class PreCheckRevokeUserEntitlementByUseCount extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/revoke/byUseCount/preCheck";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String entitlementId;

  private String namespace;
  private String userId;
  private Integer quantity;

  /**
   * @param entitlementId required
   * @param namespace required
   * @param userId required
   * @param quantity required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PreCheckRevokeUserEntitlementByUseCount(
      String entitlementId, String namespace, String userId, Integer quantity) {
    this.entitlementId = entitlementId;
    this.namespace = namespace;
    this.userId = userId;
    this.quantity = quantity;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.entitlementId != null) {
      pathParams.put("entitlementId", this.entitlementId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "quantity", this.quantity == null ? null : Arrays.asList(String.valueOf(this.quantity)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.entitlementId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.quantity == null) {
      return false;
    }
    return true;
  }

  public EntitlementPrechekResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new EntitlementPrechekResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("quantity", "None");
    return result;
  }
}
