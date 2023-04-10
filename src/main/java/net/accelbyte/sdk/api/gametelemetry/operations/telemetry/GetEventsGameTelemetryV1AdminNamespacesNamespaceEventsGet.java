/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.telemetry;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/** get_events_game_telemetry_v1_admin_namespaces__namespace__events_get */
@Getter
@Setter
public class GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet extends Operation {
  /** generated field's value */
  private String path = "/game-telemetry/v1/admin/namespaces/{namespace}/events";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String endTime;
  private String eventId;
  private String eventName;
  private String eventPayload;
  private Integer limit;
  private Integer offset;
  private String startTime;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet(
      String namespace,
      String endTime,
      String eventId,
      String eventName,
      String eventPayload,
      Integer limit,
      Integer offset,
      String startTime) {
    this.namespace = namespace;
    this.endTime = endTime;
    this.eventId = eventId;
    this.eventName = eventName;
    this.eventPayload = eventPayload;
    this.limit = limit;
    this.offset = offset;
    this.startTime = startTime;

    securities.add("Bearer");
    securities.add("Cookie");
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
    queryParams.put("endTime", this.endTime == null ? null : Arrays.asList(this.endTime));
    queryParams.put("eventId", this.eventId == null ? null : Arrays.asList(this.eventId));
    queryParams.put("eventName", this.eventName == null ? null : Arrays.asList(this.eventName));
    queryParams.put(
        "eventPayload", this.eventPayload == null ? null : Arrays.asList(this.eventPayload));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endTime", "None");
    result.put("eventId", "None");
    result.put("eventName", "None");
    result.put("eventPayload", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("startTime", "None");
    return result;
  }
}
