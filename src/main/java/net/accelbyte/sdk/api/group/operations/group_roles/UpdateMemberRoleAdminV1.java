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
 * updateMemberRoleAdminV1
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:GROUP:ROLE [UPDATE]
 *
 * <p>This endpoint is used to update member role
 *
 * <p>Action Code: 73204
 */
@Getter
@Setter
public class UpdateMemberRoleAdminV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String memberRoleId;

  private String namespace;
  private ModelsUpdateMemberRoleRequestV1 body;

  /**
   * @param memberRoleId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateMemberRoleAdminV1(
      String memberRoleId, String namespace, ModelsUpdateMemberRoleRequestV1 body) {
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
  public ModelsUpdateMemberRoleRequestV1 getBodyParams() {
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
