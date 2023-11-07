/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content_v2;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminDeleteContentScreenshotV2
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [DELETE].
 */
@Getter
@Setter
public class AdminDeleteContentScreenshotV2 extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v2/admin/namespaces/{namespace}/contents/{contentId}/screenshots/{screenshotId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String contentId;

  private String namespace;
  private String screenshotId;

  /**
   * @param contentId required
   * @param namespace required
   * @param screenshotId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDeleteContentScreenshotV2(String contentId, String namespace, String screenshotId) {
    this.contentId = contentId;
    this.namespace = namespace;
    this.screenshotId = screenshotId;

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
