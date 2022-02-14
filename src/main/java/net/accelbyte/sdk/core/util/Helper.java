package net.accelbyte.sdk.core.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.*;

public class Helper {

    private Helper() {

    }

    public static String convertInputStreamToString(InputStream is) throws IOException {
        return IOUtils.toString(is, StandardCharsets.UTF_8.name());
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

    public static <T> String listToWSMList(List<T> inputs) {
        StringBuilder result = new StringBuilder();
        if (!inputs.isEmpty()) {
            for (T input : inputs) {
                if (result.length() > 0) {
                    result.append(",");
                }
                result.append(input);
            }
            result.insert(0, "[");
            result.append("]");
        }
        return result.toString();
    }

    public static <T> Map<String, T> convertJsonToMap (String json) {
        try {
            return new ObjectMapper().readValue(json, new TypeReference<Map<String, T>>() {});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return new HashMap<>();
    }

    public static List<String> convertWSMListToListString (String json) {
        String result = json.substring(1, json.length() - 1);
        return new ArrayList<>(Arrays.asList( result.split(",")));
    }

    public static List<Integer> convertWSMListToListInteger (String json) {
        String list = json.substring(1, json.length() - 1);
        List<String> stringList = new ArrayList<>(Arrays.asList(list.split(",")));
        List<Integer> result = new ArrayList<>();
        for (String val: stringList){
            result.add(Integer.valueOf(val));
        }
        return result;
    }

}
