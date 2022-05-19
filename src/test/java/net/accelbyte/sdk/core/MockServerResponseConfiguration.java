package net.accelbyte.sdk.core;

import java.util.HashMap;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MockServerResponseConfiguration {
        private boolean enabled;
        private boolean overwrite;
        private int delay;      // Seconds
        private int status;     // HTTP status code
        private Object response;
        private HashMap<String, String> headers;
}
