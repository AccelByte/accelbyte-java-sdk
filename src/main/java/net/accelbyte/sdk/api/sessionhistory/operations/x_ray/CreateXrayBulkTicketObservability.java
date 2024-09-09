/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.operations.x_ray;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createXrayBulkTicketObservability
 *
 * <p>Create bulk ticket observability request Request body details (all attributes are optional):
 * Timestamp : timestamp when calling this endpoint Action : support one of the following value: 1.
 * "matchFound" 2. "matchNotFound" 3. "flexed" PartyID : ticket Party ID MatchID : match ID will be
 * filled only when match found Namespace : ticket current namespace GameMode : ticket current
 * matchpool ActiveAllianceRule : current active alliance ruleset ActiveMatchingRule : current
 * active matching ruleset Function : name of the function that called the endpoint Iteration :
 * total iteration before match found TimeToMatchSec : time to match (in seconds) will be filled
 * only when match found UnmatchReason : reason when unable to find match RemainingTickets :
 * remaining ticket when unable to find match RemainingPlayersPerTicket : remaining players when
 * unable to find match UnbackfillReason : reason when unable to backfill IsBackfillMatch : flag to
 * distinguish between new match and backfill match IsRuleSetFlexed : flag if ruleset is getting
 * flexed TickID : tick id for the matchmaking tick SessionTickID : session tick id for
 * differentiate session when doing matches
 */
@Getter
@Setter
public class CreateXrayBulkTicketObservability extends Operation {
  /** generated field's value */
  private String path = "/sessionhistory/v2/admin/namespaces/{namespace}/xray/tickets/bulk";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApimodelsXRayBulkTicketObservabilityRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateXrayBulkTicketObservability(
      String namespace, ApimodelsXRayBulkTicketObservabilityRequest body) {
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
  public ApimodelsXRayBulkTicketObservabilityRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsXRayBulkTicketObservabilityResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsXRayBulkTicketObservabilityResponse().createFromJson(json);
  }
}
