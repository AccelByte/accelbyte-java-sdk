package net.accelbyte.sdk.core.repository;

public class DefaultTokenRepository implements TokenRepository {
    private String token = "";

    private DefaultTokenRepository() {
    }

    private static final class InstanceHolder {
        static final DefaultTokenRepository instance = new DefaultTokenRepository();
    }

    public static DefaultTokenRepository getInstance() {
        return InstanceHolder.instance;
    }

    @Override
    public String getToken() {
        return this.token;
    }

    @Override
    public void removeToken() {
        this.token = "";
    }

    @Override
    public void storeToken(String token) {
        this.token = token;
    }
}
