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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/** PublicVerifyUserByLinkV3 */
@Getter
@Setter
public class PublicVerifyUserByLinkV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/verify_link/verify";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String code;

  /** */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicVerifyUserByLinkV3(String code) {
    this.code = code;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public String parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("code", "None");
    return result;
  }
}
