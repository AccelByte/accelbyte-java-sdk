/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.reward;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * importRewards
 *
 * <p>Import reward configurations for a given namespace from file. At current, only JSON file is
 * supported.
 *
 * <p>Other detail info:
 *
 * <p>* *Required permission*: resource="ADMIN:NAMESPACE:{namespace}:REWARD", action=1 (CREATE)
 */
@Getter
@Setter
public class ImportRewards extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/rewards/import";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean replaceExisting;
  private File file;

  /**
   * @param namespace required
   * @param replaceExisting required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ImportRewards(String namespace, Boolean replaceExisting, File file) {
    this.namespace = namespace;
    this.replaceExisting = replaceExisting;
    this.file = file;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "replaceExisting",
        this.replaceExisting == null ? null : Arrays.asList(String.valueOf(this.replaceExisting)));
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
    if (this.namespace == null) {
      return false;
    }
    if (this.replaceExisting == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("replaceExisting", "None");
    return result;
  }
}
