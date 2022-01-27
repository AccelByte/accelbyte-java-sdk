package net.accelbyte.sdk.core.repository;

public class DefaultConfigRepository implements ConfigRepository {
    private static final String CLIENT_ID = "AB_CLIENT_ID";
    private static final String CLIENT_SECRET = "AB_CLIENT_SECRET";
    private static final String BASE_URL = "AB_BASE_URL";

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
