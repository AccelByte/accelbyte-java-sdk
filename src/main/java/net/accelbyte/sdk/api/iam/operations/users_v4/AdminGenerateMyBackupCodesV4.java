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
import net.accelbyte.sdk.api.iam.models.ModelBackupCodesResponseV4;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGenerateMyBackupCodesV4
 *
 * <p>This endpoint is used to generate 8-digits backup codes. Each code is a one-time code and will
 * be deleted once used.
 *
 * <p>This endpoint Requires valid user access token
 */
@Getter
@Setter
public class AdminGenerateMyBackupCodesV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/users/me/mfa/backupCode";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public AdminGenerateMyBackupCodesV4() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelBackupCodesResponseV4 parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelBackupCodesResponseV4().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
