/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicCreateUserV4
 *
 * <p>Create a new user with unique email address and username. **Required attributes:** - authType:
 * possible value is EMAILPASSWD - emailAddress: Please refer to the rule from
 * /v3/public/inputValidations API. - username: Please refer to the rule from
 * /v3/public/inputValidations API. - password: Please refer to the rule from
 * /v3/public/inputValidations API. - country: ISO3166-1 alpha-2 two letter, e.g. US. - dateOfBirth:
 * YYYY-MM-DD, e.g. 1990-01-01. valid values are between 1905-01-01 until current date. -
 * uniqueDisplayName: required when uniqueDisplayNameEnabled/UNIQUE_DISPLAY_NAME_ENABLED is true,
 * please refer to the rule from /v3/public/inputValidations API.
 *
 * <p>**Not required attributes:** - displayName: Please refer to the rule from
 * /v3/public/inputValidations API. This endpoint support accepting agreements for the created user.
 * Supply the accepted agreements in acceptedPolicies attribute.
 */
@Getter
@Setter
public class PublicCreateUserV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/namespaces/{namespace}/users";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private AccountCreateUserRequestV4 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicCreateUserV4(String namespace, AccountCreateUserRequestV4 body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public AccountCreateUserRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public AccountCreateUserResponseV4 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AccountCreateUserResponseV4().createFromJson(json);
  }
}
