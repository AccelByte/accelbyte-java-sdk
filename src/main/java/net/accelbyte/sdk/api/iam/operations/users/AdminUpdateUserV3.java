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
 * AdminUpdateUserV3
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [UPDATE]'
 *
 * <p>This Endpoint support update user based on given data. Single request can update single field
 * or multi fields.
 *
 * <p>Supported field {country, displayName, emailAddress, languageTag, dateOfBirth}
 *
 * <p>Country use ISO3166-1 alpha-2 two letter, e.g. US.
 *
 * <p>Date of Birth format : YYYY-MM-DD, e.g. 2019-04-29.
 *
 * <p>Several case of updating email address
 *
 * <p>* User want to update email address of which have been verified, NewEmailAddress response
 * field will be filled with new email address.
 *
 * <p>* User want to update email address of which have not been verified, {LoginId,
 * OldEmailAddress, EmailAddress} response field will be filled with new email address.
 *
 * <p>* User want to update email address of which have been verified and updated before, {LoginId,
 * OldEmailAddress, EmailAddress} response field will be filled with verified email before.
 * NewEmailAddress response field will be filled with newest email address.
 *
 * <p>action code : 10103
 */
@Getter
@Setter
public class AdminUpdateUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/users/{userId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelUserUpdateRequestV3 body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  public AdminUpdateUserV3(String namespace, String userId, ModelUserUpdateRequestV3 body) {
    this.namespace = namespace;
    this.userId = userId;
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
  public ModelUserUpdateRequestV3 getBodyParams() {
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
    return true;
  }

  public ModelUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelUserResponseV3().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
