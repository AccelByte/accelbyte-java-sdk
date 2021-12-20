package net.accelbyte.sdk.core.repository;

public class TokenRepositoryImpl implements TokenRepository {
    private String token = "";

    private static TokenRepositoryImpl instance = null;

    private TokenRepositoryImpl() {
    }

    public static TokenRepositoryImpl getInstance() {
        if (instance == null) {
            synchronized (TokenRepositoryImpl.class) {
                if (instance == null) {
                    instance = new TokenRepositoryImpl();
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
