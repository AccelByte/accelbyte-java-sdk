/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * batchDownloadServerLogs
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSLM:LOG [READ]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint will download dedicated server's log file (.zip).
 */
@Getter
@Setter
public class BatchDownloadServerLogs extends Operation {
  /** generated field's value */
  private String path = "/dslogmanager/servers/logs/download";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private ModelsBatchDownloadLogsRequest body;

  /**
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public BatchDownloadServerLogs(ModelsBatchDownloadLogsRequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelsBatchDownloadLogsRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public InputStream parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    return payload;
  }
}
