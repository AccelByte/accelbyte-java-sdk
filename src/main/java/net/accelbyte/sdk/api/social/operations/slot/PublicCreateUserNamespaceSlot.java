/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.slot;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicCreateUserNamespaceSlot
 *
 * <p>Creates a slot. Other detail info: * Required permission :
 * resource="NAMESPACE:{namespace}:USER:{userId}:SLOTDATA", action=1 (CREATE) * Returns : created
 * slot info
 */
@Getter
@Setter
public class PublicCreateUserNamespaceSlot extends Operation {
  /** generated field's value */
  private String path = "/social/public/namespaces/{namespace}/users/{userId}/slots";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String label;
  private List<String> tags;
  private String checksum;
  private String customAttribute;
  private File file;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicCreateUserNamespaceSlot(
      String namespace,
      String userId,
      String label,
      List<String> tags,
      String checksum,
      String customAttribute,
      File file) {
    this.namespace = namespace;
    this.userId = userId;
    this.label = label;
    this.tags = tags;
    this.checksum = checksum;
    this.customAttribute = customAttribute;
    this.file = file;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("label", this.label == null ? null : Arrays.asList(this.label));
    queryParams.put("tags", this.tags == null ? null : this.tags);
    return queryParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.checksum != null) {
      formDataParams.put("checksum", this.checksum);
    }
    if (this.customAttribute != null) {
      formDataParams.put("customAttribute", this.customAttribute);
    }
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
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("label", "None");
    result.put("tags", "multi");
    return result;
  }
}
