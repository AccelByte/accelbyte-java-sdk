/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateContentRequestS3;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateContentResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SingleAdminUpdateContentS3
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [UPDATE].
 *
 * <p>All request body are required except payload, preview, tags, and contentType. contentType
 * values is used to enforce the Content-Type header needed by the client to upload the content
 * using the S3 presigned URL. If not specified, it will use fileExtension value.
 */
@Getter
@Setter
public class SingleAdminUpdateContentS3 extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/s3/{contentId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String channelId;

  private String contentId;
  private String namespace;
  private ModelsCreateContentRequestS3 body;

  /**
   * @param channelId required
   * @param contentId required
   * @param namespace required
   * @param body required
   */
  @Builder
  public SingleAdminUpdateContentS3(
      String channelId, String contentId, String namespace, ModelsCreateContentRequestS3 body) {
    this.channelId = channelId;
    this.contentId = contentId;
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
    if (this.contentId != null) {
      pathParams.put("contentId", this.contentId);
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
    if (this.contentId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsCreateContentResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsCreateContentResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
