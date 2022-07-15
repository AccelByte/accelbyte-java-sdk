package net.accelbyte.sdk.core.repository;

import java.util.Date;

public class DefaultTokenRefreshRepository extends DefaultTokenRepository implements TokenRefresh {
  private Date tokenExpiresAt = null;
  private String refreshToken = null;
  private Date refreshTokenExpiresAt = null;

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
}
