/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelEnabledFactorsResponseV4;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGetMyEnabledFactorsV4
 *
 * <p>This endpoint is used to get user enabled factors.
 *
 * <p>This endpoint Requires valid user access token
 */
@Getter
@Setter
public class AdminGetMyEnabledFactorsV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/users/me/mfa/factor";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public AdminGetMyEnabledFactorsV4() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelEnabledFactorsResponseV4 parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelEnabledFactorsResponseV4().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
