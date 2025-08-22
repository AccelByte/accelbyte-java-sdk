/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import lombok.*;

@Getter
@Setter
public class OnDemandTokenRefreshOptions implements TokenRefreshOptions {

    public static final String REFRESH_TYPE = "ONDEMAND";
    
    private float rate = 0.8f;
    
    private int maxRetry = 2;

    private boolean enabled = true;
    
    public static OnDemandTokenRefreshOptions getDefault() {
        return new OnDemandTokenRefreshOptions();
    }

    private OnDemandTokenRefreshOptions() {
        final String sRate = System.getenv(EnvConstants.TOKEN_REFRESH_RATE);
        if (sRate != null)
            setRate(Float.parseFloat(sRate));

        final String sMaxRetry = System.getenv(EnvConstants.TOKEN_REFRESH_MAX_RETRY);
        if (sMaxRetry != null)
            setMaxRetry(Integer.parseInt(sMaxRetry));

        final String sEnabled = System.getenv(EnvConstants.TOKEN_REFRESH_ONDEMAND_ENABLED);
        if (sEnabled != null)
            setEnabled(Boolean.parseBoolean(sEnabled));
    }

    public String getType() {
        return OnDemandTokenRefreshOptions.REFRESH_TYPE;
    }

    public boolean isType(String test) {
        return test.trim().toUpperCase().equals(OnDemandTokenRefreshOptions.REFRESH_TYPE);
    }
}
