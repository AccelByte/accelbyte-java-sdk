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
 * AdminUpdateUserV2
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/users/{userId} [PATCH]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [UPDATE]'
 *
 * <p>"+ "
 *
 * <p>This Endpoint support update user based on given data. Single request can update single field
 * or multi fields.
 *
 * <p>"+ "
 *
 * <p>Supported field {Country, DisplayName, LanguageTag}
 *
 * <p>"+ "
 *
 * <p>Country use ISO3166-1 alpha-2 two letter, e.g. US.
 *
 * <p>"+ " Several case of updating email address "+ " * User want to update email address of which
 * have been verified, NewEmailAddress response field will be filled with new email address. "+ " *
 * User want to update email address of which have not been verified, {LoginId, OldEmailAddress,
 * EmailAddress} response field will be filled with new email address. "+ " * User want to update
 * email address of which have been verified and updated before, {LoginId, OldEmailAddress,
 * EmailAddress} response field will be filled with verified email before. NewEmailAddress response
 * field will be filled with newest email address.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminUpdateUserV2 extends Operation {
  /** generated field's value */
  private String path = "/iam/v2/admin/namespaces/{namespace}/users/{userId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelUserUpdateRequest body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateUserV2(String namespace, String userId, ModelUserUpdateRequest body) {
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
  public ModelUserUpdateRequest getBodyParams() {
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

  public ModelUserResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserResponse().createFromJson(json);
  }
}
