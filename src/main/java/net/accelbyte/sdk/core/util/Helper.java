/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

public class Helper {
    private static final Random random = new Random();
    private static final SecureRandom secureRandom = new SecureRandom();

    private Helper() {

    }

    public static String convertInputStreamToString(InputStream is) throws IOException {
        return IOUtils.toString(is, StandardCharsets.UTF_8.name());
    }

    public static String generateCodeVerifier() {
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

    public static String getHost(String url) throws MalformedURLException {
        URL myUrl = new URL(url);
        String domain = myUrl.getHost();
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

    public static String generateAmazonTraceId(String version) {
        long time = System.currentTimeMillis() / 1000L;
        String timeHexa = Long.toHexString(time);
        byte[] bytes = new byte[12];
        random.nextBytes(bytes);
        StringBuilder guid = new StringBuilder();
        for (byte b : bytes) {
            String st = String.format("%02x", b);
            guid.append(st);
        }
        return String.format("%s-%s-%s", version, timeHexa, guid);
    }

}
