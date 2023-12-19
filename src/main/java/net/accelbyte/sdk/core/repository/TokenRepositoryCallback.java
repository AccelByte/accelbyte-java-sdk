package net.accelbyte.sdk.core.repository;

public abstract class TokenRepositoryCallback {

  public void onAccessTokenRefreshed(String newToken) {}
}
