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
 * rejectGroupJoinRequestPublicV1
 *
 * <p>Required valid user authentication
 *
 * <p>Required Member Role Permission: "GROUP:JOIN [CREATE]"
 *
 * <p>This endpoint is used to reject group join request.
 *
 * <p>Reject group join request. If specific user is not asked to join the specific group ID, it
 * will show the the error to show if the user is not asked to join yet.
 *
 * <p>This endpoint will also check if the specific user is already joined to specific group
 *
 * <p>Action Code: 73408
 */
@Getter
@Setter
public class RejectGroupJoinRequestPublicV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/public/namespaces/{namespace}/users/{userId}/join/reject";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RejectGroupJoinRequestPublicV1(String namespace, String userId) {
    this.namespace = namespace;
    this.userId = userId;

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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelsMemberRequestGroupResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsMemberRequestGroupResponseV1().createFromJson(json);
  }
}
