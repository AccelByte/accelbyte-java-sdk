/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.loginqueue.operations.admin_v1;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.loginqueue.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminUpdateConfiguration
 *
 * <p>This API is used to set/update log queue configuration of a namespace. This endpoint has
 * upsert behavior. Calling the endpoint to a namespace with no configuration will make the service
 * to create a new configuration. When creating new configuration, empty field will have default
 * value: * enabled = false * maxConcurrency = 1000000 * maxLoginRate = 500 * safetyMarginPercentage
 * = 5 * minActivationPeriodInSecond = 600 * playerReconnectGracePeriodInSecond = 300 *
 * queueReconnectGracePeriodInSecond = 60 * playerPollingTimeInSecond = 20
 *
 * <p>Calling this endpoint with namespace that has configuration will replace the old
 * configuration.
 *
 * <p>Input validation: * maxConcurrency must be > 0 and <= 10000000 (0 < x <= 10000000) *
 * maxLoginRate must be > 0 and <= 100000 (0 < x <= 100000) * minActivationPeriodInSecond,
 * playerReconnectGracePeriodInSecond, playerPollingTimeInSecond and
 * queueReconnectGracePeriodInSecond must be > 0 and <= 21600 (0 < x <= 21600) *
 * playerPollingTimeInSecond must be smaller than queueReconnectGracePeriodInSecond *
 * safetyMarginPercentage must be >= 0 and < 100 (0 <= x < 100)
 */
@Getter
@Setter
public class AdminUpdateConfiguration extends Operation {
  /** generated field's value */
  private String path = "/login-queue/v1/admin/namespaces/{namespace}/config";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApimodelsConfigurationRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateConfiguration(String namespace, ApimodelsConfigurationRequest body) {
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
  public ApimodelsConfigurationRequest getBodyParams() {
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

  public ApimodelsConfigurationResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsConfigurationResponse().createFromJson(json);
  }
}
