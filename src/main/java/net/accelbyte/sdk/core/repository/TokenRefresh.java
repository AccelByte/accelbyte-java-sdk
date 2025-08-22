/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.util.Date;

import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenWithDeviceCookieResponseV3;
import net.accelbyte.sdk.core.AccelByteSDK;

public interface TokenRefresh {
  void setTokenExpiresAt(Date dateTime) throws Exception;

  Date getTokenExpiresAt() throws Exception;

  void storeRefreshToken(String refreshToken) throws Exception;

  String getRefreshToken() throws Exception;

  void removeRefreshToken() throws Exception;

  void setRefreshTokenExpiresAt(Date dateTime) throws Exception;

  Date getRefreshTokenExpiresAt() throws Exception;

  void storeTokenData(OauthmodelTokenWithDeviceCookieResponseV3 token);

  void storeTokenData(OauthmodelTokenResponse token);

  void clearTokenData();

  boolean isTokenExpiring();

  void doTokenRefresh(AccelByteSDK sdk, boolean rethrowOnError, TokenRefreshCallbacks callbacks);
}
