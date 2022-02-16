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
public class DsNotif {
    private String podName;
    private String imageVersion;
    private String namespace;
    private String ip;
    private List<String> alternateIps;
    private Integer port;
    private String protocol;
    private Map<String, Integer> ports;
    private String provider;
    private String gameVersion;
    private String status;
    private String lastUpdate;
    private String sessionId;
    private String deployment;
    private String region;
    private Boolean isOverrideGameVersion;
    private String customAttribute;
    private String matchId;
    private Boolean isOK;
    private String message;

    private DsNotif() {

    }

    @Builder
    public DsNotif (
        String podName,
        String imageVersion,
        String namespace,
        String ip,
        List<String> alternateIps,
        Integer port,
        String protocol,
        Map<String, Integer> ports,
        String provider,
        String gameVersion,
        String status,
        String lastUpdate,
        String sessionId,
        String deployment,
        String region,
        Boolean isOverrideGameVersion,
        String customAttribute,
        String matchId,
        Boolean isOK,
        String message
    ) {
        this.podName = podName;
        this.imageVersion = imageVersion;
        this.namespace = namespace;
        this.ip = ip;
        this.alternateIps = alternateIps;
        this.port = port;
        this.protocol = protocol;
        this.ports = ports;
        this.provider = provider;
        this.gameVersion = gameVersion;
        this.status = status;
        this.lastUpdate = lastUpdate;
        this.sessionId = sessionId;
        this.deployment = deployment;
        this.region = region;
        this.isOverrideGameVersion = isOverrideGameVersion;
        this.customAttribute = customAttribute;
        this.matchId = matchId;
        this.isOK = isOK;
        this.message = message;
    }

    public static String getType(){
        return "dsNotif";
    }

    public static DsNotif createFromWSM(String message) {
        DsNotif result = new DsNotif();
        Map<String, String> response = parseWSM(message);
        result.podName = response.get("podName") != null ? response.get("podName") : null;
        result.imageVersion = response.get("imageVersion") != null ? response.get("imageVersion") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.ip = response.get("ip") != null ? response.get("ip") : null;
        result.alternateIps = response.get("alternateIps") != null ? convertWSMListToListString(response.get("alternateIps")) : null;
        result.port = response.get("port") != null ? Integer.valueOf(response.get("port")) : null;
        result.protocol = response.get("protocol") != null ? response.get("protocol") : null;
        result.ports = response.get("ports") != null ? convertJsonToMap(response.get("ports")) : null;
        result.provider = response.get("provider") != null ? response.get("provider") : null;
        result.gameVersion = response.get("gameVersion") != null ? response.get("gameVersion") : null;
        result.status = response.get("status") != null ? response.get("status") : null;
        result.lastUpdate = response.get("lastUpdate") != null ? response.get("lastUpdate") : null;
        result.sessionId = response.get("sessionId") != null ? response.get("sessionId") : null;
        result.deployment = response.get("deployment") != null ? response.get("deployment") : null;
        result.region = response.get("region") != null ? response.get("region") : null;
        result.isOverrideGameVersion = response.get("isOverrideGameVersion") != null ? Boolean.valueOf(response.get("isOverrideGameVersion")) : null;
        result.customAttribute = response.get("customAttribute") != null ? response.get("customAttribute") : null;
        result.matchId = response.get("matchId") != null ? response.get("matchId") : null;
        result.isOK = response.get("isOK") != null ? Boolean.valueOf(response.get("isOK")) : null;
        result.message = response.get("message") != null ? response.get("message") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(DsNotif.getType());
        if (podName != null) {
            stringBuilder
                    .append("\n")
                    .append("podName: ")
                    .append(podName);
        }
        if (imageVersion != null) {
            stringBuilder
                    .append("\n")
                    .append("imageVersion: ")
                    .append(imageVersion);
        }
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (ip != null) {
            stringBuilder
                    .append("\n")
                    .append("ip: ")
                    .append(ip);
        }
        if (alternateIps != null) {
            stringBuilder
                    .append("\n")
                    .append("alternateIps: ")
                    .append(listToWSMList(alternateIps));
        }
        if (port != null) {
            stringBuilder
                    .append("\n")
                    .append("port: ")
                    .append(port);
        }
        if (protocol != null) {
            stringBuilder
                    .append("\n")
                    .append("protocol: ")
                    .append(protocol);
        }
        if (ports != null) {
            try {
                String json = new ObjectMapper().writeValueAsString(ports);
                stringBuilder
                    .append("\n")
                    .append("ports: ")
                    .append(json);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        if (provider != null) {
            stringBuilder
                    .append("\n")
                    .append("provider: ")
                    .append(provider);
        }
        if (gameVersion != null) {
            stringBuilder
                    .append("\n")
                    .append("gameVersion: ")
                    .append(gameVersion);
        }
        if (status != null) {
            stringBuilder
                    .append("\n")
                    .append("status: ")
                    .append(status);
        }
        if (lastUpdate != null) {
            stringBuilder
                    .append("\n")
                    .append("lastUpdate: ")
                    .append(lastUpdate);
        }
        if (sessionId != null) {
            stringBuilder
                    .append("\n")
                    .append("sessionId: ")
                    .append(sessionId);
        }
        if (deployment != null) {
            stringBuilder
                    .append("\n")
                    .append("deployment: ")
                    .append(deployment);
        }
        if (region != null) {
            stringBuilder
                    .append("\n")
                    .append("region: ")
                    .append(region);
        }
        if (isOverrideGameVersion != null) {
            stringBuilder
                    .append("\n")
                    .append("isOverrideGameVersion: ")
                    .append(isOverrideGameVersion);
        }
        if (customAttribute != null) {
            stringBuilder
                    .append("\n")
                    .append("customAttribute: ")
                    .append(customAttribute);
        }
        if (matchId != null) {
            stringBuilder
                    .append("\n")
                    .append("matchId: ")
                    .append(matchId);
        }
        if (isOK != null) {
            stringBuilder
                    .append("\n")
                    .append("isOK: ")
                    .append(isOK);
        }
        if (message != null) {
            stringBuilder
                    .append("\n")
                    .append("message: ")
                    .append(message);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("podName","podName");
        result.put("imageVersion","imageVersion");
        result.put("namespace","namespace");
        result.put("ip","ip");
        result.put("alternateIps","alternateIps");
        result.put("port","port");
        result.put("protocol","protocol");
        result.put("ports","ports");
        result.put("provider","provider");
        result.put("gameVersion","gameVersion");
        result.put("status","status");
        result.put("lastUpdate","lastUpdate");
        result.put("sessionId","sessionId");
        result.put("deployment","deployment");
        result.put("region","region");
        result.put("isOverrideGameVersion","isOverrideGameVersion");
        result.put("customAttribute","customAttribute");
        result.put("matchId","matchId");
        result.put("isOK","isOK");
        result.put("message","message");
        return result;
    }
}