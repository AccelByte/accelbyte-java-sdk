package net.accelbyte.sdk.core;

import java.io.IOException;
import java.io.InputStream;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.accelbyte.sdk.core.util.Helper;

class HttpbinOperation extends Operation {
    protected String path = "/anything";
    protected String method;

    public HttpbinOperation(String method) {
        this.method = method;
    }

    @Override
    public String getMethod() {
        return this.method;
    }

    @Override
    public String getPath() {
        return this.path;
    }

    @Override
    public boolean isValid() {
        return true;
    }

    public HttpbinAnythingResponse parseResponse(int code, String contentTpe, InputStream payload)
            throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if (code == 200) {
            return new ObjectMapper().readValue(json, HttpbinAnythingResponse.class);
        }
        throw new HttpResponseException(code, json);
    }
}
