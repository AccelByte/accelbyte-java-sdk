/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.app_ui;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UploadAppUIFile
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:APPUI [UPDATE]`
 *
 * <p>Uploads a ZIP archive containing App UI static assets (HTML, CSS, JS, etc.). Files are stored
 * in S3 and served with immutable caching.
 */
@Getter
@Setter
public class UploadAppUIFile extends Operation {
  /** generated field's value */
  private String path = "/csm/v1/admin/namespaces/{namespace}/app-ui/{appUiName}/files/upload";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String appUiName;

  private String namespace;
  private String version;
  private File file;

  /**
   * @param appUiName required
   * @param namespace required
   * @param file required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UploadAppUIFile(String appUiName, String namespace, String version, File file) {
    this.appUiName = appUiName;
    this.namespace = namespace;
    this.version = version;
    this.file = file;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.appUiName != null) {
      pathParams.put("appUiName", this.appUiName);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("version", this.version == null ? null : Arrays.asList(this.version));
    return queryParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.file != null) {
      formDataParams.put("file", this.file);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.appUiName == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.file == null) {
      return false;
    }
    return true;
  }

  public ApimodelUploadFileResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelUploadFileResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("version", "None");
    return result;
  }
}
