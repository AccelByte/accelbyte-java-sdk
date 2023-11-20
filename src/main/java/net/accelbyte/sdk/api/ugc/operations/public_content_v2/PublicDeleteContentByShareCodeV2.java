/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_content_v2;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicDeleteContentByShareCodeV2
 *
 * <p>Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENT [DELETE].
 */
@Getter
@Setter
public class PublicDeleteContentByShareCodeV2 extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v2/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/sharecodes/{shareCode}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String channelId;

  private String namespace;
  private String shareCode;
  private String userId;

  /**
   * @param channelId required
   * @param namespace required
   * @param shareCode required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicDeleteContentByShareCodeV2(
      String channelId, String namespace, String shareCode, String userId) {
    this.channelId = channelId;
    this.namespace = namespace;
    this.shareCode = shareCode;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.channelId != null) {
      pathParams.put("channelId", this.channelId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.shareCode != null) {
      pathParams.put("shareCode", this.shareCode);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.channelId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.shareCode == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
