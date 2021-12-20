package net.accelbyte.sdk.core.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

public class Helper {
    private Helper(){

    }

    public static String convertInputStreamToString(InputStream is) throws IOException {
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] buffer = new byte[2048];
        int length;
        while ((length = is.read(buffer)) != -1) {
            result.write(buffer, 0, length);
        }
        return result.toString(StandardCharsets.UTF_8.name());
    }
}
