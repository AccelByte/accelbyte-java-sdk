/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.admin_user_agreement;

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
 * indirectBulkAcceptVersionedPolicy
 *
 * <p>Accepts many legal policy versions all at once. Supply with localized version policy id and
 * userId to accept an agreement. Other detail info: * Required permission :
 * resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:LEGAL", action=1 (CREATE)
 */
@Getter
@Setter
public class IndirectBulkAcceptVersionedPolicy extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/admin/namespaces/{namespace}/users/{userId}/agreements/policies";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String publisherUserId;
  private String clientId;
  private String countryCode;
  private List<AcceptAgreementRequest> body;

  /**
   * @param namespace required
   * @param userId required
   * @param clientId required
   * @param countryCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public IndirectBulkAcceptVersionedPolicy(
      String namespace,
      String userId,
      String publisherUserId,
      String clientId,
      String countryCode,
      List<AcceptAgreementRequest> body) {
    this.namespace = namespace;
    this.userId = userId;
    this.publisherUserId = publisherUserId;
    this.clientId = clientId;
    this.countryCode = countryCode;
    this.body = body;

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
  public List<AcceptAgreementRequest> getBodyParams() {
    return this.body;
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

  public AcceptAgreementResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AcceptAgreementResponse().createFromJson(json);
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
