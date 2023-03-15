/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.dsmc_default_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminGetDSMCConfigurationDefault
 *
 * <p>Get dsmc default configuration.
 */
@Getter
@Setter
public class AdminGetDSMCConfigurationDefault extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/dsconfigs/default";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetDSMCConfigurationDefault() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelsDefaultDSMCConfig parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDefaultDSMCConfig().createFromJson(json);
  }
}
