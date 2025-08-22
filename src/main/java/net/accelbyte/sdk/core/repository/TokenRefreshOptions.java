/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

public interface TokenRefreshOptions {

    float getRate();

    int getMaxRetry();

    boolean isEnabled();

    String getType();

    boolean isType(String test);
}
