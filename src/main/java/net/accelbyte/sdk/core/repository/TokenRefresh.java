/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.util.Date;

public interface TokenRefresh {
  void setTokenExpiresAt(Date dateTime) throws Exception;

  Date getTokenExpiresAt() throws Exception;

  void storeRefreshToken(String refreshToken) throws Exception;

  String getRefreshToken() throws Exception;

  void removeRefreshToken() throws Exception;

  void setRefreshTokenExpiresAt(Date dateTime) throws Exception;

  Date getRefreshTokenExpiresAt() throws Exception;
}
