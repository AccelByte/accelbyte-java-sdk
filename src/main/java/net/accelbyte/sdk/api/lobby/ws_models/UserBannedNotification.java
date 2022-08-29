/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBannedNotification {

  public UserBannedNotification() {}

  public static String getType() {
    return "userBannedNotification";
  }

  public static UserBannedNotification createFromWSM(String message) {
    UserBannedNotification result = new UserBannedNotification();
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(UserBannedNotification.getType());
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    return result;
  }
}
