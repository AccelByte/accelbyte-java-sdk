/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

import static net.accelbyte.sdk.core.util.Helper.*;

@Getter
@Setter
public class MatchmakingNotif {
    private String status;
    private String matchId;
    private List<String> partyMember;
    private List<String> counterPartyMember;
    private String message;
    private Integer readyDuration;

    private MatchmakingNotif() {

    }

    @Builder
    public MatchmakingNotif (
        String status,
        String matchId,
        List<String> partyMember,
        List<String> counterPartyMember,
        String message,
        Integer readyDuration
    ) {
        this.status = status;
        this.matchId = matchId;
        this.partyMember = partyMember;
        this.counterPartyMember = counterPartyMember;
        this.message = message;
        this.readyDuration = readyDuration;
    }

    public static String getType(){
        return "matchmakingNotif";
    }

    public static MatchmakingNotif createFromWSM(String message) {
        MatchmakingNotif result = new MatchmakingNotif();
        Map<String, String> response = parseWSM(message);
        result.status = response.get("status") != null ? response.get("status") : null;
        result.matchId = response.get("matchId") != null ? response.get("matchId") : null;
        result.partyMember = response.get("partyMember") != null ? convertWSMListToListString(response.get("partyMember")) : null;
        result.counterPartyMember = response.get("counterPartyMember") != null ? convertWSMListToListString(response.get("counterPartyMember")) : null;
        result.message = response.get("message") != null ? response.get("message") : null;
        result.readyDuration = response.get("readyDuration") != null ? Integer.valueOf(response.get("readyDuration")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(MatchmakingNotif.getType());
        if (status != null) {
            stringBuilder
                    .append("\n")
                    .append("status: ")
                    .append(status);
        }
        if (matchId != null) {
            stringBuilder
                    .append("\n")
                    .append("matchId: ")
                    .append(matchId);
        }
        if (partyMember != null) {
            stringBuilder
                    .append("\n")
                    .append("partyMember: ")
                    .append(listToWSMList(partyMember));
        }
        if (counterPartyMember != null) {
            stringBuilder
                    .append("\n")
                    .append("counterPartyMember: ")
                    .append(listToWSMList(counterPartyMember));
        }
        if (message != null) {
            stringBuilder
                    .append("\n")
                    .append("message: ")
                    .append(message);
        }
        if (readyDuration != null) {
            stringBuilder
                    .append("\n")
                    .append("readyDuration: ")
                    .append(readyDuration);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("status","status");
        result.put("matchId","matchId");
        result.put("partyMember","partyMember");
        result.put("counterPartyMember","counterPartyMember");
        result.put("message","message");
        result.put("readyDuration","readyDuration");
        return result;
    }
}