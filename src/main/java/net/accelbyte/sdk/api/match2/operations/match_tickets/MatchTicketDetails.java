/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operations.match_tickets;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * MatchTicketDetails
 *
 * <p>Required Permission: NAMESPACE:{namespace}:MATCHMAKING:TICKET [READ]
 *
 * <p>Required Scope: social
 *
 * <p>Get details for a specific match ticket
 */
@Getter
@Setter
public class MatchTicketDetails extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/match-tickets/{ticketid}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String ticketid;

  /**
   * @param namespace required
   * @param ticketid required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public MatchTicketDetails(String namespace, String ticketid) {
    this.namespace = namespace;
    this.ticketid = ticketid;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.ticketid != null) {
      pathParams.put("ticketid", this.ticketid);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.ticketid == null) {
      return false;
    }
    return true;
  }

  public ApiMatchTicketStatus parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiMatchTicketStatus().createFromJson(json);
  }
}
