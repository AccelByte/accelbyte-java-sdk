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
 * PublicDownloadContentByShareCode
 *
 * <p>Public user can access without token or if token specified, requires valid user token
 */
@Getter
@Setter
public class PublicDownloadContentByShareCode extends Operation {
  /** generated field's value */
  private String path = "/ugc/v1/public/namespaces/{namespace}/contents/sharecodes/{shareCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String shareCode;

  /**
   * @param namespace required
   * @param shareCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicDownloadContentByShareCode(String namespace, String shareCode) {
    this.namespace = namespace;
    this.shareCode = shareCode;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.shareCode != null) {
      pathParams.put("shareCode", this.shareCode);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.shareCode == null) {
      return false;
    }
    return true;
  }

  public ModelsContentDownloadResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsContentDownloadResponse().createFromJson(json);
  }
}
