/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement;

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
 * indirectBulkAcceptVersionedPolicy_1
 *
 * <p>Accepts many legal policy versions all at once. Supply with localized version policy id and
 * userId to accept an agreement. This endpoint used by Authentication Service during new user
 * registration.
 *
 * <p>Available Extra Information to return:
 *
 * <p>* userIds : List of userId mapping ( IMPORTANT: GOING TO DEPRECATE )
 *
 * <p>Other detail info: * Required permission : login user
 */
@Getter
@Setter
public class IndirectBulkAcceptVersionedPolicy1 extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/agreements/policies/users/{userId}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String userId;

  private List<AcceptAgreementRequest> body;

  /**
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public IndirectBulkAcceptVersionedPolicy1(String userId, List<AcceptAgreementRequest> body) {
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public List<AcceptAgreementRequest> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.userId == null) {
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
}
