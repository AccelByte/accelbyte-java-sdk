/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.account_idenfifier_tag;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminUpdateTagV3
 *
 * <p>Update an existing Account Identifier Tag. This endpoint allows administrators to update the
 * details of a tag that is used to identify and categorize user accounts.
 */
@Getter
@Setter
public class AdminUpdateTagV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/tags/{tagId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String tagId;
  private ModelTagUpdateRequestV3 body;

  /**
   * @param namespace required
   * @param tagId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateTagV3(String namespace, String tagId, ModelTagUpdateRequestV3 body) {
    this.namespace = namespace;
    this.tagId = tagId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.tagId != null) {
      pathParams.put("tagId", this.tagId);
    }
    return pathParams;
  }

  @Override
  public ModelTagUpdateRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.tagId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AccountcommonTagResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AccountcommonTagResponse().createFromJson(json);
  }
}
