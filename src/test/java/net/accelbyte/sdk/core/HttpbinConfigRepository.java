package net.accelbyte.sdk.core;

import net.accelbyte.sdk.core.repository.ConfigRepository;

class HttpbinConfigRepository implements ConfigRepository {
    @Override
    public String getClientId() {
        return "DUMMY_CLIENT_ID";
    }

    @Override
    public String getClientSecret() {
        return "DUMMY_CLIENT_SECRET";
    }

    @Override
    public String getBaseURL() {
        return "https://httpbin.org";
    }

    @Override
    public boolean isAmazonTraceId() {
        return true;
    }

    @Override
    public void activateAmazonTraceId(String version) {
        // Do nothing
    }

    @Override
    public void deactivateAmazonTraceId() {
        // Do nothing
    }

    @Override
    public String getAmazonTraceIdVersion() {
        return "1";
    }

    @Override
    public boolean isClientInfoHeader() {
        return true;
    }

    @Override
    public void activateClientInfoHeader(AppInfo appInfo) {
        // Do nothing
    }

    @Override
    public void deactivateClientInfoHeader() {
        // Do nothing
    }

    @Override
    public AppInfo getAppInfo() {
        return new AppInfo("Java Server SDK Test", "0.0.0");
    }

}