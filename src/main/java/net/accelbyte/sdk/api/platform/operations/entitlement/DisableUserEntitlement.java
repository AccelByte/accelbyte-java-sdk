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
 * disableUserEntitlement
 *
 * <p>Disable user entitlement if entitlement, only active entitlement can be disable, disabled
 * entitlement can't consume. Like revoke, it will lose the entitlement ownership, except disabled
 * entitlement can enable. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT",
 * action=4 (UPDATE) * Returns : disable entitlement
 */
@Getter
@Setter
public class DisableUserEntitlement extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/disable";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String entitlementId;

  private String namespace;
  private String userId;

  /**
   * @param entitlementId required
   * @param namespace required
   * @param userId required
   */
  @Builder
  public DisableUserEntitlement(String entitlementId, String namespace, String userId) {
    this.entitlementId = entitlementId;
    this.namespace = namespace;
    this.userId = userId;

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
    return true;
  }

  public EntitlementInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new EntitlementInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
