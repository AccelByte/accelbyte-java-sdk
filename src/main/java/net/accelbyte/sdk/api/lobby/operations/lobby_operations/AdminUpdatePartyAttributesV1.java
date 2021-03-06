/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.lobby_operations;

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
 * adminUpdatePartyAttributesV1
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:PARTY:STORAGE [UPDATE]` with scope `social`
 *
 * <p>update party attributes in a namespace.
 */
@Getter
@Setter
public class AdminUpdatePartyAttributesV1 extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/admin/party/namespaces/{namespace}/parties/{partyId}/attributes";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String partyId;
  private ModelsPartyPUTCustomAttributesRequest body;

  /**
   * @param namespace required
   * @param partyId required
   * @param body required
   */
  @Builder
  public AdminUpdatePartyAttributesV1(
      String namespace, String partyId, ModelsPartyPUTCustomAttributesRequest body) {
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
  public ModelsPartyPUTCustomAttributesRequest getBodyParams() {
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
