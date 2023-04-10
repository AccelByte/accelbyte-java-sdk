/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.user_profile;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateMyProfile
 *
 * <p>Update my profile. Updates user profile in the target namespace (namespace in the path). If
 * token's namespace doesn't match the target namespace, the service automatically maps the token's
 * user ID into the user ID in the target namespace. The endpoint returns the updated user profile
 * on a successful call. Other detail info:
 *
 * <p>* Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=4 (UPDATE) * Action
 * code : 11402 * Returns : user profile * Path's namespace : * can be filled with publisher
 * namespace in order to update publisher user profile * can be filled with game namespace in order
 * to update game user profile * Language : allowed format: en, en-US * Timezone : IANA time zone,
 * e.g. Asia/Shanghai
 */
@Getter
@Setter
public class UpdateMyProfile extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/public/namespaces/{namespace}/users/me/profiles";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private UserProfileUpdate body;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateMyProfile(String namespace, UserProfileUpdate body) {
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
  public UserProfileUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public UserProfilePrivateInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new UserProfilePrivateInfo().createFromJson(json);
  }
}
