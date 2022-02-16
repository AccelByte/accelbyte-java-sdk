package net.accelbyte.sdk.core.repository;

public interface ConfigRepository {
    String getClientId();
    String getClientSecret();
    String getBaseURL();
    boolean isAmazonTraceId();
    void activateAmazonTraceId(String version);
    void deactivateAmazonTraceId();
    String getAmazonTraceIdVersion();
}
