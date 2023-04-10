/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListString;
import static net.accelbyte.sdk.core.util.Helper.listToWSMList;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MatchmakingNotif {
  private List<String> counterPartyMember;
  private String matchId;
  private String message;
  private List<String> partyMember;
  private Integer readyDuration;
  private String status;

  private MatchmakingNotif() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public MatchmakingNotif(
      List<String> counterPartyMember,
      String matchId,
      String message,
      List<String> partyMember,
      Integer readyDuration,
      String status) {
    this.counterPartyMember = counterPartyMember;
    this.matchId = matchId;
    this.message = message;
    this.partyMember = partyMember;
    this.readyDuration = readyDuration;
    this.status = status;
  }

  public static String getType() {
    return "matchmakingNotif";
  }

  public static MatchmakingNotif createFromWSM(String message) {
    MatchmakingNotif result = new MatchmakingNotif();
    Map<String, String> response = parseWSM(message);
    result.counterPartyMember =
        response.get("counterPartyMember") != null
            ? convertWSMListToListString(response.get("counterPartyMember"))
            : null;
    result.matchId = response.get("matchId") != null ? response.get("matchId") : null;
    result.message = response.get("message") != null ? response.get("message") : null;
    result.partyMember =
        response.get("partyMember") != null
            ? convertWSMListToListString(response.get("partyMember"))
            : null;
    result.readyDuration =
        response.get("readyDuration") != null
            ? Integer.valueOf(response.get("readyDuration"))
            : null;
    result.status = response.get("status") != null ? response.get("status") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(MatchmakingNotif.getType());
    if (counterPartyMember != null) {
      stringBuilder
          .append("\n")
          .append("counterPartyMember: ")
          .append(listToWSMList(counterPartyMember));
    }
    if (matchId != null) {
      stringBuilder.append("\n").append("matchId: ").append(matchId);
    }
    if (message != null) {
      stringBuilder.append("\n").append("message: ").append(message);
    }
    if (partyMember != null) {
      stringBuilder.append("\n").append("partyMember: ").append(listToWSMList(partyMember));
    }
    if (readyDuration != null) {
      stringBuilder.append("\n").append("readyDuration: ").append(readyDuration);
    }
    if (status != null) {
      stringBuilder.append("\n").append("status: ").append(status);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("counterPartyMember", "counterPartyMember");
    result.put("matchId", "matchId");
    result.put("message", "message");
    result.put("partyMember", "partyMember");
    result.put("readyDuration", "readyDuration");
    result.put("status", "status");
    return result;
  }
}
