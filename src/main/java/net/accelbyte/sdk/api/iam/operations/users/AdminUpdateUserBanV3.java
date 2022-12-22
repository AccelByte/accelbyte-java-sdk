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
 * AdminUpdateUserBanV3
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:BAN:USER:{userId} [UPDATE] Set ban status for
 * a single user for a specific ban. Retrieve user ban and choose the ban ID. Set the form parameter
 * to true/false to enable or disable the ban. action code : 10142'
 */
@Getter
@Setter
public class AdminUpdateUserBanV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/bans/{banId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String banId;

  private String namespace;
  private String userId;
  private ModelBanUpdateRequest body;

  /**
   * @param banId required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateUserBanV3(
      String banId, String namespace, String userId, ModelBanUpdateRequest body) {
    this.banId = banId;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.banId != null) {
      pathParams.put("banId", this.banId);
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
  public ModelBanUpdateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.banId == null) {
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

  public ModelUserBanResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserBanResponseV3().createFromJson(json);
  }
}
