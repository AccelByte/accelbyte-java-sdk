/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.util.Date;

public interface TokenRefresh {
    void setTokenExpiresAt(Date dateTime);

    Date getTokenExpiresAt();

    void storeRefreshToken(String refreshToken);

    String getRefreshToken();

    void removeRefreshToken();

    void setRefreshTokenExpiresAt(Date dateTime);

    Date getRefreshTokenExpiresAt();
}
