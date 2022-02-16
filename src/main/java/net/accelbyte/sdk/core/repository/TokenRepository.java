/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.io.IOException;

public interface TokenRepository {
    String getToken();

    void removeToken() throws IOException;

    void storeToken(String token) throws IOException;
}
