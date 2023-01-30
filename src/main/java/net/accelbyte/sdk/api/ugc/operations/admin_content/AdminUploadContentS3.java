/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content;

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
 * AdminUploadContentS3
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [CREATE].
 *
 * <p>All request body are required except preview, tags, contentType and customAttributes.
 * contentType values is used to enforce the Content-Type header needed by the client when uploading
 * the content using the S3 presigned URL. If not specified, it will use fileExtension value.
 *
 * <p>NOTE: Preview is Legacy Code, please use Screenshot for better solution to display preview of
 * a content
 */
@Getter
@Setter
public class AdminUploadContentS3 extends Operation {
  /** generated field's value */
  private String path = "/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/s3";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String channelId;

  private String namespace;
  private ModelsCreateContentRequestS3 body;

  /**
   * @param channelId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUploadContentS3(
      String channelId, String namespace, ModelsCreateContentRequestS3 body) {
    this.channelId = channelId;
    this.namespace = namespace;
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
    return pathParams;
  }

  @Override
  public ModelsCreateContentRequestS3 getBodyParams() {
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
    return true;
  }

  public ModelsCreateContentResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsCreateContentResponse().createFromJson(json);
  }
}
