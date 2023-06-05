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
 * updateMemberRolePermissionAdminV1
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:GROUP:ROLE [UPDATE]
 *
 * <p>This endpoint is used to update member role permission. It will replace the existing
 * permission based on the request from this endpoint
 *
 * <p>Action Code: 73205
 *
 * <p>memberRolePermissions example value :
 *
 * <p>"action": 2
 *
 * <p>"resourceName": "GROUP:ROLE"
 *
 * <p>The changes will update user role to be able to read a role of other member
 */
@Getter
@Setter
public class UpdateMemberRolePermissionAdminV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}/permissions";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String memberRoleId;

  private String namespace;
  private ModelsUpdateMemberRolePermissionsRequestV1 body;

  /**
   * @param memberRoleId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateMemberRolePermissionAdminV1(
      String memberRoleId, String namespace, ModelsUpdateMemberRolePermissionsRequestV1 body) {
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
  public ModelsUpdateMemberRolePermissionsRequestV1 getBodyParams() {
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
    return true;
  }

  public ModelsMemberRoleResponseV1 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsMemberRoleResponseV1().createFromJson(json);
  }
}
