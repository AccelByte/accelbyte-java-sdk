/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.party;

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
 * publicUpdateParty
 *
 * <p>Updates party blob, this endpoint will override stored party data.
 *
 * <p>Join type can only be updated by the party's leader. To update only specified fields, please
 * use following endpoint: method : PATCH API :
 * /session/v1/public/namespaces/{namespace}/gamesessions/{sessionId}
 *
 * <p>Reserved attributes key: 1. preference: used to store preference of the leader and it is
 * non-replaceable to keep the initial behavior of the session regardless the leader changes. 2.
 * NATIVESESSIONTITLE: used for session sync, to define name of session displayed on PlayStation
 * system UI. - ttlHours is how long the session will active, max value is 168 hours
 */
@Getter
@Setter
public class PublicUpdateParty extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/parties/{partyId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String partyId;
  private ApimodelsUpdatePartyRequest body;

  /**
   * @param namespace required
   * @param partyId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpdateParty(String namespace, String partyId, ApimodelsUpdatePartyRequest body) {
    this.namespace = namespace;
    this.partyId = partyId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.partyId != null) {
      pathParams.put("partyId", this.partyId);
    }
    return pathParams;
  }

  @Override
  public ApimodelsUpdatePartyRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.partyId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApimodelsPartySessionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsPartySessionResponse().createFromJson(json);
  }
}
