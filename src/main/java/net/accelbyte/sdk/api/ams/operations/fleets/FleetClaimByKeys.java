/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.fleets;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * FleetClaimByKeys
 *
 * <p>Claim a dedicated server from fleets with matching claim keys. If the claim key is for a
 * regular fleet (non development), the request will instantly fail if there are no DS available
 * (HTTP 404). If the claim key is for a development fleet and there are no DS available, a new DS
 * will be launched and the request might take up to 8 seconds to return (depending on the
 * environment configuration). If it's not ready after that duration the request will still return
 * HTTP 404. In either case, the call to this endpoint may be retried at any time to check if a DS
 * has become available.
 *
 * <p>Required Permission: NAMESPACE:{namespace}:AMS:SERVER:CLAIM [UPDATE]
 */
@Getter
@Setter
public class FleetClaimByKeys extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/namespaces/{namespace}/servers/claim";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApiFleetClaimByKeysReq body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public FleetClaimByKeys(String namespace, ApiFleetClaimByKeysReq body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApiFleetClaimByKeysReq getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApiFleetClaimResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiFleetClaimResponse().createFromJson(json);
  }
}
