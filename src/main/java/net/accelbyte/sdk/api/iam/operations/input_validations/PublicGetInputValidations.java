/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.input_validations;

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
 * PublicGetInputValidations
 *
 * <p>No role required
 *
 * <p>This endpoint is to get list of input validation configuration.
 *
 * <p>`regex` parameter will be returned if `isCustomRegex` is true. Otherwise, it will be empty.
 */
@Getter
@Setter
public class PublicGetInputValidations extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/inputValidations";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private Boolean defaultOnEmpty;

  private String languageCode;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetInputValidations(Boolean defaultOnEmpty, String languageCode) {
    this.defaultOnEmpty = defaultOnEmpty;
    this.languageCode = languageCode;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "defaultOnEmpty",
        this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
    queryParams.put(
        "languageCode", this.languageCode == null ? null : Arrays.asList(this.languageCode));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelInputValidationsPublicResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelInputValidationsPublicResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("defaultOnEmpty", "None");
    result.put("languageCode", "None");
    return result;
  }
}
