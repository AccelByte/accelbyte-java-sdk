/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_roles;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateMemberRolePublicV1
 *
 * <p>Required Member Role Permission: "GROUP:ROLE [UPDATE]
 *
 * <p>This endpoint is used to assign role to group member
 *
 * <p>Action Code: 73204
 */
@Getter
@Setter
public class UpdateMemberRolePublicV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/public/namespaces/{namespace}/roles/{memberRoleId}/members";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String memberRoleId;

  private String namespace;
  private ModelsAssignRoleToMemberRequestV1 body;

  /**
   * @param memberRoleId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateMemberRolePublicV1(
      String memberRoleId, String namespace, ModelsAssignRoleToMemberRequestV1 body) {
    this.memberRoleId = memberRoleId;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.memberRoleId != null) {
      pathParams.put("memberRoleId", this.memberRoleId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsAssignRoleToMemberRequestV1 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.memberRoleId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelsGetUserGroupInformationResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGetUserGroupInformationResponseV1().createFromJson(json);
  }
}
