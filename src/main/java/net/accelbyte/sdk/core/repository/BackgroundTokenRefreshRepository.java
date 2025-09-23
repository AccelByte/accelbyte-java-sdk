/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.util.Timer;
import java.util.TimerTask;
import lombok.extern.java.Log;
import net.accelbyte.sdk.core.AccelByteSDK;

@Log
public class BackgroundTokenRefreshRepository extends DefaultTokenRefreshRepository {

  private final Timer refreshTokenTimer = new Timer("RefreshTokenTimer", true);
  private final Object refreshTaskLock = new Object();
  private TimerTask refreshTokenTask = null;

  private int checkInterval = 0; // in millisecs

  private AccelByteSDK sdkObject = null;

  public BackgroundTokenRefreshRepository(BackgroundTokenRefreshOptions options) {
    super(options);
    checkInterval = options.getInterval() * 1000;
  }

  public void start(AccelByteSDK sdk) {
    this.sdkObject = sdk;
    runRefreshTask();
  }

  public void stop() {
    synchronized (refreshTaskLock) {
      if (refreshTokenTask != null) refreshTokenTask.cancel();
    }
  }

  private void runRefreshTask() {
    if (sdkObject == null) return;

    synchronized (refreshTaskLock) {
      if (refreshTokenTask != null) refreshTokenTask.cancel();

      refreshTokenTask =
          new TimerTask() {

            public void run() {
              doTokenRefresh(
                  sdkObject,
                  false,
                  new TokenRefreshCallbacks() {

                    public void onUpdated() {
                      runRefreshTask();
                    }
                  });
            }
          };

      refreshTokenTimer.schedule(refreshTokenTask, checkInterval);
    }
  }
}
