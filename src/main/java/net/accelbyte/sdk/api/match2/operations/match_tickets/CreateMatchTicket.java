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
 * CreateMatchTicket
 *
 * <p>Creates a new request for matchmaking.
 *
 * <p>Cross Platform: Allow player to play game with "all" registered platforms. 1. Cross Platform
 * can be enabled through session service or create match ticket. a. via ticket: specify several
 * cross_platform on create match ticket attributes. **[DEPRECATED]** client should not send from
 * attribute `cross_platform` will be populated from backend This value will override player
 * attributes in session service. e.g. cross_platform:[xbox,psn,steam] b. via session service: set
 * player/party cross_platform attributes. c. Enable match options ruleset with name cross_platform
 * and type "all". ``` { "name": "co-op", "data": { "alliance": { "min_number": 1, "max_number": 1,
 * "player_min_number": 1, "player_max_number": 4 }, "match_options": { "options": [ {"name":
 * "cross_platform", "type": "all"} ] } } } ``` 2. Cross Platform can be disabled from the matchpool
 * configuration `crossplay_disabled=true` 3. When matchpool `crossplay_disabled=false` * request
 * attribute cross_platform is empty **[Recommended]**: * Matchmaking will consider Party leader
 * `crossplayEnabled` preference or Session attribute `crossplayEnabled` preference. * When
 * `crossplayEnabled=true` `cross_platforms` attributes will be populated from [active login
 * methods](/iam/apidocs/#/Third%20Party%20Credential/RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3)
 * otherwise it will set to leader current platform * When `crossplayEnabled=false`
 * `cross_platforms` attributes will be set to user's currentPlatform * request attribute
 * cross_platform is not empty **[Not Recommended]**: * Cross Platform can be disabled with specify
 * only ONE cross_platform. Current matchmaking use this behavior. e.g. cross_platform:[xbox] *
 * Multiple cross_platform values is considered to be crossplay enabled 4. This behavior only works
 * for Default Matchmaker. Custom matchmaker (custom gRPC matchmaker) need to consider this on its
 * own implementation.
 *
 * <p>ExcludedSessions: allow player to list out game sessions that they want to avoid matching, for
 * example a match that they've recently left or get kicked out from.
 */
@Getter
@Setter
public class CreateMatchTicket extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/match-tickets";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApiMatchTicketRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateMatchTicket(String namespace, ApiMatchTicketRequest body) {
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
  public ApiMatchTicketRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApiMatchTicketResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiMatchTicketResponse().createFromJson(json);
  }
}
