/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicGeneratePersonalDataURL
 *
 * <p>Generate personal data download url Requires valid user access token Scope: account
 */
@Getter
@Setter
public class PublicGeneratePersonalDataURL extends Operation {
  /** generated field's value */
  private String path =
      "/gdpr/public/namespaces/{namespace}/users/{userId}/requests/{requestDate}/generate";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String requestDate;
  private String userId;
  private String password;

  /**
   * @param namespace required
   * @param requestDate required
   * @param userId required
   * @param password required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGeneratePersonalDataURL(
      String namespace, String requestDate, String userId, String password) {
    this.namespace = namespace;
    this.requestDate = requestDate;
    this.userId = userId;
    this.password = password;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.requestDate != null) {
      pathParams.put("requestDate", this.requestDate);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.requestDate == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.password == null) {
      return false;
    }
    return true;
  }

  public ModelsUserDataURL parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsUserDataURL().createFromJson(json);
  }
}
