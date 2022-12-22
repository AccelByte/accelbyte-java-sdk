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
 * JoinGroupV1
 *
 * <p>Required valid user authentication
 *
 * <p>This endpoint is used to join as group member
 *
 * <p>Join to the group. This endpoint will check the the the type of the group based on the
 * groupID.
 *
 * <p>Additional Information:
 *
 * <p>* User cannot join to the group with PRIVATE type
 *
 * <p>* Joining PUBLIC group type will create join request and need approval from the privileged
 * group member to accept the request to become the member
 *
 * <p>* Joining OPEN group type will make this user become member of that group immediately
 *
 * <p>This endpoint will return status field to give information whether the user is JOINED or
 * REQUESTED to join to the specific group
 *
 * <p>Action Code: 73403
 */
@Getter
@Setter
public class JoinGroupV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/join";

  private String method = "POST";
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
  public JoinGroupV1(String groupId, String namespace) {
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

  public ModelsJoinGroupResponseV1 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsJoinGroupResponseV1().createFromJson(json);
  }
}
