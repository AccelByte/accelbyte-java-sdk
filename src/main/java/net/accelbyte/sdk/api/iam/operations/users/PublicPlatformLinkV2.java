/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicPlatformLinkV2
 *
 * <p>Prerequisite: Platform client configuration need to be added to database for specific
 * platformId. Namespace service URL need to be specified (refer to required environment variables).
 *
 * <p>## Supported platforms:
 *
 * <p>* steam : The ticketâs value is the authentication code returned by Steam.
 *
 * <p>* steamopenid : Steam's user authentication method using OpenID 2.0. The ticket's value is URL
 * generated by Steam on web authentication
 *
 * <p>* facebook : The ticketâs value is the authorization code returned by Facebook OAuth
 *
 * <p>* google : The ticketâs value is the authorization code returned by Google OAuth
 *
 * <p>* oculus : The ticketâs value is a string composed of Oculus's user ID and the nonce
 * separated by a colon (:).
 *
 * <p>* twitch : The ticketâs value is the authorization code returned by Twitch OAuth.
 *
 * <p>* android : The ticket's value is the Androidâs device ID
 *
 * <p>* ios : The ticket's value is the iOSâs device ID.
 *
 * <p>* device : Every device that doesn't run Android and iOS is categorized as a device platform.
 * The ticket's value is the deviceâs ID.
 *
 * <p>* discord : The ticketâs value is the authorization code returned by Discord OAuth.
 */
@Getter
@Setter
public class PublicPlatformLinkV2 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v2/public/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String userId;
  private String ticket;

  /**
   * @param namespace required
   * @param platformId required
   * @param userId required
   * @param ticket required
   */
  @Builder
  public PublicPlatformLinkV2(String namespace, String platformId, String userId, String ticket) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.userId = userId;
    this.ticket = ticket;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.ticket != null) {
      formDataParams.put("ticket", this.ticket);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.ticket == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
