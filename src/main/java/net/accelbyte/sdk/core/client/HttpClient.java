package net.accelbyte.sdk.core.client;

import net.accelbyte.sdk.core.Header;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;

import java.io.IOException;

public interface HttpClient {
    HttpResponse sendRequest(Operation operation, String baseURL, Header header) throws IOException;
}
