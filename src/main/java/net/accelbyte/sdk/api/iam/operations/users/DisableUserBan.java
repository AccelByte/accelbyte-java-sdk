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
 * DisableUserBan
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/users/{userId}/bans/{banId}
 * [PATCH]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:BAN:USER:{userId} [UPDATE]'. "+ " Notes for
 * using IAM in publisher - game studio scenarios "+ "
 *
 * <p>The endpoint allows:
 *
 * <p>"+ " * The admin user in publisher namespace disables userâs ban in publisher namespace. "+
 * " * The admin user in game namespace disables userâs ban in game namespace. "+ " * The admin
 * user in publisher namespace disables userâs ban in publisher namespace. "+ "
 *
 * <p>Other scenarios are not supported and will return 403: Forbidden.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DisableUserBan extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/{userId}/bans/{banId}/disable";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("*/*");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String banId;

  private String namespace;
  private String userId;

  /**
   * @param banId required
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DisableUserBan(String banId, String namespace, String userId) {
    this.banId = banId;
    this.namespace = namespace;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.banId != null) {
      pathParams.put("banId", this.banId);
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
    if (this.banId == null) {
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

  public ModelUserBanResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserBanResponse().createFromJson(json);
  }
}
