package net.accelbyte.sdk.core.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class Helper {

    private Helper() {

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

    public static String generateCodeVerifier() {
        SecureRandom secureRandom = new SecureRandom();
        byte[] codeVerifier = new byte[32];
        secureRandom.nextBytes(codeVerifier);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(codeVerifier);
    }

    public static String generateCodeChallenge(String codeVerifier) {
        byte[] bytes;
        bytes = codeVerifier.getBytes(StandardCharsets.US_ASCII);
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        if (md != null) {
            md.update(bytes, 0, bytes.length);
        }
        byte[] digest = new byte[0];
        if (md != null) {
            digest = md.digest();
        }
        return Base64.getUrlEncoder().withoutPadding().encodeToString(digest);
    }

    public static String getHost(String url) throws URISyntaxException {
        URI uri;
        uri = new URI(url);
        String domain = uri.getHost();
        return domain.startsWith("www.") ? domain.substring(4) : domain;
    }

    public static Map<String, String> parseWSM(String message) {
        Map<String, String> result = new HashMap<>();
        String[] lines = message.split("\n");
        for (String part : lines) {
            String[] parts = part.split(": ", 2);
            if (parts.length >= 2) {
                result.put(parts[0], parts[1]);
            }
        }
        return result;
    }

    public static String getWSMType(Map<String, String> parsedWSM) {
        if (parsedWSM.get("type") != null) {
            return parsedWSM.get("type");
        }
        return "";
    }

    public static String generateUUID() {
        String uuid = UUID.randomUUID().toString();
        return uuid.replace("-", "");
    }
}
