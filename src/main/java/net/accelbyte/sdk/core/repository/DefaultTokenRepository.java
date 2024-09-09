/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import com.google.common.base.Strings;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import lombok.extern.java.Log;

@Log
public class DefaultTokenRepository implements TokenRepository {
  private String accessToken = null;

  private CopyOnWriteArrayList<TokenRepositoryCallback> callbacks = new CopyOnWriteArrayList<>();

  private final ExecutorService executor = Executors.newCachedThreadPool();

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
    log.info("storeToken: " + accessToken);
    if (Objects.isNull(accessToken) || accessToken.equals(this.accessToken)) {
      log.info("accessToken is null or equals to current");
      return;
    }
    String oldToken = this.accessToken;
    this.accessToken = accessToken;

    log.info("accessToken (oldToken): " + oldToken);

    // only notify if previous token not empty (i.e. previously already logged in)
    if (!Strings.isNullOrEmpty(oldToken)) {
      notifyOnAccessTokenRefreshed(accessToken);
    }
  }

  protected void notifyOnAccessTokenRefreshed(String newToken) {
    log.info("notifyOnAccessTokenRefreshed: " + newToken);
    for (TokenRepositoryCallback callback : callbacks) {
      log.info("notifyOnAccessTokenRefreshed execute: " + newToken);
      executor.execute(() -> callback.onAccessTokenRefreshed(newToken));
    }
  }

  @Override
  public boolean registerTokenRepositoryCallback(TokenRepositoryCallback callback) {
    return callbacks.add(callback);
  }

  @Override
  public boolean unregisterTokenRepositoryCallback(TokenRepositoryCallback callback) {
    return callbacks.remove(callback);
  }
}
