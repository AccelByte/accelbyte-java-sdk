/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */
package net.accelbyte.sdk.integration;

import java.util.Random;

public class TestHelper {
  public static String GenerateRandomId(int length) {
    return GetRandomString("abcdefghijklmnopqrstuvw0123456789", length);
  }

  public static String GenerateRandomPassword(int length) throws IllegalArgumentException {
    if (length < 8) {
      throw new IllegalArgumentException("Length must be >= 8");
    }
    final String part1 = GetRandomString("ABCDEFGHIJKLMNOPQRSTUVW", (length - 2) / 2);
    final String part2 = GetRandomString("abcdefghijklmnopqrstuvw", (length - 2) / 2);
    final String part3 = GetRandomString("0123456789", 1);
    final String part4 = GetRandomString("!@#$%^&*()", 1);
    return part1 + part2 + part3 + part4;
  }

  public static String GetRandomString(String characters, int length) {
    final Random random = new Random();
    final char[] result = new char[length];
    for (int i = 0; i < result.length; i++) {
      result[i] = characters.charAt(random.nextInt(characters.length()));
    }
    return new String(result);
  }

  public static String getPhantauthBaseUrl() {
    final String baseUrl = System.getenv("AB_PHANTAUTH_URL");
    return baseUrl != null ? baseUrl : "https://phantauth.net";
  }
}
