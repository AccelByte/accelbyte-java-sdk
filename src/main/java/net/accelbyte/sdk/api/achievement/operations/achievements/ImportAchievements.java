/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.achievements;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ImportAchievements
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [UPDATE]
 *
 * <p>Required Scope: social
 *
 * <p>Import achievement configuration from file. It will merge with existing achievement. Available
 * import strategy: - leaveOut: if achievement with same key exist, the existing will be used and
 * imported one will be ignored (default) - replace: if achievement with same key exist, the
 * imported achievement will be used and existing one will be removed
 */
@Getter
@Setter
public class ImportAchievements extends Operation {
  /** generated field's value */
  private String path = "/achievement/v1/admin/namespaces/{namespace}/achievements/import";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private File file;
  private String strategy;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ImportAchievements(String namespace, File file, String strategy) {
    this.namespace = namespace;
    this.file = file;
    this.strategy = strategy;

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
    if (this.strategy != null) {
      formDataParams.put("strategy", this.strategy);
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

  public ServiceImportConfigResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ServiceImportConfigResponse().createFromJson(json);
  }
}
