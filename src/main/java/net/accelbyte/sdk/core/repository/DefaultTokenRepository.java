/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

public class DefaultTokenRepository implements TokenRepository {
  private String accessToken = null;

  public DefaultTokenRepository() {}

  private static final class InstanceHolder {
    static final DefaultTokenRepository instance = new DefaultTokenRepository();
  }

  public static DefaultTokenRepository getInstance() {
    return InstanceHolder.instance;
  }

  @Override
  public String getToken() {
    return this.accessToken;
  }

  @Override
  public void removeToken() {
    this.accessToken = "";
  }

  @Override
  public void storeToken(String accessToken) {
    this.accessToken = accessToken;
  }
}
