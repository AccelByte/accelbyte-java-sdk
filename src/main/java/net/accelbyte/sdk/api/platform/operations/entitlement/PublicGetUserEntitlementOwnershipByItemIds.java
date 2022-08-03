/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * publicGetUserEntitlementOwnershipByItemIds
 *
 * <p>Get user entitlement ownership by itemIds.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=2
 * (READ)
 */
@Getter
@Setter
public class PublicGetUserEntitlementOwnershipByItemIds extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/byItemIds";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private List<String> ids;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  public PublicGetUserEntitlementOwnershipByItemIds(
      String namespace, String userId, List<String> ids) {
    this.namespace = namespace;
    this.userId = userId;
    this.ids = ids;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
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
    queryParams.put("ids", this.ids == null ? null : this.ids);
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public List<EntitlementOwnership> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementOwnership>>() {});
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("ids", "multi");
    return result;
  }
}
