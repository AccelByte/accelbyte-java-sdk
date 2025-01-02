/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UpgradeAndAuthenticateForwardV3
 *
 * <p>In login website based flow, after account upgraded, we need this API to handle the forward
 */
@Getter
@Setter
public class UpgradeAndAuthenticateForwardV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/upgrade/forward";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String clientId;

  private String upgradeSuccessToken;

  /**
   * @param clientId required
   * @param upgradeSuccessToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpgradeAndAuthenticateForwardV3(String clientId, String upgradeSuccessToken) {
    this.clientId = clientId;
    this.upgradeSuccessToken = upgradeSuccessToken;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.upgradeSuccessToken != null) {
      formDataParams.put("upgrade_success_token", this.upgradeSuccessToken);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.upgradeSuccessToken == null) {
      return false;
    }
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
}
