/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicQueryMyGameSessions
 *
 * <p>Query user's game sessions. By default, API will return a list of user's active game sessions
 * (INVITED,JOINED,CONNECTED).
 *
 * <p>Session service has several DSInformation status to track DS request to DSMC: -
 * NEED_TO_REQUEST: number of active players hasn't reached session's minPlayers therefore DS has
 * not yet requested. - REQUESTED: DS is being requested to DSMC. - AVAILABLE: DS is ready to use.
 * The DSMC status for this DS is either READY/BUSY. - FAILED_TO_REQUEST: DSMC fails to create the
 * DS.
 */
@Getter
@Setter
public class PublicQueryMyGameSessions extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/users/me/gamesessions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String order;
  private String orderBy;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicQueryMyGameSessions(String namespace, String order, String orderBy, String status) {
    this.namespace = namespace;
    this.order = order;
    this.orderBy = orderBy;
    this.status = status;

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
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("orderBy", this.orderBy == null ? null : Arrays.asList(this.orderBy));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<ApimodelsGameSessionResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsGameSessionResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("order", "None");
    result.put("orderBy", "None");
    result.put("status", "None");
    return result;
  }
}
