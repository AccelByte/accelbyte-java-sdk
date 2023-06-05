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
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RequestOneTimeLinkingCodeV3
 *
 * <p>This endpoint is being used to request the one time code [8 length] for headless account to
 * link or upgrade to a full account.
 *
 * <p>It require a valid user token.
 *
 * <p>Should specify the target platform id and current user should already linked to this platform.
 *
 * <p>Current user should be a headless account.
 *
 * <p>## Supported platforms:
 *
 * <p>* steam
 *
 * <p>* steamopenid
 *
 * <p>* facebook
 *
 * <p>* google
 *
 * <p>* oculus
 *
 * <p>* twitch
 *
 * <p>* discord
 *
 * <p>* android
 *
 * <p>* ios
 *
 * <p>* apple
 *
 * <p>* device
 *
 * <p>* justice
 *
 * <p>* epicgames
 *
 * <p>* ps4
 *
 * <p>* ps5
 *
 * <p>* nintendo
 *
 * <p>* awscognito
 *
 * <p>* live
 *
 * <p>* xblweb
 *
 * <p>* netflix
 *
 * <p>* snapchat
 */
@Getter
@Setter
public class RequestOneTimeLinkingCodeV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/link/code/request";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String platformId;

  /**
   * @param platformId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RequestOneTimeLinkingCodeV3(String platformId) {
    this.platformId = platformId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.platformId != null) {
      formDataParams.put("platformId", this.platformId);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public OauthmodelOneTimeLinkingCodeResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelOneTimeLinkingCodeResponse().createFromJson(json);
  }
}
