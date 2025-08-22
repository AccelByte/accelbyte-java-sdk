/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.time.Instant;
import java.util.Date;

import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenWithDeviceCookieResponseV3;
import net.accelbyte.sdk.core.AccelByteSDK;

public class DefaultTokenRefreshRepository extends DefaultTokenRepository implements TokenRefresh {
  private Date tokenExpiresAt = null;
  private String refreshToken = null;
  private Date refreshTokenExpiresAt = null;
  private TokenRefreshOptions options = null;

  private int tokenExpiresIn = 0;
  private long tokenIssuedTime = 0;

  public DefaultTokenRefreshRepository(TokenRefreshOptions options) {
    this.options = options;
  }

  @Override
  public void setTokenExpiresAt(Date dateTime) {
    this.tokenExpiresAt = dateTime;
  }

  @Override
  public Date getTokenExpiresAt() {
    return this.tokenExpiresAt;
  }

  @Override
  public void storeRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
  }

  @Override
  public String getRefreshToken() {
    return this.refreshToken;
  }

  @Override
  public void removeRefreshToken() {
    this.refreshToken = "";
  }

  @Override
  public void setRefreshTokenExpiresAt(Date dateTime) {
    this.refreshTokenExpiresAt = dateTime;
  }

  @Override
  public Date getRefreshTokenExpiresAt() {
    return this.refreshTokenExpiresAt;
  }

  @Override
  public void storeTokenData(OauthmodelTokenWithDeviceCookieResponseV3 token) {
    this.tokenExpiresIn = token.getExpiresIn();
    this.refreshToken = token.getRefreshToken();
    this.tokenIssuedTime = Instant.now().getEpochSecond();
  }

  @Override
  public void storeTokenData(OauthmodelTokenResponse token) {
    this.tokenExpiresIn = token.getExpiresIn();
    this.refreshToken = token.getRefreshToken();
    this.tokenIssuedTime = Instant.now().getEpochSecond();
  }

  @Override
  public void clearTokenData() {
    this.tokenExpiresIn = 0;
    this.refreshToken = "";
    this.tokenIssuedTime = 0;
  }

  @Override
  public boolean isTokenExpiring() {
    final int tExpiry = Math.round(options.getRate() * (float)tokenExpiresIn);
    final long targetTs = tokenIssuedTime + tExpiry;
    return (Instant.now().getEpochSecond() >= targetTs);
  }

  public void doTokenRefresh(AccelByteSDK sdk, boolean rethrowOnError, TokenRefreshCallbacks callbacks) {
    if (options == null)
      return;
    if (!options.isEnabled())
      return;

    if (!getToken().isEmpty() && isTokenExpiring()) {
      int retryCount = 0;
      while (true) {
        try {
          sdk.refreshToken();
          if (callbacks != null)
            callbacks.onUpdated();
          break;
        } catch (Exception x) {
          retryCount++;
          if (retryCount >= options.getMaxRetry()) {
            if (callbacks != null)
              callbacks.onFailed(x);
            if (rethrowOnError)
              throw x;
            else
              break;
          }          
        }
      }
    }
  }
}
