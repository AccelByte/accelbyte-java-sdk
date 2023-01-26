/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */
package net.accelbyte.sdk.integration;

import java.util.Random;

public class TestHelper {
  public static String generateRandomId(int length) {
    return getRandomString("abcdefghijklmnopqrstuvw0123456789", length);
  }

  public static String generateRandomPassword(int length) throws IllegalArgumentException {
    if (length < 8) {
      throw new IllegalArgumentException("Length must be >= 8");
    }
    final String part1 = getRandomString("ABCDEFGHIJKLMNOPQRSTUVW", (length - 2) / 2);
    final String part2 = getRandomString("abcdefghijklmnopqrstuvw", (length - 2) / 2);
    final String part3 = getRandomString("0123456789", 1);
    final String part4 = getRandomString("!@#$%^&*()", 1);
    return part1 + part2 + part3 + part4;
  }

  public static String getRandomString(String characters, int length) {
    final Random random = new Random();
    final char[] result = new char[length];
    for (int i = 0; i < result.length; i++) {
      while (true) {
        result[i] = characters.charAt(random.nextInt(characters.length()));
        if (i > 0 && result[i - 1] == result[i])
          continue; // Do not allow repeating characters following password validation rules
        else break;
      }
    }
    return new String(result);
  }

  public static String getPhantauthBaseUrl() {
    final String baseUrl = System.getenv("AB_PHANTAUTH_BASE_URL");
    return baseUrl != null ? baseUrl : "https://phantauth.net";
  }
}
