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
 * PublicGetMyUserV3
 *
 * <p>Require valid user authorization Get my user data action code : 10147
 */
@Getter
@Setter
public class PublicGetMyUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/me";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public PublicGetMyUserV3() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelUserResponseV3().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
