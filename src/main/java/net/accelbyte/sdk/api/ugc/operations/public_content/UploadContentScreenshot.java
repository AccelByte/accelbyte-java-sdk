/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_content;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UploadContentScreenshot
 *
 * <p>Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENT [CREATE].
 *
 * <p>All request body are required except for contentType field. contentType values is used to
 * enforce the Content-Type header needed by the client to upload the content using the presigned
 * URL. If not specified, it will use fileExtension value. Supported file extensions: pjp, jpg,
 * jpeg, jfif, bmp, png.
 *
 * <p>Maximum description length: 1024.
 */
@Getter
@Setter
public class UploadContentScreenshot extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents/{contentId}/screenshots";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String contentId;

  private String namespace;
  private String userId;
  private ModelsCreateScreenshotRequest body;

  /**
   * @param contentId required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UploadContentScreenshot(
      String contentId, String namespace, String userId, ModelsCreateScreenshotRequest body) {
    this.contentId = contentId;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelsCreateScreenshotRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.contentId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelsCreateScreenshotResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsCreateScreenshotResponse().createFromJson(json);
  }
}
