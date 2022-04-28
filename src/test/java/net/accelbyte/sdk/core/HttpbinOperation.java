package net.accelbyte.sdk.core;

import java.io.IOException;
import java.io.InputStream;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.accelbyte.sdk.core.util.Helper;

class HttpbinOperation extends Operation {
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
