/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

public abstract class TokenRefreshCallbacks {
    
    public void onUpdated() {}

    public void onFailed(Exception x) {}

}
