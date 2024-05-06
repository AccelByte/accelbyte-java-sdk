/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.admin_user_eligibilities;

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
 * adminRetrieveEligibilities
 *
 * <p>Retrieve the active policies and its conformance status by user. This process only supports
 * cross-namespace checking between game namespace and publisher namespace , that means if the
 * active policy already accepted by the same user in publisher namespace, then it will also be
 * considered as eligible in non-publisher namespace.
 */
@Getter
@Setter
public class AdminRetrieveEligibilities extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/namespaces/{namespace}/users/{userId}/eligibilities";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String publisherUserId;
  private String clientId;
  private String countryCode;

  /**
   * @param namespace required
   * @param userId required
   * @param clientId required
   * @param countryCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminRetrieveEligibilities(
      String namespace,
      String userId,
      String publisherUserId,
      String clientId,
      String countryCode) {
    this.namespace = namespace;
    this.userId = userId;
    this.publisherUserId = publisherUserId;
    this.clientId = clientId;
    this.countryCode = countryCode;

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
    queryParams.put(
        "publisherUserId",
        this.publisherUserId == null ? null : Arrays.asList(this.publisherUserId));
    queryParams.put("clientId", this.clientId == null ? null : Arrays.asList(this.clientId));
    queryParams.put(
        "countryCode", this.countryCode == null ? null : Arrays.asList(this.countryCode));
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
    if (this.clientId == null) {
      return false;
    }
    if (this.countryCode == null) {
      return false;
    }
    return true;
  }

  public RetrieveUserEligibilitiesIndirectResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RetrieveUserEligibilitiesIndirectResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("publisherUserId", "None");
    result.put("clientId", "None");
    result.put("countryCode", "None");
    return result;
  }
}
