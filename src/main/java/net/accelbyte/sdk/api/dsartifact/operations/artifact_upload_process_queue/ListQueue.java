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
 * listQueue
 *
 * <p>``` Required permission: ADMIN:DSAM:ARTIFACT:QUEUE [READ]
 *
 * <p>This endpoint is used to get the list of queues on a node ```
 */
@Getter
@Setter
public class ListQueue extends Operation {
  /** generated field's value */
  private String path = "/dsartifact/artifacts/queues";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json", "text/x-log");
  private String locationQuery = null;

  /** fields as input parameter */
  private Integer limit;

  private String next;
  private String previous;
  private String nodeIP;

  /**
   * @param nodeIP required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListQueue(Integer limit, String next, String previous, String nodeIP) {
    this.limit = limit;
    this.next = next;
    this.previous = previous;
    this.nodeIP = nodeIP;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("next", this.next == null ? null : Arrays.asList(this.next));
    queryParams.put("previous", this.previous == null ? null : Arrays.asList(this.previous));
    queryParams.put("nodeIP", this.nodeIP == null ? null : Arrays.asList(this.nodeIP));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.nodeIP == null) {
      return false;
    }
    return true;
  }

  public ModelsListQueueResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsListQueueResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("next", "None");
    result.put("previous", "None");
    result.put("nodeIP", "None");
    return result;
  }
}
