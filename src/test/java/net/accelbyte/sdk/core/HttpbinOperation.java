package net.accelbyte.sdk.core;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

class HttpbinOperation extends Operation {
    protected String url = "/anything";
    protected String method;
    protected HashMap<String, String> cookies = new HashMap<>();

    public HttpbinOperation(String method) {
        super.method = method;
    }

    @Override
    public String getMethod() {
        return super.method;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(),
                this.getCollectionFormatMap());
    }

    @Override
    public Map<String, String> getCookieParams() {
        return this.cookies;
    }

    @Override
    public HttpbinAnythingResponse parseResponse(int code, String contentTpe, InputStream payload)
            throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if (code == 200) {
            return new ObjectMapper().readValue(json, HttpbinAnythingResponse.class);
        }
        throw new ResponseException(code, json);
    }
}
