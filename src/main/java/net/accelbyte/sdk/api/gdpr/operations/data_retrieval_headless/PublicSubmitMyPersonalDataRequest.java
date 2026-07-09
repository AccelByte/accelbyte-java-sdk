/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval_headless;

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
 * PublicSubmitMyPersonalDataRequest
 *
 * <p>Submit a Personal Data Request authenticated by a platform token. Requires a valid access
 * token.
 *
 * <p>This endpoint is intended for **in-game use** only and requires a valid platformId and
 * platform token. If a full account is available, use `POST
 * /gdpr/public/namespaces/{namespace}/users/{userId}/requests` instead.
 *
 * <p>### Request Header: - **Content-Type: application/x-www-form-urlencoded**
 */
@Getter
@Setter
public class PublicSubmitMyPersonalDataRequest extends Operation {
  /** generated field's value */
  private String path = "/gdpr/public/users/me/requests";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String email;

  private String languageTag;
  private String platformId;
  private String platformToken;

  /**
   * @param platformId required
   * @param platformToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicSubmitMyPersonalDataRequest(
      String email, String languageTag, String platformId, String platformToken) {
    this.email = email;
    this.languageTag = languageTag;
    this.platformId = platformId;
    this.platformToken = platformToken;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.email != null) {
      formDataParams.put("email", this.email);
    }
    if (this.languageTag != null) {
      formDataParams.put("languageTag", this.languageTag);
    }
    if (this.platformId != null) {
      formDataParams.put("platformId", this.platformId);
    }
    if (this.platformToken != null) {
      formDataParams.put("platformToken", this.platformToken);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.platformId == null) {
      return false;
    }
    if (this.platformToken == null) {
      return false;
    }
    return true;
  }

  public ModelsDataRetrievalResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDataRetrievalResponse().createFromJson(json);
  }
}
