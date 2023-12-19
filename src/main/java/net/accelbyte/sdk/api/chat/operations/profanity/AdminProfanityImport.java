/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.profanity;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminProfanityImport
 *
 * <p>Import profanity words
 */
@Getter
@Setter
public class AdminProfanityImport extends Operation {
  /** generated field's value */
  private String path = "/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/import";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String action;
  private Boolean showResult;
  private File file;

  /**
   * @param namespace required
   * @param file required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminProfanityImport(String namespace, String action, Boolean showResult, File file) {
    this.namespace = namespace;
    this.action = action;
    this.showResult = showResult;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("action", this.action == null ? null : Arrays.asList(this.action));
    queryParams.put(
        "showResult",
        this.showResult == null ? null : Arrays.asList(String.valueOf(this.showResult)));
    return queryParams;
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
    if (this.file == null) {
      return false;
    }
    return true;
  }

  public ModelsDictionaryImportResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDictionaryImportResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("action", "None");
    result.put("showResult", "None");
    return result;
  }

  public enum Action {
    FULLREPLACE("FULLREPLACE"),
    LEAVEOUT("LEAVEOUT"),
    REPLACE("REPLACE");

    private String value;

    Action(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminProfanityImportBuilder {
    private String action;

    public AdminProfanityImportBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public AdminProfanityImportBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }
  }
}
