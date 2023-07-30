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
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicUpdateUserNamespaceSlotMetadata
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Updates the slot metadata. Other detail info: * Required permission :
 * resource="NAMESPACE:{namespace}:USER:{userId}:SLOTDATA", action=4 (UPDATE) * Returns : updated
 * slot
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class PublicUpdateUserNamespaceSlotMetadata extends Operation {
  /** generated field's value */
  private String path =
      "/social/public/namespaces/{namespace}/users/{userId}/slots/{slotId}/metadata";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String slotId;
  private String userId;
  private SlotMetadataUpdate body;

  /**
   * @param namespace required
   * @param slotId required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpdateUserNamespaceSlotMetadata(
      String namespace, String slotId, String userId, SlotMetadataUpdate body) {
    this.namespace = namespace;
    this.slotId = slotId;
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
    if (this.slotId != null) {
      pathParams.put("slotId", this.slotId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public SlotMetadataUpdate getBodyParams() {
    return this.body;
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

  public SlotInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new SlotInfo().createFromJson(json);
  }
}
