/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_content_legacy;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteContentScreenshot
 *
 * <p>Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENT [DELETE].
 */
@Getter
@Setter
public class DeleteContentScreenshot extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents/{contentId}/screenshots/{screenshotId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String contentId;

  private String namespace;
  private String screenshotId;
  private String userId;

  /**
   * @param contentId required
   * @param namespace required
   * @param screenshotId required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteContentScreenshot(
      String contentId, String namespace, String screenshotId, String userId) {
    this.contentId = contentId;
    this.namespace = namespace;
    this.screenshotId = screenshotId;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.contentId != null) {
      pathParams.put("contentId", this.contentId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.screenshotId != null) {
      pathParams.put("screenshotId", this.screenshotId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.contentId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.screenshotId == null) {
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
