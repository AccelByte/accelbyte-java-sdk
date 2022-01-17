package net.accelbyte.sdk.core.repository;

import java.io.IOException;

public interface TokenRepository {
    String getToken();

    void removeToken() throws IOException;

    void storeToken(String token) throws IOException;
}
