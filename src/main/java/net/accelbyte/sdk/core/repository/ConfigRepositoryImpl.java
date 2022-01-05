package net.accelbyte.sdk.core.repository;

public class ConfigRepositoryImpl implements ConfigRepository {
    private static final String CLIENT_ID = "MY_CLIENT_ID";
    private static final String CLIENT_SECRET = "MY_CLIENT_SECRET";
    private static final String BASE_URL = "MY_BASE_URL";

    @Override
    public String getClientId() {
        if (System.getenv(CLIENT_ID) == null) {
            return "";
        }
        return System.getenv(CLIENT_ID);
    }

    @Override
    public String getClientSecret() {
        if (System.getenv(CLIENT_SECRET) == null) {
            return "";
        }
        return System.getenv(CLIENT_SECRET);

    }

    @Override
    public String getBaseURL() {
        if (System.getenv(BASE_URL) == null) {
            return "";
        }
        return System.getenv(BASE_URL);
    }
}
