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
 * AdminGetInputValidations
 *
 * <p>Required permission 'ADMIN:CONFIGURATION'[READ]
 *
 * <p>This endpoint is to get list of input validation configuration.
 *
 * <p>`regex` parameter will be returned if `isCustomRegex` is true. Otherwise, it will be empty.
 */
@Getter
@Setter
public class AdminGetInputValidations extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/inputValidations";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public AdminGetInputValidations() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelInputValidationsResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelInputValidationsResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
