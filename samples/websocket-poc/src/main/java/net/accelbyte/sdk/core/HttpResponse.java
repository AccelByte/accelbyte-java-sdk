package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

import java.io.InputStream;

@Getter
@Setter
public class HttpResponse {
    private int code;
    private String contentType;
    private InputStream payload;

    public HttpResponse(int code, String contentType, InputStream payload) {
        this.code = code;
        this.contentType = contentType;
        this.payload = payload;
    }
}