/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

@Setter
@Getter
public class AccelByteConfig {
  private HttpClient<?> httpClient;
  private TokenRepository tokenRepository;
  private ConfigRepository configRepository;

  public AccelByteConfig(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository) {
    this.httpClient = httpClient;
    this.tokenRepository = tokenRepository;
    this.configRepository = configRepository;
  }
}
