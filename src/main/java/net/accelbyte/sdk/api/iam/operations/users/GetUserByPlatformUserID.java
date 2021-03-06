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
 * <p>Required permission 'NAMESPACE:{namespace}:USER [READ]'
 */
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

  public ModelPublicUserResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelPublicUserResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("platformID", "None");
    result.put("platformUserID", "None");
    return result;
  }
}
