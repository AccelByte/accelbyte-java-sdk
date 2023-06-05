/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers;

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
 * listTerminatedServers
 *
 * <p>``` Required permission: ADMIN:NAMESPACE:{namespace}:DSLM:SERVER [READ]
 *
 * <p>This endpoint used to retrieve terminated servers in a namespace ```
 */
@Getter
@Setter
public class ListTerminatedServers extends Operation {
  /** generated field's value */
  private String path = "/dslogmanager/namespaces/{namespace}/servers/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json", "text/x-log");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String deployment;
  private String endDate;
  private String gameMode;
  private Integer limit;
  private String next;
  private String partyId;
  private String podName;
  private String previous;
  private String provider;
  private String region;
  private String sessionId;
  private String startDate;
  private String status;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListTerminatedServers(
      String namespace,
      String deployment,
      String endDate,
      String gameMode,
      Integer limit,
      String next,
      String partyId,
      String podName,
      String previous,
      String provider,
      String region,
      String sessionId,
      String startDate,
      String status,
      String userId) {
    this.namespace = namespace;
    this.deployment = deployment;
    this.endDate = endDate;
    this.gameMode = gameMode;
    this.limit = limit;
    this.next = next;
    this.partyId = partyId;
    this.podName = podName;
    this.previous = previous;
    this.provider = provider;
    this.region = region;
    this.sessionId = sessionId;
    this.startDate = startDate;
    this.status = status;
    this.userId = userId;

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
    queryParams.put("deployment", this.deployment == null ? null : Arrays.asList(this.deployment));
    queryParams.put("end_date", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("game_mode", this.gameMode == null ? null : Arrays.asList(this.gameMode));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("next", this.next == null ? null : Arrays.asList(this.next));
    queryParams.put("party_id", this.partyId == null ? null : Arrays.asList(this.partyId));
    queryParams.put("pod_name", this.podName == null ? null : Arrays.asList(this.podName));
    queryParams.put("previous", this.previous == null ? null : Arrays.asList(this.previous));
    queryParams.put("provider", this.provider == null ? null : Arrays.asList(this.provider));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("session_id", this.sessionId == null ? null : Arrays.asList(this.sessionId));
    queryParams.put("start_date", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("user_id", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsListTerminatedServersResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsListTerminatedServersResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("deployment", "None");
    result.put("end_date", "None");
    result.put("game_mode", "None");
    result.put("limit", "None");
    result.put("next", "None");
    result.put("party_id", "None");
    result.put("pod_name", "None");
    result.put("previous", "None");
    result.put("provider", "None");
    result.put("region", "None");
    result.put("session_id", "None");
    result.put("start_date", "None");
    result.put("status", "None");
    result.put("user_id", "None");
    return result;
  }
}
