/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.image_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteImagePatch
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint will delete an image patch that specified in the request parameter
 */
@Getter
@Setter
public class DeleteImagePatch extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/namespaces/{namespace}/images/patches";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String imageURI;
  private String version;
  private String versionPatch;

  /**
   * @param namespace required
   * @param imageURI required
   * @param version required
   * @param versionPatch required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteImagePatch(String namespace, String imageURI, String version, String versionPatch) {
    this.namespace = namespace;
    this.imageURI = imageURI;
    this.version = version;
    this.versionPatch = versionPatch;

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
    queryParams.put("imageURI", this.imageURI == null ? null : Arrays.asList(this.imageURI));
    queryParams.put("version", this.version == null ? null : Arrays.asList(this.version));
    queryParams.put(
        "versionPatch", this.versionPatch == null ? null : Arrays.asList(this.versionPatch));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.imageURI == null) {
      return false;
    }
    if (this.version == null) {
      return false;
    }
    if (this.versionPatch == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("imageURI", "None");
    result.put("version", "None");
    result.put("versionPatch", "None");
    return result;
  }
}
