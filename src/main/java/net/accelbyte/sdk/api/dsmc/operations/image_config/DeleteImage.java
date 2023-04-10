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
 * DeleteImage
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 *
 * <p>Required scope: social.
 *
 * <p>This endpoint will delete an image that specified in the request parameter.
 *
 * <p>Default image is cannot be deleted and will throw error 422 (Unprocessable entity).
 */
@Getter
@Setter
public class DeleteImage extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/namespaces/{namespace}/images";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String imageURI;
  private String version;

  /**
   * @param namespace required
   * @param imageURI required
   * @param version required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteImage(String namespace, String imageURI, String version) {
    this.namespace = namespace;
    this.imageURI = imageURI;
    this.version = version;

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
    return result;
  }
}
