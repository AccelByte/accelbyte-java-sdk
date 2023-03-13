/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

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
 * PublicInviteUserV4
 *
 * <p>This endpoint is used to invite a game studio admin user with new namespace in multi tenant
 * mode. It will return error if the service multi tenant mode is set to false.
 *
 * <p>Request body details: - emailAddress: email address of the user to be invited - namespace: new
 * namespace of the user to be created - namespaceDisplayName: display name of the new namespace
 *
 * <p>The invited users will also be assigned with "User" role by default.
 */
@Getter
@Setter
public class PublicInviteUserV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/users/invite";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private ModelPublicInviteUserRequestV4 body;

  /**
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicInviteUserV4(ModelPublicInviteUserRequestV4 body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelPublicInviteUserRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelInviteUserResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelInviteUserResponseV3().createFromJson(json);
  }
}
