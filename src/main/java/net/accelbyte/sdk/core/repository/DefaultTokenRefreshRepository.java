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

  private String refreshToken = null;
  private TokenRefreshOptions options = null;

  private int tokenExpiresIn = 0;
  private long tokenIssuedTime = 0;
  private int refreshTokenExpiresIn = 0;

  public DefaultTokenRefreshRepository(TokenRefreshOptions options) {
    this.options = options;
  }

  @Override
  @Deprecated
  public void setTokenExpiresAt(Date dateTime) {
    //deprecated method.
  }

  @Override
  public Date getTokenExpiresAt() {
    final long expiresAt = this.tokenIssuedTime + this.tokenExpiresIn;
    // both tokenIssuedTime and tokenExpiresIn are in epoch seconds, so we need to convert to epoch millisecs.
    return new Date(expiresAt * 1000L);
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
  @Deprecated
  public void setRefreshTokenExpiresAt(Date dateTime) {
    //deprecated method.
  }

  @Override
  public Date getRefreshTokenExpiresAt() {
    final long expiresAt = this.tokenIssuedTime + this.refreshTokenExpiresIn;
    // both tokenIssuedTime and refreshTokenExpiresIn are in epoch seconds, so we need to convert to epoch millisecs.
    return new Date(expiresAt * 1000L);
  }

  @Override
  public void storeTokenData(OauthmodelTokenWithDeviceCookieResponseV3 token) {    
    this.tokenExpiresIn = token.getExpiresIn();
    this.refreshToken = token.getRefreshToken();
    if (token.getRefreshExpiresIn() != null)
      this.refreshTokenExpiresIn = token.getRefreshExpiresIn();
    this.tokenIssuedTime = Instant.now().getEpochSecond();
    
  }

  @Override
  public void storeTokenData(OauthmodelTokenResponse token) {
    this.tokenExpiresIn = token.getExpiresIn();
    this.refreshToken = token.getRefreshToken();
    if (token.getRefreshExpiresIn() != null)
      this.refreshTokenExpiresIn = token.getRefreshExpiresIn();
    this.tokenIssuedTime = Instant.now().getEpochSecond();
  }

  @Override
  public void clearTokenData() {
    this.tokenExpiresIn = 0;    
    this.refreshToken = "";
    this.refreshTokenExpiresIn = 0;
    this.tokenIssuedTime = 0;
  }

  @Override
  public boolean isTokenExpiring() {
    final int tExpiry = Math.round(options.getRate() * (float)tokenExpiresIn);
    final long targetTs = tokenIssuedTime + tExpiry;
    return (Instant.now().getEpochSecond() >= targetTs);
  }  

  @Override
  public Date getTokenExpiringAt() {
    final int tExpiry = Math.round(options.getRate() * (float)tokenExpiresIn);
    final long targetTs = tokenIssuedTime + tExpiry;
    return new Date(targetTs * 1000L);
  }

  @Override
  public boolean isTokenExpired() {
    final long targetTs = tokenIssuedTime + tokenExpiresIn;
    return (Instant.now().getEpochSecond() >= targetTs);
  }

  @Override
  public boolean isRefreshTokenExpired() {    
    final long targetTs = tokenIssuedTime + refreshTokenExpiresIn;
    return (Instant.now().getEpochSecond() >= targetTs);
  }

  @Override
  public void doTokenRefresh(AccelByteSDK sdk, boolean rethrowOnError, TokenRefreshCallbacks callbacks) {
    if (options == null)
      return;
    if (!options.isEnabled())
      return;

    if (isTokenAvailable() && isTokenExpiring()) {
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
