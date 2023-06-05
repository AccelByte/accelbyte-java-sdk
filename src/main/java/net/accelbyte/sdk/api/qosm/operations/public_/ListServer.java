/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.operations.public_;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ListServer
 *
 * <p>``` This endpoint lists all QoS services available in all regions.
 *
 * <p>This endpoint is intended to be called by game client to find out all available regions. After
 * getting a list of QoS on each region, game client is expected to ping each one with UDP
 * connection as described below:
 *
 * <p>1. Make UDP connection to each QoS's IP:Port 2. Send string "PING" after connection
 * established 3. Wait for string "PONG" response 4. Note the request-response latency for each QoS
 * in each region
 *
 * <p>The game then can use ping latency information to either: 1. Inform the player on these
 * latencies and let player choose preferred region 2. Send the latency list to Matchmaking Service
 * so that player can be matched with other players in nearby regions ```
 */
@Getter
@Setter
public class ListServer extends Operation {
  /** generated field's value */
  private String path = "/qosm/public/qos";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListServer() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelsListServerResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsListServerResponse().createFromJson(json);
  }
}
