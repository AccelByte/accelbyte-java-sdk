/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * GetUserPlatformAccounts
 *
 * <p>Required permission 'NAMESPACE:{namespace}:USER:{userId} [READ]'.
 *
 * <p>## Justice Platform Account
 *
 * <p>The permission âADMIN:NAMESPACE:{namespace}:JUSTICE:USER:{userId}â [READ] is required in
 * order to read the UserID who linked with the user.
 */
@Getter
@Setter
public class GetUserPlatformAccounts extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/{userId}/platforms";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  public GetUserPlatformAccounts(String namespace, String userId) {
    this.namespace = namespace;
    this.userId = userId;

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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public List<AccountcommonUserLinkedPlatform> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper()
          .readValue(json, new TypeReference<List<AccountcommonUserLinkedPlatform>>() {});
    }
    throw new HttpResponseException(code, json);
  }
}
