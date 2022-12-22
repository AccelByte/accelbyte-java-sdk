/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertJsonToMap;
import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListString;
import static net.accelbyte.sdk.core.util.Helper.listToWSMList;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DsNotif {
  private List<String> alternateIps;
  private String customAttribute;
  private String deployment;
  private String gameVersion;
  private String imageVersion;
  private String ip;
  private Boolean isOK;
  private Boolean isOverrideGameVersion;
  private String lastUpdate;
  private String matchId;
  private String message;
  private String namespace;
  private String podName;
  private Integer port;
  private Map<String, Integer> ports;
  private String protocol;
  private String provider;
  private String region;
  private String sessionId;
  private String status;

  private DsNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DsNotif(
      List<String> alternateIps,
      String customAttribute,
      String deployment,
      String gameVersion,
      String imageVersion,
      String ip,
      Boolean isOK,
      Boolean isOverrideGameVersion,
      String lastUpdate,
      String matchId,
      String message,
      String namespace,
      String podName,
      Integer port,
      Map<String, Integer> ports,
      String protocol,
      String provider,
      String region,
      String sessionId,
      String status) {
    this.alternateIps = alternateIps;
    this.customAttribute = customAttribute;
    this.deployment = deployment;
    this.gameVersion = gameVersion;
    this.imageVersion = imageVersion;
    this.ip = ip;
    this.isOK = isOK;
    this.isOverrideGameVersion = isOverrideGameVersion;
    this.lastUpdate = lastUpdate;
    this.matchId = matchId;
    this.message = message;
    this.namespace = namespace;
    this.podName = podName;
    this.port = port;
    this.ports = ports;
    this.protocol = protocol;
    this.provider = provider;
    this.region = region;
    this.sessionId = sessionId;
    this.status = status;
  }

  public static String getType() {
    return "dsNotif";
  }

  public static DsNotif createFromWSM(String message) {
    DsNotif result = new DsNotif();
    Map<String, String> response = parseWSM(message);
    result.alternateIps =
        response.get("alternateIps") != null
            ? convertWSMListToListString(response.get("alternateIps"))
            : null;
    result.customAttribute =
        response.get("customAttribute") != null ? response.get("customAttribute") : null;
    result.deployment = response.get("deployment") != null ? response.get("deployment") : null;
    result.gameVersion = response.get("gameVersion") != null ? response.get("gameVersion") : null;
    result.imageVersion =
        response.get("imageVersion") != null ? response.get("imageVersion") : null;
    result.ip = response.get("ip") != null ? response.get("ip") : null;
    result.isOK = response.get("isOK") != null ? Boolean.valueOf(response.get("isOK")) : null;
    result.isOverrideGameVersion =
        response.get("isOverrideGameVersion") != null
            ? Boolean.valueOf(response.get("isOverrideGameVersion"))
            : null;
    result.lastUpdate = response.get("lastUpdate") != null ? response.get("lastUpdate") : null;
    result.matchId = response.get("matchId") != null ? response.get("matchId") : null;
    result.message = response.get("message") != null ? response.get("message") : null;
    result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
    result.podName = response.get("podName") != null ? response.get("podName") : null;
    result.port = response.get("port") != null ? Integer.valueOf(response.get("port")) : null;
    result.ports = response.get("ports") != null ? convertJsonToMap(response.get("ports")) : null;
    result.protocol = response.get("protocol") != null ? response.get("protocol") : null;
    result.provider = response.get("provider") != null ? response.get("provider") : null;
    result.region = response.get("region") != null ? response.get("region") : null;
    result.sessionId = response.get("sessionId") != null ? response.get("sessionId") : null;
    result.status = response.get("status") != null ? response.get("status") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(DsNotif.getType());
    if (alternateIps != null) {
      stringBuilder.append("\n").append("alternateIps: ").append(listToWSMList(alternateIps));
    }
    if (customAttribute != null) {
      stringBuilder.append("\n").append("customAttribute: ").append(customAttribute);
    }
    if (deployment != null) {
      stringBuilder.append("\n").append("deployment: ").append(deployment);
    }
    if (gameVersion != null) {
      stringBuilder.append("\n").append("gameVersion: ").append(gameVersion);
    }
    if (imageVersion != null) {
      stringBuilder.append("\n").append("imageVersion: ").append(imageVersion);
    }
    if (ip != null) {
      stringBuilder.append("\n").append("ip: ").append(ip);
    }
    if (isOK != null) {
      stringBuilder.append("\n").append("isOK: ").append(isOK);
    }
    if (isOverrideGameVersion != null) {
      stringBuilder.append("\n").append("isOverrideGameVersion: ").append(isOverrideGameVersion);
    }
    if (lastUpdate != null) {
      stringBuilder.append("\n").append("lastUpdate: ").append(lastUpdate);
    }
    if (matchId != null) {
      stringBuilder.append("\n").append("matchId: ").append(matchId);
    }
    if (message != null) {
      stringBuilder.append("\n").append("message: ").append(message);
    }
    if (namespace != null) {
      stringBuilder.append("\n").append("namespace: ").append(namespace);
    }
    if (podName != null) {
      stringBuilder.append("\n").append("podName: ").append(podName);
    }
    if (port != null) {
      stringBuilder.append("\n").append("port: ").append(port);
    }
    if (ports != null) {
      try {
        String json = new ObjectMapper().writeValueAsString(ports);
        stringBuilder.append("\n").append("ports: ").append(json);
      } catch (JsonProcessingException e) {
        e.printStackTrace();
      }
    }
    if (protocol != null) {
      stringBuilder.append("\n").append("protocol: ").append(protocol);
    }
    if (provider != null) {
      stringBuilder.append("\n").append("provider: ").append(provider);
    }
    if (region != null) {
      stringBuilder.append("\n").append("region: ").append(region);
    }
    if (sessionId != null) {
      stringBuilder.append("\n").append("sessionId: ").append(sessionId);
    }
    if (status != null) {
      stringBuilder.append("\n").append("status: ").append(status);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("alternateIps", "alternateIps");
    result.put("customAttribute", "customAttribute");
    result.put("deployment", "deployment");
    result.put("gameVersion", "gameVersion");
    result.put("imageVersion", "imageVersion");
    result.put("ip", "ip");
    result.put("isOK", "isOK");
    result.put("isOverrideGameVersion", "isOverrideGameVersion");
    result.put("lastUpdate", "lastUpdate");
    result.put("matchId", "matchId");
    result.put("message", "message");
    result.put("namespace", "namespace");
    result.put("podName", "podName");
    result.put("port", "port");
    result.put("ports", "ports");
    result.put("protocol", "protocol");
    result.put("provider", "provider");
    result.put("region", "region");
    result.put("sessionId", "sessionId");
    result.put("status", "status");
    return result;
  }
}
