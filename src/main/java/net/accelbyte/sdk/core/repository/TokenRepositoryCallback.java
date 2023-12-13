package net.accelbyte.sdk.core.repository;

abstract public class TokenRepositoryCallback {

    public void onAccessTokenRefreshed(String newToken) {}

}
