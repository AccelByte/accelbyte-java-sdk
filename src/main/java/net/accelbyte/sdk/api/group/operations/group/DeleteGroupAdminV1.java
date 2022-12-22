/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * deleteGroupAdminV1
 *
 * <p>Required Permission: "ADMIN:NAMESPACE:{namespace}:GROUP:{groupId} [DELETE]"
 *
 * <p>Delete existing group. It will check whether the groupID is exist before doing the process to
 * delete the group.
 *
 * <p>Action Code: 73302
 */
@Getter
@Setter
public class DeleteGroupAdminV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/admin/namespaces/{namespace}/groups/{groupId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String groupId;

  private String namespace;

  /**
   * @param groupId required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteGroupAdminV1(String groupId, String namespace) {
    this.groupId = groupId;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.groupId != null) {
      pathParams.put("groupId", this.groupId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.groupId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
