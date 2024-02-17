/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.operations.artifact_upload_process_queue;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * deleteNodeByID
 *
 * <p>Required permission: ADMIN:DSAM:ARTIFACT:NODES [DELETE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint will delete a node by IP
 */
@Getter
@Setter
public class DeleteNodeByID extends Operation {
  /** generated field's value */
  private String path = "/dsartifact/artifacts/nodes/ipaddresses";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json", "text/x-log");
  private String locationQuery = null;

  /** fields as input parameter */
  private String nodeIP;

  private String podName;

  /**
   * @param nodeIP required
   * @param podName required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteNodeByID(String nodeIP, String podName) {
    this.nodeIP = nodeIP;
    this.podName = podName;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("nodeIP", this.nodeIP == null ? null : Arrays.asList(this.nodeIP));
    queryParams.put("podName", this.podName == null ? null : Arrays.asList(this.podName));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.nodeIP == null) {
      return false;
    }
    if (this.podName == null) {
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

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("nodeIP", "None");
    result.put("podName", "None");
    return result;
  }
}
