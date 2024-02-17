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
import net.accelbyte.sdk.api.dsartifact.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * listAllActiveQueue
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSAM:ARTIFACT:QUEUE [READ]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint will list all DSes which artifact is currently in uploading process.
 */
@Getter
@Setter
public class ListAllActiveQueue extends Operation {
  /** generated field's value */
  private String path = "/dsartifact/namespaces/{namespace}/artifacts/queues/active/all";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json", "text/x-log");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Integer limit;
  private String next;
  private String nodeIP;
  private String podName;
  private String previous;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListAllActiveQueue(
      String namespace,
      Integer limit,
      String next,
      String nodeIP,
      String podName,
      String previous) {
    this.namespace = namespace;
    this.limit = limit;
    this.next = next;
    this.nodeIP = nodeIP;
    this.podName = podName;
    this.previous = previous;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("next", this.next == null ? null : Arrays.asList(this.next));
    queryParams.put("nodeIP", this.nodeIP == null ? null : Arrays.asList(this.nodeIP));
    queryParams.put("podName", this.podName == null ? null : Arrays.asList(this.podName));
    queryParams.put("previous", this.previous == null ? null : Arrays.asList(this.previous));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsListAllQueueResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsListAllQueueResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("next", "None");
    result.put("nodeIP", "None");
    result.put("podName", "None");
    result.put("previous", "None");
    return result;
  }
}
