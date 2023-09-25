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
 * ListContentVersions
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [READ] Content's
 * payload versions created when UGC is created or updated with `updateContentFile` set to true.
 * Only list up to 10 latest versions.
 */
@Getter
@Setter
public class ListContentVersions extends Operation {
  /** generated field's value */
  private String path = "/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}/versions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
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
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListContentVersions(String contentId, String namespace) {
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

  public ModelsListContentVersionsResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsListContentVersionsResponse().createFromJson(json);
  }
}
