/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.user_profile;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.models.UserProfileStatusUpdate;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateUserProfileStatus
 *
 * <p>Update user profile status. Other detail info:
 *
 * <p>* Required permission : resource= "ADMIN:NAMESPACE:{namespace}:USER:{userId}:PROFILE" ,
 * action=4 (UPDATE) * Action code : 11406 * Returns : user profile
 */
@Getter
@Setter
public class UpdateUserProfileStatus extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles/status";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private UserProfileStatusUpdate body;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  public UpdateUserProfileStatus(String namespace, String userId, UserProfileStatusUpdate body) {
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

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
  public UserProfileStatusUpdate getBodyParams() {
    return this.body;
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

  public UserProfilePrivateInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new UserProfilePrivateInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
