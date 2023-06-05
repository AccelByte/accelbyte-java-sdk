/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SaveConfig
 *
 * <p>``` Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE] Required scope:
 * social
 *
 * <p>This endpoint adds/modifies config. When there are ready servers and the server version is
 * updated, those servers will be replaced with newer version.
 *
 * <p>Port is where your game listens for incoming UDP connection, if empty it'll be set to 15000
 *
 * <p>CPU and Memory limit / request are formatted with Kubernetes format, e.g. CPU of 1000m is 1
 * core, and Memory of 512Mi is 512 MB.
 *
 * <p>The creation/claim/session/unreachable/heartbeat timeouts are all in seconds. Creation timeout
 * is time limit for DS to startup until registers itself. Claim timeout is time limit for game
 * session manager to claim its ready DS. Session timeout is time limit for match session before
 * deleted. Unreachable timeout is time limit for DS in UNREACHABLE state before deleted. Heartbeat
 * timeout is time limit for DS to give heartbeat before marked as UNREACHABLE.
 *
 * <p>Sample config: { "namespace": "accelbyte", "providers": [ "aws" ], "port": 7777, "protocol":
 * "udp", "creation_timeout": 120, "claim_timeout": 60, "session_timeout": 1800,
 * "heartbeat_timeout": 30, "unreachable_timeout": 30, "image_version_mapping": { "1.4.0":
 * "accelbyte/sample-ds-go:1.4.0" }, "default_version": "1.4.0", "cpu_limit": "100", "mem_limit":
 * "64", "params": "", "min_count": 0, "max_count": 0, "buffer_count": 0, "configurations": {
 * "1player": { "cpu_limit": "100", "mem_limit": "64", "params": "-gamemode 1p", }, "50players": {
 * "cpu_limit": "200", "mem_limit": "512", "params": "-gamemode 50p", } }, "deployments": {
 * "global-1p": { "game_version": "1.4.0"", "regions": ["us-west", "ap-southeast"], "configuration":
 * "1player", "min_count": 0, "max_count": 0, "buffer_count": 2 }, "us-50p": { "game_version":
 * "1.4.0"", "regions": ["us-west"], "configuration": "50players", "min_count": 0, "max_count": 0,
 * "buffer_count": 5 }, }, } ```
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SaveConfig extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/configs";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ModelsDSMConfigRecord body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SaveConfig(ModelsDSMConfigRecord body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelsDSMConfigRecord getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
