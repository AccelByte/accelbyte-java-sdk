/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.slot;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicGetSlotData
 *
 * <p>Get slot data. Other detail info: * Required permission :
 * resource="NAMESPACE:{namespace}:USER:{userId}:SLOTDATA", action=2 (READ) * Returns : slot data
 */
@Getter
@Setter
public class PublicGetSlotData extends Operation {
  /** generated field's value */
  private String path = "/social/public/namespaces/{namespace}/users/{userId}/slots/{slotId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/octet-stream");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String slotId;
  private String userId;

  /**
   * @param namespace required
   * @param slotId required
   * @param userId required
   */
  @Builder
  public PublicGetSlotData(String namespace, String slotId, String userId) {
    this.namespace = namespace;
    this.slotId = slotId;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.slotId != null) {
      pathParams.put("slotId", this.slotId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.slotId == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public InputStream parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return payload;
    }
    throw new HttpResponseException(code, json);
  }
}
