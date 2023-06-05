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
 * GetUserByPlatformUserID
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint(Public):
 * /iam/v3/public/namespaces/{namespace}/platforms/{platformId}/users/{platformUserId} [GET]
 *
 * <p>* Substitute endpoint(Admin):
 * /iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/users/{platformUserId} [GET]
 *
 * <p>* Note: 1. difference in V3 response, format difference: Pascal case => Camel case
 *
 * <p>Required permission 'NAMESPACE:{namespace}:USER [READ]'
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetUserByPlatformUserID extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/byPlatformUserID";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformID;
  private String platformUserID;

  /**
   * @param namespace required
   * @param platformID required
   * @param platformUserID required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetUserByPlatformUserID(String namespace, String platformID, String platformUserID) {
    this.namespace = namespace;
    this.platformID = platformID;
    this.platformUserID = platformUserID;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("platformID", this.platformID == null ? null : Arrays.asList(this.platformID));
    queryParams.put(
        "platformUserID", this.platformUserID == null ? null : Arrays.asList(this.platformUserID));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformID == null) {
      return false;
    }
    if (this.platformUserID == null) {
      return false;
    }
    return true;
  }

  public ModelPublicUserResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelPublicUserResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("platformID", "None");
    result.put("platformUserID", "None");
    return result;
  }
}
