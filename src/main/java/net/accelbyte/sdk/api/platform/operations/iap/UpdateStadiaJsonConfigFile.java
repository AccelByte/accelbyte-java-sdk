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
 * updateStadiaJsonConfigFile
 *
 * <p>Upload stadia json config file. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:IAP:CONFIG", action=4 (UPDATE) *
 * Returns : updated stadia iap config
 */
@Getter
@Setter
public class UpdateStadiaJsonConfigFile extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/iap/config/stadia/cert";

  private String method = "PUT";
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
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public UpdateStadiaJsonConfigFile(String namespace, File file) {
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

  public StadiaIAPConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new StadiaIAPConfigInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
