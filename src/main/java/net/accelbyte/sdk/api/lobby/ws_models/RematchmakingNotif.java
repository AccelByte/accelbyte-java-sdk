/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RematchmakingNotif {
  private Integer banDuration;

  private RematchmakingNotif() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RematchmakingNotif(Integer banDuration) {
    this.banDuration = banDuration;
  }

  public static String getType() {
    return "rematchmakingNotif";
  }

  public static RematchmakingNotif createFromWSM(String message) {
    RematchmakingNotif result = new RematchmakingNotif();
    Map<String, String> response = parseWSM(message);
    result.banDuration =
        response.get("banDuration") != null ? Integer.valueOf(response.get("banDuration")) : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(RematchmakingNotif.getType());
    if (banDuration != null) {
      stringBuilder.append("\n").append("banDuration: ").append(banDuration);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("banDuration", "banDuration");
    return result;
  }
}
