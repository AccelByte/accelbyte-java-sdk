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
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * CreateImage
 *
 * <p>``` Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE] Required scope:
 * social
 *
 * <p>This endpoint will create image.
 *
 * <p>Sample image: { "namespace":"dewa", "version":"1.0.0",
 * "image":"144436415367.dkr.ecr.us-west-2.amazonaws.com/dewa:1.0.0", "persistent":false } ```
 */
@Getter
@Setter
public class CreateImage extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/images";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private ModelsCreateImageRequest body;

  /**
   * @param body required
   */
  @Builder
  public CreateImage(ModelsCreateImageRequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelsCreateImageRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
