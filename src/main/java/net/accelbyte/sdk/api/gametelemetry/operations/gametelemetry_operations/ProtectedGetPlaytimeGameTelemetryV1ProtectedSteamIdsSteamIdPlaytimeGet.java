/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * protected_get_playtime_game_telemetry_v1_protected_steamIds__steamId__playtime_get
 *
 * <p>This endpoint requires valid JWT token. This endpoint does not require permission.
 *
 * <p>This endpoint retrieves player's total playtime in Steam for a specific game (AppId) and store
 * them in service's cache.
 *
 * <p>Players' Steam account must be set into public to enable the service fetch their total
 * playtime data.
 */
@Getter
@Setter
public class ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
    extends Operation {
  /** generated field's value */
  private String path = "/game-telemetry/v1/protected/steamIds/{steamId}/playtime";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String steamId;

  /**
   * @param steamId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet(String steamId) {
    this.steamId = steamId;

    securities.add("Bearer");
    securities.add("Cookie");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
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
    if (this.steamId == null) {
      return false;
    }
    return true;
  }

  public Map<String, ?> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
  }
}
