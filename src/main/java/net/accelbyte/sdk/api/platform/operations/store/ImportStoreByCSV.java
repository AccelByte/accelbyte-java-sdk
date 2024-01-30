/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.store;

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
 * importStoreByCSV
 *
 * <p>This API is used to import a store by CSV format.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:STORE", action=4 (UPDATE)
 */
@Getter
@Setter
public class ImportStoreByCSV extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/stores/{storeId}/importByCSV";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String storeId;
  private File category;
  private File display;
  private File item;
  private String notes;
  private File section;

  /**
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ImportStoreByCSV(
      String namespace,
      String storeId,
      File category,
      File display,
      File item,
      String notes,
      File section) {
    this.namespace = namespace;
    this.storeId = storeId;
    this.category = category;
    this.display = display;
    this.item = item;
    this.notes = notes;
    this.section = section;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.storeId != null) {
      pathParams.put("storeId", this.storeId);
    }
    return pathParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.category != null) {
      formDataParams.put("category", this.category);
    }
    if (this.display != null) {
      formDataParams.put("display", this.display);
    }
    if (this.item != null) {
      formDataParams.put("item", this.item);
    }
    if (this.notes != null) {
      formDataParams.put("notes", this.notes);
    }
    if (this.section != null) {
      formDataParams.put("section", this.section);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    return true;
  }

  public ImportStoreResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ImportStoreResult().createFromJson(json);
  }
}
