/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.file_upload;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * generatedUploadUrl
 *
 * <p>Generate an upload URL. It's valid for 10 minutes. Other detail info:
 *
 * <p>* Required permission : resource = "ADMIN:NAMESPACE:{namespace}:FILEUPLOAD" , action=1
 * (CREATE) * Action code : 11101 * Returns : URL data
 */
@Getter
@Setter
public class GeneratedUploadUrl extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/admin/namespaces/{namespace}/folders/{folder}/files";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String folder;

  private String namespace;
  private String fileType;

  /**
   * @param folder required
   * @param namespace required
   * @param fileType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GeneratedUploadUrl(String folder, String namespace, String fileType) {
    this.folder = folder;
    this.namespace = namespace;
    this.fileType = fileType;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.folder != null) {
      pathParams.put("folder", this.folder);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("fileType", this.fileType == null ? null : Arrays.asList(this.fileType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.folder == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.fileType == null) {
      return false;
    }
    return true;
  }

  public FileUploadUrlInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FileUploadUrlInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("fileType", "None");
    return result;
  }
}
