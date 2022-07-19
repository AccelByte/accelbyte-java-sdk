/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.party;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicGetPartyDataV1
 *
 * <p>Required valid user authorization
 *
 * <p>load personal party data in a namespace based on Party ID
 *
 * <p>Action Code: 50101
 */
@Getter
@Setter
public class PublicGetPartyDataV1 extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/public/party/namespaces/{namespace}/parties/{partyId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String partyId;

  /**
   * @param namespace required
   * @param partyId required
   */
  @Builder
  public PublicGetPartyDataV1(String namespace, String partyId) {
    this.namespace = namespace;
    this.partyId = partyId;

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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.partyId == null) {
      return false;
    }
    return true;
  }

  public ModelsPartyData parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsPartyData().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
