/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * UpdateUserV3
 *
 * <p>This Endpoint support update user based on given data. **Single request can update single
 * field or multi fields.** Supported field {country, displayName, languageTag, dateOfBirth,
 * avatarUrl, userName} Country use ISO3166-1 alpha-2 two letter, e.g. US. Date of Birth format :
 * YYYY-MM-DD, e.g. 2019-04-29. **Response body logic when user updating email address:** - User
 * want to update email address of which have been verified, newEmailAddress response field will be
 * filled with new email address. - User want to update email address of which have not been
 * verified, { oldEmailAddress, emailAddress} response field will be filled with new email address.
 * - User want to update email address of which have been verified and updated before, {
 * oldEmailAddress, emailAddress} response field will be filled with verified email before.
 * newEmailAddress response field will be filled with newest email address.
 *
 * <p>**Important notes:** This endpoint provides support for client that doesn't have PATCH
 * support, i.e. UE4 before v4.23 released. If the client support PATCH method, use [PATCH]
 * /iam/v3/public/namespaces/{namespace}/users/me instead
 *
 * <p>action code : 10103
 */
@Getter
@Setter
public class UpdateUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users/me";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelPublicUserUpdateRequestV3 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateUserV3(String namespace, ModelPublicUserUpdateRequestV3 body) {
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
  public ModelPublicUserUpdateRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelUserResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserResponseV3().createFromJson(json);
  }
}
