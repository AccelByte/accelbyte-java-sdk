package net.accelbyte.sdk.core.repository;

public class ConfigRepositoryImpl implements ConfigRepository {
    private static final String CLIENT_ID = "APP_CLIENT_ID";
    private static final String CLIENT_SECRET = "APP_CLIENT_SECRET";
    private static final String BASE_URL = "ACCELBYTE_BASE_URL";

    @Override
    public String getClientId() {
        return System.getenv(CLIENT_ID);
    }

    @Override
    public String getClientSecret() {
        return System.getenv(CLIENT_SECRET);
    }

    @Override
    public String getBaseURL() {
        return System.getenv(BASE_URL);
    }
}
