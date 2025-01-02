/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminPatchUpdateLogConfig
 *
 * <p>Update Log Configuration logLevel use for logging in service, the value can use is
 * trace|debug|info|warning|error|fatal|panic socketLogEnabled is use for enable socket log
 * logLevelDB use for logging in DB, the value can use is trace|debug|info|warning|error|fatal|panic
 * slowQueryThreshold use for logging slow threshold in time measure is nano second
 */
@Getter
@Setter
public class AdminPatchUpdateLogConfig extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/admin/config/log";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private LogconfigConfiguration body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminPatchUpdateLogConfig(LogconfigConfiguration body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public LogconfigConfiguration getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public LogconfigConfiguration parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new LogconfigConfiguration().createFromJson(json);
  }
}
