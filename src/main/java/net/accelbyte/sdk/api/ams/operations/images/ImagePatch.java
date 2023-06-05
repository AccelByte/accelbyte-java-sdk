/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.images;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ImagePatch
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [UPDATE]
 */
@Getter
@Setter
public class ImagePatch extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/images/{imageID}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String imageID;

  private String namespace;
  private ApiImageUpdate body;

  /**
   * @param imageID required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ImagePatch(String imageID, String namespace, ApiImageUpdate body) {
    this.imageID = imageID;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.imageID != null) {
      pathParams.put("imageID", this.imageID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApiImageUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.imageID == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApiImageDetails parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiImageDetails().createFromJson(json);
  }
}
