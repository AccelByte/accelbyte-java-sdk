/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.session_storage;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicUpdateInsertPartySessionStorageReserved
 *
 * <p>**For Internal Use Only** Update Insert Party Session Reserved Storage User. User can only
 * update or insert their own reserve storage (non-immutable). can store generic json example json
 * can store : ``` { "key": "value", "number": 123, } ``` The data will be stored on the "reserved"
 * storage field example stored data : ``` { "reserved": { "userID1": {"key": "value"}, "userID2":
 * {"key": "value"}, ... } } ```
 */
@Getter
@Setter
public class PublicUpdateInsertPartySessionStorageReserved extends Operation {
  /** generated field's value */
  private String path =
      "/session/v1/public/namespaces/{namespace}/parties/{partyId}/storage/users/{userId}/reserved";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String partyId;
  private String userId;
  private Map<String, ?> body;

  /**
   * @param namespace required
   * @param partyId required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpdateInsertPartySessionStorageReserved(
      String namespace, String partyId, String userId, Map<String, ?> body) {
    this.namespace = namespace;
    this.partyId = partyId;
    this.userId = userId;
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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, ?> getBodyParams() {
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
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public Map<String, ?> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
  }
}
