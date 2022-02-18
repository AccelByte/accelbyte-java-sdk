package net.accelbyte.sdk.core;

import lombok.Getter;

@Getter
public class SDKInfo {

    private final String sdkName = "AccelByteJavaSDK";
    private final String sdkVersion = "0.4.0";

    private SDKInfo() {
    }

    private static final class InstanceHolder {
        static final SDKInfo instance = new SDKInfo();
    }

    public static SDKInfo getInstance() {
        return SDKInfo.InstanceHolder.instance;
    }
}
