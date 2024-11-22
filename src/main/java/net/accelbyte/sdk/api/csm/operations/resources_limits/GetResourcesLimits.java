/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.resources_limits;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetResourcesLimits
 *
 * <p>This endpoint return the Extend Apps Configurable Limits for front end to use for initial
 * validation before app creation e.g. Replica Limit will be used to check max replica that can be
 * created for the said environment by default CPU Limit will be used to validate max allowed CPU
 * for the extend app that hasn't been created Memory Limit will be used to validate max allowed
 * Memory for the extend app that hasn't been created MaxAppNotificationSubscription will be used to
 * validate the maximum number of subscriber for an app status notification
 */
@Getter
@Setter
public class GetResourcesLimits extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/resources/limits";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetResourcesLimits(String namespace) {
    this.namespace = namespace;

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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelCSMAppLimitsResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelCSMAppLimitsResponse().createFromJson(json);
  }
}
