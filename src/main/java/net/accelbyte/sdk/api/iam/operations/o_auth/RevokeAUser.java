/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RevokeAUser
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>This endpoint revokes a user.
 *
 * <p>This endpoint requires all requests to have Authorization header set with Bearer access
 * authentication with valid access token.
 *
 * <p>Required permission 'NAMESPACE:{namespace}:USER:{userID}:ADMIN [UPDATE]'
 *
 * <p>When other clients know that the userID has been revoked and the token is issued before the
 * revocation, forcing a new token will contain banned permissions.
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/revoke [POST]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class RevokeAUser extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/revoke/user";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String userID;

  /**
   * @param userID required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RevokeAUser(String userID) {
    this.userID = userID;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.userID != null) {
      formDataParams.put("userID", this.userID);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.userID == null) {
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
}
