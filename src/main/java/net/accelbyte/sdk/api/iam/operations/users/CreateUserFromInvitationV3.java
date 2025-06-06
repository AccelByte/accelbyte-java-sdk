/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * CreateUserFromInvitationV3
 *
 * <p>This endpoint create user from saved roles when creating invitation and submitted data. User
 * will be able to login after completing submitting the data through this endpoint. Available
 * Authentication Types: EMAILPASSWD: an authentication type used for new user registration through
 * email.
 *
 * <p>**Note**: * **uniqueDisplayName**: this is required when
 * uniqueDisplayNameEnabled/UNIQUE_DISPLAY_NAME_ENABLED is true.
 *
 * <p>Country use ISO3166-1 alpha-2 two letter, e.g. US. Date of Birth format : YYYY-MM-DD, e.g.
 * 2019-04-29.
 */
@Getter
@Setter
public class CreateUserFromInvitationV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users/invite/{invitationId}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String invitationId;

  private String namespace;
  private ModelUserCreateRequestV3 body;

  /**
   * @param invitationId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateUserFromInvitationV3(
      String invitationId, String namespace, ModelUserCreateRequestV3 body) {
    this.invitationId = invitationId;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.invitationId != null) {
      pathParams.put("invitationId", this.invitationId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelUserCreateRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.invitationId == null) {
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

  public ModelUserCreateResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserCreateResponseV3().createFromJson(json);
  }
}
