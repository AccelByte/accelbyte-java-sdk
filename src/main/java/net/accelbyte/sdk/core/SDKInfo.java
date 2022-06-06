/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;

@Getter
public class SDKInfo {

    private static final SDKInfo instance = new SDKInfo();

    private String sdkName = "AccelByteJavaSDK";
    private String sdkVersion = "0.12.0";

    private SDKInfo() {
    }

    public static SDKInfo getInstance() {
        return instance;
    }
}
