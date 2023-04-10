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
 * ImportImages
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint import a dedicated servers images in a namespace.
 *
 * <p>The image will be upsert. Existing version will be replaced with imported image, will create
 * new one if not found.
 *
 * <p>Example data inside imported file [ { "namespace": "dewa", "image":
 * "123456789.dkr.ecr.us-west-2.amazonaws.com/ds-dewa:0.0.1-alpha", "version": "0.0.1",
 * "persistent": true } ]
 */
@Getter
@Setter
public class ImportImages extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/images/import";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private File file;

  /**
   * @param file required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ImportImages(File file) {
    this.file = file;

    securities.add("Bearer");
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
    if (this.file == null) {
      return false;
    }
    return true;
  }

  public ModelsImportResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsImportResponse().createFromJson(json);
  }
}
