/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.user_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * adminGetUserProfilePublicInfoByIds
 *
 * <p>Admin get user public profile by ids. Other detail info:
 *
 * <p>* Required permission : resource= "ADMIN:NAMESPACE:{namespace}:PROFILE" , action=2 (GET) *
 * Action code : 11405 * Returns : user public profiles
 */
@Getter
@Setter
public class AdminGetUserProfilePublicInfoByIds extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/admin/namespaces/{namespace}/profiles/public";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private UserProfileBulkRequest body;

  /**
   * @param namespace required
   */
  @Builder
  public AdminGetUserProfilePublicInfoByIds(String namespace, UserProfileBulkRequest body) {
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
  public UserProfileBulkRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<UserProfilePublicInfo> parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper()
          .readValue(json, new TypeReference<List<UserProfilePublicInfo>>() {});
    }
    throw new HttpResponseException(code, json);
  }
}
