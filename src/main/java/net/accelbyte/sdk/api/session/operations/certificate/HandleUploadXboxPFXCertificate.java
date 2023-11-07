/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.certificate;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * HandleUploadXboxPFXCertificate
 *
 * <p>Upload certificates for xbox. Certificate must be in the valid form of PFX format.
 */
@Getter
@Setter
public class HandleUploadXboxPFXCertificate extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/certificates/pfx/platforms/xbl";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String description;
  private String certname;
  private File file;
  private String password;

  /**
   * @param namespace required
   * @param certname required
   * @param file required
   * @param password required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public HandleUploadXboxPFXCertificate(
      String namespace, String description, String certname, File file, String password) {
    this.namespace = namespace;
    this.description = description;
    this.certname = certname;
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
    if (this.description != null) {
      formDataParams.put("description", this.description);
    }
    if (this.certname != null) {
      formDataParams.put("certname", this.certname);
    }
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
    if (this.certname == null) {
      return false;
    }
    if (this.file == null) {
      return false;
    }
    if (this.password == null) {
      return false;
    }
    return true;
  }

  public ModelsPlatformCredentials parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPlatformCredentials().createFromJson(json);
  }
}
