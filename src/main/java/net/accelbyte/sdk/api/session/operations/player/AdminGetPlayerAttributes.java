/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.player;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminGetPlayerAttributes
 *
 * <p>Admin get attributes of a player.
 *
 * <p>Field descriptions: - userID : user who owns the attributes. - crossplayEnabled : set to true
 * if the player wants to enable crossplay to their session (default: false). - platforms : list of
 * the player's 3rd party platform account information. - name : platform name. supported platforms:
 * STEAM, XBOX, PSN - userID : platform userID - data : other data that the player wants to store. -
 * PSN_PUSH_CONTEXT_ID: if provided, session will refer to this when performing session sync with
 * PSN, otherwise will populate from session attributes - currentPlatform : latest user game
 * platform. - roles : user role for matchmaking role base support.
 */
@Getter
@Setter
public class AdminGetPlayerAttributes extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/users/{userId}/attributes";

  private String method = "GET";
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
  public AdminGetPlayerAttributes(String namespace, String userId) {
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

  public ApimodelsPlayerAttributesResponseBody parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsPlayerAttributesResponseBody().createFromJson(json);
  }
}
