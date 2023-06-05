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
 * getMyProfileInfo
 *
 * <p>Get my profile Client with user token can get user profile in target namespace Other detail
 * info:
 *
 * <p>* Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=2 (READ) * Action
 * code : 11403 * Returns : user profile * Path's namespace : * can be filled with publisher
 * namespace in order to get publisher user profile * can be filled with game namespace in order to
 * get game user profile * Language : allowed format: en, en-US * Timezone : IANA time zone, e.g.
 * Asia/Shanghai
 */
@Getter
@Setter
public class GetMyProfileInfo extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/public/namespaces/{namespace}/users/me/profiles";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetMyProfileInfo(String namespace) {
    this.namespace = namespace;

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
