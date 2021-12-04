package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseException extends Exception {
    private final int httpCode;
    private final String errorMessage;

    public ResponseException(int httpStatusCode, String errorMessage) {
        super(errorMessage);
        this.httpCode = httpStatusCode;
        this.errorMessage = errorMessage;
    }
}
