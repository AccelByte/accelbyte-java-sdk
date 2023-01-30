/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_member;

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
 * inviteGroupPublicV2
 *
 * <p>Required valid user authentication
 *
 * <p>Required Member Role Permission: "GROUP:INVITE [CREATE]"
 *
 * <p>This endpoint is used to invite specific user to the group.
 *
 * <p>invite specific user to the group. If specific user is already have the join request to the
 * group, this endpoint will notify if this user already have join request that needs to be accepted
 * / rejected
 *
 * <p>Invited user will receive notification through lobby.
 *
 * <p>Action Code: 73406
 *
 * <p>memberRolePermissions example value :
 *
 * <p>"action": 1
 *
 * <p>"resourceName": "GROUP:INVITE"
 *
 * <p>The invited user will have a permission to invite another user to the group
 */
@Getter
@Setter
public class InviteGroupPublicV2 extends Operation {
  /** generated field's value */
  private String path =
      "/group/v2/public/namespaces/{namespace}/users/{userId}/groups/{groupId}/invite";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String groupId;

  private String namespace;
  private String userId;

  /**
   * @param groupId required
   * @param namespace required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public InviteGroupPublicV2(String groupId, String namespace, String userId) {
    this.groupId = groupId;
    this.namespace = namespace;
    this.userId = userId;

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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
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
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelsUserInvitationResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsUserInvitationResponseV1().createFromJson(json);
  }
}
