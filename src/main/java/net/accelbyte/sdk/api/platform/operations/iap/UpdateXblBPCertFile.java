/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateXblBPCertFile
 *
 * <p>Upload xbl business partner cert file. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:IAP:CONFIG", action=4 (UPDATE) *
 * Returns : updated xbl iap config
 */
@Getter
@Setter
public class UpdateXblBPCertFile extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/iap/config/xbl/cert";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private File file;
  private String password;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateXblBPCertFile(String namespace, File file, String password) {
    this.namespace = namespace;
    this.file = file;
    this.password = password;

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
    if (this.password != null) {
      formDataParams.put("password", this.password);
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

  public XblIAPConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new XblIAPConfigInfo().createFromJson(json);
  }
}
