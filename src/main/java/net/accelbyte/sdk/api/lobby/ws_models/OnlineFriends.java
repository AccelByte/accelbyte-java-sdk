/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListString;
import static net.accelbyte.sdk.core.util.Helper.generateUUID;
import static net.accelbyte.sdk.core.util.Helper.listToWSMList;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OnlineFriends {
  private Integer code;
  private String id;
  private List<String> onlineFriendIds;

  private OnlineFriends() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public OnlineFriends(Integer code, String id, List<String> onlineFriendIds) {
    this.code = code;
    this.id = id;
    this.onlineFriendIds = onlineFriendIds;
  }

  public static String getType() {
    return "onlineFriends";
  }

  public static OnlineFriends createFromWSM(String message) {
    OnlineFriends result = new OnlineFriends();
    Map<String, String> response = parseWSM(message);
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.onlineFriendIds =
        response.get("onlineFriendIds") != null
            ? convertWSMListToListString(response.get("onlineFriendIds"))
            : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(OnlineFriends.getType());
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (onlineFriendIds != null) {
      stringBuilder.append("\n").append("onlineFriendIds: ").append(listToWSMList(onlineFriendIds));
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("code", "code");
    result.put("id", "id");
    result.put("onlineFriendIds", "onlineFriendIds");
    return result;
  }
}
