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
 * publicConsumeUserEntitlement
 *
 * <p>Consume user entitlement. If the entitlement useCount is 0, the status will be CONSUMED.
 * Client should pass item id in options if entitlement clazz is OPTIONBOX Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=4
 * (UPDATE) * Returns : consumed entitlement
 */
@Getter
@Setter
public class PublicConsumeUserEntitlement extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/decrement";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String entitlementId;

  private String namespace;
  private String userId;
  private EntitlementDecrement body;

  /**
   * @param entitlementId required
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicConsumeUserEntitlement(
      String entitlementId, String namespace, String userId, EntitlementDecrement body) {
    this.entitlementId = entitlementId;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

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
  public EntitlementDecrement getBodyParams() {
    return this.body;
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

  public EntitlementDecrementResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new EntitlementDecrementResult().createFromJson(json);
  }
}
