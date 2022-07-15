/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

public interface TokenRepository {
  void storeToken(String accessToken) throws Exception;

  String getToken() throws Exception;

  void removeToken() throws Exception;
}
