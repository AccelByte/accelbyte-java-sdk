/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_member;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsMemberRequestGroupResponseV1;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * CancelGroupJoinRequestV1
 *
 * <p>Requires valid user authentication
 *
 * <p>This endpoint allows user to cancel request to join specific group.
 *
 * <p>Action Code: 73411
 */
@Getter
@Setter
public class CancelGroupJoinRequestV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/join/cancel";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String groupId;

  private String namespace;

  /**
   * @param groupId required
   * @param namespace required
   */
  @Builder
  public CancelGroupJoinRequestV1(String groupId, String namespace) {
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

  public ModelsMemberRequestGroupResponseV1 parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsMemberRequestGroupResponseV1().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
