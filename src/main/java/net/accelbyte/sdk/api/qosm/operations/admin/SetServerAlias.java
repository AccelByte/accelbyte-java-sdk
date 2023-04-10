/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.operations.admin;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SetServerAlias
 *
 * <p>``` Required permission: ADMIN:QOS:SERVER [UDPATE] Required scope: social
 *
 * <p>This endpoint modifies a registered QoS service's region alias. ```
 */
@Getter
@Setter
public class SetServerAlias extends Operation {
  /** generated field's value */
  private String path = "/qosm/admin/servers/{region}/alias";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String region;

  private ModelsSetAliasRequest body;

  /**
   * @param region required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SetServerAlias(String region, ModelsSetAliasRequest body) {
    this.region = region;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.region != null) {
      pathParams.put("region", this.region);
    }
    return pathParams;
  }

  @Override
  public ModelsSetAliasRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.region == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
