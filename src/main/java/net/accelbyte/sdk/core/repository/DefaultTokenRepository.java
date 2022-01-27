package net.accelbyte.sdk.core.repository;

public class DefaultTokenRepository implements TokenRepository {
    private String token = "";

    private static DefaultTokenRepository instance = null;

    private DefaultTokenRepository() {
    }

    public static DefaultTokenRepository getInstance() {
        if (instance == null) {
            synchronized (DefaultTokenRepository.class) {
                if (instance == null) {
                    instance = new DefaultTokenRepository();
                }
            }
        }
        return instance;
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
