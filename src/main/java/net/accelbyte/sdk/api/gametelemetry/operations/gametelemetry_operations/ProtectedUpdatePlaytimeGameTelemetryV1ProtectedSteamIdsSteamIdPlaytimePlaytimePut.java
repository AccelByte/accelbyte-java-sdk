/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * protected_update_playtime_game_telemetry_v1_protected_steamIds__steamId__playtime__playtime__put
 *
 * <p>This endpoint requires valid JWT token. This endpoint does not require permission.
 *
 * <p>This endpoint update player's total playtime in a specific game (AppId) from service's cache.
 */
@Getter
@Setter
public class ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
    extends Operation {
  /** generated field's value */
  private String path = "/game-telemetry/v1/protected/steamIds/{steamId}/playtime/{playtime}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String playtime;

  private String steamId;

  /**
   * @param playtime required
   * @param steamId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut(
      String playtime, String steamId) {
    this.playtime = playtime;
    this.steamId = steamId;

    securities.add("Bearer");
    securities.add("Cookie");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.playtime != null) {
      pathParams.put("playtime", this.playtime);
    }
    if (this.steamId != null) {
      pathParams.put("steamId", this.steamId);
    }
    return pathParams;
  }

  @Override
  public Map<String, String> getCookieParams() {
    Map<String, String> cookieParams = new HashMap<>();
    return cookieParams;
  }

  @Override
  public boolean isValid() {
    if (this.playtime == null) {
      return false;
    }
    if (this.steamId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
