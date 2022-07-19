/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminImportConfigV1
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:LOBBY:CONFIG [UPDATE]
 *
 * <p>Required Scope: social
 *
 * <p>Import config configuration from file. The existing configuration will be replaced. The json
 * file to import can be obtained from the /export endpoint.
 */
@Getter
@Setter
public class AdminImportConfigV1 extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/admin/config/namespaces/{namespace}/import";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private File file;

  /**
   * @param namespace required
   */
  @Builder
  public AdminImportConfigV1(String namespace, File file) {
    this.namespace = namespace;
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
    return true;
  }

  public ModelsImportConfigResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsImportConfigResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
