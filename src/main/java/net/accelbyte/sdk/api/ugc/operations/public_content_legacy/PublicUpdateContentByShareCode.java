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
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicUpdateContentByShareCode
 *
 * <p>Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENT [UPDATE].
 *
 * <p>All request body are required except `payload`, `preview`, `tags`,`contentType`,
 * `updateContentFile`, `customAttributes` and `shareCode`.
 *
 * <p>`contentType` values is used to enforce the Content-Type header needed by the client to upload
 * the content using the S3 presigned URL.
 *
 * <p>If not specified, it will use `fileExtension` value.
 *
 * <p>To update content file, set `updateContentFile` to `true` and upload the file using URL in
 * `payloadURL.url` in response body.
 *
 * <p>NOTE: Preview is Legacy Code, please use Screenshot for better solution to display preview of
 * a content
 */
@Getter
@Setter
public class PublicUpdateContentByShareCode extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/s3/sharecodes/{shareCode}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String channelId;

  private String namespace;
  private String shareCode;
  private String userId;
  private ModelsUpdateContentRequest body;

  /**
   * @param channelId required
   * @param namespace required
   * @param shareCode required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpdateContentByShareCode(
      String channelId,
      String namespace,
      String shareCode,
      String userId,
      ModelsUpdateContentRequest body) {
    this.channelId = channelId;
    this.namespace = namespace;
    this.shareCode = shareCode;
    this.userId = userId;
    this.body = body;

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
  public ModelsUpdateContentRequest getBodyParams() {
    return this.body;
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

  public ModelsCreateContentResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsCreateContentResponse().createFromJson(json);
  }
}
