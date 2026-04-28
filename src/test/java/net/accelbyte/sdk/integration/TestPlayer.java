/*
 * Copyright (c) 2026 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import net.accelbyte.sdk.core.AccelByteSDK;

public interface TestPlayer {
  String getAccessToken() throws Exception;

  String getUserId() throws Exception;

  AccelByteSDK getSdk();

  void login() throws Exception;

  void logout() throws Exception;

  void run(PlayerAction action) throws Exception;

  @FunctionalInterface
  interface PlayerAction {
    void accept(AccelByteSDK sdk, TestPlayer player) throws Exception;
  }
}
