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
 * updateMyZipCode
 *
 * <p>Update my zip code. Other detail info:
 *
 * <p>* Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=4 (UPDATE) * Action
 * code : 11408 * Returns : user zip code
 */
@Getter
@Setter
public class UpdateMyZipCode extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/public/namespaces/{namespace}/users/me/profiles/zipCode";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private UserZipCodeUpdate userZipCodeUpdate;

  /**
   * @param namespace required
   * @param userZipCodeUpdate required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateMyZipCode(String namespace, UserZipCodeUpdate userZipCodeUpdate) {
    this.namespace = namespace;
    this.userZipCodeUpdate = userZipCodeUpdate;

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
  public UserZipCodeUpdate getBodyParams() {
    return this.userZipCodeUpdate;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public UserZipCode parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new UserZipCode().createFromJson(json);
  }
}
