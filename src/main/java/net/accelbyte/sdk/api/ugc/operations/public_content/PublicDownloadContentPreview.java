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
 * PublicDownloadContentPreview
 *
 * <p>Requires valid user token
 *
 * <p>NOTE: Preview is Legacy Code, please use Screenshot for better solution to display preview of
 * a content
 */
@Getter
@Setter
public class PublicDownloadContentPreview extends Operation {
  /** generated field's value */
  private String path = "/ugc/v1/public/namespaces/{namespace}/contents/{contentId}/preview";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String contentId;

  private String namespace;

  /**
   * @param contentId required
   * @param namespace required
   */
  @Builder
  public PublicDownloadContentPreview(String contentId, String namespace) {
    this.contentId = contentId;
    this.namespace = namespace;

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
    return true;
  }

  public ModelsGetContentPreviewResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsGetContentPreviewResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
