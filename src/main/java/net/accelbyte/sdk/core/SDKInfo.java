/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;

@Getter
public class SDKInfo {

    private final String sdkName = "AccelByteJavaSDK";
    private final String sdkVersion = "0.6.0";

    private SDKInfo() {
    }

    private static final class InstanceHolder {
        static final SDKInfo instance = new SDKInfo();
    }

    public static SDKInfo getInstance() {
        return SDKInfo.InstanceHolder.instance;
    }
}
